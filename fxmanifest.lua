fx_version 'cerulean'
game 'gta5'

description 'SovietBankRobbery'
version '1.0.0'
author 'SovietRulez#0001'

client_scripts {
    'client/client.lua',
    'config.lua'
}
shared_script '@qb-core/import.lua'

server_script {
    'server/server.lua',
    'config.lua'
}

dependencies {
    fivem-drilling,
    meta_libs,
    linden_outlawalert
}
