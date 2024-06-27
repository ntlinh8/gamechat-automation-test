*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run keywords    Open Torn Browser    AND    Open Group Chat    Trade
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
*** Variables ***
${wait_timeout}    600s
*** Test Cases ***
TradeChat 01 - Collapse and Expand
    Log To Console    TradeChat 01 - Collapse and Expand    
    
    Log To Console    Step 01: Trade chat is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Trade
    
    Log To Console    Step 02: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    Trade
    
    Log To Console    Step 03: Verify Trade chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Trade
    
    [Teardown]    Open Group Chat    Trade

TradeChat 02 - Apply Notification - Disable
    Log To Console    TradeChat 02 - Apply Notification - Disable 
    
    Log To Console    Step 01: Setting Trade is disable    
    Setting For Chatroom    Trade    Disable

    Log To Console    Step 02: Verify Trade chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Trade   
    
    [Teardown]    Open Group Chat    Trade
    
TradeChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    TradeChat 03 - Apply Notification - Enable - Send/Receive Message    
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Trade is enable
    Setting For Chatroom    Trade    Enable
    
    Log To Console    Step 02: Verify Trade chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Trade    
    
    Log To Console    Step 03: Minimize Trade chat
    Minimize Chatroom    Trade
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Trade chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Trade
    
    Log To Console    Step 05: Send message 2 to Trade chat    
    Clear And Input Text In Dynamic Element    AutoTestMessage    ${Chatroom_input_DynamicChatTextBoxByChatname}    Trade
    Press Keys    ${None}    ENTER
    
    Log To Console    Step 06: Verify "Trade rooms allows one message per 60 seconds" message displays
    Wait Until Page Contains Text "Trade rooms allows one message per 60 seconds"
    
    Log To Console    Step 07: Verify "AutoTestMessage" message not show in Trade chat
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_message_DynamicMessageByChatname}    Trade    AutoTestMessage       
    
    Log To Console    Step 08: Switch to Chrome and verify no flash displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Trade

    Log To Console    Step 09: Open Trade chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Trade    
    
    Log To Console    Step 10: Verify received message is correct
    Verify Message Display In Chatroom    Trade    ${wait_timeout}
    
TradeChat 04 - Apply Notification - Flash Notifier
    Log To Console    TradeChat 04 - Apply Notification - Flash Notifier
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Trade is Flash Notifier   
    Setting For Chatroom    Trade    Flash notifier
    
    Log To Console    Step 02: Verify Trade chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Trade    
    
    Log To Console    Step 03: Minimize Trade chat
    Minimize Chatroom    Trade
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Trade chat
    Switch Browser    ${FirefoxID}
    Sleep    60s
    Send Message To Chatroom    Trade  
      
    Log To Console    Step 05: Switch to Chrome and verify the flash shows
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Trade
    
    Log To Console    Step 06: Open Trade chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Trade   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    Trade
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Trade
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Trade    ${wait_timeout}
    
TradeChat 05 - Apply Notification - Flash and Sound
    Log To Console    TradeChat 05 - Apply Notification - Flash and Sound
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Trade is Flash Notifier   
    Setting For Chatroom    Trade    Flash & sound
    
    Log To Console    Step 02: Verify Trade chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Trade    
    
    Log To Console    Step 03: Minimize Trade chat
    Minimize Chatroom    Trade
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Trade chat
    Switch Browser    ${FirefoxID}
    Sleep    60s
    Send Message To Chatroom    Trade
      
    Log To Console    Step 05: Switch to Chrome and verify the flash shows
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Trade
    
    Log To Console    Step 06: Open Trade chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Trade   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    Trade
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Trade
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Trade    ${wait_timeout}
