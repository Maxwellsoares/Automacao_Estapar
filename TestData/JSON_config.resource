*** Settings ***
Library     JSONLibrary   # --pip install -U robotframework-jsonlibrary
Library     String

*** Keywords ***

# Opção de dados via JSON para cenários indepententes, caso necessário.


Ler dado JSON
    [Arguments]    ${propriedade}
    ${nome_caso_teste}    Obter caso de teste atual
    ${file_name}          Obter nome da massa de dados
    ${valor}              Obter valor    ${file_name}    ${propriedade}    ${nome_caso_teste}
    RETURN              ${valor}

Obter nome da massa de dados
    RETURN    ${MASSA_DE_TESTE}

Obter caso de teste atual
    ${substring}=    Get Substring    ${TEST_NAME}    0    6
    RETURN    ${substring}

Obter valor
    [Arguments]    ${file_name}    ${propriedade}    ${nome_caso_teste}
    ${path_file_json}=    Catenate    ${EXECDIR}\\TestData\\${file_name}.json
    ${Json_Objecto}=    Load JSON from File    ${path_file_json}    encoding=UTF-8
    ${value}=    Get value from JSON    ${Json_Objecto}    $[?(@.CASOS_DE_TESTES=="${nome_caso_teste}")].${propriedade}
    ${value}=    Convert To String      ${value}
    ${value}=    Replace String         ${value}    [     ${EMPTY}
    ${value}=    Replace String         ${value}    ]     ${EMPTY}
    ${value}=    Replace String         ${value}    "     ${EMPTY}
    ${value}=    Replace String         ${value}    '     ${EMPTY}
    RETURN    ${value}
