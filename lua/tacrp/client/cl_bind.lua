hook.Add("PlayerBindPress", "TacRP_Binds", function(ply, bind, pressed, code)
    local wpn = ply:GetActiveWeapon()

    if !wpn or !IsValid(wpn) or !wpn.ArcticTacRP then return end

    if !pressed then return end

    -- print(bind)

    -- if bind == "+zoom" then
    --     if wpn:GetBlindFire() then
    --         net.Start("TacRP_toggleblindfire")
    --         net.WriteBool(false)
    --         net.SendToServer()
    --     else
    --         net.Start("TacRP_toggleblindfire")
    --         net.WriteBool(true)
    --         net.SendToServer()
    --     end

    --     return true
    -- end

    if bind == "+menu_context" then
        if !LocalPlayer():KeyDown(IN_USE) then
            if wpn:GetCustomize() then
                net.Start("TacRP_togglecustomize")
                net.WriteBool(false)
                net.SendToServer()
            else
                net.Start("TacRP_togglecustomize")
                net.WriteBool(true)
                net.SendToServer()
            end

            return true
        end
    end
end)

TacRP.Complaints = {}

function TacRP.GetBind(binding)
    local bind = input.LookupBinding(binding)

    if !bind then
        if !TacRP.Complaints[binding] then
            TacRP.Complaints[binding] = true

            if binding == "grenade1" or binding == "grenade2" then
                LocalPlayer():PrintMessage(HUD_PRINTTALK, "Bind +grenade1 and +grenade2 to use TacRP quick grenades!")
            end
        end
        return "!"
    end

    return string.upper(bind)
end

hook.Add("InitPostEntity", "TacRP_ComplainAboutBinds", function()
    LocalPlayer():PrintMessage(HUD_PRINTTALK, "Check Q menu -> Options/Tactical RP/Control Guide to see the controls!")
    if !input.LookupBinding("grenade1") or !input.LookupBinding("grenade2") then
        LocalPlayer():PrintMessage(HUD_PRINTTALK, "Bind +grenade1 and +grenade2 to use TacRP quick grenades!")
    end
end)