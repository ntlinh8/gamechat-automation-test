*** Variables ***
# Chat panel
${ChatPanel_pop_ChatPanelFrame}    //div[contains(@class, 'chat-app__panel')]
${ChatPanel_button_DynamicMenuByLabel}     //div[contains(@class, 'chat-list-header__tabs')]//p[text()='{0}']/..
${ChatPanel_button_Setting}    (//div[contains(@class, 'chat-list-header__actions')]//button)[1]
${ChatPanel_input_SearchUser}    //input[@placeholder='Enter a name or ID to add to this list']
${ChatPanel_text_DynamicResultSearch}    //div[contains(@class, 'search-box-filter-result')]//div[contains(@class, 'search-item')]//p[text()='{0}']
${ChatPanel_button_DynamicAdvancedSearchButton}    //button[contains(@class, 'search-box__search')]/p[text()='{0}']
${ChatPanel_icon_LazyLoading}    //div[@id='scrollableDiv']/div[contains(@class, 'chat-tab__loader')]
${ChatPanel_text_AllMemberInList}    //div[contains(@class, 'member-card-nickname')]/p
${ChatPanel_text_AllMemberInSearchResult}    //div[contains(@class, 'search-item')]//p
${ChatPanel_status_DynamicPlayerStatusByName}    //p[text()='{0}']/../preceding-sibling::div/div

${ChatPanel-Chats_button_AllChatrooms}    //div[contains(@class, 'chat-tab-content')]//button[contains(@class, 'detailed-chat-card')]
${ChatPanel-Chats_button_FirstRoom}    (//div[contains(@class, 'chat-tab-content')]//a[contains(@class, 'name')])[1]
${ChatPanel-Chats_button_LastMessageOfFirstRoom}    (//div[contains(@class, 'chat-tab-content')]//p[contains(@class, 'last-message')])[1]
${ChatPanel-Chats_status_DynamicPlayerStatusByName}    //a[text()='{0}']/../../../preceding-sibling::div/a

${ChatPanel-Met_button_AllUserInMetList}    //div[contains(@class, 'chat-tab-content')]/div[contains(@class, 'member-card')]
${ChatPanel-Met_text_DynamicFriendByName}    //div[contains(@class, 'chat-tab-content')]//p[text()='{0}']
${ChatPanel-Met_button_DynamicChatIconByName}    ${ChatPanel-Friends_text_DynamicFriendByName}/../../../..//*[name()='svg' and contains(@class, 'chat-icon')]/..
${ChatPanel-Met_button_DynamicDeleteIconByName}    ${ChatPanel-Friends_text_DynamicFriendByName}/../../../..//*[name()='svg' and contains(@class, 'close-icon')]/..

${ChatPanel-Friends_text_DynamicFriendByName}    //div[contains(@class, 'chat-tab-content')]//p[text()='{0}']
${ChatPanel-Friends_button_DynamicChatIconByName}    ${ChatPanel-Friends_text_DynamicFriendByName}/../../../..//*[name()='svg' and contains(@class, 'chat-icon')]/..
${ChatPanel-Friends_button_DeleteAllFriends}    //*[name()='svg' and contains(@class, 'member-card__close-icon')]/..
${ChatPanel-Friends_button_FirstMemberResultSearch}    (//div[contains(@class, 'search-item')]//p[text()!='{0}'])[1]
${ChatPanel-Friends_button_AllMemberResultSearch}    //div[contains(@class, 'search-item')]//p[text()!='{0}']
${ChatPanel-Friends_button_FirstMemberHaveChatIcon}    (//*[name()='svg' and contains(@class, 'chat-icon')]/../../..//p)[1]
${ChatPanel-Friends_button_DynamicChatIconByUsername}    //p[text()='{0}']/../../../..//*[name()='svg' and contains(@class, 'chat-icon')]
${ChatPanel-Friends_button_DynamicDeleteIconByUsername}    //p[text()='{0}']/../../../..//*[name()='svg' and contains(@class, 'close-icon')]

${ChatPanel-Faction_button_AllUsers}    //div[contains(@class, 'chat-tab-content')]/div[contains(@class, 'member-card')]
${ChatPanel-Faction_button_FirstUser}    //div[contains(@class, 'chat-tab-content')]//p
${ChatPanel-Faction_text_DynamicFriendByName}    //div[contains(@class, 'chat-tab-content')]//p[text()='{0}']
${ChatPanel-Faction_button_DynamicChatIconByName}    //p[text()='{0}']/../../../..//*[name()='svg' and contains(@class, 'chat-icon')]/..

${ChatPanel-Blocked_button_DeleteAllFriends}    //*[name()='svg' and contains(@class, 'member-card__close-icon')]/..
${ChatPanel-Blocked_text_DynamicFriendByName}    //div[contains(@class, 'chat-tab-content')]//p[text()='{0}']
${ChatPanel-Blocked_button_DynamicDeleteButton}    //div[contains(@class, 'chat-tab-content')]//p[text()='{0}']/../../../..//button
${ChatPanel-Blocked_button_FirstMemberResultSearch}    (//div[contains(@class, 'search-item')]//p[text()!='{0}'])[1]
${ChatPanel-Blocked_button_DynamicDeleteIconByUsername}    //p[text()='{0}']/../../../..//*[name()='svg' and contains(@class, 'close-icon')]

# Chat panel - Setting
${ChatPanel_button_DynamicSettingDropdownByChatName}    //p[contains(text(), '{0}')]/../..//div[contains(@class, 'dropdown__container')]
${ChatPanel_button_DynamicSettingOptionByChatName}    //p[contains(text(), '{0}')]/../..//p[contains(text(), '{1}')]
${ChatPanel_text_DynamicSettingOptionByChatName}    //p[contains(text(), '{0}')]/../..//button[contains(@class, 'dropdown__button')]//p
${ChatPanel_dropdown_AllDropdownButtonIsNotFlashNotifier}    //button[contains(@class, 'dropdown__button')]/p[text()!='Flash notifier']
${ChatPanel_option_FlashNotifierButton}                      //ul[contains(@class, 'dropdown--open')]//p[text()='Flash notifier']
