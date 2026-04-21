*** Settings ***
# MAGENTO 2 #
Documentation              Suíte dedicada a funcionalidades do "Magento"
Resource                   ../Funcionalidades/Login.resource
Resource                   ../Resources/Base.resource
Test Setup                 Abrir Navegador
Test teardown              Fechar Navegador



*** Test Cases ***
CTA_01_Cadastro_Usuario
    [Documentação]      Este script de teste tem por objetivo validar o cadastro de novo usuário.
     ...                
    Dado que eu acesse a página inicial da loja
    Quando aciono o botão "Create an Account"
    E preencho o campo "First Name"
    E preencho o campo "Last Name"
    E preencho o campo "Email" com email aleatorio
    E preencho o campo "Password" e "Confirm Password"
    E aciono o botão "Create an Account" para registro da conta
    Então a conta de usuário é criada

CTA_02_Login
    [Documentação]      Este script de teste tem por objetivo validar o login ao sistema de compras online.
     ...                
    Dado que eu acesse a página inicial da loja
    Quando aciono o botão "Sign In"
    E preencho o campo "Email" e "Password"para logar
    E aciono o botão "Sign In" para login
    Então o usuário é logado e redirecionado para a pagina inicial do site

CTA_03_Login_Senha_Invalida_Fluxo_Excecao
    [Documentação]      Este script de teste tem por objetivo validar senha errada ao efetuar login.
     ...                
    Dado que eu acesse a página inicial da loja
    Quando aciono o botão "Sign In"
    E preencho o campo "Email" e "Password"para login
    E aciono o botão "Sign In" para login
    Então é apresentada a mensagem "The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later"

CTA_04_Login_Email_Invalido_Fluxo_Excecao
    [Documentação]      Este script de teste tem por objetivo validar e-mail errado ao efetuar login.
     ...                
    Dado que eu acesse a página inicial da loja
    Quando aciono o botão "Sign In"
    E preencho campo "Email" e "Password"para login
    E aciono o botão "Sign In" para login
    Então é apresentada a mensagem "The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later"


CTA_05_Adicionar_Produto_Carrinho
    [Documentação]      Este script de teste tem por objetivo validar a adição de produto ao carrinho de compra.
     ...                
    Dado que eu acesse a página inicial da loja
    Quando aciono o botão "Sign In"
    E preencho o campo "Email" e "Password"para logar
    E aciono o botão "Sign In" para login
    E seleciono um item para compra na pagina inicial
    E adicionar ao carrinho
    Então o produto é adicionado ao carrinho 

CTA_06_Finalizacao_Compra_Checkout
    [Documentação]      Este script de teste tem por objetivo validar o checkout completo de compra do produto.
     ...                
    Dado que eu acesse a página inicial da loja
    Quando aciono o botão "Sign In"
    E preencho o campo "Email" e "Password"para logar
    E aciono o botão "Sign In" para login
    E seleciono um item para compra na pagina inicial
    E visualizo o carrinho com o produto ja adicionado do step anterior
    E aciono o botão "Proceed to Checkout"
    E preencho os campos obrigatórios para "Endereço de envio"
    E aciono o botão "Next"
    E aciono o botão "Place Order" para finalização da compra
    Então a compra é finalizada e é apresentado a mensagem de sucesso na tela "Thank you for your purchase!"














    






