*** Settings ***
Library             FakerLibrary

*** Keywords ***

Get Valid User Payload
    ${name}                 FakerLibrary.Name
    ${email}                FakerLibrary.Email
    &{payload}=             Create Dictionary       nome=${name}      email=${email}     password=123     administrador=true
    Log To Console          Payload criado: ${payload}
    [return]                ${payload}


Get Valid Product Payload
    ${name}                 FakerLibrary.Company
    &{payload}=             Create Dictionary       nome=${name}      preco=9999    descricao=Novo Produto Criado   quantidade=123
    Log To Console          Payload criado: ${payload}
    [return]                ${payload}


#Update User
#    ${name}                 FakerLibrary.Name
#    #${email}                FakerLibrary.Email
#    &{payload}=             Create Dictionary       nome=${name}      email=xjohnson@morales-sosa.com     password=123     administrador=true
#    Log To Console          Payload alterado: ${payload}
#    [return]                ${payload}


