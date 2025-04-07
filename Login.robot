*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN URL}  https://www.saucedemo.com/
${BROWSER}    chrome

*** Test Cases ***
Open Sauce Demo Site
    Open Browser To Login Page
    Input Username  standard_user
    Input Password    secret_sauce
    Submit Credentials
    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Page Should Contain    Swag Labs

Input Username
    [Arguments]    ${username}
    Input Text    id=user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}
    Capture Page Screenshot

Submit Credentials
    Click Button    id=login-button