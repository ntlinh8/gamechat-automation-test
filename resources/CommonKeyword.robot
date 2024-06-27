*** Settings ***
Resource    ../common/settings.robot

*** Variables ***
${message}    ${EMPTY}

&{Faction}    Name=ZEON    ID=47164
&{Company}    Name=AnhTa03's Candle Shop    ID=103104

*** Keywords ***
Open Torn Browser
    [Arguments]    ${ChromeAccount}=${Account_Chrome}    ${FireforAccount}=${Account_Firefox}
    Log To Console    Open Torn web in Chrome    
    ${chrome}    Open Browser    ${URL}    Chrome
    Set Selenium Implicit Wait    ${SELENIUM_LONG_IMPLICITWAIT}
    Wait Until Page Ready
    Set Browser To The Position    LEFT
    Login Page    ${ChromeAccount}
    Close All Chatroom And Reset Setting
    Set Global Variable    ${ChromeID}    ${chrome}

    Log To Console    Open Torn web in Firefox
    ${firefox}    Open Browser    ${URL}    Firefox
    Set Selenium Implicit Wait    ${SELENIUM_LONG_IMPLICITWAIT}
    Wait Until Page Ready
    Set Browser To The Position    RIGHT
    Login Page    ${FireforAccount}
    Close All Chatroom And Reset Setting
    Set Global Variable    ${FirefoxID}    ${firefox}

Open Torn Browser With One Account
    [Arguments]    ${Account}=${Account_Chrome}    ${browser}=Chrome
    Log To Console    Open Torn web in ${browser}
    ${browserID}    Open Browser    ${URL}    ${browser}
    Set Selenium Implicit Wait    ${SELENIUM_LONG_IMPLICITWAIT}
    Wait Until Page Ready
    Maximize Browser Window
    Login Page    ${Account}
    Close All Chatroom And Reset Setting
    Run Keyword If    "${browser}"=="Chrome"    Set Global Variable    ${ChromeID}    ${browserID}
    ...    ELSE    Set Global Variable    ${FirefoxID}    ${browserID}
    
Login Page
    [Arguments]    ${Account}
    Log To Console    Login Page with "${Account}[Email]"
    
    Log To Console    Add Cookies    
    Add Cookie    cf_clearance    ${Account}[cf_clearance]    
    Add Cookie    ${Account}[at]    ${Account}[at_value]   
    Go To      ${BASE_URL}
    Wait Until Page Ready
    
    Log To Console    Click Login button
    Click Dynamic Element    ${Main_button_DynamicButtonByClass}    loginBtn
    
    Log To Console    Enter "${Account}[Email]" Email and "${Account}[Password]" Password
    Clear And Input Text In Dynamic Element    ${Account}[Email]    ${Main_input_DynamicTextboxByID}    player       
    Clear And Input Text In Dynamic Element    ${Account}[Password]    ${Main_input_DynamicTextboxByID}    password    
       
    Log To Console    Click Login button
    Click Element "${Login_button_LoginButton}"
    Wait Until Page Ready
    
    Log To Console    Click close warning message    
    Close Warning Message
    
    Log To Console    Verify Login successful by Chat Panel and Minimized Chat button displays    
    Wait Until Dynamic Element Is Visible    ${Main_button_DynamicButtonByClass}    chat-list-button  
    Wait Until Element "${Main_button_AllMinimizedChat}" Is Visible
    
Close Warning Message
    Log To Console    Close Warning Message    
    Click To Element If Element Visible    ${Main_button_CloseWarningButtonMobile}
    Click To Element If Element Visible    ${Main_button_CloseWarningButtonDesktop}
    Wait Until Element "${Main_area_WarningMessage}" Is Not Visible
   
Open Admin Page
    Open New Tab With "${BASE_URL}admin/index.php"
    
Close Admin Page
    Close The Current Tab
    
