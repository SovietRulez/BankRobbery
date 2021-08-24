RegisterServerEvent('soviet:server:syncStatus')
AddEventHandler('soviet:server:syncStatus', function(bankName, zoneName, opened, broken, cooling)
    Config.Banks[bankName].Zones[zoneName].status.opened = opened
    if broken ~= nil then
        Config.Banks[bankName].Zones[zoneName].status.broken = broken
    end
    if cooling ~= nil then
        Config.Banks[bankName].Zones[zoneName].status.onCooldown = cooling
    end
    TriggerClientEvent('soviet:client:syncStatus', -1, bankName, zoneName, opened, broken, cooling)
end)

RegisterServerEvent('soviet:server:getZones')
AddEventHandler('soviet:server:getZones', function()
    TriggerClientEvent('soviet:client:syncZones', source, Config.Banks)
end)

RegisterServerEvent('soviet:server:sandwich')
AddEventHandler('soviet:server:sandwich', function(src)
    local player = QBCore.Functions.GetPlayer(src)
    player.Functions.AddMoney('cash', math.random(100, 300), "robbery-ifruit")
    print(player)
end)

RegisterServerEvent('soviet:server:sdbcheck')
AddEventHandler('soviet:server:sdbcheck', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local luck = math.random(1, 100)
    if luck == 1 then
        player.Functions.AddItem('rolex', 1)
        player.Functions.AddItem('diamond_ring', 1)
        player.Functions.AddItem('goldchain', 1)
        player.Functions.AddItem('10kgoldchain', 1)
        player.Functions.AddItem('goldbar', 1)
        player.Functions.AddItem('markedbills', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rolex"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["diamond_ring"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldchain"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["10kgoldchain"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldbar"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add")
    elseif luck <= 10 and luck > 1 then
        player.Functions.AddItem('rolex', 2)
        player.Functions.AddItem('goldbar', 1)
        player.Functions.AddItem('goldchain', 2)
        player.Functions.AddItem('markedbills', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rolex"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rolex"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldbar"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldchain"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldchain"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add")
    elseif luck <= 20 and luck > 10 then
        player.Functions.AddItem('10kgoldchain', 1)
        player.Functions.AddItem('rolex', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["10kgoldchain"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rolex"], "add")
    elseif luck > 20 then
        player.Functions.AddItem('markedbills', 2)
        player.Functions.AddItem('10kgoldchain', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["10kgoldchain"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add")
    end
end)

QBCore.Functions.CreateCallback('soviet:server:itemCheck', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player.Functions.GetItemByName(Config.RegisterItem) ~= nil and player.Functions.GetItemByName("moneybag") ~= nil then
        player.Functions.RemoveItem(Config.RegisterItem, 1)
        player.Functions.RemoveItem("moneybag", 1)
        cb(true)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RegisterItem], "removed")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["moneybag"], "removed")
        Citizen.Wait(10000)
        TriggerEvent("soviet:server:sandwich", src)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', source, "You didnt come prepared did you?!", 'error', 10000)

    end
end)

QBCore.Functions.CreateCallback('soviet:server:sdb', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player.Functions.GetItemByName(Config.SDBItem) ~= nil and player.Functions.GetItemByName("moneybag") ~= nil then
        player.Functions.RemoveItem(Config.SDBItem, 1)
        player.Functions.RemoveItem("moneybag", 1)
        cb(true)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SDBItem], "removed")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["moneybag"], "removed")
        Citizen.Wait(10000)
        TriggerEvent("soviet:server:sdbreward", src)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', source, "You didnt come prepared did you?!", 'error', 10000)

    end
end)

QBCore.Functions.CreateCallback('soviet:server:doorCheck', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player.Functions.GetItemByName(Config.DoorItem) ~= nil then
        player.Functions.RemoveItem(Config.DoorItem, 1)
        cb(true)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.DoorItem], "removed")
        Citizen.Wait(10000)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', source, "You didnt come prepared did you?!", 'error', 10000)
    end
end)

QBCore.Functions.CreateCallback('soviet:server:vaultCheck', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player.Functions.GetItemByName(Config.VaultItem) ~= nil then
        player.Functions.RemoveItem(Config.VaultItem, 1)
        cb(true)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VaultItem], "removed")
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', source, "You didnt come prepared did you?!", 'error', 10000)
    end
end)

QBCore.Functions.CreateCallback('soviet:server:getCops', function(source, cb)
    local amount = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
    end
    cb(amount)
end)
