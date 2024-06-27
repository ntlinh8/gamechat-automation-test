*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run Keywords    Suite Setup
Test Teardown    Run Keyword and Ignore Error    Take Screenshot When Test Failed
Suite Teardown    Close All Browser And Kill Related Process
Default Tags     test
*** Test Cases ***
Met 01 - Load Met List
    Log To Console    Met 01 - Load Met List
    Open Subtab In Chat Panel    Met
    
    Log To Console    Step 01: Verify having players in Met list
    Wait Until Page Contains Element "${ChatPanel-Met_button_AllUserInMetList}"

Met 02 - Init Chat
    Log To Console    Met 02 - Init Chat
    Log To Console    Step 01: Open Met List
    Open Subtab In Chat Panel    Met
    
    Log To Console    Step 02: Click to chat icon in Met list
    Click Dynamic Element    ${ChatPanel-Met_button_DynamicChatIconByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 03: Verify Chatroom is openned
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 04: Send a new message
    Send Message To Chatroom    ${Account_Firefox}[Name]    
    
    Log To Console    Step 05: Open Chats list
    Open Subtab In Chat Panel    Chats
    
    Log To Console    Step 06: Verify chatroom and a new message display in Chats list
    ${actual_last_message}    Get Text In Element "${ChatPanel-Chats_button_LastMessageOfFirstRoom}"
    Should Be Equal    ${Account_Chrome}[Name] : ${message}    ${actual_last_message}
    
Met 03 - Delete Player In Met List
    Log To Console    Met 03 - Delete Player In Met List
    Log To Console    Step 01: Open Met List
    Open Subtab In Chat Panel    Met
    
    Log To Console    Step 02: Click to delete icon in Met list
    Click Dynamic Element    ${ChatPanel-Met_button_DynamicDeleteIconByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 03: Verify Player is not exist in Met list
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${ChatPanel-Met_text_DynamicFriendByName}    ${Account_Firefox}[Name]
    
Met 04 - Add Player To Met List
    Log To Console    Met 04 - Add Player To Met List
    Log To Console    Step 01: Send a new message
    Send Message To Chatroom    ${Account_Firefox}[Name]    
    
    Log To Console    Step 02: Open Met List
    Open Subtab In Chat Panel    Met
    
    Log To Console    Step 03: Verify Player is exist in Met List
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Met_text_DynamicFriendByName}    ${Account_Firefox}[Name]
    
*** Keywords ***
Suite Setup
    Log To Console    Suite Setup
    Log To Console    Open Torn Browser With One Account
    Open Torn Browser With One Account
    Open Chatroom From Profile Page    ${Account_Firefox}
    Log To Console    Send Message To Chatroom
    Send Message To Chatroom    ${Account_Firefox}[Name]
    Log To Console    Close Chat room
    Click Dynamic Element    ${Chatroom_button_DynamicCloseButton}    ${Account_Firefox}[Name]
    Wait Until Dynamic Element Is Not Visible   ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]
    Wait Until Dynamic Element Is Not Visible   ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]









