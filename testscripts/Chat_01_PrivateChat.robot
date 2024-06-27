*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run keywords    Open Torn Browser    AND    Switch Browser    ${ChromeID}    AND    Open Chatroom From Profile Page    ${Account_Firefox}
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
Default Tags    test
*** Test Cases ***  
PrivateChat 01 - Collapse And Expand
    Log To Console    PrivateChat 01 - Collapse And Expand    
    Log To Console    Step 1: Verify chat room is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 2: Click Collapse button
    Click Dynamic Element     ${Chatroom_button_DynamicMinimizeButton}    ${Account_Firefox}[Name]

    Log To Console    Step 3: Verify private chat is not open
    Wait Until Dynamic Element Is Not Visible   ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 4: Verify private chat is minimized
    Wait Until Dynamic Element Is Visible   ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 5: Click open minimized chat
    Click Dynamic Element     ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 6: Verify chat is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 7: Verify Scroll function
    Verify Scroll Function Work Properly    ${Account_Firefox}[Name]
    
    Log To Console    Step 8: Click close chat button
    Click Dynamic Element    ${Chatroom_button_DynamicCloseButton}    ${Account_Firefox}[Name]
    
    Log To Console    Step 9: Verify chat is closed
    Wait Until Dynamic Element Is Not Visible   ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]
    Wait Until Dynamic Element Is Not Visible   ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]
    
    [Teardown]     Open Chatroom From Profile Page    ${Account_Firefox}
    
PrivateChat 02 - View Profile
    Log To Console    PrivateChat 02 - View Profile    
    Log To Console    Step 01: Click to chatroom name
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Click Dynamic Element    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]    
    
    Log To Console    Step 02: Click Open Profile button
    Click Dynamic Element    ${Chatroom_button_DynamicExpandOption}    View Profile
    
    Log To Console    Step 03: Verify title of page is correct
    Wait Until Page Ready
    ${actual_title}=    Get Title
    Should Be Equal    ${actual_title}    ${Account_Firefox}[Name]'s Profile | Torn
    
PrivateChat 03 - Block And Unblock
    Log To Console    PrivateChat 03 - Block And Unblock
    Log To Console    Step 01: Click to chatroom name
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Click Dynamic Element    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]    
    
    Log To Console    Step 02: Click Block button
    Click Dynamic Element    ${Chatroom_button_DynamicExpandOption}    Block
    
    Log To Console    Step 03: Click No button     
    Click Dynamic Element    ${Chatroom_button_DynamicConfirmationOption}    No
    
    Log To Console    Step 04: Verify confirmation message disappears
    Wait "5s" Until Element "${Chatroom_text_ConfirmationMessage}" Is Not Visible
    
    Log To Console    Step 05: Click to Block tab
    Open Chat Panel
    
    Log To Console    Step 06: Click to Block tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 07: Verify user is not exist in Blocked list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel-Blocked_text_DynamicFriendByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 08 Click to chatroom name
    Click Dynamic Element    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 09: Click Block button
    Click Dynamic Element    ${Chatroom_button_DynamicExpandOption}    Block
    
    Log To Console    Step 10: Click Yes button    
    Click Dynamic Element    ${Chatroom_button_DynamicConfirmationOption}    Yes
    
    # Cheat for issue -> need to re-open to verify
    Click Dynamic Element     ${Chatroom_button_DynamicMinimizeButton}    ${Account_Firefox}[Name]
    Sleep    3s
    Click Dynamic Element     ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 11: Verify confirmation message disappears
    Wait "5s" Until Element "${Chatroom_text_ConfirmationMessage}" Is Not Visible        # Skip because having issues
    
    Log To Console    Step 12-1: Verify block message displays in chatroom
    ${block_message}=    Get Text From Dynamic Locator    ${Chatroom_button_DynamicBlockMessage}    ${Account_Firefox}[Name]        # Skip because having issues
    Should Be Equal    ${block_message}    You cannot chat with this user because they have not interacted with you recently or they have blocked you.            # Skip because having issues
    
    Log To Console    Step 12-2: Verify chat input is disable
    ${att_value}=    Get Attribute From Dynamic Locator    class    ${Chatroom_input_DynamicChatTextBoxByChatname}    ${Account_Firefox}[Name] 
    Should Contain    ${att_value}    disabled    
    
    Log To Console    Step 13: Click to Block tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 14: Verify user is exist in Blocked list
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Blocked_text_DynamicFriendByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 15: Click Delete button
    Click Dynamic Element    ${ChatPanel-Blocked_button_DynamicDeleteButton}    ${Account_Firefox}[Name]
    
    Log To Console    Step 16: Verify user is not exist in Blocked list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel-Blocked_button_DynamicDeleteButton}    ${Account_Firefox}[Name]

