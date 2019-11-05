ModLuaFileAppend("data/scripts/perks/perk_list.lua",
                 "mods/daiz_better_vampirism/files/chug.lua")
--[[
ModLuaFileAppend("data/scripts/magic/alchemy.lua",
                 "mods/daiz_better_vampirism/shotgun/chug.lua")
^ only reports when drinking blood in world rather than from flask
]] -- 

--[[
TODO:
give HP for drinking flask with blood directly from inventory
full flask of blood (1000 material) gives 20HP (over ~5sec)
]] --

dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/perks/perk.lua")

local perks = {"VAMPIRISM", "GLOBAL_GORE"}
local blood_potion = "mods/better_vampirism/files/potion_blood.xml"
local DEBUG = false

function OnPlayerSpawned(player_entity)
    if DEBUG then
        -- start with perks and blood potions for testing
        local init_check_flag = "better_vampirism_init_done"
        if GameHasFlagRun(init_check_flag) then return end
        GameAddFlagRun(init_check_flag)

        for i, perk_name in ipairs(perks) do
            local perk_entity = perk_spawn(0, 0, perk_name)
            if perk_entity ~= nil then
                perk_pickup(perk_entity, player_entity,
                            EntityGetName(perk_entity), false, false)
            end
        end

        -- add 3 blood potions
        local entities = EntityGetAllChildren(player_entity)
        local inventory = nil
        if entities ~= nil then
            for i, entity in ipairs(entities) do
                local name = EntityGetName(entity)
                if name == "inventory_quick" then
                    inventory = entity
                end
            end
        end

        if inventory ~= nil then
            local potion1 = EntityLoad(blood_potion)
            EntityAddChild(inventory, potion1)
            local potion2 = EntityLoad(blood_potion)
            EntityAddChild(inventory, potion2)
            local potion3 = EntityLoad(blood_potion)
            EntityAddChild(inventory, potion3)
        end
    end

end
