*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${plugincookienotice}               ${website_url}/wp-admin/admin.php?page=cookie-notice
${PATH}                             C:\\Users\\Bruna\\cookiesRobot\\cookiesRobot\\src\\tests\\message.txt
${inputbox}                         css:textarea[name="cookie_notice_options[message_text]"]
${tabposition}                      id:notify_position_horizontal_field
${boxaccept}                        css:input[name="cookie_notice_options[accept_text]"]
${accept}                           Ok
${customize}                        id:button_customize_text_field
${customizeblank}                   Customizar
${enableaccept}                     css:input[name="cookie_notice_options[on_click]"]
${accept_expired}                   css:select[name="cookie_notice_options[time]"]
${accepted_infinity}                css:option[value="infinity"]
${refuse_expired}                   css:select[name="cookie_notice_options[time_rejected]"]
${accepted_week}                    xpath://div[@id="cn_time_rejected"]//option[3]
${buttoncolor}                      xpath://*[@id="cn_colors-text"]//button
${colorwords}                       xpath://a[@class="iris-palette"]
${buttonbackground}                 xpath://*[@id="cn_colors-bar"]//button
${boxchangecolor}                   css:input[name="cookie_notice_options[colors][bar]"]
${textchangecolor}                  #ffffff
${salvar}                           id:save_cookie_notice_options


*** Keywords ***
Configura Plugin
    Go To                                       ${plugincookienotice}
    Sleep                                        7
    General Configuration

General Configuration
    ${Cmd_Output}             Get File                  ${PATH}          encoding=UTF-8    encoding_errors=strict   
    Input Text                ${inputbox}                 ${Cmd_Output}   
    Mouse Down                                          ${boxaccept}
    Input Text              ${boxaccept}                ${accept}
    Click Element                                       ${enableaccept}
    Click Element                                       ${accept_expired}
    Click Element                                       ${accepted_infinity}
    Click Element                                       ${refuse_expired}
    Click Element                                       ${accepted_week} 
    Click Button                                        ${buttoncolor}
    Click Element                                       ${colorwords} 
    Click Button                                        ${buttonbackground}
    Wait Until Element Is Visible                       ${boxchangecolor}
    Click Element                                       ${boxchangecolor}
    Input Text              ${boxchangecolor}           ${textchangecolor}
    Wait Until Element Is Visible                       xpath://*[@id="cn_colors-bar"]//div//a[2]
    Click Element                                       xpath://*[@id="cn_colors-bar"]//div//a[2]
    Click Button                                        ${salvar}