function SWEP:Reload(force)
    force = force or false

    if self:GetOwner():IsNPC() then
        self:NPC_Reload()
        return
    end

    if self:GetValue("Firemodes") and self:GetOwner():KeyDown(IN_USE) and self:GetOwner():KeyPressed(IN_RELOAD) and self:GetFiremodeAmount() > 1 and !self:GetSafe() then
        self:SwitchFiremode()
        self:EmitSound("tacrp/weapons/pdw/fire_select-1.wav", 75, 100, 1, CHAN_ITEM)
        return
    end

    local stop = self:RunHook("Hook_PreReload")
    if stop then return end

    if !self:GetOwner():KeyPressed(IN_RELOAD) and !force then
        return
    end

    if self:StillWaiting(true) then return end

    if self:GetJammed() then
        local t = self:PlayAnimation("jam", 0.75, true, true)
        self:GetOwner():DoCustomAnimEvent(PLAYERANIMEVENT_CANCEL_RELOAD, t * 1000)
        self:SetJammed(false)
        self:SetCharge(false)
        return
    end

    if !self:CanReloadInSprint() and self:GetIsSprinting() then return end
    if self:GetCapacity() <= 0 then return end
    if self:Clip1() >= self:GetCapacity() then return end
    if self:Ammo1() <= 0 and !self:GetInfiniteAmmo() then return end

    self:ToggleBlindFire(TacRP.BLINDFIRE_NONE)

    local mult = self:GetValue("ReloadTimeMult") / TacRP.ConVars["mult_reloadspeed"]:GetFloat()

    local anim = "reload"

    if self:GetValue("ShotgunReload") then
        anim = "reload_start"
    else
        self:SetTimer(self:GetValue("LoadInTime") * mult, function()
            self:SetLoadedRounds(math.min(self:GetCapacity(), self:Clip1() + self:Ammo1()))
            self:DoBulletBodygroups()
        end, "SetLoadedRounds")
        if self.ReloadUpInTime then
            self:SetTimer(self.ReloadUpInTime * mult, function()
                self:RestoreClip(self:GetCapacity())
                self:SetNthShot(0)
                self:SetEndReload(true)
            end, "ReloadUpIn")
        end
    end

    local t = self:PlayAnimation(anim, mult, true, true)
    if not t then return end

    self:GetOwner():DoCustomAnimEvent(PLAYERANIMEVENT_RELOAD, t * 1000)

    if SERVER then
        self:SetTimer(self.DropMagazineTime * mult, function()
            self:DropMagazine()
        end, "DropMagazine")
    end

    self:SetLoadedRounds(self:Clip1())

    self:SetReloading(true)
    self:SetEndReload(false)

    self:SetEmptyReload(self:GetValue("ShotgunNoReverseStart") or self:Clip1() == 0)

    self:DoBulletBodygroups()

    self:RunHook("Hook_StartReload")

    self:SetReloadFinishTime(CurTime() + (t * 0.95))
end

function SWEP:DropMagazine()
    -- if !IsFirstTimePredicted() and !game.SinglePlayer() then return end
    if self:GetValue("DropMagazineModel") and TacRP.ConVars["dropmagazinemodel"]:GetBool() then
        local dropamt = math.floor(self:Clip1() / self:GetValue("DropMagazineAmount"))
        local clip1 = self:Clip1()
        for i = 1, self:GetValue("DropMagazineAmount") do
            local mag = ents.Create("TacRP_droppedmag")

            if IsValid(mag) then
                local bone = "ValveBiped.Bip01_R_Hand"
                if i == 2 then bone = "ValveBiped.Bip01_L_Hand" end
                local matrix = self:GetOwner():GetBoneMatrix(self:GetOwner():LookupBone(bone) or -1)
                local pos, ang
                if matrix then
                    pos = matrix:GetTranslation()
                    ang = matrix:GetAngles()
                else
                    pos = self:GetOwner():EyePos() - (self:GetOwner():EyeAngles():Up() * 8)
                    ang = self:GetOwner():EyeAngles()
                end

                mag:SetPos(pos)
                mag:SetAngles(ang)
                mag.Model = self:GetValue("DropMagazineModel")
                mag.ImpactType = self:GetValue("DropMagazineImpact")
                mag:SetOwner(self:GetOwner())
                if clip1 > 0 and TacRP.ConVars["reload_dump"]:GetBool() and self:GetOwner():IsRP() then
                    local amt = (i == self:GetValue("DropMagazineAmount") and clip1) or dropamt
                    clip1 = clip1 - amt

                    if !self:GetInfiniteAmmo() then
                        mag.AmmoType = self:GetAmmoType()
                        mag.AmmoCount = amt
                    end
                end
                mag:Spawn()

                local phys = mag:GetPhysicsObject()

                if IsValid(phys) then
                    phys:AddAngleVelocity(Vector(math.Rand(-300, 300), math.Rand(-300, 300), math.Rand(-300, 300)))
                end
            end
        end
        self:SetClip1(clip1)
    end
end

function SWEP:RestoreClip(amt)
    local reserve = self:GetInfiniteAmmo() and math.huge or (self:Clip1() + self:Ammo1())

    local lastclip1 = self:Clip1()

    self:SetClip1(math.min(math.min(self:Clip1() + amt, self:GetCapacity()), reserve))

    if !self:GetInfiniteAmmo() then
        reserve = reserve - self:Clip1()
        self:GetOwner():SetAmmo(reserve, self.Primary.Ammo)
    end

    return self:Clip1() - lastclip1
