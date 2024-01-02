*** Settings ***
Documentation       Test suite for Swag Labs systems
Resource            ../resource/common.resource

*** Test Cases ***
TC1 Login user information with "standard_user" username
    [Documentation]     Verifies that user can login with "standard_user" username and provided password
    Start browser for test
    Input Text into Fields      selector=${USERNAME_INPUT}  input_data=standard_user
    Input Text into Fields      selector=${PASSWORD_INPUT}  input_data=secret_sauce
    Click                       selector=${LOGIN_BUTTON}
    Get Url                     ==       ${expected_url}
    Close Browser

TC2 Login user information with "locked_out_user" username
    [Documentation]     Verifies that user cannot login with "locked_out_user" username and provided password
    Start browser for test
    Input Text into Fields      selector=${USERNAME_INPUT}  input_data=locked_out_user
    Input Text into Fields      selector=${PASSWORD_INPUT}  input_data=secret_sauce
    Click                       selector=${LOGIN_BUTTON}
    Get Text                    //h3[@data-test='error']
    ...                         *=      Epic sadface: Sorry, this user has been locked out.
    [Teardown]                  Close Browser

TC3 Login user information with "error_user" username
    [Documentation]    Verifies that user can login with "error_user" username and provided password

    Start browser for test
    Input Text into Fields      selector=${USERNAME_INPUT}  input_data=error_user
    Input Text into Fields      selector=${PASSWORD_INPUT}  input_data=secret_sauce
    Click                       selector=${LOGIN_BUTTON}
    Get Url                     ==       ${expected_url}

TC4 Login user information with invalid credentials
    [Documentation]     Verifies that user cannot login with invalid credentials
    Start browser for test
    Input Text into Fields      selector=${USERNAME_INPUT}  input_data=girl
    Input Text into Fields      selector=${PASSWORD_INPUT}  input_data=abcde
    Click                       selector=${LOGIN_BUTTON}
    Get Text                    //h3[@data-test='error']
    ...                         *=      Epic sadface: Username and password do not match any user in this service
    [Teardown]                  Close Browser

TC5 Login with random invalid username and valid password
    [Documentation]     Verifies that user cannot login with invalid password
    [Tags]              debug
    Start browser for test
    Input Text into Fields      selector=${USERNAME_INPUT}  input_data=Hala
    Input Text into Fields      selector=${PASSWORD_INPUT}  input_data=secret_sauce
    Click                       selector=${LOGIN_BUTTON}
    Get Text                    //h3[@data-test='error']
    ...                         *=      Epic sadface: Username and password do not match any user in this service
    [Teardown]                  Close Browser

TC6 Login with a valid username and an invalid password
    [Documentation]     Verifies that user cannot login with invalid password
    [Tags]              debug
    Start browser for test
    Input Text into Fields      selector=${USERNAME_INPUT}  input_data=standard_user
    Input Text into Fields      selector=${PASSWORD_INPUT}  input_data=aaa
    Click                       selector=${LOGIN_BUTTON}
    Get Text                    //h3[@data-test='error']
    ...                         *=      Epic sadface: Username and password do not match any user in this service
    [Teardown]                  Close Browser

TC7 Login without providing a password
    [Documentation]     Verifies that user cannot login with invalid password
    [Tags]              debug
    Start browser for test
    Input Text into Fields      selector=${USERNAME_INPUT}  input_data=standard_user
    Input Text into Fields      selector=${PASSWORD_INPUT}  input_data=
    Click                       selector=${LOGIN_BUTTON}
    Get Text                    //h3[@data-test='error']
    ...                         *=      Epic sadface: Password is required
    [Teardown]                  Close Browser




