*** Settings ***
Resource    ../keywords/user_keywords.robot

*** Test Cases ***

#Cenário: Get All Users 200
#    Get users
#    Validade status code "200"
#    Validate all users response

#Cenário: Get specific user 200
#    Get specific user "/aunbZNlrx29xx1Ex"
#    Validade status code "200"
#    Validate get specific user response
#   
#Cenário: Post create user 201
#    Post create new user
#    Validade status code "201"
#    Validate message "Cadastro realizado com sucesso"

# Cenário: Put update user 201
#     Update user "/1ucwk0bH06xDCgj8"
#     Validate message "Registro alterado com sucesso"
#     Validade status code "200"


#Cenário: Put update user 201 (parte II)
#    Create a new user
#    Put update the user
#    Validade status code "200"
#    Validate message "Registro alterado com sucesso"

Cenário: Delete user 200
    Create a new user 
    Delete the user
    Validade status code "200"
    Validate message "Registro excluído com sucesso"
    #Get deleted user
    #Validade status code "400"
    #Validate message "Usuário não encontrado"                    


