*** Settings ***
Resource    ../base.robot



*** Keywords ***
Get carts
    Create Session          serverest               ${BASE_URI}
    ${response}=            Get On Session          serverest       /carrinhos
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

Validade status code "${status_code}"
    Should Be True     ${response.status_code} == ${status_code}
    Log To Console      Status Code: ${response.status_code}

Validate all carts response 
    Should Be True        ${response.json()["quantidade"]} > 1
    Should Not Be Empty   ${response.json()["carrinhos"]} 


Get specific cart "${cart_id}"
    Create Session          serverest               ${BASE_URI}
    ${response}=            Get On Session          serverest       /carrinhos/${cart_id}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

Validate get specific cart response
    Should Not Be Empty   ${response.json()}
    Should Not Be Empty   ${response.json()["produtos"]}
    
Post create cart
    Create Session          serverest               ${BASE_URI}
    &{body}                 Create Dictionary       idProduto=${product_id}     quantidade=1
    Log To Console          Body do carrinho: &{body} 

    &{header}=              Create Dictionary       Authorization=${the_token}

    ${response}=            POST On Session      serverest       /carrinhos     data=${body}    headers=${header}
    Log To Console          Response: ${response.content} 
    Set Global Variable     ${response}


# Post Create new product
#     Create Session          serverest            ${BASE_URI}
#     &{payload}=              Get Valid Product Payload
#     &{header}=               Create Dictionary    Authorization=${the_token}
#     ${response}=             Post On Session      serverest      /produtos      data=${payload}    headers=${header}
#     Log To Console          Response: ${response.content}
#     Set Global Variable     ${response}