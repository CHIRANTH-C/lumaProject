*** Settings ***
Resource    ../Library/resource.robot
Library    pabot.PabotLib
Test Teardown    Close Browser

*** Variables ***
${lumn}    https://magento.softwaretestingboard.com

*** Test Cases ***
Prerequistis
    [Tags]    sanity    csv
    ${username}    ${password}=    Read CSV Data

First Test Run
    [Tags]    sanity    login
    Given I navigate to ${lumn} page
    When As an User if I login to the page
    Then I should land on "home page of luman"

Second Test Run
    [Tags]    navigate
    Given I navigate to ${lumn} page
    And As an User if I login to the page
    When Navigate to "Women"
    Then I should land on "Women page of luman"

Third Test Run
    [Tags]    cart
    Given I navigate to ${lumn} page
    And As an User if I login to the page
    When Navigate to "Women"
    And Navigate to "Top"
    And Navigate to "Jackets"
    When Cliked on "Jackets"
    Then I should land on "Jackets"
    And As an User I want to Buy "Juno Jacket"
    When User Choses product size to be "XL"
    Then "XL" size of product has to be selected
    When User Choses product color to be "Blue"
    Then "Blue" color of product has to be selected
    When User Add the "Juno Jacket" to cart
    Then The "Juno Jacket" is shown in the cart