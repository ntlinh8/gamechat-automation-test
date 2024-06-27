*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Suite Start
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
Default Tags     test
*** Variables ***
${poker_table}    Newbie Corner
*** Test Cases ***
PokerChat 01 - Collapse and Expand
    Log To Console    PokerChat 01 - Collapse and Expand    
    
    Log To Console    Step 01: Poker chat is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Poker
    
    Log To Console    Step 02: Verify there's no messages in Poker chat
    Wait Until Dynamic Element Is Not Visible With Timeout    30s    ${Chatroom_message_DynamicAllContentByChatname}    Poker
    
    Log To Console    Step 03: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    Poker
    
    Log To Console    Step 04: Verify Poker chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Poker
    
    [Teardown]    Open Group Chat    Poker
PokerChat 02 - Apply Notification - Disable
    Log To Console    PokerChat 02 - Apply Notification - Disable 
    
    Log To Console    Step 01: Setting Poker is disable    
    Setting For Chatroom    Poker    Disable

    Log To Console    Step 02: Verify Poker chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Poker   
    
    [Teardown]    Open Group Chat    Poker
    
PokerChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    PokerChat 03 - Apply Notification - Enable - Send/Receive Message    
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Poker is enable
    Setting For Chatroom    Poker    Enable
    
    Log To Console    Step 02: Verify Poker chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Poker    
    
    Log To Console    Step 03: Minimize Poker chat
    Minimize Chatroom    Poker
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Poker chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Poker
    
    Log To Console    Step 05: Switch to Chrome and verify no flash displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Poker

    Log To Console    Step 06: Open Poker chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Poker    
    
    Log To Console    Step 07: Verify received message is correct
    Verify Message Display In Chatroom    Poker    
    
PokerChat 04 - Apply Notification - Flash Notifier
    Log To Console    PokerChat 04 - Apply Notification - Flash Notifier
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Poker is Flash Notifier   
    Setting For Chatroom    Poker    Flash notifier
    
    Log To Console    Step 02: Verify Poker chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Poker    
    
    Log To Console    Step 03: Minimize Poker chat
    Minimize Chatroom    Poker
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Poker chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Poker  
      
    Log To Console    Step 05: Switch to Chrome and verify unread message count is correct
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    1    Poker
    
    Log To Console    Step 06: Open Poker chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Poker   
    
    Log To Console    Step 07: Verify unread message count disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Poker
    
    Log To Console    Step 08: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Poker    
    
PokerChat 05 - Apply Notification - Flash and Sound
    Log To Console    PokerChat 05 - Apply Notification - Flash and Sound
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Poker is Flash Notifier   
    Setting For Chatroom    Poker    Flash & sound
    
    Log To Console    Step 02: Verify Poker chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Poker    
    
    Log To Console    Step 03: Minimize Poker chat
    Minimize Chatroom    Poker
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Poker chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Poker
      
    Log To Console    Step 05: Switch to Chrome and verify unread message count is correct
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    1    Poker
    
    Log To Console    Step 06: Open Poker chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Poker   
    
    Log To Console    Step 07: Verify unread message count disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Poker
    
    Log To Console    Step 08: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Poker     

PokerChat 06 - Leave Poker Table
    Log To Console    PokerChat 06 - Leave Poker Table
    
    Log To Console    Step 01: Switch to Chrome and wait until Leave button visible
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible With Timeout    50s    ${Main_button_DynamicButtonByLabel}    Leave
    
    Log To Console    Step 02: Click to Leave button
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    Leave  
    Wait Until Page Ready  
    
    Log To Console    Step 03: Verify Poker table is not visible    
    Wait Until Dynamic Element Is Not Visible With Timeout    30s    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Poker
    
    Log To Console    Step 04: Switch to Chrome and wait until Leave button visible
    Switch Browser    ${FirefoxID}
    Wait Until Dynamic Element Is Visible With Timeout    50s    ${Main_button_DynamicButtonByLabel}    Leave
    
    Log To Console    Step 05: Click to Leave button
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    Leave  
    Wait Until Page Ready  
    
    Log To Console    Step 06: Verify Poker table is not visible    
    Wait Until Dynamic Element Is Not Visible With Timeout    30s    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Poker


*** Keywords ***
Suite Start
    Log To Console    Suite Start    
    Open Torn Browser
    Switch Browser    ${ChromeID}
    Join Poker
    Open Group Chat    Poker
    Switch Browser    ${FirefoxID}
    Join Poker
    Open Group Chat    Poker

Join Poker 
    Log To Console    Join Poker    
    Log To Console    Go to Poker page
    Go To    ${BASE_URL}page.php?sid=holdem
    Wait Until Page Ready    
    
    Log To Console    Click to Table List button
    Click Element "${Poker_button_TableList}"
    
    Log To Console    Select the "${poker_table}" table
    Click Dynamic Element    ${Poker_button_DynamicPokerTableByLabel}    ${poker_table}
    Wait Until Page Ready
    
    Log To Console    Sit in table
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    Sit In
    
    Log To Console    Click OK button
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    Ok
    
    Log To Console    Verify Player join Poker table successfully
    Wait Until Dynamic Element Is Visible    ${Main_button_DynamicButtonByLabel}    Leave    
    
    


    
    
    