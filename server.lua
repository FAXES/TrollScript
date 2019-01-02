--------------------------------------------
--- Ultimate Troll Script, Made by FAXES ---
--------------------------------------------
globalTroll = false

RegisterCommand("troll", function(source, args, user)
    if IsPlayerAceAllowed(source, "FTroll") then
        if not globalTroll then
            if args[1] == "y" then
                TriggerClientEvent("Fax:ToggleTheTrolling", -1, true)
                globalTroll = true
            else
                TriggerClientEvent("chatMessage", source, "^1^*[WARNING] ^7There is no coming back from this! If you wish to continue do /troll y")
            end
        elseif globalTroll == false then
            TriggerClientEvent("Fax:ToggleTheTrolling", -1, false)
            globalTroll = false
        end
    else
        TriggerClientEvent("chatMessage", source, "^1^*NO PERMISSIONS FOOL!")
    end
end)

RegisterServerEvent("Fax:CheckRageStatus")
AddEventHandler("Fax:CheckRageStatus", function()
    if globalTroll then
        TriggerClientEvent("Fax:ToggleTheTrolling", -1, true)
    end
end)

RegisterServerEvent('Fax:KickNoob')
AddEventHandler('Fax:KickNoob', function()
	DropPlayer(source, "Trying to leave? Get with da' memes 🤣")
end)