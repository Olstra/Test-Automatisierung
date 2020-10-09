*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}      Chrome
${Delay}        20s

# Login-SSA variables
${Username}     oli+13@sobr.ch
${Password}     1aA@0000
${Anmelden}     xpath=/html/body/div[1]/div/div/div/section/div/div/div/div[2]/div[1]/div/form/section[3]/div[1]

${Massnahmen}           xpath=//body/div[@id='smartadmin-root']/div[1]/aside[1]/nav[1]/ul[1]/li[5]/a[1]
${Hinzufügen}           xpath=//div[contains(text(),'Hinzufügen')]
${Kurzbeschreibung}     xpath=//body/div[@id='smartadmin-root']/div[1]/div[4]/div[1]/div[1]/div[2]/div[2]/section[1]/div[1]/div[1]/div[1]/div[1]/section[1]/div[1]/fieldset[1]/div[4]/section[1]/section[1]/label[1]/div[1]/div[1]/div[1]
${Text}                 Test-Oliver2020
${Speichern}            class=save-text

${aaa}  xpath=//*[@id="field-value-list"]/fieldset[1]/div[4]/section/section/label/span


*** Test Cases ***
Man kann eine neue MASSNAHME erzeugen
    Login-SSA

    # wait until loading spinner isn't visible anymore (otherwise click on spinner bg)
    Wait For Loading Spinner

    Click Element   ${Massnahmen}

    Wait Until Element Is Visible   ${Hinzufügen}
    Click Element   ${Hinzufügen}

    # öbbis ih "Kurzbeschreibung" schriibe
    Wait Until Element Is Visible   ${aaa}    ${Delay}
    Click Element   ${Kurzbeschreibung}
    Sleep   5s
    Input Text  ${Kurzbeschreibung}   Test-Oliver

    Click Element   ${Speichern}

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
    Wait Until Element Is Visible       ${Massnahmen}    ${Delay}

Click Minify
    Click Element  xpath=/html/body/div[1]/div/aside/nav/div[1]