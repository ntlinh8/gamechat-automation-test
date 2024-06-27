*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run Keywords    Open Torn Browser With One Account
Test Teardown    Run Keyword and Ignore Error    Take Screenshot When Test Failed
Suite Teardown    Run Keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
Default Tags     test
*** Test Cases ***
Chats 01 - Load Chats List
    Log To Console    Chats 01 - Load Chats List    
    
    Log To Console    Step 01: Open Chats list
    Open Subtab In Chat Panel    Chats
    
    Log To Console    Step 02: Verify Chats menu is selected
    Dynamic Element Attribute Value Should Contain    active    class    ${ChatPanel_button_DynamicMenuByLabel}    Chats
    
    Log To Console    Step 03: Verify load chat rooms successful
    Wait Until Page Contains Element "${ChatPanel-Chats_button_AllChatrooms}"

Chats 02 - Add A New Chat
    Log To Console    Chats 02 - Add A New Chat
    
    Log To Console    Step 01: Open chatroom from Profile
    Open Chatroom From Profile Page    ${Account_Firefox}
    
    Log To Console    Step 02: Send a new messsage
    Send Message To Chatroom    ${Account_Firefox}[Name]   
     
    Log To Console    Step 03: Close Chatroom
    Click Dynamic Element    ${Chatroom_button_DynamicCloseButton}    ${Account_Firefox}[Name]
    
    Log To Console    Step 04: Verify chat is closed
    Wait Until Dynamic Element Is Not Visible   ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]
    Wait Until Dynamic Element Is Not Visible   ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 05: Open Chat List
    Open Subtab In Chat Panel    Chats
    
    Log To Console    Step 06: Verify the first chatroom is correct
    ${first_room_name}    Get Text In Element "${ChatPanel-Chats_button_FirstRoom}"
    Should Be Equal    ${first_room_name}    ${Account_Firefox}[Name]    
    
    Log To Console    Step 07: Verify the message is correct
    ${actual_last_message}    Get Text In Element "${ChatPanel-Chats_button_LastMessageOfFirstRoom}"
    Should Be Equal    ${Account_Chrome}[Name] : ${message}    ${actual_last_message}
    
Chats 03 - Init A Private Chat
    Log To Console    Chats 03 - Init A Private Chat
    
    Log To Console    Step 01: Open Chat List
    Open Subtab In Chat Panel    Chats
    
    Log To Console    Step 02: Get the first room
    ${first_room_name}    Get Text In Element "${ChatPanel-Chats_button_FirstRoom}"
    
    Log To Console    Step 03: Click to the first room
    Click Element "${ChatPanel-Chats_button_FirstRoom}"
    
    Log To Console    Step 04: Verify chatroom is open
    Wait Until Dynamic Element Is Visible   ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${first_room_name}