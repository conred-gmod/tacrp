SWEP.Base = "tacrp_base"
SWEP.Spawnable = true

AddCSLuaFile()

// names and stuff
SWEP.PrintName = "KS-23"
SWEP.Category = "Tactical RP" // "Tactical RP (Arctic)"

SWEP.SubCatTier = "1Elite"
SWEP.SubCatType = "5Shotgun"

SWEP.Description = "Made from recycled aircraft gun barrels, this shotgun is hard to handle but devestating when fired."

SWEP.ViewModel = "models/weapons/tacint/v_ks23.mdl"
SWEP.WorldModel = "models/weapons/tacint/w_ks23.mdl"

SWEP.Slot = 2
SWEP.SlotAlt = 3

SWEP.BalanceStats = {
    [TacRP.BALANCE_SBOX] = {
        FreeAimMaxAngle = 5,
        MoveSpeedMult = 0.8,
        ShootingSpeedMult = 0.6,
        SightedSpeedMult = 0.8,
        MeleeSpeedMult = 1,
        ReloadSpeedMult = 1,
    },
    [TacRP.BALANCE_TTT] = {
        Damage_Max = 8,
        Damage_Min = 2,
        Range_Min = 500,
        Range_Max = 3000,
        Num = 16,
        ClipSize = 4,

        Spread = 0.04,
        ShotgunPelletSpread = 0.02,
        HipFireSpreadPenalty = 0.025,
        RecoilSpreadPenalty = 0.02,
        FreeAimMaxAngle = 4,

        BodyDamageMultipliers = {
            [HITGROUP_HEAD] = 2,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 0.75,
            [HITGROUP_RIGHTLEG] = 0.75,
            [HITGROUP_GEAR] = 0.9
        },

        ReloadTimeMult = 1.5,

        MoveSpeedMult = 0.8,
        ShootingSpeedMult = 0.5,
        MeleeSpeedMult = 1,
        SightedSpeedMult = 0.65,
        ReloadSpeedMult = 0.5,
    },
    [TacRP.BALANCE_PVE] = {
        Damage_Max = 9,
        Damage_Min = 4,
        Range_Min = 500,
        Range_Max = 3000,
        Num = 32,
        Spread = 0.06,
        ShotgunPelletSpread = 0.015,

        MoveSpeedMult = 0.8,
        ShootingSpeedMult = 0.6,
        SightedSpeedMult = 0.8,
        MeleeSpeedMult = 1,
        ReloadSpeedMult = 1,
    },
}

SWEP.TTTReplace = TacRP.TTTReplacePreset.Shotgun

// "ballistics"

SWEP.Damage_Max = 20
SWEP.Damage_Min = 8
SWEP.Range_Min = 600 // distance for which to maintain maximum damage
SWEP.Range_Max = 3000 // distance at which we drop to minimum damage
SWEP.Penetration = 2 // units of metal this weapon can penetrate
SWEP.Num = 20
SWEP.ArmorPenetration = 0.35

SWEP.MuzzleVelocity = 10000

SWEP.BodyDamageMultipliers = {
    [HITGROUP_HEAD] = 1,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 1,
    [HITGROUP_RIGHTARM] = 1,
    [HITGROUP_LEFTLEG] = 0.9,
    [HITGROUP_RIGHTLEG] = 0.9,
    [HITGROUP_GEAR] = 0.9
}

// misc. shooting

SWEP.Firemode = 1

SWEP.FiremodeName = "Pump-Action" // only used externally for firemode name distinction

SWEP.RPM = 40

SWEP.Spread = 0.03
SWEP.ShotgunPelletSpread = 0.015

SWEP.ShootTimeMult = 1.25

SWEP.HipFireSpreadPenalty = 0.025
SWEP.MidAirSpreadPenalty = 0

SWEP.ScopedSpreadPenalty = 0

SWEP.RecoilPerShot = 1
SWEP.RecoilMaximum = 3
SWEP.RecoilResetTime = 0.3
SWEP.RecoilDissipationRate = 1
SWEP.RecoilFirstShotMult = 2

SWEP.RecoilVisualKick = 2
SWEP.RecoilKick = 35
SWEP.RecoilStability = 0.65

SWEP.RecoilSpreadPenalty = 0.03

SWEP.CanBlindFire = true

// handling

SWEP.MoveSpeedMult = 0.875
SWEP.ShootingSpeedMult = 0.6
SWEP.SightedSpeedMult = 0.6

SWEP.ReloadSpeedMult = 0.5

SWEP.AimDownSightsTime = 0.35
SWEP.SprintToFireTime = 0.32

SWEP.ReloadTimeMult = 0.8

SWEP.Sway = 1.5
SWEP.ScopedSway = 0.5

SWEP.FreeAimMaxAngle = 3

// hold types

SWEP.HoldType = "ar2"
SWEP.HoldTypeSprint = "passive"
SWEP.HoldTypeBlindFire = false
SWEP.HoldTypeNPC = "shotgun"

SWEP.GestureShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.GestureReload = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

