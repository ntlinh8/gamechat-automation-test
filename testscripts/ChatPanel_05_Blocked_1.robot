*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run Keywords    Open Torn Browser With One Account    ${Account}    Firefox    AND    Delete All Users In Blocked List
Test Teardown    Run Keyword and Ignore Error    Take Screenshot When Test Failed
Suite Teardown    Close All Browser And Kill Related Process
Default Tags     test
*** Variables ***
${Account}    ${Account_Firefox}
&{PlayerIsBlocked1}    ID=1315678    Name=Ghost 
&{PlayerIsBlocked2}    ID=2857221    Name=AIguem 
*** Test Cases ***
Blocked 01 - Add Users By Search Function In Chat Panel
    Log To Console    Blocked 01 - Add Users By Search Function In Chat Panel
    Log To Console    Step 01: [Blockedtab] Open Blocked tab
    Open Subtab In Chat Panel    Blocked
    
    Log To Console    Step 02: [Blockedtab] Click Search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 03: [Blockedtab] Enter "${PlayerIsBlocked1}[Name]" to Search textbox
    Input Text "${PlayerIsBlocked1}[Name]"In Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 04: [Blockedtab] Click All tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    All
    
    Log To Console    Step 05: [Blockedtab] Add this member to Blocked
    Click Dynamic Element    ${ChatPanel_text_DynamicResultSearch}    ${PlayerIsBlocked1}[Name] [${PlayerIsBlocked1}[ID]]
    
    Log To Console    Step 06: [Blockedtab] Verify user displays in Blocked list
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Blocked_text_DynamicFriendByName}    ${PlayerIsBlocked1}[Name]
    
    Log To Console    Step 07: [IgnoreWeb] Go to Ignore list
    Go To    ${BASE_URL}messages.php#/p=ignorelist
    Wait Until Page Ready
    
    Log To Console    Step 08: [IgnoreWeb] Verify user displays in Blocked list
    Wait Until Dynamic Element Is Visible    ${IgnoreList_text_DynamicMemberInIgnoreList}    ${PlayerIsBlocked1}[Name]
    
Blocked 02 - Add Users In Search Function In Website
    Log To Console    Blocked 02 - Add Users In Search Function In Website
    Log To Console    Step 01: [IgnoreWeb] Open Blocked website
    Go To    ${BASE_URL}messages.php#/p=ignorelist
    Wait Until Page Ready
    
    Log To Console    Step 02: [IgnoreWeb] Click Search textbox
    Click Element "${IgnoreList_input_SearchBox}"
        
    Log To Console    Step 03: [IgnoreWeb] Enter "${PlayerIsBlocked2}[Name]" in Search Box
    Input Text "${PlayerIsBlocked2}[Name]"In Element "${IgnoreList_input_SearchBox}" 

    Log To Console    Step 04: [IgnoreWeb] Add member to Blocked
    Click Dynamic Element    ${IgnoreList_button_DynamicMemberInResultSearch}    ${PlayerIsBlocked2}[Name] [${PlayerIsBlocked2}[ID]]
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    IGNORE
    
    Log To Console    Step 05: [IgnoreWeb] Verify user displays in Blocked list
    Element Text "${IgnoreList_text_SuccessMessage}" Should Be Equal To "${PlayerIsBlocked2}[Name] was added to your ignore list"
    Wait Until Dynamic Element Is Visible    ${IgnoreList_text_DynamicMemberInIgnoreList}    ${PlayerIsBlocked2}[Name]
    
    Log To Console    Step 06: [Blockedtab] Open Blocked tab
    Open Subtab In Chat Panel    Blocked
    
    Log To Console    Step 07: [Blockedtab] Verify "${PlayerIsBlocked2}[Name]" exist in Blocked list
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Blocked_text_DynamicFriendByName}    ${PlayerIsBlocked2}[Name]
    
Blocked 03 - Compare Blocked List Between ChatPanel And Ignore List
    Log To Console    Blocked 03 - Compare Blocked List Between ChatPanel And Ignore List
    Log To Console    Step 01: [IgnoreWeb] Open Blocked list website
    Go To    ${BASE_URL}messages.php#/p=ignorelist
    Wait Until Page Ready
    
    Log To Console    Step 02: [IgnoreWeb] Get the Blocked list
    ${list_from_IgnoreWeb}=    Get Text List From Element    ${IgnoreList_text_AllMemberInFriendList}

    Log To Console    Step 03: [BlockedTab] Open Blocked tab in Chatpanel
    Open Subtab In Chat Panel    Blocked
    
    Log To Console    Step 04: [BlockedTab] Get the Blocked list
    ${list_from_BlockedTab}=    Get Text List From Element    ${ChatPanel_text_AllMemberInList}
    
    Log To Console    Step 05: [IgnoreWeb] Verify 2 lists are the same
    List Should Be Equal Without Index    ${list_from_IgnoreWeb}    ${list_from_BlockedTab}    

Blocked 05 - Delete Player In Chat Panel
    Log To Console    Blocked 05 - Delete Player In Chat Panel
    Log To Console    Step 01: [BlockedTab] Open Blocked tab in Chatpanel
    Open Subtab In Chat Panel    Blocked
    
    Log To Console    Step 02: [BlockedTab] Click to Delete icon with account "${PlayerIsBlocked1}[Name]"
    Click Dynamic Element    ${ChatPanel-Blocked_button_DynamicDeleteIconByUsername}    ${PlayerIsBlocked1}[Name]
    Sleep    5s
    
    Log To Console    Step 03: [BlockedTab] Verify user not displays in Blocked list
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${ChatPanel-Blocked_text_DynamicFriendByName}    ${PlayerIsBlocked1}[Name]
    
    Log To Console    Step 04: [IgnoreWeb] Open Ignore website
    Go To    ${BASE_URL}
    Wait Until Page Ready
    Go To    ${BASE_URL}messages.php#/p=ignorelist
    Wait Until Page Ready
    
    Log To Console    Step 05: Verify friend not displays in Friends website
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${IgnoreList_text_DynamicMemberInIgnoreList}    ${PlayerIsBlocked1}[Name]

Blocked 06 - Delete Player In Ignore List
    Log To Console    Friends 06 - Delete Player In Ignore List
    Log To Console    Step 01: [IgnoreWeb] Open Ignore List
    Go To    ${BASE_URL}messages.php#/p=ignorelist
    Wait Until Page Ready
    
    Log To Console    Step 02: [IgnoreWeb] CLick to Delete icon with account "${PlayerIsBlocked2}[Name]"
    Click Dynamic Element    ${IgnoreList_button_DynamicDeleteButtonByUserName}    ${PlayerIsBlocked2}[Name]
    Wait Until Page Ready

    Log To Console    Step 03: [IgnoreWeb] Verify user not displays in Blocked list
    Element Text "${IgnoreList_text_SuccessMessage}" Should Be Equal To "This person has been removed from your ignore list."
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${IgnoreList_text_DynamicMemberInIgnoreList}    ${PlayerIsBlocked2}[Name]
    
    Log To Console    Step 04: [BlockedTab] Open Blocked tab in Chatpanel
    Open Subtab In Chat Panel    Blocked
    
    Log To Console    Step 05: [BlockedTab] Verify user not displays in Blocked list
    Wait Until Dynamic Element Is Not Visible With Timeout    5s    ${ChatPanel-Blocked_text_DynamicFriendByName}    ${PlayerIsBlocked2}[Name]
