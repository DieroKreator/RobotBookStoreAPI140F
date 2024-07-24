*** Settings ***
Library        RequestsLibrary
Library        OperatingSystem
Resource       ../../resources/common.resource
Variables      ../../resources/variables.py
Suite Setup    Steps    ${url}    ${userName}    ${password}

*** Variables ***
${BASE_URL}    https://bookstore.toolsqa.com/swagger/#/BookStore/BookStoreV1BooksPost
${isbn}    9781449365035

*** Test Cases ***
Cadastro de un Livro
    Create Session    mysession    ${BASE_URL}
    ${headers}=    Create Dictionary    Content-Type=application/json    Authorization=Bearer ${bearer}
    ${data}=    Create Dictionary    userId=${userId}    collectionOfIsbns=[{"isbn": "9781449331818"}]
    ${response}    POST    ${BASE_URL}    json=${data}
    Should Be Equal As Numbers    ${response.status_code}    200
    
Consulta de um livro
    ${headers}    Create Dictionary    Content-Type=${content_type}
    ${response}    GET    url=${url}/BookStore/v1/Book?ISBN=${isbn}
    ${response_body}    Set Variable    ${response.json()}
    Log To Console    ${response_body}

    Status Should Be    200
    Should Be Equal    ${response_body}[isbn]    9781449365035
    Should Be Equal    ${response_body}[title]    Speaking JavaScript 
    Should Be Equal    ${response_body}[author]    Axel Rauschmayer 