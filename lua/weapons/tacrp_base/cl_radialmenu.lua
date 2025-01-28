local function filledcircle(x, y, radius, seg)
    local cir = {}

    table.insert(cir, {
        x = x,
        y = y,
        u = 0.5,
        v = 0.5
    })

    for i = 0, seg do
        local a = math.rad((i / seg) * -360)

        table.insert(cir, {
            x = x + math.sin(a) * radius,
            y = y + math.cos(a) * radius,
            u = math.sin(a) / 2 + 0.5,
            v = math.cos(a) / 2 + 0.5
        })
    end

    local a = math.rad(0)

    table.insert(cir, {
        x = x + math.sin(a) * radius,
        y = y + math.cos(a) * radius,
        u = math.sin(a) / 2 + 0.5,
        v = math.cos(a) / 2 + 0.5
    })

    surface.DrawPoly(cir)
end

local function slicedcircle(x, y, radius, seg, ang0, ang1)
    local cir = {}

    ang0 = ang0 + 90
    ang1 = ang1 + 90

    local arcseg = math.Round(360 / math.abs(ang1 - ang0) * seg)

    table.insert(cir, {
        x = x,
        y = y,
        u = 0.5,
        v = 0.5
    })

    for i = 0, arcseg do
        local a = math.rad((i / arcseg) * -math.abs(ang1 - ang0) + ang0)

        table.insert(cir, {
            x = x + math.sin(a) * radius,
            y = y + math.cos(a) * radius,
            u = math.sin(a) / 2 + 0.5,
            v = math.cos(a) / 2 + 0.5
        })
    end

    surface.DrawPoly(cir)
end

SWEP.GrenadeMenuAlpha = 0
SWEP.BlindFireMenuAlpha = 0

TacRP.CursorEnabled = false

