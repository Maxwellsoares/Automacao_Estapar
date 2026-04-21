*** Settings ***
Documentation        Arquivo dedicado para funcionalidades gerais do sistema
Library        SeleniumLibrary
Library        pyautogui
Library        OperatingSystem
Library        DateTime
Library        ../Resources/ScreenshotLibrary.py
Resource       ../Resources/Base.resource
Library        ../Resources/ScreenshotLibrary.py

*** Variables ***
${big_time}                                 15

*** Keywords ***
Observar Comportamento
    ${html}        Get Source
    log        ${html}        
    BuiltIn.Sleep    10

o sistema apresenta a mensagem "${texto}"    
    Wait Until Element Is Visible      //*[contains(text(),'${texto}')]        timeout=${big_time}
    Log To Console    ${texto}
    Capture Page Screenshot
    Capture Element Screenshot    //*[contains(text(),'${texto}')]

clico no botão "${VARIAVEL_1}"
 #   Log To Console     \n Clico no botão "${VARIAVEL_1}"
 #   BuiltIn.Sleep      1
    Wait Until Element Is Enabled    //*[contains(text(),'${VARIAVEL_1}')]    3          
    BuiltIn.Sleep      2
    Click Element      //*[contains(text(),'${VARIAVEL_1}')]
    BuiltIn.Sleep      2
