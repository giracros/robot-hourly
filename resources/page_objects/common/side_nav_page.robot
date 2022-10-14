*** Settings ***
Library  SeleniumLibrary
Library  String

Resource  ../../commons.robot
Resource  ../../element_locators/common/side_nav_locators.robot
Resource  ../../../../../resources/element_locators/submission/submission_locators.robot


*** Keywords ***
Click On Submissions
    Wait Until Element Is Visible   ${SIDE_NAV}
    commons.Wait Until Element Loads Then Click It    ${SUBMISSION_OPTION}
    Element Should Be Visible    ${TITTLE_SUBMISSION}
