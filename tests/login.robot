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
    
    