*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run Keywords    Open Torn Browser    AND    Switch Browser    ${ChromeID}    AND    Delete All Users In Blocked List
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Close All Browser And Kill Related Process
Default Tags    test
*** Variables ***

*** Test Cases ***
Integration 01 - Friend > Met > Block
    Log To Console    ===== ROUND 1 =====
    Log To Console    Step 01: Init Chat From Friend Tab
    Switch Browser    ${ChromeID}
    Open Chatroom From Friend Tab    ${Account_Firefox}
    
    Log To Console    Step 02: Send a new message
    Send Message To Chatroom    ${Account_Firefox}[Name]   
    
    Log To Console    Step 03: Verify Player display in Met List with Chat icon
    Open Subtab In Chat Panel    Met
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Met_button_DynamicChatIconByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 04: Block Player from chatroom
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Click Dynamic Element    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]    
    Click Dynamic Element    ${Chatroom_button_DynamicExpandOption}    Block
    Click Dynamic Element    ${Chatroom_button_DynamicConfirmationOption}    Yes
    Click Dynamic Element    ${Chatroom_button_DynamicCloseButton}    ${Account_Firefox}[Name] 
    
    Log To Console    Step 05: Verify "${Account_Firefox}[Name]" Player displays in Met List without Chat icon
    Open Subtab In Chat Panel    Met
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Met_text_DynamicFriendByName}    ${Account_Firefox}[Name]
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${ChatPanel-Met_button_DynamicChatIconByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 06: Verify "${Account_Firefox}[Name]" Player displays in Friend List without Chat icon
    Open Subtab In Chat Panel    Friends
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Friends_text_DynamicFriendByName}    ${Account_Firefox}[Name]
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${ChatPanel-Friends_button_DynamicChatIconByName}    ${Account_Firefox}[Name]
    
    Log To Console    ===== ROUND 2 =====
    Log To Console    Step 07: Delete User from Block tab
    Open Subtab In Chat Panel    Blocked
    Click Dynamic Element    ${ChatPanel-Blocked_button_DynamicDeleteIconByUsername}    ${Account_Firefox}[Name]
    Sleep    3s
    
    Log To Console    Step 08: Verify Player displays in Met List with Chat icon
    Open Subtab In Chat Panel    Met
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Met_button_DynamicChatIconByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 09: Verify "${Account_Firefox}[Name]" Player displays in Friend List with Chat icon
    Open Subtab In Chat Panel    Friends
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Friends_button_DynamicChatIconByName}    ${Account_Firefox}[Name]
    
Integration 02 - Faction > Block
    Log To Console    Integration 02 - Faction > Block
    Log To Console    ===== ROUND 1 =====
    Log To Console    Step 01: Join Faction
    Join To Faction
    
    Log To Console    Step 02: Start a chat from Faction tab
    Switch Browser    ${ChromeID}
    Open Subtab In Chat Panel    Faction
    Click Dynamic Element    ${ChatPanel-Met_button_DynamicChatIconByName}    ${Account_Firefox}[Name]
    
    Log To Console    Step 03: Send a new message
    Send Message To Chatroom    ${Account_Firefox}[Name]    
    
    Log To Console    Step 04: Block player from Chatroom
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Click Dynamic Element    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Firefox}[Name]    
    Click Dynamic Element    ${Chatroom_button_DynamicExpandOption}    Block
    Click Dynamic Element    ${Chatroom_button_DynamicConfirmationOption}    Yes
    Click Dynamic Element    ${Chatroom_button_DynamicCloseButton}    ${Account_Firefox}[Name] 
    
    Log To Console    Step 05: Verify "${Account_Firefox}[Name]" Player displays in Faction List without Chat icon
    Open Subtab In Chat Panel    Faction
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Faction_text_DynamicFriendByName}    ${Account_Firefox}[Name]
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${ChatPanel-Faction_button_DynamicChatIconByName}    ${Account_Firefox}[Name]
    
    Log To Console    ===== ROUND 2 ======
    Log To Console    Step 06: Delete User from Block tab
    Switch Browser    ${ChromeID}
    Open Subtab In Chat Panel    Blocked
    Click Dynamic Element    ${ChatPanel-Blocked_button_DynamicDeleteIconByUsername}    ${Account_Firefox}[Name]
    Sleep    3s
    
    Log To Console    Step 07: Verify "${Account_Firefox}[Name]" Player displays in Faction List with Chat icon
    Open Subtab In Chat Panel    Faction
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Faction_button_DynamicChatIconByName}    ${Account_Firefox}[Name]
