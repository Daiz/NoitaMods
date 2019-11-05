ModLuaFileAppend("data/scripts/items/orb_init.lua",
                 "mods/daiz_permanent_familiar_orbs/files/removeorb.lua")

function OnPlayerSpawned(player_entity)
    local init_check_flag = "permanent_familiar_orbs_init_done"
    if GameHasFlagRun(init_check_flag) then return end
    GameAddFlagRun(init_check_flag)

    local HP = 1 / 25
    local starting_hp = 100

    local damagemodel = EntityGetFirstComponent(player_entity,
                                                "DamageModelComponent")

    local player_x, player_y = EntityGetTransform(player_entity)
    if damagemodel ~= nil then

        starting_hp = ComponentGetValueFloat(damagemodel, "max_hp") / HP

        for orb_id = 0, 10 do
            ----[[
            if GameGetOrbCollectedAllTime(orb_id) then
                starting_hp = starting_hp + 25
                local orb_name = "0" .. orb_id
                if orb_id == 10 then orb_name = tostring(orb_id) end
                ----[[
                local orb = EntityLoad(
                                "mods/daiz_permanent_familiar_orbs/files/entities/orb.xml")
                if orb then
                    comp = EntityGetFirstComponent(orb, "OrbComponent")
                    ComponentSetValue(comp, "orb_id", orb_id)
                    EntitySetTransform(orb, player_x, player_y)
                end
                -- ]]--
            end
            -- ]]--

        end

        ComponentSetValue(damagemodel, "hp", starting_hp * HP)
        ComponentSetValue(damagemodel, "max_hp", starting_hp * HP)
    end

end
