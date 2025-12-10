*** Settings ***
Resource       ../resources/keywordBase.robot
Resource       ../resources/keywordLoginRegister.robot
Variables   ../ENV.py

*** Test Cases ***
User Success Login With Valid Email And Password
    [Tags]  test-web1
    Open Web Browser    ${URL_WEB}
    Verify Home Page Dashboard
    Go To Login Page
    Login Account With Valid Email And Password

User Success Register From Home Page
    [Tags]  test-web2
    Open Web Browser    ${URL_WEB}
    Verify Home Page Dashboard
    Go To Register Page
    Register New User Using Email
