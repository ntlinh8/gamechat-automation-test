*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run keywords    Open Torn Browser    ${Account_Chrome}    ${Account_FirefoxNewPlayer}    AND    Open Group Chat    New players
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process

*** Test Cases ***
NewPlayersChat 01 - Collapse and Expand
    Log To Console    NewPlayersChat 01 - Collapse and Expand 
    Log To Console    Step 01: Verify chat room is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    New players
    
    Log To Console    Step 02: Verify scroll function properly works
    Verify Scroll Function Work Properly    New players
    
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
    
    Log To Console    Step 08: Setting New Player chat is enable
    Open Group Chat    New players
    
    Log To Console    Step 09: Verify Minimized chat room is exist
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizeButton}    New players

    Log To Console    Step 10: Switch To Chrome, verify Global chat is exist
    Switch Browser    ${FirefoxID}
    
    Log To Console    Step 11: Open Chat Panel
    Open Chat Panel
    
    Log To Console    Step 12: Click to Setting button   
    Click Element "${ChatPanel_button_Setting}" 
    
    Log To Console    Step 13: Verify New Player chat is exist in Setting
    Wait Until Dynamic Element Is Visible    ${ChatPanel_button_DynamicSettingDropdownByChatName}    New Player
    
    Log To Console    Step 14: Verify Global chat is NOT exist in Setting
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_button_DynamicSettingDropdownByChatName}    Global
    
    Log To Console    Step 15: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    New players
    
    Log To Console    Step 16: Verify New Players chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    New players
    
    [Teardown]    Open Group Chat    New players
    
NewPlayersChat 02 - Apply Notification - Disable
    Log To Console    NewPlayersChat 02 - Apply Notification - Disable    
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting New Players is disable    
    Setting For Chatroom    New players    Disable

    Log To Console    Step 02: Verify New Players chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    New players     
    
    [Teardown]    Open Group Chat    New players

NewPlayersChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    NewPlayersChat 03 - Apply Notification - Enable - Send/Receive Message
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting New players is enable
    Setting For Chatroom    New players   Enable
    
    Log To Console    Step 02: Verify New Players chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    New players    
    
    Log To Console    Step 03: Minimize New Players chat
    Minimize Chatroom    New players
    
    Log To Console    Step 04: Switch to Firefox and send a new message to New Players chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    New players    
    
    Log To Console    Step 05: Switch to Chrome and verify no flash displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    New players

    Log To Console    Step 06: Open New Players chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    New players    
    
    Log To Console    Step 07: Verify received message is correct
    Verify Message Display In Chatroom    New players
    
NewPlayersChat 04 - Apply Notification - Flash Notifier
    Log To Console    NewPlayersChat 04 - Apply Notification - Flash Notifier
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting New Players is Flash Notifier   
    Setting For Chatroom    New players    Flash notifier
    
    Log To Console    Step 02: Verify New Players chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    New players 
    
    Log To Console    Step 03: Minimize New Players chat
    Minimize Chatroom    New players
    
    Log To Console    Step 04: Switch to Firefox and send a new message to New Players chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    New players  
      
    Log To Console    Step 05: Switch to Chrome and verify the flash shows
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    New players
    
    Log To Console    Step 06: Open New Players chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    New players   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    New players
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    New players
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    New players
    
NewPlayersChat 05 - Apply Notification - Flash and Sound
    Log To Console    NewPlayersChat 05 - Apply Notification - Flash and Sound
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting New Players is Flash Notifier   
    Setting For Chatroom    New players    Flash & sound
    
    Log To Console    Step 02: Verify New Players chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    New players    
    
    Log To Console    Step 03: Minimize New Players chat
    Minimize Chatroom    New players
    
    Log To Console    Step 04: Switch to Firefox and send a new message to New Players chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    New players  
      
    Log To Console    Step 05: Switch to Chrome and verify the flash shows
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    New players
    
    Log To Console    Step 06: Open New Players chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    New players   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    New players
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    New players
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    New players

