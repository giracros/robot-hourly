*** Settings ***
Resource    ../../../../resources/element_locators/submission/submission_locators.robot


*** Keywords ***
Create new Submission
    Wait Until Element Is Visible       ${TITTLE_SUBMISSION} 
    Click Element                       ${CREATE_SUBMISSION}
    Wait Until Element Is Visible       ${MODAL_SUBMISSION} 
    Click Element                       ${POLICY_START_DATE_POP}
    Click Element                       ${POLICY_START_DATE_SELECT}
    Input Text                          ${NAME_OF_BUSINESS_TEXT}        RobotoPOC1
    Input Text                          ${FEIN_TEXT}                    283828281
    Click Element                       ${SAVE_SUBMISSION}
    Wait Until Element Is Visible       ${TEMP_VALIDATION}

    