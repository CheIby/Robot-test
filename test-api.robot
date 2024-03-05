*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${BASE_URL}    http://localhost:3001

*** Keywords ***

Get Plus JSON
    [Arguments]    ${num1}    ${num2}
    ${resp}=     GET    ${BASE_URL}/plus/${num1}/${num2}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}

Get Is_Prime JSON
    [Arguments]    ${num} 
    ${resp}=     GET    ${BASE_URL}/is_prime/${num}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}

Get Is_1_Honor JSON
    [Arguments]    ${grade} 
    ${resp}=     GET    ${BASE_URL}/is1honor/${grade}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}

*** Test Cases ***
Test Plus Numbers 4 and 2 (ฺBefore Using Keywords)

    ${resp}=     GET    ${BASE_URL}/plus/4/2

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${json_resp}    ${6}

Test Plus Numbers 5 and 6 (ฺBefore Using Keywords)

    ${resp}=     GET    ${BASE_URL}/plus/5/6

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${json_resp}    ${11}


Test Calculate Numbers 3 and 4

    ${json_resp}=    Get Plus JSON    ${4}    ${2}

    Should Be Equal    ${json_resp}    ${6}

Test Is_Prime Number 17
    ${json_resp}=    Get Is_Prime JSON   ${17}  

    Should Be Equal    ${json_resp}    ${true}

Test Is_Prime Number 36 (ฺBefore Using Keywords)

    ${resp}=     GET    ${BASE_URL}/is_prime/36

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${json_resp}    ${false}

Test Is_Prime Number 13219
    ${json_resp}=    Get Is_Prime JSON   ${13219}  

    Should Be Equal    ${json_resp}    ${true}

Test Is_1_Honor 3.6
    ${json_resp}=    Get Is_1_Honor JSON   ${3.6}  

    Should Be Equal    ${json_resp}    ${true}


Test Is_1_Honor 3.5
    ${json_resp}=    Get Is_1_Honor JSON   ${3.5}  

    Should Be Equal    ${json_resp}    ${true}


Test Is_1_Honor 3.6
    ${json_resp}=    Get Is_1_Honor JSON   ${3.4}  

    Should Be Equal    ${json_resp}    ${false}