*** Settings ***
Library         ../app.py
Library         SeleniumLibrary
Library         OperatingSystem
Resource        ./functions/login_functions.robot
Resource        ./browser_functions.robot
Resource        ./functions/plugininstal.robot 
Resource        ./functions/cookieconfig.robot
Resource        ./functions/config/functionsconfig.robot
Resource        ./functions/config/exludethemes.robot