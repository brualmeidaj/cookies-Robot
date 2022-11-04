*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${pluginmyagile}                    ${website_url}/wp-admin/admin.php?page=my-agile-privacy-c_settings
${PATH}                             C:\\Users\\Bruna\\cookiesRobot\\cookiesRobot\\src\\tests\\message.txt
${inputbox}                         css:textarea[name="cookie_notice_options[message_text]"]
${tabposition}                      id:notify_position_horizontal_field
${boxaccept}                        css:input[name="cookie_notice_options[accept_text]"]
${accept}                           Aceitar
${enablerefuse}                     id:cn_refuse_opt
${boxrefuse}                        css:input[name="cookie_notice_options[refuse_text]"]
${refuse}                           Recusar
${customize}                        id:button_customize_text_field
${customizeblank}                   Customizar
${enableaccept}                     css:input[name="cookie_notice_options[on_click]"]
${accept_expired}                   css:input[name="cookie_notice_options[time]"]
${accepted_infinity}                css:option[value="infinity"]
${refuse_expired}                   ${css:input[name="cookie_notice_options[time_rejected]"]}
${accepted_infinity}                css:option[value="week"] 

*** Keywords ***
Configura Plugin
    Go To                                       ${pluginmyagile}
    Sleep                                        7
    General Configuration

General Configuration
    ${Cmd_Output}             Get File                  ${PATH}          encoding=UTF-8    encoding_errors=strict   
    Input Text              ${inputbox}                 ${Cmd_Output}   
    Mouse Down                                          ${tabposition}
    Input Text              ${boxaccept}                ${accept}
    Click Element                                       ${enablerefuse}
    Input Text              ${boxrefuse}                ${refuse}
    Click Element                                       ${enableaccept}
    Click Element                                       ${accept_expired}
    Click Element                                       ${accepted_infinity}
    Click Element                                       ${refuse_expired}