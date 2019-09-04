import java.io.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;

public class AutoTest{
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
        try {
            String commandString = "/bin/sh $script $root $prog $arg".replace("$script", scriptFile).replace("$root", rootPath);
            for(String file : GetTestFiles(testcaseFolder)) {
                String testName = file.replace(testcaseFolder, "");
                System.out.println("Running test: " + testName);

                Process process = Runtime.getRuntime().exec(commandString.replace("$prog", file).replace("$arg", "5"));
                
                StringBuilder output = new StringBuilder();
                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                while ((line = reader.readLine()) != null) {
                    output.append(line + "\n");
                }

                process.waitFor();
                StringBuilder expected = new StringBuilder(), returned = new StringBuilder();
                if (AnalyzeOutput(output, expected, returned) == false) {
                    String msg = "Testcase: $testcase\n   ReferenceReturned: $ref\n   SkeletonReturned: $ske";
                    msg = msg.replace("$testcase", testName).replace("$ref", expected).replace("$ske", returned);
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

    private static boolean AnalyzeOutput(StringBuilder output, StringBuilder expected, StringBuilder returned) {
        String[] strings = output.toString().split("\n");
        if (strings.length > 1) expected.append(strings[1]);
        if (strings.length > 3) returned.append(strings[3]);
        return expected.toString().equalsIgnoreCase(returned.toString());
    }
}