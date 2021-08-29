*** Settings ***
Resource    ../keywords/login_keywords.robot

*** Test Cases ***

Cenário: Login and save token
    Login with "ox0ugvf_8k6vzfy@outlook.com" and "l4G7xJ8JgMXF2ig"
    Validate logged in

Cenário: Login with Factory
    Login with factory static data
    Validate logged in



# robot -d ./logs/tests ./tests/product_tests.robot
