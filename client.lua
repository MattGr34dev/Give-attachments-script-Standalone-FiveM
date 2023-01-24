local Id = GetPlayerFromServerId(source)
local ped = GetPlayerPed(Id)
local weapon = GetSelectedPedWeapon(ped)

function onDutyWeaponPolice()
        GiveWeaponToPed(ped, GetHashKey("weapon_combatpistol"), 100, false, true)
        GiveWeaponComponentToPed(ped, GetHashKey("weapon_combatpistol"), GetHashKey("COMPONENT_AT_PI_FLSH"))
        GiveWeaponToPed(ped, GetHashKey("weapon_flashlight"), 100, false, true)
        GiveWeaponToPed(ped, GetHashKey("weapon_baton"), 100, false, true)
        GiveWeaponToPed(ped, GetHashKey("weapon_stungun", 100, false, true))
end


RegisterCommand('onduty', function(source, args)
    if args[1] == "police" then
        TriggerClientEvent(onDutyWeaponPolice())
    end
end, false)

RegisterCommand('givewc', function (source, args)
    GiveWeaponComponentToPed(ped, weapon, GetHashKey(args[1]))
end)

TriggerEvent('chat:addSuggestion', '/givewc', 'Используйте, чтобы выдать компонет оружия (фонарик и т.д).', {{ name="component", help="Введите нужный компонент."}})\
TriggerEvent('chat:addSuggestion', '/onduty', 'Используйте, чтобы выйти на смену.', {{ name="component", help="Введите ваш департамент."}})

