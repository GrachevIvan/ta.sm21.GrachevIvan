*** Settings ***
Suite Setup       Go to Inventory Page
Suite Teardown    Close Browser
Test Setup        Go to    https://inventory.edu-netcracker.com/pages/inventory/inventory.xhtml?id=2
Library           Selenium2Library

*** Variables ***
${login}          ivan_grachev
${password}       8vx-gpx-eee-eFi
${e1_name}        England
${e1_continent}    Eurasia
${e1_language}    English
${e2_name}        London
${e2_population}    8908081
${e2_IRC}         Yes
${e3_name}        Building №1
${e3_SName}       Savrasova
${e3_Number}      12
${e3_Square}      200
${e3_IC}          Lit
${e4_Number}      1
${e4_Square}      75
${e5_Name}        Rack №1
${e5_Width}       20
${e5_Length}      1
${e5_Height}      2
${e5_PS}          In Service
${e6_Name}        POS Terminal №1
${e6_Width}       1
${e6_Length}      1
${e6_Height}      2
${e6_PS}          Planned
${e7_Name}        Room #1
${e7_Square}      20
${e8_Name}        Pay Box №1
${e8_SP}          3D Secure
${e8_DS}          11
${e8_PS}          Planned
${e9_Name}        ATM №1
${e9_CT}          BoxTR Router
${e9_ES}          Vibration sensor
${e9_PS}          Planned
${e10_Name}       DVC
${e10_MAC}        00-17-ab-be-28-1c
${e10_RAM}        8
${e10_CPU}        Intel 2A 3.3 Ghz
${e10_IP}         5.126.230.58
${e10_PS}         Planned
${e10_Width}      1
${e10_Length}     1
${e10_Height}     1

*** Test Cases ***
Creating a descendant object
    Click Link    //*[@id="table_header"]/table/tbody/tr/td[1]/a
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/country/create.xhtml?parent_id=2
    Capture Page Screenshot

Structured view (does not work)
    Click Link    //*[@id="j_idt76:tabView:j_idt89_data"]/tr[1]/td[1]/a
    Click Link    //*[@id="j_idt76:tabView"]/ul/li[1]/a
    Table Cell Should Contain    //*[@id="table_data"]/table    2    1    Country
    Capture Page Screenshot

"Country" object (1)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/country/main.xhtml?id=10387&tabIndex=0
    Click Edit
    Input Name    ${e1_name}
    Select from list by label    //*[@id="j_idt74:continent"]    ${e1_continent}
    Input Text    //*[@id="j_idt74:language"]    ${e1_language}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/country/main.xhtml?id=10387&tabIndex=0
    Capture Page Screenshot

"City" object (2)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/city/main.xhtml?id=10388&tabIndex=0
    Click Edit
    Input Name    ${e2_name}
    Input Text    //*[@id="j_idt74:population"]    ${e2_population}
    Select from list by label    //*[@id="j_idt74:isRegionalCenter"]    ${e2_IRC}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/city/main.xhtml?id=10388&tabIndex=0
    Capture Page Screenshot

"Building" object (3)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/building/main.xhtml?id=10389&tabIndex=0
    Click Edit
    Input Name    ${e3_name}
    Input Text    //*[@id="j_idt74:streetName"]    ${e3_SName}
    Input Text    //*[@id="j_idt74:number"]    ${e3_Number}
    Input Text    //*[@id="j_idt74:square"]    ${e3_Square}
    Select from list by label    //*[@id="j_idt74:isconnected"]    ${e3_IC}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/building/main.xhtml?id=10389&tabIndex=0
    Capture Page Screenshot

"Floor" object (4)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/floor/main.xhtml?id=10390&tabIndex=0
    Click Edit
    Input Text    //*[@id="j_idt74:number"]    ${e4_Number}
    Input Text    //*[@id="j_idt74:square"]    ${e4_Square}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/floor/main.xhtml?id=10390&tabIndex=0
    Capture Page Screenshot

"Rack" object (5)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/rack/main.xhtml?id=10392&tabIndex=0
    Click Edit
    Input Name    ${e5_Name}
    Input Width    ${e5_Width}
    Input Length    ${e5_Length}
    Input Height    ${e5_Height}
    Input PS    ${e5_PS}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/rack/main.xhtml?id=10392&tabIndex=0
    Capture Page Screenshot

