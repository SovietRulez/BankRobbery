local seconds = 1000
local minute = 60 * seconds
local hour = 60 * minute
local currentDoor = {}
local isBusy = false
function DrawText3D(coords, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isBusy then
            DisableControlAction(0, 38, true)
        end
    end
end)

local currentZoneType
local isInZone = false
Citizen.CreateThread(function()
    while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
        Wait(10)
    end
    TriggerServerEvent('soviet:server:getZones')
    while true do
        Citizen.Wait(5)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        for bankName, bankData in pairs(Config.Banks) do
            for zoneName, zoneData in pairs(bankData.Zones) do

                local distance = #(coords - zoneData.coords)
                if distance <= 1.0 then
                    isInZone = true
                    currentZoneType = zoneData.type
                    if currentZoneType == 'register' then
                        if IsControlJustReleased(1, 38) and not zoneData.status.opened and not zoneData.status.broken then
                            QBCore.Functions.TriggerCallback('soviet:server:getCops', function(cops)
                                QBCore.Functions.TriggerCallback('soviet:server:itemCheck', function(hasItem)
                                    if cops >= bankData.requiredCops then
                                        if hasItem then
                                            isBusy = true
                                            SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)
                                            Citizen.Wait(1000)
                                            SetEntityCoords(player, zoneData.pedCoords, false, false, false, true)
                                            SetEntityHeading(player, zoneData.heading)
                                            TriggerEvent('soviet:client:animOne')
                                            QBCore.Functions.Notify("You're robbing the register", success, 5000)
                                            Citizen.Wait(10000)
                                            isBusy = false
                                            TriggerServerEvent('soviet:server:syncStatus', bankName, zoneName, true)
                                        end
                                    else
                                        if cops < bankData.requiredCops then
                                            QBCore.Functions.Notify("Not enough cops", 'error', 5000)
                                        end
                                    end
                                end, Config.RegisterItem)
                            end)
                        end
                    elseif currentZoneType == 'door' then
                        if IsControlJustReleased(1, 38) and not zoneData.status.opened and not zoneData.status.broken then
                            QBCore.Functions.TriggerCallback('soviet:server:getCops', function(cops)
                                QBCore.Functions.TriggerCallback('soviet:server:doorCheck', function(hasItem)
                                    if cops >= bankData.requiredCops then
                                        if hasItem then
                                            SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)
                                            Citizen.Wait(1000)
                                            isBusy = true
                                            SetEntityCoords(player, zoneData.pedCoords, false, false, false, true)
                                            SetEntityHeading(player, zoneData.pedHeading)
                                            TriggerEvent('soviet:client:animTwo')
                                            Citizen.Wait(10000)
                                            isBusy = false
                                            TriggerServerEvent('soviet:server:syncStatus', bankName, zoneName, true)
                                        end
                                    else
                                        if cops < bankData.requiredCops then
                                            QBCore.Functions.Notify("Not enough cops", 'error', 5000)
                                        end
                                    end
                                end, Config.DoorItem)
                            end)
                        end
                    elseif currentZoneType == 'vault' then
                        if IsControlJustReleased(1, 38) and not zoneData.status.opened and not zoneData.status.broken then
                            QBCore.Functions.TriggerCallback('soviet:server:getCops', function(cops)
                                QBCore.Functions.TriggerCallback('soviet:server:vaultCheck', function(hasItem)
                                    if cops >= bankData.requiredCops then
                                        if hasItem then
                                            SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)
                                            Citizen.Wait(1000)
                                            local bmodel = "prop_c4_final_green"
                                            local animodel = GetHashKey(bmodel)
                                            local playerCoords = GetEntityCoords(player, true)
                                            local pedBone = GetPedBoneIndex(player, 57005)
                                            local bombObject =CreateObject(animodel, playerCoords.x, playerCoords.y, playerCoords.z,true, true, false)
                                            while not HasModelLoaded(animodel) do
                                                RequestModel(animodel)
                                                Citizen.Wait(10)
                                            end
                                            SetEntityCoords(player, zoneData.pedCoords, false, false, false, true)
                                            SetEntityHeading(player, zoneData.pedHeading)
                                            AttachEntityToEntity(bombObject, PlayerPedId(), pedBone, 0.125, 0.0, -0.05,100.0, 300.0, 135.0, true, true, false, true, 1, true)
                                            Citizen.Wait(1000)
                                            FreezeEntityPosition(bombObject2, true)
                                            isBusy = true
                                            TriggerEvent('soviet:client:animThree')
                                            Citizen.Wait(899)
                                            DeleteObject(bombObject)
                                            DeleteEntity(bombObject)
                                            Citizen.Wait(10)
                                            local bombObject2 =CreateObject(animodel, zoneData.bombSite, true, true, false)
                                            SetEntityHeading(bombObject2, zoneData.heading)
                                            Citizen.Wait(10000)
                                            AddExplosion(zoneData.bombSite, 5, 100.0, true, false, 0.0)
                                            DeleteObject(bombObject2)
                                            DeleteEntity(bombObject2)
                                            isBusy = false
                                            TriggerServerEvent('soviet:server:syncStatus', bankName, zoneName, true)
                                            DeleteObject(bombObject)
                                            DeleteEntity(bombObject)
                                        end
                                    end
                                end, Config.DoorItem)
                            end)
                        end
                    elseif currentZoneType == 'sdb' then
                        if IsControlJustReleased(1, 38) and not zoneData.status.opened and not zoneData.status.broken then
                            QBCore.Functions.TriggerCallback('soviet:server:getCops', function(cops)
                                QBCore.Functions.TriggerCallback('soviet:server:sdb', function(hasItem)
                                    if cops >= bankData.requiredCops then
                                        if hasItem then
                                            SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)
                                            Citizen.Wait(1000)
                                            SetEntityCoords(player, zoneData.pedCoords, false, false, false, true)
                                            SetEntityHeading(player, zoneData.pedHeading)
                                            isBusy = true
                                            local bmodel = "hei_prop_heist_drill"
                                            local animModel = GetHashKey(bmodel)
                                            local playerCoords = GetEntityCoords(player, true)
                                            local pedBone = GetPedBoneIndex(player, 57005)
                                            local drillObject =CreateObject(animModel, playerCoords.x, playerCoords.y, playerCoords.z,true, true, false)
                                            RequestAnimDict('anim@heists@fleeca_bank@drilling')
                                            while not HasAnimDictLoaded('anim@heists@fleeca_bank@drilling') do
                                                Wait(10)
                                            end
                                            while not HasModelLoaded(animModel) do
                                                RequestModel(animModel)
                                                Citizen.Wait(10)
                                            end
                                            AttachEntityToEntity(drillObject, PlayerPedId(), pedBone, 0.125, 0.0, -0.05,100.0, 300.0, 135.0, true, true, false, true, 1, true)

                                            TaskPlayAnim(player, "anim@heists@fleeca_bank@drilling","drill_straight_idle", 1.0, -1.0, -1, 1, 1, true, true, true)
                                            TriggerEvent("Drilling:Start", function(success)
                                                if (success == 1) then
                                                    DeleteObject(drillObject)
                                                    DeleteEntity(drillObject)
                                                    ClearPedTasks(player)
                                                    isBusy = false
                                                    TriggerServerEvent('soviet:server:syncStatus', bankName, zoneName,true)
                                                    TriggerServerEvent('soviet:server:sdbcheck')
                                                else
                                                    isBusy = false
                                                    DeleteObject(drillObject)
                                                    DeleteEntity(drillObject)
                                                    ClearPedTasks(player)
                                                    TriggerServerEvent('soviet:server:syncStatus', bankName, zoneName,false, true)
                                                end
                                                if cops < bankData.requiredCops then
                                                    QBCore.Functions.Notify("Not enough cops", 'error', 5000)
                                                end
                                            end, Config.DoorItem)
                                        end
                                    end
                                    if cops < bankData.requiredCops then
                                        QBCore.Functions.Notify("Not enough cops", 'error', 5000)
                                    end
                                end)
                            end)
                        end
                    end
                end
                if distance <= 2 and currentZoneType == 'register' then
                    if zoneData.status.opened then
                        DrawText3D(zoneData.coords, "~r~Register Robbed~r~")
                    else
                        DrawText3D(zoneData.coords, "Press ~y~E~y~ ~w~to~w~ ~r~rob register~r~")
                    end
                elseif distance <= 2 and currentZoneType == 'door' then
                    local area = zoneData.coords
                    local door = GetClosestObjectOfType(area, 5.0, zoneData.hash, false, false, false)
                    local opendoor = GetClosestObjectOfType(area, 5.0, zoneData.openhash, false, false, false)
                    if zoneData.status.opened then
                        DrawText3D(zoneData.coords, "~r~Door Unlocked~r~")
                        FreezeEntityPosition(door, false)
                    else
                        DrawText3D(zoneData.coords, "Press ~y~E~y~ ~w~to~w~ ~r~Break In~r~")
                        FreezeEntityPosition(door, true)
                        SetEntityHeading(door, zoneData.heading)
                    end
                elseif distance <= 2 and currentZoneType == 'sdb' then
                    if zoneData.status.broken then
                        DrawText3D(zoneData.coords, "~r~Broken~r~")
                    elseif zoneData.status.opened then
                        DrawText3D(zoneData.coords, "~y~Deposit Box Open~y~")
                    else
                        DrawText3D(zoneData.coords, "Press ~y~E~y~ ~w~to~w~ ~r~Drill Safety Deposit Box~r~")
                    end
                elseif distance <= 2 and currentZoneType == 'vault' then
                    local area = zoneData.coords
                    local vault = GetClosestObjectOfType(area, 5.0, zoneData.hash, false, false, false)
                    if zoneData.status.opened then
                        DrawText3D(zoneData.coords, "~r~Vault Blown Open~r~")
                        FreezeEntityPosition(vault, false)
                        SetEntityHeading(vault, zoneData.openHeading)
                    else
                        DrawText3D(zoneData.coords, "Press ~y~E~y~ ~w~to~w~ ~r~Plant Bomb~r~")
                        FreezeEntityPosition(vault, true)
                        SetEntityHeading(vault, zoneData.heading)
                    end
                end
            end
        end
    end
