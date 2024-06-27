*** Variables ***
# Common page
${Main_button_DynamicButtonByClass}    //button[contains(@class, '{0}')]
${Main_button_DynamicButtonByLabel}    //button[contains(text(), '{0}')]
${Main_button_CloseWarningButtonMobile}    //div[@class='btn-mobile']
${Main_button_CloseWarningButtonDesktop}    //div[contains(@class, 'btn-desktop')]
${Main_area_WarningMessage}    //div[@class='cookie-notif-container']
${Main_input_DynamicTextboxByID}    //input[@id='{0}']
${Main_input_DynamicTextboxByName}    //input[@name='{0}']
${Main_text_ConnectToServer}        //p[text()='Connecting to the server...']
${Main_button_AllMinimizedChat}    //button[contains(@class, 'minimized-menu-item')]
${Main_button_DynamicHeaderMenuByLabel}    //li[@class='menu-item-link']//span[text()='{0}']
${Main_link_AllSideBarLinks}    //div[@id='sidebarroot']//a[@href!='#']

# Login page
${Login_button_LoginButton}    //input[@name='btnLogin']

${Profile_button_StartChat}    //a[contains(@class, 'initiateChat')]
${Profile_button_Attack}    //a[contains(@class, 'attack')]
${Profile_button_Profile}    //li[@class='avatar']//button[@aria-label='Open menu']
${Profile_button_Logout}    //ul[@class='settings-menu']//span[text()='Logout']

${Travel_data_TravelInformation}    //body
${Travel_button_TravelHome}    //span[@id='travel-home']
${Travel_button_DynamicDestinationByName}    //button[contains(@title, '{0}')]
${Travel_button_Travel}    (//button[text()='TRAVEL'])[1]
${Travel_button_Continue}    (//button[text()='CONTINUE'])[1]

${Hospital_button_PunchPlayer}    //div[@id='weapon_fists']
${Hospital_condition_StopPunchCondition}    (${Hospital_button_Hospital} | ${Hospital_button_Stalement})
${Hospital_button_Hospital}        //button[text()='hospitalize']
${Hospital_button_Stalement}       //div[text()='You stalemated']
${Hospital_button_InHospital}      //span[@class='main-desc']
${Hospital_button_Continue}        //button[text()='CONTINUE']

${Poker_button_TableList}    //div[contains(@class, 'watcherPanelTopRow')]/button[1]
${Poker_button_DynamicPokerTableByLabel}    //span[text()='{0}']
${Poker_button_SitIn}    //button[text()='Sit In']
${Poker_button_OK}    //button[text()='Ok']

${Faction_input_ReasonToApply}    //textarea[@name='reason']
${Faction_button_DynamicViewButtonByUserName}    //span[text()='{0}']/ancestor::div[contains(@class, 'tableRow')]//button
${Faction_text_DynamicAcceptByUserName}    //span[text()='{0}']/ancestor::div[contains(@class, 'tableRow')]//span[text()='Accepted']
${Faction_button_DynamicKickOffButtonByLabel}    //button[@aria-label='Kick {0} from the faction']
${Faction_input_ReasonToKick}    //input[contains(@class, 'reasonInput')]

${Company_input_ReasonToApply}    //textarea[@name='reason']
${Company_button_DynamicViewButtonByUserName}    //span[text()='{0}']/ancestor::div[contains(@class, 'tableRow')]//button
${Company_text_DynamicAcceptByUserName}    //span[text()='{0}']/ancestor::div[contains(@class, 'tableRow')]//span[text()='Accepted']
${Company_button_QuitJob}    //span[@id='quit-job']
${Company_button_DynamicFireButtonByLabel}    //a[@aria-label='Fire {0}']
${Company_input_ReasonToFire}    //input[@name='reason']
${Company_button_ConfirmFireButton}    //a[contains(text(), 'Yes')]
${Company_button_QuitButton}    //a[contains(text(), 'Quit')]

${Contact_input_EnterName}    //input[@name='name']
${Contact_input_EnterMessage}    //textarea[@placeholder='Type something']
${Contact_input_DynamicMessageByLabelAndContent}    //p[text()='{0}']/ancestor::div[@id='chat-root']//p[text()='{1}']
${Contact_button_DynamicHeaderMenuByLabel}          //p[contains(@class, 'chat-box-header') and text()='{0}']

${FriendList_button_AddFriend}    //span[text()='Add a Friend']
${FriendList_input_SearchBox}    //input[@name='ID']
${FriendList_button_Add}    //input[@value='ADD']
${FriendList_button_DynamicMenuTabByLabel}    //ul[@class='ac-options']//a[text()='{0}']/..
${FriendList_button_FirstMemberInResultSearch}    (//li[contains(@class, 'ui-menu-item')]/a[text()!='{0}']/..)[1]
${FriendList_button_DynamicMemberInResultSearch}    //li[contains(@class, 'ui-menu-item')]/a[text()='{0}']/..
${FriendList_button_AllMemberInResultSearch}    //li[contains(@class, 'ui-menu-item')]/a
${FriendList_text_SuccessMessage}    //div[@id='info-msg-wrapper']//div[@class='msg right-round']
${FriendList_text_DynamicMemberInFriendList}    //ul[contains(@class, 'user-info-blacklist')]//span[text()='{0}']
${FriendList_text_AllMemberInFriendList}    //ul[contains(@class, 'user-info-blacklist')]//span[@class='honor-text']

${IgnoreList_input_SearchBox}    //input[@name='ID']
${IgnoreList_button_DynamicMenuTabByLabel}    //ul[@class='ac-options']//a[text()='{0}']/..
${IgnoreList_button_FirstMemberInResultSearch}    (//li[contains(@class, 'ui-menu-item')]/a[text()!='{0}']/..)[1]
${IgnoreList_button_DynamicMemberInResultSearch}    //li[contains(@class, 'ui-menu-item')]/a[text()='{0}']/..
${IgnoreList_text_SuccessMessage}    //div[@id='info-msg-wrapper']//div[@class='msg right-round']/p
${IgnoreList_text_DynamicMemberInIgnoreList}    //ul[contains(@class, 'ignore-list-accordion')]//span[text()='{0}']
${IgnoreList_text_AllMemberInFriendList}    //li[contains(@class, 'left you-ignore')]//span[@class='honor-text']
${IgnoreList_button_DynamicDeleteButtonByUserName}    //span[text()='{0}']/../../../..//span[@class='icon-wrap right']













