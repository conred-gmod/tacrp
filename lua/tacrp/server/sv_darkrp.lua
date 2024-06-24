if !DarkRP then return end

util.AddNetworkString("tacrp_spawnedwepatts")

hook.Add("onDarkRPWeaponDropped", "TacRP", function(ply, ent, wep)
    ent:SetCollisionGroup(COLLISION_GROUP_WEAPON)
    if wep.ArcticTacRP and wep.Attachments then
        local atts = {}
        for k, v in pairs(wep.Attachments or {}) do
            atts[k] = v.Installed and (TacRP.Attachments[v.Installed] or {}).ID
        end
        if table.Count(atts) > 0 then
            net.Start("tacrp_spawnedwepatts")
                net.WriteUInt(ent:EntIndex(), 12) -- ent won't exist on client when message arrives
                net.WriteUInt(table.Count(atts), 4)
                for k, v in pairs(atts) do
                    net.WriteUInt(k, 4)
                    net.WriteUInt(v, TacRP.Attachments_Bits)
                end
            net.Broadcast()
            ent.Attachments = atts
        end
    end
end)

hook.Add("PlayerPickupDarkRPWeapon", "TacRP", function(ply, ent, wep)
    if wep.ArcticTacRP and wep.Attachments then
        -- DarkRP will remove wep (created with ents.Create?) so we must make one ourselves here too
        if ply:HasWeapon(wep:GetClass()) or ply:KeyDown(IN_WALK) then
            ply:PickupObject(ent)
            return true
        end -- block duplicate pickups

        local class = wep:GetClass()
        wep:Remove()
        wep = ply:Give(class, true)
        wep.GaveDefaultAmmo = true -- did DefaultClip kill your father or something, arctic?

        if ent.Attachments then
        for k, v in pairs(ent.Attachments) do
            wep.Attachments[k].Installed = TacRP.Attachments_Index[v]
        end
        wep:NetworkWeapon()
        end

        ent.Attachments = nil -- Don't duplicate attachments

        hook.Call("playerPickedUpWeapon", nil, ply, ent, wep)
        ent:GivePlayerAmmo(ply, wep, false)
        ent:DecreaseAmount()

        return true
    end
end)

local function hack()
    local spawned_weapon = (scripted_ents.GetStored("spawned_weapon") or {}).t
    if spawned_weapon and not spawned_weapon.TacRP_Hack then
        spawned_weapon.TacRP_Hack = true -- don't make this change multiple times!
        local old = spawned_weapon.StartTouch

        function spawned_weapon:StartTouch(ent)
            if ent.Attachments then return end
            old(self, ent)
        end
    end
end
hook.Add("InitPostEntity", "TacRP_SpawnedWeaponHack", hack)
hack()

hook.Add("PlayerLoadout", "TacRP_PoliceBiocode", function(ply)
    if !TacRP.ConVars["rp_biocode_cp"]:GetBool() or !ply:isCP() then return end
    timer.Simple(0.001, function()
        if !IsValid(ply) then return end
        local jobTable = ply:getJobTable()
        for _, v in pairs(jobTable.weapons or {}) do
            local wep = ply:GetWeapon(v)
            if IsValid(wep) then
                wep:SetNWBool("TacRP_PoliceBiocode", true)
            end
        end
    end)
end)

hook.Add("TacRP_Hook_PreShoot", "TacRP_PoliceBiocode", function(wep)
    local ply = wep:GetOwner()
    if !TacRP.ConVars["rp_biocode_cp"]:GetBool() or !ply:IsPlayer() or ply:isCP() then return end
    if wep:GetNWBool("TacRP_PoliceBiocode") then
        return true
    end
end)