--List of blocked client events.
local _blockedClientEvents ={
    "ambulancier:selfRespawn",
    "bank:transfer",
    "esx_ambulancejob:revive",
    "esx-qalle-jail:openJailMenu",
    "esx_jailer:wysylandoo",
    "esx_society:openBossMenu",
    "esx:spawnVehicle",
    "esx_status:set",
    "HCheat:TempDisableDetection",
    "UnJP"
}
--Handler and iterator for the above blocked client events. 
local Triggered = false
for k, eventName in ipairs(_blockedClientEvents) do
    AddEventHandler(eventName, function()
        if Triggered == true then
            CancelEvent()
            return
        end
        TriggerEvent('Valkyrie:ClientDetection', GetPlayerName(PlayerId()), 'Blocked event: ' ..eventName.. '', 'Blocked event')
        Triggered = true
    end)
end
AddEventHandler('onClientResourceStop', function(resource)
    TriggerEvent('Valkyrie:ClientDetection', GetPlayerName(PlayerId()), 'Stopped resource: `' ..resource.. '`', 'Invalid resource list')
end)

AddEventHandler('onClientMapStart', function()
TriggerEvent('chat:addSuggestion', '/kick', 'Kick specified player with optional reason', {
    { name = 'Player ID', help = 'Player Server ID' },
    { name = 'reason', help = 'Reason for kick'}
})
TriggerEvent('chat:addSuggestion', '/freeze', 'Freeze specified player', {
    { name = 'Player ID', help = 'Player Server ID'}
})
end)
