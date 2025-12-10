*** Settings ***
Library   SeleniumLibrary
Library    String
Variables   ../ENV.py
Variables   ../pages/homePage.py
Variables   ../data/config.py

*** Keywords ***
Go To Login Page
    Click Element   ${signInBtn}
    Sleep   2
    Wait Until Element Is Visible   ${signInTitleHeaderLabel}

Go To Register Page
    Click Element   ${regisBtn}
    Sleep   2
    Wait Until Element Is Visible   ${titleHeaderRegisterPage}

Login Account With Valid Email And Password
    Verify Login Page
    Input Email     ${emailLogin}
    Input Password  ${passwordLogin}
    Click Element   ${checkboxRememberMeLogin}
    Sleep   2
    Capture Page Screenshot
    Click Element   ${buttonSubmitLogin}
    Sleep   2
    Capture Page Screenshot

Verify Login Page
    Wait Until Element Is Visible   ${emailFieldFormLogin}
    Wait Until Element Is Visible   ${passwordFieldFormLogin}
    Wait Until Element Is Visible   ${checkboxRememberMeLogin}
    Wait Until Element Is Visible   ${forgetPasswordLogin}
    Wait Until Element Is Visible   ${buttonSubmitLogin}
    Wait Until Element Is Visible   ${loginWithGoogleAccountLabel}
    Wait Until Element Is Visible   ${regisButtonInLoginPage}
    Wait Until Element is Visible   ${iconCloseLoginPage}
    Capture Page Screenshot

Input Email
    [Arguments]     ${email}
    Input Text      ${emailFieldFormLogin}      ${email}

Input Password
    [Arguments]     ${password}
    Input Text      ${passwordFieldFormLogin}   ${password}

Verify Register Page
    Wait Until Element Is Visible   ${fullNameRegisterLabel}
    Wait Until Element Is Visible   ${fullNameRegusterFieldForm}
    Wait Until Element Is Visible   ${emailRegisterLabel}
    Wait Until Element Is Visible   ${emailregisterFieldForm}
    Wait Until Element Is Visible   ${passwordRegisterLabel}
    Wait Until Element Is Visible   ${passwordregisterFieldForm}
    Wait Until Element Is Visible   ${referralCodeRegisterLabel}
    Wait Until Element Is Visible   ${referralCodeRegisterFieldForm}
    Wait Until Element Is Visible   ${buttonRegister}
    Capture Page Screenshot

Register New User Using Email
    Verify Register Page
    Generate Random Name
    Generate Random Email
    Fill Full Name And Email    ${fullname}    ${emailRegis}
    Input Password Register     ${passwordRegis}  
    Sleep   2
    Click Element   ${buttonRegister}
    Capture Page Screenshot
    Select Learning Interesting
    Select Information Source
    Input Phone Number Register
    Scroll To Down
    Wait Until Element Is Visible   ${saveBtnRegister}
    Click Element   ${saveBtnRegister}

Fill Full Name And Email
    [Arguments]     ${fullName}     ${email}
    Input Text  ${fullNameRegusterFieldForm}    ${fullName}
    Input Text  ${emailregisterFieldForm}       ${email}

Input Password Register
    [Arguments]     ${password}
    Input Text  ${passwordregisterFieldForm}    ${password}

Generate New Register Number
    ${ext}=    Generate Random String    6    [NUMBERS]
    ${newPhoneNo}=    Set Variable    ${registerPhoneNo}${ext}
    Set Global Variable    ${newPhoneNo}

Generate Random Name
    ${first}=    Generate Random String    5    [LOWER]
    ${last}=     Generate Random String    5    [LOWER]
    ${fullname}=    Set Variable    ${first} ${last}
    Log     ${fullname} 
    Set Global Variable     ${fullname}

Generate Random Email
    ${name}=    Generate Random String    5    [LOWER]
    ${emailRegis}=      Set Variable    ${name}${emailFormat }
    Loging  ${emailRegis}
    Set Global Variable     ${emailRegis}

Select Learning Interesting
    Wait Until Element Is Visible   ${learningInterestLabel}
    Wait Until Element Is Visible   ${learningInterestList1}
    Click Element   ${learningInterestList1}
    Capture Page Screenshot

Select Information Source
    Wait Until Element Is Visible   ${infoSourceLabel}
    Wait Until Element Is Visible   ${selectSourceLabel}
    Click Element   ${selectSourceLabel}
    Wait Until Element Is Visible   ${selectedSource}
    Click Element   ${selectedSource}
    Sleep   2
    Capture Page Screenshot

Input Phone Number Register
    Generate New Register Number
    Wait Until Element Is Visible   ${labelPhone}
    Input Text  ${fieldPhone}   ${newPhoneNo}