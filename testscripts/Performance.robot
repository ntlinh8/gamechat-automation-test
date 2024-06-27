*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Open Torn Browser    ${AccountA_Chrome}    ${AccountB_Firefox}
Test Teardown    Run Keyword and Ignore Error    Take Screenshot When Test Failed
Suite Teardown    Close All Browser And Kill Related Process
*** Variables ***
&{AccountA_Chrome}    ID=3150609    Name=JennyTa12     Email=jenny+12@ddxtransformation.com    Password=Anh@12345    cf_clearance=ZQ6atAoVcnJJuaegYnCpRk.FERSCGvDJvqhAngHiVuQ-1705568726-1-AfubedZVvPVBReH0qYb2D6y8688L+le83hGFZtwANW1+jSuwbeoEl+FrNYzD32aqmgh2n+zCVCnLxzbnGW47zaU=    at=at4d819b0d7dfa0efba4af93b028d6eb20    at_value=5138271e4ad3a141ebd3725813f45225
&{AccountB_Firefox}    ID=3150608    Name=JennyTa11     Email=jenny+11@ddxtransformation.com    Password=Anh@12345    cf_clearance=_Zezvv3M_iEUfD3Rx1MVSChjNiWRfnZQoHOCK.LLVWU-1705550226-1-AYIty/rMqQRBUbj9IDZJRCkNRfh42dXFbvbl/p80iLQSXYhtuZLBMa7a54p9pF1mrHFBroWjpqLwTTc6Bmjm4Rs=    at=at2a45d3d06c4e43c1af83342b285e0812    at_value=fb58e8119b48e6166590b46e44d1e9fe

${limited_tab_number}    2
@{tab_id_list}    ${EMPTY}
${missed_message_number}    ${0}

*** Test Cases ***
Multiple Tab
    Log To Console    ================== Multiple Tab ================== 
    Log To Console    ==== Step 01: Switch to Chrome, open 5 tabs: New Players, Trade, Faction, Company, and Private Chat with "${AccountB_Firefox}[Name]"
    Switch Browser    ${ChromeID}
    Maximize Browser Window
    Open Group Chat    New players
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    New players
    Open Group Chat    Trade
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Trade
    Open Group Chat    Faction
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Faction
    Open Group Chat    Company
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Company
    Sleep    2s    
    Open Chatroom From Profile Page    ${AccountB_Firefox}
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${AccountB_Firefox}[Name]
    
    Log To Console    ==== Step 02: Switch to Firefox, send a new message to Private Chat, Faction, Company chat
    Switch Browser    ${FirefoxID}
    Maximize Browser Window
    Open Group Chat    New players
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    New players
    Open Group Chat    Trade
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Trade
    Open Group Chat    Faction
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Faction
    Open Group Chat    Company
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Company
    Sleep    2s    
    Open Chatroom From Profile Page    ${AccountA_Chrome}
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${AccountA_Chrome}[Name]
    
    Send Message To Chatroom Without Verify    Faction    
    ${faction_message}=    Set Variable    ${message}
    Send Message To Chatroom Without Verify    Company    
    ${company_message}=    Set Variable    ${message}
    Send Message To Chatroom Without Verify    ${AccountA_Chrome}[Name]    
    ${private_message}=    Set Variable    ${message}
    
    Log To Console    ==== Step 03: Switch to Chrome, verify received messages are correct
    Switch Browser    ${ChromeID}
    Verify Message Display In Chatroom And Continue On Failure    Faction    ${faction_message}
    Verify Message Display In Chatroom And Continue On Failure    Company    ${company_message}
    Verify Message Display In Chatroom And Continue On Failure    ${AccountA_Chrome}[Name]    ${private_message}
    
    Log To Console    ==== Step 04: Open ${limited_tab_number} tabs 
    FOR    ${i}    IN RANGE    1    ${limited_tab_number}+1
        ${path}=    Get Attribute "href" In Element "(${Main_link_AllSideBarLinks})[${i}]"
        Log To Console    Open tab "${i}"
        ${id}=    Open New Tab With URL    ${BASE_URL}${path}
        Log To Console    Verify open tab "${i}" successful
        Wait Until Page Ready
        Wait Until Dynamic Element Is Visible    ${Main_button_DynamicButtonByClass}    chat-list-button  
        Wait Until Element "${Main_button_AllMinimizedChat}" Is Visible
        Append To List    ${tab_id_list}    ${id}  
    END
    Switch Window    MAIN

    Log To Console    ========== Start Chat ========== 
    FOR    ${i}    IN RANGE    1    ${limited_tab_number}+1
        Log To Console    ==== Iteration: "${i}" ====
        ${id}=    Get From List    ${tab_id_list}    ${i}
        
        Log To Console    Switch to Firefox and send a new message to Private Chat, Faction, Company chat
        Switch Browser    ${FirefoxID}
        Send Message To Chatroom Without Verify    Faction    
        ${faction_message}=    Set Variable    ${message}
        Send Message To Chatroom Without Verify    Company    
        ${company_message}=    Set Variable    ${message}
        Send Message To Chatroom Without Verify    ${AccountA_Chrome}[Name]    
        ${private_message}=    Set Variable    ${message}
        
        
        Log To Console    Switch To Chrome and select the new tab with index "${i}"
        Switch Browser    ${ChromeID}
        Switch Window    ${id}
        
        Log To Console    Verify received message are correct
        Verify Message Display In Chatroom And Continue On Failure    Faction    ${faction_message}
        Verify Message Display In Chatroom And Continue On Failure    Company    ${company_message}
        Verify Message Display In Chatroom And Continue On Failure    ${AccountA_Chrome}[Name]    ${private_message}
    END
    Log To Console    ===================================    
    ${total_message}=    Evaluate    ${limited_tab_number}*3    
    Log To Console    ====== RESULT: Missed Messages: "${missed_message_number}" out of "${total_message}" ======
     
*** Keywords ***
Send Message To Chatroom Without Verify
    [Arguments]    ${chatroom_name}    ${value}=This is Automation Test from Torn. Please ignore-
    Log To Console    Send Message To Chatroom    
    ${time}=    Get Current Date    result_format=%m%d%H%M%S
    Set Global Variable    ${message}    ${value}${time}
    
    Log To Console    Send "${message}" message to chatroom  
    Clear And Input Text In Dynamic Element    ${message}    ${Chatroom_input_DynamicChatTextBoxByChatname}    ${chatroom_name}
    Sleep    1s
    Press Keys    ${None}    ENTER
    Wait Until Page Ready
    
Verify Message Display In Chatroom And Continue On Failure
    [Arguments]    ${chatroom_name}    ${expected_message}
    Log To Console    Verify "${expected_message}" Message Display In Chatroom    
    Wait Until Page Ready
    Wait "15s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    ${is_passed}=    Run Keyword And Return Status    Wait "40s" Until Page Source Contain "${expected_message}"    
    Run Keyword If    "${is_passed}"=="False"
    ...    Run Keywords    Increate Missed Message Number
    ...    AND    Run Keyword And Continue On Failure    Fail    Cannot receive: "${expected_message}"

Increate Missed Message Number
    ${after_missed_message_number}=    Evaluate    ${missed_message_number}+1    
    Set Global Variable    ${missed_message_number}    ${after_missed_message_number}