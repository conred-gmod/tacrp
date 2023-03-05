function SWEP:Think()
    local owner = self:GetOwner()

    -- if owner:KeyReleased(IN_ATTACK) then
    --     if !self:GetValue("RunawayBurst") then
    --         self:SetBurstCount(0)
    --     end
    --     if self:GetCurrentFiremode() < 0 and !self:GetValue("RunawayBurst") and self:GetBurstCount() > 0 then
    --         self:SetNextPrimaryFire(CurTime() + self:GetValue("PostBurstDelay"))
    --     end
    -- end

    -- if self:GetValue("RunawayBurst") then
    --     if self:GetBurstCount() > -self:GetCurrentFiremode() then
    --         self:SetBurstCount(0)
    --         self:SetNextPrimaryFire(CurTime() + self:GetValue("PostBurstDelay"))
    --     elseif self:GetBurstCount() > 0 then
    --         self:PrimaryAttack()
    --     end
    -- end


    if self:GetValue("RunawayBurst") then
        if self:GetBurstCount() >= -self:GetCurrentFiremode() and -self:GetCurrentFiremode() > 0 then
            self:SetBurstCount(0)
            self:SetNextPrimaryFire(CurTime() + self:GetValue("PostBurstDelay"))
        elseif self:GetBurstCount() > 0 and self:GetBurstCount() < -self:GetCurrentFiremode() then
            self:PrimaryAttack()
        end
    elseif owner:KeyReleased(IN_ATTACK) then
        if self:GetCurrentFiremode() < 0 and self:GetBurstCount() > 1 then
            self:SetNextPrimaryFire(CurTime() + self:GetValue("PostBurstDelay"))
        end
        self:SetBurstCount(0)
    end

    self:ThinkRecoil()

    self:ThinkSprint()

    self:ThinkGrenade()

    self:ThinkReload()

    self:ThinkSights()

    self:ThinkFreeAim()

    self:ThinkBlindFire()

    self:ProcessTimers()

    if IsValid(self:GetOwner()) and self:GetOwner():IsPlayer() and self:GetValue("TacticalThink") and self:GetTactical() then
        self:GetValue("TacticalThink")(self)
    end

    -- if IsValid(self:GetOwner()) and self:GetTactical() and self:GetValue("Minimap") and (SERVER and !game.SinglePlayer()) and (self.NextRadarBeep or 0) < CurTime() then
    --     self.NextRadarBeep = CurTime() + 1.5
    --     local f = RecipientFilter()
    --     f:AddPVS(self:GetPos())
    --     f:RemovePlayer(self:GetOwner())
    --     local s = CreateSound(self, "plats/elevbell1.wav", f)
    --     s:SetSoundLevel(75)
    --     s:PlayEx(0.25, 105)
    -- end

    if self:GetNextIdle() < CurTime() then
        self:Idle()
    end

    if CLIENT then
        if !self.LoadedPreset then
            self.LoadedPreset = true

            if GetConVar("TacRP_autosave"):GetBool() then
                self:LoadPreset()
                self:DoDeployAnimation()
            end
        end
    end
end