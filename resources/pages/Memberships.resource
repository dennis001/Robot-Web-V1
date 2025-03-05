*** Settings ***
Documentation        Suite de teste de matricula de plano

Library              Browser

*** Variables ***
${btnCadaster}    css=a[href="/memberships/new"]
${selecName}      css=input[aria-label="select_account"]
${submitButton}   css=button[type="submit"]

*** Keywords ***
Create new membership
    [Arguments]    ${data}

    Go to memberships form
    Select account       ${data}[account][name]    ${data}[account][cpf]
    Select plan          ${data}[plan]
    Fill payment card    ${data}[credit_card]
    Click                ${submitButton} >> text=Cadastrar

Go to memberships form
    Click    ${btnCadaster}

    Wait For Elements State    css=h1 >> text=Nova Matrícula
    ...    visible    5

Select account
    [Arguments]    ${name}         ${cpf}
    Fill Text      ${selecName}    ${name}
    Click          css=div[data-testid="${cpf}"]     # Preciso entender como esse cara funciona

Select plan
    [Arguments]    ${plan}
    Fill Text      css=input[aria-label="select_plan"]    ${plan}
    # Click          css=div[id*=option] >> text=${plan}     # Esse é um exemplo de como melhorar a busca de um Id deixando em boas praticas (O mesmo acontece com o codigo abaixo em class) = react-select-3-option-1
    Click          css=div[class$=option] >> text=${plan}

Fill payment card
    [Arguments]    ${credit_card}
    Fill Text      css=#card_number   ${credit_card}[number]
    Fill Text      css=#card_holder   ${credit_card}[holder]
    Fill Text      css=#card_month    ${credit_card}[month]
    Fill Text      css=#card_year     ${credit_card}[year]
    Fill Text      css=#card_cvv      ${credit_card}[cvv]
    