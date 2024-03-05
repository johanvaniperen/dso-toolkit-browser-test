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
