*** Settings ***
Resource    ../common/settings.robot
Suite Setup    Open Torn Browser    
Test Teardown    Run Keyword And Ignore Error    Take Screenshot When Test Failed    
Suite Teardown    Run Keyword And Ignore Error    Close All Browser And Kill Related Process
Default Tags    test
*** Variables ***
*** Test Cases ***
Admin 01 - Ban And Unban
    Log To Console    Admin 01 - Ban And Unban
    Log To Console    Step 01: Go to Add Chat Ban page
    Switch Browser    ${ChromeID}
    Go To    ${BASE_URL}admin/chatban.php
    Wait Until Page Ready
    Click Element "${Admin-ChatBan_button_GoToAddBanPage}"
    Wait Until Page Ready
    
    Log To Console    Step 02: Enter player id
    Clear And Input Text In Dynamic Element    ${Account_Firefox}[ID]    ${Main_input_DynamicTextboxByName}    userID
    
    Log To Console    Step 03: Enter duration
    Clear And Input Text In Dynamic Element    1    ${Main_input_DynamicTextboxByName}    days
    
    Log To Console    Step 04: Click add a ban
    Click Element "${Admin-ChatBan_button_AddBan}"
    Wait Until Page Ready    
    
    Log To Console    Step 05: Back to chat ban page
    Go To    ${BASE_URL}admin/chatban.php
    Wait Until Page Ready
    
    Log To Console    Step 06: Enter player id
    Clear And Input Text In Dynamic Element    ${Account_Firefox}[ID]    ${Main_input_DynamicTextboxByName}    userid    

    Log To Console    Step 07: Click search player
    Click Element "${Admin-ChatBan_button_SearchBan}"
    
    Log To Console    Step 08: Verify add ban successful
    Wait Until Dynamic Element Is Visible    ${Admin-ChatBan_text_ResultSearchByIdAndTime}    ${Account_Firefox}[ID]    1
    
    Log To Console    Step 09: Switch to Firefox
    Switch Browser    ${FirefoxID}
    
    Log To Console    Step 10: Verify chat not displays
    Wait Until Dynamic Element Is Not Visible With Timeout    10s    ${Main_button_DynamicButtonByClass}    chat-list-button  
    Wait Until Element "${Main_button_AllMinimizedChat}" Is Not Visible
    
    Log To Console    Step 11: Reload page
    Reload Page
    Wait Until Page Ready
    Sleep    5s
    
    Log To Console    Step 12: Verify chat not displays
    Wait Until Dynamic Element Is Not Visible With Timeout    10s    ${Main_button_DynamicButtonByClass}    chat-list-button  
    Wait Until Element "${Main_button_AllMinimizedChat}" Is Not Visible
    
    Log To Console    Step 13 Switch to Chrome
    Switch Browser    ${ChromeID}
    
    Log To Console    Step 14: Click delete ban
    Click Element "${Admin-ChatBan_text_DeleteBanChat}"
    
    Log To Console    Step 15: Back to chat ban page
    Go To    ${BASE_URL}admin/chatban.php
    Wait Until Page Ready
    
    Log To Console    Step 16: Enter player id
    Clear And Input Text In Dynamic Element    ${Account_Firefox}[ID]    ${Main_input_DynamicTextboxByName}    userid    

    Log To Console    Step 17: Click search player
    Click Element "${Admin-ChatBan_button_SearchBan}"
    
    Log To Console    Step 17: Verify unban successful
    Wait Until Dynamic Element Is Not Visible With Timeout    10s    ${Admin-ChatBan_text_ResultSearchByIdAndTime}    ${Account_Firefox}[ID]    1
    
    Log To Console    Step 18: Switch to Firefox
    Switch Browser    ${FirefoxID}
    Wait Until Page Ready
    Sleep    5s
    
    Log To Console    Step 19: Verify chat displays
    Wait Until Dynamic Element Is Visible    ${Main_button_DynamicButtonByClass}    chat-list-button  
    Wait Until Element "${Main_button_AllMinimizedChat}" Is Visible
    