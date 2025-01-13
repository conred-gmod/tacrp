L = {} -- Base English

L["font.1"] = "Myriad Pro"
L["font.2"] = "HD44780A00 5x8"

L["tier.0"] = "5Негодное" -- like Walmart
L["tier.1"] = "4Потребительское"
L["tier.2"] = "3Охранное"
L["tier.3"] = "2Табельное"
L["tier.4"] = "1Элита"
L["tier.5"] = "0Экзотика"

L["tier.spec"] = "9Специальное"
L["type.sidearm"] = "1Пистолет" -- non-magnum pistols or pistol-form factor weapons
L["type.magnum_pistol"] = "2Крупнокалиберный пистолет" -- magnum-caliber pistols
L["type.machine_pistol"] = "3Автоматический пистолет" -- pistol-caliber automatic weapons small enough to be pistols
L["type.dual_pistol"] = "3Акимбо" -- 2 gunz
L["type.submachine_gun"] = "3Пистолет-пулемёт" -- pistol-caliber automatic weapons
L["type.assault_rifle"] = "4Штурмовая винтовки" -- intermediate-caliber automatic weapons
L["type.machine_gun"] = "5Пулемёт" -- big mag
L["type.shotgun"] = "5Дробовик" -- sotgun
L["type.sporter_carbine"] = "5Спортивное оружие" -- civilian weapons and civ variants
L["type.battle_rifle"] = "5Боевая винтовка" -- large-caliber automatic weapons
L["type.dmr"] = "6Стрелковая винтовка" -- precision-oritented rifles for intermediate ranges
L["type.sniper_rifle"] = "7Снайперская винтовка" -- precision rifles strictly for long range; the difference between marksman and sniper can get a little arbitrary sorry
L["type.amr"] = "9Крупнокалиберная винтовка" -- 50 cal or thereabouts
L["type.melee_sharp"] = "8Острое рукопашное оружие" -- sharp
L["type.melee_blunt"] = "8Грубое рукопашное оружие" -- not sharp
L["type.equipment"] = "9Снаряжение" -- not a gun, or really a weapon
L["type.throwable"] = "9Бросаемое" -- baseball
L["type.launcher"] = "6Гранатомёт" -- shoots splodey thing
L["type.special_weapon"] = "7Специальное оружие" -- weapons so unique they dont really fit in any other category (also good for containing weapons you dont want to show up in the regular mix)

L["cust.rating"] = "Рейтинг"
L["cust.stats"] = "Статистика"
L["cust.description"] = "ОПИСАНИЕ:" -- used in-line in text boxes
L["cust.type_tier"] = "{tier} класса {type}"
L["cust.trivia"] = "Мелочи"
L["cust.credits"] = "Заслуги"
L["cust.description2"] = "Описание" -- used as title
L["cust.drop_wep"] = "Выбросить"
L["cust.drop_nade"] = "Drop Grenade"

L["unit.hu"] = " HU" -- hammer unit
L["unit.meter"] = "м"
L["unit.second"] = "сек"
L["unit.persecond"] = "/сек"
L["unit.mps"] = "м/сек" -- meters per second
L["unit.damage"] = " УРОН"
L["unit.stk"] = " STK" -- shots to kill
L["unit.ptk"] = " PTK" -- pellets to kill

L["slot.default"] = "Слот"
L["slot.optic"] = "Оптика"
L["slot.muzzle"] = "Дульник"
L["slot.tactical"] = "Модуль"
L["slot.accessory"] = "Деталь"
L["slot.bolt"] = "Затвор"
L["slot.trigger"] = "Курок"
L["slot.ammo"] = "Тип"
L["slot.perk"] = "Перк"
L["slot.melee_tech"] = "Техника"
L["slot.melee_spec"] = "Специальное"
L["slot.melee_boost"] = "Усиление"

L["ammo.ti_flashbang"] = "Flashbangs"
L["ammo.ti_thermite"] = "Thermite Grenades"
L["ammo.ti_smoke"] = "Smoke Grenades"
L["ammo.ti_c4"] = "C4 Charges"
L["ammo.ti_gas"] = "CS Gas Grenades"
L["ammo.ti_nuke"] = "Nuclear Devices"
L["ammo.ti_charge"] = "Breaching Charge"
L["ammo.ti_sniper"] = "Anti-Materiel Ammo"
L["ammo.ti_heal"] = "Medi-Smoke Canisters"
L["ammo.ti_pistol_light"] = "Light Pistol Ammo"
L["ammo.ti_pistol_heavy"] = "Heavy Pistol Ammo"
L["ammo.ti_pdw"] = "PDW Ammo"
L["ammo.ti_rifle"] = "Heavy Rifle Ammo"
L["ammo.ti_sniper"] = "Sniper Ammo"

-- used when tacrp_ammonames 1
L["ammo.357"] = "Magnum Ammo"
L["ammo.smg1"] = "Carbine Ammo"
L["ammo.ar2"] = "Rifle Ammo"

