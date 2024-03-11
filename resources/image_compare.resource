*** Settings ***
Documentation       image compare resource file, contains all keywords using screencomparison actions

Library             ImageCompare    threshold=${0.15}
Resource            browser.resource


*** Variables ***
${IMAGE_DIR}        ${EXECDIR}${/}data${/}image-compare${/}
${REFERENCE_DIR}    ${IMAGE_DIR}reference${/}
${CANDIDATE_DIR}    ${IMAGE_DIR}candidate${/}
${REFERENCE_RUN}    ${False}


*** Keywords ***
Vergelijk Afbeelding
    [Documentation]    Dit keyword schrijft screenshots weg in de 'actual' directory.
    ...    iets
    [Arguments]    ${image_test_id}
    ...    ${image_index}=1
    ...    ${selector}=css=iframe[title="storybook-preview-iframe"] >>> dialog
    ...    ${Threshold}=${0.1}
    ${image_test_id}    Replace Spaces And Encode To ASCII    ${image_test_id}
    IF    $image_index
        VAR    ${image_path}    ${image_test_id}_${image_index}.png
    ELSE
        VAR    ${image_path}    ${image_test_id}.png
    END
    VAR    ${image_reference_path}    ${REFERENCE_DIR}${image_path}
    VAR    ${image_candidate_path}    ${CANDIDATE_DIR}${image_path}
    Get Text    ${selector}
    Wait For Load State
    IF    $REFERENCE_RUN
        Take Screenshot    ${image_reference_path}    ${selector}
    ELSE
        Take Screenshot    ${image_candidate_path}    ${selector}
        Compare Images    ${image_reference_path}    ${image_candidate_path}    threshold=${Threshold}
    END

Vergelijk vanuit tree
    [Documentation]    maak screenshots navigerend uit tree
    [Arguments]    ${image_test_id}
    ...    ${item_selector}
    ...    ${Threshold}
    Vergelijk Afbeelding
    ...    image_test_id=${image_test_id}
    ...    image_index=1
    ...    selector=css=iframe[title="storybook-preview-iframe"] >>> ${item_selector}
    ...    Threshold=${Threshold}

Check And Create Image Directories
    [Documentation]    Controleer en valideer image compare directories
    Create Directory    ${IMAGE_DIR}
    Create Directory    ${REFERENCE_DIR}
    Create Directory    ${CANDIDATE_DIR}

Init Image Compare
    [Documentation]    Check of de randvoorwaarden er zijn om image compare uit te voeren
    Check And Create Image Directories
