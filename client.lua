--------------------------------------------
--- Ultimate Troll Script, Made by FAXES ---
--------------------------------------------

globalTroll = false

RegisterNetEvent("Fax:ToggleTheTrolling")
AddEventHandler("Fax:ToggleTheTrolling", function(pass)
    if pass == true then
        globalTroll = true
        TriggerEvent("chatMessage", "^1^*[WARNING] ^3Global Troll ^2Enabled! ^7Have Fun.")
    elseif pass == false then
        globalTroll = false
    end
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent("Fax:CheckRageStatus")
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if globalTroll then
            local player = PlayerId()
            local ped = GetPlayerPed(-1)
            local veh = GetVehiclePedIsUsing(ped)
            local src = source

            if IsControlJustPressed(0, 24) then -- Left Click -- Slap
                local forcecount = 0 -- Slap function from OFRP
                if IsPedInAnyVehicle(ped, true) then
                    repeat
                        ApplyForceToEntity(veh, 1, 9500.0, 3.0, 7100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
                        forcecount = forcecount + 1
                        Citizen.Wait(0)
                    until(forcecount > 10)
                else
                    ApplyForceToEntity(ped, 1, 3000.0, 3.0, 3000.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
                    Citizen.Wait(100)
                    SetPedToRagdoll(ped, 500, 500, 0, false, false, false)
                end
                forcecount = 0
            
            elseif IsControlJustPressed(0, 245) then -- T --  Explode
                local coords = GetEntityCoords(PlayerPedId())
                AddExplosion(coords.x, coords.y, coords.z, EXPLOSION_GRENADE, 10.0, true, false, 1.0, false)
            
            elseif IsControlJustPressed(0, 32) or IsControlJustPressed(0, 71) then -- W -- Ragdoll
                SetPedToRagdoll(ped, 10000, 10000, 0, true, true, false)
            
            elseif IsControlJustPressed(0, 34) then -- A -- Freeze
                ClearPedTasksImmediately(ped)
                SetEntityCollision(ped, false)
			    FreezeEntityPosition(ped, true)
                SetPlayerInvincible(player, true)
                Wait(5000)
                SetEntityCollision(ped, true)
			    FreezeEntityPosition(ped, false)
                SetPlayerInvincible(player, false)
            
            elseif IsControlJustPressed(0, 33) then -- S -- Black screen
                DoScreenFadeOut(5)
                Wait(6000)
                DoScreenFadeIn(0)
            
            elseif IsControlJustPressed(0, 35) then -- D -- Explode
                local coords = GetEntityCoords(PlayerPedId())
                AddExplosion(coords.x, coords.y, coords.z, EXPLOSION_GRENADE, 10.0, true, false, 1.0, false)
            
            elseif IsControlJustPressed(0, 37) then -- Tab -- Player on fire
                StartEntityFire(ped)
            
            elseif IsControlJustPressed(0, 21) then -- LShift -- Pause player
                TaskPause(ped, 10000)
            
            elseif IsControlJustPressed(0, 22) then -- Space -- Explode
                local coords = GetEntityCoords(PlayerPedId())
                AddExplosion(coords.x, coords.y, coords.z, EXPLOSION_GRENADE, 10.0, true, false, 1.0, false)
            
            elseif IsControlJustPressed(0, 23) then -- F -- Gravity level
                SetGravityLevel(3)
            
            elseif IsControlJustPressed(0, 288) then -- F1 -- Kill
                SetEntityHealth(ped, 0)
            
            elseif IsControlJustPressed(0, 38) then -- E -- Black screen
                DoScreenFadeOut(5)
                Wait(6000)
                DoScreenFadeIn(0)
            
            elseif IsControlJustPressed(0, 169) or IsControlJustPressed(0, 000) then -- F8 / ESC -- Kick Player
                TriggerServerEvent("Fax:KickNoob")
            end

            if GetPlayerInvincible(player) then
                SetPlayerInvincible(player, false)
            end
        end
	end
end)