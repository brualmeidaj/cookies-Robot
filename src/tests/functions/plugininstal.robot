*** Variables ***
${plugin_name}                              	Cookie Notice & Compliance for GDPR/CCPA
${boxpesquisar}                                 class:wp-filter-search
${checkplugin}                                  xpath://*[@data-slug='cookie-notice']


*** Keywords ***
Instala Plugin
    Go To               ${website_url}/wp-admin/plugins.php

    ${checkplugin}=             Get Element Count               xpath://*[@data-slug='cookie-notice']

    IF  ${checkplugin} == 0
        Plugin upload
    END

Plugin upload
    Go To                                       ${website_url}/wp-admin/plugin-install.php
    Sleep                                       7
    Input Text                                  ${boxpesquisar}           ${plugin_name}
    Sleep                                       7
    Click Element                               ${checkplugin}
    Sleep                                       15
    Click Element                               ${checkplugin}