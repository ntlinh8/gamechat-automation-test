*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Suite Start
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
*** Variables ***
${is_travel}    ${False}
${destination}    Mexico
*** Test Cases ***
TravelChat 01 - Collapse and Expand
    Log To Console    TravelChat 01 - Collapse and Expand  
    Run Keyword If    "${is_travel}"=="True"    Pass Execution    Skip this case because pro-condition failed 
      
    Log To Console    Step 01: Verify chat room is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${destination}
    
    Log To Console    Step 02: Verify scroll function properly works
    Verify Scroll Function Work Properly    ${destination}
    
    Log To Console    Step 03: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    ${destination}
    
    Log To Console    Step 04: Verify ${destination} chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${destination}
    [Teardown]    Run Keyword And Ignore Error    Open Group Chat    ${destination}
    
TravelChat 02 - Apply Notification - Disable
    Log To Console    TravelChat 02 - Apply Notification - Disable    
    Run Keyword If    "${is_travel}"=="True"    Pass Execution    Skip this case because pro-condition failed 
    
    Log To Console    === Part 1: Disable ===
    Log To Console    Step 01: Setting Travel is disable    
    Setting For Chatroom    ${destination}    Disable

    Log To Console    Step 02: Verify ${destination} chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    ${destination}     
    [Teardown]    Run Keyword And Ignore Error    Open Group Chat    ${destination}
    
TravelChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    TravelChat 03 - Apply Notification - Enable - Send/Receive Message
    Run Keyword If    "${is_travel}"=="True"    Pass Execution    Skip this case because pro-condition failed 
    
    Log To Console    Step 01: Setting Travel is enable
    Switch Browser    ${ChromeID}
    Setting For Chatroom    ${destination}    Enable
    
    Log To Console    Step 02: Verify Travel chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    ${destination}    
    
    Log To Console    Step 03: Minimize ${destination} chat
    Minimize Chatroom    ${destination}
    
    Log To Console    Step 04: Switch to Firefox and send a new message to ${destination} chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    ${destination}    
    
    Log To Console    Step 05: Switch to Chrome and verify no unread message count displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    ${destination}

    Log To Console    Step 06: Open ${destination} chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    ${destination}    
    
    Log To Console    Step 07: Verify received message is correct
    Verify Message Display In Chatroom    ${destination}
    
TravelChat 04 - Apply Notification - Flash Notifier
    Log To Console    TravelChat 04 - Apply Notification - Flash Notifier
    Run Keyword If    "${is_travel}"=="True"    Pass Execution    Skip this case because pro-condition failed 
    
    Log To Console    Step 01: Setting ${destination} is Flash Notifier   
    Switch Browser    ${ChromeID}
    Setting For Chatroom    ${destination}    Flash notifier
    
    Log To Console    Step 02: Verify ${destination} chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    ${destination}    
    
    Log To Console    Step 03: Minimize ${destination} chat
    Minimize Chatroom    ${destination}
    
    Log To Console    Step 04: Switch to Firefox and send a new message to ${destination} chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    ${destination}  
      
    Log To Console    Step 05: Switch to Chrome and verify the flash shows
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    ${destination}
    
    Log To Console    Step 06: Open ${destination} chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    ${destination}   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    ${destination}
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    ${destination}
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    ${destination}
    
TravelChat 05 - Apply Notification - Flash and Sound
    Log To Console    TravelChat 05 - Apply Notification - Flash and Sound
    Run Keyword If    "${is_travel}"=="True"    Pass Execution    Skip this case because pro-condition failed 

    Log To Console    Step 01: Setting ${destination} is Flash & sounds
    Switch Browser    ${ChromeID}
    Setting For Chatroom    ${destination}    Flash & sound
    
    Log To Console    Step 02: Verify ${destination} chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    ${destination}    
    
    Log To Console    Step 03: Minimize ${destination} chat
    Minimize Chatroom    ${destination}
    
    Log To Console    Step 04: Switch to Firefox and send a new message to ${destination} chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    ${destination}  
      
    Log To Console    Step 05: Switch to Chrome and verify the flash shows
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    ${destination}
    
    Log To Console    Step 06: Open ${destination} chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    ${destination}   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    ${destination}
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    ${destination}
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    ${destination}

