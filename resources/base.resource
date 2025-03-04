*** Settings ***
Documentation        Arquivo principal do projeto

Library              Browser
Library              libs/Account.py
Library              libs/Database.py

Resource             pages/Landing.resource
Resource             pages/Welcome.resource
Resource             pages/Login.resource
Resource             pages/Accounts.resource
Resource             pages/components/Toast.resource
Resource             pages/components/BoxNotice.resource

*** Keywords ***
Start session
    New Browser    browser=chromium    headless=False
    New Page    http://localhost:3000


Get log html
    Sleep    2
    ${html}    Get Page Source
    Log    ${html}