SWEP.PassiveAng = Angle(0, 0, 0)
SWEP.PassivePos = Vector(0, -2, -5)

SWEP.BlindFireAng = Angle(0, 5, 0)
SWEP.BlindFirePos = Vector(4, -2, -4)

SWEP.SprintAng = Angle(30, -15, 0)
SWEP.SprintPos = Vector(5, 0, -2)

SWEP.SightAng = Angle(-0.55, 0.1, 0.75)
SWEP.SightPos = Vector(-3.4, -2, -3.25)

SWEP.CorrectivePos = Vector(0.275, 0, -0.2)
SWEP.CorrectiveAng = Angle(1.21, 0.1, 0)

SWEP.HolsterVisible = true
SWEP.HolsterSlot = TacRP.HOLSTER_SLOT_BACK2
SWEP.HolsterPos = Vector(5, 8, -6)
SWEP.HolsterAng = Angle(0, 0, 0)

// reload

SWEP.ClipSize = 4
SWEP.Ammo = "buckshot"
SWEP.ShotgunReload = true

SWEP.ReloadTimeMult = 1.25

// sounds

local path = "TacRP/weapons/ks23/ks23_"

SWEP.Sound_Shoot = "tacrp/weapons/ks23/ks23_fire1.wav"
SWEP.Sound_Shoot_Silenced = "TacRP/weapons/sg551/sg551_fire_silenced-1.wav"

SWEP.Vol_Shoot = 130
SWEP.Pitch_Shoot = 95
SWEP.ShootPitchVariance = 0 // amount to vary pitch by each shot

// effects

// the .qc attachment for the muzzle
SWEP.QCA_Muzzle = 1
SWEP.QCA_Eject = 2

SWEP.MuzzleEffect = "muzzleflash_shotgun"
SWEP.EjectEffect = 4
SWEP.EjectDelay = 0.5

// anims

// VM:
// idle
// fire
// fire1, fire2...
// dryfire
// melee
// reload
// midreload
// prime_grenade
// throw_grenade
// throw_grenade_underhand
// deploy
// blind_idle
// blind_fire
// blind_fire1, blind_fire2...
// blind_dryfire

// WM:
// attack1
SWEP.AnimationTranslationTable = {
    ["fire"] = {"shoot1", "shoot2"},
    ["blind_fire"] = {"blind_shoot1"},
    ["melee"] = {"melee1", "melee2"},
    ["reload"] = {"reload", "reload2"},
    ["jam"] = "reload_finish"
}

// attachments

SWEP.Attachments = {
    [1] = {
        PrintName = "Optic",
        Category = {"optic_cqb", "optic_medium"},
        Bone = "ValveBiped.bekas_rootbone",
        WMBone = "ValveBiped.Bip01_R_Hand",
        InstalledElements = {"sights"},
        AttachSound = "TacRP/weapons/optic_on.wav",
        DetachSound = "TacRP/weapons/optic_off.wav",
        VMScale = 0.75,
        Pos_VM = Vector(-3.4, 0, 8),
        Ang_VM = Angle(90, 0, 0),
        Pos_WM = Vector(9, 0.85, -7),
        Ang_WM = Angle(-25, 3.5, 180),
    },
    [2] = {
        PrintName = "Tactical",
        Category = "tactical",
        Bone = "ValveBiped.bekas_rootbone",
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
        InstalledElements = {"tactical"},
        VMScale = 1.15,
        Pos_VM = Vector(-2, -0.3, 22),
        Ang_VM = Angle(90, 0, -90),
        Pos_WM = Vector(22, 0.5, -11),
        Ang_WM = Angle(-25, 3.5, 90),
    },
    [3] = {
        PrintName = "Accessory",
        Category = {"acc", "acc_duffle", "acc_extmag_shotgun"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [4] = {
        PrintName = "Bolt",
        Category = {"bolt_manual"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [5] = {
        PrintName = "Trigger",
        Category = {"trigger_manual", "trigger_pump"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [6] = {
        PrintName = "Ammo",
        Category = {"ammo_shotgun", "ammo_ks23"},
        AttachSound = "TacRP/weapons/flashlight_on.wav",
        DetachSound = "TacRP/weapons/flashlight_off.wav",
    },
    [7] = {
        PrintName = "Perk",
        Category = {"perk", "perk_melee", "perk_shooting", "perk_reload"},
        AttachSound = "tacrp/weapons/flashlight_on.wav",
        DetachSound = "tacrp/weapons/flashlight_off.wav",
    },
}

local function addsound(name, spath)
    sound.Add({
        name = name,
        channel = 16,
        volume = 1.0,
        sound = spath
    })
end

addsound("TacInt_Bekas.Insertshell", "tacrp/weapons/bekas/insertshell-1.wav")
addsound("TacInt_Bekas.Movement", "tacrp/weapons/bekas/movement-1.wav")
addsound("TacInt_Bekas.PumpBack", path .. "pump_back.wav")
addsound("TacInt_Bekas.PumpForward", path .. "pump_forward.wav")