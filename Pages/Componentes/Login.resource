*** Settings ***
Documentation        Arquivo de login
Library              SeleniumLibrary
Resource             ../../Resources/Base.resource
Resource             ../../Funcionalidades/Metodos_Globais.resource
Resource             ../../TestData/JSON_config.resource
 
#[Documentação]      Informações do sistema
#                    SINAFWEB

# https://magento2-demo.magebit.com/
# 
*** Variables ***
${URL}                  https://magento2-demo.magebit.com/
${NOME}                 Maxwell
${SOBRENOME}            QA
${SENHA}                Teste@2026!
${NOME_LOJA}            //html/body/div[2]/header/div[2]
*** Keywords ***
# --- SETUP E TEARDOWN ---
Abrir Navegador
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    15s

Fechar Navegador
    Capture Page Screenshot
    Close Browser

# --- IMPLEMENTAÇÃO BDD ---
que eu acesse a página inicial da loja
    Builtin.Sleep                    2
    Title Should Be    ${NOME_LOJA}

eu preencher o formulário de cadastro com um novo e-mail
    ${SUFIXO}=    Generate Random String    5    [LOWER]
    ${EMAIL_CADASTRO}=    Set Variable    maxwell_${SUFIXO}@teste.com
    Set Suite Variable    ${EMAIL_CADASTRO}
    
    Click Element    link=Create an Account
    Input Text       id=firstname               ${NOME}
    Input Text       id=lastname                ${SOBRENOME}
    Input Text       id=email_address           ${EMAIL_CADASTRO}
    Input Text       id=password                ${SENHA}
    Input Text       id=password-confirmation    ${SENHA}
    Click Button     css=button[title="Create an Account"]

devo ver a mensagem de sucesso "${MENSAGEM}"
    Wait Until Page Contains    ${MENSAGEM}