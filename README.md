# Test-Automatisierung

Test automatisierung anhand von Robotframework für Python+Selenium

## Set-up

prequisites:
- python
- pip  
    on windows  
    python -m pip install -U pip

install robotframework
```bash
pip install robotframework
robot --version
rebot --version

pip install robotframework-selenium2library # for python 2.7
# or
pip install robotframework-selenium2library # for python 3
```
download selenium webdrivers from the website: https://www.selenium.dev/downloads/
-> "Browsers"
add webdriver to PATH
Linux: download geckodriver to "/usr/local/bin"
```bash
cd /usr/local/bin
sudo chmod +x geckodriver
export PATH=$PATH:/usr/local/geckodriver
```

## Basics
-> tab between setting and value!
```txt
*** Settings ***
Library SeleniumLibrary
```
