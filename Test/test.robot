*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}      Chrome
${Username}     admin
${Password}     nimda
${Delay}        3s

*** Test Cases ***
This is the title of the test case
    Open Browser	https://ssa-test.scapp.io	${Browser}
    sleep   ${Delay}
    Enter User Name
    Enter Password
    Click Login

    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/aside/nav/ul/li[5]/a
    Click Massnahmen

    # zuerst menü wieder zuklappen, sonst click nicht möglich
    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/aside/nav/div[1]
    Click Minify

    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div[3]/div/div/div/div/div[2]/div/div[2]/div/div
    Click Hinzufuegen

    Wait Until Element Is Visible   xpath=/html/body/div[1]/div/div[3]/div/div[1]/div[2]/div[3]/div[1]
    Click Speichern

*** Keywords ***
Enter User Name
    Input Text  id=login-email  ${Username}

Enter Password
    Input Text  name=Passwort     ${Password}

Click Login
    Click Element   xpath=/html/body/div[1]/div/div/div/section/div/div/div/div[2]/div[1]/div/form/section[3]/div[1]

Click Massnahmen
    Click Element   xpath=/html/body/div[1]/div/aside/nav/ul/li[5]/a

Click Hinzufuegen
    Click Element   xpath=/html/body/div[1]/div/div[3]/div/div/div/div/div[2]/div/div[2]/div/div

Click Speichern
    Click Element   xpath=/html/body/div[1]/div/div[3]/div/div[1]/div[2]/div[3]/div[1]

Click Minify
    Click Element  xpath=/html/body/div[1]/div/aside/nav/div[1]