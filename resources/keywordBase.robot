*** Settings ***
Library   SeleniumLibrary
Variables   ../ENV.py
Variables   ../pages/homePage.py

*** Keywords ***
Open Web Browser
    [Arguments]    ${URL_WEB}
    Open Browser    ${URL_WEB}    chrome
    Maximize Browser Window
    Sleep   5
    Capture Page Screenshot

Verify Home Page Dashboard
    Wait Until Element Is Visible   ${logoDicoding}
    Wait Until Element Is Visible   ${signInBtn}
    Wait Until Element Is Visible   ${regisBtn}
    Capture Page Screenshot

Loging
    [Arguments]       ${message}
    Log               ${message}
    Log To Console    ${message}\n

Scroll To Down
    [Arguments]    ${steps}=1    ${step_size}=500
    FOR    ${i}    IN RANGE    ${steps}
        Execute JavaScript    window.scrollBy(0, ${step_size})
        Sleep    2s
        Capture Page Screenshot
    END
    Sleep    2s