ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

-- Open Job Menu Command
RegisterCommand('openjobmenu', function()
    SetNuiFocus(true, true)
    SendNUIMessage({action = 'showMenu'})
end, false)

-- Handle job selection
RegisterNUICallback('selectJob', function(data, cb)
    local job = data.job
    TriggerServerEvent('esx_job_system:setJob', job)
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Listen for the job change event
RegisterNetEvent('esx_job_system:jobChanged')
AddEventHandler('esx_job_system:jobChanged', function(job)
    -- Update player's job UI or any other logic
    ESX.ShowNotification('Job changed to: ' .. job)
end)
