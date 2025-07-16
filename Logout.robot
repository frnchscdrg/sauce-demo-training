*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${login_url}  https://www.saucedemo.com/
${browser}    chrome
${username}    standard_user
${password}    secret_sauce


*** Test Cases ***
Logout
    Open Browser To Login Page
    Input Credentials    ${username}    ${password}
    Submit
    Click Logout
    Assert Logged Out
    Close Browser
    
*** Keywords ***
Open Browser to Login Page
    Open Browser   ${login_url}   ${browser}
    Page Should Contain    Swag Labs

Input Credentials
    [Arguments]    ${username}  ${password}    
    Input Text    id=user-name    ${username}
    Input Text    id=password     ${password}

Submit
    Click Button    id=login-button
    Sleep    5s
    Page Should Contain    Products
    Capture Page Screenshot

Click Logout
    Click Element   id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Element    id=logout_sidebar_link
    Capture Page Screenshot

Assert Logged Out
    Wait Until Element Is Visible    id=login-button
    Page Should Contain Element    id=login-button