L["rating.score"] = "(Score: {score}/{max})"
L["rating.lethality"] = "Летальность"
L["rating.lethality.desc"] = "How easily and quickly the weapon can take out a single target.\nDoes not consider armor penetration.\nAffected by Damage and RPM."
L["rating.suppression"] = "Подавление"
L["rating.suppression.desc"] = "How much damage the weapon can output over a long period of time.\nDoes not consider armor penetration.\nAffected by Damage, RPM, Capacity and Reload Time."
L["rating.range"] = "Дальность"
L["rating.range.desc"] = "How well the weapon gains or loses damage over long distances.\nAffected by Minimum Range, Maximum Range, and damage falloff."
L["rating.precision"] = "Точность"
L["rating.precision.desc"] = "How accurate the weapon is when firing single shots or short bursts.\nAffected by Spread and various Recoil stats."
L["rating.control"] = "Контроль"
L["rating.control.desc"] = "How managable the weapon's recoil and spread is under sustained fire.\nAffected by RPM and various Recoil stats."
L["rating.handling"] = "Эргономика"
L["rating.handling.desc"] = "How quickly this weapon readies from sprinting, aiming and deploying.\nAffected by Aim Down Sights Time, Sprint To Fire Time, and Deploy Time."
L["rating.maneuvering"] = "Движение"
L["rating.maneuvering.desc"] = "How accurate the weapon is while not aiming.\nAffected by Hipfire Spread, Mid-air Spread, Sway, and Free Aim Angle."
L["rating.mobility"] = "Мобильность"
L["rating.mobility.desc"] = "How fast the user can move while using this weapon.\nAffected by various Speed stats."
L["rating.stability"] = "Стабильность"
L["rating.stability.desc"] = "How much the weapon's point of aim will move around.\nAffected by various Sway stats."

L["stat.table.stat"] = "СТАТИСТИКА"
L["stat.table.base"] = "ОРИГ."
L["stat.table.curr"] = "ПЛЮСЫ"
L["stat.table.diff"] = "МИНУСЫ"

