*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Run Keywords    Open Torn Browser    AND    Quit Job
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Run keywords    Close All Chatroom And Reset Setting    AND    Close All Browser And Kill Related Process
Default Tags     test
*** Test Cases ***
CompanyChat 01 - Join Company - Leave Company
    Log To Console    CompanyChat 01 - Join Company - Leave Company    
    
    Log To Console    === Part 1: Join Company ===    
    Log To Console    Step 01: Join to Company    
    Join To Company
    
    Log To Console    Step 02: Open Chat panel
    Open Chat Panel
    
    Log To Console    Step 03: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 04: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 05: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 06: Verify ${Account_Firefox}[Name] displays in result list
    Wait Until Dynamic Element Is Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]
    
    Log To Console    Step 07: Go to Blocked tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 08: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 09: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 10: Verify ${Account_Firefox}[Name] displays in result list
    Wait Until Dynamic Element Is Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]
    
    Log To Console    Step 11: Open group chat: Company   
    Open Group Chat    Company
    
    Log To Console    Step 12: Verify Company chat is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    Company
    
    Log To Console    Step 13: Verify there's no messages in Company chat
    Wait Until Dynamic Element Is Not Visible With Timeout    15s    ${Chatroom_message_DynamicAllContentByChatname}    Company
    
    Log To Console    === Part 2: Quit Job - Leave Company ===
    Log To Console    Step 14: Quit job
    Quit Job
    
    Log To Console    Step 15: Verify Company chat disappears
    Wait Until Dynamic Element Is Not Visible    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Company  
    
    Log To Console    Step 16: Open Chat panel
    Open Chat Panel
    
    Log To Console    Step 17: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 18: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 19: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 20: Verify ${Account_Firefox}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]

    Log To Console    Step 21: Verify "No person could be found" message displays
    Wait Until Page Contains Text "No person could be found"
    
    Log To Console    Step 22: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 23: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 24: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 25: Verify ${Account_Firefox}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Firefox}[Name] [${Account_Firefox}[ID]]

    Log To Console    Step 26: Verify "No person could be found" message displays
    Wait Until Page Contains Text "No person could be found"

    Log To Console    Step 27: Switch to Firefox and Open Chat panel
    Switch Browser    ${FirefoxID}
    Open Chat Panel
    
    Log To Console    Step 28: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 29: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 30: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 31: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 32: Go to Blocked tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 33: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 34: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 35: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
CompanyChat 02 - Join Company - Kick out
    Log To Console    CompanyChat 02 - Join Company - Kick out  
    
    Log To Console    === Part 1: Join Company ===   
    Log To Console    Step 01: Join to Company    
    Join To Company
    
    Log To Console    === Part 1: Fire user from Company ===   
    Log To Console    Step 02: Switch to Firefox
    Switch Browser    ${FirefoxID}
    Go To    ${Base_URL}
    Wait Until Page Ready
    Go To    ${Base_URL}companies.php?step=your&type=1#/option=employees
    Wait Until Page Ready
    
    Log To Console    Step 03: Kick ${Account_Chrome}[Name] out off Company   
    Click Dynamic Element    ${Company_button_DynamicFireButtonByLabel}    ${Account_Chrome}[Name]
    
    Log To Console    Step 04: Enter the reason    
    Input Text "Testing"In Element "${Company_input_ReasonToFire}"
    
    Log To Console    Step 05: Click Yes button
    Click Element "${Company_button_ConfirmFireButton}"
    
    Log To Console    Step 06: Verify fire successful
    Wait Until Page Contains Text "You have fired ${Account_Chrome}[Name]!" 
    
    Log To Console    Step 07: Open Chat panel
    Open Chat Panel
    
    Log To Console    Step 08: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 09: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 10: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 11: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 12: Go to Blocked tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 13: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 14: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 15: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 16: Switch to Chrome
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 17: Open Chat panel
    Open Chat Panel
    
    Log To Console    Step 18: Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Step 19: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 20: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 21: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 22: Verify "No person could be found" message displays
    Wait Until Page Contains Text "No person could be found"
    
    Log To Console    Step 23: Go to Blocked tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Blocked
    
    Log To Console    Step 24: Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Step 25: Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Step 26: Verify ${Account_Chrome}[Name] NOT displays in result list
    Wait Until Dynamic Element Is Not Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Step 27: Verify "No person could be found" message displays
    Wait Until Page Contains Text "No person could be found"
    
    Log To Console    Step 28: Verify Company chat disappears  
    ${Chatroom_button_MinimizedGroupChatByTitle}    Generate Dynamic Locator    ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    Company      
    Wait "30s" Until Element "${Chatroom_button_MinimizedGroupChatByTitle}" Is Not Visible 

