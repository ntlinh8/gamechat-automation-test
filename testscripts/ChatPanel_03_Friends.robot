*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run Keywords    Open Torn Browser With One Account    ${Account}    Firefox    AND    Delete All Friends In ChatPanel
Test Teardown    Run Keyword and Ignore Error    Take Screenshot When Test Failed
Suite Teardown    Close All Browser And Kill Related Process
Default Tags     test
*** Variables ***
${Account}    ${Account_Firefox}
*** Test Cases ***
Friends 01 - Add Friends By Search Function In Chat Panel
    Log To Console    Friends 01 - Add Friends By Search Function In Chat Panel
    Log To Console    Step 01: [Friendtab] Open Friends tab
    Open Subtab In Chat Panel    Friends
    
    Log To Console    Step 02: [Friendtab] Click Search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 03: [Friendtab] Click Faction tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Step 04: [Friendtab] Get the first member in Faction (not me)
    ${first_member_info}=    Get Text From Dynamic Locator    ${ChatPanel-Friends_button_FirstMemberResultSearch}    ${Account}[Name] [${Account}[ID]]
    ${name}    ${id}=    Split String    ${first_member_info}    ${SPACE}  
    Log To Console    The first player is "${name}" with ID "${id}"    
    
    Log To Console    Step 05: [Friendtab] Add Faction member to Friends
    Click Dynamic Element    ${ChatPanel_text_DynamicResultSearch}    ${first_member_info}
    
    Log To Console    Step 06: [Friendtab] Verify user displays in Friends list
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Friends_text_DynamicFriendByName}    ${name}
    
    Log To Console    Step 07: [Friendtab] Click Search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 08: [Friendtab] Click Company tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 09: [Friendtab] Get the first member in Company (not me)s
    ${first_member_info}=    Get Text From Dynamic Locator    ${ChatPanel-Friends_button_FirstMemberResultSearch}    ${Account}[Name] [${Account}[ID]]
    ${name}    ${id}=    Split String    ${first_member_info}    ${SPACE}  
    Log To Console    The first player is "${name}" with ID "${id}"   
    
    Log To Console    Step 10: [Friendtab] Add Company member to Friends
    Click Dynamic Element    ${ChatPanel_text_DynamicResultSearch}    ${first_member_info}
    
    Log To Console    Step 11: [Friendtab] Verify user displays in Friends list
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Friends_text_DynamicFriendByName}    ${name}
    
    Log To Console    Step 12: [Friendtab] Click Search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 13: [Friendtab] Enter "Anh" to Search textbox
    Input Text "Anh"In Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 14: [Friendtab] Click All tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    All
    
    Log To Console    Step 15: [Friendtab] Get the first member in All tab
    ${first_member_info}=    Get Text From Dynamic Locator    ${ChatPanel-Friends_button_FirstMemberResultSearch}    ${Account}[Name] [${Account}[ID]]
    ${name}    ${id}=    Split String    ${first_member_info}    ${SPACE}  
    Log To Console    The first player is "${name}" with ID "${id}"   
    
    Log To Console    Step 16: [Friendtab] Add this member to Friends
    Click Dynamic Element    ${ChatPanel_text_DynamicResultSearch}    ${first_member_info}
    
    Log To Console    Step 17: [Friendtab] Verify user displays in Friends list
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Friends_text_DynamicFriendByName}    ${name}
    
