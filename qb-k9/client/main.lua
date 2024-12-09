local spawnedDog = nil
local ownerPed = PlayerPedId()

local function isPoliceJob()
    local playerData = QBCore.Functions.GetPlayerData()
    return playerData.job.name == "police"
end

-- Spawn Dog
RegisterNetEvent('qb-k9:spawnDog', function()
    if not isPoliceJob() then
        QBCore.Functions.Notify("You are not authorized to use this system!", "error")
        return
    end

    if spawnedDog then
        QBCore.Functions.Notify("You already have a dog!", "error")
        return
    end

    local model = GetHashKey('a_c_shepherd')
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    local playerCoords = GetEntityCoords(ownerPed)
    spawnedDog = CreatePed(28, model, playerCoords.x + 1, playerCoords.y, playerCoords.z, 0.0, true, false)
    SetEntityAsMissionEntity(spawnedDog, true, true)
    QBCore.Functions.Notify("Dog spawned successfully!", "success")
end)

-- Recall Dog
RegisterNetEvent('qb-k9:recallDog', function()
    if not isPoliceJob() then
        QBCore.Functions.Notify("You are not authorized to use this system!", "error")
        return
    end

    if spawnedDog then
        local playerCoords = GetEntityCoords(ownerPed)
        TaskGoToEntity(spawnedDog, ownerPed, -1, 5.0, 2.0, 0, 0)
        QBCore.Functions.Notify("Dog is returning to you!", "success")
    else
        QBCore.Functions.Notify("You don't have a dog!", "error")
    end
end)

-- Follow Dog
RegisterNetEvent('qb-k9:followDog', function()
    if not isPoliceJob() then
        QBCore.Functions.Notify("You are not authorized to use this system!", "error")
        return
    end

    if spawnedDog then
        TaskFollowToOffsetOfEntity(spawnedDog, ownerPed, 0.0, 0.0, 0.0, 2.0, -1, 5.0, true)
        QBCore.Functions.Notify("Dog is following you!", "success")
    else
        QBCore.Functions.Notify("You don't have a dog!", "error")
    end
end)

-- Sit Dog
RegisterNetEvent('qb-k9:sitDog', function()
    if not isPoliceJob() then
        QBCore.Functions.Notify("You are not authorized to use this system!", "error")
        return
    end

    if spawnedDog then
        TaskStartScenarioInPlace(spawnedDog, 'WORLD_DOG_SITTING_REST', 0, true)
        QBCore.Functions.Notify("Dog is sitting!", "success")
    else
        QBCore.Functions.Notify("You don't have a dog!", "error")
    end
end)

-- Attack Command
RegisterNetEvent('qb-k9:attack', function(targetId)
    if not isPoliceJob() then
        QBCore.Functions.Notify("You are not authorized to use this system!", "error")
        return
    end

    if spawnedDog and targetId then
        local targetPed = GetPlayerPed(GetPlayerFromServerId(targetId))
        if DoesEntityExist(targetPed) then
            TaskCombatPed(spawnedDog, targetPed, 0, 16)
            QBCore.Functions.Notify("Dog is attacking the target!", "success")
        else
            QBCore.Functions.Notify("Target not found!", "error")
        end
    else
        QBCore.Functions.Notify("You don't have a dog or no target specified!", "error")
    end
end)

-- Stop Attack Command
RegisterNetEvent('qb-k9:stopAttack', function()
    if not isPoliceJob() then
        QBCore.Functions.Notify("You are not authorized to use this system!", "error")
        return
    end

    if spawnedDog then
        ClearPedTasks(spawnedDog)
        QBCore.Functions.Notify("Dog has stopped attacking!", "success")
    else
        QBCore.Functions.Notify("You don't have a dog!", "error")
    end
end)

-- Enter Vehicle
RegisterNetEvent('qb-k9:enterVehicle', function()
    if not isPoliceJob() then
        QBCore.Functions.Notify("You are not authorized to use this system!", "error")
        return
    end

    if spawnedDog then
        local vehicle = GetVehiclePedIsIn(ownerPed, false)
        if vehicle then
            TaskEnterVehicle(spawnedDog, vehicle, -1, 0, 2.0, 16, 0)
            QBCore.Functions.Notify("Dog is entering the vehicle!", "success")
        else
            QBCore.Functions.Notify("You are not in a vehicle!", "error")
        end
    else
        QBCore.Functions.Notify("You don't have a dog!", "error")
    end
end)
