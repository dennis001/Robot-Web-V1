*** Settings ***
Documentation        Ações e elementos da página de login

Library              Browser

*** Keywords ***
Go to login page
    Go to    http://localhost:3000/login

Submit login form
    [Arguments]    ${email}     ${password}

    Fill Text    css=input[name=email]       ${email}
    Fill Text    css=input[name=password]    ${password}
    Click        css=button >> text=Entrar

Toast should be
    [Arguments]    ${expect_message}

    ${element}    Set Variable    css=.Toastify__toast-body
    Wait For Elements State    ${element}    Visible    5
    Get Text    ${element}    equal    ${expect_message}