L["stat.raw_dps"] = "Грубый DPS"
L["stat.raw_dps.desc"] = "Calculated damage output of the weapon with no damage falloff.\nDoes not consider hitgroup damage multipliers or armor penetration."
L["stat.min_ttk"] = "Минимум TTK"
L["stat.min_ttk.desc"] = "Calculated time needed to kill a target starting from the second shot.\nAssumes no damage falloff and target has 100 health.\nDoes not consider hitgroup damage multipliers."
L["stat.armorpenetration"] = "Бронепробиваемость"
L["stat.armorpenetration.desc"] = "Multiplier for health damage done when hitting armor.\nHigher value indicates less damage to armor and more to health.\nAt 100%, armor is ignored entirely. At 0%, armor will block all damage."
L["stat.armorbonus"] = "Шинкование брони"
L["stat.armorbonus.desc"] = "Multiplier for how much extra armor is destroyed.\nNote: High AP weapons will shred less armor due to the damage going\ndirectly to health. And at 100% AP, no armor damage will be dealt."
L["stat.penetration"] = "Пробитие материалов"
L["stat.penetration.desc"] = "Amount of metal this weapon can shoot through.\nDepending on surface type, actual penetration depth will vary."
L["stat.spread"] = "Разброс"
L["stat.spread.desc"] = "Base spread of the weapon."
L["stat.rpm"] = "Скорострельность"
L["stat.rpm.desc"] = "Rate of fire of the weapon, in rounds per minute."
L["stat.rpm_burst"] = "Очередью"
L["stat.rpm_burst.desc"] = "Rate of fire of the weapon in burst fire mode, in RPM."
L["stat.rpm_semi"] = "Одиночные"
L["stat.rpm_semi.desc"] = "Rate of fire of the weapon in semi fire mode, in RPM."
L["stat.rpm_burst_peak"] = "Пик очередью"
L["stat.rpm_burst_peak.desc"] = "Highest rate of fire achievable, factoring in post-burst delay, in RPM."
L["stat.clipsize"] = "Ёмкость"
L["stat.clipsize.desc"] = "Amount of ammo the weapon can hold at once."
L["stat.sprinttofire"] = "От бега к огню"
L["stat.sprinttofire.desc"] = "Time required to transition from fully sprinting to being able to fire."
L["stat.aimdownsights"] = "В прицеле"
L["stat.aimdownsights.desc"] = "Time required to transition from hipfiring to aiming."
L["stat.muzzlevelocity"] = "Скорость пули"
L["stat.muzzlevelocity.desc"] = "How fast the projectile travels in the world.\nAlso controls the distance threshold below which bullets become hitscan."
L["stat.recoilkick"] = "Первый выстрел"
L["stat.recoilkick.desc"] = "Strength of \"felt recoil\" that moves your point of aim."
L["stat.recoilstability"] = "Устойчивость отдачи"
L["stat.recoilstability.desc"] = "How predictable the recoil kick is.\nLarger value means recoil becomes more vertical and less horizontal."
L["stat.recoilspread"] = "Разброс"
L["stat.recoilspread.desc"] = "Additional spread per unit of bloom.\nLarger value means the weapon gets more inaccurate under sustained fire."
L["stat.recoilspread2"] = "Отдача"
L["stat.recoilspread2.desc"] = "Additional recoil kick per unit of bloom.\nLarger value means the weapon's recoil gets stronger under sustained fire."
L["stat.recoildissipation"] = "Восстановление"
L["stat.recoildissipation.desc"] = "Rate at which accumulated bloom disspiates.\nLarger value means that bloom disappears faster after the reset time."
L["stat.recoilresettime"] = "Перезарядка"
L["stat.recoilresettime.desc"] = "Delay after firing before bloom can start to dissipate.\nLarger value means you must wait longer between shots until bloom\ncan start to go down."
L["stat.recoilmaximum"] = "Максимум"
L["stat.recoilmaximum.desc"] = "Upper limit to bloom caused by continuous firing."
L["stat.recoilfirstshot"] = "Начало"
L["stat.recoilfirstshot.desc"] = "Bloom multiplier when firing the first shot.\nApplies when there is no accumulated bloom."
L["stat.recoilpershot"] = "Мощность"
L["stat.recoilpershot.desc"] = "How much bloom is added per shot."
L["stat.recoilcrouch"] = "Отдача сидя"
L["stat.recoilcrouch.desc"] = "Recoil multiplier when crouched and not moving."
L["stat.movespeed"] = "Скорость передвиж."
L["stat.movespeed.desc"] = "Speed multiplier while the weapon is held up.\nDoes not slow when weapon is in safety."
L["stat.shootingspeed"] = "Стрельба"
L["stat.shootingspeed.desc"] = "Speed multiplier from firing the weapon.\nAccumulating recoil increases slowdown intensity."
L["stat.sightedspeed"] = "В прицеле"
L["stat.sightedspeed.desc"] = "Speed multiplier while aiming the weapon."
L["stat.reloadspeed"] = "Перезарядка"
L["stat.reloadspeed.desc"] = "Speed multiplier while reloading."
L["stat.meleespeed"] = "Ближний бой"
L["stat.meleespeed.desc"] = "Speed multiplier while melee attacking."
L["stat.reloadtime"] = "Перезарядка"
L["stat.reloadtime.desc"] = "Amount of time required to perform a reload."
L["stat.deploytime"] = "Готовность"
L["stat.deploytime.desc"] = "Amount of time required to bring up the weapon."
L["stat.holstertime"] = "Скрытие"
L["stat.holstertime.desc"] = "Amount of time required to put the weapon away."
L["stat.sway"] = "Пошатывание"
L["stat.sway.desc"] = "Amount of sway in hipfire. Sway affects your firing direction\nwithout changing your aiming direction."
L["stat.scopedsway"] = "В прицеле"
L["stat.scopedsway.desc"] = "Amount of sway while aiming. Sway affects your firing direction\nwithout changing your aiming direction."
L["stat.swaycrouch"] = "Положение сидя"
L["stat.swaycrouch.desc"] = "Sway multiplier when crouched."
L["stat.midairspread"] = "В воздухе"
L["stat.midairspread.desc"] = "Amount of inaccuracy caused by not standing on solid ground.\nApplied at half intensity while swimming and climbing ladders."
L["stat.hipfirespread"] = "Разброс от бедра"
L["stat.hipfirespread.desc"] = "Amount of inaccuracy present when hip-firing."
L["stat.movespread"] = "При движении"
L["stat.movespread.desc"] = "Amount of inaccuracy present when moving.\nIntensity is related to current speed."
L["stat.meleedamage"] = "Урон ближней атакой"
L["stat.meleedamage.desc"] = "Damage dealt when melee attacking."
L["stat.firemode"] = "Режим стрельбы"
L["stat.firemode.desc"] = "The weapon's firing capabilities."
L["stat.freeaimangle"] = "Free Aim Angle"
L["stat.freeaimangle.desc"] = "Maximum amount of deviation from the aim direction while hipfiring."
L["stat.shotstofail"] = "Выстрелы до клина"
L["stat.shotstofail.desc"] = "The average number of shots that will be fired before the weapon jams."

L["stat.meleeperkstr"] = "Сила"
L["stat.meleeperkstr.desc"] = "Melee attribute influencing Techniques and Specials.\nAffects perk damage and knockback."
L["stat.meleeperkagi"] = "Ловкость"
L["stat.meleeperkagi.desc"] = "Melee attribute influencing Techniques and Specials.\nAffects perk movement power and attack interval."
L["stat.meleeperkint"] = "Стратегия"
L["stat.meleeperkint.desc"] = "Melee attribute influencing Techniques and Specials.\nAffects perk recharge speed and projectile force."