Set Browser To The Position
    [Arguments]    ${position}=LEFT
    Log To Console    Set Browser To The Position: "${position}" 
    
    Log To Console    Maximize Browser Window to get size       
    Maximize Browser Window
    Sleep    3s    
    ${screen_height}=    Get Window Height
    ${screen_width}=    Get Window Width
    Log To Console    Size of screen is "${screen_height}x${screen_width}"
    
    Log To Console    Caculate size for screen
    ${width}    Evaluate    ${screen_width}/2  
    ${height}    Evaluate    ${screen_height}-0
    
    Log To Console    Set window size: "${height}x${width}"
    Set Window Size    ${height}    ${width}    
    
    Log To Console    Set position for window to "${position}"
    Run Keyword If    "${position}"=="LEFT"    Set Window Position    0    0
    ...    ELSE    Set Window Position    ${width}    0
    
Open Chat Panel
    Click Dynamic Element    ${Main_button_DynamicButtonByClass}    chat-list-button 
    ${is_open}=    Run Keyword And Return Status    Wait "2s" Until Element "${ChatPanel_pop_ChatPanelFrame}" Is Not Visible
    Run Keyword If    "${is_open}"=="True"    Click Dynamic Element    ${Main_button_DynamicButtonByClass}    chat-list-button     

Setting For Chatroom    
    [Arguments]    ${chatroom_name}    ${option}
    Log To Console    Setting For Chatroom    
    
    # cheat code for TC-866
    Run Keyword If    "${chatroom_name}"=="New players"    Set Local Variable    ${chatroom_name}    New Player
    Run Keyword If    "${chatroom_name}"=="Mexico"    Set Local Variable    ${chatroom_name}    Traveling
    Run Keyword If    "${chatroom_name}"=="Hospital"    Set Local Variable    ${chatroom_name}    Jail & Hospital
    
    Log To Console    Click to Chatlist button
    Open Chat Panel
    
    Log To Console    Click to Setting button   
    Click Element "${ChatPanel_button_Setting}" 
    
    Log To Console    Click to setting dropdown with "${chatroom_name}"
    Click Dynamic Element    ${ChatPanel_button_DynamicSettingDropdownByChatName}    ${chatroom_name}
    
    Log To Console    Click to setting option: "${option}"
    Click Dynamic Element    ${ChatPanel_button_DynamicSettingOptionByChatName}    ${chatroom_name}    ${option}
    
    Log To Console    Verify "${option}" is setted
    Dynamic Element Text Should Contains    ${ChatPanel_text_DynamicSettingOptionByChatName}    ${option}        ${chatroom_name}
    
    Log To Console    Close Setting pop
    Click Dynamic Element    ${Main_button_DynamicButtonByClass}    settings-header__close-button

Open Subtab In Chat Panel
    [Arguments]    ${sub_tab_name}
    Log To Console    Open Subtab In Chat Panel    
    Open Chat Panel
    ${att_value}=    Get Attribute From Dynamic Locator    class    ${ChatPanel_button_DynamicMenuByLabel}    ${sub_tab_name}
    ${status}=    Run Keyword And Return Status    Should Contain    ${att_value}    active        
    Run Keyword If    "${status}"=="False"
    ...    Run Keywords    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    ${sub_tab_name}
    ...    AND    Sleep    3s
    ...    AND    Wait Until Page Source Not Contain "chat-tab__loader"
    ...    AND    Dynamic Element Attribute Value Should Contain    active    class    ${ChatPanel_button_DynamicMenuByLabel}    ${sub_tab_name}

Open Chatroom From Profile Page
    [Arguments]    ${Account}
    Log To Console    Open Chatroom With ${Account}[Name] From Profile Page
    
    Log To Console    Go to Profile with Account: ${Account}[Name]
    Go To    ${BASE_URL}profiles.php?XID=${Account}[ID]
    Wait Until Page Ready
    
    Log To Console    Wait until the chat icon displays    
    Wait Until Dynamic Element Is Visible    ${Main_button_DynamicButtonByClass}    chat-list-button  
    
    Log To Console    Retry click to Start Chat button until chat room is open 
    ${Chatroom_chatroom_ChatroomFrameByName}=    Generate Dynamic Locator    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account}[Name]    
    Wait Until Keyword Succeeds    3x    1x
    ...    Run Keywords
    ...    Log To Console    Click to Start Chat
    ...    AND    Click Element "${Profile_button_StartChat}"
    ...    AND    Wait "7s" Until Element "${Chatroom_chatroom_ChatroomFrameByName}" Is Visible

