*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Start Suite
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
*** Test Cases ***
TravelChat 01 - Collapse and Expand
    Log To Console    TravelChat 01 - Collapse and Expand    
    Log To Console    Step 01: Verify chat room is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Hospital
    
    Log To Console    Step 02: Verify scroll function properly works
    Verify Scroll Function Work Properly    Hospital
    
    Log To Console    Step 03: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    Hospital
    
    Log To Console    Step 04: Verify Hospital chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Hospital
    [Teardown]    Open Group Chat    Hospital
    
TravelChat 02 - Apply Notification - Disable
    Log To Console    TravelChat 02 - Apply Notification - Disable    
    Log To Console    Step 01: Setting Travel is disable    
    Setting For Chatroom    Hospital    Disable

    Log To Console    Step 02: Verify Hospital chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Hospital     
    [Teardown]    Open Group Chat    Hospital
    
TravelChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    TravelChat 03 - Apply Notification - Enable - Send/Receive Message
    Switch Browser    ${ChromeID}

    Log To Console    Step 01: Setting Travel is enable
    Setting For Chatroom    Hospital    Enable
    
    Log To Console    Step 02: Verify Travel chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Hospital    
    
    Log To Console    Step 03: Minimize Hospital chat
    Minimize Chatroom    Hospital
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Hospital chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Hospital    
    
    # Log To Console    Step 05: Switch to Chrome and verify no unread message count displays
    # Switch Browser    ${ChromeID}
    # Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Hospital

    # Log To Console    Step 06: Open Hospital chat
    # Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Hospital    
    
    # Log To Console    Step 07: Verify received message is correct
    # Verify Message Display In Chatroom    Hospital
    
TravelChat 04 - Apply Notification - Flash Notifier
    Log To Console    TravelChat 04 - Apply Notification - Flash Notifier
    Switch Browser    ${ChromeID}

    Log To Console    Step 01: Setting Hospital is Flash Notifier   
    Setting For Chatroom    Hospital    Flash notifier
    
    Log To Console    Step 02: Verify Hospital chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Hospital    
    
    Log To Console    Step 03: Minimize Hospital chat
    Minimize Chatroom    Hospital
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Hospital chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Hospital  
      
    # Log To Console    Step 05: Switch to Chrome and verify the flash shows
    # Switch Browser    ${ChromeID}
    # Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Hospital
    
    # Log To Console    Step 06: Open Hospital chat
    # Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Hospital   
    
    # Log To Console    Step 07: Verify unread message count disappears
    # Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Hospital
    
    # Log To Console    Step 08: Verify the received message displays with the correct value
    # Verify Message Display In Chatroom    Hospital
    
TravelChat 05 - Apply Notification - Flash and Sound
    Log To Console    TravelChat 05 - Apply Notification - Flash and Sound
    Switch Browser    ${ChromeID}

    Log To Console    Step 01: Setting Hospital is Flash Notifier   
    Setting For Chatroom    Hospital    Flash & sound
    
    Log To Console    Step 02: Verify Hospital chat appears   
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Hospital    
    
    Log To Console    Step 03: Minimize Hospital chat
    Minimize Chatroom    Hospital
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Hospital chat
    Switch Browser    ${FirefoxID}
    Send Message To Chatroom    Hospital  
      
    # Log To Console    Step 05: Switch to Chrome and verify the flash shows
    # Switch Browser    ${ChromeID}
    # Dynamic Element Text Should Be Equal    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    1    Hospital
    
    # Log To Console    Step 06: Open Hospital chat
    # Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Hospital   
    
    # Log To Console    Step 07: Verify unread message count disappears
    # Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    Hospital
    
    # Log To Console    Step 09: Verify the received message displays with the correct value
    # Verify Message Display In Chatroom    Hospital

*** Keywords ***
Start Suite
    [Arguments]    ${ChromeAccount}=${Account_Chrome}
    Log To Console    Start Suite    
    ${chrome}    Open Browser    ${URL}    Chrome
    Set Selenium Implicit Wait    ${SELENIUM_LONG_IMPLICITWAIT}
    Wait Until Page Ready
    Maximize Browser Window
    Login Page    ${ChromeAccount}
    Close All Chatroom And Reset Setting
    Set Global Variable    ${ChromeID}    ${chrome}
    Punch Player    ${Account_ChromeHospital}
    Punch Player    ${Account_FirefoxNewPlayer}
    Close All Browsers
    
    Open Torn Browser    ${Account_ChromeHospital}    ${Account_FirefoxNewPlayer}
    Open Group Chat    Hospital

Punch Player
    [Arguments]    ${Account}
    Log To Console    Punch Player    
    Log To Console    Go to Profile with Account: ${Account}[Name]
    Go To    ${BASE_URL}
    Wait Until Page Ready
    Go To    ${BASE_URL}profiles.php?XID=${Account}[ID]
    Wait Until Page Ready
    
    Log To Console    Wait until the chat icon displays    
    Wait Until Dynamic Element Is Visible    ${Main_button_DynamicButtonByClass}    chat-list-button  
     
    Log To Console    If player in hospital -> Skip punch player
    ${in_hospital}=    Run Keyword And Return Status    Element "${Hospital_button_InHospital}" Should Contains Text "In hospital"    
    Run Keyword If    "${in_hospital}"=="True"    Return From Keyword        
    
    Log To Console    Click Attack button
    Click Element "${Profile_button_Attack}"
    Wait Until Page Ready
    
    Log To Console    Click Start fight button
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    Start fight
    
    Log To Console    Click punch player until it go hospital or you stalemented
    Wait Until Keyword Succeeds    30x    1x
    ...    Run Keywords
    ...    Click Element "${Hospital_button_PunchPlayer}"
    ...    AND    Page Source Context "hospitalize" Or "You stalemated"
    
    ${is_hospital}    Page Source Contain    hospitalize    
    ${is_stalement}    Page Source Contain    You stalemated    
    Run Keyword If    "${is_hospital}"=="True"
    ...    Run Keywords
    ...    Click Element "${Hospital_button_Hospital}"
    ...    AND    Wait Until Page Ready
    ...    ELSE IF    "${is_stalement}"=="True"
    ...    Run Keywords
    ...    Click Element "${Hospital_button_Continue}"
    ...    AND    Wait Until Page Ready
    ...    AND    Punch Player    ${Account}
    ...    AND    Return From Keyword    
    ...    ELSE    Fail    This case is not handled
    
    Log To Console    Go to profile and verify user is go hospital
    Go To    ${BASE_URL}profiles.php?XID=${Account}[ID]
    Wait Until Page Ready
    Element "${Hospital_button_InHospital}" Should Contains Text "In hospital"