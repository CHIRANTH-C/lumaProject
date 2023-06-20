*** Settings ***
Library    SeleniumLibrary
Library    demo_keyword.py
Library    ../.robot/lib/python3.11/site-packages/robot/libraries/Telnet.py
Library    ../.robot/lib/python3.11/site-packages/robot/libraries/String.py
Variables    ../Constants/Xpaths/lumna_pages.py

*** Variables ***
${WEBSITE_URL}    https://magento.softwaretestingboard.com
${BROWSER}    Chrome
${EXEC_PATH}    /Users/chiranth.c/Documents/lumaProject/Constants/Driver/chromedriver.exe
${csv_file_path}    Data/users.csv
${validation_link}    check

*** Keywords ***
Open Browser To "${URL}"
    Open Browser     ${URL}    ${BROWSER}    executable_path=${EXEC_PATH}
    Maximize Browser Window
    Set Selenium Speed    1

I navigate to ${lumn} page
    Open Browser To "${lumn}"
    Page Should Contain Element    ${lnk_signIn}


Read CSV Data
    ${csv_data}=    Read Csv    Data/users.csv
    Log To Console    CSV Data ${csv_data}
    ${username}=    Set Variable    ${csv_data}[0][userName]
    ${password}=    Set Variable    ${csv_data}[0][userPassword]
    Log To Console    Username: ${username}
    Log To Console    Password: ${password}
    [Return]    ${username}    ${password}

As an Admin if I login to the page
    Click Link    ${lnk_signIn}
    Input Text    ${txt_box_usrname}    chiranthchandrashekar123@gmail.com
    Input Text    ${txt_box_password}    Top!00C123
    Wait Until Element Is Visible    ${btn_login}    timeout=10s
    Click Button    ${btn_login}


I should land on ${page}
    Log To Console    ${page}
    IF    ${page} == "home page of luman"
        ${validation_link}=    Set Variable    ${home_page_of_luman}
        Log To Console    ${validation_link}
    ELSE IF    ${page} == "Women page of luman"
        Log To Console    ${page}
        ${validation_link}=    Set Variable    ${women_page_of_luman}
        Log To Console    ${validation_link}
    END
    Wait Until Element Is Visible    ${validation_link}
    Page Should Contain Element    ${validation_link}
    Log To Console    afterEnd: ${validation_link}


Navigate to ${menu_option}
    ${main_menu_xpath}=    Replace String    ${menu_xpath}    <menu_option>    ${menu_option}
    Wait Until Element Is Visible    ${main_menu_xpath}
    Click Element    ${main_menu_xpath}
    Wait Until Element Is Visible    ${women_page_of_luman}