PrivateChat 04 - Report Player
    Log To Console    PrivateChat 04 - Report Player
    Log To Console    Step 01: Click to chatroom name
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Click Dynamic Element    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]    
    
    Log To Console    Step 02: Click Report button
    Click Dynamic Element    ${Chatroom_button_DynamicExpandOption}    Report
    
    Log To Console    Step 03: Click No button     
    Click Dynamic Element    ${Chatroom_button_DynamicConfirmationOption}    No
    
    Log To Console    Step 04: Verify confirmation message disappears
    Wait "5s" Until Element "${Chatroom_text_ConfirmationMessage}" Is Not Visible
    
    Log To Console    Step 05: Open admin page
    Open Admin Page
    Wait Until Page Ready
    
    Log To Console    Step 06: Click to Chat Reports menu
    Click Dynamic Element    ${Admin_menu_DynamicMenuByLabel}    Chat Reports
    Wait Until Page Ready
    
    Log To Console    Step 07: Verify no report between 2 accounts
    Wait Until Dynamic Element Is Not Visible    ${Admin-ChatReports_text_DynamicReportUser}    ${Account_Firefox}[Name](${Account_Firefox}[ID])    ${Account_Chrome}[Name](${Account_Chrome}[ID])
    
    Log To Console    Step 08: Back to default page    
    Select The Main Window
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    
    Log To Console    Step 09: Click Report button
    Click Dynamic Element    ${Chatroom_button_DynamicExpandOption}    Report
    
    Log To Console    Step 10: Click Yes button     
    Click Dynamic Element    ${Chatroom_button_DynamicConfirmationOption}    Yes
    
    Log To Console    Step 11: Verify confirmation message disappears
    Wait "5s" Until Element "${Chatroom_text_ConfirmationMessage}" Is Not Visible    
    
    Log To Console    Step 12: Switch to Admin page
    Select The New Window
    Reload Page
    Wait Until Page Ready
    
    Log To Console    Step 13: Verify report between 2 accounts
    Wait Until Dynamic Element Is Visible    ${Admin-ChatReports_text_DynamicReportUser}    ${Account_Firefox}[Name](${Account_Firefox}[ID])    ${Account_Chrome}[Name](${Account_Chrome}[ID])
    
    Log To Console    Step 14: Remove chat reports
    Click Dynamic Element    ${Admin-ChatReports_button_DynamicRemoveButton}    ${Account_Firefox}[Name](${Account_Firefox}[ID])    ${Account_Chrome}[Name](${Account_Chrome}[ID])
    Wait Until Page Ready
    
    Log To Console    Step 15: Click Confirm button
    Click Dynamic Element    ${Admin-ChatReports_button_Confirm}
    Wait Until Page Ready
    
    Log To Console    Step 16: Verify no report between 2 accounts
    Wait Until Page Ready
    Wait Until Dynamic Element Is Not Visible    ${Admin-ChatReports_text_DynamicReportUser}    ${Account_Firefox}[Name](${Account_Firefox}[ID])    ${Account_Chrome}[Name](${Account_Chrome}[ID])
    Close Admin Page
    
