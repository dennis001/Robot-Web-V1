*** Settings ***
Documentation    Cenarios de testes de pré-cadastro de Clientes

Library    Collections

Resource   ../resources/Base.resource

Test Setup       Start signup form
Test Teardown    Take Screenshot

*** Test Cases ***
Deve iniciar o cadastro do cliente
    [Tags]    cadastroCliente
    
    ${account}    Get Fake Account

    Submit signup form    ${account}
    Verificar welcome message


Campo nome deve ser obrigatorio
    [Tags]    nomeObrigatorio
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    name    ${EMPTY}

    Submit signup form   ${account}
    Notice should be    Por favor informe o seu nome completo


Campo email deve ser obrigatorio
    [Tags]    emailObrigatorio    
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    email    ${EMPTY}

    Submit signup form   ${account}
    Notice should be    Por favor, informe o seu melhor e-mail


Campo cpf deve ser obrigatorio
    [Tags]    cpfObrigatorio
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    cpf    ${EMPTY}

    Submit signup form    ${account}
    Notice should be    Por favor, informe o seu CPF

Campo email invalido
    [Tags]    inv    email
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    email    test%test;com

    Submit signup form    ${account}
    Notice should be    Oops! O email informado é inválido   
  

Campo CPF invalido
    [Tags]    inv    cpf
    
    ${account}    Get Fake Account
    Set To Dictionary    ${account}    cpf    0029381937a

    Submit signup form    ${account}
    Notice should be       Oops! O CPF informado é inválido  
