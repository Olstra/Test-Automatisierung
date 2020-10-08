*** Settings ***
Library  SeleniumLibrary

# TODO ->Datum für Kurzbeschreibung benutzen
*** Variables ***

[Timeout]   10
${Browser}      Chrome
${Username}     admin
${Password}     nimda
${Delay}        3s

${Massnahmen}           xpath=//body/div[@id='smartadmin-root']/div[1]/aside[1]/nav[1]/ul[1]/li[5]/a[1]

${Hinzufügen}           xpath=/html/body/div[1]/div/div[3]/div/div/div/div/div[2]/div/div[2]/div/div

${Kurzbeschreibung}     xpath=//body/div[@id='smartadmin-root']/div[1]/div[3]/div[1]/div[1]/div[2]/div[2]/section[1]/div[1]/div[1]/div[1]/div[1]/section[1]/div[1]/fieldset[1]/div[4]/section[1]/section[1]/label[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]

${Text}                 Test-Oliver2020
${Dropdown}             xpath=/html/body/div[1]/div/div[3]/div/div[1]/div[2]/div[2]/section/div/div/div/div/section/div/fieldset[3]/div[4]/section/section/label/div/div[3]

*** Test Cases ***
This is the title of the test case
    Open Browser	https://ssa-test.scapp.io	${Browser}
    sleep   ${Delay}
    Enter User Name
    Enter Password
    Click Login

    Wait Until Element Is Visible   xpath=//body/div[@id='smartadmin-root']/div[1]/aside[1]/nav[1]/ul[1]/li[5]/a[1]
    # wait until loading spinner isn't visible anymore (otherwise click on spinner bg)
    Wait Until Element Is Not Visible   10s     class=loader-bg
    Click Element   ${Massnahmen}

    # zuerst menü wieder zuklappen, sonst click nicht möglich
    #Wait Until Element Is Visible   xpath=/html/body/div[1]/div/aside/nav/div[1]
    #Click Minify

    #Wait Until Element Is Visible   ${Hinzufügen}
    #Click Element   ${Hinzufügen}

    # öbbis ih "Kurzbeschreibung" schriibe
    #Wait Until Element Is Visible   ${Kurzbeschreibung}
    #Add Kurzbeschreibung

    #Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div[3]/div/div[1]/div[2]/div[3]/div[1]
    #Click Speichern

*** Keywords ***
Enter User Name
    Input Text  id=login-email  ${Username}

Enter Password
    Input Text  name=Passwort   ${Password}

Click Login
    Click Element   xpath=/html/body/div[1]/div/div/div/section/div/div/div/div[2]/div[1]/div/form/section[3]/div[1]

Click Speichern
    Click Element   xpath=/html/body/div[1]/div/div[3]/div/div[1]/div[2]/div[3]/div[1]

Click Minify
    Click Element  xpath=/html/body/div[1]/div/aside/nav/div[1]

Add Kurzbeschreibung
    Input Text  ${Kurzbeschreibung}   Test-Oliver