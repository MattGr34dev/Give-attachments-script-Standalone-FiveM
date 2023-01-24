local playerIdx = GetPlayerFromServerId(source)
local ped = GetPlayerPed(playerIdx)
local weapon = GetSelectedPedWeapon(ped)

function onDutyWeaponPolice()
        GiveWeaponToPed(ped, GetHashKey("weapon_servicepistol"), 100, false, true)
        GiveWeaponComponentToPed(ped, GetHashKey("weapon_servicepistol"), GetHashKey("COMPONENT_AT_PI_FLSH"))
        GiveWeaponToPed(ped, GetHashKey("weapon_flashlight"), 100, false, true)
        GiveWeaponToPed(ped, GetHashKey("weapon_baton"), 100, false, true)
        GiveWeaponToPed(ped, GetHashKey("weapon_stungun", 100, false, true))
        SetPedWeaponTintIndex(ped, GetHashKey("weapon_stungun"), 1)

end

function onDutyWeaponSheriff()
        GiveWeaponToPed(ped, GetHashKey("weapon_servicepistol"), 100, false, true)
        GiveWeaponComponentToPed(ped, GetHashKey("weapon_servicepistol"), GetHashKey("COMPONENT_AT_PI_FLSH"))
        GiveWeaponToPed(ped, GetHashKey("weapon_flashlight"), 100, false, true)
        GiveWeaponToPed(ped, GetHashKey("weapon_baton"), 100, false, true)
        SetPedWeaponTintIndex(ped, GetHashKey("weapon_stungun"), 2)
end

RegisterCommand('onduty', function(source, args)
    if args[1] == "police" then
        TriggerClientEvent(onDutyWeaponPolice())
    elseif args[1] == "sheriff" then
        TriggerClientEvent(onDutyWeaponSheriff())
    end
end, false)

RegisterCommand('givewc', function (source, args)
    GiveWeaponComponentToPed(ped, weapon, GetHashKey(args[1]))
end)

TriggerEvent('chat:addSuggestion', '/givewc', 'Используйте, чтобы выдать компонет оружия (фонарик и т.д).', {{ name="component", help="Введите нужный компонент."}})

