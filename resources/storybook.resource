*** Settings ***
Documentation       Browser specifieke resource file voor Robot Framework met gebruik van Browser Library

Resource            browser.resource


*** Variables ***
${PO_EXPLORER_TREE}     css=[id="storybook-explorer-tree"]
${STORYBOOK_URL}        https://storybook.dso-toolkit.nl/62.13.0


*** Keywords ***
Open Storybook
    [Documentation]    Opent de storybook pagina
    New Context
    ...    viewport=${VIEWPORT_SIZE}
    ...    tracing=${TRACING}
    Promise To    New Page    ${STORYBOOK_URL}
    Wait For All Promises

Explorer Tree Wordt Getoond
    [Documentation]    Verifeer Explorer Tree
    Get Text    ${PO_EXPLORER_TREE}

Navigeer In Explorer Tree
    [Documentation]    Navigeer in storybook tree
    [Arguments]    ${item}=default    @{boom}
    VAR    ${css_sub_path}    ${PO_EXPLORER_TREE}
    VAR    ${data_id}    ${EMPTY}
    FOR    ${stap}    IN    @{boom}
        ${uitgeklapt}    Get Attribute    ${PO_EXPLORER_TREE} button:text-is("${stap}")    aria-expanded
        IF    $uitgeklapt == 'false'
            Click    ${PO_EXPLORER_TREE} button:text-is("${stap}")
        END
        VAR    ${css_sub_path}    ${css_sub_path}${SPACE}button:text-is("${stap}")
        ${item_data_id}    Get Attribute    ${PO_EXPLORER_TREE} button:text-is("${stap}")     data-item-id
    END
    Click    ${PO_EXPLORER_TREE} div a[id*="${item_data_id}--"]:text-is("${item}")
