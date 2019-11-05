-- currently there doesn't seem to be a way to react to drinking flask from inventory
g_ingest_materials["blood"] = {
    func = function(entity_id, count)
        if IsPlayer(entity_id) then GamePrint("player ingesting blood!") end
    end
}
