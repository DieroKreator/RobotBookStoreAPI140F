*** Settings ***
Library        RequestsLibrary
Library        OperatingSystem
Resource       ../../resources/common.resource
Variables      ../../resources/variables.py
Suite Setup    Steps    ${url}    ${userName}    ${password}

*** Variables ***
${isbn}    9781449365035

*** Test Cases ***
Consulta de um livro
    ${headers}    Create Dictionary    Content-Type=${content_type}
    ${response}    GET    url=${url}/BookStore/v1/Book?ISBN=${isbn}
    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[isbn]    9781449365035
    Should Be Equal    ${response_body}[title]    Speaking JavaScript 
    Should Be Equal    ${response_body}[author]    Axel Rauschmayer 