*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Open Sauce Demo Site
    Open Browser  https://www.saucedemo.com/  chrome
    Page Should Contain    Swag Labs
    Capture Page Screenshot
    Close Browser