L["rating.meleeattacktime"] = "Спешка"
L["rating.meleeattacktime.desc"] = "Как быстро оружие может атаковать."
L["stat.damage.desc_melee"] = "Damage dealt by primary attacks." -- used on melee damage
L["stat.meleeattacktime"] = "Скорость атаки"
L["stat.meleeattacktime.desc"] = "Промежуток времени между каждой атакой, если она во что-то попадает."
L["stat.meleeattackmisstime"] = "Промазывание"
L["stat.meleeattackmisstime.desc"] = "Промежуток времени между каждой атакой, если она ни во что не попала."
L["stat.meleerange"] = "Дальность атаки"
L["stat.meleerange.desc"] = "Как далеко оружие может дотянуться для атаки."
L["stat.meleedelay"] = "Замах атаки"
L["stat.meleedelay.desc"] = "Задержка между началом атаки и концом."

L["stat.melee2damage"] = "Damage (H)"
L["stat.melee2damage.desc"] = "Damage dealt by heavy attacks."
L["stat.melee2attacktime"] = "Melee Attack Delay (H)"
L["stat.melee2attacktime.desc"] = "Amount of time between each heavy attack if it hit something."
L["stat.melee2attackmisstime"] = "Melee Miss Delay (H)"
L["stat.melee2attackmisstime.desc"] = "Amount of time between each heavy attack if it didn't hit anything."
L["stat.meleethrowdamage"] = "Damage (Throw)"
L["stat.meleethrowdamage.desc"] = "Damage dealt by thrown weapons."
L["stat.meleethrowvelocity"] = "Throw Velocity"
L["stat.meleethrowvelocity.desc"] = "Travel speed of thrown weapons."
L["stat.meleethrowtime"] = "Throw Delay"
L["stat.meleethrowtime.desc"] = "Amount of time between each weapon throw."
L["stat.lifesteal"] = "Health From Damage"
L["stat.lifesteal.desc"] = "Fraction of damage dealt that is converted into health."
L["stat.damagecharge"] = "Charge From Damage"
L["stat.damagecharge.desc"] = "Fraction of damage dealt that is converted into perk charge."

L["stat.damage"] = "Damage"
L["stat.damage.desc"] = "Damage per bullet at all ranges."
L["stat.damage_max"] = "Close Range Damage"
L["stat.damage_max.desc"] = "Damage per bullet at no range falloff or rampup."
L["stat.damage_min"] = "Long Range Damage"
L["stat.damage_min.desc"] = "Damage per bullet at maximum range falloff or rampup."
L["stat.explosivedamage"] = "Explosive Damage"
L["stat.explosivedamage.desc"] = "Damage dealt by an explosion on bullet impact."
L["stat.explosiveradius"] = "Explosive Radius"
L["stat.explosiveradius.desc"] = "Blast radius of the explosion on bullet impact."
L["stat.range_max"] = "Maximum Range"
L["stat.range_max.desc"] = "Distance at which range falloff or rampup maxes out."
L["stat.range_min"] = "Minimum Range"
L["stat.range_min.desc"] = "Distance at which range falloff or rampup starts."
L["stat.postburstdelay"] = "Burst Delay"
L["stat.postburstdelay.desc"] = "Time required for the weapon to reset between bursts."
L["stat.ammopershot"] = "Потребление боеприпасов за выстрел"
L["stat.ammopershot.desc"] = "Amount of ammo consumed per shot."
L["stat.num"] = "Bullet Count"
L["stat.num.desc"] = "Amount of bullets fired per shot."
L["stat.peekpenalty"] = "Peeking Penalty"
L["stat.peekpenalty.desc"] = "Amount of hipfire spread and sway applied while peeking."
L["stat.quickscope"] = "Quickscope Penalty"
L["stat.quickscope.desc"] = "Amount of inaccuracy applied while switching in and out of aiming.\nPenalty fades away over 0.2 seconds."
L["stat.vol_shoot"] = "Loudness"
L["stat.vol_shoot.desc"] = "How audible the weapon's firing sound is."
L["stat.damagemultnpc"] = "NPC Damage"
L["stat.damagemultnpc.desc"] = "Non-melee damage against NPCs and Nextbots is multiplied by this value."

-- not in stats page but attachments may use
L["stat.swaycrouch"] = "Crouched Sway"
L["stat.recoil"] = "Отдача"
L["stat.range"] = "Дальность"
L["stat.blindfiresway"] = "Blindfire Sway"
L["stat.zoom"] = "Aim Zoom"
L["stat.bloomintensity"] = "Bloom Intensity"

L["att.none"] = "N/A"

