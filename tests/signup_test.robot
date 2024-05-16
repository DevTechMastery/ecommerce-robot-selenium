*** Settings ***
Library          SeleniumLibrary
Documentation    Robot Framework

*** Variables ***
# Credentials
${UsernameValue}       IncorrectUsername
${PasswordValue}       IncorrectPassword

# Error Messages
${Error_text_invalid_username}     Error: The username IncorrectUsername is not registered on this site. If you are unsure of your username, try your email address instead.
${Error_text_missing_username}     Error: Username is required.
${Error_text_missing_password}     Error: The password field is empty.

# URLs and Browser
${my_account_page_url}    http://happyharbor.kesug.com/my-account/
${browser}    Chrome

# chrome
# headlesschrome
# firefox
# headlessfirefox
# safari
# edge

# Locators
${UsernameField}    id=username
${PasswordField}    id=password
${Login_Button}     css=button[value="Log in"]
${Error_Message}    css=ul.woocommerce-error

*** Test Cases ***
Login With Incorrect Username And Password Should Display Error Message
    [Tags]    Login
    Open Browser                ${my_account_page_url}  ${browser}
    Input Text                  ${UsernameField}     ${UsernameValue}
    Input Text                  ${PasswordField}     ${PasswordValue}
    Click Element               ${Login_Button}
    Element Should Be Visible   ${Error_Message}
    Element Text Should Be      ${Error_Message}  ${Error_text_invalid_username}
    Close Browser

Login With Missing Username Should Display Error Message
    [Tags]    Login
    Open Browser                ${my_account_page_url}  ${browser}
    Input Text                  ${PasswordField}     ${PasswordValue}
    Click Element               ${Login_Button}
    Element Should Be Visible   ${Error_Message}
    Element Text Should Be      ${Error_Message}  ${Error_text_missing_username}
    Close Browser

Login With Missing Password Should Display Error Message
    [Tags]    Login
    Open Browser                   ${my_account_page_url}  ${browser}
    Input Text                     ${UsernameField}     ${UsernameValue}
    Wait Until Element Is Visible  ${Login_Button}
    Click Element                  ${Login_Button}
    Element Should Be Visible      ${Error_Message}
    Element Text Should Be         ${Error_Message}  ${Error_text_missing_password}
    Close Browser

*** Keywords ***
# TBD



