L = {}
STL = {}

L["font.1"] = "LondonBetween"
L["font.2"] = "Myriad Pro"
L["font.3"] = "HD44780A00 5x8"

STL["tier.1"] = "4Consumer"
STL["tier.2"] = "3Security"
STL["tier.3"] = "2Operator"
STL["tier.4"] = "1Elite"
STL["tier.spec"] = "9Special"
STL["type.sidearm"] = "1Sidearm"
STL["type.machine_pistol"] = "2Machine Pistol"
STL["type.submachine_gun"] = "3Submachine Gun"
STL["type.assault_rifle"] = "4Assault Rifle"
STL["type.machine_gun"] = "4Machine Gun"
STL["type.shotgun"] = "5Shotgun"
STL["type.sporter_carbine"] = "5Sporter Carbine"
STL["type.precision_rifle"] = "6Precision Rifle"
STL["type.sniper_rifle"] = "7Sniper Rifle"
STL["type.melee_weapon"] = "8Melee Weapon"
STL["type.equipment"] = "9Equipment"
STL["type.throwable"] = "9Throwable"

STL["slot.optic"] = "Optic"
STL["slot.muzzle"] = "Muzzle"
STL["slot.tactical"] = "Tactical"
STL["slot.accessory"] = "Accessory"
STL["slot.bolt"] = "Bolt"
STL["slot.trigger"] = "Trigger"
STL["slot.ammo"] = "Ammo"
STL["slot.perk"] = "Perk"
STL["slot.melee_tech"] = "Technique"
STL["slot.melee_spec"] = "Special"

L["tier.1"] = "Consumer"
L["tier.2"] = "Security"
L["tier.3"] = "Operator"
L["tier.4"] = "Elite"
L["tier.spec"] = "Special"
L["type.sidearm"] = "Sidearm"
L["type.machine_pistol"] = "Machine Pistol"
L["type.submachine_gun"] = "Submachine Gun"
L["type.assault_rifle"] = "Assault Rifle"
L["type.machine_gun"] = "Machine Gun"
L["type.shotgun"] = "Shotgun"
L["type.sporter_carbine"] = "Sporter Carbine"
L["type.precision_rifle"] = "Precision Rifle"
L["type.sniper_rifle"] = "Sniper Rifle"
L["type.melee_weapon"] = "Melee Weapon"
L["type.equipment"] = "Equipment"
L["type.throwable"] = "Throwable"

L["cust.rating"] = "Rating"
L["cust.stats"] = "Stats"
L["cust.description"] = "DESCRIPTION:"
L["cust.type_tier"] = "{tier} Grade {type}"

L["unit.hu"] = " HU" -- hammer unit
L["unit.meter"] = "m"
L["unit.second"] = "s"
L["unit.persecond"] = "/s"
L["unit.mps"] = "m/s" -- meters per second
L["unit.damage"] = " DMG"
L["unit.stk"] = " STK" -- shots to kill
L["unit.ptk"] = " PTK" -- pellets to kill

L["slot.default"] = "Slot"
L["slot.optic"] = "Optic"
L["slot.muzzle"] = "Muzzle"
L["slot.tactical"] = "Tactical"
L["slot.accessory"] = "Accessory"
L["slot.bolt"] = "Bolt"
L["slot.trigger"] = "Trigger"
L["slot.ammo"] = "Ammo"
L["slot.perk"] = "Perk"
L["slot.melee_tech"] = "Technique"
L["slot.melee_spec"] = "Special"

L["ammo.ti_flashbang"] = "Flashbangs"
L["ammo.ti_thermite"] = "Thermite Grenades"
L["ammo.ti_smoke"] = "Smoke Grenades"
L["ammo.ti_c4"] = "C4 Charges"
L["ammo.ti_gas"] = "CS Gas Grenades"
L["ammo.ti_nuke"] = "Nuclear Devices"
L["ammo.ti_charge"] = "Breaching Charge"
L["ammo.ti_sniper"] = "Anti-Materiel Ammo"

L["rating.score"] = "(Score: {score}/{max})"
L["rating.lethality"] = "Lethality"
L["rating.lethality.desc"] = "How easily and quickly the weapon can take out a single target.\nDoes not consider armor penetration.\nAffected by Damage and RPM."
L["rating.suppression"] = "Suppression"
L["rating.suppression.desc"] = "How much damage the weapon can output over a long period of time.\nDoes not consider armor penetration.\nAffected by Damage, RPM, Capacity and Reload Time."
L["rating.range"] = "Range"
L["rating.range.desc"] = "How well the weapon gains or loses damage over long distances.\nAffected by Minimum Range, Maximum Range, and damage falloff."
L["rating.precision"] = "Precision"
L["rating.precision.desc"] = "How accurate the weapon is when firing single shots or short bursts.\nAffected by Spread and various Recoil stats."
L["rating.control"] = "Control"
L["rating.control.desc"] = "How managable the weapon's recoil and spread is under sustained fire.\nAffected by RPM and various Recoil stats."
L["rating.handling"] = "Handling"
L["rating.handling.desc"] = "How quickly this weapon readies from sprinting, aiming and deploying.\nAffected by Aim Down Sights Time, Sprint To Fire Time, and Deploy Time."
L["rating.maneuvering"] = "Maneuvering"
L["rating.maneuvering.desc"] = "How accurate the weapon is while not aiming.\nAffected by Hipfire Spread, Mid-air Spread, Sway, and Free Aim Angle."
L["rating.mobility"] = "Mobility"
L["rating.mobility.desc"] = "How fast the user can move while using this weapon.\nAffected by various Speed stats."
L["rating.stability"] = "Stability"
L["rating.stability.desc"] = "How much the weapon's point of aim will move around.\nAffected by various Sway stats.\nNOTE: No difference if Sway is disabled in the options."