L["att.procon.3proj"] = "Три снаряда"
L["att.procon.moreproj"] = "Больше снарядов"
L["att.procon.lessproj"] = "Мало снарядов"
L["att.procon.1proj"] = "Один снаряд"
L["att.procon.noexp"] = "Отсутствует взрыв"
L["att.procon.direct"] = "Прямой огонь"
L["att.procon.doorbreach"] = "Может выбить дверь"
L["att.procon.crowd"] = "Контроль над толпой"
L["att.procon.nonlethal"] = "Нелетельный"
L["att.procon.detdelay"] = "Замедленный взрыв"
L["att.procon.flash"] = "Светошумовой эффект"
L["att.procon.airburst"] = "Взрыв в воздухе"
L["att.procon.timedfuse"] = "Предохранитель с таймером"
L["att.procon.smoke"] = "Эффект дымовой завесы"
L["att.procon.limb"] = "Урон по конечностям"
L["att.procon.head"] = "Урон в голову"
L["att.procon.chest"] = "Урон в грудь"
L["att.procon.onebullet"] = "Одна пуля"
L["att.procon.armor"] = "Эффективность против брони"
L["att.procon.nosafety"] = "Никакого предохранителя"
L["att.procon.radius"] = "Ударная волна"
L["att.procon.needprime"] = "Weak if not primed"
L["att.procon.projrng"] = "Непредвиденная траектория и урон"
L["att.procon.failrng"] = "Шанс драматического конца"
L["att.procon.notracer"] = "Hidden Tracers"
L["att.procon.refund"] = "High chance to refund ammo"
L["att.procon.unreliable"] = "Unreliable"
L["att.procon.surplusboost1"] = "Sometimes shoots faster"
L["att.procon.surplusboost2"] = "Also shoots uncontrollably"
L["att.procon.meleeslow"] = "Slow target on melee hit"
L["att.procon.gasimmune"] = "CS Gas immunity"
L["att.procon.flashresist"] = "Flashbang resistance"
L["att.procon.stunresist"] = "Reduced stun/slow duration"
L["att.procon.quickthrow"] = "Faster Quickthrow"
L["att.procon.throwrocks"] = "Throw Rocks"
L["att.procon.cornershot"] = "Corner vision when blindfiring"
L["att.procon.thermal"] = "Thermal overlay when peeking"
L["att.procon.dmic"] = "Display nearby targets"
L["att.procon.audible"] = "Audible to others"
L["att.procon.flashlight"] = "Light up area"
L["att.procon.blind"] = "Blinds when looked at"
L["att.procon.visible"] = "Visible to others"
L["att.procon.laser"] = "Highlight point of aim"
L["att.procon.rf1"] = "Display distance and damage at range"
L["att.procon.rf2"] = "Bullet drop visualization in sights"
L["att.procon.gauge1"] = "Display bloom, sway and spread"
L["att.procon.gauge2"] = "Spread visualization in sights"
L["att.procon.auto"] = "Автоматический огонь"
L["att.procon.burst"] = "Огонь очередью"
L["att.procon.semi"] = "Огонь одиночным режимом"
L["att.procon.autoburst"] = "Автоматический огонь очередью"
L["att.procon.explosive"] = "Explosive"
L["att.procon.reliability"] = "Reliability"
L["att.procon.noscope"] = "No Scope"
L["att.procon.conceal"] = "Hide weapon while holstered"
L["att.procon.armdelay"] = "Arming Delay"
L["att.procon.proxfuse"] = "Proximity fuse"
L["att.procon.magnifier"] = "Variable Magnification"
L["att.procon.needscope"] = "Requires Optic"
L["att.procon.bullet"] = "Emergency Bullet"
L["att.procon.nopartialreloads"] = "No partial reloads"
L["att.procon.incendiary"] = "Ignite Targets"
L["att.procon.blurpeek"] = "Blur when peeking"
L["att.procon.aimrecoil"] = "Recoil (while aiming)"
L["att.procon.aimspread"] = "Spread (while aiming)"
L["att.procon.aimrpm"] = "Fire Rate (while aiming)"
L["att.procon.firstround"] = "First shot is a single less-lethal projectile"
L["att.procon.locktime"] = "Lock-on time"
L["att.procon.semiactive"] = "Constant guidance required"
L["att.procon.proj.turn"] = "Projectile Maneuverability"
L["att.procon.proj.speed"] = "Projectile Top Speed"
L["att.procon.proj.direct"] = "Impact Damage"
L["att.procon.shovel"] = "Shoots shovels"
L["att.procon.heal"] = "Healing effect"
L["att.procon.infiniteammo"] = "Infinite Ammo"

L["att.sight.1"] = "1x Прицел"
L["att.sight.1.25"] = "1.25x Прицел"
L["att.sight.1.5"] = "1.5x Прицел"
L["att.sight.1.75"] = "1.75x Прицел"
L["att.zoom.2"] = "2x Кратность"
L["att.zoom.2.2"] = "2.2x Кратность"
L["att.zoom.3"] = "3x Кратность"
L["att.zoom.3.4"] = "3.4x Кратность"
L["att.zoom.3.5"] = "3.5x Кратность"
L["att.zoom.4"] = "4x Кратность"
L["att.zoom.5"] = "5x Кратность"
L["att.zoom.6"] = "6x Кратность"
L["att.zoom.8"] = "8x Кратность"
L["att.zoom.10"] = "10x Кратность"
L["att.zoom.12"] = "12x Кратность"

