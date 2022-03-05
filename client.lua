
local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData()


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerData.job = job
end)




RegisterCommand('livery', function(source, args, rawCommand)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    local livery = tonumber(args[1])
    local liveryCount = GetVehicleLiveryCount(veh)
    if livery ~= nil then
        if PlayerData.job.name == "police" then
            if GetVehicleClass(veh) == 18 then
            if livery <= liveryCount then
                SetVehicleLivery(veh, livery)
            else
            end
        else
        end
        else
        end
    else
    end
end, false)


nvr_pursuit = function()
    if PlayerData.job.name == "police" then
        QBCore.Functions.Notify('Pit Ve Ram İzni İstenildi')

         QBCore.Functions.Notify('Pursuit Sayacı Bittikten Sonra Pit Ve Ram İzni Verilecek!')
         Citizen.Wait(60000)
         local dk = 4
         while dk >  0 do
             QBCore.Functions.Notify('Pit ve Ram iznine  '..dk..' dakika Kaldı!')
             dk = dk - 1
             Citizen.Wait(60000)
         end
         QBCore.Functions.Notify('Bulunduğun Araç Kovalaması İçin Pit ve Ram İzni Verildi!')
        else 
    QBCore.Functions.Notify('Sadece Polisler Kullanabilir')
    end
end


nvr_oxford = function ()
    if PlayerData.job.name == "police" then
        QBCore.Functions.Notify('Oxford Sayacı Başladı.İzin Geldikten Sonra Müdahale Edebilirsin!')
        Citizen.Wait(50000)
        QBCore.Functions.Notify('Bulunduğun Oxford İçin Müdahale İzni Verildi')
    else
        QBCore.Functions.Notify('Sadece Polisler Kullanabilir')
    end
end



CreateThread(function()   
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
    SetAudioFlag("PoliceScannerDisabled",true);
end)


RegisterCommand("pursuit", function()
    nvr_pursuit()
end)

RegisterCommand ("oxford", function()
      nvr_oxford ()
end)