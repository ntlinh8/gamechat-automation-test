*** Settings ***
Resource    ../common/settings.robot
Resource    ../resources/NoteLocator.robot
Suite Setup    Run Keywords    Open Torn Browser With One Account    AND    Clear All Notes
Test Teardown    Run Keyword and Ignore Error    Take Screenshot When Test Failed
Suite Teardown    Run Keywords    Clear All Notes    AND    Close All Browser And Kill Related Process
Default Tags    test

*** Variables ***
&{Note1}    Title=New Note1    Content=This is content of Note1
&{Note2}    Title=New Note2    Content=This is content of Note2
&{NoteAfterUpdate}    Title=Updated Title    Content=Content After Udpate


*** Test Cases ***
NoteFunction 01 - Create New Note
    Log To Console    NoteFunction 01 - Create New Note    
    Log To Console    === Create Note 1 ===
    
    Log To Console    Step 01: Click to note list dropdown
    Open Note List Dropdown
    
    Log To Console    Step 02: Click to New Note button
    Click Dynamic Element    ${Note_button_DynamicNoteByLabel}    New Note
    Sleep    3s
    
    Log To Console    Step 03: Verify default note displays with empty content
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "Note"
    Element "${Note_input_NoteContent}" Should Contains Text "${EMPTY}"
    
    Log To Console    Step 03: Enter Note title    
    Input Text "${Note1}[Title]"In Element "${Note_input_NoteTitle}"

    Log To Console    Step 04: Enter Note content    
    Input Text "${Note1}[Content]"In Element "${Note_input_NoteContent}"
    
    Log To Console    Step 05: Open Note List dropdown    
    Open Note List Dropdown
    
    Log To Console    Step 06: Verify new note displays in Note List    
    Wait Until Dynamic Element Is Visible    ${Note_button_DynamicNoteByLabel}    ${Note1}[Title]

    Log To Console    === Create Note 2 ===
    Log To Console    Step 07: Click to note list dropdown
    Open Note List Dropdown
    
    Log To Console    Step 08: Click to New Note button
    Click Dynamic Element    ${Note_button_DynamicNoteByLabel}    New Note
    Sleep    3s
    
    Log To Console    Step 09: Verify default note displays with empty content
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "Note"
    Element "${Note_input_NoteContent}" Should Contains Text "${EMPTY}"
    
    Log To Console    Step 10: Enter Note title    
    Input Text "${Note2}[Title]"In Element "${Note_input_NoteTitle}"
    Sleep    1s
    
    Log To Console    Step 10: Enter Note content    
    Input Text "${Note2}[Content]"In Element "${Note_input_NoteContent}"
    Sleep    1s
    
    Log To Console    Step 11: Open Note List dropdown    
    Open Note List Dropdown
    
    Log To Console    Step 12: Verify new note displays in Note List 
    Wait Until Dynamic Element Is Visible    ${Note_button_DynamicNoteByLabel}    ${Note2}[Title]
    
NoteFunction 02 - Switch Note
    Log To Console    NoteFunction 02 - Switch Note   
    
    Log To Console    Step 01: Open Note list dropdown    
    Open Note List Dropdown
    
    Log To Console    Step 02: Switch To Note 1    
    Click Dynamic Element    ${Note_button_DynamicNoteByLabel}    ${Note1}[Title]
    Sleep    2s    
    
    Log To Console    Step 03: Verify Note 1 display with correct title and content    
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "${Note1}[Title]"
    Element "${Note_input_NoteContent}" Should Contains Text "${Note1}[Content]"
    
    Log To Console    Step 04: Open Note list dropdown    
    Open Note List Dropdown
    
    Log To Console    Step 05: Switch To Note 2   
    Click Dynamic Element    ${Note_button_DynamicNoteByLabel}    ${Note2}[Title]
    Sleep    2s    
    
    Log To Console    Step 06: Verify Note 2 display with correct title and content      
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "${Note2}[Title]"
    Element "${Note_input_NoteContent}" Should Contains Text "${Note2}[Content]"
    
