*** Settings ***
Documentation       Generiek resource file voor Robot Framework setup

Library             DateTime
Library             OperatingSystem
Library             String


*** Keywords ***
Replace Spaces And Encode To ASCII
    [Documentation]    Maakt strings tot namen die gebruikt kunnen worden in bijvoorbeeld Path namen
    [Arguments]    ${string_input}
    ${string_output}    Replace String    ${string_input}    ${SPACE}    _
    ${string_output}    Encode String To Bytes    ${string_output}    ASCII    errors=replace
    ${string_output}    Decode Bytes To String    ${string_output}    ASCII
    RETURN    ${string_output}
