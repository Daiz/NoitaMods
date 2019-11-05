function OnPlayerSpawned(player_entity)
    local init_check_flag = "increased_starting_hp_init_done"
    if GameHasFlagRun(init_check_flag) then return end
    GameAddFlagRun(init_check_flag)

    local HP = 1 / 25
    local starting_hp = 200

    local damagemodel = EntityGetFirstComponent(player_entity,
                                                "DamageModelComponent")
    if damagemodel ~= nil then
        ComponentSetValue(damagemodel, "hp", starting_hp * HP)
        ComponentSetValue(damagemodel, "max_hp", starting_hp * HP)
    end
end
