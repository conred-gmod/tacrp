L = {} -- Traditional Chinese

L["font.1"] = "Microsoft YaHei"
-- L["font.2"] = "HD44780A00 5x8"

L["tier.0"] = "5下等"
L["tier.1"] = "4零售"
L["tier.2"] = "3警备"
L["tier.3"] = "2特遣"
L["tier.4"] = "1精英"
L["tier.5"] = "0特异"

L["tier.spec"] = "9特殊"
L["type.sidearm"] = "1手枪"
L["type.magnum_pistol"] = "2马格南手枪"
L["type.machine_pistol"] = "3自动手枪"
L["type.dual_pistol"] = "3双枪"
L["type.submachine_gun"] = "3冲锋枪"
L["type.assault_rifle"] = "4突击步枪"
L["type.machine_gun"] = "5机枪"
L["type.shotgun"] = "5霰弹枪"
L["type.sporter_carbine"] = "5民用枪械"
L["type.battle_rifle"] = "5战斗步枪"
L["type.dmr"] = "6射手步枪"
L["type.sniper_rifle"] = "7狙击枪"
-- L["type.amr"] = "9Anti-Materiel Rifle" 
L["type.melee_sharp"] = "8刀刃近战武器"
L["type.melee_blunt"] = "8钝头近战武器"
L["type.equipment"] = "9装备"
L["type.throwable"] = "9投掷物"
L["type.launcher"] = "6发射器"
L["type.special_weapon"] = "7特殊武器"

-- L["type.precision_rifle"] = "精准步枪" -- Depreciated
-- L["type.melee_weapon"] = "近战武器" -- Depreciated

L["cust.rating"] = "评分"
L["cust.stats"] = "属性"
L["cust.description"] = "简介："
L["cust.type_tier"] = "{tier}{type}"
L["cust.trivia"] = "细节"
L["cust.credits"] = "作者"
L["cust.description2"] = "简介"
L["cust.drop_wep"] = "丢弃武器"
L["cust.drop_nade"] = "丢弃投掷物"


L["unit.hu"] = " HU"
L["unit.meter"] = "m"
L["unit.second"] = "s"
L["unit.persecond"] = "/s"
L["unit.mps"] = "m/s" -- meters per second
L["unit.damage"] = "伤害"
L["unit.stk"] = "发致命" -- shots to kill
L["unit.ptk"] = "颗致命" -- pellets to kill

L["slot.default"] = "槽位"
L["slot.optic"] = "瞄具"
L["slot.muzzle"] = "枪口"
L["slot.tactical"] = "战术"
L["slot.accessory"] = "附件"
L["slot.bolt"] = "枪栓"
L["slot.trigger"] = "扳机"
L["slot.ammo"] = "弹种"
L["slot.perk"] = "专长"
L["slot.melee_tech"] = "手法"
L["slot.melee_spec"] = "特技"

L["ammo.ti_flashbang"] = "闪光弹"
L["ammo.ti_thermite"] = "燃烧弹"
L["ammo.ti_smoke"] = "烟雾弹"
L["ammo.ti_c4"] = "C4炸药"
L["ammo.ti_gas"] = "毒气弹"
L["ammo.ti_nuke"] = "核装置"
L["ammo.ti_charge"] = "破门炸药"
L["ammo.ti_sniper"] = "反器材弹药"
L["ammo.ti_heal"] = "治疗弹"

L["rating.score"] = "（得分: {score}/{max}）"
L["rating.lethality"] = "爆发火力"
L["rating.lethality.desc"] = "武器快速消灭单个目标的能力。\n相关属性：伤害，射速。"
L["rating.suppression"] = "持续火力"
L["rating.suppression.desc"] = "武器持续输出伤害的能力。\n相关属性：伤害，射速，容量，装填耗时。"
L["rating.range"] = "有效射程"
L["rating.range.desc"] = "武器随距离增减保持伤害的能力。\n相关属性：射程，伤害衰落。"
L["rating.precision"] = "精准度"
L["rating.precision.desc"] = "武器单发或短点射时保持精准的能力。\n相关属性：散射，后坐力。"
L["rating.control"] = "可控度"
L["rating.control.desc"] = "武器持续开火时控制后坐力和保持精准的能力。\n相关属性：射速，后坐力。"
L["rating.handling"] = "手感"
L["rating.handling.desc"] = "武器快速进入准备状态的能力。\n相关属性：瞄准耗时，举起耗时，切换耗时。"
L["rating.maneuvering"] = "机动性"
L["rating.maneuvering.desc"] = "武器不瞄准时保持精准的能力。\n相关属性：腰射散射，空中散射，自由准心，摇晃。"
L["rating.mobility"] = "总体移速"
L["rating.mobility.desc"] = "使用武器时保持移动速度的能力。\n相关属性：各类移动属性。"
L["rating.stability"] = "稳定性"
L["rating.stability.desc"] = "武器瞄准点的随机移动程度。\n相关属性：各类摇晃属性。"

