*** Settings ***
Library  SeleniumLibrary
Library  XvfbRobot

Resource  ../commons.robot
Resource  ../element_locators/login_locators.robot
Resource  ../element_locators/common/header_locators.robot

*** Keywords ***
Login To Hourly Website
    [Arguments]    &{USER}
    Go To    %{ADMIN_HOURLY_URL}
    Sleep   5s
    Wait Until Element Is Visible    ${EMAIL_FIELD}  
    Enter User Login Info    &{USER}

Enter User Login Info
    [Arguments]    &{USER}
    Input Text     ${EMAIL_FIELD}     ${USER.email}
    Input Text     ${PASSWORD_FIELD}  ${USER.password}
    Click Element   ${LOGIN_BUTTON}
    Sleep   3s        
    Input Text     ${CODE_FIELD}     ${USER.code}
    Click Element   ${LOGIN_BUTTON}
    Sleep   3s
    