end

function SWEP:Unload(ammotype)
    self:GetOwner():GiveAmmo(self:Clip1(), ammotype or self.Primary.Ammo)
    self:SetClip1(0)
end

function SWEP:EndReload()
    if self:GetValue("ShotgunReload") then
        local mult = self:GetValue("ReloadTimeMult") / TacRP.ConVars["mult_reloadspeed"]:GetFloat()
        if self:Clip1() >= self:GetCapacity() or (!self:GetInfiniteAmmo() and self:Ammo1() == 0) or self:GetEndReload() then

            local cancellable = TacRP.ConVars["reload_sg_cancel"]:GetBool() and !self:GetValue("ShotgunFullCancel")
            local t = 1
            if !self.ShotgunNoReverseStart and (self:Clip1() == self:GetLoadedRounds() or !self:GetEmptyReload()) then
                t = self:PlayAnimation("reload_start", -0.75 * mult, !cancellable, true)
            else
                t = self:PlayAnimation("reload_finish", mult, !cancellable, true)
            end
            self:GetOwner():DoCustomAnimEvent(PLAYERANIMEVENT_RELOAD_END, t * 1000)

            self:SetReloading(false)

            self:SetNthShot(0)

            self:DoBulletBodygroups()

            self:RunHook("Hook_EndReload")
        else
            local t = self:PlayAnimation("reload", mult, true)

            local res = self:GetValue("ShotgunThreeload") and
                    math.min(math.min(3, self:GetCapacity() - self:Clip1()), self:GetInfiniteAmmo() and math.huge or self:Ammo1())
                    or 1

            local delay = self:GetValue("ShotgunUpInTime")
            for i = 1, res do
                self:SetTimer(t * delay * ((i - 1) / 3) + 0.22, function()
                    self:GetOwner():DoCustomAnimEvent(PLAYERANIMEVENT_RELOAD_LOOP, t * 1000)
                    self:RestoreClip(1)
                    self:RunHook("Hook_InsertReload", res)
                end, "ShotgunRestoreClip")
            end

            self:SetTimer(t * self:GetValue("ShotgunLoadInTime") * (res / 3), function()
                self:SetLoadedRounds(self:GetLoadedRounds() + res)
                self:DoBulletBodygroups()
            end, "SetLoadedRounds")

            self:SetReloadFinishTime(CurTime() + (t * delay * (res / 3)) + 0.05)

            self:DoBulletBodygroups()
        end
    else
        if !self.ReloadUpInTime then
            self:RestoreClip(self:GetCapacity())
            self:SetNthShot(0)
        end
        self:SetReloading(false)
        self:SetEndReload(false)

        self:RunHook("Hook_EndReload")
    end
end

function SWEP:CancelReload(doanims, keeptime)
    if self:GetReloading() then

        self:RunHook("Hook_CancelReload")

        local stop = false

        if doanims then
            if self:GetValue("ShotgunReload") then
                local mult = self:GetValue("ReloadTimeMult") / TacRP.ConVars["mult_reloadspeed"]:GetFloat()
                local t = 1
                if self.CurrentAnimation == "reload_start" and self.ShotgunReloadCompleteStart then
                    self:SetEndReload(true)
                elseif self:Clip1() == self:GetLoadedRounds() and !self.ShotgunNoReverseStart then
                    t = self:PlayAnimation("reload_start", -0.75 * mult, true, true)
                    stop = true
                else
                    t = self:PlayAnimation("reload_finish", mult, true, true)
                    stop = true
                end
                self:GetOwner():DoCustomAnimEvent(PLAYERANIMEVENT_RELOAD_END, t * 1000)
            else
                self:Idle()
                stop = true
            end
        else
            stop = true
        end

        if stop then
            self:KillTimer("SetLoadedRounds")
            self:KillTimer("ShotgunRestoreClip")
            self:KillTimer("ReloadUpIn")
            self:KillTimer("DropMagazine")
            self:SetReloading(false)
            self:SetEndReload(false)
            self:SetNthShot(0)
            self:DoBulletBodygroups()
            if !keeptime then
                self:SetReloadFinishTime(0)
            end
        end
    end
end

function SWEP:ThinkReload()
    if self:GetReloading() and self:GetReloadFinishTime() < CurTime() then
        self:EndReload()
    end
end

local launcher_ammo = {
    ["smg1_grenade"] = true,
    ["rpg_round"] = true,
}
function SWEP:GetInfiniteAmmo()
    local ammo = string.lower(self:GetAmmoType())
    if launcher_ammo[ammo] then
        return TacRP.ConVars["infinitelaunchers"]:GetBool() or self:GetValue("InfiniteAmmo")
    else
        return TacRP.ConVars["infiniteammo"]:GetBool() or self:GetValue("InfiniteAmmo")
    end
end

function SWEP:GetCapacity(base)
    if base then
        return self:GetBaseValue("ClipSize")
    else
        return self:GetValue("ClipSize")
    end
end

function SWEP:GetAmmoType(base)
    local valfunc = base and self.GetBaseValue or self.GetValue
    if self.Ammo_Expanded and TacRP.ConVars["expandedammotypes"]:GetBool() then
        return valfunc(self, "Ammo_Expanded") or valfunc(self, "Ammo")
    else
        return valfunc(self, "Ammo")
    end
end

-- Override to disable auto-reload for one reason or another.
function SWEP:ShouldAutoReload()
    return true
end