L["stat.table.stat"] = "属性名"
L["stat.table.base"] = "基础值"
L["stat.table.curr"] = "当前值"
L["stat.table.diff"] = "差别"

L["stat.raw_dps"] = "每秒伤害（理想值）"
L["stat.raw_dps.desc"] = "推算得出的，武器每秒能打出的最高伤害。\n不计算头部和肢体伤害倍率。"
L["stat.min_ttk"] = "击杀耗时（理想值）"
L["stat.min_ttk.desc"] = "推算得出的，武器击杀目标需要的最低时间。\n假设目标无护甲，生命值等同于你的生命上限。\n不计算头部和肢体伤害倍率。"
L["stat.armorpenetration"] = "护甲穿透率"
L["stat.armorpenetration.desc"] = "击中护甲时对人体伤害的倍数。\n更高的值表示对护甲的伤害更少，对人体的伤害更大。\n在100%时，护甲会被完全忽略。在0%时，护甲会阻挡所有伤害。"
L["stat.armorbonus"] = "护甲粉碎率"
L["stat.armorbonus.desc"] = "击中护甲时对护甲伤害的倍数。\n高穿透武器的大部分伤害将直接作用于人体\n如果穿透力为100%，将不会对护甲造成伤害。"
L["stat.penetration"] = "物体穿透度"
L["stat.penetration.desc"] = "该武器可射穿的金属厚度。\n根据材质类型，实际穿透厚度会有所不同。"
L["stat.spread"] = "扩散"
L["stat.spread.desc"] = "枪械的基础准确度。"
L["stat.rpm"] = "射速"
L["stat.rpm.desc"] = "枪械的射速，以每分钟子弹量为单位。"
L["stat.rpm_burst"] = "射速（点射）"
L["stat.rpm_burst.desc"] = "点射模式下武器的射速。"
L["stat.rpm_semi"] = "射速（半自动）"
L["stat.rpm_semi.desc"] = "半自动模式下武器的射速。"
L["stat.rpm_burst_peak"] = "射速（点射极限）"
L["stat.rpm_burst_peak.desc"] = "点射模式下的平均射速（算上开火间隔）。"
L["stat.clipsize"] = "载弹量"
L["stat.clipsize.desc"] = "枪械一次可容纳的弹药量。"
L["stat.sprinttofire"] = "急停时间"
L["stat.sprinttofire.desc"] = "玩家从冲刺移动到能够正常开火所需的时间。"
L["stat.aimdownsights"] = "开镜时间"
L["stat.aimdownsights.desc"] = "玩家从腰射到开镜所需的时间。"
L["stat.muzzlevelocity"] = "子弹初速"
L["stat.muzzlevelocity.desc"] = "子弹在游戏中的飞行速度。\n还可以控制射程值，低于这个值，子弹就会变成命中率。"
L["stat.recoilkick"] = "后坐力强度"
L["stat.recoilkick.desc"] = "移动视角位置的后坐力强度。"
L["stat.recoilstability"] = "后坐力稳定性"
L["stat.recoilstability.desc"] = "后坐力的可控能力。\n稳定性 100% 时后坐力完全垂直。\n稳定性 0% 时后坐力方向为 180° 半圆。"
L["stat.recoilspread"] = "散射强度"
L["stat.recoilspread.desc"] = "每单位散射导致的不准确度。\n较大的数值意味着枪械会在连续射击时变得更不准确。"
L["stat.recoilspread2"] = "散射强度"
L["stat.recoilspread2.desc"] = "每单位散射导致的额外后坐力。\n较大的数值意味着枪械会在连续射击时后坐力变高。"
L["stat.recoildissipation"] = "散射复位速率"
L["stat.recoildissipation.desc"] = "积累后坐力释放速度。\n较大的数值意味着后坐力在复位时间后影响更快消失。"
L["stat.recoilresettime"] = "散射复位延迟"
L["stat.recoilresettime.desc"] = "后坐力开始消散前的延迟时间。\n较大的数值意味着你必须在两次射击之间要等待更长时间，后坐力影响才会开始复位。"
L["stat.recoilmaximum"] = "最大散射"
L["stat.recoilmaximum.desc"] = "连续射击造成的后坐力的上限。"
L["stat.recoilfirstshot"] = "首枪散射倍率"
L["stat.recoilfirstshot.desc"] = "连续射击时第一枪的后坐力倍率。在所有后坐力复位后重置。\n不影响视觉后坐力。"
L["stat.recoilpershot"] = "散射增速"
L["stat.recoilpershot.desc"] = "每一枪增加多少单位的后坐力，通常是1。\n较大的数值会更快地增加不准确度，也需要更长的时间来恢复。"
L["stat.recoilcrouch"] = "蹲伏后坐力率"
L["stat.recoilcrouch.desc"] = "蹲下不动时的后坐力倍率。"
L["stat.movespeed"] = "移动速度"
L["stat.movespeed.desc"] = "当枪械被举起时的移速倍率。当武器处于保险状态时将不会减速。"
L["stat.shootingspeed"] = "射击时移动速度"
L["stat.shootingspeed.desc"] = "射击时的移速倍率。\n后坐力的积累会增加减速强度。"
L["stat.sightedspeed"] = "开镜时移动速度"
L["stat.sightedspeed.desc"] = "开镜时的移速倍率。"
L["stat.reloadspeed"] = "换弹时移动速度"
L["stat.reloadspeed.desc"] = "换弹时的移速倍率。"
L["stat.meleespeed"] = "近战时移动速度"
L["stat.meleespeed.desc"] = "近战攻击时的移速倍率。"
L["stat.reloadtime"] = "换弹时间"
L["stat.reloadtime.desc"] = "换弹所需的时间。"
L["stat.deploytime"] = "切枪时间"
L["stat.deploytime.desc"] = "切换枪械所需的时间。"
L["stat.holstertime"] = "收枪时间"
L["stat.holstertime.desc"] = "放下枪械所需的时间。"
L["stat.sway"] = "晃动"
L["stat.sway.desc"] = "腰射时的武器晃动。\n晃动会影响你的枪械射击方向，但不会改变你的准星方向。"
L["stat.scopedsway"] = "瞄准晃动"
L["stat.scopedsway.desc"] = "瞄准时的武器晃动。\n散射会影响你的枪械射击方向，但不会改变你的准星方向。"
L["stat.swaycrouch"] = "蹲伏晃动"
L["stat.swaycrouch.desc"] = "蹲下不动时的武器晃动。\n散射会影响你的枪械射击方向，但不会改变你的准星方向。"
L["stat.midairspread"] = "跳射散射"
L["stat.midairspread.desc"] = "在空中的额外散射。"
L["stat.hipfirespread"] = "腰射散射"
L["stat.hipfirespread.desc"] = "不瞄准时武器的额外散射。"
L["stat.movespread"] = "移动散射"
L["stat.movespread.desc"] = "移动时武器的额外散射.\n散射和移动速度有关联。"
L["stat.meleedamage"] = "近战伤害"
L["stat.meleedamage.desc"] = "近战攻击造成的伤害。"
L["stat.firemode"] = "射击模式"
L["stat.firemode.desc"] = "枪械的射击模式。"
L["stat.freeaimangle"] = "自由瞄准角度"
L["stat.freeaimangle.desc"] = "腰射时与瞄准方向的最大偏差量。"
L["stat.shotstofail"] = "平均卡壳率"
L["stat.shotstofail.desc"] = "在枪械卡壳之前的能正常击发的平均击发次数。"


