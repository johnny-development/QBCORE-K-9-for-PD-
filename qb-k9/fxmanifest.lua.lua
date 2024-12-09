fx_version 'cerulean'
game 'gta5'

author 'Johnny'
description 'QBCore K9 System'
version '1.0.0'

client_scripts {
    'client/main.lua',
    'client/gui.lua'
}

server_scripts {
    'server/main.lua'
}

shared_script '@qb-core/shared.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}
