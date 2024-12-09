RegisterNetEvent('qb-k9:attack', function(targetId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData.job.name == "police" then
        local target = GetPlayerFromServerId(targetId)
        if target then
            TriggerClientEvent('qb-k9:attack', src, targetId)
        else
            TriggerClientEvent('QBCore:Notify', src, "Invalid target ID!", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not authorized to use this system!", "error")
    end
end)

RegisterNetEvent('qb-k9:spawnDog', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData.job.name == "police" then
        TriggerClientEvent('qb-k9:spawnDog', src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not authorized to use this system!", "error")
    end
end)

RegisterNetEvent('qb-k9:recallDog', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData.job.name == "police" then
        TriggerClientEvent('qb-k9:recallDog', src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not authorized to use this system!", "error")
    end
end)

RegisterNetEvent('qb-k9:followDog', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData.job.name == "police" then
        TriggerClientEvent('qb-k9:followDog', src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not authorized to use this system!", "error")
    end
end)

RegisterNetEvent('qb-k9:sitDog', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData.job.name == "police" then
        TriggerClientEvent('qb-k9:sitDog', src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not authorized to use this system!", "error")
    end
end)

RegisterNetEvent('qb-k9:stopAttack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData.job.name == "police" then
        TriggerClientEvent('qb-k9:stopAttack', src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not authorized to use this system!", "error")
    end
end)

RegisterNetEvent('qb-k9:enterVehicle', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player and Player.PlayerData.job.name == "police" then
        TriggerClientEvent('qb-k9:enterVehicle', src)
    else
        TriggerClientEvent('QBCore:Notify', src, "You are not authorized to use this system!", "error")
    end
end)
