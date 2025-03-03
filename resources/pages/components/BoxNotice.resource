*** Settings ***
Documentation        Ações e elementos de Notice Page

Library              Browser

*** Keywords ***
Notice should be
    [Arguments]    ${target}

    ${element}    Set Variable    css=form .notice

    Wait For Elements State
    ...    ${element}
    ...    visible    5
    
    Get Text    ${element}
    ...    equal
    ...    ${target}    