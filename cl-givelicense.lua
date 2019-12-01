RegisterCommand('givelicense', function()
    local closestPlayer, closestDistance = ESX.Game.GetclosestPlayer()
    
    if PlayerData.job and PlayerData.job.name == 'police' then
        if PlayerData.job.grade_name == 'boss' then
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                TriggerServerEvent('esx_license:addLicense', closestPlayer, 'weapon')
        else
            exports['mythic_notify']:DoHudText('error', 'Error')
        end

    else
        exports['mythic_notify']:DoHudText('error', 'You are not a police officer')
    end

    else
        exports['mythic_notify']:DoHudText('error', 'Higher police grade is required')
    end
end)