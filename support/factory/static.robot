*** Keywords ***

Get Static Data
    [Arguments]       ${file_name}
    ${file}=          Get File    ${EXECDIR}/support/factory/static/${file_name}
    ${data}           Evaluate    json.loads('''${file}''')       json
    [return]          ${data}