L["stat.table.stat"] = "STAT"
L["stat.table.base"] = "BASE"
L["stat.table.curr"] = "CURR"
L["stat.table.diff"] = "DIFF"

L["stat.raw_dps"] = "Raw DPS"
L["stat.raw_dps.desc"] = "Calculated damage output of the weapon with no damage falloff.\nDoes not consider hitgroup damage multipliers or armor penetration."
L["stat.min_ttk"] = "Minimum TTK"
L["stat.min_ttk.desc"] = "Calculated time needed to kill a target starting from the second shot.\nAssumes no damage falloff and target has 100 health.\nDoes not consider hitgroup damage multipliers."
L["stat.armorpenetration"] = "Armor Penetration"
L["stat.armorpenetration.desc"] = "Multiplier for health damage done when hitting armor.\nHigher value indicates less damage to armor and more to health.\nAt 100%, armor is ignored entirely. At 0%, armor will block all damage."
L["stat.armorbonus"] = "Armor Shredding"
L["stat.armorbonus.desc"] = "Multiplier for armor damage done when hitting armor.\nHigh AP weapons will shred less armor due to most of the damage being\ndealt directly to health. At 100% AP, no armor damage will be dealt."
L["stat.penetration"] = "Material Penetration"
L["stat.penetration.desc"] = "Amount of metal this weapon can shoot through.\nDepending on surface type, actual penetration depth will vary."
L["stat.spread"] = "Spread"
L["stat.spread.desc"] = "Base accuracy of the weapon."
L["stat.rpm"] = "Fire Rate"
L["stat.rpm.desc"] = "Rate of fire of the weapon, in rounds per minute."
L["stat.clipsize"] = "Capacity"
L["stat.clipsize.desc"] = "Amount of ammo the weapon can hold at once."
L["stat.sprinttofire"] = "Sprint To Fire"
L["stat.sprinttofire.desc"] = "Time required to transition from fully sprinting to being able to fire."
L["stat.aimdownsights"] = "Aim Down Sights"
L["stat.aimdownsights.desc"] = "Time required to transition from hipfiring to aiming."
L["stat.muzzlevelocity"] = "Muzzle Velocity"
L["stat.muzzlevelocity.desc"] = "How fast the projectile travels in the world.\nAlso controls the distance threshold below which bullets become hitscan."
L["stat.recoilkick"] = "Recoil Kick"
L["stat.recoilkick.desc"] = "Strength of \"felt recoil\" that moves your point of aim."
L["stat.recoilspread"] = "Spread From Recoil"
L["stat.recoilspread.desc"] = "Inaccuracy per unit of recoil. Larger value means the weapon becomes\ninaccurate faster while continuous firing."
L["stat.recoildissipation"] = "Recoil Recovery"
L["stat.recoildissipation.desc"] = "Rate at which accumulated recoil disspiates.\nLarger value means the effects of recoil disappear faster\nafter the reset time."
L["stat.recoilresettime"] = "Recoil Reset Time"
L["stat.recoilresettime.desc"] = "Duration of delay before recoil can start to dissipate.\nLarger value means you must wait longer between shots until recoil\ncan start to go down."
L["stat.recoilmaximum"] = "Maximum Recoil"
L["stat.recoilmaximum.desc"] = "Upper limit to recoil caused by continuous firing."
L["stat.recoilfirstshot"] = "First Shot Recoil"
L["stat.recoilfirstshot.desc"] = "Recoil multiplier when firing the first shot in a burst. Resets after all recoil dissipates.\nDoes not affect Recoil Kick."
L["stat.recoilpershot"] = "Recoil Gain"
L["stat.recoilpershot.desc"] = "How much units of recoil is added per shot, typically 1.\nLarger value increases inaccuracy faster and takes longer to recover."
L["stat.recoilcrouch"] = "Crouching Recoil"
L["stat.recoilcrouch.desc"] = "Recoil multiplier when crouched and not moving."
L["stat.movespeed"] = "Move Speed"
L["stat.movespeed.desc"] = "Speed multiplier while the weapon is held up.\nDoes not slow when weapon is in safety."
L["stat.shootingspeed"] = "Shooting Speed"
L["stat.shootingspeed.desc"] = "Speed multiplier from firing the weapon.\nAccumulating recoil increases slowdown intensity."
L["stat.sightedspeed"] = "Sighted Speed"
L["stat.sightedspeed.desc"] = "Speed multiplier while aiming the weapon."
L["stat.reloadspeed"] = "Reload Speed"
L["stat.reloadspeed.desc"] = "Speed multiplier while reloading."
L["stat.reloadtime"] = "Reload Duration"
L["stat.reloadtime.desc"] = "Amount of time required to perform a reload."
L["stat.deploytime"] = "Deploy Duration"
L["stat.deploytime.desc"] = "Amount of time required to bring up the weapon."
L["stat.sway"] = "Sway"
L["stat.sway.desc"] = "Amount of sway in hipfire. Sway affects your firing direction\nwithout changing your aiming direction."
L["stat.scopedsway"] = "Sighted Sway"
L["stat.scopedsway.desc"] = "Amount of sway while aiming. Sway affects your firing direction\nwithout changing your aiming direction."
L["stat.swaycrouch"] = "Crouching Sway"
L["stat.swaycrouch.desc"] = "Sway multiplier when crouched and not moving."
L["stat.midairspread"] = "Mid-Air Spread"
L["stat.midairspread.desc"] = "Amount of inaccuracy caused by not standing on solid ground.\nApplied at half intensity while swimming and climbing ladders."
L["stat.hipfirespread"] = "Hipfire Spread"
L["stat.hipfirespread.desc"] = "Amount of inaccuracy present when hip-firing."
L["stat.meleedamage"] = "Melee Damage"
L["stat.meleedamage.desc"] = "Damage dealt when melee attacking."
L["stat.firemode"] = "Firemode"
L["stat.firemode.desc"] = "The weapon's firing capabilities."
L["stat.freeaimangle"] = "Free Aim Angle"
L["stat.freeaimangle.desc"] = "Maximum amount of deviation from the aim direction while hipfiring."
L["stat.shotstofail"] = "Mean Shots To Fail"
L["stat.shotstofail.desc"] = "The average number of shots that will be fired before the weapon jams."

