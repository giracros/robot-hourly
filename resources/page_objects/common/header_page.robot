*** Settings ***
Resource  ../../commons.robot
Resource  ../../element_locators/common/header_locators.robot
Resource  ../../element_locators/login_locators.robot
Resource  side_nav_page.robot


*** Keywords ***
Log Out
    [Arguments]  ${SIGN_OUT}
    Sleep   5s
    commons.Wait Until Element Loads Then Click It    ${PROFILE_ICON}
    Sleep  3s
    commons.Wait Until Element Loads Then Click It    ${SIGN_OUT}
    Sleep  3s
    Wait Until Element Is Visible       ${PAGE_LOGO}      10s