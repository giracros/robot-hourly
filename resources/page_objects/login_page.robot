*** Settings ***
Library  SeleniumLibrary
Library  XvfbRobot

Resource  ../commons.robot
Resource  ../element_locators/login_locators.robot
Resource  ../element_locators/common/header_locators.robot
Resource  ../commons.robot

*** Keywords ***
Login To Admin Hourly Website
    [Arguments]    &{USER}
    Go To    %{HOURLY_URL}
    Sleep   5s
    Set Log Level    INFO
    Set Global Variable    &{TEST_USER}    &{USER}
    Wait Until Element Is Visible    ${EMAIL_FIELD}  
    Enter User Login Info    &{USER}
    Set Log Level    INFO

Enter User Login Info
    [Arguments]    &{USER}
    Wait Until Element Is Visible   ${EMAIL_FIELD}
    Wait Until Element Is Visible   ${PASSWORD_FIELD}
    Wait Until Element Is Visible   ${CONTINUE_BUTTON}
    Input Text     ${EMAIL_FIELD}     ${USER.email}
    Input Text     ${PASSWORD_FIELD}  ${USER.password}
    Click Button   ${CONTINUE_BUTTON}
    Wait Until Element Is Visible   ${LOGIN_BUTTON}
    Input Text     ${CODE_FIELD}  ${USER.code}
    Click Button   ${LOGIN_BUTTON}
    Wait Until Element Is Visible   ${LOGO_ICON} 