L["spacer.damage"] = "Конечный эффект"
L["spacer.damage.desc"] = "Статистика, связанная с наносимым оружием уроном и дальностью действия."
L["spacer.action"] = "Цикличность"
L["spacer.action.desc"] = "Статистика, связанная с циклом его использования."
L["spacer.ballistics"] = "Баллистика"
L["spacer.ballistics.desc"] = "Статистика, связанная с траекторией полета пули из оружия и воздействием на материальную часть."
L["spacer.recoilbloom"] = "Отдача и множитель"
L["spacer.recoilbloom.desc"] = "Статистика, связанная с ударной силой оружия и нестабильностью при длительной стрельбе."
L["spacer.mobility"] = "Скорость передвижения"
L["spacer.mobility.desc"] = "Статистика, связанная со скоростью передвижения при использовании оружия."
L["spacer.maneuvering"] = "Маневрированность"
L["spacer.maneuvering.desc"] = "Статистика, связанная с эффективностью оружия без использования прицела."
L["spacer.handling"] = "Эргономичность"
L["spacer.handling.desc"] = "Статистика, связанная с тем, насколько быстро оружие готовится к стрельбе."
L["spacer.sway"] = "Шаткость"
L["spacer.sway.desc"] = "Статистика, связанная с отклонением оружия от точки прицеливания."
L["spacer.misc"] = "Разные"
L["spacer.misc.desc"] = "Статистика, которая не относится ни к одной из основных категорий."

L["trivia.year"] = "Год выпуска"
L["trivia.caliber"] = "Калибр"
L["trivia.manufacturer"] = "Производитель"
L["trivia.faction"] = "Фракция"
L["trivia.unknown"] = "Unknown"

L["faction.coalition"] = "Коалиция" -- "Counter-Terrorists"
L["faction.militia"] = "Милития" -- "Terrorists"
L["faction.neutral"] = "Безымянное" -- non-faction specific

L["menu.legacy"] = "Устаревшее меню"

L["hint.swap"] = "Поменять {weapon} на {weapon2}"
L["hint.pickup"] = "Поднять {weapon}"
L["hint.unjam"] = "Исправить неполадку"
L["hint.rp_biocode_cp"] = "Биокод - Используется только полицией"

L["hint.melee"] = "Удар прикладом"
L["hint.melee.block"] = "Блок"
L["hint.melee.throw"] = "Бросок"
L["hint.melee.light"] = "Быстрая атака"
L["hint.melee.heavy"] = "Тяжёлая атака"

L["hint.peek.hold"] = "Выглянуть"
L["hint.peek.toggle"] = "Заглянуть"
L["hint.hold_breath"] = "Задержать дыхание"
L["hint.customize"] = "Кастомизация"
L["hint.inspect"] = "Осмотреть"
L["hint.firemode"] = "Режим стрельбы"
L["hint.safety.turn_off"] = "Убрать с пред-ль"
L["hint.safety.turn_on"] = "Поставить на пред-ль"
L["hint.hl2_flashlight"] = "Фонарь костюма"
L["hint.toggle_tactical"] = "Перекл-ть {1}"
L["hint.blindfire"] = "Огонь вслепую"
L["hint.blindfire.menu"] = "Меню стрельбы"
L["hint.blindfire.up"] = "Стрельба вверх"
L["hint.blindfire.left"] = "Стрельба влево"
L["hint.blindfire.right"] = "Стрельба вправо"
L["hint.blindfire.cancel"] = "Отменить стрельбу"
L["hint.blindfire.kys"] = "Совершить суицид"
L["hint.quicknade.over"] = "Бросить вверх"
L["hint.quicknade.under"] = "Бросить под себя"
L["hint.quicknade.throw"] = "Бросить"
L["hint.quicknade.pull_out"] = "Бросить гранату"
L["hint.quicknade.menu"] = "Меню броска"
L["hint.quicknade.next"] = "Следующая граната"
L["hint.quicknade.prev"] = "Прошлая граната"
L["hint.ttt.radio"] = "TTT Radio"
L["hint.ttt.shop"] = "TTT Shop"
L["hint.tac"] = "Модуль" -- default value
L["hint.tac.radar"] = "радар"
L["hint.tac.flashlight"] = "фонарь"
L["hint.tac.laser"] = "указатель"
L["hint.tac.combo"] = "комбо"
L["hint.tac.rangefinder"] = "дальномер"
L["hint.tac.spread_gauge"] = "датчик"
L["hint.tac.magnifier"] = "увеличитель"
L["hint.tac.cam_mode"] = "Режим камеры" -- Used for both Corner-Cam and Thermal Imager
L["hint.tac.load_one"] = "Загрузить один патрон"

