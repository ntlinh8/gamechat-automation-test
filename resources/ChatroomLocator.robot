*** Variables ***
# Common
${Chatroom_chatroom_DynamicChatroomFrameByName}       //div[contains(@class, 'chat-box-header')]//p[contains(text(), '{0}')]
${Chatroom_button_DynamicMinimizeButton}              //p[text()='{0}']/../..//*[name()='svg' and contains(@class, 'minimize-icon')]/..
${Chatroom_input_DynamicChatTextBoxByChatname}        //p[contains(text(), '{0}')]/../../..//textarea
${Chatroom_message_DynamicMessageByChatname}      //p[contains(text(), '{0}')]/../../..//div[contains(@class, 'chat-box-body')]//span[text()='{1}']/..
${Chatroom_message_DynamicAllContentByChatname}      //p[text()='{0}']/../../..//div[contains(@class, 'chat-box-body')]//span
${Chatroom_message_DynamicAllMessageByChatname}    //p[text()='{0}']/../../..//div[contains(@class, 'chat-box-message') and not(contains(@class, 'timestamp'))]/p/span
${Chatroom_text_DynamicUserNameByLabel}    //p[text()='{0}']/../../..//span[contains(@class, 'sender') and contains(text(), '{1}')]


${Chatroom_text_TimestamptTooltip}    //span[contains(@class, 'chat-box-message__tooltip')]/p[last()]
${Chatroom_button_AllCloseChatroomButton}    //*[name()='svg' and contains(@class, 'close-icon') and not(contains(@class, 'minimize'))]
${Chatroom_button_AllMinimizedChatroom}    //button[contains(@class, 'minimized-chat-box__button')]

# For private chat
${Chatroom_button_DynamicMinimizedChatroomByName}     //p[contains(@class, 'minimized') and text()='{0}']
${Chatroom_text_DynamicUnreadMessageInMinimizedChat}    //p[contains(@class, 'minimized') and text()='{0}']/../../..//div[contains(@class, 'unread-message-count')]//p
${Chatroom_text_DynamicUnreadMessageInChatList}    //div[contains(@class, 'chat-tab')]//a[text()='{0}']/../../..//div[contains(@class, 'message-count')]//p
${Chatroom_text_DynamicLastMessageInChatList}    //div[contains(@class, 'chat-tab')]//a[text()='{0}']/../../..//p[contains(@class, 'last-message')]
${Chatroom_button_DynamicExpandOption}                //div[contains(@class, 'chat-box-options')]//p[text()='{0}']
${Chatroom_text_ConfirmationMessage}          //p[text()='Are you sure?']
${Chatroom_button_DynamicConfirmationOption}          //p[text()='Are you sure?']/../..//button[text()='{0}']
${Chatroom_button_DynamicCloseButton}                 //p[text()='{0}']/../..//*[name()='svg' and contains(@class, 'close-icon') and not(contains(@class, 'minimize'))]/..
${Chatroom_button_DynamicBlockMessage}    //p[text()='{0}']/../../..//p[contains(@class, 'chatError')]
${Chatroom_status_DynamicPlayerStatusByName}    //div[contains(@class, 'chat-box-header')]//p[contains(text(), '{0}')]/preceding-sibling::div/a
${Chatroom_status_DynamicPlayerStatusInMinimizedChatByName}    //p[contains(@class, 'minimized') and text()='{0}']/../preceding-sibling::div/a
${Chatroom_status_DynamicOnlineStatusInMinimizedChatByName}    //a[contains(@class, 'online')]/../../..//p[text()='{0}']

# For group chat
${Chatroom_button_DynamicMinimizedGroupChatByTitle}    //button[contains(@class, 'minimized-menu-item') and @title='{0}']
${Chatroom_text_DynamicUnreadMessageInMinimizedGroupChat}    //button[contains(@class, 'minimized-menu-item') and @title='{0}']//div[contains(@class, 'message-count')]//p
${Chatroom_text_DynamicMinimizedGroupChatWithFlash}    //button[contains(@class, 'minimized-menu-item--highlight') and contains(@title, '{0}')]
${Chatroom_button_AllMinimizedGroupChatButton}    //*[name()='svg' and contains(@class, 'minimize-icon')]
