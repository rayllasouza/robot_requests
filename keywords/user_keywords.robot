*** Settings ***
Resource    ../base.robot

*** Keywords ***

Get specific user "${user_id}"
    Create Session          serverest          ${BASE_URI}
    ${response}=            Get On Session     serverest       /usuarios${user_id}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

Get users
    Create Session          serverest               ${BASE_URI}
    ${response}=            Get On Session          serverest       /usuarios
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

Validade status code "${status_code}"
    Should Be True     ${response.status_code} == ${status_code}
    Log To Console      Status Code: ${response.status_code}

Validate all users response 
    Should Be True        ${response.json()["quantidade"]} > 1
    Should Not Be Empty   ${response.json()["usuarios"]}  

Validate get specific user response
    Should Not Be Empty   ${response.json()}
    Should Not Be Empty   ${response.json()["nome"]}
    Should Not Be Empty   ${response.json()["email"]} 

Post create new user
    Create Session          serverest           ${BASE_URI}
    &{payload}=             Get Valid User Payload
    ${response}=            Post On Session     serverest        /usuarios   data=${payload}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}
    
Validate message "${message}"
    Should Be Equal         ${response.json()["message"]}     ${message}


Update user "${user_id}"
    Create Session          serverest           ${BASE_URI}
    ${body}=                 create Dictionary       nome=ana maria     email=bobby.dach@gmail.com  password=teste      administrador=true  
    ${response}             Put On Session      serverest       /usuarios${user_id}     data=${body}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

#Update user "${user_id}"
#    Create Session          serverest           ${BASE_URI}
#    &{payload}              Update User      
#    ${response}             Put On Session      serverest       /usuarios${user_id}     data=${payload}
#    Log To Console          Response: ${response.content}
#    Set Global Variable     ${response}


Create a new user
    Post create new user
    Validate message "Cadastro realizado com sucesso"
    ${user_id}=             Set Variable       ${response.json()["_id"]}
    Log To Console          Id do usuário criado:   ${user_id}
    Set Global Variable     ${user_id}

Put update the user
    Create Session          serverest           ${BASE_URI}
    &{payload}              Get Valid User Payload
    ${response}             Put On Session          serverest       /usuarios/${user_id}    data=${payload}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}


Delete the user
    Create Session          serverest           ${BASE_URI}
    ${response}=            Delete On Session   serverest       /usuarios/${user_id}
    Log To Console          Response: ${response.content}   
    Set Global Variable     ${response}  
    #Set Global Variable     ${user_id}

Get deleted user  
    Create Session          serverest           ${BASE_URI}
    ${response}=            Get On Session       serverest       /usuarios/${user_id}
    Log To Console          ${response.content}
    Set Global Variable     ${response}

    #${user_id}=             Set Variable       ${response.json()["_id"]}
    #Log To Console          Id do usuário criado:   ${user_id}
    #Set Global Variable     ${user_id}
    


    #${user_id}=             Set Variable       ${response.json()["_id"]}
    #Log To Console          Id do usuário criado:   ${user_id}
    #Set Global Variable     ${user_id}

    # Get specific user "${user_id}"
    # Create Session          serverest          ${BASE_URI}
    # ${response}=            Get On Session     serverest       /usuarios${user_id}
    # Log To Console          Response: ${response.content}
    # Set Global Variable     ${response}
   
