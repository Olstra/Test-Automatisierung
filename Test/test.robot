*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}      Firefox
${Username}     admin
${Password}     nimda
${Delay}        5s

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
    Input Text  name=Password   ${Password}

Click Login
    Click Button    type=submit