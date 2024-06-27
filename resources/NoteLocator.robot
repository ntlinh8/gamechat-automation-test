*** Variables ***
${Note_button_OpenNoteChat}    //button[contains(@class, 'chat-note')]
${Note_function_NoteFunction}    //section[contains(@class, 'chat-list-chat-box-wrapper')]
# ${Note_button_MaximizeNote}    //button[contains(@class, 'chat-notes-header-actions--maximize')]
# ${Note_popup_MaximizedNotePopup}    //div[contains(@class, 'chat-notes--maximized')]
${Note_header_NotePopHeader}    //div[contains(@class, 'chat-notes-header__title-bar')]/*[name()='svg']
${Note_dropdown_OpenNoteList}    //div[contains(@class, 'dropdown__container')]/button
${Note_list_AllNotes}    //ul[contains(@class, 'dropdown--visible')]/li
${Note_button_DynamicNoteByLabel}    //ul[contains(@class, 'dropdown--visible')]//p[text()='{0}']
${Note_button_DeleteNote}    //button[contains(@class, 'chat-notes-body__close')]
${Note_button_RemoveIt}    //button[text()='Remove it'] 
${Note_input_NoteTitle}    //input[contains(@class, 'chat-notes-body__title')]
${Note_input_NoteContent}    //textarea[contains(@class, 'chat-notes-body__text')]
