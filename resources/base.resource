*** Settings ***
Documentation        Arquivo principal do projeto

Library              Browser
Library              libs/Account.py

Resource             pages/Landing.resource
Resource             pages/Welcome.resource

*** Keywords ***
Start signup form
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000