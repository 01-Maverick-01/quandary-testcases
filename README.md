# quandary-testcases

This repo has testcases that you can use to test your quandary implementation. This is a public repository and even you can contribute to it by submitting your tests cases.

##### Important:
* Raise a pull request and i will add you as a collaborator
* Always add the files under the correct folder. If you think corresponding folder does not exists, then create a new one.
* Add a new entry to `output.csv`, whenever you add a new testcase. Make sure your fileName/input/output does not have ',' as this is a CSV file.
* When adding a new folder/files to repo, make sure that folder name does not have spaces.

##### Running autotest:
* Make sure that your skeleton interpreter is built with the latest changes before kicking of autotest.
* When prompted for paths, make sure that you specify absolute paths
* Run the `AutoTest.java` file to kick of the tests
* Make sure that you update the path to jflex and cup in the `RunTestCase.sh` script file.
* NOTE: I have only tested with linux on devbox, so most probably there are some bugs with the AutoTest. If you find any, please fix it or let me know and i will fix it.
