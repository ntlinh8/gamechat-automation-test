*** Variables ***
${Admin_menu_DynamicMenuByLabel}    //a[text()='{0}']

${Admin-ChatReports_text_DynamicReportUser}    //td[text()='Users:{0}, {1}']
${Admin-ChatReports_button_DynamicRemoveButton}    //td[text()='Users:{0}, {1}']/..//input[@value='Remove']
${Admin-ChatReports_button_Confirm}    //input[@value='Confirm']

${Admin-ChatBan_button_GoToAddBanPage}    //a[text()='Add a ban']
${Admin-ChatBan_button_AddBan}    //input[@value='Go']
${Admin-ChatBan_button_SearchBan}    //input[@value='Search']
${Admin-ChatBan_text_DeleteBanChat}    //a[text()='Delete']
${Admin-ChatBan_text_ResultSearchByIdAndTime}    //td[text()='{0}']/../td[text()='{1}']