local currentnade
local currentind
local lastmenu
function SWEP:DrawGrenadeHUD()
    if !TacRP.ConVars["nademenu"]:GetBool() then return end
    if !self:IsQuickNadeAllowed() then return end

    -- adapted from tfa vox radial menu
    local nades = self:GetAvailableGrenades(false)
    local scrw = ScrW()
    local scrh = ScrH()
    local r = TacRP.SS(128)
    local r2 = TacRP.SS(40)
    local sg = TacRP.SS(32)
    local ri = r * 0.667
    local arcdegrees = 360 / math.max(1, #nades)
    local d = 360
    local ft = FrameTime()

    local cursorx, cursory = input.GetCursorPos()
    local mouseangle = math.deg(math.atan2(cursorx - scrw / 2, cursory - scrh / 2))
    local mousedist = math.sqrt(math.pow(cursorx - scrw / 2, 2) + math.pow(cursory - scrh / 2, 2))
    mouseangle = math.NormalizeAngle(360 - (mouseangle - 90) + arcdegrees)
    if mouseangle < 0 then
        mouseangle = mouseangle + 360
    end

    local iskeydown = self:GetOwner():KeyDown(self.GrenadeMenuKey)

    if self.GrenadeMenuKey == IN_GRENADE1 and !input.LookupBinding("+grenade1") then
        iskeydown = input.IsKeyDown(TacRP.GRENADE1_Backup)
    elseif self.GrenadeMenuKey == IN_GRENADE2 and !input.LookupBinding("+grenade2") then
        iskeydown = input.IsKeyDown(TacRP.GRENADE2_Backup)
    end

    if iskeydown and !self:GetPrimedGrenade() and self.BlindFireMenuAlpha == 0 and self:GetHolsterTime() == 0 then
        self.GrenadeMenuAlpha = math.Approach(self.GrenadeMenuAlpha, 1, 15 * ft)
        if !lastmenu then
            gui.EnableScreenClicker(true)
            TacRP.CursorEnabled = true
            lastmenu = true
        end

        if mousedist > r2 then
            local i = math.floor( mouseangle / arcdegrees ) + 1
            currentnade = nades[i]
            currentind = i
        else
            currentnade = self:GetGrenade()
            currentind = nil
        end
        self.GrenadeMenuHighlighted = currentind
    else
        self.GrenadeMenuAlpha = math.Approach(self.GrenadeMenuAlpha, 0, -10 * ft)
        if lastmenu then
            if !self:GetCustomize() then
                gui.EnableScreenClicker(false)
                TacRP.CursorEnabled = false
            end
            if currentnade then
                if currentnade.Index != self:GetGrenade().Index then
                    self:GetOwner():EmitSound("tacrp/weapons/grenade/roll-" .. math.random(1, 3) .. ".wav")
                end
                net.Start("tacrp_togglenade")
                net.WriteUInt(currentnade.Index, 4)
                net.WriteBool(false)
                net.SendToServer()
                self.Secondary.Ammo = currentnade.Ammo or "none"
            end
            lastmenu = false
        end
    end

    if self.GrenadeMenuAlpha <= 0 then
        return
    end

    local a = self.GrenadeMenuAlpha
    local col = Color(255, 255, 255, 255 * a)

    surface.DrawCircle(scrw / 2, scrh / 2, r, 255, 255, 255, a * 255)

    surface.SetDrawColor(0, 0, 0, a * 200)
    draw.NoTexture()
    filledcircle(scrw / 2, scrh / 2, r, 32)

    if #nades == 0 then
        local nadetext = TacRP:GetPhrase("hint.nogrenades")
        surface.SetFont("TacRP_HD44780A00_5x8_8")
        local nadetextw = surface.GetTextSize(nadetext)
        surface.SetTextPos(scrw / 2 - nadetextw * 0.5, scrh / 2 + TacRP.SS(6))
        surface.DrawText(nadetext)
        return
    end

    surface.SetDrawColor(150, 150, 150, a * 100)
    draw.NoTexture()
    if currentind then
        local i = currentind
        local d0 = 0 - arcdegrees * (i - 2)
        slicedcircle(scrw / 2, scrh / 2, r, 32, d0, d0 + arcdegrees)
    else
        filledcircle(scrw / 2, scrh / 2, r2, 32)
    end

    surface.SetDrawColor(0, 0, 0, a * 255)
    surface.DrawCircle(scrw / 2, scrh / 2, r2, 255, 255, 255, a * 255)

    for i = 1, #nades do
        local rad = math.rad( d + arcdegrees * 0.5 )

        surface.SetDrawColor(255, 255, 255, a * 255)
        surface.DrawLine(
            scrw / 2 + math.cos(math.rad(d)) * r2,
            scrh / 2 - math.sin(math.rad(d)) * r2,
            scrw / 2 + math.cos(math.rad(d)) * r,
            scrh / 2 - math.sin(math.rad(d)) * r)

        local nadex, nadey = scrw / 2 + math.cos(rad) * ri, scrh / 2 - math.sin(rad) * ri
        local nade = nades[i]

        local qty = nil --"INF"

        if nade.Singleton then
            qty = self:GetOwner():HasWeapon(nade.GrenadeWep) and 1 or 0
        elseif !TacRP.IsGrenadeInfiniteAmmo(nade.Index) then
            qty = self:GetOwner():GetAmmoCount(nade.Ammo)
        end

        if !qty or qty > 0 then
            surface.SetDrawColor(255, 255, 255, a * 255)
            surface.SetTextColor(255, 255, 255, a * 255)
        else
            surface.SetDrawColor(175, 175, 175, a * 255)
            surface.SetTextColor(175, 175, 175, a * 255)
        end

        if nade.Icon then
            surface.SetMaterial(nade.Icon)
            surface.DrawTexturedRect(nadex - sg * 0.5, nadey - sg * 0.5 - TacRP.SS(8), sg, sg)
        end
        local nadetext = TacRP:GetPhrase("quicknade." .. nade.PrintName .. ".name") or nade.PrintName
        surface.SetFont("TacRP_HD44780A00_5x8_8")
        local nadetextw = surface.GetTextSize(nadetext)
        surface.SetTextPos(nadex - nadetextw * 0.5, nadey + TacRP.SS(6))
        surface.DrawText(nadetext)

		if !TacRP.IsGrenadeInfiniteAmmo(nade.Index) then
			local qty
			if nade.Singleton then
				qty = self:GetOwner():HasWeapon(nade.GrenadeWep) and "x1" or "x0"
			else
				qty = "x" .. tostring(self:GetOwner():GetAmmoCount(nade.Ammo))
			end
			local qtyw = surface.GetTextSize(qty)
			surface.SetTextPos(nadex - qtyw * 0.5, nadey + TacRP.SS(15))
			surface.DrawText(qty)
		end

        d = d - arcdegrees

    end

    local nade = currentnade
    if nade.Icon then
        surface.SetMaterial(nade.Icon)
        surface.SetDrawColor(255, 255, 255, a * 255)
        surface.DrawTexturedRect(scrw / 2 - sg * 0.5, scrh / 2 - sg * 0.5 - TacRP.SS(8), sg, sg)
    end

    local nadetext = TacRP:GetPhrase("quicknade." .. nade.PrintName .. ".name") or nade.PrintName
    surface.SetFont("TacRP_HD44780A00_5x8_8")
    local nadetextw = surface.GetTextSize(nadetext)
    surface.SetTextPos(scrw / 2 - nadetextw * 0.5, scrh / 2 + TacRP.SS(6))
    surface.SetTextColor(255, 255, 255, a * 255)
    surface.DrawText(nadetext)

    if !TacRP.IsGrenadeInfiniteAmmo(nade.Index) then
        local qty
        if nade.Singleton then
            qty = self:GetOwner():HasWeapon(nade.GrenadeWep) and "x1" or "x0"
        else
            qty = "x" .. tostring(self:GetOwner():GetAmmoCount(nade.Ammo))
        end
        surface.SetFont("TacRP_HD44780A00_5x8_8")
        local qtyw = surface.GetTextSize(qty)
        surface.SetTextPos(scrw / 2 - qtyw * 0.5, scrh / 2 + TacRP.SS(16))
        surface.SetTextColor(255, 255, 255, a * 255)
        surface.DrawText(qty)
    end

    -- description box is blocked in customize
    if self:GetCustomize() then return end

    local w, h = TacRP.SS(96), TacRP.SS(164)
    local tx, ty = scrw / 2 + r + TacRP.SS(16), scrh / 2

    -- full name

    local name = TacRP:GetPhrase("quicknade." .. nade.PrintName .. ".name.full")  
	or TacRP:GetPhrase("quicknade." .. nade.PrintName .. ".name")  
	or nade.FullName 
	or nade.PrintName
    surface.SetFont("TacRP_Myriad_Pro_16")
    local name_w, name_h = surface.GetTextSize(name)
    if name_w > w then
        surface.SetFont("TacRP_Myriad_Pro_14")
        name_w, name_h = surface.GetTextSize(name)
        
        w = name_w + TacRP.SS(12)
    end
    surface.SetDrawColor(0, 0, 0, 200 * a)
    TacRP.DrawCorneredBox(tx, ty - h * 0.5 - TacRP.SS(28), w, TacRP.SS(24), col)
    surface.SetTextColor(255, 255, 255, a * 255)
    
    surface.SetTextPos(tx + w / 2 - name_w / 2, ty - h * 0.5 - TacRP.SS(28) + TacRP.SS(12) - name_h / 2)
    surface.DrawText(name)


    -- Description

    surface.SetDrawColor(0, 0, 0, 200 * a)
    TacRP.DrawCorneredBox(tx, ty - h * 0.5, w, h, col)

    surface.SetFont("TacRP_Myriad_Pro_8")
    surface.SetTextPos(tx + TacRP.SS(4), ty - h / 2 + TacRP.SS(2))
    surface.DrawText(	TacRP:GetPhrase("quicknade.fuse")	)

    surface.SetFont("TacRP_Myriad_Pro_8")
    surface.SetTextPos(tx + TacRP.SS(4), ty - h / 2 + TacRP.SS(10))
    surface.DrawText(TacRP:GetPhrase("quicknade." .. nade.PrintName .. ".dettype") or nade.DetType or "")

    surface.SetFont("TacRP_Myriad_Pro_8")
    surface.SetTextPos(tx + TacRP.SS(4), ty - h / 2 + TacRP.SS(22))
    surface.DrawText(	TacRP:GetPhrase("cust.description")	)

    surface.SetFont("TacRP_Myriad_Pro_8")

    if nade.Description then
        nade.DescriptionMultiLine = TacRP.MultiLineText(TacRP:GetPhrase("quicknade." .. nade.PrintName .. ".desc") or nade.Description or "", w - TacRP.SS(7), "TacRP_Myriad_Pro_8")
    end

    surface.SetTextColor(255, 255, 255, a * 255)
    for i, text in ipairs(nade.DescriptionMultiLine) do
        surface.SetTextPos(tx + TacRP.SS(4), ty - h / 2 + TacRP.SS(30) + (i - 1) * TacRP.SS(8))
        surface.DrawText(text)
    end

    surface.SetFont("TacRP_Myriad_Pro_8")
    surface.SetDrawColor(0, 0, 0, 200 * a)

    -- Only use the old bind hints if current hint is disabled
    if TacRP.ConVars["hints"]:GetBool() then
        self.LastHintLife = CurTime()
        return
    end

    if TacRP.ConVars["nademenu_click"]:GetBool() then

        local binded = input.LookupBinding("grenade1")

        TacRP.DrawCorneredBox(tx, ty + h * 0.5 + TacRP.SS(2), w, TacRP.SS(28), col)

        surface.SetTextPos(tx + TacRP.SS(4), ty + h / 2 + TacRP.SS(4))
        surface.DrawText( "[ " .. TacRP.GetBind("+attack") .. " ] " .. TacRP:GetPhrase("hint.quicknade.over") )
		
        surface.SetTextPos(tx + TacRP.SS(4), ty + h / 2 + TacRP.SS(12))
        surface.DrawText( "[ " .. TacRP.GetBind("+attack2") .. " ] " .. TacRP:GetPhrase("hint.quicknade.under") )
		
        if TacRP.AreTheGrenadeAnimsReadyYet then
            surface.SetTextPos(tx + TacRP.SS(4), ty + h / 2 + TacRP.SS(20))
			surface.DrawText( "[ MOUSE3 ] " .. TacRP:GetPhrase("hint.quicknade.pull_out") )
        end
    else
		local binded = input.LookupBinding("grenade1")

		if binded then button = TacRP.GetBind("grenade1") else button = "G" end

        TacRP.DrawCorneredBox(tx, ty + h * 0.5 + TacRP.SS(2), w, TacRP.SS(28), col)

        surface.SetTextPos(tx + TacRP.SS(4), ty + h / 2 + TacRP.SS(4))
        surface.DrawText("[ " ..button .. " ] " .. TacRP:GetPhrase("hint.quicknade.over") .. " " .. TacRP:GetPhrase("hint.hold") )
		
        surface.SetTextPos(tx + TacRP.SS(4), ty + h / 2 + TacRP.SS(12))
        surface.DrawText("[ " .. button .. " ] " .. TacRP:GetPhrase("hint.quicknade.under") )

        if TacRP.AreTheGrenadeAnimsReadyYet then
            surface.SetTextPos(tx + TacRP.SS(4), ty + h / 2 + TacRP.SS(20))
            surface.DrawText( "[ MOUSE3 ] " .. TacRP:GetPhrase("hint.quicknade.pull_out") )
        end
    end
end

local mat_none = Material("tacrp/blindfire/none.png", "smooth")
local mat_wall = Material("tacrp/blindfire/wall.png", "smooth")
local bf_slices = {
    {TacRP.BLINDFIRE_RIGHT, mat_wall, 270},
    {TacRP.BLINDFIRE_KYS, Material("tacrp/blindfire/suicide.png", "smooth"), 0},
    {TacRP.BLINDFIRE_LEFT, mat_wall, 90},
    {TacRP.BLINDFIRE_UP, mat_wall, 0},
}
local bf_slices2 = {
    {TacRP.BLINDFIRE_RIGHT, mat_wall, 270},
    {TacRP.BLINDFIRE_LEFT, mat_wall, 90},
    {TacRP.BLINDFIRE_UP, mat_wall, 0},
}
local bf_slices3 = {
    {TacRP.BLINDFIRE_RIGHT, mat_wall, 270},
    {TacRP.BLINDFIRE_NONE, mat_none, 0},
    {TacRP.BLINDFIRE_LEFT, mat_wall, 90},
    {TacRP.BLINDFIRE_UP, mat_wall, 0},
}
local lastmenu_bf
local bf_suicidelock
local bf_funnyline
local bf_lines = { -- Переведено: Svorcer <76561199157702911>
    "Давай посмотрим, будет ли меня волновать.",
    "Почему просто не бинд на kill.",
    "Но у тебя есть ещё ради чего жить!",
    "Как Есенин.",
    "...СЕЙЧАС ЖЕ!",
    "СДЕЛАЙ ЭТО!",
    "Теперь ЭТО реалистично.",
    "Увидимся в следующей жизни.",
    "Теперь можно получить со страховки.",
    "Не дай им насладиться.",
    "Почему-бы вместо этого не броситься с крыши?",
    "Пепперони на похороны",
    "F",
    "эу.",
    "У тебя НЕТ НИКАКОЙ ЦЕЛИ!",
    "Напиши в консоль unbindall",
    "Граждане не должны иметь оружие.",
    "Я решил это, я хочу умереть.",
    "Какой смысл?",
    "эх",
    "Не стоит",
    "Прямо как Гитлер.",
    "Убей своего заклятого врага.",
    "Вы попали в нужное место.",
    "Не забудь лайк и подписку",
    "неееееееееееееет",
    "База tfa хуйня лололололо",
    "HUD обязателен.",
    "Нет сучек?",
    "Теперь ты часть garry's mod",
    "Напиши 'tacrp_rock_funny 1' в консоль",
    "Эт0 пр0ст0 игра, ты всб3ш3н?",
    "И вот, конец.",
    "Самоубийство - это охуенно!",
    "Хватит на меня пялиться, сделай это!",
    "Тебе нравится целовать мальчиков, не так ли.",
    "Самое тактикульное решение.",
    "Хорошего тебе дня, пока!",
    "Попробуй это сделать с Dual MTX!",
    "Попробуй это сделать с РПГ-7!",
    "грустно",
    "Соверши головоломку",
    "Прыжок Кермита с крышы",
    "Ты можешь отключить эту кнопку в настройках.",
    "Прощай, жестокий мир!",
    "Адьёс!",
    "Сайонара, [------]!",
    "Классная лодка!",
    "Я нахожу это совершенно невообразимым!",
    "Удали system32.dll",
    "Нажми ALT+F4 чтобы получить админскую пушку",
    "АКА: Канадская аптечка",
    "Выход для труса",
    "Никто не живёт вечно.",
    "Прощай, жестокий мир.",
    "Админ тебя заморозит.",
    "Сделай, пока ты не отвернулся.",
    "Твой друг в HUD'е будет скучать по тебе.",
    "8-800-222-1407: Для помощи в кризисной и суицидальной ситуации.",
    "Гарантированная смерть или возврат твоих денег!",
    "Бесплатное восстановление HP",
    "Для лучшего результата, сделай это на публике.",
    "Ты что, петух?",
    "Только попробуй зассать!",
    "-1 очко",
    "Ты МОЖЕШЬ написать 'kill' в консоль.",
    "Знаете, еще до того, как все это началось, я и мой приятель Кит хватали пару 25-го калибра, писали крошечные пистолетики и по очереди спускались к реке, стреляя из них друг другу в лоб. Нам было чертовски больно, но мы решили, что если продолжим, то сможем пробиться к более крупным каллибрам, и в конечном итоге ничто больше не сможет нам навредить. Потом мы перешли к 22-у каллибру и… ну, скажем так, я не начал первым.",
    "Сколько ТЫ сможешь пережить хедшотов?",
    "Выстрели себе в бошку ЧЕЛЛЕНДЖ",
    "Единственный метод от админ-абуза.",
    "Попробуй это сделать с полицейским щитом!",
    "Жаль, что ты не можешь пережарить гранаты.",
    "Невероятно, что ты можешь пережить это.",
    "Научно-физическое самоубийство.",
    "Овцы идут в рай; ягнята идут в ад.",
    "Никто не впечатлится.",
    "У тебя РЕАЛЬНО крепкий череп.",
    "Подумай убрать за собой.",
    "Канадская версия медицины",
    "Всё решающий способ всех временных проблем",
    "И под конец, забери собой пару копов.",
    "Не позволь им взять тебя живым!",
    "Телепорт на спавн!",
    "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    "ГОЛОСА СКАЗАЛИ МНЕ СДЕЛАТЬ ЭТО",
    "Мир поней ждёт меня",
    "Сенпай-Грузовик отправит меня в Рай. Пушка-Сенпай отправит меня в ад.",
    "40,000 мужчин и женщин каждый день",
    "Это всё ТВОЯ вина!",
    "ТЫ заставил меня сделать это!",
    "Трипл-А качество геймдизайна",
    "Стримь это на Тик-Ток!",
    "Эта кнопка забанена РКН'ом",
    "Этично было ли это добавить? Нет. Но это было забавно.",
    "Написал потрясающую речь, не могу дождаться похорон.",
    "Я думаю, что для тебя будет закрытый гроб.",
    "Щитпост в форме аддона",
    "Веселее, чем кодить ARC9",
    "Последнее восстание против безразличного мира.",
    "Возможно, это шаг для эксплоита на бесконечные тугрики",
    "Ты ненастоящий геймер, пока не сделаешь это",
    "Мы называем это Детройтским телефоном",
    "Сделай Сальто!",
    "Сделай это для Вайна",
    "Покажи это своей матери",
    "Убить за себя - это убийство. Убить себя - это веселье.",
    "Это всё твоя вина.",
    "Жизнь начинает по ту сторону отчаяния.",
    "Ты всё ещё хорошая личность.",
    "Слухи о моём выживании сильно преувеличены.",
    "Домой? Мы не можем пойти домой.",
    "Что бы ни произошло, не будь к себе так строг.",
    "Здесь нет выхода.",
    "Ты действительно этого ждёшь, Уокер? Значит будет так.",
    "Мы называем это причёской Дьявола",
    "Раскрой своё сознание",
    "Тупые подростковые шутки для тупых поростков",
    "Веселье никогда не закончится",
    "Живые будут завидовать мёртвым",
    "Здесь только тьма.",
    "На том свете ничего нет.",
    "Значит так ты получаешь удовольствие?",
    "Не буду врать, вот что я чувствую, когда захожу на сервер и вижу M9K",
    "Зарегестрировать как попадание в голову",
    "Никаких тактических преимуществ",
    "Лучшее ещё впереди",
    "Я знаю что ты сделал, Микки.",
    "AMONG US AMONG US AMONG US AMONG US AMONG US AMONG US AMONG US AMONG US AMONG US AMONG US AMONG US AMONG US",
    "Что твоя жена подумает?",
    "Ты больше не увидишь её, ты знаешь об этом.",
    "ez",
    "Эу...Это было легко",
    "Настолько легко, что сложно об этом подумать",
    "Такие креветки...",
    "Ладно, я не буду пытаться тебя останавливать",
    "Отправь это своему любимому ютуберу",
    "ОСВОБОДИ ТЕЛО СВОЁ, ОСВОБОДИТЬ ДУШУ СВОЮ",
    "Самоубийство - это нелегально, потому-что ты наносишь ущерб собственности государства.",
    "ПОБЕГ ИЗ СИМУЛЯЦИИ",
    "Классический шизопостинг",
    "Увидимся в аду",
    "Человек, которого вы скорее всего убьёте, будете вы",
    "Здесь не будет второго выхода на сцену",
    "Ты можешь выбрать менее неряшливый способ?",
    "Прямо как Джеффри Эпштейн...*выдох*",
    "Враг. Стреляй в врага.",
    "Давай посмотрим, как ты это сделаешь на M9K",
    "Ты не сделаешь это, ты ссыкун.",
    "Ка-БУМ!",
    "ЗУП!",
    "Zycie jest bez sensu i wszyscy zginemy",
    "Нам действительно не стоит поощрять это.",
    "Ты никогда не увидишь все цитаты",
    "Когда дела идут тяжело, они только начинаются",
    "Острое церебральное отравление свинцом",
    "Эти пули пропитаны эстрогеном, ты знаешь об этом",
    "Гугл не справляется",
    "И дальше он пожертвовал... ИГРОКООООМ",
    "Ты должен вырасти и поменяться как личность",
    "Не оставляй меня </3",
    "Ньиоооом~",
    "Возьми старый ВАЗ.",
    "Сейчас это не так легко",
    "Ты никогда не доживёшь до того самого дня, когда TF2  получит обновление",
    "Иди, соверши самоубийство",
    "уфф",
    "早死早超生",
    "-800 социальных кредитов 干得好",
    "Всего хорошего, и спасибо за тактический реализм!",
    "КОНЦУ НИКОГДА КОНЦУ НИКОГДА КОНЦУ НИКОГДА КОНЦУ НИКОГДА КОНЦУ НИКОГДА КОНЦУ НИКОГДА КОНЦУ НИКОГДА КОНЦУ НИКОГДА КОНЦУ НИКОГДА КОНЦУ НИКОГДА",
    "Умереть девственником?",
    "ОШИБКА: Выход не найден.",
    "Сделай это, я смею",
    "Если вы это читаете, они меня закрыли в подвале и заставляют писать это, пожалуйста пришлите помощь.",
    "Это не меня закрыли с вами. Это вас закрыли со мной",
    "Остался последний патрон. Не для врага.",
    "Лучше сдаться.",
    "Такая красивая смерть.",
    "Увидимся позже. Подожди, вообще-то...",
    "Вам не понравится, что произойдёт дальше.",
    "Помни, что ты любим",
    "Кто отступит, того я пристрелю. Если кто-то получит ранение, спасения не будет. Я добью его.",
    "Я не собираюсь умирать. Я собираюсь понять, жив ли я.",
    "Приятной жизни.",
    "На одного убийцу меньше",
    "Нет доказельств того, что в России когда-либо играли в русскую рулетку",
    "У тебя нет чем можно заняться?",
    "Сделайте пред-заказ игры, чтобы увидеть релиз живым.",
    "Извини, мне просто сегодня не хочется",
    "Нет, пожалуйста. Не делай",
    "Если ты читаешь этот текст, то спасибо что ты есть, в последнее время я чувствую себя одиноко, но когда появилась возможность перевести эти 320~ строк, я почувствовал, что наконец-то стал полезным. Если бы не эта возможность, то я бы дальше грустил и задумался бы мыслями, которые я перевожу с английского, так что спасибо, что ты читаешь мои(Ну и переводчика) труды <3 !!!",
    "Слепо стрелять назад",
    "Наконец-то ты не промажешь",
    "И вот мой последний фокус...",
    "Забери свою жизнь,чтобы они не забрали твою.",
    "Никогда не наводите оружие на то, что вы не хотите уничтожить.",
    "Опусти пушку! Нет, выше...Вот, здесь мозжечок.",
    "Это будет больно, но только на мгновение.",
    "Боже мой, только представь, что будет если ты выживешь",
    "Такая напрасная трата жизни.",
    "Для меня это ничего не значило.",
    "Побег из матрицы",
    "Смерть будет большим приключением",
    "Даруй мне свободу, или даруй смерть",
    "Я всё равно никогда не хотел стареть",
    "Все долги должны быть погашены.",
    "Eros and Thanatos.",
    "Только взрослым.",
    "Тебе должно быть 18 и выше, чтобы нажать на эту кнопку.",
    "Эй, че как ребята? Это ваш паренёк, снова вернулся с другого ЭПИЧЕСКОГО Garry's Mod видео.",
    "Это просто безумно, чувак. Реально говорю",
    "Это единственный способ освободить твою душу.",
    "Эй, давай, мы можем поговорить об этом.",
    "Один день ты жив, а на следующий...",
    "Но... Почему?",
    "Жил как умер; Девственником",
    "Очень тупое решение",
    "Я не собираюсь говорить тебе, что делать, но...",
    "Ты должен сделать это",
    "Ты же не собираешься сделать это, так ли?",
    "Ты реально просто сидишь и читаешь все цитаты?",
    "Et tu, Brutus?",
    "Ты всё равно нам не нравился.",
    "Тебе это не сойдёт с рук.",
    "Ты всё равно зареспавнишься.",
    "Откуда ты узнал, что ты тот же человек, которым был вчера?",
    "Почеши зуд на своём затылке.",
    "У тебя не будет второго шанса",
    "Представь, насколько они будут скучать по тебе.",
    "Они пожалеют. Они РЕАЛЬНО пожалеют.",
    "Поезд отправляется со станции каждый вечер, в 21:00",
    "Положи свой палец на кнопку извлечения магазина,посмотри, насколько это заставит вас чувствовать себя живым.",
    "Самоубийство это нормально",
    "Я собираюсь разнести себе мозги. Собирась закончить это последнее дело, и потом \"бах\" -- Я ухожу отсюда.",
    "Выглядит как будто цирк уехал, а клоуны всё ещё здесь.",
    "Установи свой авторитет.",
    "Все успокойтесь! Это только демонстрация!",
    "Что, какого хрена ты делаешь?",
    "Я хочу увидеть, куда это приведёт.",
    "Будь осторожен -- оно заряжено.",
    "Это на вкус как железо и ад.",
    "Это мои мысли. Это моя голова.",
    "Ты НИКОГДА не забудешь, что происходит за пять секунд!",
    "Внутри маленького механизма ты можешь слышать, как напрягаются пружины.",
    "У тебя зуд  посередине твоего черепа, где ты никогда не добирался. Никогда не царапался...",
    "Он не собирается покончить собой, давай!",
    "Давай, продолжай. Три, два...",
    "У нас не будет никакого веселья, если ты убьёшь себя.",
    "Я... Не знаю, почему она бросила тебя. Ты всё ещё можешь это изменить, давай.",
    "Когда РЫБА это ВЕСЕЛО",
    "Собака зашла в таверну и сказала,\"Я ничего не вижу. Я открою вот эту.\"",
    "Вот так начинается революция.",
    "Ох, как весело умереть на открытых санях с одной лошадью.",
    "Но... Я люблю тебя!",
    "Здесь был Svorcer и Not Okay",
    "Даже сейчас, злое семя, которое ты посадил, прорастает внутри тебя.",
    "Как клишированно.",
    "Оу, ты можешь сделать лучше, чем ЭТО.",
    "Стань героем.",
    "Трагедия высшего порядка.",
    "Что если бы ты был самозванцем всё время?",
    "Извини. За всё.",
    "Я жалею, что я не смог сделать большего для тебя.",
    "Увидимся скоро.",
    "Передай от меня привет Дьяволу.",
    "Наказание за самоубийство - вечное проклятие",
    "Ты не сможешь уйти от этого.",
    "Это холостой; я просто знаю это.",
    "Попробуй застрелить другого человека вместо этого.",
    "Бог, ты смотришь?",
    "Момент истины.",
    "Спонсировано Donghua Jinlong Glycine Chemical Co. LTD.",
    "Не пытайтесь сделать это дома.",
    "Новое оформление.",
    "Причёска Курт Кобейна.",
    "Самая близкая вещь к любви, который вы сможете испытать.",
    "Погоди! До того как ты умрёшь - подпишись на мои другие аддоны.",
    "Да, ты можешь сказать, что у меня чёрное чувство юмора.",
    "Это всё, родня моя.",
    "Прощай и до свидания.",
    "Мы надеемся, что ты хорошо провёл вечер с нами.",
    "Покажи им, кто тут босс. Продолжай.",
    "Это буквально то, что произошло с тем угонщиком боинга.",
    "Ты делаешь большую ошибку.",
    "Патроны входят в барабан в неизвестном порядке",
    "Убей себя, или умри пытаясь.",
    "Нет. это не правильно.",
    "Но- ты не можешь!",
    "Все усилия мира пропали бы даром, Пока-- скажем просто что ваш час снова пробил.",
    "Стань звездой Liveleak.",
    "В ритме ча-ча-ча.",
    "Это единственный способ победить их.",
    "Прах к праху.",
    "Спридран по смерти",
    "Ты всё равно умрёшь.",
    "'Cuz everybody's gotta die sometime.", -- a little piece of heaven, avenged sevenfold
    "I've made the change; I won't see you tonight.", -- i won't see you tonight pt. 1, avenged sevenfold
    "No more breath inside; essence left my heart tonight.", -- i won't see you tonight pt. 1, avenged sevenfold
    "I know this can't be right, stuck in a dream, a nightmare full of sorrow.", -- i won't see you tonight pt. 2, avenged sevenfold
    "I was me, but now he's gone.", -- fade to black, metallica
    "Death greets me warm, now I will just say goodbye.", -- fade to black, metallica
    "I have to laugh out loud; I wish I didn't like this.", -- wait and bleed, slipknot
    "Lay away a place for me, 'cuz as soon as I'm done, I'll be on my way to live eternally.", -- so far away, avenged sevenfold
    "Now, I think I understand how this world can overcome a man.", -- fiction, avenged sevenfold
    "Heard there's peace just on the other side.", -- fiction, avenged sevenfold
    "I hope you find your own way when I'm not with you tonight.", -- fiction, avenged sevenfold
    "A truant finds home, and a wish to hold on.", -- immortality, pearl jam
    "Makes much more sense to live in the present tense.", -- present tense, pearl jam
    "Darkness comes in waves, tell me, why invite it to stay?", -- life wasted, pearl jam
    "You flirt with suicide; sometimes, that's okay.", -- falling away from me, korn
    "I flirt with suicide; sometimes, kill the pain.", -- falling away from me, korn
    "Die, motherfucker, die!", -- creeping death, metallica
    "How beautiful life is now, when my time has come.", -- life eternal, mayhem
    "Can't really live, can't really endure.", -- everything ends, slipknot
    "What the fuck was I thinking? Anybody want to tell me I'm fine?", -- everything ends, slipknot
    -- Translated and abridged excerpts from Kamikaze pilots' manual
    "Дыши глубоко три раза. Скажи в своих мыслях: \"Йах\" (поле), \"Кю\" (шар), \"Джо\" ( всё в порядке), когда глубоко дышите.",
    "Будьте всегда чисты сердцем и веселы. Верный воин - чистосердечний и сыновный сын.",
    "Если ты нервничаешь, поссы.",
    "Вы прожили 20 а то и больше. Вы должны приложить все свои силы в последний раз в жизни. Прояви сверхъестественную силу.",
    "Каждое божество и души ваших погибших товарищей пристально наблюдают за вами. Они скажут тебе, как им было весело.",
    "Тогда вы можете кивнуть, и задуматься, что произошло. Вы можете услышать последний звук, похожий на разбитие хрусталя. Тогда тебя больше нет.",
    -- Kamikaze manual ends
}

local function canhighlight(self, slice)
    if !self:GetValue("CanBlindFire") and self:GetValue("CanSuicide") then return !slice or slice[1] == TacRP.BLINDFIRE_NONE or slice[1] == TacRP.BLINDFIRE_KYS end
    return true
end

local lastseenfunnyline = false
local startseefunnylinetime = 0

function SWEP:DrawBlindFireHUD()
    if !TacRP.ConVars["blindfiremenu"]:GetBool() then lastseenfunnyline = false return end
    local nocenter = TacRP.ConVars["blindfiremenu_nocenter"]:GetBool()
    local nosuicide = nocenter or TacRP.ConVars["idunwannadie"]:GetBool()

    -- adapted from tfa vox radial menu
    local ft = FrameTime()
    local scrw = ScrW()
    local scrh = ScrH()
    local r = TacRP.SS(72)
    local r2 = TacRP.SS(24)
    local sg = TacRP.SS(32)
    local ri = r * 0.667
    local s = 45

    local slices = bf_slices
    if nocenter then
        slices = bf_slices3
    elseif nosuicide then
        slices = bf_slices2
        s = 90
    end
    if currentind and currentind > #slices then currentind = 0 end

    local arcdegrees = 360 / #slices
    local d = 360 - s

    local cursorx, cursory = input.GetCursorPos()
    local mouseangle = math.deg(math.atan2(cursorx - scrw / 2, cursory - scrh / 2))
    local mousedist = math.sqrt(math.pow(cursorx - scrw / 2, 2) + math.pow(cursory - scrh / 2, 2))
    if #slices == 3 then
        mouseangle = math.NormalizeAngle(360 - mouseangle + arcdegrees) -- ???
    else
        mouseangle = math.NormalizeAngle(360 - (mouseangle - s) + arcdegrees)
    end
    if mouseangle < 0 then
        mouseangle = mouseangle + 360
    end

    if (self:GetOwner():KeyDown(IN_ZOOM) or self:GetOwner().TacRPBlindFireDown) and self:CheckBlindFire(true) and self.GrenadeMenuAlpha == 0 then
        self.BlindFireMenuAlpha = math.Approach(self.BlindFireMenuAlpha, 1, 15 * ft)
        if !lastmenu_bf then
            gui.EnableScreenClicker(true)
            TacRP.CursorEnabled = true
            lastmenu_bf = true
            if self:GetBlindFireMode() == TacRP.BLINDFIRE_KYS then
                bf_suicidelock = 0
            else
                bf_suicidelock = 1
                bf_funnyline = nil
            end
        end

        if mousedist > r2 then
            local i = math.floor( mouseangle / arcdegrees ) + 1
            currentind = i
        else
            currentind = 0
        end
    else
        self.BlindFireMenuAlpha = math.Approach(self.BlindFireMenuAlpha, 0, -10 * ft)
        if lastmenu_bf then
            if !self:GetCustomize() then
                gui.EnableScreenClicker(false)
                TacRP.CursorEnabled = false
            end
            if (!nocenter or currentind > 0) and (nosuicide or bf_suicidelock == 0 or currentind != 2) then
                net.Start("tacrp_toggleblindfire")
                    net.WriteUInt(currentind > 0 and slices[currentind][1] or TacRP.BLINDFIRE_NONE, TacRP.BlindFireNetBits)
                net.SendToServer()
            end

            lastmenu_bf = false
        end
    end

    if self.BlindFireMenuAlpha < 1 then
        bf_funnyline = nil
        lastseenfunnyline = false
    end

    if self.BlindFireMenuAlpha <= 0 then
        return
    end

    local a = self.BlindFireMenuAlpha
    local col = Color(255, 255, 255, 255 * a)

    surface.DrawCircle(scrw / 2, scrh / 2, r, 255, 255, 255, a * 255)

    surface.SetDrawColor(0, 0, 0, a * 200)
    draw.NoTexture()
    filledcircle(scrw / 2, scrh / 2, r, 32)

    if currentind and canhighlight(self, slices[currentind]) then
        surface.SetDrawColor(150, 150, 150, a * 100)
        draw.NoTexture()
        if currentind > 0 then
            if !nosuicide and currentind == 2 and bf_suicidelock > 0 then
                surface.SetDrawColor(150, 50, 50, a * 100)
            end
            local d0 = -s - arcdegrees * (currentind - 2)
            slicedcircle(scrw / 2, scrh / 2, r, 32, d0, d0 + arcdegrees)
        else
            filledcircle(scrw / 2, scrh / 2, r2, 32)
        end
    end

    surface.SetDrawColor(0, 0, 0, a * 255)
    surface.DrawCircle(scrw / 2, scrh / 2, r2, 255, 255, 255, a * 255)

    for i = 1, #slices do
        local rad = math.rad( d + arcdegrees * 0.5 )

        surface.SetDrawColor(255, 255, 255, a * 255)
        surface.DrawLine(
            scrw / 2 + math.cos(math.rad(d)) * r2,
            scrh / 2 - math.sin(math.rad(d)) * r2,
            scrw / 2 + math.cos(math.rad(d)) * r,
            scrh / 2 - math.sin(math.rad(d)) * r)

        local nadex, nadey = scrw / 2 + math.cos(rad) * ri, scrh / 2 - math.sin(rad) * ri

        if !canhighlight(self, slices[i]) or (!nosuicide and i == 2 and bf_suicidelock > 0) then
            surface.SetDrawColor(150, 150, 150, a * 200)
        end

        surface.SetMaterial(slices[i][2])
        surface.DrawTexturedRectRotated(nadex, nadey, sg, sg, slices[i][3])

        d = d - arcdegrees
    end

    if !nocenter then
        surface.SetDrawColor(255, 255, 255, a * 255)
        surface.SetMaterial(mat_none)
        surface.DrawTexturedRectRotated(scrw / 2, scrh / 2, TacRP.SS(28), TacRP.SS(28), 0)
    end

    if !nosuicide and currentind == 2 then

        local w, h = TacRP.SS(132), TacRP.SS(24)
        local tx, ty = scrw / 2, scrh / 2 + r + TacRP.SS(4)

        surface.SetDrawColor(0, 0, 0, 200 * a)
        TacRP.DrawCorneredBox(tx - w / 2, ty, w, h, col)
        surface.SetTextColor(255, 255, 255, a * 255)

        surface.SetFont("TacRP_Myriad_Pro_12")
        surface.SetTextColor(255, 255, 255, 255 * a)
        local t1 = TacRP:GetPhrase("hint.shootself")
        local t1_w = surface.GetTextSize(t1)
        surface.SetTextPos(tx - t1_w / 2, ty + TacRP.SS(2))
        surface.DrawText(t1)

        surface.SetFont("TacRP_Myriad_Pro_6")

        if !lastseenfunnyline then
            startseefunnylinetime = CurTime()
        end

        lastseenfunnyline = true

        local t2 = bf_funnyline or ""
        if bf_suicidelock > 0 then
            surface.SetFont("TacRP_Myriad_Pro_8")
            t2 = "[ " .. TacRP.GetBind("attack") .. " ] - " .. TacRP:GetPhrase("hint.unlock")
			
			if self:GetCustomize() then
				t2 = TacRP:GetPhrase("hint.exitcustmenu")
			end
            lastseenfunnyline = false
        elseif !bf_funnyline then
            bf_funnyline = bf_lines[math.random(1, #bf_lines)]
        end
        local t2_w, t2_h = surface.GetTextSize(t2)
        if t2_w > w then
            render.SetScissorRect(tx - w / 2, ty, tx + w / 2, ty + h, true)
            surface.SetTextPos(tx - ((CurTime() - startseefunnylinetime + 2.5) * w * 0.3) % (t2_w * 2) + (t2_w / 2), ty + TacRP.SS(18) - t2_h / 2)
        else
            surface.SetTextPos(tx - t2_w / 2, ty + TacRP.SS(18) - t2_h / 2)
        end
        surface.DrawText(t2)

        render.SetScissorRect(0, 0, 0, 0, false)
    end
end

hook.Add("VGUIMousePressed", "tacrp_grenademenu", function(pnl, mousecode)
    local wpn = LocalPlayer():GetActiveWeapon()
    if !(LocalPlayer():Alive() and IsValid(wpn) and wpn.ArcticTacRP and !wpn:StillWaiting(nil, true)) then return end
    if wpn.GrenadeMenuAlpha == 1 then
        if !TacRP.ConVars["nademenu_click"]:GetBool() or !currentnade then return end
        if mousecode == MOUSE_MIDDLE and TacRP.AreTheGrenadeAnimsReadyYet then
            local nadewep = currentnade.GrenadeWep
            if !nadewep or !wpn:CheckGrenade(currentnade.Index, true) then return end
            wpn.GrenadeMenuAlpha = 0
            gui.EnableScreenClicker(false)
            TacRP.CursorEnabled = false
            if LocalPlayer():HasWeapon(nadewep) then
                input.SelectWeapon(LocalPlayer():GetWeapon(nadewep))
            else
                net.Start("tacrp_givenadewep")
                    net.WriteUInt(currentnade.Index, TacRP.QuickNades_Bits)
                net.SendToServer()
                wpn.GrenadeWaitSelect = nadewep -- cannot try to switch immediately as the nade wep does not exist on client yet
            end
        elseif mousecode == MOUSE_RIGHT or mousecode == MOUSE_LEFT then
            wpn.GrenadeThrowOverride = mousecode == MOUSE_RIGHT
            net.Start("tacrp_togglenade")
                net.WriteUInt(currentnade.Index, TacRP.QuickNades_Bits)
                net.WriteBool(true)
                net.WriteBool(wpn.GrenadeThrowOverride)
            net.SendToServer()
            wpn.Secondary.Ammo = currentnade.Ammo or "none"
        end
    elseif wpn.BlindFireMenuAlpha == 1 then
        if mousecode == MOUSE_LEFT and currentind == 2 then
            bf_suicidelock = bf_suicidelock - 1
        end
    end
end)