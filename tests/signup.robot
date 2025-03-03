*** Settings ***
Documentation    Cenarios de testes de pré-cadastro de Clientes

Library    Collections

Resource   ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    cadastroCliente
    
    ${account}    Get Fake Account

    Submit signup form    ${account}
    Verificar welcome message

    Delete Account By Email    ${account}[email]

Tentativa de pré-cadastro
    [Template]    Attempt signup    

    ${EMPTY}         stella_porto@bfgadvogados.com         67384726174         Por favor informe o seu nome completo
    Stella Malu      ${EMPTY}                              67384726174         Por favor, informe o seu melhor e-mail
    Stella Malu      stella_porto@bfgadvogados.com         ${EMPTY}            Por favor, informe o seu CPF
    Stella Malu      test%test;com                         67384726174         Oops! O email informado é inválido
    Stella Malu      stella_porto@bfgadvogados.com         0029381937a         Oops! O CPF informado é inválido

*** Keywords ***
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary    
    ...    name=${name}    
    ...    email=${email}    
    ...    cpf=${cpf}

    Submit signup form    ${account}
    Notice should be    ${output_message}