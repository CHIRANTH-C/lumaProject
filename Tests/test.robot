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
    When As an Admin if I login to the page
    Then I should land on "home page of luman"

Second Test Run
    [Tags]    navigate
    Given I navigate to ${lumn} page
    When As an Admin if I login to the page
    And Navigate to "Women"
    Then I should land on "Women page of luman"