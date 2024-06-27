*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Suite Setup
Test Teardown    Run Keyword and Ignore Error    Take Screenshot When Test Failed
Suite Teardown    Close All Browser And Kill Related Process
Default Tags     test
*** Test Cases ***
Faction 01 - Load Met List
    Log To Console    Faction 01 - Load Met List
    Open Subtab In Chat Panel    Faction
    
    Log To Console    Step 01: Verify having players in Faction list
    Wait Until Page Contains Element "${ChatPanel-Faction_button_AllUsers}"

Faction 02 - Init Chat
    Log To Console    Faction 02 - Init Chat
    Log To Console    Step 01: Open Met List
    Open Subtab In Chat Panel    Faction
    
    Log To Console    Step 02: Get the first member from Faction list
    ${name}=    Get Text In Element "${ChatPanel-Faction_button_FirstUser}"
    Log To Console    First user is "${name}"
    
    Log To Console    Step 02: Click to chat icon in Faction list
    Click Dynamic Element    ${ChatPanel-Met_button_DynamicChatIconByName}    ${name}
    
    Log To Console    Step 03: Verify Chatroom is openned
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${name}
    
    Log To Console    Step 04: Send a new message
    Send Message To Chatroom    ${name}
    
    Log To Console    Step 05: Open Chats list
    Open Subtab In Chat Panel    Chats
    
    Log To Console    Step 06: Verify chatroom and a new message display in Chats list
    ${actual_last_message}    Get Text In Element "${ChatPanel-Chats_button_LastMessageOfFirstRoom}"
    Should Be Equal    ${Account_Chrome}[Name] : ${message}    ${actual_last_message}
    
*** Keywords ***
Suite Setup
    Open Torn Browser    
    Join To Faction
    Close All Browser And Kill Related Process
    Open Torn Browser With One Account
    







