*** Settings ***
Library  SeleniumLibrary
Library  XvfbRobot

Suite Setup     commons.Set Up Test Suite
Suite Teardown  commons.Tear Down Test Suite

Metadata  Environment  %{ENV}

Resource  ../../../../resources/commons.robot
Resource  ../../../../resources/page_objects/common/header_page.robot
Resource  ../../../../resources/page_objects/common/side_nav_page.robot
Resource  ../../../../resources/page_objects/login_page.robot
Resource  ../../../../resources/page_objects/submission/submission_page.robot


Documentation  Create a new Submission like a Example of this POC

*** Test Cases ***

Create_New_Submission
    [Tags]           Functional
    [Template]       Create new Submission
    &{ADMIN}

*** Keywords ***

Create new Submission
    [Arguments]    &{USER}
    login_page.Login To Hourly Website    &{USER}
    side_nav_page.Click On Submissions
    submission_page.Create New Submission
    [Teardown]    header_page.Log Out