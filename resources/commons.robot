*** Settings ***
Library  SeleniumLibrary
Library  XvfbRobot


Resource  page_objects/common/side_nav_page.robot

*** Variables *** 
&{TEST_USER}    &{ADMIN}
&{ADMIN}     email=%{ADMIN_EMAIL}     password=%{ADMIN_PW}      code=%{ADMIN_CODE}     role=admin

*** Keywords ***
Set Up Test Suite
    Set Library Search Order  SeleniumLibrary
    Start Virtual Browser
    Set Selenium Timeout    %{DELAY_TIMEOUT}

Start Virtual Browser
    XvfbRobot.Start Virtual Display       %{DISPLAY_WIDTH}    %{DISPLAY_HEIGHT}
    Open Chrome Browser
    Set Window Size    %{DISPLAY_WIDTH}    %{DISPLAY_HEIGHT}

Open Chrome Browser
    ${options}   Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method  ${options}  add_argument  --no-sandbox
    Call Method  ${options}  add_argument  enable-automation
    Call Method  ${options}  add_argument  --headless
    Call Method  ${options}  add_argument  --disable-gpu
    Call Method  ${options}  add_argument  --disable-dev-shm-usage
    Call Method  ${options}  add_argument  --incognito
    ${prefs}     Create Dictionary    download.default_directory=/tmp
    Call Method  ${options}  add_experimental_option    prefs    ${prefs}
    Create Webdriver    Chrome    chrome_options=${options}

Tear Down Test Suite 
    Close Browser

Wait Until Element Loads Then Click It
    [arguments]  ${ELEMENT}
    Wait Until Element Is Visible  ${ELEMENT}       60s
    Wait Until Element Is Enabled   ${ELEMENT}      60s
    Click Element  ${ELEMENT}

Click Until Element is Visible
    [Arguments]  ${ELEMENT_TO_CLICK}     ${ELEMENT_VISIBLE}
    Click Element   ${ELEMENT_TO_CLICK}
    ${present} =  Run Keyword And Return Status    Wait Until Element Is Visible    ${ELEMENT_VISIBLE}
    WHILE  not ${present}    limit=5
        Click Element    ${ELEMENT_TO_CLICK}
        ${present} =  Run Keyword And Return Status    Wait Until Element Is Visible    ${ELEMENT_VISIBLE}
    END

