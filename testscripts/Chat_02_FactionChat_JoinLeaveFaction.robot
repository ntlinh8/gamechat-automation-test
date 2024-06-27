*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run Keywords    Open Torn Browser    AND    Leave From Faction
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process

*** Test Cases ***
FactionChat 01 - Join Faction - Leave Faction
    [Documentation]    
    ...    Flow: 
    ...    1. A in Chrome, B in Firefox
    ...    2. A request to join to Faction, B accept A join to Faction, B verify A exist in Faction list and the result search by Faction (Join To Faction keyword)
    ...    3. In Chrome, A verify B exist in Faction list and the result search by Faction
    ...    4. In Chrome, A verify Faction chat exist with no messages 
    ...    5. A leave faction
    ...    6. In Chrome, Verify Faction chat disappears
    ...    7. In Chrome, A verify that B is not exist in Faction list and the result search by Faction 
    ...    8. In Firefox, A verify B is not exist in Faction list and the result search by Faction

    Log To Console    FactionChat 01 - Join Faction - Leave Faction    
    
    Log To Console    === Part 1: Join Faction ===    
    Log To Console    Step 01: Join to Faction    
    Join To Faction
    
    Log To Console    Step 02: Open Chat panel
    Open Chat Panel
    
    Log To Console    Step 03: Go to Faction menu
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Faction
    
    Log To Console    Step 04: Verify user displays in Faction list
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Faction_text_DynamicFriendByName}    ${Account_Firefox}[Name]        #issue
    
    Log To Console    Step 05: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 06: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 07: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 08: Verify ${Account_Firefox}[Name] displays in result list
    Wait Until Dynamic Element Is Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]
    
    Log To Console    Step 09: Go to Blocked tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 10: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 11: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 12: Verify ${Account_Firefox}[Name] displays in result list
    Wait Until Dynamic Element Is Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]
    
    Log To Console    Step 13: Setting Faction chat is enable
    Open Group Chat    Faction
    
    Log To Console    Step 14: Verify Faction chat is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Faction
    
    Log To Console    Step 15: Verify there's no messages in Faction chat
    Wait Until Dynamic Element Is Not Visible With Timeout    30s    ${Chatroom_message_DynamicAllContentByChatname}    Faction
    
    Log To Console    === Part 2: Leave Faction ===
    Log To Console    Step 16: Leave Faction   
    Leave From Faction
    
    Log To Console    Step 17: Verify Faction chat disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Faction  

    Log To Console    Step 18: Open Chat panel
    Open Chat Panel
    
    Log To Console    Step 19: Go to Faction menu
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Faction
    
    Log To Console    Step 20: Verify "You don't have any faction mates yet" message displays
    Wait Until Page Contains Text "You don't have any faction mates yet"
    
    Log To Console    Step 21: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 22: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 23: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 24: Verify ${Account_Firefox}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]

    Log To Console    Step 25: Verify "No person could be found" message displays
    Wait Until Page Contains Text "No person could be found"
    
    Log To Console    Step 26: Go to Blocked tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 27: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 28: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 29: Verify ${Account_Firefox}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]

    Log To Console    Step 30: Verify "No person could be found" message displays
    Wait Until Page Contains Text "No person could be found"

    Log To Console    Step 31: Switch to Firefox and Open Chat panel
    Switch Browser    ${FirefoxID}
    Open Chat Panel
    
    Log To Console    Step 32: Go to Faction menu
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Faction
    
    Log To Console    Step 33: Verify user disappears in Faction list
    # Wait Until Dynamic Element Is Not Visible With Timeout    15s    ${ChatPanel-Faction_text_DynamicFriendByName}    ${Account_Chrome}[Name]        #issue
    
    Log To Console    Step 34: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 35: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 36: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 37: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 38: Go to Blocked tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 39: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 40: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 41: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
FactionChat 02 - Join Faction - Kick out
    [Documentation]    
    ...    Flow: 
    ...    1. A in Chrome, B in Firefox
    ...    2. A request to join to Faction, B accept A join to Faction, B verify A exist in Faction list and the result search by Faction (Join To Faction keyword)
    ...    3. In Firefox, B kick A out off faction
    ...    4. In Firefox, B verify A is not exist in Faction list and the result search by Faction
    ...    5. In Chrome, Verify Faction chat disappears
    ...    6. In Chrome, A verify that B is not exist in Faction list and the result search by Faction 
    
    Log To Console    FactionChat 02 - Join Faction - Kick out  
    
    Log To Console    === Part 1: Join Faction ===   
    Log To Console    Step 01: Join to Faction    
    Join To Faction
    
    Log To Console    === Part 1: Kick user from faction ===   
    Log To Console    Step 02: Switch to Firefox
    Switch Browser    ${FirefoxID}
    Sleep    2s
    Go To    ${Base_URL}
    Wait Until Page Ready
    Go To    ${Base_URL}factions.php?step=your&type=1#/tab=controls&option=members
    Wait Until Page Ready
    
    Log To Console    Step 03: Kick ${Account_Chrome}[Name] out off Faction   
    Click Dynamic Element    ${Faction_button_DynamicKickOffButtonByLabel}    ${Account_Chrome}[Name]
    
    Log To Console    Step 04: Enter the reason    
    Input Text "Testing"In Element "${Faction_input_ReasonToKick}"
    
    Log To Console    Step 05: Click Yes button
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    Yes
    
    Log To Console    Step 06: Verify kick successful
    Wait Until Page Contains Text "You kicked ${Account_Chrome}[Name] out of the faction." 
    
    Log To Console    Step 07: Open Chat panel
    Open Chat Panel
    
    Log To Console    Step 08: Go to Faction tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Faction
    
    Log To Console    Step 09: Verify user NOT displays in Faction list
    # Wait Until Dynamic Element Is Not Visible With Timeout    15s    ${ChatPanel-Faction_text_DynamicFriendByName}    ${Account_Chrome}[Name]        #issue
    
    Log To Console    Step 10: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 11: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 12: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 13: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 14: Go to Blocked tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 15: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 16: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 17: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 18: Switch to Chrome
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 19: Open Chat panel
    Open Chat Panel
    
    Log To Console    Step 20: Go to Faction menu
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Faction
    
    Log To Console    Step 21: Verify "You don't have any faction mates yet" message displays
    Wait Until Page Contains Text "You don't have any faction mates yet"
    
    Log To Console    Step 22: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 23: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 24: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 25: Verify ${Account_Firefox}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]
    
    Log To Console    Step 26: Go to Blocked tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 27: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 28: Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 29: Verify ${Account_Firefox}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]

    Log To Console    Step 30: Verify "No person could be found" message displays
    Wait Until Page Contains Text "No person could be found"
    
    Log To Console    Step 31: Verify Faction chat disappears  
    ${Chatroom_button_MinimizedGroupChatByTitle}    Generate Dynamic Locator    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Faction      
    Wait "30s" Until Element "${Chatroom_button_MinimizedGroupChatByTitle}" Is Not Visible 
    
