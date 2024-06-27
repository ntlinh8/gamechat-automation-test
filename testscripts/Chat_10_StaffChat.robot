*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run keywords    Open Torn Browser    ${Account_Chrome}    ${Account_FirefoxStaff}    AND    Open Group Chat    Staff
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
Default Tags     test
*** Variables ***
*** Test Cases ***
StaffChat 01 - Collapse and Expand
    Log To Console    StaffChat 01 - Collapse and Expand    
    
    Log To Console    Step 01: Staff chat is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Staff
    
    Log To Console    Step 02: Verify Scroll Function of Staff chat
    Verify Scroll Function Work Properly    Staff
    
    Log To Console    Step 03: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    Staff
    
    Log To Console    Step 04: Verify Staff chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Staff
    
    [Teardown]    Open Group Chat    Staff

StaffChat 02 - Apply Notification - Disable
    Log To Console    StaffChat 02 - Apply Notification - Disable 
    
    Log To Console    Step 01: Setting Staff is disable    
    Setting For Chatroom    Staff    Disable

    Log To Console    Step 02: Verify Staff chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Staff   
    
    [Teardown]    Open Group Chat    Staff
    
StaffChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    StaffChat 03 - Apply Notification - Enable - Send/Receive Message    
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Staff is enable
    Setting For Chatroom    Staff    Enable
    
    Log To Console    Step 02: Verify Staff chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Staff    
    
    Log To Console    Step 03: Minimize Staff chat
    Minimize Chatroom    Staff
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Staff chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Staff
    
    Log To Console    Step 05: Switch to Chrome and verify no flash displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Staff

    Log To Console    Step 06: Open Staff chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Staff    
    
    Log To Console    Step 07: Verify received message is correct
    Verify Message Display In Chatroom    Staff    
    
StaffChat 04 - Apply Notification - Flash Notifier
    Log To Console    StaffChat 04 - Apply Notification - Flash Notifier
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Staff is Flash Notifier   
    Setting For Chatroom    Staff    Flash notifier
    
    Log To Console    Step 02: Verify Staff chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Staff    
    
    Log To Console    Step 03: Minimize Staff chat
    Minimize Chatroom    Staff
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Staff chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Staff  
      
    Log To Console    Step 05: Switch to Chrome and verify unread message count is correct
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    1    Staff
    
    Log To Console    Step 06: Open Staff chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Staff   
    
    Log To Console    Step 07: Verify unread message count disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Staff
    
    Log To Console    Step 08: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Staff    
    
StaffChat 05 - Apply Notification - Flash and Sound
    Log To Console    StaffChat 05 - Apply Notification - Flash and Sound
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Staff is Flash Notifier   
    Setting For Chatroom    Staff    Flash & sound
    
    Log To Console    Step 02: Verify Staff chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Staff    
    
    Log To Console    Step 03: Minimize Staff chat
    Minimize Chatroom    Staff
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Staff chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Staff
      
    Log To Console    Step 05: Switch to Chrome and verify unread message count is correct
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    1    Staff
    
    Log To Console    Step 06: Open Staff chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Staff   
    
    Log To Console    Step 07: Verify unread message count disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Staff
    
    Log To Console    Step 08: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Staff     
