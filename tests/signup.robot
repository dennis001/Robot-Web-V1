*** Settings ***
Documentation    Cenarios de testes de pré-cadastro de Clientes

Library    Browser

Resource   ../resources/base.resource

*** Test Cases ***
Deve iniciar o cadastro do cliente
    
    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name        ${account}[name]
    Fill Text    id=email       ${account}[email]
    Fill Text    id=document    ${account}[document]
    # Click        xpath=//button[text()="Cadastrar"]
    Click        css=button >> text=Cadastrar

    Wait For Elements State
    ...    text=Falta pouco para fazer parte da família Smartbit!
    ...    visible    5


Campo nome deve ser obrigatorio
    [Tags]    required
    
    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=email       ${account}[email]
    Fill Text    id=document    ${account}[document]
    # Click        xpath=//button[text()="Cadastrar"]
    Click        css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Por favor informe o seu nome completo

Campo email deve ser obrigatorio
    [Tags]    required
    
    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name        ${account}[name]
    Fill Text    id=document    ${account}[document]
    # Click        xpath=//button[text()="Cadastrar"]
    Click        css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Por favor, informe o seu melhor e-mail


Campo cpf deve ser obrigatorio
    [Tags]    required
    
    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name        ${account}[name]
    Fill Text    id=email       ${account}[email]
    # Click        xpath=//button[text()="Cadastrar"]
    Click        css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Por favor, informe o seu CPF

Campo email invalido
    [Tags]    inv    email
    
    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name        ${account}[name]
    Fill Text    id=email       teste%teste,com;br
    Fill Text    id=document    ${account}[document]
    # Click        xpath=//button[text()="Cadastrar"]
    Click        css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Oops! O email informado é inválido      

Campo CPF invalido
    [Tags]    inv    cpf
    
    ${account}    Get Fake Account

    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000

    Get Text    css=#signup h2
    ...    equal
    ...    Faça seu cadastro e venha para a Smartbit!
    
    Fill Text    id=name        ${account}[name]
    Fill Text    id=email       ${account}[email]
    Fill Text    id=document    00293819373
    # Click        xpath=//button[text()="Cadastrar"]
    Click        css=button >> text=Cadastrar

    Wait For Elements State
    ...    css=form .notice
    ...    visible    5
    
    Get Text    css=form .notice
    ...    equal
    ...    Oops! O CPF informado é inválido      