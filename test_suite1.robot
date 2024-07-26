
*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Create And Retrieve User
    [Documentation]    This test case creates a new user and then retrieves the user's data.
    Create User
    Retrieve User

*** Keywords ***
Create User
    [Documentation]    This keyword sends a POST request to create a new user.
    ${user_data}=    Create Dictionary
    ...    name=John Doe
    ...    username=johndoe
    ...    email=johndoe@example.com
    ${response}=    POST    ${BASE_URL}/users    json=${user_data}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log    User created with response: ${response.json()}

Retrieve User
    [Documentation]    This keyword sends a GET request to retrieve the created user.
    ${user_id}=    Set Variable    1
    ${response}=    GET    ${BASE_URL}/users/${user_id}
    Should Be Equal As Numbers    ${response.status_code}    200
    ${user_data}=    Evaluate    ${response.json()}
    Should Be Equal    ${user_data.name}    Leanne Graham
    Log    Retrieved user data: ${user_data}
