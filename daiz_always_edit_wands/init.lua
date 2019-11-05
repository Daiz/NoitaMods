ModLuaFileAppend("data/scripts/perks/perk_list.lua",
                 "mods/daiz_always_edit_wands/files/perkpoolremove.lua")

dofile("data/scripts/perks/perk.lua")

local perks = {"EDIT_WANDS_EVERYWHERE"}

function OnPlayerSpawned(player_entity)
    local init_check_flag = "always_edit_wands_init_done"
    if GameHasFlagRun(init_check_flag) then return end
    GameAddFlagRun(init_check_flag)

    for i, perk_name in ipairs(perks) do
        local perk_entity = perk_spawn(0, 0, perk_name)
        if perk_entity ~= nil then
            perk_pickup(perk_entity, player_entity, EntityGetName(perk_entity),
                        false, false)
        end
    end

end