-- not in stats page but attachments may use
L["stat.swaycrouch"] = "Crouched Sway"
L["stat.recoil"] = "Recoil"
L["stat.damage"] = "Damage"
L["stat.damage_max"] = "Close Range Damage"
L["stat.damage_min"] = "Long Range Damage"
L["stat.range"] = "Range"
L["stat.range_max"] = "Maximum Range"
L["stat.range_min"] = "Minimum Range"
L["stat.vol_shoot"] = "Loudness"

L["att.acc_extmag.name"] = "Mag Extender"
L["att.acc_extmag.fullname"] = "Extended Magazine"
L["att.acc_extmag.desc"] = "Slightly increase weapon capacity."
L["att.ammo_shotgun_slugs.name"] = "Slugs"
L["att.ammo_shotgun_slugs.fullname"] = "Slug Shells"
L["att.ammo_shotgun_slugs.desc"] = "Fire a single projectile for medium range shooting."
L["att.muzz_pistol_comp.name"] = "Compensator"
L["att.muzz_pistol_comp.desc"] = "Muzzle device which reduces recoil impact."


L["att.procon.3proj"] = "Three projectiles"
L["att.procon.moreproj"] = "More projectiles"
L["att.procon.1proj"] = "One projectile"

L["att.procon.noexp"] = "No explosion"
L["att.procon.direct"] = "Direct fire"
L["att.procon.doorbreach"] = "Can breach doors"
L["att.procon.crowd"] = "Crowd control"
L["att.procon.nonlethal"] = "Non-lethal"
L["att.procon.detdelay"] = "Delayed detonation"
L["att.procon.flash"] = "Flashbang effect"
L["att.procon.airburst"] = "Airburst"
L["att.procon.timedfuse"] = "Timed fuse"
L["att.procon.smoke"] = "Smokescreen effect"
L["att.procon.limb"] = "Limb damage"
L["att.procon.head"] = "Head damage"
L["att.procon.onebullet"] = "One bullet"
L["att.procon.armor"] = "Armor effectiveness"
L["att.procon.nosafety"] = "No safety fuse"
L["att.procon.radius"] = "Blast Radius"
L["att.procon.needprime"] = "Weak if not primed"
L["att.procon.projrng"] = "Random trajectory and damage"
L["att.procon.failrng"] = "Chance of dramatic failure"
L["att.procon.notracer"] = "Hidden Tracers"
L["att.procon.refund"] = "High chance to refund ammo"
L["att.procon.unreliable"] = "Unreliable"
L["att.procon.surplusboost1"] = "Sometimes shoots faster"
L["att.procon.surplusboost2"] = "Also shoots uncontrollably"