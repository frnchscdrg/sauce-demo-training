*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN_URL}  https://www.saucedemo.com/
${BROWSER}    chrome
@{USERNAME}    standard_user    locked_out_user    problem_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Open Sauce Demo Site
    Open Browser To Login Page
    Input Username    ${USERNAME[0]}
    Input Password
    Submit Credentials
    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Page Should Contain    Swag Labs

Input Username
    [Arguments]    ${username}
    Input Text    id=user-name    ${USERNAME}
    Capture Page Screenshot

Input Password
    Input Text    id=password    ${PASSWORD}
    Capture Page Screenshot

Submit Credentials
    Click Button    id=login-button
    Page Should Contain    Products
    Capture Page Screenshot