L["stat.damage"] = "伤害"
L["stat.damage.desc"] = "武器所有距离下的伤害。"
L["stat.damage_max"] = "近距离伤害"
L["stat.damage_max.desc"] = "最低射程下的武器伤害。"
L["stat.damage_min"] = "远距离伤害"
L["stat.damage_min.desc"] = "极限射程下的武器伤害。"
L["stat.explosivedamage"] = "爆炸伤害"
L["stat.explosivedamage.desc"] = "子弹爆炸时造成的额外伤害。"
L["stat.explosiveradius"] = "爆炸范围"
L["stat.explosiveradius.desc"] = "子弹爆炸时的有效范围。"
L["stat.range_max"] = "最大射程"
L["stat.range_max.desc"] = "武器极限射程的距离。"
L["stat.range_min"] = "最小射程"
L["stat.range_min.desc"] = "武器不受射程影响的距离。"
L["stat.postburstdelay"] = "点射延迟"
L["stat.postburstdelay.desc"] = "武器点射后需要等待的时间。"
L["stat.ammopershot"] = "弹药消耗"
L["stat.ammopershot.desc"] = "每次开火使用的弹药量。"
L["stat.num"] = "子弹量"
L["stat.num.desc"] = "开火时射出的子弹数量。"
L["stat.peekpenalty"] = "半瞄准效率"
L["stat.peekpenalty.desc"] = "半瞄准时附加的腰射散射和摇晃强弱。"
L["stat.quickscope"] = "快瞄散射"
L["stat.quickscope.desc"] = "切换瞄准时的临时散射。\n散射在 0.2 瞄内逐渐消失。"
L["stat.damagemultnpc"] = "NPC 伤害倍率"
L["stat.damagemultnpc.desc"] = "武器对非玩家角色的伤害倍率（不包括近战）。"

