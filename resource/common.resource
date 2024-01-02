*** Settings ***
Documentation       Keywords and Variable resouce for Swag Labs test suite
Library             Browser



*** Variables ***
${URL}                   https://www.saucedemo.com/
${username_input}       //input[@id="user-name"]
${password_input}       //input[@id="password"]
${login_button}         //input[@id="login-button"]
${expected_url}          https://www.saucedemo.com/inventory.html


*** Keywords ***

Start browser for test
    [Arguments]
    New Browser          browser=chromium   headless=true
    New Page              url=${URL}
Input Text into Fields
    [Arguments]     ${selector}     ${input_data}
     Fill Text    selector=${selector}
    ...           txt=${input_data}