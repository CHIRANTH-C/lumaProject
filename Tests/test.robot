*** Settings ***
Resource    ../Library/resource.robot
Library    pabot.PabotLib
Test Teardown    Close Browser

*** Variables ***
${lumn}    https://magento.softwaretestingboard.com
${username}
${password}

*** Test Cases ***
Prerequistis
    [Tags]    sanity    csv
    ${username}    ${password}=    Read CSV Data

First Test Run
    [Tags]    sanity    login
    Given I navigate to ${lumn} page
    When As an Admin if I login to the page        ${username}    ${password}
    Then I should land of home page of luman