Open Chatroom From Friend Tab
    [Arguments]    ${Account}
    Log To Console    Open Chatroom With ${Account}[Name] Account From Friend Tab
    Log To Console    Open chat panel
    Open Chat Panel
    
    Log To Console    Click to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Enter ${Account}[Name] into textbox    
    Input Text "${Account}[Name]"In Element "${ChatPanel_input_SearchUser}"
    Clear And Input Text In Dynamic Element    ${Account}[Name]    ${ChatPanel_input_SearchUser}    
   
    Log To Console    Verify ${Account}[Name] displays in search result list
    Wait Until Dynamic Element Is Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account}[Name] [${Account}[ID]]
    
    Log To Console    Click to ${Account}[Name]
    Click Dynamic Element    ${ChatPanel_text_DynamicResultSearch}    ${Account}[Name] [${Account}[ID]]
    
    Log To Console    Verify ${Account}[Name] is exist in Friends list
    Wait Until Dynamic Element Is Visible    ${ChatPanel-Friends_text_DynamicFriendByName}    ${Account}[Name]
    
    Log To Console    Click start chat with ${Account}[Name] in Friends list
    Click Dynamic Element    ${ChatPanel-Friends_button_DynamicChatIconByName}    ${Account}[Name]
    
    Log To Console    Verify chatroom with ${Account}[Name] is open
    Wait Until Dynamic Element Is Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account}[Name]

Open Chatroom If It's Not Open
    [Arguments]    ${Account}
    ${Chatroom_chatroom_ChatroomFrameByName}    Generate Dynamic Locator    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${Account}[Name]    
    ${is_open}    Run Keyword And Return Status    Wait "3s" Until Element "${Chatroom_chatroom_ChatroomFrameByName}" Is Visible
    Run Keyword If    "${is_open}"=="False"    Open Chatroom From Profile Page    ${Account}

Open Group Chat
    [Arguments]    ${group_chat_name}
    Log To Console    Open Group Chat  
    Log To Console    Click minimized group is exist
    ${is_minimized_chat}=    Run Keyword And Return Status    Wait Until Dynamic Element Is Not Visible With Timeout    2s    ${Chatroom_button_DynamicMinimizeButton}    ${group_chat_name}
    Run Keyword If    "${is_minimized_chat}"=="True"    Setting For Chatroom    ${group_chat_name}    Enable
    Log To Console    Open Group Chat If Not Open    
    ${is_open}=    Run Keyword And Return Status    Wait Until Dynamic Element Is Not Visible With Timeout    2s    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${group_chat_name}
    Run Keyword If    "${is_open}"=="True"    Click Dynamic Element     ${Chatroom_button_DynamicMinimizedGroupChatByTitle}    ${group_chat_name}

Minimize Chatroom
    [Documentation]    This keyword can used for both private and group chat
    [Arguments]    ${chatroom_name}
    Log To Console    Minimize Chatroom    
    ${is_open}=    Run Keyword And Return Status    Dynamic Element Should Be Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${chatroom_name}
    Run Keyword If    "${is_open}"=="True"
    ...    Run Keywords
    ...    Click Dynamic Element     ${Chatroom_button_DynamicMinimizeButton}    ${chatroom_name}
    ...    AND    Wait Until Dynamic Element Is Not Visible    ${Chatroom_chatroom_DynamicChatroomFrameByName}    ${chatroom_name}

