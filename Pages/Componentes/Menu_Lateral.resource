*** Settings ***
Documentation             Ações e elementos para Menu Lateral/Submenus
Library                   SeleniumLibrary
 
*** Variables ***

*** Keywords ***
#----------------
Acessar a funcionalidade a ser testada Menu submenu e subitem
    [Arguments]               ${locator_1}    ${locator_2}      ${locator_3}
 

#Scripts para clicar em mais de um botão na mesma linha

#------------Clica no primeiro locator-------#
    Wait Until Element Is Visible    ${locator_1}   
    Click Element                    ${locator_1}        
    BuiltIn.Sleep    1    
 
 #------------Clica no segundo locator-------#
    Wait Until Element Is Visible    ${locator_2}    
    Click Element                    ${locator_2}
    BuiltIn.Sleep    1
#------------Clica no terceriro -------#  
    Wait Until Element Is Visible     ${locator_3}        
    Click Element                     ${locator_3}  
    BuiltIn.Sleep    1 
     
    
Acessar a funcionalidade a ser testada Menu e submenu    
    [Arguments]               ${locator_1}    ${locator_2}      

#------------Clica no primeiro locator-------#
    BuiltIn.Sleep    3
    Click Element             ${locator_1}        
    BuiltIn.Sleep    2    
 
 #------------Clica no segundo locator-------#
    Click Element             ${locator_2}    
    BuiltIn.Sleep    2