PrivateChat 05 - Send/Receive Message
    Log To Console    PrivateChat 05 - Send/Receive Message
    
    Log To Console    Step 01: Switch to Chrome, open chat list
    Switch Browser    ${FirefoxID}
    Open Chat Panel
    
    Log To Console    Step 02: Switch to Chrome, send message to "${Account_Firefox}[Name]"
    Switch Browser    ${ChromeID}
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Send Message To Chatroom    ${Account_Firefox}[Name]    
    
    Log To Console    Step 03: Switch to Firefox, verify new messages display in Chat list
    Switch Browser    ${FirefoxID}
    Wait Until Dynamic Element Is Visible     ${Chatroom_text_DynamicLastMessageInChatList}    ${Account_Chrome}[Name]
    ${last_message}=    Get Text From Dynamic Locator    ${Chatroom_text_DynamicLastMessageInChatList}    ${Account_Chrome}[Name]    
    Should Be Equal    ${last_message}    ${Account_Chrome}[Name] : ${message}    
       
    Log To Console    Step 04: Verify chatroom is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Chrome}[Name]
    
    Log To Console    Step 05: Verify "${message}" message is received   
    Verify Message Display In Chatroom    ${Account_Chrome}[Name]
    
PrivateChat 06 - Apply Notifications
    Log To Console    PrivateChat 06 - Apply Notifications
    Log To Console    === Part 1: Flash notifier ===
    
    Log To Console    Step 01: Collapse Chatroom
    Switch Browser    ${ChromeID}
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Minimize Chatroom    ${Account_Firefox}[Name]
    
    Log To Console    Step 02: Setting notification for Private Chat is Flash Notifier 
    Setting For Chatroom    Private    Flash notifier

    Log To Console    Step 03: Open chat list
    Open Chat Panel

    Log To Console    Step 04: Switch browser, send a new message to chat room
    Switch Browser    ${FirefoxID}
    
    Log To Console    Step 05: Open chatroom with ${Account_Chrome}[Name] if this room not exist
    Open Chatroom If It's Not Open    ${Account_Chrome}
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Send Message To Chatroom    ${Account_Chrome}[Name]  

    Log To Console    Step 05: Back and verify the unread message displays correctly in minimized chat
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedChat}    1    ${Account_Firefox}[Name]
    
    Log To Console    Step 06: Verify the unread message displays correctly in chat list
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInChatList}    1    ${Account_Firefox}[Name]

    Log To Console    Step 07: Open the minimized chatroom
    Click Dynamic Element     ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 08: Verify the minimized chat disappears
    Wait Until Dynamic Element Is Not Visible   ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 09: Verify unread messages disappears in chatlist
    Wait Until Dynamic Element Is Not Visible With Timeout    10s   ${Chatroom_text_DynamicUnreadMessageInChatList}    ${Account_Firefox}[Name]
    
    Log To Console    Step 10: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    ${Account_Firefox}[Name]
    
    Log To Console    === Part 2: Flash and sound ===
    Log To Console    Step 11: Collapse Chatroom
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Minimize Chatroom    ${Account_Firefox}[Name]

    Log To Console    Step 12: Setting notification for Private Chat is Flash & Sound
    Setting For Chatroom    Private    Flash & sound
    
    Log To Console    Step 13: Open chat list
    Open Chat Panel
    
    Log To Console    Step 14: Switch browser, send a new message to chat room
    Switch Browser    ${FirefoxID}
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Send Message To Chatroom    ${Account_Chrome}[Name]  
    
    Log To Console    Step 15: Back and verify the unread message displays correctly in minimized chat
    Switch Browser    ${ChromeID}
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedChat}    1    ${Account_Firefox}[Name]
    
    Log To Console    Step 16: Verify the unread message displays correctly in chat list
    Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInChatList}    1    ${Account_Firefox}[Name]
    
    Log To Console    Step 17: Open chatroom
    Click Dynamic Element     ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 18: Verify the minimized chat disappears
    Wait Until Dynamic Element Is Not Visible   ${Chatroom_button_DynamicMinimizedChatroomByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 19: Verify unread messages disappears in chatlist
    Wait Until Dynamic Element Is Not Visible With Timeout    10s    ${Chatroom_text_DynamicUnreadMessageInChatList}    ${Account_Firefox}[Name]
    
    Log To Console    Step 20: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    ${Account_Firefox}[Name]