Send Message To Chatroom
    [Arguments]    ${chatroom_name}    ${value}=This is Automation Test from Torn. Please ignore-
    Log To Console    Send Message To Chatroom    
    ${time}=    Get Current Date    result_format=%m%d%H%M%S
    Set Global Variable    ${message}    ${value}${time}
    
    Log To Console    Send "${message}" message to chatroom  
    Wait "15s" Until Element "${Main_text_ConnectToServer}" Is Not Visible 
    Clear And Input Text In Dynamic Element    ${message}    ${Chatroom_input_DynamicChatTextBoxByChatname}    ${chatroom_name}
    Sleep    1s
    Press Keys    ${None}    ENTER
    Wait Until Page Ready
    
    Log To Console    Verify "${message}" message is sent   
    Verify Message Display In Chatroom    ${chatroom_name}
    
Get Time Of Message
    [Arguments]    ${chatroom_name}    ${message}
    Log To Console    Get Time Of Message    
    Wait "15s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    
    Log To Console    Click to "${message}" message and get the time of message
    ${Chatroom_message_MessageByChatname}=    Generate Dynamic Locator    ${Chatroom_message_DynamicMessageByChatname}    ${chatroom_name}    ${message}     
    Wait Until Keyword Succeeds    5s    0.25s    Scroll To Element       ${Chatroom_message_MessageByChatname}
    Wait Until Keyword Succeeds    5s    0.25s    Click Element    ${Chatroom_message_MessageByChatname} 
    
    Log To Console    Get Tooltip    
    ${tooltip}    Get Text In Element "${Chatroom_text_TimestamptTooltip}"
    Log To Console    Time of message is ${tooltip}
    
    [Return]    ${tooltip}
    
Verify Message Display In Chatroom
    [Arguments]    ${chatroom_name}    ${expected_message}=${message}    ${timeout}=30s
    Log To Console    Verify Message Display In Chatroom    
    Wait "5s" Until Element "${Main_text_ConnectToServer}" Is Not Visible
    Run Keyword If    "${chatroom_name}"=="Trade"    Run Keywords    Page Source Contain    ${expected_message}    AND    Return From Keyword    
    Run Keyword If    "${chatroom_name}"=="New players"    Run Keywords    Page Source Contain    ${expected_message}    AND    Return From Keyword    
    Run Keyword If    "${chatroom_name}"=="Global"    Run Keywords    Page Source Contain    ${expected_message}    AND    Return From Keyword    
    ${Chatroom_message_MessageByChatname}=    Generate Dynamic Locator    ${Chatroom_message_DynamicMessageByChatname}    ${chatroom_name}    ${expected_message}       
    Wait Until Keyword Succeeds    5s    0.25s    Scroll To Element       ${Chatroom_message_MessageByChatname}
    Wait Until Keyword Succeeds    ${timeout}    0.25s    Element Should Be Visible    ${Chatroom_message_MessageByChatname}    

Verify Scroll Function Work Properly
    [Arguments]    ${chatroom_name}
    Log To Console    Verify Scroll Function Work Properly    
    
    Log To Console    Get the oldest message
    ${oldest_message}=    Get Text From Dynamic Locator    (${Chatroom_message_DynamicAllMessageByChatname})[1]    ${chatroom_name}
    Log To Console    Oldest message of "${chatroom_name}" chat is "${oldest_message}"    

    Log To Console    Get the lastest message
    ${lastest_message}=    Get Text From Dynamic Locator    (${Chatroom_message_DynamicAllMessageByChatname})[30]    ${chatroom_name}
    Log To Console    Lastest message of "${chatroom_name}" chat is "${lastest_message}"    

    Log To Console    Verify: the oldest message different from the lastest message
    Should Not Be Equal    ${oldest_message}    ${lastest_message}    
    
    # Log To Console    Scroll to the oldest message and verify the oldest message display   
    # Verify Message Display In Chatroom    ${chatroom_name}    15s    ${oldest_message}

Leave From Faction
    Log To Console    Leave From Faction   
    Switch Browser    ${ChromeID} 
    Go To    ${BASE_URL}factions.php?step=quit
    Wait Until Page Ready
    
    Log To Console    Click Leave Faction button if it visible
    ${status}=    Page Source Contain    LEAVE FACTION
    Run Keyword If    "${status}"=="True"    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    LEAVE FACTION       
    Wait Until Page Ready