L["hint.melee_lunge"] = "Lunge"
L["hint.melee_step"] = "Airdash"
L["hint.melee_ninja.palm"] = "Palm Strike"
L["hint.melee_ninja.backhop"] = "Backhop"
L["hint.melee_ninja.divekick"] = "Divekick"

L["hint.medkit.self"] = "Лечить себя"
L["hint.medkit.others"] = "Лечить других"

L["hint.unlock"] = "Unlock"
L["hint.exitcustmenu"] = "Exit the Customization Menu"

L["hint.nogrenades"] = "No Grenades Available"

L["hint.hold"] = "(Hold)"

L["hint.shootself"] = "Выстрелить в себя"

-- For demoknight charge attachment
L["hint.melee_charge"] = "Charge"
L["hint.melee_charge.menu"] = "Charge Type"
L["hint.melee_charge.0.name"] = "Bravery"
L["hint.melee_charge.0.desc"] = "Standard mode with average turn control.\nBash into a target to deal damage and knockback. Attacking during the charge cancels it."
L["hint.melee_charge.1.name"] = "Mastery"
L["hint.melee_charge.1.desc"] = "Significantly increased turn control.\nLow damage resistance and bash damage.\nTaking damage shortens charge duration."
L["hint.melee_charge.2.name"] = "Tenacity"
L["hint.melee_charge.2.desc"] = "Increased charge speed, reduced turn control.\nVery high damage resistance and bash damage.\nGains knockback immunity during charge."

-- Weapon calibers
L["caliber.556x45"] = "5.56×45mm"
L["caliber.762x39"] = "7.62×39mm"
L["caliber.762x51"] = "7.62×51mm"
L["caliber.50bmg"] = ".50 BMG"
L["caliber.16g"] = "16 Gauge"
L["caliber.12g"] = "12 Gauge"
L["caliber.40mmg"] = "40mm Grenades"
L["caliber.9x19"] = "9×19mm"
L["caliber.57x28"] = "FN 5.7×28mm"
L["caliber.45acp"] = ".45ACP"
L["caliber.380acp"] = ".380ACP"
L["caliber.homing"] = "Инфракрасная самонаводящаяся ракета"
L["caliber.40sw"] = ".40 S&W"
L["caliber.23x75"] = "23×75mmR"
L["caliber.223r"] = ".223 Remington"
L["caliber.46x30"] = "HK 4.6×30mm"
L["caliber.357"] = ".357 Magnum"
L["caliber.357sig"] = ".357 SIG"
L["caliber.6mm"] = "6mm Whisper"
L["caliber.40mmr"] = "40mm Ракеты"
L["caliber.32acp"] = ".32 ACP"
L["caliber.308"] = ".308 Winchecter"
L["caliber.65mm"] = "6.5mm Creedmoor"

L["caliber.44amp"] = ".44 AMP"
L["caliber.40x46"] = "40×46mm"
L["caliber.50ae"] = ".50 AE"
L["caliber.792x57"] = "7.92×57mm Mauser"
L["caliber.500sw"] = ".500 S&W Magnum"
L["caliber.22lr"] = ".22 LR"
L["caliber.38special"] = ".38 Special"
L["caliber.338"] = ".338 Lapua Magnum"
L["caliber.9x39"] = "9x39mm"

L["caliber.44p"] = ".44 Percussion"
L["caliber.300blk"] = ".300 Blackout"
L["caliber.9x18"] = "9×18mm"
L["caliber.4570"] = ".45-70 Govt."
L["caliber.9x21"] = "9x21mm IMI"
L["caliber.762x54"] = "7.62×54mmR"
L["caliber.762x25"] = "7.62×25mm Токарёв"
L["caliber.300winmag"] = ".300 Win Mag"

L["caliber.545x39"] = "5.45×39mm"

L["caliber.410b"] = ".410 Bore"
L["caliber.408ct"] = ".408 Cheyenne Tactical"
L["caliber.950jdj"] = ".950 JDJ"
L["caliber.600ne"] = ".600 Nitro Express"
L["caliber.83mmr"] = "83mm Ракеты"
L["caliber.25x40"] = "25×40mm"

L["caliber.44m"] = ".44 Magnum"
L["caliber.763x25"] = "7.63×25mm Mauser"
L["caliber.277sig"] = ".277 SIG Fury"
L["caliber.10auto"] = "10mm Auto"
L["caliber.75x55"] = "7.5×55mm"
L["caliber.44-40"] = ".44-40 WCF"

L["caliber.20g"] = "20 Gauge"
L["caliber.9wm"] = "9mm Win Mag"
L["caliber.44s"] = ".44 Special"
L["caliber.303b"] = ".303 British"
L["caliber.66mmr"] = "66mm Ракеты"
L["caliber.25mmf"] = "25mm Сигнальные ракеты"
L["caliber.270w"] = ".270 Winchester"

L["caliber.45s"] = ".45 Super"

L["unknown"] = "Unknown"


