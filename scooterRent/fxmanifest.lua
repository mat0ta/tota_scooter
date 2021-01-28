fx_version 'cerulean'
game 'gta5'

author 'MCNMATOTA#2277'
description 'tota_scooter'
version '1.0.0'

client_scripts {
    "config.lua",
    "client/main.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "config.lua",
    "server/main.lua"
}
