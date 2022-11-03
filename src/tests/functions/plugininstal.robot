*** Variables ***
${plugin_name}                              	MyAgilePrivacy
${boxpesquisar}                                 class:wp-filter-search
${plugin_instal}                                xpath://*[@data-slug='myagileprivacy']
${checkplugintwo}                               class:plugin-card-myagileprivacy


*** Keywords ***
Instala Plugin
    Go To               ${website_url}/wp-admin/plugins.php

    ${checkplugin}=             Get Element Count               xpath://*[@data-slug='myagileprivacy']

    IF  ${checkplugin} == 0
        Plugin upload
    END

Plugin upload
    Go To                                       ${website_url}/wp-admin/plugin-install.php
    Sleep                                       7
    Input Text                                  ${boxpesquisar}           ${plugin_name}
    Wait Until Element Is Visible               ${checkplugintwo}
    Click Element                               ${plugin_instal}
    Sleep                                       10
    Click Element                               ${plugin_instal}