-- STL phrases are not needed for other languages. you can remove these when localizing
STL = {}
STL["tier.0"] = "5Value"
STL["tier.1"] = "4Consumer"
STL["tier.2"] = "3Security"
STL["tier.3"] = "2Operator"
STL["tier.4"] = "1Elite"
STL["tier.5"] = "0Exotic"

STL["tier.spec"] = "9Special"
STL["type.sidearm"] = "1Pistol"
STL["type.magnum_pistol"] = "2Magnum Pistol"
STL["type.machine_pistol"] = "3Machine Pistol"
STL["type.dual_pistol"] = "3Akimbo"
STL["type.submachine_gun"] = "3Submachine Gun"
STL["type.assault_rifle"] = "4Assault Rifle"
STL["type.machine_gun"] = "5Machine Gun"
STL["type.shotgun"] = "5Shotgun"
STL["type.sporter_carbine"] = "5Sporter"
STL["type.battle_rifle"] = "5Battle Rifle"
STL["type.dmr"] = "6Marksman Rifle"
STL["type.sniper_rifle"] = "7Sniper Rifle"
--STL["type.amr"] = "9Anti-Materiel Rifle"
STL["type.melee_sharp"] = "8Bladed Melee"
STL["type.melee_blunt"] = "8Blunt Melee"
STL["type.equipment"] = "9Equipment"
STL["type.throwable"] = "9Throwable"
STL["type.launcher"] = "6Launcher"
STL["type.special_weapon"] = "7Special Weapon"
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
STL["slot.melee_boost"] = "Boost"

STL["caliber.556x45"] = "5.56x45mm"
STL["caliber.762x39"] = "7.62x39mm"
STL["caliber.762x51"] = "7.62x51mm"
STL["caliber.50bmg"] = ".50 BMG"
STL["caliber.16g"] = "16 Gauge"
STL["caliber.12g"] = "12 Gauge"
STL["caliber.40mmg"] = "40mm Grenades"
STL["caliber.9x19"] = "9x19mm"
STL["caliber.57x28"] = "5.7x28mm"
STL["caliber.45acp"] = ".45 ACP"
STL["caliber.380acp"] = ".380 ACP"
STL["caliber.homing"] = "Infrared Homing Missile"
STL["caliber.40sw"] = ".40 S&W"
STL["caliber.23x75"] = "23x75mmR"
STL["caliber.223r"] = ".223 Remington"
STL["caliber.46x30"] = "4.6x30mm"
STL["caliber.357"] = ".357 Magnum"
STL["caliber.357sig"] = ".357 SIG"
STL["caliber.6mm"] = "6mm Whisper"
STL["caliber.40mmr"] = "40mm Rockets"
STL["caliber.32acp"] = ".32 ACP"
STL["caliber.308"] = ".308 Winchester"
STL["caliber.65mm"] = "6.5mm Creedmoor"

STL["caliber.44amp"] = ".44 AMP"
STL["caliber.40x46"] = "40x46mm"
STL["caliber.50ae"] = ".50 AE"
STL["caliber.792x57"] = "7.92x57mm Mauser"
STL["caliber.500sw"] = ".500 S&W Magnum"
STL["caliber.22lr"] = ".22 LR"
STL["caliber.38special"] = ".38 Special"
STL["caliber.338"] = ".338 Lapua Magnum"
STL["caliber.9x39"] = "9x39mm"

STL["caliber.44p"] = ".44 Percussion"
STL["caliber.300blk"] = ".300 Blackout"
STL["caliber.9x18"] = "9x18mm"
STL["caliber.4570"] = ".45-70 Govt."
STL["caliber.9x21"] = "9x21mm IMI"
STL["caliber.762x54"] = "7.62x54mmR"
STL["caliber.762x25"] = "7.62x25mm Tokarev"
STL["caliber.300winmag"] = ".300 Win Mag"

STL["caliber.545x39"] = "5.45x39mm"

STL["caliber.410b"] = ".410 Bore"
STL["caliber.408ct"] = ".408 Cheyenne Tactical"
STL["caliber.950jdj"] = ".950 JDJ"
STL["caliber.600ne"] = ".600 Nitro Express"
STL["caliber.83mmr"] = "83mm Rockets"
STL["caliber.25x40"] = "25x40mm"

STL["caliber.44m"] = ".44 Magnum"
STL["caliber.763x25"] = "7.63x25mm Mauser"
STL["caliber.277sig"] = ".277 SIG Fury"
STL["caliber.10auto"] = "10mm Auto"
STL["caliber.75x55"] = "7.5x55mm"
STL["caliber.44-40"] = ".44-40 WCF"

STL["caliber.20g"] = "20 Gauge"
STL["caliber.9wm"] = "9mm Win Mag"
STL["caliber.44s"] = ".44 Special"
STL["caliber.303b"] = ".303 British"
STL["caliber.66mmr"] = "66mm Rockets"
STL["caliber.25mmf"] = "25mm Flares"
STL["caliber.270w"] = ".270 Winchester"

STL["caliber.45s"] = ".45 Super"

STL["unknown"] = "Unknown"
