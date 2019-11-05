local shotgun = function(entity_perk_item, entity_who_picked, item_name)
    local component = EntityGetFirstComponent(entity_who_picked,
                                              "PlatformShooterPlayerComponent")
    if component ~= nil then
        ComponentSetValue(component, "eating_cells_per_frame", "4")
        ComponentSetValue(component, "eating_probability", "100")
        ComponentSetValue(component, "eating_delay_frames", "5")
    end

end

for i, perk in ipairs(perk_list) do
    if perk.id == "VAMPIRISM" then
        local original = perk_list[i].func
        perk_list[i].func = function(entity_perk_item, entity_who_picked,
                                     item_name)
            original(entity_perk_name, entity_who_picked, item_name)
            shotgun(entity_perk_name, entity_who_picked, item_name)
        end
    end
end
