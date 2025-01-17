*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
Test Setup  Go To Home Page

*** Variables ***
${edited_author}  Edited_Author<
${edited_title}  Edited_Title
${edited_year}  2000

*** Test Cases ***
Edit Book Reference With Valid Inputs
    Click Link  Lisää kirjaviite
    Fill Book Form  ${username}  ${author}  ${title}  ${year}  ${publisher}
    Submit Form
    Click Link  Muokkaa
    Edit Filled Values  ${edited_author}  ${edited_title}  ${edited_year}
    Submit Form
    Editing Master Should succeed  ${edited_author}  ${edited_title}  ${edited_year}  ${publisher} 


Edit Master Reference With Valid Inputs
    Click Link  Lisää graduviite
    Fill Master Form  ${username}  ${author}  ${title}  ${school}  ${year}
    Submit Form
    Click Link  Muokkaa
    Edit Filled Values  ${edited_author}  ${edited_title}  ${edited_year}
    Submit Form
    Editing Master Should Succeed  ${edited_author}  ${edited_title}  ${school}  ${edited_year}


*** Keywords ***
Edit Filled Values
    [Arguments]  ${edited_author}  ${edited_title}  ${edited_year}
    Set Author  ${edited_author}
    Set Title  ${edited_title}
    Set Year  ${edited_year}

Editing Book Should Succeed
    [Arguments]  ${edited_author}  ${edited_title}  ${edited_year}  ${publisher} 
    Page Should Contain  ${edited_author}
    Page Should Contain  ${edited_title}
    Page Should Contain  ${edited_year}
    Page Should Contain  ${publisher} 

Editing Master Should Succeed
    [Arguments]  ${edited_author}  ${edited_title}  ${school}  ${edited_year}
    Page Should Contain  ${edited_author}
    Page Should Contain  ${edited_title}
    Page Should Contain  ${school}
    Page Should Contain  ${edited_year}

