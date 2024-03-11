*** Comments ***
Proof of concept style guide tests


*** Settings ***
Documentation       algehele import iets

Resource            ../resources/storybook.resource
Resource            ../resources/image_compare.resource


*** Variables ***
${REFERENCE_RUN}    ${True}


*** Test Cases ***
Storybook
    [Documentation]    Open storybook en valideeer titel
    Open Storybook
    Explorer Tree Wordt Getoond

Open storybook en stap verder
    [Documentation]    Open storybook en valideeer titel
    Open Storybook
    Navigeer In Explorer Tree    Docs    Form    Form Buttons
    Navigeer In Explorer Tree    active    Modal
    Vergelijk Afbeelding    active-modal    1
    Log To Console    Stop even

