*** Settings ***
Suite Setup       Go to Authorization Page
Suite Teardown    Close Browser
Library           Selenium2Library

*** Test Cases ***
Successful login to the account
    Input Username    Userr2
    Input Password    Password2+
    Click Login
    Page Should Contain    Log out
    Capture Page Screenshot
    Click Link    //*[@id="navigation_toolbar"]/table/tbody/tr/td[4]/a

Invalid username or password
    Input Username    Userr2
    Input Password    Paaaasss3#
    Click Login
    Element Should Contain    //*[@id="content"]/div    Your login attempt was not successful, try again.
    Capture Page Screenshot    IUP.png

*** Keywords ***
Go to Authorization Page
    Open Browser    https://inventory.edu-netcracker.com/login.jsp    chrome

Input Username
    [Arguments]    ${data}
    Input Text    //*[@id="content"]/form/table/tbody/tr[1]/td[2]/input    ${data}

Input Password
    [Arguments]    ${data}
    Input Text    //*[@id="content"]/form/table/tbody/tr[2]/td[2]/input    ${data}

Click Login
    Click Button    //*[@id="content"]/form/table/tbody/tr[3]/td[2]/input