end)

function Cooldown(bankName, zoneName, zoneData, fromServ)
    Citizen.CreateThread(function()
        zoneData.status.onCooldown = true

        Wait(zoneData.status.cooldown * minute)
        zoneData.status.opened = false
        zoneData.status.onCooldown = false
        zoneData.status.broken = false
        TriggerServerEvent('soviet:server:syncStatus', bankName, zoneName, false, false, false)
    end)
end

RegisterNetEvent('soviet:client:syncStatus')
AddEventHandler('soviet:client:syncStatus', function(bankName, zoneName, opened, broken, cooling)
    Config.Banks[bankName].Zones[zoneName].status.opened = opened
    if broken ~= nil then
        Config.Banks[bankName].Zones[zoneName].status.broken = broken
    end
    if cooling ~= nil then
        Config.Banks[bankName].Zones[zoneName].status.onCooldown = cooling
    end
    if opened or broken then
        Cooldown(bankName, zoneName, Config.Banks[bankName].Zones[zoneName])
    end
end)

RegisterNetEvent('soviet:client:syncZones')
AddEventHandler('soviet:client:syncZones', function(zones)
    Config.Banks = zones
end)

RegisterNetEvent('soviet:client:animOne')
AddEventHandler('soviet:client:animOne', function(targetId)
    local ped = PlayerPedId()
    isBreakingRegister = true
    QBCore.Functions.Progressbar("soviet_register", "Breaking into register..", 9000, false, true, {
        disableMovement = true,
        disableCarMovement = false,

        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
        anim = 'weed_stand_checkingleaves_kneeling_01_inspector',
        flags = 1
    }, {}, {}, function()
        isBreakingRegister = false
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Register broken into!")
    end, function()
        isBreakingRegister = false
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Canceled!", "error")
    end)
end)

RegisterNetEvent('soviet:client:animTwo')
AddEventHandler('soviet:client:animTwo', function(targetId)
    local ped = PlayerPedId()
    isBreakingRegister = true
    QBCore.Functions.Progressbar("soviet_door", "Unlocking Door..", 9000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@',
        anim = 'weed_stand_checkingleaves_idle_04_inspector',
        flags = 1
    }, {}, {}, function()
        isBreakingRegister = false
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Door Unlocked")
    end, function()
        isBreakingRegister = false
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Canceled!", "error")
    end)
end)

RegisterNetEvent('soviet:client:animThree')
AddEventHandler('soviet:client:animThree', function(targetId)
    local ped = PlayerPedId()
    isBreakingRegister = true
    QBCore.Functions.Progressbar("soviet_door", "Planting Bomb..", 1400, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true
    }, {
        animDict = 'weapons@projectile@sticky_bomb',
        anim = 'plant_vertical',
        flags = 1
    }, {}, {}, function()
        isBreakingRegister = false
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Bomb Planted")
    end, function()
        isBreakingRegister = false
        ClearPedTasks(ped)
        QBCore.Functions.Notify("Canceled!", "error")
    end)
end)
