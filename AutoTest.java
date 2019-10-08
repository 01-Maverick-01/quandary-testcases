import java.io.*;
import java.util.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class AutoTest{
    public static final String[] ignoreList = new String[] {
        "/quandary-examples/counter.q",
        "/quandary-examples/lists.q",
        "/quandary-examples/sort.q"
    };

    public static void main(String args[]){
        Scanner sc = new Scanner(System.in);
        System.out.println("Make sure that skeleton interpretor is built before running autotest");
        System.out.println("Enter root path. Ex: '/home/maverick/6341-Public'");
        String rootPath = "/home/maverick/6341-Public"; //sc.nextLine();
        System.out.println("Enter path to testcases. Ex: '/home/maverick/quandary-testcases'");
        String testcaseFolder = "/home/maverick/6341-Public/quandary-testcases"; //sc.nextLine();
        sc.close();
        String scriptFile = testcaseFolder + "/" + "RunTestCase.sh";
        List<String> failedTestCases = new ArrayList<String>();
        List<String> skippedTestCases = new ArrayList<String>();
        try {
            String commandString = "/bin/sh $script $root $prog $arg".replace("$script", scriptFile).replace("$root", rootPath);
            for(String file : GetTestFiles(testcaseFolder)) {
                String testName = file.replace(testcaseFolder, "");
                if (Arrays.asList(ignoreList).contains(testName)) {
                    System.out.println("Skipping test: " + testName);
                    skippedTestCases.add(testName);
                    continue; 
                }

                System.out.println("Running test: " + testName);

                Process process = Runtime.getRuntime().exec(commandString.replace("$prog", file).replace("$arg", "5"));
                
                StringBuilder output = new StringBuilder();
                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                while ((line = reader.readLine()) != null) {
                    output.append(line + "\n");
                }

                process.waitFor();
                StringBuilder expectedInterpreter = new StringBuilder(), returnedInterpreter = new StringBuilder();
                StringBuilder expectedProcess = new StringBuilder(), returnedProcess = new StringBuilder();
                if (AnalyzeOutput(output, expectedInterpreter, returnedInterpreter, expectedProcess, returnedProcess) == false) {
                    String msg = "->Testcase: $testcase\n   ReferenceInterpreterReturned: $refInt\n   SkeletonInterpreterReturned: $skeInt\n   ReferenceProcessReturned: $refP\n   SkeletonProcessReturned: $skeP\n";
                    msg = msg.replace("$testcase", testName).replace("$refInt", expectedInterpreter).replace("$skeInt", returnedInterpreter).replace("$refP", expectedProcess).replace("$skeP", returnedProcess);
                    failedTestCases.add(msg);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        System.out.println("\n\n--------------RunCompleted: Generating Report--------------");
        if (failedTestCases.size() > 0) {
            System.out.println("Number of testcases that failed: " + failedTestCases.size());
            failedTestCases.forEach(System.out::println);
        } else {
            System.out.println("All testcases passed");
        }

        if (skippedTestCases.size() > 0) {
            System.out.println("\nNumber of testcases that were skipped: " + skippedTestCases.size());
            skippedTestCases.forEach(System.out::println);
        }
        System.out.println("------------------------------------------------------------");
    }

    private static List<String> GetTestFiles(String testcaseFolderPath) {
        List<String> files = new ArrayList<String>();
        Path path = Paths.get(testcaseFolderPath);
        try {
            Files.walk(path).filter(entry -> entry.toString().endsWith(".q"))
                .forEach(entry -> files.add(entry.toAbsolutePath().toString()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return files;
    }

    private static boolean AnalyzeOutput(StringBuilder output, StringBuilder expectedInterpreter, StringBuilder returnedInterpreter,
        StringBuilder expectedProcess, StringBuilder returnedProcess) {
        String[] strings = output.toString().split("\n");
        System.out.println(output);
        for (int index = 0; index < strings.length; index++)
        {
            try {
                if (strings[index].equalsIgnoreCase("<Running Ref interpretor>")) {
                    expectedInterpreter.append(strings[++index]);
                    expectedProcess.append(strings[++index]);
                }
    
                if (strings[index].equalsIgnoreCase("<Running skeleton interpretor>")) {
                    returnedInterpreter.append(strings[++index]);
                    returnedProcess.append(strings[++index]);
                }
            } catch (Exception e) {
                return false;
            }
        }
        return expectedInterpreter.toString().equalsIgnoreCase(returnedInterpreter.toString()) 
            && expectedProcess.toString().equalsIgnoreCase(returnedProcess.toString());
    }
}