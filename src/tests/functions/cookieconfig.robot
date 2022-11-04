*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${pluginmyagile}                    ${website_url}/wp-admin/admin.php?page=my-agile-privacy-c_settings
${PATH}                             C:\\Users\\Bruna\\cookiesRobot\\cookiesRobot\\src\\tests\\message.txt
${inputbox}                         id:notify_message_field
${tabposition}                      id:notify_position_horizontal_field
${leftposition}                     css:option[value="left"]
${cookiestext}                      <i class="fa-solid fa-cookie">Cookies</i>
${boxcookies}                       id:showagain_text
${checkboxcookie}                   id:cookie_policy_link_field
${updatesettings}                   css:input[name="update_admin_settings_form"]

*** Keywords ***
Configura Plugin
    Go To                                       ${pluginmyagile}
    Sleep                                        7
    General Configuration
    Buttons Configuration


General Configuration
    ${Cmd_Output}       Get File            ${PATH}          encoding=UTF-8    encoding_errors=strict   
    Input Text          ${inputbox}            ${Cmd_Output}   
    Mouse Down                                          ${tabposition}
    Click Element                                       ${tabposition}
    Click Element                                       ${leftposition}
    Input Text           ${boxcookies}             ${cookiestext}
    Sleep                                               5
    Click Element                                       ${checkboxcookie}
    Click Button                                        ${updatesettings}
    Sleep                                               7

Buttons Configuration             
    Go To                                            ${website_url}/wp-admin/edit.php?post_type=my-agile-privacy-c&page=my-agile-privacy-c_settings&tab=buttons
    Sleep                                               7 
