*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Application Create User And Go To Register Page

*** Test Cases ***

Register With Valid Username And Password
    Set Username  keijo
    Set Password  keijo123
    Set Password Confirmation  keijo123
    Click  button >> text=Register
    Registration Should Succeed

Register With Too Short Username And Valid Password
    Set Username  aa
    Set Password  abc123456
    Set Password Confirmation  abc123456
    Click  button >> text=Register
    Registration Should Fail With Message  Username must be at least 3 characters

Register With Valid Username And Too Short Password
    Set Username  maija
    Set Password  abcdefg
    Set Password Confirmation  abcdefg
    Click  button >> text=Register
    Registration Should Fail With Message  Password must be at least 8 characters

Register With Username That Is Already In Use
    Set Username  keijo
    Set Password  keijo123
    Set Password Confirmation  keijo123
    Click  button >> text=Register
    Go To Register Page
    Set Username  keijo
    Set Password  keijo456
    Set Password Confirmation  keijo456
    Click  button >> text=Register
    Registration Should Fail With Message  User with username keijo already exists

*** Keywords ***
Registration Should Succeed
    Welcome Page Should Be Open

Welcome Page Should Be Open
    Get Title  ==  Welcome to Ohtu Application!

Set Username
    [Arguments]  ${username}
    Fill Text  id=username  ${username}

Set Password
    [Arguments]  ${password}
    Fill Secret  id=password  $password

Set Password Confirmation
    [Arguments]  ${password}
    Fill Secret  id=password  $password

Go To Register Page
    Go To  ${REGISTER_URL}

Registration Should Fail With Message
    [Arguments]  ${message}
    Register Page Should Be Open
    Get Text  body  *=  ${message}

Reset Application Create User And Go To Register Page
    Reset Application
    Create User  kalle  kalle123
    Go To Register Page

Register Page Should Be Open
    Get Title  ==  Register
