*** Settings ***
Suite Setup       Go to Start Page
Suite Teardown    Close Browser
Test Setup        Go to    https://inventory.edu-netcracker.com/pages/startpage.xhtml
Library           Selenium2Library

*** Variables ***
${search_name2}    Nizhniy Novgorod
${search_name3}    dora
${search_result3}    Andora
${search_name4}    Ki
${search_result4}    Kiev

*** Test Cases ***
Checking the "Navigation" drop-down list: "Inventory"
    Mouse Over    //*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/a
    Click Link    //*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[1]/a
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/inventory.xhtml?id=2
    Capture Page Screenshot

Checking the "Navigation" drop-down list: "Tools"
    Mouse Over    //*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/a
    Click Link    //*[@id="navigation_toolbar"]/table/tbody/tr/td[1]/ul/li/ul/li[3]/a
    Location Should Be    https://inventory.edu-netcracker.com/tools/tools.xhtml
    Capture Page Screenshot

Link image: "Inventory"
    Click Link    //*[@id="inventory"]/a
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/inventory.xhtml?id=2
    Capture Page Screenshot

Link image: "Infrastructure orders"
    Click Link    //*[@id="infrastructure"]/a
    Location Should Be    https://inventory.edu-netcracker.com/pages/infrastructure/infrastructure.xhtml
    Capture Page Screenshot

Access to the country search page
    Mouse Over    //*[@id="search-text-input"]
    Click Link    //*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[1]/a
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/country/search.xhtml
    Capture Page Screenshot

Access to the city search page
    Mouse Over    //*[@id="search-text-input"]
    Click Link    //*[@id="navigation_toolbar"]/table/tbody/tr/td[2]/ul/li/ul/li[2]/a
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/city/search.xhtml
    Capture Page Screenshot

The work of the search on the home page
    Input Text    //*[@id="search-text-input"]    Russia
    Press Key    //*[@id="search-text-input"]    \\13
    Location Should Be    https://inventory.edu-netcracker.com/components/search/default.xhtml
    Element Should Contain    //*[@id="j_idt80"]/div/table    Russia
    Capture Page Screenshot

Find City: equal
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/city/search.xhtml
    Input Name    ${search_name2}
    Select Name Parameter    equal
    Click Search
    Search results    ${search_name2}
    Capture Page Screenshot

Find City: start with (with parameters)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/city/search.xhtml
    Input Name    ${search_name4}
    Select Name Parameter    start with
    Input Text    //*[@id="j_idt66:population"]    20000000
    Select from list by label    //*[@id="j_idt66"]/table/tbody/tr[3]/td[1]/select    Yes
    Click Search
    Search results    ${search_result4}
    Capture Page Screenshot

Find Country: end with
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/country/search.xhtml
    Input Name    ${search_name3}
    Select Name Parameter    end with
    Click Search
    Element Should Contain    //*[@id="j_idt97"]/div/table    ${search_result3}
    Capture Page Screenshot

*** Keywords ***
Go to Start Page
    Open Browser    https://inventory.edu-netcracker.com/login.jsp    chrome
    Input Username    ivan_grachev
    Input Password    8vx-gpx-eee-eFi
    Click Login

Input Name
    [Arguments]    ${data}
    Input Text    //*[@id="j_idt66:name"]    ${data}

Input Username
    [Arguments]    ${data}
    Input Text    //*[@id="content"]/form/table/tbody/tr[1]/td[2]/input    ${data}

Select Name Parameter
    [Arguments]    ${data}
    Select from list by label    //*[@id="j_idt66"]/table/tbody/tr[1]/td[2]/select    ${data}

Click Search
    Click Button    //*[@id="j_idt66"]/table/tbody/tr[4]/td[2]/input

Search results
    [Arguments]    ${data}
    Element Should Contain    //*[@id="j_idt92"]/div/table    ${data}

Input Password
    [Arguments]    ${data}
    Input Text    //*[@id="content"]/form/table/tbody/tr[2]/td[2]/input    ${data}

Click Login
    Click Button    //*[@id="content"]/form/table/tbody/tr[3]/td[2]/input
