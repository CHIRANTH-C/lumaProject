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

As an User if I login to the page
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
    ELSE
        Log To Console    ${page}
        ${validation_link}=    Replace String    ${selection_page}    <selection>    ${page}
        Log To Console    ${validation_link}
    END
    Wait Until Element Is Visible    ${validation_link}
    Page Should Contain Element    ${validation_link}
    Log To Console    afterEnd: ${validation_link}


Navigate to ${menu_option}
    ${main_menu_xpath}=    Replace String    ${menu_xpath}    <menu_option>    ${menu_option}
    Wait Until Element Is Visible    ${main_menu_xpath}
    Mouse Over    ${main_menu_xpath}

Cliked on ${menu_option}
    ${main_menu_xpath}=    Replace String    ${menu_xpath}    <menu_option>    ${menu_option}
    Wait Until Element Is Visible    ${main_menu_xpath}
    Click Element    ${main_menu_xpath}
    ${validation_link}=    Replace String    ${selection_page}    <selection>    ${menu_option}
    Wait Until Element Is Visible    ${validation_link}


As an User I want to Buy ${item}
    ${chose_item_list}=    Replace String    ${item_list}    <item>    ${item}
    Click Link    ${chose_item_list}
    ${chose_item_heading}=    Replace String    ${item_headder}    <item>    ${item}
    Wait Until Element Is Visible    ${chose_item_heading}

User Choses product size to be ${size}
    ${chose_item_size}=    Replace String    ${item_size}    <item>    ${size}
    Click Element    ${chose_item_size}


${size} size of product has to be selected
    ${chose_item_size_selected}=    Replace String    ${item_size_selected}    <item>    ${size}
    Wait Until Element Is Visible    ${chose_item_size_selected}

User Choses product color to be ${color}
    ${chose_item_color}=    Replace String    ${item_color}    <item>    ${color}
    Click Element    ${chose_item_color}
 
${color} color of product has to be selected
   ${chose_item_color_selected}=    Replace String    ${item_color_selected}    <item>    ${color}
    Wait Until Element Is Visible    ${chose_item_color_selected}
  
User Add the ${item} to cart
    Click Button    ${add_to_cart}
    Wait Until Element Is Visible    ${success_msg}
  
The ${item} is shown in the cart
    ${item_without_quotes}    Evaluate    ${item}.strip('"')
    Log To Console    item_without_quotes: ${item_without_quotes}
    ${msg}=    Get Text    ${success_msg}
    Should Contain    ${msg}    ${item_without_quotes}