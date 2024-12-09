local open = false

-- Command to open/close the menu
RegisterCommand("k9menu", function()
    local playerData = QBCore.Functions.GetPlayerData()
    if playerData.job.name ~= "police" then
        QBCore.Functions.Notify("You are not authorized to use this system!", "error")
        return
    end

    if not open then
        open = true
        SetNuiFocus(true, true)
        SendNUIMessage({action = "open"})
    else
        open = false
        SetNuiFocus(false, false)
        SendNUIMessage({action = "close"})
    end
end)

-- NUI Callbacks for each button
RegisterNUICallback("spawn", function(data, cb)
    TriggerEvent("qb-k9:spawnDog")
    cb("ok")
end)

RegisterNUICallback("recall", function(data, cb)
    TriggerEvent("qb-k9:recallDog")
    cb("ok")
end)

RegisterNUICallback("follow", function(data, cb)
    TriggerEvent("qb-k9:followDog")
    cb("ok")
end)

RegisterNUICallback("sit", function(data, cb)
    TriggerEvent("qb-k9:sitDog")
    cb("ok")
end)

RegisterNUICallback("attack", function(data, cb)
    local targetId = tonumber(data.targetId)
    if targetId then
        TriggerEvent("qb-k9:attack", targetId)
    else
        QBCore.Functions.Notify("Invalid target ID!", "error")
    end
    cb("ok")
end)

RegisterNUICallback("stopAttack", function(data, cb)
    TriggerEvent("qb-k9:stopAttack")
    cb("ok")
end)

RegisterNUICallback("vehicle", function(data, cb)
    TriggerEvent("qb-k9:enterVehicle")
    cb("ok")
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    open = false
    cb("ok")
end)
