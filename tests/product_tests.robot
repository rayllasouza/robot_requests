*** Settings ***
Resource    ../keywords/products_keywords.robot
Resource    ../keywords/login_keywords.robot
#Resource    ../keywords/user_keywords.robot



*** Test Cases ***
#Cenário: Get all products
#    Get products
#    Validade status code "200"
#    Validate all products response 

#Cenário: Post create product 201
#    Have logged in and saved token
#    Post Create new product
#    Validade status code "201"
#    Validate message "Cadastro realizado com sucesso" 

#Cenário: Put update product 200
#    Have logged in and saved token
#    Create a new product
#    Put update product
#    Validade status code "200"
#    Validate message "Registro alterado com sucesso"

Cenário: Delete product 200
    Have logged in and saved token
    Create a new product
    Delete the product 
    Validade status code "200"
    Validate message "Registro excluído com sucesso"
    





    