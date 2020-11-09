ESX = nil

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)


for i=1, #Config.VehiclePositions, 1 do
Config.VehiclePositions[i].isOwned = false
end


RegisterServerEvent('esx_vehiclesRent:setVehicleTimer')
AddEventHandler('esx_vehiclesRent:setVehicleTimer', function(vehicle, entityId, minutes)
local _source = source
if vehicle.job ~= 'none' then 
Citizen.Wait(1000 * 60 * 360)
else 
Citizen.Wait(1000 * 60 * minutes)
end
Config.VehiclePositions[vehicle.id].isOwned = false
TriggerClientEvent('esx_vehiclesRent:respawnCars', -1)
if vehicle.job == 'none' then 
TriggerClientEvent('esx_vehiclesRent:deleteRentCar', _source, entityId)
end
end)


ESX.RegisterServerCallback("esx_vehiclesRent:retrieveVehicles", function(source, cb)
cb(Config.VehiclePositions)
end)

ESX.RegisterServerCallback("esx_vehiclesRent:getVehicle", function(source, cb, vehicle)
Config.VehiclePositions[vehicle.id].isOwned = true
TriggerClientEvent('esx_vehiclesRent:respawnCars', -1)
cb()
end)

ESX.RegisterServerCallback("esx_vehiclesRent:buyVehicle", function(source, cb, vehicle)
local xPlayer  = ESX.GetPlayerFromId(source)
if vehicle.price <= xPlayer.get('money') then

Config.VehiclePositions[vehicle.id].isOwned = true
TriggerClientEvent('esx_vehiclesRent:respawnCars', -1)
xPlayer.removeMoney(vehicle.price)
cb(true)
else 
cb(false)

end

end)