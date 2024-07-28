ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_job_system:setJob')
AddEventHandler('esx_job_system:setJob', function(job)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.setJob(job, 0) -- Set job and grade (0)
        TriggerClientEvent('esx_job_system:jobChanged', source, job)
    end
end)
