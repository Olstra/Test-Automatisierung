# this is a basic Login testcase for SUVA SSA

*** Settings ***
Library  SeleniumLibrary

# TODO ->Datum für Kurzbeschreibung benutzen
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

*** Keywords ***
Enter User Name
    Input Text  id=login-email  ${Username}

Enter Password
    Input Text  name=Passwort   ${Password}

Click Login
    Click Element   xpath=/html/body/div[1]/div/div/div/section/div/div/div/div[2]/div[1]/div/form/section[3]/div[1]