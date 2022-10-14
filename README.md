# robot-framework-docker

IDE
===========

### If you would like an IDE I recommend the following

    Visual Studio Code with the Robot Framework Language Server plugin
    PyCharm Community Edition with the IntelliBot @SeleniumLibrary Patched plugin

Quick Start
===========

### Make sure you have docker and docker-compose installed on your computer

    This can be done my installing docker desktop since it comes with docker compose
    https://docs.docker.com/docker-for-mac/install/
    https://docs.docker.com/docker-for-windows/install/

### Clone this repository from GitHub

### Build the project

    docker-compose build
    
### How to run the tests

##### Make sure you're at the root level of the repo

    cd robot-hourly

##### Run with the docker-compose command and specify which environment to test in (ex: .test, .stage .prod)

    docker-compose --env-file ./config/.env.test up

#### How to run different tests

Currently there are 3 different ways to run tests:

1) RUN ALL TESTS. In the run_suite.sh file, leave this line uncommented and comment out the other CMD lines.

        CMD="robot --console verbose --outputdir /reports /test_suites/$TEST_SUITE" # Run ALL test cases

2) RUN A SINGLE TEST. In the run_suite.sh file, leave this line uncommented and comment out the other CMD lines.

        CMD="robot --console verbose --outputdir /reports --test NAME_OF_THE_TEST_YOU_WANT_TO_RUN /test_suites/$TEST_SUITE" # Run a single test case

3) RUN A TEST SUITE (FOLDER). In the run_suite.sh file, leave the RUN ALL TESTS line uncommented and comment out the other CMD lines. In the docker-compose.yml file, uncomment the TEST_SUITE line and change the variable to the path to the test suite folder you want to test.

        Example -> TEST_SUITE: "Hourly/RegressionTestSuite/Submission/"

Contents
========

This image contains the following to facilitate robot testing

Xvfb
----

You can use it to start a visual display and fire up a browser for UI testing.
 
Example (suites/virtual_display.robot):

    Start Virtual Display    1920    1080
    

Selenium2Library
----------------

More details here  https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html

Also have a look at **suites/virtual_display.robot**

RobotFramework Standard Libraries
---------------------------------

More details here  https://robotframework.org/robotframework/

Also have a look at **suites/virtual_display.robot**

HttpLibrary.HTTP
----------------

More details here https://github.com/peritus/robotframework-httplibrary

Example:

    Create Http Context     api.some-end-point.com
    GET                     /some/service/that/supports/get
    Verify Status           200
    ${response}=            Get Response Body
    [return]                ${response}


DEBUGGING
===========

### Here are a list of suggestions to help you with possible errors

#### If you get issues building your docker image try the following commands

    docker volume prune -f
    docker container prune -f
    docker image prune -f

#### WebDriverException: Message: no such session

If you get this message

    [ WARN ] Keyword 'Capture Page Screenshot' could not be run on failure: WebDriverException: Message: no such session
    (Driver info: chromedriver=2.41.578700 (2f1ed5f9343c13f73144538f15c00b370eda6706),platform=Linux 4.19.121-linuxkit x86_64)

Try running this command to clean up your docker cache

    docker system prune --volumes -f

#### "FileNotFoundError: [Errno 2] No such file or directory" error

If you get this message

    Traceback (most recent call last):
    File "docker-compose", line 3, in <module>
    File "compose/cli/main.py", line 81, in main
    File "compose/cli/main.py", line 200, in perform_command
    File "compose/cli/command.py", line 70, in project_from_options
    File "compose/cli/command.py", line 146, in get_project
    File "compose/cli/command.py", line 206, in get_project_name
    File "posixpath.py", line 383, in abspath
    FileNotFoundError: [Errno 2] No such file or directory
    [4413] Failed to execute script docker-compose

Try Restaring visual studio code and close all instances of terminal

#### Starting hourly-qa-ui_test_1 ... error

If you get this message

    Starting hourly-qa-ui_test_1 ... error

    ERROR: for hourly-qa-ui_test_1  Cannot start service test: error while creating mount source path '/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/d596be0997e165f933db5e06df938a3fcf71216944e094a149739207d721023e': mkdir /run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/d596be0997e165f933db5e06df938a3fcf71216944e094a149739207d721023e: file exists

    ERROR: for test  Cannot start service test: error while creating mount source path '/run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/d596be0997e165f933db5e06df938a3fcf71216944e094a149739207d721023e': mkdir /run/desktop/mnt/host/wsl/docker-desktop-bind-mounts/Ubuntu-20.04/d596be0997e165f933db5e06df938a3fcf71216944e094a149739207d721023e: file exists
    ERROR: Encountered errors while bringing up the project.


Try running this command to clean up your docker cache

    docker system prune --volumes -f

    Then restart visual studio code and close out terminals