"POS Terminal" object (6)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/posterm/main.xhtml?id=10393&tabIndex=0
    Click Edit
    Input Name    ${e6_Name}
    Input Width    ${e6_Width}
    Input Length    ${e6_Length}
    Input Height    ${e6_Height}
    Input PS    ${e6_PS}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/posterm/main.xhtml?id=10393&tabIndex=0
    Capture Page Screenshot

"Room" object (7)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/room/main.xhtml?id=10391&tabIndex=0
    Click Edit
    Input Name    ${e7_Name}
    Input Text    //*[@id="j_idt74:square"]    ${e7_Square}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/room/main.xhtml?id=10391&tabIndex=0
    Capture Page Screenshot

"Pay Box" object (8)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/paybox/main.xhtml?id=10394&tabIndex=0
    Click Edit
    Input Name    ${e8_Name}
    Input Text    //*[@id="j_idt74:secureProtocol"]    ${e8_SP}
    Input Text    //*[@id="j_idt74:displaySize"]    ${e8_DS}
    Input PS    ${e8_PS}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/paybox/main.xhtml?id=10394&tabIndex=0
    Capture Page Screenshot

"ATM" object (9)
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/atm/main.xhtml?id=10395&tabIndex=0
    Click Edit
    Input Name    ${e9_Name}
    Input Text    //*[@id="j_idt74:connectionType"]    ${e9_CT}
    Input Text    //*[@id="j_idt74:extraSecurity"]    ${e9_ES}
    Input PS    ${e9_PS}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/atm/main.xhtml?id=10395&tabIndex=0
    Capture Page Screenshot

"Device" object
    [Setup]    Go to    https://inventory.edu-netcracker.com/pages/inventory/device/main.xhtml?id=10396&tabIndex=0
    Click Edit
    Input Name    ${e10_Name}
    Input Text    //*[@id="j_idt74:macAddress"]    ${e10_MAC}
    Input Text    //*[@id="j_idt74:ram"]    ${e10_RAM}
    Input Text    //*[@id="j_idt74:cpu"]    ${e10_CPU}
    Input Text    //*[@id="j_idt74:ipAddress"]    ${e10_IP}
    Input PS    ${e10_PS}
    Input Width    ${e10_Width}
    Input Length    ${e10_Length}
    Input Height    ${e10_Height}
    Click Save
    Location Should Be    https://inventory.edu-netcracker.com/pages/inventory/device/main.xhtml?id=10396&tabIndex=0
    Capture Page Screenshot

*** Keywords ***
Go to Inventory Page
    Open Browser    https://inventory.edu-netcracker.com/login.jsp    chrome
    Input Username    ${login}
    Input Password    ${password}
    Click Login
    Go To    https://inventory.edu-netcracker.com/pages/inventory/inventory.xhtml?id=2
    Capture Page Screenshot

Input Username
    [Arguments]    ${data}
    Input Text    //*[@id="content"]/form/table/tbody/tr[1]/td[2]/input    ${data}

Input Password
    [Arguments]    ${data}
    Input Text    //*[@id="content"]/form/table/tbody/tr[2]/td[2]/input    ${data}

Click Login
    Click Button    //*[@id="content"]/form/table/tbody/tr[3]/td[2]/input

Click Edit
    Click Link    //*[@id="table_header"]/table/tbody/tr/td/a

Click Save
    Click Button    //*[@id="table_header"]/table/tbody/tr/td[1]/input

Input Name
    [Arguments]    ${data}
    Input Text    //*[@id="j_idt74:name"]    ${data}

Input Width
    [Arguments]    ${data}
    Input Text    //*[@id="j_idt74:width"]    ${data}

Input Length
    [Arguments]    ${data}
    Input Text    //*[@id="j_idt74:length"]    ${data}

Input Height
    [Arguments]    ${data}
    Input Text    //*[@id="j_idt74:height"]    ${data}

Input PS
    [Arguments]    ${data}
    Select from list by label    //*[@id="j_idt74:physicalStatus"]    ${data}
