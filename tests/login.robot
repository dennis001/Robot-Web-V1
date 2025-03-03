*** Settings ***
Documentation    Cenarios de teste para Login SAC

Resource      ../resources/Base.resource

Test Setup       Start session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve logar como um gestor de academia
    [Tags]    login

    Go to login page
    Submit login form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Tentativa de login com senha invalida
    [Tags]    pass_inv

    Go to login page
    Submit login form    sac@smartbit.com    wfkps
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

Tentativa de login com email invalido
    [Tags]    email_inv

    Go to login page
    Submit login form    sasuke@smartbit.com    pwd123
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!
    
Dados de login Invalidos
    [Template]    Login with invalid credentials

    ${EMPTY}            ${EMPTY}      Os campos email e senha são obrigatórios.
    ${EMPTY}            pwd123        Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}      Os campos email e senha são obrigatórios.
    www.Sac.com.br      pwd123        Oops! O email informado é inválido
    5678987654'''       pwd123        Oops! O email informado é inválido
    !@#$%¨&**&¨%$#      pwd123        Oops! O email informado é inválido
    sfhajflagajgnk      pwd123        Oops! O email informado é inválido
    E!R#ÈOE`PÊ@#        pwd123        Oops! O email informado é inválido
    Gmail@.com          pwd123        Oops! O email informado é inválido


*** Keywords ***
Login with invalid credentials
    [Arguments]          ${email}    ${password}    ${output_message}
    Go to login page
    Submit login form    ${email}    ${password}
    Notice should be    ${output_message}
    