*** Settings ***
Resource    ../base.robot



***Keywords***
Get products
    Create Session          serverest               ${BASE_URI}
    ${response}=            Get On Session          serverest       /produtos
    Log To Console          ${response.content}
    Set Global Variable     ${response}

Validade status code "${status_code}"
    Should Be True     ${response.status_code} == ${status_code}
    Log To Console      Status Code: ${response.status_code}

Validate message "${message}"
    Should Be Equal         ${response.json()["message"]}     ${message}


Validate all products response 
    Should Be True        ${response.json()["quantidade"]} > 1
    Should Not Be Empty   ${response.json()["produtos"]}  


#Create new product
#    Create Session          serverest           ${BASE_URI}
#    ${body}                 create dictionary   nome=caneta     preco=13        descricao=caneta    qauntidade=20
#    ${response}=            Post On Session     serverest        /produtos   
#    Log To Console          Response: ${response.content}
#    Set Global Variable     ${response}


Post Create new product
    Create Session          serverest            ${BASE_URI}
    &{payload}=              Get Valid Product Payload
    &{header}=               Create Dictionary    Authorization=${the_token}
    ${response}=             Post On Session      serverest      /produtos      data=${payload}    headers=${header}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}


Create a new product
    Post Create new product
    Validate message "Cadastro realizado com sucesso" 
    ${product_id}=        Set Variable      ${response.json()["_id"]}
    Log To Console          Id do produto criado: ${product_id}
    Set Global Variable     ${product_id}


Put update product
    Create Session          serverest               ${BASE_URI}
    &{payload}=             Get Valid Product Payload
    &{header}=              Create Dictionary       Authorization=${the_token}
    ${response}=             Put On Session      serverest       /produtos/${product_id}     data=${payload}     headers=${header}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

Delete the product
    Create Session          serverest               ${BASE_URI}
    &{header}=              Create Dictionary       Authorization=${the_token}
    ${response}=            Delete On Session      serverest       /produtos/${product_id}      headers=${header}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}