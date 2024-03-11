*** Comments ***
Proof of concept style guide tests


*** Settings ***
Documentation       algehele import iets

Resource            ../resources/image_compare.resource
Resource            ../resources/storybook.resource

Test Setup          Init Image Compare


*** Test Cases ***
Vergelijk Image Akordeon
    [Documentation]    Open storybook en valideeer titel
    Open Storybook
