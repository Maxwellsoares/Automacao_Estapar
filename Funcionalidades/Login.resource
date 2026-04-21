*** Settings ***
Documentation        Arquivo dedicado as keywords da funcionalidade "Magento"
Resource            ../Resources/Base.resource
Resource            ../Pages/Login_page.resource
Resource            ../Funcionalidades/Metodos_Globais.resource
Resource            ../TestData/JSON_config.resource
Library             SeleniumLibrary
Library             pyautogui
Library             FakerLibrary

*** Variables ***
# Garante que está passando o conteúdo da variável como string
# pyautogui.Write        ${EMAIL_CADASTRADO}

${company_field}    name=company
${street_adress_1}     name=street[0]
${street_adress_2}     name=street[1]
${street_adress_3}     name=street[2]
${country}             name=country_id
${Brazil}              value=BR
${state_province}      name=region_id
${city}                name=city
${post_code}           name=postcode
${phone_number}        name=telephone



*** Keywords ***
aciono o botão "Create an Account"
    Builtin.Sleep    1
    Click Element       ${Create_Account}
    Builtin.Sleep    1

aciono o botão "Sign In"
    Builtin.Sleep    2
    Click Element       ${sign_in}
    Builtin.Sleep    5

preencho o campo "Email"
    Wait Until Element Is Visible    ${email} 
    Wait Until Element Is Enabled    ${email} 
    Click Element     ${email} 
    Builtin.Sleep    2
    pyautogui.Write      Maxwell100@gmail.com.br
    Builtin.Sleep    2

preencho o campo "Email" com email aleatorio
    Wait Until Element Is Visible    ${email} 
    Wait Until Element Is Enabled    ${email} 
    Click Element                    ${email} 
    Builtin.Sleep                    1
    
    # 1. Gera o e-mail aleatório
    ${email_dinamico}    FakerLibrary.Email
    
    # 2. SALVA como Global para o Login conseguir ler depois
    Set Global Variable    ${EMAIL_CADASTRADO}    ${email_dinamico}
    
    # 3. Digita no campo
    pyautogui.Write    ${email_dinamico}
    Builtin.Sleep      2



preencho o campo "Senha"
    Wait Until Element Is Visible    ${password_login} 
    Wait Until Element Is Enabled    ${password_login}
    Click Element                    ${password_login}
    Click Element                    ${password_login}
    Builtin.Sleep    2
    pyautogui.Write    X!300progpu
    Builtin.Sleep    2

aciono o botão "Sign In" para login
    Wait Until Element Is Visible    ${sign_in_login}
    Wait Until Element Is Enabled    ${sign_in_login}
    Click Element      ${sign_in_login}
    Builtin.Sleep    2


o usuário é logado e redirecionado para a pagina inicial do site
    Wait Until Element Is Visible    ${validar_tela_inicial} 
    Builtin.Sleep    2
    Capture Page Screenshot

é apresentada a mensagem "The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later"
    Wait Until Element Is Visible    ${validar_tela_login_erro}  
    Builtin.Sleep    2
    Capture Page Screenshot
 

seleciono um item para compra na pagina inicial
    Wait Until Element Is Visible    ${selecionar_item_compra} 
    Click Element      ${selecionar_item_compra} 
    Builtin.Sleep    4
    Click Element      ${selecionar_item_compra_2}    
    Builtin.Sleep    4

adicionar ao carrinho
    Wait Until Element Is Visible    ${add_to_cart} 
    Click Element      ${add_to_cart} 
    Builtin.Sleep    4
    Wait Until Element Is Visible    ${visualizar_carrinho}  
    Click Element      ${visualizar_carrinho} 
    Builtin.Sleep    3

visualizo o carrinho com o produto ja adicionado do step anterior
    Builtin.Sleep    2
    Wait Until Element Is Visible    ${visualizar_carrinho}  
    Click Element      ${visualizar_carrinho} 
    Builtin.Sleep    3

o produto é adicionado ao carrinho 
    Wait Until Element Is Visible    ${visualizar_carrinho} 
    Capture Page Screenshot


preencho os campos obrigatórios para "Endereço de envio"
    # Campo Empresa
    Wait Until Element Is Visible    ${company_field}    10
    Click Element                    ${company_field}
    pyautogui.Write                  Minha Empresa Aleatoria
    
    # Street Address 1
    Wait Until Element Is Visible    ${street_adress_1}    10
    Click Element                    ${street_adress_1}
    Builtin.Sleep                    2
    pyautogui.Write                  Quadra 0
    
    # Street Address 2
    Wait Until Element Is Visible    ${street_adress_2}    10
    Click Element                    ${street_adress_2}
    Builtin.Sleep                    2
    pyautogui.Write                  Conjunto Z
    
    # Street Address 3
    Wait Until Element Is Visible    ${street_adress_3}    10
    Click Element                    ${street_adress_3}
    Builtin.Sleep                    2
    pyautogui.Write                  Casa 88

    #Country
    Wait Until Element Is Visible    ${country}     10
    Click Element                    ${country} 
    Builtin.Sleep                    2

    #Brazil
    Builtin.Sleep                    2
    Click Element    xpath=//option[@value="BR"]
    Builtin.Sleep                    2
    Capture Page Screenshot
    Builtin.Sleep                    2

    #State/Province
    Wait Until Element Is Visible    ${state_province}     10
    Click Element                    ${state_province}
    Builtin.Sleep                    2
    
    #Distrito Federal
    Builtin.Sleep                    2
    Click Element    xpath=//option[text()="Distrito Federal"]
    Builtin.Sleep                    2
    Capture Page Screenshot
    Builtin.Sleep                    2

    #City
    Wait Until Element Is Visible    ${city}      10
    Click Element                    ${city} 
    pyautogui.Write                  Brasilia
    Builtin.Sleep                    2

    #Zip/Postal Code
    Wait Until Element Is Visible    ${post_code}      10
    Click Element                    ${post_code} 
    pyautogui.Write                  73040130
    Builtin.Sleep                    3

    #Phone Number
    Wait Until Element Is Visible    ${phone_number}      10
    Click Element                    ${phone_number} 
    pyautogui.Write                  61991738019
    Builtin.Sleep                    3   


