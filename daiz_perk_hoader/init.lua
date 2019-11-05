ModLuaFileAppend("data/scripts/perks/perk_list.lua",
                 "mods/daiz_perk_hoarder/files/perkpoolremove.lua")

dofile("data/scripts/perks/perk.lua")

local perks = {"PERKS_LOTTERY"}

function OnPlayerSpawned(player_entity)
    local init_check_flag = "perk_hoarder_init_done"
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
function OnWorldInitialized()
    local init_check_flag = "perk_hoarder_perk_increase_init_done"
    if GameHasFlagRun(init_check_flag) then return end
    GameAddFlagRun(init_check_flag)

    local perk_count = tonumber(GlobalsGetValue("TEMPLE_PERK_COUNT", "3"))
    GlobalsSetValue("TEMPLE_PERK_COUNT", to_string(perk_count + 1))
end