Friends 02 - Add Friends By Search Function In Website
    [Setup]    Delete All Friends In ChatPanel
    Log To Console    Friends 02 - Add Friends By Search Function In Website
    Log To Console    Step 01: [FriendWeb] Open Friends website
    Go To    ${BASE_URL}friendlist.php
    Wait Until Page Ready
    
    Log To Console    Step 02: [FriendWeb] Click Search textbox
    Click Element "${FriendList_button_AddFriend}"
    Wait Until Page Ready
    Click Element "${FriendList_input_SearchBox}"
        
    Log To Console    Step 03: [FriendWeb] Click Faction tab
    Click Dynamic Element    ${FriendList_button_DynamicMenuTabByLabel}    Faction
    
    Log To Console    Step 04: [FriendWeb] Get the first member in Faction
    ${first_member_info}=    Get Text From Dynamic Locator    ${FriendList_button_FirstMemberInResultSearch}    ${Account}[Name] [${Account}[ID]]
    ${name}    ${id}=    Split String    ${first_member_info}    ${SPACE}  
    Log To Console    The first player is "${name}" with ID "${id}"  

    Log To Console    Step 05: [FriendWeb] Add Faction member to Friends
    Click Dynamic Element    ${FriendList_button_DynamicMemberInResultSearch}    ${first_member_info}
    Click Element "${FriendList_button_Add}"
    
    Log To Console    Step 06: [FriendWeb] Verify user displays in Friends list
    Element Text "${FriendList_text_SuccessMessage}" Should Be Equal To "${name} was added to your friend list."
    Wait Until Dynamic Element Is Visible    ${FriendList_text_DynamicMemberInFriendList}    ${name}
    
    Log To Console    Step 07: [FriendWeb] Click Search textbox
    Click Element "${FriendList_button_AddFriend}"
    Wait Until Page Ready
    Click Element "${FriendList_input_SearchBox}"
    
    Log To Console    Step 08: [FriendWeb] Click Company tab
    Click Dynamic Element    ${FriendList_button_DynamicMenuTabByLabel}    Company
    
    Log To Console    Step 09: [FriendWeb] Get the first member in Company
    ${first_member_info}=    Get Text From Dynamic Locator    ${FriendList_button_FirstMemberInResultSearch}     ${Account}[Name] [${Account}[ID]]
    ${name}    ${id}=    Split String    ${first_member_info}    ${SPACE}  
    Log To Console    The first player is "${name}" with ID "${id}"  
    
    Log To Console    Step 10: [FriendWeb] Add Company member to Friends
    Click Dynamic Element    ${FriendList_button_DynamicMemberInResultSearch}    ${first_member_info}
    Click Element "${FriendList_button_Add}"
    
    Log To Console    Step 11: [FriendWeb] Verify user displays in Friends list
    Element Text "${FriendList_text_SuccessMessage}" Should Be Equal To "${name} was added to your friend list."
    Wait Until Dynamic Element Is Visible    ${FriendList_text_DynamicMemberInFriendList}    ${name}
    
    Log To Console    Step 12: [FriendWeb] Click Search textbox
    Click Element "${FriendList_button_AddFriend}"
    Wait Until Page Ready
    Click Element "${FriendList_input_SearchBox}"
    
    Log To Console    Step 13: [FriendWeb] Enter "A" to Search textbox
    Input Text "A"In Element "${FriendList_input_SearchBox}"
    
    Log To Console    Step 14: [FriendWeb] Click All tab
    Click Dynamic Element    ${FriendList_button_DynamicMenuTabByLabel}    Company
    
    Log To Console    Step 15: [FriendWeb] Get the first member in All tab
    ${first_member_info}=    Get Text From Dynamic Locator    ${FriendList_button_FirstMemberInResultSearch}    ${Account}[Name] [${Account}[ID]]
    ${name}    ${id}=    Split String    ${first_member_info}    ${SPACE}  
    Log To Console    The first player is "${name}" with ID "${id}"  
    
    Log To Console    Step 16: [FriendWeb] Add this member to Friends
    Click Dynamic Element    ${FriendList_button_DynamicMemberInResultSearch}    ${first_member_info}
    Click Element "${FriendList_button_Add}"
    
    Log To Console    Step 17: [FriendWeb] Verify user displays in Friends list
    Element Text "${FriendList_text_SuccessMessage}" Should Be Equal To "${name} was added to your friend list."
    Wait Until Dynamic Element Is Visible    ${FriendList_text_DynamicMemberInFriendList}    ${name}
    
