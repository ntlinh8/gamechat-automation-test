*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run keywords    Open Torn Browser    AND    Open Group Chat    Global
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process

*** Test Cases ***
GlobalChat 01 - Collapse and Expand
    Log To Console    GlobalChat 01 - Collapse and Expand    
    Log To Console    Step 01: Verify chat room is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Global
    
    Log To Console    Step 02: Verify scroll function properly works
    Verify Scroll Function Work Properly    Global
    
    Log To Console    Step 03: Switch To Chrome, verify Global and New Player chat is exist
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 04: Open Chat Panel
    Open Chat Panel
    
    Log To Console    Step 05: Click to Setting button   
    Click Element "${ChatPanel_button_Setting}" 
    
    Log To Console    Step 06: Verify Global chat is exist in Setting
    Wait Until Dynamic Element Is Visible    ${ChatPanel_button_DynamicSettingDropdownByChatName}    Global
    
    Log To Console    Step 07: Verify New Player chat is exist in Setting
    Wait Until Dynamic Element Is Visible    ${ChatPanel_button_DynamicSettingDropdownByChatName}    New Player
    
    Log To Console    Step 08: Setting Global chat is enable
    Open Group Chat    Global
    
    Log To Console    Step 09: Verify Minimized chat room is exist
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizeButton}    Global

    Log To Console    Step 10: Switch To Chrome, verify Global chat is exist
    Switch Browser    ${FirefoxID}
    
    Log To Console    Step 11: Open Chat Panel
    Open Chat Panel
    
    Log To Console    Step 12: Click to Setting button   
    Click Element "${ChatPanel_button_Setting}" 
    
    Log To Console    Step 13: Verify Global chat is exist in Setting
    Wait Until Dynamic Element Is Visible    ${ChatPanel_button_DynamicSettingDropdownByChatName}    Global
    
    Log To Console    Step 14: Verify New Player chat is NOT exist in Setting
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_button_DynamicSettingDropdownByChatName}    New Player

    Log To Console    Step 15: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    Global
    
    Log To Console    Step 16: Verify Global chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Global
    
    [Teardown]    Open Group Chat    Global
    
GlobalChat 02 - Apply Notification - Disable
    Log To Console    GlobalChat 02 - Apply Notification - Disable    
    Switch Browser    ${ChromeID}
    
    Log To Console    === Part 1: Disable ===
    Log To Console    Step 01: Setting Global is disable    
    Setting For Chatroom    Global    Disable

    Log To Console    Step 02: Verify Global chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Global     
    
    [Teardown]    Open Group Chat    Global

GlobalChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    GlobalChat 03 - Apply Notification - Enable - Send/Receive Message
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Global is enable
    Setting For Chatroom    Global    Enable
    
    Log To Console    Step 02: Verify Global chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Global    
    
    Log To Console    Step 03: Minimize Global chat
    Minimize Chatroom    Global
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Global chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Global    
    
    Log To Console    Step 05: Switch to Chrome and verify no flash displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Global

    Log To Console    Step 06: Open Global chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Global    
    
    Log To Console    Step 07: Verify received message is correct
    Verify Message Display In Chatroom    Global
    
GlobalChat 04 - Apply Notification - Flash Notifier
    Log To Console    GlobalChat 04 - Apply Notification - Flash Notifier
    Switch Browser    ${ChromeID}

    Log To Console    Step 01: Setting Global is Flash Notifier   
    Setting For Chatroom    Global    Flash notifier
    
    Log To Console    Step 02: Verify Global chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Global 
    
    Log To Console    Step 03: Minimize Global chat
    Minimize Chatroom    Global
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Global chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Global  
      
    Log To Console    Step 05: Switch to Chrome and verify the flash shows
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Global
    
    Log To Console    Step 06: Open Global chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Global   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    Global
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Global
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Global
    
GlobalChat 05 - Apply Notification - Flash and Sound
    Log To Console    GlobalChat 05 - Apply Notification - Flash and Sound
    Switch Browser    ${ChromeID}

    Log To Console    Step 01: Setting Global is Flash Notifier   
    Setting For Chatroom    Global    Flash & sound
    
    Log To Console    Step 02: Verify Global chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Global    
    
    Log To Console    Step 03: Minimize Global chat
    Click Dynamic Element     ${Chatroom_button_DynamicMinimizeButton}    Global
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Global chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Global  
      
    Log To Console    Step 05: Switch to Chrome and verify the flash shows
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Global
    
    Log To Console    Step 06: Open Global chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Global   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    Global
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Global
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Global
