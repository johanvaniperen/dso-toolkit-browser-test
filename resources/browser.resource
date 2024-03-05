*** Settings ***
Documentation       Browser specifieke resource file voor Robot Framework met gebruik van Browser Library

Library             Browser
...                     auto_closing_level=SUITE
...                     enable_playwright_debug=${DEBUG}
...                     retry_assertions_for=0:00:05
...                     timeout=0:00:15
...                     strict=False
Resource            general.resource


*** Variables ***
${BROWSER_ENGINE}       chromium
${HEADLESS}             ${FALSE}
${DEBUG}                ${FALSE}
${TRACING}              ${EMPTY}
&{VIEWPORT_SIZE}        width=1921    height=1081


*** Keywords ***
Init Browser
    [Documentation]    Initieel opzetten van de browser
    New Browser    browser=${BROWSER_ENGINE}    headless=${HEADLESS}    timeout=0:00:15

Teardown Browser
    [Documentation]    Algemene Test Teardown
    ${console_log}    Get Console Log
    IF    $console_log    Log    console log output: ${console_log}