-- not in stats page but attachments may use
L["stat.swaycrouch"] = "蹲伏扩散"
L["stat.recoil"] = "后坐力"
L["stat.range"] = "射程"
L["stat.vol_shoot"] = "击发噪音"
L["stat.blindfiresway"] = "盲射扩散"
L["stat.zoom"] = "瞄准变焦"
L["stat.peekpenalty"] = "精准腰射精度"
L["stat.bloomintensity"] = "散射强度"

-- L["att.none"] = "N/A"

L["att.procon.3proj"] = "三颗弹头"
L["att.procon.moreproj"] = "更多弹头"
L["att.procon.lessproj"] = "更少弹头"
L["att.procon.1proj"] = "一颗弹头"
L["att.procon.noexp"] = "无爆炸"
L["att.procon.direct"] = "直射开火"
L["att.procon.doorbreach"] = "可破门"
L["att.procon.crowd"] = "范围控制"
L["att.procon.nonlethal"] = "非致命"
L["att.procon.detdelay"] = "延迟引爆"
L["att.procon.flash"] = "闪光眩晕效果"
L["att.procon.airburst"] = "空中爆破"
L["att.procon.timedfuse"] = "定时引爆"
L["att.procon.smoke"] = "烟雾弹效果"
L["att.procon.limb"] = "肢体伤害"
L["att.procon.head"] = "爆头伤害"
L["att.procon.chest"] = "上身伤害"
L["att.procon.onebullet"] = "一颗子弹"
L["att.procon.armor"] = "对甲效果"
L["att.procon.nosafety"] = "无安全距离"
L["att.procon.radius"] = "爆炸范围"
L["att.procon.needprime"] = "未起爆时很弱"
L["att.procon.projrng"] = "弹道和伤害带有随机性"
L["att.procon.failrng"] = "有概率发生戏剧性意外"
L["att.procon.notracer"] = "隐藏弹道"
L["att.procon.refund"] = "大概率返还弹药"
L["att.procon.unreliable"] = "不可靠"
L["att.procon.surplusboost1"] = "偶尔提升射速"
L["att.procon.surplusboost2"] = "提升射速时扳机失控"
L["att.procon.meleeslow"] = "减速近战击中的目标"
L["att.procon.gasimmune"] = "免疫毒气伤害"
L["att.procon.flashresist"] = "提升闪光弹抗性"
L["att.procon.stunresist"] = "减少眩晕/减速持续时间"
L["att.procon.quickthrow"] = "更快的快速投掷"
L["att.procon.throwrocks"] = "投掷石块"
L["att.procon.cornershot"] = "盲射时显示枪口视角"
L["att.procon.thermal"] = "半瞄准时开启热成像显示"
L["att.procon.dmic"] = "显示附近的目标"
L["att.procon.audible"] = "发出声响"
L["att.procon.flashlight"] = "照明前方区域"
L["att.procon.blind"] = "致盲正在看它的人"
L["att.procon.visible"] = "对他人可见"
L["att.procon.laser"] = "突出瞄准点"
L["att.procon.rf1"] = "显示射程的距离和伤害"
L["att.procon.rf2"] = "在开镜时可视化子弹落点"
L["att.procon.gauge1"] = "显示后坐力、水平后坐力和扩散"
L["att.procon.gauge2"] = "在开镜时可视化扩散"
L["att.procon.auto"] = "全自动射击"
L["att.procon.burst"] = "三连发射击"
L["att.procon.semi"] = "半自动射击"
L["att.procon.autoburst"] = "全自动点射"
L["att.procon.explosive"] = "爆炸效果"
L["att.procon.reliability"] = "可靠度"
L["att.procon.noscope"] = "无瞄具"
L["att.procon.conceal"] = "武器收起时不可见"
L["att.procon.armdelay"] = "起爆延迟"
L["att.procon.proxfuse"] = "近炸引信"
L["att.procon.magnifier"] = "可变焦缩放"
L["att.procon.needscope"] = "需要瞄具才有效"
L["att.procon.bullet"] = "紧急装填"
L["att.procon.nopartialreloads"] = "无法半装填"
L["att.procon.incendiary"] = "点燃目标"
L["att.procon.blurpeek"] = "半瞄准时背景模糊"
L["att.procon.aimrecoil"] = "后坐力 (瞄准时)"
L["att.procon.aimspread"] = "精准度 (瞄准时)"
L["att.procon.aimrpm"] = "射速 (瞄准时)"
L["att.procon.firstround"] = "首发射出非致命弹头"
L["att.procon.locktime"] = "锁定时间"
L["att.procon.semiactive"] = "需要保持锁定"
L["att.procon.proj.turn"] = "飞弹机动性"
L["att.procon.proj.speed"] = "飞弹最高速度"
L["att.procon.proj.direct"] = "直击伤害"
L["att.procon.shovel"] = "发射铲子"
L["att.procon.heal"] = "治疗效果"

