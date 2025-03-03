*** Settings ***
Documentation        Ações e elementos da Componente toast

Library              Browser

*** Keywords ***
Toast should be
    [Arguments]    ${expect_message}

    ${element}    Set Variable    css=.Toastify__toast-body
    Wait For Elements State    ${element}    Visible    5
    Get Text    ${element}    equal    ${expect_message}