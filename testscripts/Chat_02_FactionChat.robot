*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run keywords    Open Torn Browser     AND    Join To Faction    AND    Switch Browser    ${FirefoxID}    AND    Open Group Chat    Faction
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process

*** Test Cases ***
FactionChat 01 - Collapse and Expand
    Log To Console    FactionChat 01 - Collapse and Expand    
    Log To Console    Step 01: Verify chat room is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Faction
    
    Log To Console    Step 02: Verify scroll function properly works
    Verify Scroll Function Work Properly    Faction
    
    Log To Console    Step 03: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    Faction
    
    Log To Console    Step 04: Verify Faction chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Faction
    [Teardown]    Open Group Chat    Faction
    
FactionChat 02 - Apply Notification - Disable
    Log To Console    FactionChat 02 - Apply Notification - Disable    
    Log To Console    Step 01: Setting Faction is disable    
    Setting For Chatroom    Faction    Disable

    Log To Console    Step 02: Verify Faction chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Faction     
    [Teardown]    Open Group Chat    Faction
    
FactionChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    FactionChat 03 - Apply Notification - Enable - Send/Receive Message
    Switch Browser    ${ChromeID}

    Log To Console    Step 01: Setting Faction is enable
    Setting For Chatroom    Faction    Enable
    
    Log To Console    Step 02: Verify Faction chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Faction    
    
    Log To Console    Step 03: Minimize Faction chat
    Minimize Chatroom    Faction
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Faction chat
    Switch Browser    ${FirefoxID}
    Sleep    5s
    Send Message To Chatroom    Faction    
    
    Log To Console    Step 05: Switch to Chrome and verify no unread message count displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Faction

    Log To Console    Step 06: Open Faction chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Faction    
    
    Log To Console    Step 07: Verify received message is correct
    Verify Message Display In Chatroom    Faction
    
FactionChat 04 - Apply Notification - Flash Notifier
    Log To Console    FactionChat 04 - Apply Notification - Flash Notifier
    Switch Browser    ${ChromeID}

    Log To Console    Step 01: Setting Faction is Flash Notifier   
    Setting For Chatroom    Faction    Flash notifier
    
    Log To Console    Step 02: Verify Faction chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Faction    
    
    Log To Console    Step 03: Minimize Faction chat
    Minimize Chatroom    Faction
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Faction chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Faction  
      
    Log To Console    Step 05: Switch to Chrome and verify unread message count is correct
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    1    Faction
    
    Log To Console    Step 06: Open Faction chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Faction   
    
    Log To Console    Step 07: Verify unread message count disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Faction
    
    Log To Console    Step 08: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Faction
    
FactionChat 05 - Apply Notification - Flash and Sound
    Log To Console    NewPlayersChat 05 - Apply Notification - Flash and Sound
    Switch Browser    ${ChromeID}

    Log To Console    Step 01: Setting Faction is Flash Notifier   
    Setting For Chatroom    Faction    Flash & sound
    
    Log To Console    Step 02: Verify Faction chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Faction    
    
    Log To Console    Step 03: Minimize Faction chat
    Minimize Chatroom    Faction
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Faction chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Faction  
      
    Log To Console    Step 05: Switch to Chrome and verify unread message count is correct
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    1    Faction
    
    Log To Console    Step 06: Open Faction chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Faction   
    
    Log To Console    Step 07: Verify unread message count disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Faction
    
    Log To Console    Step 08: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Faction
    