-- local customizedelta = 0
local bench_need = Color(255, 0, 0)
local bench_have = Color(0, 255, 0)
local flash_end = 0
local range = 0

local body = Material("tacrp/hud/body.png", "mips smooth")

local body_head = Material("tacrp/hud/body_head.png", "mips smooth")
local body_chest = Material("tacrp/hud/body_chest.png", "mips smooth")
local body_stomach = Material("tacrp/hud/body_stomach.png", "mips smooth")
local body_arms = Material("tacrp/hud/body_arms.png", "mips smooth")
local body_legs = Material("tacrp/hud/body_legs.png", "mips smooth")

local stk_clr = {
    [1] = Color(75, 25, 25),
    [2] = Color(40, 20, 20),
    [3] = Color(50, 50, 50),
    [4] = Color(75, 75, 75),
    [5] = Color(100, 100, 100),
    [6] = Color(120, 120, 120),
    [7] = Color(140, 140, 140),
    [8] = Color(160, 160, 160),
    [9] = Color(200, 200, 200),
}
local function bodydamagetext(name, dmg, num, mult, x, y, hover)

    local stk = math.ceil(100 / (dmg * mult))

    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetTextColor(255, 255, 255, 255)
    surface.DrawLine(ScreenScale(2), y, x, y)

    surface.SetFont("TacRP_Myriad_Pro_6")
    surface.SetTextPos(ScreenScale(2), y)
    -- surface.DrawText(name)
    -- surface.SetTextPos(ScreenScale(1), y + ScreenScale(6))
    if hover then
        surface.DrawText(stk .. (num > 1 and " PTK" or " STK"))
    else
        surface.DrawText(math.floor(dmg * mult)) --  .. (num > 1 and ("×" .. num) or "")
    end

    local c = stk_clr[math.Clamp(num > 1 and math.floor(stk / num * 3.5) or stk, 1, 9)]
    surface.SetDrawColor(c, c, c, 255)
end

local lastcustomize = false

SWEP.CustomizeHUD = nil

