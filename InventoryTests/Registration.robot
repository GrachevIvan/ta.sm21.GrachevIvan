*** Settings ***
Suite Setup       Go to RegistrationPage
Suite Teardown    Close Browser
Library           Selenium2Library

*** Test Cases ***
Displaying a web form of registration
    Element Should Contain    //*[@id="registerForm"]/table/tbody/tr[1]/td[1]    Username*:
    Page Should Contain Element    //*[@id="registerForm"]/table/tbody/tr[1]/td[2]
    Element Should Contain    //*[@id="registerForm"]/table/tbody/tr[2]/td[1]    Password*:
    Page Should Contain Element    //*[@id="registerForm"]/table/tbody/tr[2]/td[2]
    Element Should Contain    //*[@id="registerForm"]/table/tbody/tr[3]/td[1]    Repeat Password*:
    Page Should Contain Element    //*[@id="registerForm"]/table/tbody/tr[3]/td[2]
    Element Should Contain    //*[@id="registerForm"]/table/tbody/tr[5]/td[1]    Email*:
    Page Should Contain Element    //*[@id="registerForm"]/table/tbody/tr[5]/td[2]
    Capture Page Screenshot

Registration with username which was already registred
    Input Username    User10
    Click Registration
    Page Should Contain    User with such login already exists.
    Capture Page Screenshot

Correctness of entering the value in the field: Username
    Input Username    Usserr22
    Click Registration
    Element Text Should Be    //*[@id="registerForm"]/table/tbody/tr[1]/td[3]    ?
    Capture Page Screenshot

Invalid length for the "Username" text field
    Input Username    Usr
    Click Registration
    Page Should Contain    Login must be alphanumeric string with length => 6 and <= 50.
    Capture Page Screenshot

Mandatory filling in the "Username" textbox field
    Input Username    ${empty}
    Click Registration
    Page Should Contain    Login must not be empty.
    Capture Page Screenshot

Correctness of entering the value in the field: Password
    Input Password    Paaaasss3#
    Input RePassword    Paaaasss3#
    Click Registration
    Element Text Should Be    //*[@id="registerForm"]/table/tbody/tr[2]/td[3]    ?
    Capture Page Screenshot

Invalid length for the "Password" text field
    Input Password    Pa8
    Click Registration
    Page Should Contain    Password length must me >= 8 and <= 50.
    Capture Page Screenshot

Mandatory filling in the "Password" textbox field
    Input Password    ${empty}
    Click Registration
    Page Should Contain    Please enter password.
    Capture Page Screenshot

Correctness of entering the value in the field: Repeat Password
    Input Password    Paaaasss3#
    Input RePassword    Paaaasss3#
    Click Registration
    Element Text Should Be    //*[@id="registerForm"]/table/tbody/tr[2]/td[3]    ?
    Element Text Should Be    //*[@id="registerForm"]/table/tbody/tr[3]/td[3]    ?
    Capture Page Screenshot

Mandatory filling in the "Repeat Password" textbox field
    Input RePassword    ${empty}
    Click Registration
    Page Should Contain    Please enter confirm password
    Capture Page Screenshot

Match with the confirmation password
    Input Password    Paaaasss3#
    Input RePassword    Pasword4+
    Click Registration
    Page Should Contain    Password must match confirm password.
    Capture Page Screenshot

Correctness of entering the value in the field: Email
    Input Email    user4@testmail.com
    Click Registration
    Element Text Should Be    //*[@id="registerForm"]/table/tbody/tr[5]/td[3]    ?
    Capture Page Screenshot

Presence of the '@' symbol
    Input Email    user3testmail.com
    Click Registration
    Page Should Contain    Email address is incorrect.
    Capture Page Screenshot

Mandatory filling in the "Email" textbox field
    Input Email    ${empty}
    Click Registration
    Page Should Contain    email field can't be empty
    Capture Page Screenshot

Existing email
    Input Email    userr2@testmail.com
    Click Registration
    Page Should Contain    The user with such email address has been already registered. Please fill out another email address.
    Capture Page Screenshot

*** Keywords ***
Go to RegistrationPage
    Open Browser    https://inventory.edu-netcracker.com/pages/registration.xhtml    chrome

Input Username
    [Arguments]    ${data}
    Input Text    //*[@id="registerForm:username"]    ${data}

Input Password
    [Arguments]    ${data}
    Input Text    //*[@id="registerForm:password"]    ${data}

Input RePassword
    [Arguments]    ${data}
    Input Text    //*[@id="registerForm:confirmPassword"]    ${data}

Input Email
    [Arguments]    ${data}
    Input Text    //*[@id="registerForm:email"]    ${data}

Click Registration
    Click Button    //*[@id="registerForm"]/table/tbody/tr[7]/td[2]/input