NoteFunction 03 - Update Note Content
    Log To Console    NoteFunction 03 - Update Note Content    
    
    Log To Console    Step 01: Switch To Note 1    
    Open Note List Dropdown
    Click Dynamic Element    ${Note_button_DynamicNoteByLabel}    ${Note1}[Title]
    Sleep    2s    
    
    Log To Console    Step 02: Update Note 1 title    
    Input Text "${NoteAfterUpdate}[Title]"In Element "${Note_input_NoteTitle}"
    
    Log To Console    Step 03: Verify Note1 title displays with correct data    
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "${NoteAfterUpdate}[Title]"
    
    Log To Console    Step 04: Update Note1 content
    Input Text "${NoteAfterUpdate}[Content]"In Element "${Note_input_NoteContent}"
    
    Log To Console    Step 05: Verify Note1 content displays with correct data
    Element "${Note_input_NoteContent}" Should Contains Text "${NoteAfterUpdate}[Content]"
    
    Log To Console    Step 05: Open Note List dropdown
    Open Note List Dropdown
    
    Log To Console    Step 06-1: Verify ${NoteAfterUpdate}[Title] displays in Note List
    Wait Until Dynamic Element Is Visible    ${Note_button_DynamicNoteByLabel}    ${NoteAfterUpdate}[Title]
    
    Log To Console    Step 06-2: Verify ${Note1}[Title] NOT displays in Note List
    Wait Until Dynamic Element Is NOT Visible With Timeout    3s    ${Note_button_DynamicNoteByLabel}    ${Note1}[Title]
    
    Log To Console    Step 07: Switch To Note 2
    Click Dynamic Element    ${Note_button_DynamicNoteByLabel}    ${Note2}[Title]
    Sleep    2s    
    
    Log To Console    Step 08: Verify Note2 displays
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "${Note2}[Title]"
    
    Log To Console    Step 09: Switch To ${NoteAfterUpdate}[Title]
    Open Note List Dropdown
    Click Dynamic Element    ${Note_button_DynamicNoteByLabel}    ${NoteAfterUpdate}[Title]
    Sleep    2s
    
    Log To Console    Step 10: Verify ${NoteAfterUpdate}[Title] displays with correct title and content    
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "${NoteAfterUpdate}[Title]"
    Element "${Note_input_NoteContent}" Should Contains Text "${NoteAfterUpdate}[Content]"
    
    Log To Console    Step 11: Re-open Note pop    
    Click Element "${Note_header_NotePopHeader}"
    Wait Until Element "${Note_function_NoteFunction}" Is Not Visible
    Click Element "${Note_button_OpenNoteChat}"
    
    Log To Console    Step 12: Verify ${NoteAfterUpdate}[Title] displays with correct title and content    
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "${NoteAfterUpdate}[Title]"
    Element "${Note_input_NoteContent}" Should Contains Text "${NoteAfterUpdate}[Content]"
    
