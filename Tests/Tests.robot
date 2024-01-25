*** Settings ***
Documentation  Search Field Testing
Library  SeleniumLibrary


#Task Teardown    End Testing
*** Variables ***     

*** Test Cases ***
Visit the Ebay website and find the product 
    [Documentation]  The search field should find the product by it's name
        Start Testing  https://www.ebay.pl
        Search for Products with Assertion    proca    Wyniki dla
        Add Cookie 

        
*** Keywords ***
Start Testing
    [Arguments]  ${url}
    Open Browser  ${url}  firefox
End Testing
    Close Browser
Search for Products with Assertion
    [Arguments]  ${product}  ${searchResults}
    Input Text    xpath://*[@placeholder="Wyszukaj coś"]    ${product}
    Click Button    id:gh-btn
    Page Should Contain  ${searchResults} ${product}  
    
    