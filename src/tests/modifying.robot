*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Go To Add Reference Page

*** Test Cases ***

Set Correct Information For Inproceedings Reference
    Select Dropdown By Value  book
    Check Form Is Loaded
    Set Reference Id  foh225
    Set Author  Robert Jordan
    Set Title  Fires of Heaven
    Set Year  2002
    Set Publisher  Tor Books
    Submit Information
    Adding Reference Should Succeed

*** Keywords ***
Check Form Is Loaded
    Wait Until Keyword Succeeds    30s    2s    Page Should Contain Element    publisher

Placeholder Should Contain
    [Arguments]    ${expected_text}
    ${value}=    SeleniumLibrary.Get Element Attribute    xpath=//input[@name='title']    value
    Should Contain    ${value}    ${expected_text}
    Log    Input field value contains the expected text: ${expected_text}
