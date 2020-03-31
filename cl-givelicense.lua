-- WRITTEN BY MAX GOLF --------------------------
-- Max Golf#0001  -------------------------------
-- SUPPORT DISCORD: https://discord.gg/exZVrhB --
-------------------------------------------------


ESX                           = nil
local PlayerData              = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
        PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterCommand('givelicense', function(source, args)
    if PlayerData.job and PlayerData.job.name == 'police' then -- CHANGE TO YOUR JOB HERE 'police'
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                GiveLicenseToPlayer(closestPlayer) -- FUNCTION TO GIVE LICENSE
            else
                ESX.ShowNotification('There is no players nearby')
                --exports['mythic_notify']:SendAlert('error', 'There is no players nearby')
            end
        
            else
                ESX.ShowNotification('You are not a police officer')
                --exports['mythic_notify']:SendAlert('error', 'You are not a police officer')
            end
end, false)



function GiveLicenseToPlayer(player) -- FUNCTION TO GIVE LICENSE

    ESX.ShowNotification('You gave weapon license to ID: '.. GetPlayerServerId(player))
    --exports['mythic_notify']:SendAlert('inform', 'You gave weapon license to ID: '.. GetPlayerServerId(player))
    TriggerServerEvent('esx_license:addLicense', GetPlayerServerId(player), "weapon")

end GetPlayerServerId(player)
