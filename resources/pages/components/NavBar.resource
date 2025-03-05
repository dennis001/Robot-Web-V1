*** Settings ***
Documentation        Elementos da NavBar da aplicação

Library              Browser

*** Variables ***
${membership}    css=a[href="/memberships"]

*** Keywords ***
User is logged in
    [Arguments]    ${email}

    ${element}    Set Variable    css=.logged-user

    Wait For Elements State    ${element}    Visible    5
    Get Text                   ${element}    equal    ${email}

Go to memberships
    Click    ${membership}

    Wait For Elements State    css=h1 >> text=Matrículas
    ...    visible    5
 