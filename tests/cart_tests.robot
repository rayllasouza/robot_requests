***Settings***
Resource    ../keywords/login_keywords.robot
Resource    ../keywords/cart_keywords.robot
Resource    ../keywords/products_keywords.robot


***Test Cases***
#Cenário: Get all carts 200
#    Get carts
#    Validade status code "200"
#    Validate all carts response

#Cenário: Get specific cart 200
#    Get specific cart "zh3lIawofxUeVeNL"
#    Validade status code "200"
#    Validate get specific cart response

Cenário: Post create cart 200
    Have logged in and saved token
    Create a new product
    Post create cart
    
