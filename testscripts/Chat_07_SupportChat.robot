*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Setup For Support Chat
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
*** Variables ***
${Anonymous_Name}    AutoTesterFromTorn
*** Test Cases ***
SupportChat 01 - Collapse And Expand
    Log To Console    SupportChat 01 - Collapse And Expand    
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Support chat is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Support
    
    Log To Console    Step 02: Verify Scroll Function of Support chat
    Verify Scroll Function Work Properly    Support
    
    Log To Console    Step 03: Click Collapse button
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizeButton}    Support
    
    Log To Console    Step 04: Verify Support chat is not open
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Support
    [Teardown]    Open Group Chat    Support
    
SupportChat 02 - Apply Notification - Disable
    Log To Console    SupportChat 02 - Apply Notification - Disable 
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Support is disable    
    Setting For Chatroom    Support    Disable

    Log To Console    Step 02: Verify Support chat disappears   
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Support   
    [Teardown]    Open Group Chat    Support
    
SupportChat 03 - Apply Notification - Enable - Send/Receive Message
    Log To Console    SupportChat 03 - Apply Notification - Enable - Send/Receive Message 
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Support is enable
    Setting For Chatroom    Support    Enable
    
    Log To Console    Step 02: Verify Support chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Support    
    
    Log To Console    Step 03: Minimize Support chat
    Minimize Chatroom    Support
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Support chat
    Switch Browser    ${FirefoxID}
    Send Message To From Anonymous
    
    Log To Console    Step 05: Switch to Chrome and verify no flash displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Support

    Log To Console    Step 06: Open Support chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Support    
    
    Log To Console    Step 07: Verify received message is correct
    Verify Message Display In Chatroom    Support
    
    Log To Console    Step 08: Send Message to support chat from admin
    Send Message To Chatroom    Support    
    
    Log To Console    Step 09: Switch To Firefox and verify received messages
    Switch Browser    ${FirefoxID}
    Wait Until Dynamic Element Is Visible    ${Contact_input_DynamicMessageByLabelAndContent}    Support    ${message}

SupportChat 04 - Apply Notification - Flash Notifier
    Log To Console    SupportChat 04 - Apply Notification - Flash Notifier 
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Support is Flash notifier
    Setting For Chatroom    Support    Flash notifier
    
    Log To Console    Step 02: Verify Support chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Support    
    
    Log To Console    Step 03: Minimize Support chat
    Minimize Chatroom    Support
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Support chat
    Switch Browser    ${FirefoxID}
    Send Message To From Anonymous
    
    Log To Console    Step 05: Switch to Chrome and verify no flash displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Support
    
    Log To Console    Step 06: Open Support chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Support   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    Support
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Support
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Support

SupportChat 05 - Apply Notification - Flash and Sound
    Log To Console    SupportChat 05 - Apply Notification - Flash and Sound
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 01: Setting Support is Flash & sound
    Setting For Chatroom    Support    Flash & sound
    
    Log To Console    Step 02: Verify Support chat appears  
    Wait Until Dynamic Element Is Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Support    
    
    Log To Console    Step 03: Minimize Support chat
    Minimize Chatroom    Support
    
    Log To Console    Step 04: Switch to Firefox and send a new message to Support chat
    Switch Browser    ${FirefoxID}
    Send Message To From Anonymous
    
    Log To Console    Step 05: Switch to Chrome and verify flash displays
    Switch Browser    ${ChromeID}
    Wait Until Dynamic Element Is Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Support
    
    Log To Console    Step 06: Open Support chat
    Click Dynamic Element    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Support   
    
    Log To Console    Step 07: Click to enter messages textbox
    Click Dynamic Element    ${Chatroom_input_DynamicChatTextBoxByChatname}    Support
    
    Log To Console    Step 08: Verify the flash disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    Support
    
    Log To Console    Step 09: Verify the received message displays with the correct value
    Verify Message Display In Chatroom    Support
    