aciono o botão "Next"
    Wait Until Element Is Visible    ${btn_next_finalizacao_compra}     10
    Click Element                    ${btn_next_finalizacao_compra}
    Builtin.Sleep                    3  


aciono o botão "Place Order" para finalização da compra
    Wait Until Element Is Visible    ${btn_place_order}     10
    Click Element                    ${btn_place_order} 
    Builtin.Sleep                    3  


aciono o botão "Proceed to Checkout"
    Wait Until Element Is Visible    ${proceed_to_checkout} 
    Click Element      ${proceed_to_checkout} 
    Builtin.Sleep    4

a compra é finalizada e é apresentado a mensagem de sucesso na tela "Thank you for your purchase!"
    Wait Until Element Is Visible    ${validacao_tela_finalizacao_compra}
    Capture Page Screenshot    
    Builtin.Sleep    3


preencho o campo "First Name"
    Wait Until Element Is Visible    ${first_name}
    Wait Until Element Is Enabled    ${first_name}
    Click Element      ${first_name}  
    Builtin.Sleep    1
    pyautogui.Write      Teste Maxwell
    Builtin.Sleep    1


preencho o campo "Last Name"
    Wait Until Element Is Visible    ${last_name}
    Wait Until Element Is Enabled     ${last_name}
    Click Element       ${last_name} 
    Builtin.Sleep    1
    pyautogui.Write      Teste
    Builtin.Sleep    1
    Scroll Element Into View        ${Scroll}

preencho o campo "Email" e "Password"para logar
    Wait Until Element Is Visible    ${email_login}
    Click Element                    ${email_login}
    Builtin.Sleep                    2
    
    # 4. Usa a variável global que foi definida no passo anterior
    # Se o cadastro rodou antes, aqui ele vai escrever o e-mail fake gerado
    pyautogui.Write                  ${EMAIL_CADASTRADO}
    
    Builtin.Sleep                    2
    Wait Until Element Is Visible    ${password_login} 
    Wait Until Element Is Enabled    ${password_login}
    Click Element                    ${password_login}
    Click Element                    ${password_login}
    Builtin.Sleep                    2
    
    # Senha fixa (sem problemas)
    pyautogui.Write                  X!300progpu
    Builtin.Sleep                    4

preencho o campo "Email" e "Password"para login
    Wait Until Element Is Visible    ${email_login}
    Click Element                    ${email_login}
    Builtin.Sleep                    2
    
    # 4. Usa a variável global que foi definida no passo anterior
    # Se o cadastro rodou antes, aqui ele vai escrever o e-mail fake gerado
    pyautogui.Write                  ${EMAIL_CADASTRADO}
    
    Builtin.Sleep                    2
    Wait Until Element Is Visible    ${password_login} 
    Wait Until Element Is Enabled    ${password_login}
    Click Element                    ${password_login}
    Click Element                    ${password_login}
    Builtin.Sleep                    2
    
    # Senha fixa (sem problemas)
    pyautogui.Write                  X!300proupi
    Builtin.Sleep                    4


preencho campo "Email" e "Password"para login
    Wait Until Element Is Visible    ${email_login}
    Click Element                    ${email_login}
    Builtin.Sleep                    2
    
    # 4. Usa a variável global que foi definida no passo anterior
    # Se o cadastro rodou antes, aqui ele vai escrever o e-mail fake gerado
    pyautogui.Write                  errado@org.com
    
    Builtin.Sleep                    2
    Wait Until Element Is Visible    ${password_login} 
    Wait Until Element Is Enabled    ${password_login}
    Click Element                    ${password_login}
    Click Element                    ${password_login}
    Builtin.Sleep                    2
    
    # Senha fixa (sem problemas)
    pyautogui.Write                  X!300progpu
    Builtin.Sleep                    4

preencho o campo "Password" e "Confirm Password"
    Wait Until Element Is Visible    ${password}
    Wait Until Element Is Enabled     ${password}
    Click Element       ${password}
    Builtin.Sleep    1
    pyautogui.Write      X!300progpu
    Builtin.Sleep    2
    Wait Until Element Is Visible    ${confirm_password} 
    Wait Until Element Is Enabled     ${confirm_password} 
    Click Element       ${confirm_password} 
    Builtin.Sleep    1
    pyautogui.Write      X!300progpu
    Builtin.Sleep    2


aciono o botão "Create an Account" para registro da conta
    Wait Until Element Is Visible    ${123}
    Click Element           ${123}
    Builtin.Sleep    5

a conta de usuário é criada
    Wait Until Element Is Visible    ${confirmo_registro_usuario} 
    Builtin.Sleep    2
    Capture Page Screenshot




