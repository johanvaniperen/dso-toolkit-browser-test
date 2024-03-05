*** Settings ***
Documentation       Alkgemene setttings voor suite setup en teardown
Resource            ../resources/browser.resource
Test Timeout        5 minutes
Suite Setup         Init Browser
Test Teardown       Teardown Browser
