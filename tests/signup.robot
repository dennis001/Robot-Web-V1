*** Settings ***
Documentation    Cenarios de testes de pré-cadastro de Clientes

Library    Browser
Library    Collections

Resource   ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    cadastroCliente
    
    ${account}    Get Fake Account

    Start signup form
    Submit signup form    ${account}

    Wait For Elements State
    ...    text=Falta pouco para fazer parte da família Smartbit!
    ...    visible    5


Campo nome deve ser obrigatorio
    [Tags]    nomeObrigatorio
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    name    ${EMPTY}

    Start signup form
    Submit signup form   ${account}

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Por favor informe o seu nome completo

Campo email deve ser obrigatorio
    [Tags]    emailObrigatorio    
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    email    ${EMPTY}

    Start signup form
    Submit signup form   ${account}

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Por favor, informe o seu melhor e-mail


Campo cpf deve ser obrigatorio
    [Tags]    cpfObrigatorio
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    cpf    ${EMPTY}

    Start signup form
    Submit signup form    ${account}

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Por favor, informe o seu CPF

Campo email invalido
    [Tags]    inv    email
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    email    test%test;com

    Start signup form
    Submit signup form    ${account}

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Oops! O email informado é inválido      

Campo CPF invalido
    [Tags]    inv    cpf
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    cpf    0029381937a

    Start signup form
    Submit signup form    ${account}

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Oops! O CPF informado é inválido      

*** Keywords ***
Start signup form
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000

Submit signup form 
    [Arguments]    ${account}

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    Fill Text    id=name        ${account}[name]
    Fill Text    id=email       ${account}[email]
    Fill Text    id=cpf         ${account}[cpf]
    
    Click        css=button >> text=Cadastrar