Join To Faction
    Log To Console    Join To Faction: ${Faction}[Name]    
    
    Log To Console    Go to Faction profile
    Switch Browser    ${ChromeID}
    Go To    ${BASE_URL}factions.php?step=profile&ID=${Faction}[ID]#/
    Wait Until Page Ready
    
    Log To Console    If user is not a member in Faction -> Apply to Faction
    ${status}    Page Source Contain     APPLY TO THIS FACTION     
    Run Keyword If    "${status}"=="True"    Submit Application And Accep User To Faction
    
Submit Application And Accep User To Faction
    Log To Console    Submit Application And Accep User To My Faction: ${Account_Chrome}[Name] 
    
    Log To Console    Click to Apply To This Faction button     
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    APPLY TO THIS FACTION      
    
    Log To Console    Enter the reason    
    Input Text "Join Faction to Testing"In Element "${Faction_input_ReasonToApply}"    
    
    Log To Console    Click to Submit Faction Application button    
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    SUBMIT FACTION APPLICATION   
      
    Log To Console    Verify the application has been sent    
    Wait Until Page Contains Text "Your application has been sent to the leadership of ${Faction}[Name]." 
    
    Log To Console    Go to Applicate of your faction
    Switch Browser    ${FirefoxID}
    Go To    ${BASE_URL}factions.php?step=your&type=1#/tab=controls&option=application
    Wait Until Page Ready
    
    Log To Console    Click View button
    Click Dynamic Element    ${Faction_button_DynamicViewButtonByUserName}    ${Account_Chrome}[Name]
    
    Log To Console    Click Accept button
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    Accept
    
    Log To Console    Verify User is accepted
    Wait Until Dynamic Element Is Visible    ${Faction_text_DynamicAcceptByUserName}     ${Account_Chrome}[Name]
    
    Log To Console    Open Chat panel
    Open Chat Panel
    
    Log To Console    Go to Faction menu
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Faction
    
    Log To Console    Verify user displays in Faction list
    # Wait Until Dynamic Element Is Visible    ${ChatPanel-Faction_text_DynamicFriendByName}    ${AccountA}[Name]        #issue
    
    Log To Console    Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Click Faction Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Faction
    
    Log To Console    Verify ${Account_Chrome}[Name] displays in result list
    Wait Until Dynamic Element Is Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Back to Chrome    
    Switch Browser    ${ChromeID}   
    
Quit Job
    Log To Console    Quit Job   
    Switch Browser    ${ChromeID} 
    Go To    ${BASE_URL}companies.php?step=your&type=1
    Wait Until Page Ready
    
    Log To Console    Click Quit Job button if it visible
    ${status}    Page Source Contain    quit-job
    
    Run Keyword If    "${status}"=="True"
    ...    Run Keywords
    ...    Click Element "${Company_button_QuitJob}"    AND
    ...    Wait Until Page Ready    AND
    ...    Click Element "${Company_button_QuitButton}"    AND
    ...    Page Should Contain    You have quit your job
    
Join To Company
    Log To Console    Join To Company: ${Company}[Name]    
    
    Log To Console    Go to Company profile
    Switch Browser    ${ChromeID}
    Go To    ${BASE_URL}joblist.php?step=search#!p=corpinfo&ID=${Company}[ID]
    Wait Until Page Ready
    
    Log To Console    If user is not a member in Company -> Apply to Company
    ${status}=    Page Source Contain    APPLY TO THIS COMPANY      
    Run Keyword If    "${status}"=="True"    Submit Application And Accep User To Company
    
