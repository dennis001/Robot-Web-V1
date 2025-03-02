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



    
    