SupportChat 06 - Init Private Chat From Support Chat
    Log To Console    SupportChat 06 - Apply Notification - Flash and Sound 
    Log To Console    Step 01: Send message to Support chat from Anonymous
    Switch Browser    ${FirefoxID}
    Send Message To From Anonymous
       
    Log To Console    Step 02: Switch to Chrome, and open Support chat
    Switch Browser    ${ChromeID}
    Open Group Chat    Support
    
    Log To Console    Step 03: Click to "${Anonymous_Name}" in Chatroom
    ${Chatroom_text_UserNameByLabel}=    Generate Dynamic Locator    (${Chatroom_text_DynamicUserNameByLabel})[last()]    Support    ${Anonymous_Name}     
    Wait Until Keyword Succeeds    5s    0.25s    Scroll To Element       ${Chatroom_text_UserNameByLabel}
    Wait Until Keyword Succeeds    5s    0.25s    Click Element    ${Chatroom_text_UserNameByLabel} 

    Log To Console    Step 04: Verify init private chat with "${Anonymous_Name}" successfully
    Wait Until Dynamic Element Is Visible With Timeout    15s    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Anonymous_Name}

    Log To Console    Step 05: Send message to "${Anonymous_Name}"
    Send Message To Chatroom    ${Anonymous_Name}    

    Log To Console    Step 06: Switch Firefox, verify Private chat with admin occurs
    Switch Browser    ${FirefoxID}
    
    Log To Console    Step 07: Verify Admin chat display in Anonymous view
    Wait Until Dynamic Element Is Visible    ${Contact_button_DynamicHeaderMenuByLabel}    ${Account_Chrome}[Name]
    
    Log To Console    Step 08: Open chat with admin
    Click Dynamic Element    ${Contact_button_DynamicHeaderMenuByLabel}    ${Account_Chrome}[Name]
    
    Log To Console    Step 09: Verify "${message}" message displays in Private chat with admin
    Wait Until Dynamic Element Is Visible    ${Contact_input_DynamicMessageByLabelAndContent}    ${Account_Chrome}[Name]    ${message}
    
    Log To Console    Step 10: Send message from anonymous
    Send Message To From Anonymous    ${Account_Chrome}[Name]
    
    Log To Console    Step 11: Switch To Chrome, verify admin receives the new message from anonymous in Private chat
    Switch Browser    ${ChromeID}
    Verify Message Display In Chatroom     ${Anonymous_Name}    

*** Keywords ***
Setup For Support Chat
    Log To Console    Suite Setup - Setup For Support Chat    
    Open Torn Browser For Support Chat
    
    Log To Console    Suite Setup - Switch To Chrome, open Support chat
    Switch Browser    ${ChromeID}
    Open Group Chat    Support
    
    Log To Console    Suite Setup - Go to Contact room
    Switch Browser    ${FirefoxID}
    Go To    ${BASE_URL}contact/
    Wait Until Page Ready
    Input Text "${Anonymous_Name}"In Element "${Contact_input_EnterName}"
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    JOIN
    Wait Until Page Ready
    ${status}=    Run Keyword And Return Status    Wait Until Dynamic Element Is Visible With Timeout    3s    ${Contact_input_EnterMessage}    
    Run Keyword If    "${status}"=="False"
    ...   Wait Until Keyword Succeeds    3x    1x
    ...    Run Keywords
    ...    Reload Page
    ...    AND    Accept The Confirm
    ...    AND    Wait Until Page Ready
    ...    AND    Sleep    8s
    ...    AND    Wait Until Element "${Contact_input_EnterMessage}" Is Visible
    
Open Torn Browser For Support Chat
    [Arguments]    ${ChromeAccount}=${Account_Chrome}    
    Log To Console    Open Torn Browser For Support Chat    
    ${chrome}    Open Browser    ${URL}    Chrome
    Set Selenium Implicit Wait    ${SELENIUM_LONG_IMPLICITWAIT}
    Wait Until Page Ready
    Set Browser To The Position    LEFT
    Login Page    ${ChromeAccount}
    Close All Chatroom And Reset Setting
    Set Global Variable    ${ChromeID}    ${chrome}

    Log To Console    Open Torn web in Firefox
    ${firefox}    Open Browser    ${URL}    Firefox
    Add Cookie    cf_clearance    ${Account_Firefox}[cf_clearance]    
    Add Cookie    ${Account_Firefox}[at]    ${Account_Firefox}[at_value]   
    Go To      ${BASE_URL}
    Wait Until Page Ready
    Set Selenium Implicit Wait    ${SELENIUM_LONG_IMPLICITWAIT}
    Wait Until Page Ready
    Set Browser To The Position    RIGHT
    Set Global Variable    ${FirefoxID}    ${firefox}
    
Send Message To From Anonymous
    [Arguments]    ${chatname}=Support    ${value}=This is Automation Test from Torn. Please ignore-
    Log To Console    Send Message To From Anonymous    
    ${time}=    Get Current Date    result_format=%m%d%H%M%S
    Set Global Variable    ${message}    ${value}${time}
    
    Log To Console    Enter message "${message}"
    Input Text "${message}"In Element "${Contact_input_EnterMessage}"
    Press Keys    ${None}    ENTER
    Wait Until Page Ready
    
    Log To Console    Verify "${message}" message is sent successfully   
    Wait Until Dynamic Element Is Visible    ${Contact_input_DynamicMessageByLabelAndContent}    ${chatname}    ${message}
    
    