TravelChat 06 - Travel Home
    Log To Console    TravelChat 06 - Travel Home    
    Run Keyword If    "${is_travel}"=="True"    Pass Execution    Skip this case because pro-condition failed 
    
    Log To Console    Pre-condition: Travel Home For 2 Account    
    ${status}=    Travel Home For 2 Account
    Run Keyword If    "${status}"=="False"    Pass Execution    Skip this case because pro-condition failed    

    Log To Console    Step 01: Verify minimized ${destination} chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    ${destination} 
    
    Log To Console    Step 02: Verify opening ${destination} chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${destination}

*** Keywords ***
Suite Start
    Open Torn Browser    ${Account_ChromeTravel}    ${Account_FirefoxTravel}
    Switch Browser    ${ChromeID}
    ${is_travel1}=    Is Player In Flight To Torn
    Run Keyword If    "${is_travel1}"=="True"    Run Keywords    Set Global Variable    ${is_travel}    ${True}    AND    Pass Execution    Skip all because pre-condition failed        
    Join To Travel Chat
    Set Browser To The Position    LEFT
    Switch Browser    ${FirefoxID}
    ${is_travel2}=    Is Player In Flight To Torn
    Run Keyword If    "${is_travel2}"=="True"    Run Keywords    Set Global Variable    ${is_travel}    ${True}    AND    Pass Execution    Skip all because pre-condition failed        
    Join To Travel Chat
    Set Browser To The Position    RIGHT
    Open Group Chat    ${destination}

Is Player In Flight To Torn
    ${status}=    Run Keyword And Return Status    Run Keywords
    ...    Element "${Travel_data_TravelInformation}" Attribute Value "data-country" Should Be Equal "torn"
    ...    AND    Element "${Travel_data_TravelInformation}" Attribute Value "data-traveling" Should Be Equal "true"  
    [Return]    ${status}

Travel Home For 2 Account
    Switch Browser    ${ChromeID}
    ${status1}=    Travel Home
    Run Keyword If    "${status1}"=="True"    Return From Keyword    ${True}    
    Switch Browser    ${FirefoxID}
    ${status2}=    Travel Home
    Run Keyword If    "${status2}"=="True"    Return From Keyword    ${True}    ELSE     Return From Keyword    ${False}     
    

Travel Home
    Log To Console    Travel Home    
    Log To Console    Check player is at home?
    ${status}=    Run Keyword And Return Status    Run Keywords
    ...    Element "${Travel_data_TravelInformation}" Attribute Value "data-country" Should Not Be Equal "torn"
    ...    AND    Element "${Travel_data_TravelInformation}" Attribute Value "data-traveling" Should Be Equal "false"  
    Log To Console    Check player is at home? -> ${status}
    
    Run Keyword If    "${status}"=="True"
    ...   Run Keywords
    ...    Log To Console    Travel back
    ...    AND    Go To    ${BASE_URL}
    ...    AND    Wait Until Page Ready
    ...    AND    Log To Console    Click to Travel Home
    ...    AND    Click Element "${Travel_button_TravelHome}"
    ...    AND    Log To Console    Click to Travel Back
    ...    AND    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    TRAVEL BACK
    ...    AND    Wait Until Page Ready
    ...    AND    Log To Console    Verify player is travel back
    ...    AND    Element "${Travel_data_TravelInformation}" Attribute Value "data-country" Should Be Equal "torn"
    ...    AND    Element "${Travel_data_TravelInformation}" Attribute Value "data-traveling" Should Be Equal "true"
    [Return]    ${status}