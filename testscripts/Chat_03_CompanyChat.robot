*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run keywords    Open Torn Browser    AND    Join To Company    AND    Switch Browser    ${FirefoxID}    AND    Open Group Chat    Company
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
Default Tags     test
*** Test Cases ***
CompanyChat 01 - Collapse and Expand
    Log To Console    CompanyChat 01 - Collapse and Expand   
    Log To Console    Step 01: Verify chat room is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Company
    
    Log To Console    Step 02: Verify scroll function properly works
    Verify Scroll Function Work Properly    Company
    
    Log To Console    Step 03: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    Company
    
    Log To Console    Step 04: Verify Company chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Company
    [Teardown]    Open Group Chat    Company
    
CompanyChat 02 - Apply Notification - Disable
    Log To Console    CompanyChat 02 - Apply Notification - Disable    
    Log To Console    Step 01: Setting Company is disable    
    Setting For Chatroom    Company    Disable

    Log To Console    Step 02: Verify Company chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Company     
    
    [Teardown]    Open Group Chat    Company
    
CompanyChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    CompanyChat 03 - Apply Notification - Enable - Send/Receive Message
    Switch Browser    ${ChromeID}

    Log To Console    Step 01: Setting Company is enable
    Setting For Chatroom    Company    Enable
    
    Log To Console    Step 02: Verify Company chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Company    
    
    Log To Console    Step 03: Minimize Company chat
    Minimize Chatroom    Company
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Company chat
    Switch Browser    ${FirefoxID}
    Sleep    5s
    Send Message To Chatroom    Company    
    
    Log To Console    Step 05: Switch to Chrome and verify no unread message count displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Company

    Log To Console    Step 06: Open Company chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Company    
    
    Log To Console    Step 07: Verify received message is correct
    Verify Message Display In Chatroom    Company
    
CompanyChat 04 - Apply Notification - Flash Notifier
    Log To Console    CompanyChat 04 - Apply Notification - Flash Notifier
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Company is Flash Notifier   
    Setting For Chatroom    Company    Flash notifier
    
    Log To Console    Step 02: Verify Company chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Company      
    
    Log To Console    Step 03: Minimize Company chat
    Minimize Chatroom    Company
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Company chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Company  
      
    Log To Console    Step 05: Switch to Chrome and verify unread message count is correct
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    1    Company
    
    Log To Console    Step 06: Open Company chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Company   
    
    Log To Console    Step 07: Verify unread message count disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Company
    
    Log To Console    Step 08: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Company
    
CompanyChat 05 - Apply Notification - Flash and Sound
    Log To Console    CompanyChat 05 - Apply Notification - Flash and Sound
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Company is Flash Notifier   
    Setting For Chatroom    Company    Flash & sound
    
    Log To Console    Step 02: Verify Company chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Company    
    
    Log To Console    Step 03: Minimize Company chat
    Minimize Chatroom    Company
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Company chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Company  
      
    Log To Console    Step 05: Switch to Chrome and verify unread message count is correct
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    1    Company
    
    Log To Console    Step 06: Open Company chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Company   
    
    Log To Console    Step 07: Verify unread message count disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Company
    
    Log To Console    Step 08: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Company
