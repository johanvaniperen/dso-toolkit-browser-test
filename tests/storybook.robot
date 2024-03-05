*** Comments ***
Proof of concept style guide tests


*** Settings ***
Documentation       algehele import iets

Resource            ../resources/storybook.resource


*** Test Cases ***
Open Storybook
    [Documentation]    Open storybook en valideeer titel
    Open Storybook
    Explorer Tree Wordt Getoond
