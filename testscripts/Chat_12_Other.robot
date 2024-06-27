*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run Keywords    Open Torn Browser    AND    Join To Faction    AND    Close All Browser And Kill Related Process
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error   Close All Browser And Kill Related Process

*** Test Cases ***
Other 01 - Player Status
    Log To Console    Other 01 - Player Status
    Log To Console    Step 01: Open one browser with one account
    Open Torn Browser With One Account    ${Account_Firefox}    Firefox
    
    Log To Console    Step 02: Send a new message to "${Account_Chrome}[Name]" from friend tab
    Open Chatroom From Friend Tab    ${Account_Chrome}
    Send Message To Chatroom    ${Account_Chrome}[Name]    
    
    Log To Console    Step 03: Verfify status of player in Chat Header is offline
    Dynamic Element Attribute Value Should Contain    offline    class    ${Chatroom_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
    Click Dynamic Element     ${Chatroom_button_DynamicMinimizeButton}    ${Account_Chrome}[Name]
    
    Log To Console    Step 04: Verfify status of player in minimized chat is offline
    Dynamic Element Attribute Value Should Contain    offline    class    ${Chatroom_status_DynamicPlayerStatusInMinimizedChatByName}      ${Account_Chrome}[Name] 
    
    Log To Console    Step 05: Open Chats tab and verify status is offline
    Open Subtab In Chat Panel    Chats
    Dynamic Element Attribute Value Should Contain    offline    class    ${ChatPanel-Chats_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
    
    Log To Console    Step 06: Open Met tab and verify status is offline
    Open Subtab In Chat Panel    Met
    Dynamic Element Attribute Value Should Contain    offline    class    ${ChatPanel_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
    
    Log To Console    Step 07: Open Friends tab and verify status is offline
    Open Subtab In Chat Panel    Friends
    Dynamic Element Attribute Value Should Contain    offline    class    ${ChatPanel_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
    
    Log To Console    Step 08: Open Faction tab and verify status is offline
    Open Subtab In Chat Panel    Faction
    Dynamic Element Attribute Value Should Contain    offline    class    ${ChatPanel_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
    Set Browser To The Position    RIGHT
    
    Log To Console    Step 09: Login with "${Account_Chrome}[Name]"
    Open Torn Browser With One Account    ${Account_Chrome}    Chrome
    Set Browser To The Position    LEFT
    
    Log To Console    Step 10: Black to "${Account_Firefox}[Name]" account
    Switch Browser    ${FirefoxID}
    
    Log To Console    Step 11: Verfify status of player in minimized chat is online
    Wait Until Dynamic Element Is Visible With Timeout    35s    ${Chatroom_status_DynamicOnlineStatusInMinimizedChatByName}    ${Account_Chrome}[Name] 
    Click Dynamic Element     ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Chrome}[Name]
    
    Log To Console    Step 03: Verfify status of player in Chat Header is online
    Dynamic Element Attribute Value Should Contain    online    class    ${Chatroom_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
    Click Dynamic Element    ${Chatroom_button_DynamicCloseButton}    ${Account_Chrome}[Name]
    
    Log To Console    Step 05: Open Chats tab and verify status is online
    Open Subtab In Chat Panel    Chats
    Dynamic Element Attribute Value Should Contain    online    class    ${ChatPanel-Chats_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
    
    Log To Console    Step 06: Open Met tab and verify status is online
    Open Subtab In Chat Panel    Met
    Dynamic Element Attribute Value Should Contain    online    class    ${ChatPanel_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
    
    Log To Console    Step 07: Open Friends tab and verify status is online
    Open Subtab In Chat Panel    Friends
    Dynamic Element Attribute Value Should Contain    online    class    ${ChatPanel_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
    
    Log To Console    Step 08: Open Faction tab and verify status is online
    Open Subtab In Chat Panel    Faction
    Dynamic Element Attribute Value Should Contain    online    class    ${ChatPanel_status_DynamicPlayerStatusByName}      ${Account_Chrome}[Name] 