Submit Application And Accep User To Company
    Log To Console    Submit Application And Accep User To Company: ${Account_Chrome}[Name] 
    
    Log To Console    Click to Apply To This Company button     
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    APPLY TO THIS COMPANY      
    
    Log To Console    Enter the reason    
    Input Text "Join Company to Testing"In Element "${Company_input_ReasonToApply}"    
    
    Log To Console    Click to SUBMIT COMPANY APPLICATION button    
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    SUBMIT COMPANY APPLICATION   
      
    Log To Console    Verify the application has been sent    
    Wait Until Page Contains Text "Your application has been sent to the director of ${Company}[Name]." 
    
    Log To Console    Go to Applicate of your faction
    Switch Browser    ${FirefoxID}
    Go To    ${BASE_URL}companies.php?step=your&type=1#/option=applications
    Wait Until Page Ready
    
    Log To Console    Click View button
    Click Dynamic Element    ${Company_button_DynamicViewButtonByUserName}    ${Account_Chrome}[Name]
    
    Log To Console    Click Accept button
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}    Accept
    
    Log To Console    Verify User is accepted
    Wait Until Dynamic Element Is Visible    ${Company_text_DynamicAcceptByUserName}     ${Account_Chrome}[Name]
    
    Log To Console    Open Chat panel
    Open Chat Panel
    
    Log To Console    Go to Friends tab
    Click Dynamic Element    ${ChatPanel_button_DynamicMenuByLabel}    Friends
    
    Log To Console    Click to search textbox
    Click Element "${ChatPanel_input_SearchUser}"
    
    Log To Console    Click Company Tab
    Click Dynamic Element    ${ChatPanel_button_DynamicAdvancedSearchButton}    Company
    
    Log To Console    Verify ${Account_Chrome}[Name] displays in result list
    Wait Until Dynamic Element Is Visible    ${ChatPanel_text_DynamicResultSearch}    ${Account_Chrome}[Name] [${Account_Chrome}[ID]]
    
    Log To Console    Back to Chrome    
    Switch Browser    ${ChromeID}   
    
Close All Chatroom And Reset Setting 
    Log To Console    Close All Chatroom    
    ${is_chatroom}=    Page Source Contain    close-icon
    Run Keyword If    "${is_chatroom}"=="True"    Close All Opening Chatroom    
    
    ${is_groupchat}=    Page Source Contain    minimize-icon
    Run Keyword If    "${is_groupchat}"=="True"    Close All Opening Group Chatroom    
    
    ${is_minimizedchat}=    Page Source Contain    minimized-chat-box__button
    Run Keyword If    "${is_minimizedchat}"=="True"    Close All Minimized Chatroom    
    
    Log To Console    Reset all setting of chatroom    
    Reset All Setting Of Chatroom

Close All Opening Chatroom
    Log To Console    Close All Opening Chatroom
    ${opened_chatroom_number}=    Get Dynamic Element Count    ${Chatroom_button_AllCloseChatroomButton}
    FOR    ${index}    IN RANGE    1    ${opened_chatroom_number}+1
        Click Element "${Chatroom_button_AllCloseChatroomButton}"
        Sleep    0.5s
    END
    
Close All Opening Group Chatroom
    Log To Console    Close All Opening Group Chatroom
    Wait Until Page Ready
    ${opened_groupchat_number}=    Get Dynamic Element Count    ${Chatroom_button_AllMinimizedGroupChatButton}
    FOR    ${index}    IN RANGE    1    ${opened_groupchat_number}+1
        Click Element "${Chatroom_button_AllMinimizedGroupChatButton}"
        Sleep    0.5s
    END

Close All Minimized Chatroom
    Log To Console    Close All Minimized Chatroom
    Wait Until Page Ready
    ${minimized_chatroom_number}=    Get Dynamic Element Count    ${Chatroom_button_AllMinimizedChatroom}
    FOR    ${index}    IN RANGE    ${minimized_chatroom_number}
        Click Element "${Chatroom_button_AllMinimizedChatroom}"
        Sleep    0.5s
        Click Element "${Chatroom_button_AllCloseChatroomButton}"
        Sleep    0.5s
    END
    
