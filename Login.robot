*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${login_url}  https://www.saucedemo.com/
${browser}    chrome
${username}    standard_user
${valid password}    secret_sauce
${invalid password}  abc123_

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    ${username}
    Input Password    ${valid password}
    Submit Credentials
    Assert Successful Login
    Close Browser
    
Invalid Login
    Open Browser To Login Page
    Input Username    ${username}
    Input Password    ${invalid password}
    Submit Credentials
    Assert Failed Login
    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${login_url}    ${browser}
    Page Should Contain    Swag Labs

Input Username
    [Arguments]    ${username}
    Input Text    id=user-name    ${username}
    Capture Page Screenshot

Input Password
    [Arguments]    ${valid password}
    Input Text    id=password    ${valid password}
    Capture Page Screenshot

Submit Credentials
    Click Button    id=login-button
    Capture Page Screenshot

Assert Successful Login
    Page Should Contain    Products

Assert Failed Login
    Page Should Contain Element    css=.error-message-container.error