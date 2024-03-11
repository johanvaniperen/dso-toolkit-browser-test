*** Comments ***
Proof of concept style guide tests


*** Settings ***
Documentation       algehele import iets

Library             DataDriver
Resource            ../resources/storybook.resource
Resource            ../resources/image_compare.resource

Test Setup          Open Storybook
Test Template       Explore Tree And Compare Image


*** Variables ***
${REFERENCE_RUN}    ${False}


*** Test Cases ***
Visual active-modal    active-modal    dialog    active    Modal
Visual passive-modal    passive-modal    dialog    passive    Modal
Visual confirm-modal    confirm-modal    dialog    confirm    Modal
Visual loading-modal    loading-modal    dialog    loading    Modal
Visual with-datepicker-modal    with-datepicker-modal    dialog    with datepicker    Modal
Visual fullscreen-modal    fullscreen-modal    dialog    fullscreen    Modal


*** Keywords ***
Explore Tree And Compare Image
    [Documentation]    Open boom en vergelijk
    [Arguments]    ${naam}    ${image_selector}    ${item}    @{explorer_tree}
    Navigeer In Explorer Tree    ${item}     @{explorer_tree}
    Vergelijk Afbeelding    ${naam}    ${image_selector}