Reset All Setting Of Chatroom
    Log To Console    Reset All Setting Of Chatroom    
    Log To Console    Click to Chatlist button
    Open Chat Panel
    
    Log To Console    Click to Setting button   
    Click Element "${ChatPanel_button_Setting}"  
    
    Log To Console    Get chatroom number need to reset   
    ${count}=    Get Element Count    ${ChatPanel_dropdown_AllDropdownButtonIsNotFlashNotifier}
    FOR    ${i}    IN RANGE    1    ${count}-1
        Click Element "${ChatPanel_dropdown_AllDropdownButtonIsNotFlashNotifier}"
        Sleep    0.25s
        Click Element "${ChatPanel_option_FlashNotifierButton}"
        Sleep    0.25s
    END

    Log To Console    Close Setting pop
    Click Dynamic Element    ${Main_button_DynamicButtonByClass}    settings-header__close-button

Join To Travel Chat  
    [Arguments]    ${destination}=Mexico
    Log To Console    Join To Travel Chat  
    Log To Console    Is Travel chat exist -> Travel    
    ${status}=    Run Keyword And Return Status    Run Keywords
    ...    Element "${Travel_data_TravelInformation}" Attribute Value "data-country" Should Not Be Equal "mexico"
    ...    AND    Element "${Travel_data_TravelInformation}" Attribute Value "data-traveling" Should Be Equal "false"
    
    Run Keyword If    "${status}"=="True"
    ...    Run Keywords
    ...    Maximize Browser Window
    ...    AND     Go To    ${BASE_URL}travelagency.php  
    ...    AND     Wait Until Page Ready
    ...    AND     Click Dynamic Element    ${Travel_button_DynamicDestinationByName}    ${destination}
    ...    AND     Click Element "${Travel_button_Travel}"
    ...    AND     Click Element "${Travel_button_Continue}"
    ...    AND     Click Element "${Travel_button_Continue}"
    ...    AND     Wait Until Page Ready
    ...    AND     Element "${Travel_data_TravelInformation}" Attribute Value "data-country" Should Be Equal "mexico"
    
Delete All Users In Blocked List
    Log To Console    Delete All Users In Blocked List
    Open Subtab In Chat Panel    Blocked
    Wait Until Page Ready
    ${user_number}=    Get Dynamic Element Count    ${ChatPanel-Blocked_button_DeleteAllFriends}
    FOR    ${index}    IN RANGE    1    ${user_number}+1
        Click Element "${ChatPanel-Blocked_button_DeleteAllFriends}"
        Sleep    2s
    END
    
Delete All Friends In ChatPanel
    Log To Console    Delete All Friends In ChatPanel
    Open Subtab In Chat Panel    Friends
    Wait Until Page Ready
    ${friend_number}=    Get Dynamic Element Count    ${ChatPanel-Friends_button_DeleteAllFriends}
    FOR    ${index}    IN RANGE    1    ${friend_number}+1
        Click Element "${ChatPanel-Friends_button_DeleteAllFriends}"
        Sleep    2s
    END
    
Get Text List From Element
    [Arguments]    ${locator}
    ${element_list}=    Get WebElements    ${locator}
    ${text_list}=    Create List    
    FOR    ${element}    IN    @{element_list}
        
        ${text}=    Get Text    ${element}
        Log To Console    Item: "${text}"
        
        ${is_space}    Run Keyword And Return Status    Should Contain    ${text}    ${SPACE}        
        ${name}=    Run Keyword If    "${is_space}"=="True"    Get The Name Of Member    ${text}
        Run Keyword If    "${is_space}"=="True"
        ...    Run Keywords
        ...   Log To Console    Add "${name}" into list
        ...    AND    Append To List    ${text_list}    ${name}
        ...    AND    Continue For Loop
        
        Log To Console    Add "${text}" into list
        Append To List    ${text_list}    ${text}
    END
    [Return]    ${text_list}

Get The Name Of Member
    [Arguments]    ${member_info}
    ${name}    ${id}=    Split String    ${member_info}    ${SPACE}
    [Return]    ${name}

List Should Be Equal Without Index
    [Arguments]    ${list1}    ${list2}
    FOR    ${item}    IN    @{list1}
        List Should Contain Value    ${list2}    ${item}    
    END