Friends 03 - Compare Friends List Between ChatPanel And Website
    Log To Console    Friends 03 - Compare Friends List Between ChatPanel And Website
    Log To Console    Step 01: [FriendWeb] Open Friends list website
    Go To    ${BASE_URL}friendlist.php
    Wait Until Page Ready
    
    Log To Console    Step 02: [FriendWeb] Get the Friends list
    ${list_from_FriendWeb}=    Get Text List From Element    ${FriendList_text_AllMemberInFriendList}
     
    Log To Console    Step 03: [FriendWeb] Click Search textbox
    Click Element "${FriendList_button_AddFriend}"
    Wait Until Page Ready
    Click Element "${FriendList_input_SearchBox}"
    
    Log To Console    Step 04: [FriendWeb] Click Friends tab
    Click Dynamic Element    ${FriendList_button_DynamicMenuTabByLabel}    Friends
    
    Log To Console    Step 05: [FriendWeb] Get Friends list in Friend tab
    ${list_from_FriendSearchResult}=    Get Text List From Element    ${FriendList_button_AllMemberInResultSearch}

    Log To Console    Step 06: [FriendChatPanel] Open Friends tab in Chatpanel
    Open Subtab In Chat Panel    Friends
    
    Log To Console    Step 07: [FriendChatPanel] Get the Friends list
    ${list_from_FriendTab}=    Get Text List From Element    ${ChatPanel_text_AllMemberInList}
    
    Log To Console    Step 08: [FriendChatPanel] Click to Seach textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 09: [FriendChatPanel] Click to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Friends
    
    Log To Console    Step 10: [FriendChatPanel] Get the Friends list from search result by Friends in Friends tab
    ${list_from_SearchResult_Friendtab}=    Get Text List From Element    ${ChatPanel_text_AllMemberInSearchResult}
    
    Log To Console    Step 11: [BlockedChatPanel] Open Block tab in Chatpanel
    Open Subtab In Chat Panel    Blocked
    
    Log To Console    Step 12: [BlockedChatPanel] Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 13: [BlockedChatPanel] Click to Friends list
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Friends
    
    Log To Console    Step 14: [BlockedChatPanel] Get the Friends list from search Result by Friends in Block tab
    ${list_from_SearchResult_Blocktab}=    Get Text List From Element    ${ChatPanel_text_AllMemberInSearchResult}
    
    Log To Console    Step 15: [BlockedChatPanel] Verify 4 Friends list are the same
    List Should Be Equal Without Index    ${list_from_FriendWeb}    ${list_from_FriendSearchResult}    
    List Should Be Equal Without Index    ${list_from_FriendWeb}    ${list_from_FriendTab}    
    List Should Be Equal Without Index    ${list_from_FriendWeb}    ${list_from_SearchResult_Friendtab}    
    List Should Be Equal Without Index    ${list_from_FriendWeb}    ${list_from_SearchResult_Blocktab}    

Friends 04 - Init Chat In Chat Panel
    Log To Console    Friends 04 - Init Chat In Chat Panel
    Log To Console    Step 01: Open Friends tab in Chatpanel
    Open Subtab In Chat Panel    Friends
    
    Log To Console    Step 02: Enter ${Account_Chrome}[Name] into textbox    
    Input Text "${Account_Chrome}[Name]"In Element "${ChatPanel_input_SearchUser}"
   
    Log To Console    Step 03: Verify ${Account_Chrome}[Name] displays in search result list
    Wait Until Dynamic Element Is Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 04: Click to ${Account_Chrome}[Name]
    Click Dynamic Element    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 05: Verify ${Account_Chrome}[Name] is exist in Friends list
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Friends_text_DynamicFriendByName}    ${Account_Chrome}[Name]
    
    Log To Console    Step 06: Click start chat with ${Account_Chrome}[Name] in Friends list
    Click Dynamic Element    ${ChatPanel-Friends_button_DynamicChatIconByName}    ${Account_Chrome}[Name]
    
    Log To Console    Step 07: Verify chatroom with ${Account_Chrome}[Name] is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account_Chrome}[Name]
    
    Log To Console    Step 08: Send new message
    Send Message To Chatroom    ${Account_Chrome}[Name]
    Click Dynamic Element    ${Chatroom_button_DynamicCloseButton}    ${Account_Chrome}[Name]
    
    Log To Console    Step 09: Open Chats tab in Chatpanel
    Open Subtab In Chat Panel    Chats
    
    Log To Console    Step 10: Verify chatroom displays with correct messages
    ${actual_last_message}    Get Text In Element "${ChatPanel-Chats_button_LastMessageOfFirstRoom}"
    Should Be Equal    ${Account}[Name] : ${message}    ${actual_last_message}
    
Friends 05 - Delete Friends In Chat Panel
    Log To Console    Friends 05 - Delete Friends In Chat Panel
    Log To Console    Step 01: Open Friends tab in Chatpanel
    Open Subtab In Chat Panel    Friends
    
    Log To Console    Step 02: Get the first Friend name
    ${name}=    Get Text In Element "${ChatPanel_text_AllMemberInList}"
    
    Log To Console    Step 03: CLick to Delete icon
    Click Dynamic Element    ${ChatPanel-Friends_button_DynamicDeleteIconByUsername}    ${name}
    
    Log To Console    Step 04: Verify friend not displays in Friends list
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${ChatPanel-Friends_text_DynamicFriendByName}    ${name}
    
    Log To Console    Step 05: Open Friends website
    Go To    ${BASE_URL}friendlist.php
    Wait Until Page Ready
    
    Log To Console    Step 06: Verify friend not displays in Friends website
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${FriendList_text_DynamicMemberInFriendList}    ${name}
    