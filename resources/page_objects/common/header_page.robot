*** Settings ***
Resource  ../../commons.robot
Resource  ../../element_locators/common/header_locators.robot
Resource  ../../element_locators/login_locators.robot
Resource  side_nav_page.robot


*** Keywords ***
Log Out
    Sleep  5s
    commons.Wait Until Element Loads Then Click It    ${PROFILE_ICON}
    Sleep  3s
    commons.Wait Until Element Loads Then Click It    ${ SIGN_OUT_BUTTON}
    Wait Until Element Is Visible       ${PAGE_LOGO}