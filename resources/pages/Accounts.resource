*** Settings ***
Documentation        Ações e elementos da página de contas

Library              Browser

*** Keywords ***
User is logged in
    [Arguments]    ${email}

    ${element}    Set Variable    css=.logged-user

    Wait For Elements State    ${element}    Visible    5
    Get Text                   ${element}    equal    ${email}