NoteFunction 04 - Delete Note
    Log To Console    NoteFunction 04 - Delete Note    
    
    Log To Console    Step 01: Verify ${NoteAfterUpdate}[Title] displays witch correct tile
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "${NoteAfterUpdate}[Title]"

    Log To Console    Step 02: Click Delete Button
    Click Element "${Note_button_DeleteNote}"
        
    Log To Console    Step 03: Verify message "Are you sure you want to remove the note?" displays    
    Wait Until Page Contains Text "Are you sure you want to remove the note?"
        
    Log To Console    Step 03: Click Cancel button
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}     Cancel   
    
    Log To Console    Step 04: Verify ${NoteAfterUpdate}[Title] still displays
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Be Equal "${NoteAfterUpdate}[Title]"
    
    Log To Console    Step 05: Open Note List dropdown
    Open Note List Dropdown
    
    Log To Console    Step 06: Verify ${NoteAfterUpdate}[Title] still displays in Note List
    Wait Until Dynamic Element Is Visible    ${Note_button_DynamicNoteByLabel}    ${NoteAfterUpdate}[Title]
    
    Log To Console    Step 07: Click Delete button
    Click Element "${Note_button_DeleteNote}"
    
    Log To Console    Step 08: Verify confirm message
    Wait Until Page Contains Text "Are you sure you want to remove the note?"
    
    Log To Console    Step 09: Click Remove It button
    Click Dynamic Element    ${Main_button_DynamicButtonByLabel}     Remove it   
    Sleep    3s
    
    Log To Console    Step 10: Verify ${NoteAfterUpdate}[Title] NOT displays
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Not Be Equal "${NoteAfterUpdate}[Title]"

    Log To Console    Step 11: Open Note List dropdown
    Open Note List Dropdown

    Log To Console    Step 12: Verify Note1 not displays in Note List
    Wait Until Dynamic Element Is NOT Visible With Timeout    3s    ${Note_button_DynamicNoteByLabel}    ${NoteAfterUpdate}[Title]
    
    Log To Console    Step 13: Re-open Note function
    Click Element "${Note_header_NotePopHeader}"
    Wait Until Element "${Note_function_NoteFunction}" Is Not Visible
    Click Element "${Note_button_OpenNoteChat}"
    
    Log To Console    Step 14: Verify ${NoteAfterUpdate}[Title] NOT displays
    Element "${Note_input_NoteTitle}" Attribute Value "value" Should Not Be Equal "${NoteAfterUpdate}[Title]"
    
    Log To Console    Step 15: Open Note List dropdown
    Open Note List Dropdown
    
    Log To Console    Step 16: Verify Note1 not displays in Note List
    Wait Until Dynamic Element Is NOT Visible With Timeout    3s    ${Note_button_DynamicNoteByLabel}    ${NoteAfterUpdate}[Title]
    
    Log To Console    Close Note function    
    Click Element "${Note_header_NotePopHeader}"
    Wait Until Element "${Note_function_NoteFunction}" Is Not Visible
     
*** Keywords ***
Clear All Notes
    Log To Console    Clear All Notes    
    Log To Console    Open Note function    
    Click Element "${Note_button_OpenNoteChat}"
    
    Log To Console    Verify Note function is display
    Wait Until Element "${Note_function_NoteFunction}" Is Visible
    
    Log To Console    Click to note list dropdown
    Open Note List Dropdown
    
    Log To Console    Get Note List number     
    ${count}=    Get Element Count    ${Note_list_AllNotes}
    
    FOR    ${i}    IN RANGE    1    ${count}
        Log To Console    Click delete button    
        Click Element "${Note_button_DeleteNote}"
        
        Log To Console    Verify message "Are you sure you want to remove the note?" displays    
        Wait Until Page Contains Text "Are you sure you want to remove the note?"
        
        Log To Console    Click Remove It button    
        Click Dynamic Element    ${Main_button_DynamicButtonByLabel}     Remove it        
        Sleep    1s
    END
    
    Log To Console    Click to note list dropdown
    Open Note List Dropdown
    
    Log To Console    Verify Note List has 2 default items
    ${after_delete_count}=    Get Element Count    ${Note_list_AllNotes}
    Should Be Equal    ${after_delete_count}    ${2}    
    
Open Note List Dropdown
    Log To Console    Open Note List Dropdown    
    
    Log To Console    Get "class" attribute of Note list dropdown    
    ${class_value}    Get Attribute "class" In Element "${Note_dropdown_OpenNoteList}"
    ${status}    Run Keyword And Return Status    Should Contain    ${class_value}    visible 
    Log To Console    Class value contains "visible" ->  "${status}"
    
    Log To Console    Click to Note List dropdown if class value NOT contains "visible"    
    Run Keyword If    "${status}"!="True"    Click Element "${Note_dropdown_OpenNoteList}"    









