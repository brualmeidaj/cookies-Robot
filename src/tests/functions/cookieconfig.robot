*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${pluginmyagile}                    ${website_url}/wp-admin/admin.php?page=my-agile-privacy-c_settings
${PATH}                             C:\\Users\\Bruna\\Desktop\\cookies\\src\\tests\\message.txt
${inputbox}                         id:notify_message_field
${tabposition}                      id:notify_position_horizontal_field
${leftposition}                     css:option[value="left"]
${cookiestext}                      🍪 Cookies
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
    Input Text               ${boxcookies}              ${cookiestext}
    Click Element                                       ${checkboxcookie}
    Click Button                                        ${updatesettings}
    Sleep                                               7

Buttons Configuration               
