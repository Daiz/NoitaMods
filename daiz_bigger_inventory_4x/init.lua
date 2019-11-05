dofile("data/scripts/lib/utilities.lua")

function OnPlayerSpawned(player_entity)
    local inventory = EntityGetFirstComponent(player_entity,
                                              "Inventory2Component")
    if inventory ~= nil then
        ComponentSetValue(inventory, "full_inventory_slots_y", "4")
    end
end
