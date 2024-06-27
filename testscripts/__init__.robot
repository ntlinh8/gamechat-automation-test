*** Settings ***
Resource    ..//common//settings.robot
Suite Setup    Setup Before All Suites

*** Variables ***
${isSetupTravel}     ${False}

*** Keywords ***
Setup Before All Suites
    Log To Console    Setup Before All Suites
    Load Data From Json
    Run Keyword If    "${isSetupTravel}"=="True"
    ...    Setup Travelling Accounts
    
Load Data From Json
    Log To Console    Load Data From Json
    ${json_file_path}    Set Variable    common/${pc}.json
    ${json_content}      Get File           ${json_file_path}
    &{Account_Chrome}                    Evaluate    json.loads('''${json_content}''')['Account_Chrome']    json
    &{Account_Chrome_Backup}             Evaluate    json.loads('''${json_content}''')['Account_Chrome_Backup']    json
    &{Account_ChromeHospital}            Evaluate    json.loads('''${json_content}''')['Account_ChromeHospital']    json
    &{Account_ChromeTravel}              Evaluate    json.loads('''${json_content}''')['Account_ChromeTravel']    json
    &{Account_Firefox}                   Evaluate    json.loads('''${json_content}''')['Account_Firefox']    json
    &{Account_FirefoxNewPlayer}          Evaluate    json.loads('''${json_content}''')['Account_FirefoxNewPlayer']    json
    &{Account_FirefoxStaff}              Evaluate    json.loads('''${json_content}''')['Account_FirefoxStaff']    json
    &{Account_FirefoxTravel}             Evaluate    json.loads('''${json_content}''')['Account_FirefoxTravel']    json
    &{Account_FirefoxBackup}             Evaluate    json.loads('''${json_content}''')['Account_FirefoxBackup']    json
    &{Account_FirefoxSynchronize}             Evaluate    json.loads('''${json_content}''')['Account_Firefox_Synchronize']    json


    Set Global Variable    &{Account_Chrome}
    Set Global Variable    &{Account_Chrome_Backup}
    Set Global Variable    &{Account_ChromeHospital}
    Set Global Variable    &{Account_ChromeTravel}

    Set Global Variable    &{Account_Firefox}
    Set Global Variable    &{Account_FirefoxNewPlayer}
    Set Global Variable    &{Account_FirefoxStaff}
    Set Global Variable    &{Account_FirefoxTravel}
    Set Global Variable    &{Account_FirefoxBackup}
    Set Global Variable    &{Account_FirefoxSynchronize}

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