function SWEP:CreateCustomizeHUD()
    self:RemoveCustomizeHUD()

    gui.EnableScreenClicker(true)

    local bg = vgui.Create("DPanel")

    self.CustomizeHUD = bg

    local scrw = ScrW()
    local scrh = ScrH()

    local airgap = ScreenScale(8)
    local smallgap = ScreenScale(4)

    bg:SetPos(0, 0)
    bg:SetSize(ScrW(), ScrH())
    bg.OnRemove = function(self2)
        if !IsValid(self) then return end
        self:SavePreset()
    end
    bg.Paint = function(self2, w, h)
        if !IsValid(self) or !IsValid(self:GetOwner()) or self:GetOwner():GetActiveWeapon() != self then
            self2:Remove()
            if (self.GrenadeMenuAlpha or 0) != 1 then
                gui.EnableScreenClicker(false)
            end
            return
        end

        local name_txt = self:GetValue("PrintName")

        surface.SetFont("TacRP_Myriad_Pro_32")
        local name_w = surface.GetTextSize(name_txt)

        surface.SetDrawColor(0, 0, 0, 150)
        surface.DrawRect(w - name_w - ScreenScale(20), airgap, name_w + ScreenScale(12), ScreenScale(34))
        TacRP.DrawCorneredBox(w - name_w - ScreenScale(20), airgap, name_w + ScreenScale(12), ScreenScale(34))

        surface.SetTextPos(w - name_w - ScreenScale(14), airgap)
        surface.SetTextColor(255, 255, 255)
        surface.DrawText(name_txt)

        surface.SetFont("TacRP_Myriad_Pro_12")

        if self.Ammo != "" then
            local ammo_txt = language.GetPhrase(string.lower(self.Ammo) .. "_ammo")
            local ammo_w = surface.GetTextSize(ammo_txt)

            surface.SetDrawColor(0, 0, 0, 150)
            surface.DrawRect(w - name_w - ammo_w - ScreenScale(32) - smallgap, airgap + ScreenScale(20), ammo_w + ScreenScale(12), ScreenScale(14))
            TacRP.DrawCorneredBox(w - name_w - ammo_w - ScreenScale(32) - smallgap, airgap + ScreenScale(20), ammo_w + ScreenScale(12), ScreenScale(14))

            surface.SetTextPos(w - name_w - ammo_w - ScreenScale(30), airgap + ScreenScale(21))
            surface.SetTextColor(255, 255, 255)
            surface.DrawText(ammo_txt)
        end

        if self.SubCatTier and self.SubCatType then
            local type_txt = string.sub(self.SubCatType, 2)
            if !GetConVar("tacrp_arcade"):GetBool() then
                type_txt = string.sub(self.SubCatTier, 2) .. " " .. type_txt
            end
            surface.SetFont("TacRP_Myriad_Pro_12")
            local type_w = surface.GetTextSize(type_txt)

            surface.SetDrawColor(0, 0, 0, 150)
            surface.DrawRect(w - name_w - type_w - ScreenScale(32) - smallgap, airgap, type_w + ScreenScale(12), ScreenScale(18))
            TacRP.DrawCorneredBox(w - name_w - type_w - ScreenScale(32) - smallgap, airgap, type_w + ScreenScale(12), ScreenScale(18))

            surface.SetTextPos(w - name_w - type_w - ScreenScale(30), airgap + ScreenScale(3))
            surface.SetTextColor(255, 255, 255)
            surface.DrawText(type_txt)
        end

    end

    local stack = airgap + ScreenScale(34)

    if !self:GetValue("NoRanger") then
        local ranger = vgui.Create("DPanel", bg)
        ranger:SetPos(scrw - ScreenScale(128) - airgap, stack + smallgap)
        ranger:SetSize(ScreenScale(128), ScreenScale(64))
        ranger.Paint = function(self2, w, h)
            if !IsValid(self) then return end

            surface.SetDrawColor(0, 0, 0, 150)
            surface.DrawRect(0, 0, w, h)
            TacRP.DrawCorneredBox(0, 0, w, h)

            local dmg_max = self:GetValue("Damage_Max")
            local dmg_min = self:GetValue("Damage_Min")

            local range_min, range_max = self:GetMinMaxRange()

            surface.SetDrawColor(255, 255, 255, 50)

            local range_1_y = 2 * (h / 5)
            local range_2_y = 4 * (h / 5)

            local range_1_x = 0
            local range_2_x = (w / 3)
            local range_3_x = 2 * (w / 3)

            if dmg_max < dmg_min then
                range_1_y = 4 * (h / 5)
                range_2_y = 2 * (h / 5)
            elseif dmg_max == dmg_min then
                range_1_y = 3 * (h / 5)
                range_2_y = 3 * (h / 5)
            end

            if range_min == 0 then
                range_2_x = 0
                range_3_x = w / 2
            end

            surface.DrawLine(range_2_x, 0, range_2_x, h)
            surface.DrawLine(range_3_x, 0, range_3_x, h)

            surface.SetDrawColor(255, 255, 255)

            for i = 0, 1 do
                surface.DrawLine(range_1_x, range_1_y + i, range_2_x, range_1_y + i)
                surface.DrawLine(range_2_x, range_1_y + i, range_3_x, range_2_y + i)
                surface.DrawLine(range_3_x, range_2_y + i, w, range_2_y + i)
            end

            local mouse_x, mouse_y = input.GetCursorPos()
            mouse_x, mouse_y = self2:ScreenToLocal(mouse_x, mouse_y)

            local draw_rangetext = true

            if mouse_x > 0 and mouse_x < w and mouse_y > 0 and mouse_y < h then

                local range_m_x = 0

                if mouse_x < range_2_x then
                    range = range_min
                    range_m_x = range_2_x
                elseif mouse_x > range_3_x then
                    range = range_max
                    range_m_x = range_3_x
                else
                    local d = (mouse_x - range_2_x) / (range_3_x - range_2_x)
                    range = Lerp(d, range_min, range_max)
                    range_m_x = mouse_x
                end

                local dmg = self:GetDamageAtRange(range)

                local txt_dmg1 = tostring(math.Round(dmg)) .. " DMG"

                if self:GetValue("Num") > 1 then
                    txt_dmg1 = math.Round(dmg * self:GetValue("Num")) .. "-" .. txt_dmg1
                end

                surface.SetDrawColor(255, 255, 255, 255)
                surface.DrawLine(range_m_x, 0, range_m_x, h)

                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(255, 255, 255)
                local txt_dmg1_w = surface.GetTextSize(txt_dmg1)
                surface.SetTextPos((w / 3) - txt_dmg1_w - (ScreenScale(2)), ScreenScale(1))
                surface.DrawText(txt_dmg1)

                local txt_range1 = self:RangeUnitize(range)

                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(255, 255, 255)
                local txt_range1_w = surface.GetTextSize(txt_range1)
                surface.SetTextPos((w / 3) - txt_range1_w - (ScreenScale(2)), ScreenScale(1 + 8))
                surface.DrawText(txt_range1)

                draw_rangetext = false
            end


            if draw_rangetext then
                local txt_dmg1 = tostring(math.Round(dmg_max)) .. " DMG"

                if self:GetValue("Num") > 1 then
                    txt_dmg1 = math.Round(dmg_max * self:GetValue("Num")) .. "-" .. txt_dmg1
                end

                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(255, 255, 255)
                local txt_dmg1_w = surface.GetTextSize(txt_dmg1)
                surface.SetTextPos((w / 3) - txt_dmg1_w - (ScreenScale(2)), ScreenScale(1))
                surface.DrawText(txt_dmg1)

                local txt_range1 = self:RangeUnitize(range_min)

                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(255, 255, 255)
                local txt_range1_w = surface.GetTextSize(txt_range1)
                surface.SetTextPos((w / 3) - txt_range1_w - (ScreenScale(2)), ScreenScale(1 + 8))
                surface.DrawText(txt_range1)

                local txt_dmg2 = tostring(math.Round(dmg_min)) .. " DMG"

                if self:GetValue("Num") > 1 then
                    txt_dmg2 = math.Round(dmg_min * self:GetValue("Num")) .. "-" .. txt_dmg2
                end

                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(255, 255, 255)
                surface.SetTextPos(2 * (w / 3) + (ScreenScale(2)), ScreenScale(1))
                surface.DrawText(txt_dmg2)

                local txt_range2 = self:RangeUnitize(range_max)

                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(255, 255, 255)
                surface.SetTextPos(2 * (w / 3) + (ScreenScale(2)), ScreenScale(1 + 8))
                surface.DrawText(txt_range2)
            end
        end

        local bodychart = vgui.Create("DPanel", bg)
        bodychart:SetPos(scrw - ScreenScale(128 + 44) - airgap, stack + smallgap)
        bodychart:SetSize(ScreenScale(40), ScreenScale(64))
        bodychart:SetZPos(100)
        bodychart.Paint = function(self2, w, h)
            if !IsValid(self) then return end

            surface.SetDrawColor(0, 0, 0, 150)
            surface.DrawRect(0, 0, w, h)
            TacRP.DrawCorneredBox(0, 0, w, h)

            local h2 = h - ScreenScale(4)
            local w2 = math.ceil(h2 * (136 / 370))
            local x2, y2 = w - w2 - ScreenScale(2), ScreenScale(2)
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(body)
            surface.DrawTexturedRect(x2, y2, w2, h2)

            local dmg = self:GetDamageAtRange(range)
            local num =  self:GetValue("Num")
            local mult = self:GetBodyDamageMultipliers() --self:GetValue("BodyDamageMultipliers")
            local hover = self2:IsHovered()

            local upperbody = mult[HITGROUP_STOMACH] == mult[HITGROUP_CHEST]

            bodydamagetext("Head", dmg, num, mult[HITGROUP_HEAD], w - ScreenScale(16), upperbody and ScreenScale(6) or ScreenScale(4), hover)
            surface.SetMaterial(body_head)
            surface.DrawTexturedRect(x2, y2, w2, h2)

            bodydamagetext("Chest", dmg, num, mult[HITGROUP_CHEST], w - ScreenScale(16), upperbody and ScreenScale(18) or ScreenScale(14), hover)
            surface.SetMaterial(body_chest)
            surface.DrawTexturedRect(x2, y2, w2, h2)

            if !upperbody then
                bodydamagetext("Stomach", dmg, num, mult[HITGROUP_STOMACH], w - ScreenScale(16), ScreenScale(24), hover)
            end
            surface.SetMaterial(body_stomach)
            surface.DrawTexturedRect(x2, y2, w2, h2)

            bodydamagetext("Arms", dmg, num, mult[HITGROUP_LEFTARM], w - ScreenScale(22), upperbody and ScreenScale(30) or ScreenScale(34), hover)
            surface.SetMaterial(body_arms)
            surface.DrawTexturedRect(x2, y2, w2, h2)

            bodydamagetext("Legs", dmg, num, mult[HITGROUP_LEFTLEG], w - ScreenScale(18), upperbody and ScreenScale(42) or ScreenScale(44), hover)
            surface.SetMaterial(body_legs)
            surface.DrawTexturedRect(x2, y2, w2, h2)

            surface.SetDrawColor(0, 0, 0, 50)

            surface.SetFont("TacRP_Myriad_Pro_8")
            local txt = self:RangeUnitize(range)
            --local tw, th = surface.GetTextSize(txt)
            --surface.DrawRect(ScreenScale(1), h - ScreenScale(10), tw + ScreenScale(1), th)
            surface.SetTextPos(ScreenScale(2) + 2, h - ScreenScale(10) + 2)
            surface.SetTextColor(0, 0, 0, 150)
            surface.DrawText(txt)
            surface.SetTextColor(255, 255, 255, 255)
            surface.SetTextPos(ScreenScale(2), h - ScreenScale(10))
            surface.DrawText(txt)
            if num > 1 then
                local txt2 = "×" .. math.floor(num)
                local tw2 = surface.GetTextSize(txt2)
                --surface.DrawRect(w - tw2 - ScreenScale(2), h - ScreenScale(10), tw2 + ScreenScale(1), th2)

                surface.SetTextPos(w - tw2 - ScreenScale(2) + 2, h - ScreenScale(10) + 2)
                surface.SetTextColor(0, 0, 0, 150)
                surface.DrawText(txt2)
                surface.SetTextColor(255, 255, 255, 255)
                surface.SetTextPos(w - tw2 - ScreenScale(2), h - ScreenScale(10))
                surface.DrawText(txt2)
            end
        end

        stack = stack + ScreenScale(64) + smallgap
    end

    if self:GetValue("PrimaryGrenade") then
        local desc_box = vgui.Create("DPanel", bg)
        desc_box:SetSize(ScreenScale(172), ScreenScale(108))
        desc_box:SetPos(scrw - ScreenScale(172) - airgap, stack + smallgap)
        stack = stack + ScreenScale(48) + smallgap
        desc_box.Paint = function(self2, w, h)
            if !IsValid(self) then return end

            surface.SetDrawColor(0, 0, 0, 150)
            surface.DrawRect(0, 0, w, h)
            TacRP.DrawCorneredBox(0, 0, w, h)

            local nade = TacRP.QuickNades[self:GetValue("PrimaryGrenade")]

            surface.SetFont("TacRP_Myriad_Pro_8")
            surface.SetTextPos(ScreenScale(6), ScreenScale(4))
            surface.DrawText("FUSE:")

            surface.SetFont("TacRP_Myriad_Pro_8")
            surface.SetTextPos(ScreenScale(4), ScreenScale(12))
            surface.DrawText(nade.DetType or "")

            surface.SetFont("TacRP_Myriad_Pro_8")
            surface.SetTextColor(255, 255, 255)
            surface.SetTextPos(ScreenScale(6), ScreenScale(24))
            surface.DrawText("DESCRIPTION:")

            if !self.MiscCache["cust_desc"] then
                self.MiscCache["cust_desc"] = TacRP.MultiLineText(nade.Description, w - ScreenScale(8), "TacRP_Myriad_Pro_8")
            end

            for i, k in ipairs(self.MiscCache["cust_desc"]) do
                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(255, 255, 255)
                surface.SetTextPos(ScreenScale(4), ScreenScale(32) + (ScreenScale(8 * (i - 1))))
                surface.DrawText(k)
            end
        end
    else
        local desc_box = vgui.Create("DPanel", bg)
        desc_box:SetSize(ScreenScale(172), ScreenScale(48))
        desc_box:SetPos(scrw - ScreenScale(172) - airgap, stack + smallgap)
        stack = stack + ScreenScale(48) + smallgap
        desc_box.Paint = function(self2, w, h)
            if !IsValid(self) then return end

            surface.SetDrawColor(0, 0, 0, 150)
            surface.DrawRect(0, 0, w, h)
            TacRP.DrawCorneredBox(0, 0, w, h)

            surface.SetFont("TacRP_Myriad_Pro_8")
            surface.SetTextColor(255, 255, 255)
            surface.SetTextPos(ScreenScale(6), ScreenScale(4))
            surface.DrawText("DESCRIPTION:")

            if !self.MiscCache["cust_desc"] then
                self.MiscCache["cust_desc"] = TacRP.MultiLineText(self:GetValue("Description"), w - ScreenScale(8), "TacRP_Myriad_Pro_8")
            end

            for i, k in pairs(self.MiscCache["cust_desc"]) do
                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(255, 255, 255)
                surface.SetTextPos(ScreenScale(4), ScreenScale(4 + 8 + 1) + (ScreenScale(8 * (i - 1))))
                surface.DrawText(k)
            end
        end
    end



    local stats = {
        -- {
        --     Name = "",
        --     Value = "",
        --     LowerIsBetter = false,
        --     AggregateFunction = nil,
        --     Unit = ""
        -- }
        {
            Name = "Spread",
            Description = "Base accuracy of the weapon.",
            AggregateFunction = function(base, val)
                return math.Round(math.deg(val), 2)
            end,
            Unit = "°",
            Value = "Spread",
            LowerIsBetter = true,
        },
        {
            Name = "RPM",
            Description = "Rate of fire of the weapon.",
            Value = "RPM"
        },
        {
            Name = "Capacity",
            Description = "Amount of ammo this weapon can spend before reloading.",

            Value = "ClipSize",
        },
        {
            Name = "Sprint To Fire",
            Description = "Time required to transition from fully sprinting to being able to fire.",

            Value = "SprintToFireTime",
            Unit = "s",
            LowerIsBetter = true,
        },
        {
            Name = "Aim Down Sights",
            Description = "Time required to transition from hipfiring to aiming.",
            Value = "AimDownSightsTime",
            Unit = "s",
            LowerIsBetter = true,
            ValueCheck = "Scope",
        },
        {
            Name = "Muzzle Velocity",
            Description = "How fast the bullet travels in the world.",
            AggregateFunction = function(base, val)
                return math.Round(self:GetMuzzleVelocity(base), 2)
            end,
            ConVarCheck = "tacrp_physbullet",
            Value = "MuzzleVelocity",
            LowerIsBetter = false,
            Unit = "m/s"
        },
        {
            Name = "Recoil Kick",
            Description = "Strength of \"felt recoil\" that throws off your aim.",
            Value = "RecoilKick",
            LowerIsBetter = true,
        },
        {
            Name = "Recoil Spread",
            Description = {"Inaccuracy per unit of recoil. Larger value means the weapon becomes",
            "inaccurate faster while continuous firing."},
            AggregateFunction = function(base, val)
                return math.Round(math.deg(val), 3)
            end,
            Unit = "°",
            Value = "RecoilSpreadPenalty",
            LowerIsBetter = true,
        },
        {
            Name = "Recoil Recovery",
            Description = {"Rate at which accumulated recoil disspiates, in shots per second.",
            "Larger value means the effects of recoil disappear faster",
            "after the reset time."},
            AggregateFunction = function(base, val)
                return math.Round(val, 2)
                --return math.Round(math.deg(val * (base and self:GetTable().RecoilSpreadPenalty or self:GetValue("RecoilSpreadPenalty"))), 1)
            end,
            Unit = "/s",
            Value = "RecoilDissipationRate",
        },
        {
            Name = "Recoil Reset Time",
            Description = {"Duration of delay before recoil can start to dissipate.",
            "Larger value means you must wait longer between shots to start recovering",
            "from recoil."},
            Value = "RecoilResetTime",
            LowerIsBetter = true,
        },
        {
            Name = "Maximum Recoil",
            Description = "Maximum amount of inaccuracy from continuous firing.",
            Value = "RecoilMaximum",
            LowerIsBetter = true,
            HideIfSame = true,
        },
        {
            Name = "First Shot Recoil",
            Description = {"Recoil multiplier on the first shot, reset after the reset time has passed.",
            "Does not affect recoil kick."},
            Value = "RecoilFirstShotMult",
            LowerIsBetter = true,
            HideIfSame = true,
        },
        {
            Name = "Crouching Recoil",
            Description = "Recoil multiplier when crouched and not moving.",
            AggregateFunction = function(base, val)
                return math.min(100, math.Round(val * 100, 0))
            end,
            Unit = "%",
            Value = "RecoilCrouchMult",
            LowerIsBetter = true,
            HideIfSame = true,
        },
        {
            Name = "Move Speed",
            Description = {"Speed multiplier while the weapon is held up.",
            "Has no effect when weapon is in safety."},
            AggregateFunction = function(base, val)
                return math.min(100, math.Round(val * 100, 0))
            end,
            Unit = "%",
            Value = "MoveSpeedMult"
        },
        {
            Name = "Shooting Speed",
            Description = {"Speed multiplier from firing the weapon.",
            "Accumulating recoil increases slowdown intensity."},
            AggregateFunction = function(base, val)
                return math.min(100, math.Round(val * 100, 0))
            end,
            Unit = "%",
            Value = "ShootingSpeedMult"
        },
        {
            Name = "Sighted Speed",
            Description = "Speed multiplier while the weapon is aiming.",
            AggregateFunction = function(base, val)
                return math.min(100, math.Round(val * 100, 0))
            end,
            Unit = "%",
            Value = "SightedSpeedMult",
            ValueCheck = "Scope",
        },
        {
            Name = "Reload Speed",
            Description = "Speed multiplier while reloading.",
            AggregateFunction = function(base, val)
                return math.min(100, math.Round(val * 100, 0))
            end,
            Unit = "%",
            Value = "ReloadSpeedMult",
            --ConVarCheck = "tacrp_arcade",
            --ConVarInvert = true,
        },
        {
            Name = "Reload Time",
            Description = "Amount of time required to perform a reload.",
            AggregateFunction = function(base, val)
                return math.Round(self:GetReloadTime(base), 2)
            end,
            Value = "ReloadTimeMult",
            LowerIsBetter = true,
            Unit = "s"
        },
        {
            Name = "Deploy Time",
            Description = "Amount of time required to bring up the weapon. Holstering is instant.",
            AggregateFunction = function(base, val)
                return math.Round(self:GetDeployTime(base), 2)
            end,
            Value = "DeployTimeMult",
            LowerIsBetter = true,
            HideIfSame = true,
            Unit = "s"
        },
        {
            Name = "Penetration",
            Description = {"Thickness of metal this weapon can penetrate.",
            "Actual penetration is material-dependent."},
            Value = "Penetration",
            Unit = "\""
        },
        {
            Name = "Sway",
            Description = {"Amount of sway in hipfire. Sway affects your firing direction",
            "without changing your aiming direction."},

            Value = "Sway",
            LowerIsBetter = true,
            ConVarCheck = "tacrp_sway",
        },
        {
            Name = "Sway In Sights",
            Description = {"Amount of sway while aiming. Sway affects your firing direction",
            "without changing your aiming direction."},
            Value = "ScopedSway",
            LowerIsBetter = true,
            ConVarCheck = "tacrp_sway",
            ValueCheck = "Scope",
        },
        {
            Name = "Crouching Sway",
            Description = "Sway multiplier when crouched and not moving.",
            Value = "SwayCrouchMult",
            AggregateFunction = function(base, val)
                return math.min(100, math.Round(val * 100, 0))
            end,
            Unit = "%",
            LowerIsBetter = true,
            HideIfSame = true,
            ConVarCheck = "tacrp_sway",
        },
        {
            Name = "Mid-Air Spread",
            Description = "Amount of inaccuracy caused by not standing on solid ground. Applied at half intensity while swimming.",
            AggregateFunction = function(base, val)
                return math.Round(math.deg(val), 2)
            end,
            Unit = "°",
            Value = "MidAirSpreadPenalty",
            LowerIsBetter = true,
            HideIfSame = true,
        },
        {
            Name = "Hipfire Spread",
            Description = "Amount of additional inaccuracy while hipfiring.",
            AggregateFunction = function(base, val)
                return math.Round(math.deg(val), 2)
            end,
            Unit = "°",
            Value = "HipFireSpreadPenalty",
            LowerIsBetter = true,
            HideIfSame = true,
        },
        {
            Name = "Melee Damage",
            Description = "Damage dealt when bashing.",
            Value = "MeleeDamage",
            HideIfSame = true,
        },
        {
            Name = "Firemode",
            Description = "The weapon's firing capabilities.",
            AggregateFunction = function(base, val)
                if !val then
                    val = {base and self:GetTable()["Firemode"] or self:GetValue("Firemode")}
                end
                if #val == 1 then
                    if val[1] == 2 then
                        return "Auto"
                    elseif val[1] == 1 then
                        return "Semi"
                    elseif val[1] < 0 then
                        return val[1] .. "-Burst"
                    end
                else
                    local tbl = table.Copy(val)
                    table.sort(tbl, function(a, b)
                        if a == 2 then
                            return b == 2
                        elseif b == 2 then
                            return a != 2
                        end
                        return math.abs(a) <= math.abs(b)
                    end)
                    local str = "S-"
                    for i = 1, #tbl do
                        str = str .. (tbl[i] == 2 and "F" or math.abs(tbl[i])) .. (i < #tbl and "-" or "")
                    end
                    return str
                end
                return table.ToString(val)
            end,
            BetterFunction = function(old, new)
                if !old then
                    old = {self:GetTable()["Firemode"]}
                end
                local oldbest, newbest = 0, 0
                for i = 1, #old do
                    local v = math.abs(old[i])
                    if v > oldbest or v == 2 then
                        oldbest = (v == 2 and math.huge) or v
                    end
                end
                for i = 1, #new do
                    local v = math.abs(new[i])
                    if v > newbest or v == 2 then
                        newbest = (v == 2 and math.huge) or v
                    end
                end
                if oldbest == newbest then
                    return #old != #new , #old < #new
                else
                    return true, oldbest < newbest
                end
            end,
            Value = "Firemodes",
            HideIfSame = true,
        },
        {
            Name = "Free Aim Angle",
            Description = "Maximum amount of deviation from the aim direction while hipfiring.",
            Unit = "°",
            Value = "FreeAimMaxAngle",
            LowerIsBetter = true,
            HideIfSame = true,
            ConVarCheck = "tacrp_freeaim",
        },
        {
            Name = "Mean Shots To Fail",
            Description = "The average number of shots that will be fired before the weapon jams.",
            AggregateFunction = function(base, val)
                return math.Round(self:GetMeanShotsToFail(base), 0)
            end,
            DisplayFunction = function(base, val)
                if val == 1 then return "∞" end
                return math.Round(self:GetMeanShotsToFail(base), 0)
            end,
            HideIfSame = true,
            Value = "ShootChance",
        },
    }

    if !self:GetValue("NoStatBox") then

        local selftbl = self:GetTable()

        local tabs_h = ScreenScale(10)

        local group_box = vgui.Create("DPanel", bg)
        group_box.PrintName = "Rating"
        group_box:SetSize(ScreenScale(168), ScreenScale(172))
        group_box:SetPos(scrw - ScreenScale(168) - airgap, stack + smallgap * 2 + tabs_h)
        group_box.Paint = function(self2)
            if !IsValid(self) then return end

            local w, h = ScreenScale(172), ScreenScale(16)
            local x, y = 0, 0

            local hovered = false
            local hoverindex = 0
            local hoverscore = 0

            for i, v in ipairs(self.StatGroups) do

                if !self.StatScoreCache[i] then
                    local sb = v.RatingFunction(self, true)
                    local sc = v.RatingFunction(self, false)

                    local ib, ic = 0, 0
                    for j = 1, #self.StatGroupGrades do
                        if ib == 0 and sb >= self.StatGroupGrades[j][1] then
                            ib = j
                        end
                        if ic == 0 and sc >= self.StatGroupGrades[j][1] then
                            ic = j
                        end
                    end

                    self.StatScoreCache[i] = {{math.min(sc or 0, 100), ic}, {math.min(sb or 0, 100), ib}}
                end
                local scorecache = self.StatScoreCache[i]
                local f = scorecache[1][1] / 100
                local f_base = scorecache[2][1] / 100

                local w2, h2 = ScreenScale(100), ScreenScale(8)
                surface.SetDrawColor(0, 0, 0, 150)
                surface.DrawRect(x, y, w, h)
                TacRP.DrawCorneredBox(x, y, w, h)

                draw.SimpleText(v.Name, "TacRP_Myriad_Pro_10", x + ScreenScale(4), y + ScreenScale(8), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

                surface.SetDrawColor(75, 75, 75, 100)
                surface.DrawRect(x + ScreenScale(64), y + ScreenScale(4), w2, h2)

                surface.SetDrawColor(Lerp(f, 200, 0), Lerp(f, 0, 200), 0, 150)
                surface.DrawRect(x + ScreenScale(64), y + ScreenScale(4), w2 * f, h2)

                surface.SetDrawColor(0, 0, 0, 0)
                TacRP.DrawCorneredBox(x + ScreenScale(64), y + ScreenScale(4), w2, h2)

                for j = 1, 4 do
                    surface.SetDrawColor(255, 255, 255, 125)
                    surface.DrawRect(x + ScreenScale(64) + w2 * (j / 5) - 0.5, y + h2 - ScreenScale(1.5), 1, ScreenScale(3))
                end

                surface.SetDrawColor(255, 255, 255, 20)
                surface.DrawRect(x + ScreenScale(64), y + ScreenScale(2.5) + h2 / 2, w2 * f_base, ScreenScale(3))

                local grade = self.StatGroupGrades[scorecache[1][2]]
                if grade then
                    draw.SimpleText(grade[2], "TacRP_HD44780A00_5x8_8", x + ScreenScale(61), y + ScreenScale(7.5), grade[3], TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
                end

                local mx, my = self2:CursorPos()
                if mx > 0 and mx <= w and my > y and my <= y + h then
                    hovered = true
                    hoverindex = i
                    hoverscore = scorecache[1][1]
                end

                y = y + ScreenScale(18)
            end

            if hovered then
                local v = self.StatGroups[hoverindex]
                local todo = DisableClipping(true)
                local col_bg = Color(0, 0, 0, 254)
                local col_corner = Color(255, 255, 255)
                local col_text = Color(255, 255, 255)
                local rx, ry = self2:CursorPos()
                rx = rx + ScreenScale(16)
                ry = ry + ScreenScale(16)

                local desc = v.Description or {""}
                if isstring(desc) then
                    desc = {desc}
                end

                if self2:GetY() + ry >= ScreenScale(280) then
                    ry = ry - ScreenScale(60)
                end

                if self2:GetX() + rx + ScreenScale(160) >= ScrW() then
                    rx = rx - ScreenScale(160)
                end

                local bw, bh = ScreenScale(160), ScreenScale(12 + (6 * #desc))
                surface.SetDrawColor(col_bg)
                TacRP.DrawCorneredBox(rx, ry, bw, bh, col_corner)

                local txt = v.Name
                surface.SetTextColor(col_text)
                surface.SetFont("TacRP_Myriad_Pro_10")
                surface.SetTextPos(rx + ScreenScale(2), ry + ScreenScale(1))
                surface.DrawText(txt)

                local scoretxt = "(Rating: " .. math.Round(hoverscore) .. " / 100)"
                draw.SimpleText(scoretxt, "TacRP_Myriad_Pro_8", rx + bw - ScreenScale(2), ry + ScreenScale(2), col_text, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)

                surface.SetFont("TacRP_Myriad_Pro_6")
                for j, k in pairs(desc) do
                    surface.SetTextPos(rx + ScreenScale(2), ry + ScreenScale(1 + 8 + 2) + (ScreenScale(6 * (j - 1))))
                    surface.DrawText(k)
                end

                DisableClipping(todo)
            end
        end

        local stat_box = vgui.Create("DPanel", bg)
        stat_box.PrintName = "Stats"
        stat_box:SetSize(ScreenScale(128), ScreenScale(172))
        stat_box:SetPos(scrw - ScreenScale(128) - airgap, stack + smallgap * 2 + tabs_h)
        stat_box.Paint = function(self2, w, h)
            if !IsValid(self) then return end

            local hovered = false
            local hoverindex = 0

            surface.SetDrawColor(0, 0, 0, 150)
            surface.DrawRect(0, 0, w, h)
            TacRP.DrawCorneredBox(0, 0, w, h)

            local x_1 = w - ScreenScale(64)
            local x_2 = w - ScreenScale(32)

            surface.SetDrawColor(255, 255, 255, 100)
            surface.DrawLine(x_1, 0, x_1, h)
            surface.DrawLine(x_2, 0, x_2, h)
            surface.DrawLine(0, ScreenScale(2 + 8 + 1), w, ScreenScale(2 + 8 + 1))

            surface.SetFont("TacRP_Myriad_Pro_8")
            surface.SetTextColor(255, 255, 255)
            surface.SetTextPos(x_1 + ScreenScale(4), ScreenScale(2))
            surface.DrawText("BASE")

            surface.SetFont("TacRP_Myriad_Pro_8")
            surface.SetTextColor(255, 255, 255)
            surface.SetTextPos(x_2 + ScreenScale(4), ScreenScale(2))
            surface.DrawText("CURR")

            -- if hovered try to figure out what stat we're hovering over

            local i2 = 0
            for i, k in pairs(stats) do
                local value = self:GetValue(k.Value)
                local orig = self:GetBaseValue(k.Value)

                if k.HideIfSame and orig == value then continue end

                if k.ConVarCheck then
                    if !k.ConVar then k.ConVar = GetConVar(k.ConVarCheck) end
                    if k.ConVar:GetBool() == tobool(k.ConVarInvert) then continue end
                end

                if k.ValueCheck and self:GetValue(k.ValueCheck) != !k.ValueInvert then
                    continue
                end

                local stat_base = 0
                local stat_curr = 0

                if k.AggregateFunction then
                    stat_base = k.AggregateFunction(true, orig)
                    stat_curr = k.AggregateFunction(false, value)
                else
                    stat_base = math.Round(orig, 4)
                    stat_curr = math.Round(value, 4)
                end

                if stat_base == nil and stat_cur == nil then continue end

                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(255, 255, 255)
                surface.SetTextPos(ScreenScale(2), ScreenScale(8 + 4 + 1) + (ScreenScale(8 * i2)))
                surface.DrawText(k.Name .. ":")

                local txt_base = tostring(stat_base)
                local txt_curr = tostring(stat_curr)

                if isbool(stat_base) then
                    if stat_base then
                        txt_base = "YES"
                    else
                        txt_base = "NO"
                    end

                    if stat_curr then
                        txt_curr = "YES"
                    else
                        txt_curr = "NO"
                    end
                end

                if k.DisplayFunction then
                    txt_base = k.DisplayFunction(true, orig)
                    txt_curr = k.DisplayFunction(false, value)
                end

                surface.SetTextColor(255, 255, 255)
                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextPos(x_1 + ScreenScale(3), ScreenScale(8 + 4 + 1) + (ScreenScale(8 * i2)))
                surface.DrawText(txt_base .. (k.Unit or ""))

                local good = false
                local goodorbad = false


                if k.BetterFunction then
                    goodorbad, good = k.BetterFunction(orig, value)
                elseif stat_base != stat_curr then
                    if isnumber(stat_curr) then
                        good = stat_curr > stat_base
                        goodorbad = true
                    elseif isbool(stat_curr) then
                        good = !stat_base and stat_curr
                        goodorbad = true
                    end
                end

                if k.LowerIsBetter then
                    good = !good
                end

                if goodorbad then
                    if good then
                        surface.SetTextColor(175, 255, 175)
                    else
                        surface.SetTextColor(255, 175, 175)
                    end
                else
                    surface.SetTextColor(255, 255, 255)
                end

                surface.SetTextPos(x_2 + ScreenScale(3), ScreenScale(8 + 4 + 1) + (ScreenScale(8 * i2)))
                surface.DrawText(txt_curr .. (k.Unit or ""))

                local mx, my = self2:CursorPos()
                if mx > 0 and mx < w then
                    if my > ScreenScale(8 + 4 + 1) + (ScreenScale(8 * i2)) and my < ScreenScale(8 + 4 + 1) + (ScreenScale(8 * i2)) + ScreenScale(8) then
                        hovered = true
                        hoverindex = i
                    end
                end

                i2 = i2 + 1
            end

            if hovered then
                local todo = DisableClipping(true)
                local col_bg = Color(0, 0, 0, 254)
                local col_corner = Color(255, 255, 255)
                local col_text = Color(255, 255, 255)
                local rx, ry = self2:CursorPos()
                rx = rx + ScreenScale(16)
                ry = ry + ScreenScale(16)
                local stat = stats[hoverindex]

                local desc = stat.Description or {""}
                if isstring(desc) then
                    desc = {desc}
                end

                if self2:GetY() + ry >= ScreenScale(280) then
                    ry = ry - ScreenScale(60)
                end

                if self2:GetX() + rx + ScreenScale(160) >= ScrW() then
                    rx = rx - ScreenScale(160)
                end

                local bw, bh = ScreenScale(160), ScreenScale(12 + (6 * #desc))
                surface.SetDrawColor(col_bg)
                TacRP.DrawCorneredBox(rx, ry, bw, bh, col_corner)

                local txt = stat.Name
                surface.SetTextColor(col_text)
                surface.SetFont("TacRP_Myriad_Pro_10")
                surface.SetTextPos(rx + ScreenScale(2), ry + ScreenScale(1))
                surface.DrawText(txt)

                surface.SetFont("TacRP_Myriad_Pro_6")
                for i, k in pairs(desc) do
                    surface.SetTextPos(rx + ScreenScale(2), ry + ScreenScale(1 + 8 + 2) + (ScreenScale(6 * (i - 1))))
                    surface.DrawText(k)
                end

                DisableClipping(todo)
            end
        end

        local tabs = {group_box, stat_box}
        self.ActiveTab = self.ActiveTab or 1

        -- local tab_list = vgui.Create("DPanel", bg)
        -- tab_list:SetSize(ScreenScale(172), tabs_h)
        -- tab_list:SetPos(scrw - ScreenScale(172) - airgap, stack + smallgap)
        -- tab_list:SetMouseInputEnabled(false)
        -- tab_list.Paint = function() return end

        local tabs_w = ScreenScale(172) / #tabs - #tabs * ScreenScale(0.5)
        for i = 1, #tabs do
            if i != self.ActiveTab then
                tabs[i]:Hide()
            end

            local tab_button = vgui.Create("DLabel", bg)
            tab_button.TabIndex = i
            tab_button:SetSize(tabs_w, tabs_h)
            tab_button:SetPos(scrw - ScreenScale(172) - airgap + (ScreenScale(2) + tabs_w) * (i - 1), stack + smallgap)
            tab_button:SetText("")
            tab_button:SetMouseInputEnabled(true)
            tab_button:MoveToFront()
            tab_button.Paint = function(self2, w2, h2)
                if !IsValid(self) then return end

                local hover = self2:IsHovered()
                local selected = self.ActiveTab == i

                local col_bg = Color(0, 0, 0, 150)
                local col_corner = Color(255, 255, 255)
                local col_text = Color(255, 255, 255)

                if selected then
                    col_bg = Color(150, 150, 150, 150)
                    col_corner = Color(50, 50, 255)
                    col_text = Color(0, 0, 0)
                    if hover then
                        col_bg = Color(255, 255, 255)
                        col_corner = Color(150, 150, 255)
                        col_text = Color(0, 0, 0)
                    end
                elseif hover then
                    col_bg = Color(255, 255, 255)
                    col_corner = Color(0, 0, 0)
                    col_text = Color(0, 0, 0)
                end

                surface.SetDrawColor(col_bg)
                surface.DrawRect(0, 0, w2, h2)
                TacRP.DrawCorneredBox(0, 0, w2, h2, col_corner)

                draw.SimpleText(tabs[i].PrintName, "TacRP_Myriad_Pro_8", w2 / 2, h2 / 2, col_text, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
            tab_button.DoClick = function(self2)
                if self2.TabIndex == self.ActiveTab then return end
                self.ActiveTab = self2.TabIndex
                for j = 1, #tabs do
                    if j != self.ActiveTab then
                        tabs[j]:Hide()
                    else
                        tabs[j]:Show()
                    end
                end
            end
        end
    end

    local attachment_slots = {}

    local offset = (scrh - (ScreenScale(34 + 8) * table.Count(self.Attachments))) / 2

    self.Attachments["BaseClass"] = nil

    for slot, attslot in pairs(self.Attachments) do
        local atts = TacRP.GetAttsForCats(attslot.Category or "")

        attachment_slots[slot] = {}

        local slot_name = vgui.Create("DPanel", bg)
        slot_name:SetPos(airgap, offset + airgap - ScreenScale(8) + ((slot - 1) * ScreenScale(34 + 8)))
        slot_name:SetSize(ScreenScale(128), ScreenScale(8))
        slot_name.Paint = function(self2, w, h)
            if !IsValid(self) then return end

            local txt = attslot.PrintName or ""

            surface.SetFont("TacRP_Myriad_Pro_8")
            surface.SetTextColor(Color(255, 255, 255))
            surface.SetTextPos(0, 0)
            surface.DrawText(txt)
        end

        table.sort(atts, function(a, b)
            a = a or ""
            b = b or ""

            if a == "" or b == "" then return true end

            local atttbl_a = TacRP.GetAttTable(a)
            local atttbl_b = TacRP.GetAttTable(b)

            local order_a = 0
            local order_b = 0

            order_a = atttbl_a.SortOrder or order_a
            order_b = atttbl_b.SortOrder or order_b

            if order_a == order_b then
                return (atttbl_a.PrintName or "") < (atttbl_b.PrintName or "")
            end

            return order_a < order_b
        end)

        local prosconspanel = vgui.Create("DPanel", bg)
        prosconspanel:SetPos(airgap + ((table.Count(atts)) * ScreenScale(34)), offset + airgap + ((slot - 1) * ScreenScale(34 + 8)))
        prosconspanel:SetSize(ScreenScale(256), ScreenScale(34))
        prosconspanel.Paint = function(self2, w, h)
            if !IsValid(self) then return end

            local installed = attslot.Installed

            if !installed then return end

            local atttbl = TacRP.GetAttTable(installed)
            // draw the pros and cons text from the attachment

            local pros = atttbl.Pros or {}
            local cons = atttbl.Cons or {}

            local c = 0

            for i, pro in pairs(pros) do
                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(Color(50, 255, 50))
                surface.SetTextPos(0, ScreenScale((c * 8)))
                surface.DrawText("+" .. pro)

                c = c + 1
            end

            for i, con in pairs(cons) do
                surface.SetFont("TacRP_Myriad_Pro_8")
                surface.SetTextColor(Color(255, 50, 50))
                surface.SetTextPos(0, ScreenScale((c * 8)))
                surface.DrawText("-" .. con)

                c = c + 1
            end
        end

        for i, att in pairs(atts) do
            local atttbl = TacRP.GetAttTable(att)

            local slot_panel = vgui.Create("DLabel", bg)
            table.insert(attachment_slots[slot], slot_panel)
            slot_panel:SetText("")
            slot_panel:SetMouseInputEnabled(true)
            slot_panel:SetPos(airgap + ((i - 1) * ScreenScale(34)), offset + airgap + ((slot - 1) * ScreenScale(34 + 8)))
            slot_panel:SetSize(ScreenScale(32), ScreenScale(32))
            slot_panel.DoClick = function(self2)
                if !TacRP.NearBench(LocalPlayer()) then
                    flash_end = CurTime() + 1
                end
                if attslot.Installed then
                    if attslot.Installed == att then
                        self:Detach(slot)
                    else
                        self:Detach(slot, true)
                        self:Attach(slot, att)
                    end
                else
                    self:Attach(slot, att)
                end
            end
            slot_panel.DoRightClick = function(self2)
                if !TacRP.NearBench(LocalPlayer()) then
                    flash_end = CurTime() + 1
                end
                if attslot.Installed then
                    if attslot.Installed == att then
                        self:Detach(slot)
                    end
                end
            end
            slot_panel.Paint = function(self2, w, h)
                if !IsValid(self) then return end
                if !IsValid(self:GetOwner()) then return end
                local hover = self2:IsHovered()
                local attached = attslot.Installed == att
                self2:SetDrawOnTop(hover)

                local col_bg = Color(0, 0, 0, 150)
                local col_corner = Color(255, 255, 255)
                local col_text = Color(255, 255, 255)
                local col_image = Color(255, 255, 255)

                local has = TacRP:PlayerGetAtts(self:GetOwner(), att)

                local shownum = !GetConVar("TacRP_lock_atts"):GetBool() and !GetConVar("TacRP_free_atts"):GetBool() and !atttbl.Free

                if attached then
                    col_bg = Color(150, 150, 150, 150)
                    col_corner = Color(50, 50, 255)
                    col_text = Color(0, 0, 0)
                    col_image = Color(200, 200, 200)
                    if hover then
                        col_bg = Color(255, 255, 255)
                        col_corner = Color(150, 150, 255)
                        col_text = Color(0, 0, 0)
                        col_image = Color(255, 255, 255)
                    end
                else
                    if GetConVar("TacRP_free_atts"):GetBool() or has > 0 then
                        if hover then
                            col_bg = Color(255, 255, 255)
                            col_corner = Color(0, 0, 0)
                            col_text = Color(0, 0, 0)
                            col_image = Color(255, 255, 255)
                        end
                    else
                        if hover then
                            col_bg = Color(150, 0, 0)
                            col_corner = Color(25, 0, 0)
                            col_text = Color(0, 0, 0)
                            col_image = Color(255, 100, 100)
                        else
                            col_bg = Color(25, 0, 0)
                            col_corner = Color(255, 0, 0)
                            col_text = Color(255, 50, 50)
                            col_image = Color(200, 25, 25)
                        end
                    end
                end

                surface.SetDrawColor(col_bg)
                surface.DrawRect(0, 0, w, h)
                TacRP.DrawCorneredBox(0, 0, w, h, col_corner)

                surface.SetDrawColor(col_image)
                surface.SetMaterial(atttbl.Icon)
                surface.DrawTexturedRect(0, 0, w, h)

                local txt = atttbl.PrintName

                surface.SetFont("TacRP_Myriad_Pro_6")
                surface.SetTextColor(col_text)
                local t_w = surface.GetTextSize(txt)

                if col_text == Color(0, 0, 0) then
                    surface.SetDrawColor(255, 255, 255, 50)
                    surface.DrawRect(w / 2 - (t_w + ScreenScale(2)) / 2, h - ScreenScale(6), t_w + ScreenScale(2), ScreenScale(6))
                end

                surface.SetTextPos((w - t_w) / 2, h - ScreenScale(6))
                surface.DrawText(txt)

                if shownum then
                    local numtxt = has

                    surface.SetFont("TacRP_Myriad_Pro_6")
                    surface.SetTextColor(col_text)
                    local nt_w = surface.GetTextSize(numtxt)
                    surface.SetTextPos(w - nt_w - ScreenScale(2), ScreenScale(1))
                    surface.DrawText(numtxt)
                end

                -- thank u fesiug
                if hover then
                    local todo = DisableClipping(true)
                    local col_bg = Color(0, 0, 0, 230)
                    local col_corner = Color(255, 255, 255)
                    local col_text = Color(255, 255, 255)
                    local col_text_pro = Color(0, 130, 0, 230)
                    local col_text_con = Color(130, 0, 0, 230)
                    local rx, ry = self2:CursorPos()
                    rx = rx + ScreenScale(16)
                    ry = ry + ScreenScale(16)
                    local gap = ScreenScale(18)
                    local firstoff = ScreenScale(20)
                    local statjump = ScreenScale(12)
                    local statted = false

                    if self2:GetY() + ry >= ScreenScale(280) then
                        ry = ry - ScreenScale(60)
                    end

                    local bw, bh = ScreenScale(160), ScreenScale(18)
                    surface.SetDrawColor(col_bg)
                    TacRP.DrawCorneredBox(rx, ry, bw, bh, col_corner)

                    local txt = atttbl.FullName or atttbl.PrintName
                    surface.SetTextColor(col_text)
                    surface.SetFont("TacRP_Myriad_Pro_10")
                    surface.SetTextPos(rx + ScreenScale(2), ry + ScreenScale(1))
                    surface.DrawText(txt)

                    txt = atttbl.Description or ""
                    surface.SetFont("TacRP_Myriad_Pro_6")
                    surface.SetTextPos(rx + ScreenScale(2), ry + ScreenScale(1 + 8 + 2))
                    surface.DrawText(txt)

                    local bump = firstoff
                    local txjy = ScreenScale(1)
                    local rump = ScreenScale(9)
                    if atttbl.Pros then for aa, ab in ipairs(atttbl.Pros) do
                        surface.SetDrawColor(col_text_pro)
                        TacRP.DrawCorneredBox( rx, ry + bump, bw, ScreenScale(10) )
                        surface.SetFont("TacRP_Myriad_Pro_8")
                        surface.SetTextColor(col_text)
                        surface.SetTextPos(rx + rump, ry + bump + txjy)
                        surface.DrawText(ab)

                        surface.SetFont("TacRP_Myriad_Pro_8")
                        surface.SetTextPos(rx + ScreenScale(3), ry + bump + txjy)
                        surface.DrawText("+")

                        bump = bump + statjump
                        statted = true
                    end end
                    if atttbl.Cons then for aa, ab in ipairs(atttbl.Cons) do
                        surface.SetDrawColor(col_text_con)
                        TacRP.DrawCorneredBox( rx, ry + bump, bw, ScreenScale(10) )
                        surface.SetFont("TacRP_Myriad_Pro_8")
                        surface.SetTextColor(col_text)
                        surface.SetTextPos(rx + rump, ry + bump + txjy)
                        surface.DrawText(ab)

                        surface.SetFont("TacRP_Myriad_Pro_8")
                        surface.SetTextPos(rx + ScreenScale(3.8), ry + bump + txjy)
                        surface.DrawText("-")

                        bump = bump + statjump
                        statted = true
                    end end

                    if statted then
                        surface.SetDrawColor(col_bg)
                        surface.DrawLine(rx, ry + gap, rx + bw, ry + gap)
                    end

                    DisableClipping(todo)
                end
            end
        end
    end

    if GetConVar("tacrp_rp_requirebench"):GetBool() then
        local slot_name = vgui.Create("DPanel", bg)
        slot_name:SetPos(ScrW() / 2 - ScreenScale(64 + 8), ScreenScale(16))
        slot_name:SetSize(ScreenScale(128 + 16), ScreenScale(12))
        slot_name.Paint = function(self2, w, h)
            if !IsValid(self) then return end

            surface.SetDrawColor(0, 0, 0, 150)
            surface.DrawRect(0, 0, w, h)
            TacRP.DrawCorneredBox(0, 0, w, h)

            local txt = "Requires Customization Bench"
            if TacRP.NearBench(LocalPlayer()) then
                txt = "Able to customize"
                surface.SetTextColor(bench_have)
            else
                if flash_end > CurTime() then
                    local c = 255 - (flash_end - CurTime()) * 255
                    surface.SetTextColor(255, c, c)
                else
                    surface.SetTextColor(255, 255, 255)
                end
            end
            surface.SetFont("TacRP_Myriad_Pro_12")
            local tw, th = surface.GetTextSize(txt)
            surface.SetTextPos(w / 2 - tw / 2, 0)
            surface.DrawText(txt)
        end
    end
end

function SWEP:RemoveCustomizeHUD()
    if self.CustomizeHUD then
        self.CustomizeHUD:Remove()

        if (self.GrenadeMenuAlpha or 0) != 1 then
            gui.EnableScreenClicker(false)
        end
    end
end

function SWEP:DrawCustomizeHUD()

    local customize = self:GetCustomize()

    if customize and !lastcustomize then
        self:CreateCustomizeHUD()
    elseif !customize and lastcustomize then
        self:RemoveCustomizeHUD()
    end

    lastcustomize = self:GetCustomize()

    -- if self:GetCustomize() then
    --     customizedelta = math.Approach(customizedelta, 1, FrameTime() * 1 / 0.25)
    -- else
    --     customizedelta = math.Approach(customizedelta, 0, FrameTime() * 1 / 0.25)
    -- end

    -- local curvedcustomizedelta = self:Curve(customizedelta)

    -- if curvedcustomizedelta > 0 then
    --     RunConsoleCommand("pp_bokeh", "1")
    -- else
    --     RunConsoleCommand("pp_bokeh", "0")
    -- end

    -- RunConsoleCommand("pp_bokeh_blur", tostring(curvedcustomizedelta * 5))
    -- RunConsoleCommand("pp_bokeh_distance", 0)
    -- RunConsoleCommand("pp_bokeh_focus", tostring(((1 - curvedcustomizedelta) * 11) + 1))
end