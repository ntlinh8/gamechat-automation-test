*** Settings ***
Resource    ../common/settings.robot
# Suite Setup    Setup Before All Suites

*** Keywords ***
Setup Before All Suites
    Log To Console    Setup Before All Suites
    Load Data From Json
    Setup Travelling Accounts
    
Load Data From Json
    Log To Console    Load Data From Json
    ${json_file_path}    Set Variable    common/${env}_${pc}.json
    ${json_content}      Get File           ${json_file_path}
    #Chrome
    &{Account_Chrome}               Evaluate    json.loads('''${json_content}''')['Account_Chrome_${env}']    json
    &{Account_ChromeHospital}       Evaluate    json.loads('''${json_content}''')['Account_ChromeHospital_${env}']    json
    &{Account_ChromeTravel}         Evaluate    json.loads('''${json_content}''')['Account_ChromeTravel_${env}']    json

    #Firefox
    &{Account_Firefox}                Evaluate    json.loads('''${json_content}''')['Account_Firefox_${env}']    json
    &{Account_FirefoxNewPlayer}       Evaluate    json.loads('''${json_content}''')['Account_FirefoxNewPlayer_${env}']    json
    &{Account_FirefoxStaff}       Evaluate    json.loads('''${json_content}''')['Account_FirefoxStaff_${env}']    json
    &{Account_FirefoxTravel}       Evaluate    json.loads('''${json_content}''')['Account_FirefoxTravel_${env}']    json

    Set Global Variable    &{Account_Chrome}
    Set Global Variable    &{Account_ChromeHospital}
    Set Global Variable    &{Account_ChromeTravel}

    Set Global Variable    &{Account_Firefox}
    Set Global Variable    &{Account_FirefoxNewPlayer}
    Set Global Variable    &{Account_FirefoxStaff}
    Set Global Variable    &{Account_FirefoxTravel}

Setup Travelling Accounts
    Log To Console    Setup Travelling Accounts
    Log To Console    Open Torn Page and login
    Open Torn Browser    ${Account_ChromeTravel}    ${Account_FirefoxTravel}
    Log To Console    Switch to Chrome and join to Travel chat
    Switch Browser    ${ChromeID}
    Join To Travel Chat
    Set Browser To The Position    LEFT
    Log To Console    Switch to Firefox and join to Travel chat
    Switch Browser    ${FirefoxID}
    Join To Travel Chat
    Set Browser To The Position    RIGHT
    Close All Browser And Kill Related Process