L["att.sight.1"] = "1倍缩放"
L["att.sight.1.25"] = "1.25倍缩放"
L["att.sight.1.5"] = "1.5倍缩放"
L["att.sight.1.75"] = "1.75倍缩放"
L["att.zoom.2"] = "2倍变焦"
L["att.zoom.3"] = "3倍变焦"
L["att.zoom.3.4"] = "3.4倍变焦"
L["att.zoom.3.5"] = "3.5倍变焦"
L["att.zoom.4"] = "4倍变焦"
L["att.zoom.5"] = "5倍变焦"
L["att.zoom.6"] = "6倍变焦"
L["att.zoom.8"] = "8倍变焦"
L["att.zoom.10"] = "10倍变焦"
L["att.zoom.12"] = "12倍变焦"

L["spacer.damage"] = "命中效果"
L["spacer.damage.desc"] = "有关武器伤害和射程的属性。"
L["spacer.action"] = "机能"
L["spacer.action.desc"] = "有关武器装填和上膛的属性。"
L["spacer.ballistics"] = "弹道"
L["spacer.ballistics.desc"] = "有关武器弹道和对材料伤害的属性。"
L["spacer.recoilbloom"] = "后坐力"
L["spacer.recoilbloom.desc"] = "有关武器后坐力以及连续开火的属性。"
L["spacer.mobility"] = "移速"
L["spacer.mobility.desc"] = "有关使用武器时移动速度的属性。"
L["spacer.maneuvering"] = "机动性"
L["spacer.maneuvering.desc"] = "有关武器不瞄准时命中难易的属性。"
L["spacer.handling"] = "操作速度"
L["spacer.handling.desc"] = "有关武器操作快慢的属性。"
L["spacer.sway"] = "晃动"
L["spacer.sway.desc"] = "有关武器晃动的属性。"
L["spacer.misc"] = "其它"
L["spacer.misc.desc"] = "不隶属与其他类别的属性。"

L["trivia.year"] = "生产年份"
L["trivia.caliber"] = "口径"
L["trivia.manufacturer"] = "生产商"
L["trivia.faction"] = "派系"
L["trivia.unknown"] = "未知"

