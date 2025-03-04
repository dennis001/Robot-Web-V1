*** Settings ***
Documentation        Suite de teste de adesões de plano

Resource             ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve poder realizar uma nova adesão

    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

    Go to Enrolls
    Go to enroll form
    
    Select account    Guilherme Rocha    731.096.842-50
    Select plan       Plano Black
    
    
    
    Sleep    2


*** Keywords ***

Go to Enrolls
    Click    css=a[href="/memberships"]

    Wait For Elements State    css=h1 >> text=Matrículas
    ...    visible    5
 
Go to enroll form
    Click    css=a[href="/memberships/new"]

    Wait For Elements State    css=h1 >> text=Nova Matrícula
    ...    visible    5

Select account
    [Arguments]    ${name}    ${cpf}
    Fill Text    css=input[aria-label="select_account"]    ${name}
    Click        css=div[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plan}
    Fill Text      css=input[aria-label="select_plan"]    ${plan}
    # Click          css=div[id*=option] >> text=${plan} # Esse é um exemplo de como melhorar a busca de um Id deixando em boas praticas (O mesmo acontece com o codigo abaixo em class) = react-select-3-option-1
    Click          css=div[class$=option] >> text=${plan}