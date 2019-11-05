local entity_id = GetUpdatedEntityID()
local orb = EntityGetFirstComponent(entity_id, "OrbComponent")
local orb_id = ComponentGetValueInt(orb, "orb_id")
if orb_id < 100 and GameGetOrbCollectedAllTime(orb_id) then
    EntityKill(entity_id)
end