L["faction.coalition"] = "联盟" -- "Counter-Terrorists"
L["faction.militia"] = "民兵" -- "Terrorists"
L["faction.neutral"] = "中立" -- non-faction specific

-- L["menu.legacy"] = "Legacy Menu"

L["hint.swap"] = "和 {weapon} 切换"
L["hint.pickup"] = "捡起 {weapon}"
L["hint.unjam"] = "解除卡弹"
L["hint.rp_biocode_cp"] = "警察专用"

L["hint.melee"] = "近战攻击"
L["hint.melee.block"] = "格挡"
L["hint.melee.throw"] = "近战投掷"
L["hint.melee.light"] = "近战轻击"
L["hint.melee.heavy"] = "近战重击"

L["hint.peek.hold"] = "半瞄准"
L["hint.peek.toggle"] = "切换半瞄准"
L["hint.hold_breath"] = "屏住呼吸"
L["hint.customize"] = "自定义武器"
L["hint.inspect"] = "检视武器"
L["hint.firemode"] = "切换火控"
L["hint.safety.turn_off"] = "解除保险"
L["hint.safety.turn_on"] = "开启保险"
L["hint.hl2_flashlight"] = "默认手电筒"
L["hint.toggle_tactical"] = "切换 {1}"
L["hint.blindfire"] = "盲射"
L["hint.blindfire.menu"] = "盲射菜单"
L["hint.blindfire.up"] = "向上盲射"
L["hint.blindfire.left"] = "向左盲射"
L["hint.blindfire.right"] = "向右盲射"
L["hint.blindfire.cancel"] = "解除盲射"
L["hint.blindfire.kys"] = "自杀"
L["hint.quicknade.over"] = "正手投掷"
L["hint.quicknade.under"] = "反手投掷"
L["hint.quicknade.throw"] = "快捷投掷"
L["hint.quicknade.pull_out"] = "切出手雷"
L["hint.quicknade.menu"] = "快捷投掷菜单"
L["hint.quicknade.next"] = "下个手雷"
L["hint.quicknade.prev"] = "上个手雷"
L["hint.ttt.radio"] = "TTT 无线电"
L["hint.ttt.shop"] = "TTT 商店"
L["hint.tac"] = "战术配件" -- default value
L["hint.tac.radar"] = "雷达"
L["hint.tac.flashlight"] = "手电筒"
L["hint.tac.laser"] = "镭射"
L["hint.tac.combo"] = "光瞄组合"
L["hint.tac.rangefinder"] = "测距仪"
L["hint.tac.spread_gauge"] = "扩散仪"
L["hint.tac.magnifier"] = "缩放"
L["hint.tac.cam_mode"] = "镜头模式" -- Used for both Corner-Cam and Thermal Imager
L["hint.tac.load_one"] = "装填单发子弹"

L["hint.melee_lunge"] = "飞扑"
L["hint.melee_step"] = "快步"
L["hint.melee_ninja.palm"] = "掌击"
L["hint.melee_ninja.backhop"] = "后跳"
L["hint.melee_ninja.divekick"] = "飞踢"

L["hint.medkit.self"] = "治疗自己"
L["hint.medkit.others"] = "治疗他人"

-- For demoknight charge attachment
L["hint.melee_charge"] = "冲锋"
L["hint.melee_charge.menu"] = "冲锋模式"
L["hint.melee_charge.0.name"] = "勇性"
L["hint.melee_charge.0.desc"] = "默认模式，转向速度平均。\n撞击目标造成伤害并击退。冲锋时攻击会取消冲刺。"
L["hint.melee_charge.1.name"] = "灵性"
L["hint.melee_charge.1.desc"] = "转向速度极高的冲刺模式。\n撞击强度和伤害抗性较低。\n冲刺时受伤会减短冲刺速度。"
L["hint.melee_charge.2.name"] = "韧性"
L["hint.melee_charge.2.desc"] = "冲刺速度更高，转向速度很低。\n撞击强度和伤害抗性较高。\n冲刺时免疫击退。"

-- used when tacrp_ammonames 1
L["ammo.357"] = "马格南弹药"
L["ammo.smg1"] = "卡宾枪弹药"
L["ammo.ar2"] = "步枪弹药"
