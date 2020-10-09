*** Settings ***
Library     SeleniumLibrary
Library     DateTime

*** Variables ***
${Browser}      Chrome
${Delay}        30s

# Login-SSA variables
${Username}     oli+13@sobr.ch
${Password}     1aA@0000
${Anmelden}     xpath=/html/body/div[1]/div/div/div/section/div/div/div/div[2]/div[1]/div/form/section[3]/div[1]

# Feedback Audit variables
${Feedback}     class=icon-feedback-menu
# click inside field and set name per manual input
${Empfaenger}   xpath=//*[@id="field-value-list"]/fieldset[1]/div[2]/section/section/div/div/div/label/div/input
${Positiv}      xpath=//*[@id="content"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr[1]/td[5]/div/div/div/span/span[1]/span

${Hinzufügen}   xpath=//div[contains(text(),'Hinzufügen')]
${Speichern}    class=save-text

# check values
${NewEmpfaenger}    xpath=//*[@id="content"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr[1]/td[6]/div/div/div/span/span[1]/span
${Bewertung}        xpath=//*[@id="content"]/div/div/div[2]/div/div[1]/div/div[2]/table/tbody/tr[1]/td[5]/div/div/div/span/span[1]/span

# für die Kontrolle - Datum+Uhrzeit benutzen
*** Test Cases ***
Man kann eine neue Information erzeugen
    Login-SSA

    # wait until loading spinner isn't visible anymore (otherwise click on spinner bg)
    Wait For Loading Spinner

    Click Element   ${Feedback}

    # neues Feedback erfassen
    Wait Until Element Is Visible   ${Hinzufügen}   ${Delay}
    Click Element   ${Hinzufügen}

    # Attribute für Feedback setzen
    Wait Until Element Is Visible   ${Positiv}      ${Delay}
    Click Element   //*[contains(text(),'Positiv')]
    ${Date}=   Get Current Date    result_format=%d.%m.%Y | %H:%M
    Input Text      ${Empfaenger}    ${Date}

    Click Element   ${Speichern}

    # check values of new entry
    Wait Until Element Is Not Visible   class=loader-bg     ${Delay}
    Element Text Should Be    ${NewEmpfaenger}  ${Date}
    Element Text Should Be    ${Bewertung}      Positiv


*** Keywords ***
Login-SSA
    Open Browser	https://ssa-test.scapp.io	${Browser}
    Maximize Browser Window
    Wait Until Element Is Visible               ${Anmelden}
    Input Text      id=login-email              ${Username}
    Input Text      name=Passwort               ${Password}
    Click Element                               ${Anmelden}

Wait For Loading Spinner
    Sleep   10s
    Wait Until Element Is Not Visible   class=loader-bg     ${Delay}
    Wait Until Element Is Visible       ${Feedback}    ${Delay}