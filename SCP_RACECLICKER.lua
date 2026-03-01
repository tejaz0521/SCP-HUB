-- ══════════════════════════════════════════════════
--              SCP HUB - MUSCLE LEGENDS
--          Made by MOHA / TEJAZ
--          Key System + Full Hub Merged
-- ══════════════════════════════════════════════════

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ╔══════════════════════════════════════════════════╗
--   ⚡ SCP HUB LOADING SCREEN  |  Made by TEJAZ
-- ╚══════════════════════════════════════════════════╝

local _TweenService = game:GetService("TweenService")
local _LocalPlayer = game:GetService("Players").LocalPlayer

repeat task.wait() until _LocalPlayer and _LocalPlayer.Character

local _loadGui = Instance.new("ScreenGui")
_loadGui.Name = "SCPLoadScreen"
_loadGui.ResetOnSpawn = false
_loadGui.DisplayOrder = 9999
_loadGui.Parent = _LocalPlayer:WaitForChild("PlayerGui")

-- Full black overlay
local _overlay = Instance.new("Frame")
_overlay.Size = UDim2.new(1,0,1,0)
_overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
_overlay.BackgroundTransparency = 0
_overlay.BorderSizePixel = 0
_overlay.Parent = _loadGui

-- Center card
local _card = Instance.new("Frame")
_card.Size = UDim2.new(0,300,0,340)
_card.Position = UDim2.new(0.5,-150,0.5,-170)
_card.BackgroundColor3 = Color3.fromRGB(7,7,10)
_card.BorderSizePixel = 0
_card.Parent = _loadGui
Instance.new("UICorner",_card).CornerRadius = UDim.new(0,22)

-- Animated border
local _border = Instance.new("UIStroke")
_border.Color = Color3.fromRGB(220,0,0)
_border.Thickness = 2.5
_border.Parent = _card

-- Top red accent
local _topBar = Instance.new("Frame")
_topBar.Size = UDim2.new(1,0,0,4)
_topBar.BackgroundColor3 = Color3.fromRGB(220,0,0)
_topBar.BorderSizePixel = 0
_topBar.Parent = _card
Instance.new("UICorner",_topBar).CornerRadius = UDim.new(0,22)

-- Logo
local _logo = Instance.new("ImageLabel")
_logo.Size = UDim2.new(0,90,0,90)
_logo.Position = UDim2.new(0.5,-45,0,18)
_logo.BackgroundTransparency = 1
_logo.Image = "rbxassetid://125515680929159"
_logo.ScaleType = Enum.ScaleType.Fit
_logo.Parent = _card

-- SCP HUB title
local _title = Instance.new("TextLabel")
_title.Size = UDim2.new(1,0,0,28)
_title.Position = UDim2.new(0,0,0,114)
_title.BackgroundTransparency = 1
_title.Text = "⚡ SCP HUB ⚡"
_title.TextColor3 = Color3.fromRGB(255,255,255)
_title.TextSize = 22
_title.Font = Enum.Font.GothamBlack
_title.Parent = _card

-- Script type label (PAID or PUBLIC)
local _scriptType = Instance.new("TextLabel")
_scriptType.Size = UDim2.new(1,0,0,20)
_scriptType.Position = UDim2.new(0,0,0,142)
_scriptType.BackgroundTransparency = 1
_scriptType.Text = "🆓 PUBLIC VERSION  •  FREE FOR ALL"
_scriptType.TextColor3 = Color3.fromRGB(220,0,0)
_scriptType.TextSize = 12
_scriptType.Font = Enum.Font.GothamBold
_scriptType.Parent = _card

-- Divider
local _div = Instance.new("Frame")
_div.Size = UDim2.new(0.7,0,0,1)
_div.Position = UDim2.new(0.15,0,0,172)
_div.BackgroundColor3 = Color3.fromRGB(30,30,45)
_div.BorderSizePixel = 0
_div.Parent = _card

-- Loading bar bg
local _barBg = Instance.new("Frame")
_barBg.Size = UDim2.new(1,-30,0,8)
_barBg.Position = UDim2.new(0,15,0,185)
_barBg.BackgroundColor3 = Color3.fromRGB(18,18,28)
_barBg.BorderSizePixel = 0
_barBg.Parent = _card
Instance.new("UICorner",_barBg).CornerRadius = UDim.new(0,6)

-- Loading bar fill
local _barFill = Instance.new("Frame")
_barFill.Size = UDim2.new(0,0,1,0)
_barFill.BackgroundColor3 = Color3.fromRGB(220,0,0)
_barFill.BorderSizePixel = 0
_barFill.Parent = _barBg
Instance.new("UICorner",_barFill).CornerRadius = UDim.new(0,6)

-- Status text
local _statusTxt = Instance.new("TextLabel")
_statusTxt.Size = UDim2.new(1,-20,0,22)
_statusTxt.Position = UDim2.new(0,10,0,202)
_statusTxt.BackgroundTransparency = 1
_statusTxt.Text = "⏳  Initializing..."
_statusTxt.TextColor3 = Color3.fromRGB(160,160,180)
_statusTxt.TextSize = 12
_statusTxt.Font = Enum.Font.GothamBold
_statusTxt.Parent = _card

-- Percent label
local _pctLbl = Instance.new("TextLabel")
_pctLbl.Size = UDim2.new(1,0,0,20)
_pctLbl.Position = UDim2.new(0,0,0,228)
_pctLbl.BackgroundTransparency = 1
_pctLbl.Text = "0%"
_pctLbl.TextColor3 = Color3.fromRGB(220,0,0)
_pctLbl.TextSize = 13
_pctLbl.Font = Enum.Font.GothamBlack
_pctLbl.Parent = _card

-- Made by
local _madeLbl = Instance.new("TextLabel")
_madeLbl.Size = UDim2.new(1,0,0,18)
_madeLbl.Position = UDim2.new(0,0,0,255)
_madeLbl.BackgroundTransparency = 1
_madeLbl.Text = "👑 Made by TEJAZ  •  discord.gg/nDSy4jdVDc"
_madeLbl.TextColor3 = Color3.fromRGB(60,60,80)
_madeLbl.TextSize = 10
_madeLbl.Font = Enum.Font.GothamBold
_madeLbl.Parent = _card

-- Version badge
local _verBg = Instance.new("Frame")
_verBg.Size = UDim2.new(0,0,0,22)
_verBg.Position = UDim2.new(0.5,0,0,278)
_verBg.BackgroundColor3 = Color3.fromRGB(180,0,0)
_verBg.BorderSizePixel = 0
_verBg.AutomaticSize = Enum.AutomaticSize.X
_verBg.AnchorPoint = Vector2.new(0.5,0)
_verBg.Parent = _card
Instance.new("UICorner",_verBg).CornerRadius = UDim.new(0,8)
local _verLbl = Instance.new("TextLabel")
_verLbl.Size = UDim2.new(0,0,1,0)
_verLbl.BackgroundTransparency = 1
_verLbl.Text = "  🔥 PUBLIC V5 • FREE  "
_verLbl.TextColor3 = Color3.fromRGB(255,255,255)
_verLbl.TextSize = 10
_verLbl.Font = Enum.Font.GothamBold
_verLbl.AutomaticSize = Enum.AutomaticSize.X
_verLbl.Parent = _verBg

-- Slide in
_card.Position = UDim2.new(0.5,-150,1.5,0)
_TweenService:Create(_card, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5,-150,0.5,-170)
}):Play()

-- Animated border glow
task.spawn(function()
    local _t = 0
    while _loadGui.Parent do
        _t = _t + 0.02
        local _r = (math.sin(_t)+1)/2
        _border.Color = Color3.new(0.7+_r*0.3, 0, 0)
        task.wait(0.05)
    end
end)

-- Pulse logo
task.spawn(function()
    while _loadGui.Parent do
        _TweenService:Create(_logo, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0,98,0,98)}):Play()
        task.wait(0.8)
        _TweenService:Create(_logo, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0,90,0,90)}):Play()
        task.wait(0.8)
    end
end)

-- Loading bar animation
local _steps = {
    {0.15, "⚡  Connecting to SCP servers...", "15%"},
    {0.35, "🔐  Verifying license...", "35%"},
    {0.55, "📦  Loading features...", "55%"},
    {0.75, "🎨  Building interface...", "75%"},
    {0.90, "✅  Almost ready...", "90%"},
    {1.00, "🔥  Launching SCP HUB!", "100%"},
}

for _, step in ipairs(_steps) do
    _TweenService:Create(_barFill, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(step[1], 0, 1, 0)
    }):Play()
    _statusTxt.Text = step[2]
    _pctLbl.Text = step[3]
    if step[3] == "100%" then
        _pctLbl.TextColor3 = Color3.fromRGB(0,220,100)
        _barFill.BackgroundColor3 = Color3.fromRGB(0,200,80)
        _border.Color = Color3.fromRGB(0,200,80)
    end
    task.wait(0.5)
end

task.wait(0.4)

-- Fade out
_TweenService:Create(_overlay, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
_TweenService:Create(_card, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
    Position = UDim2.new(0.5,-150,1.5,0)
}):Play()
task.wait(0.5)
_loadGui:Destroy()

-- Corner logo after hub loads
task.spawn(function()
    local _logoGui = Instance.new("ScreenGui")
    _logoGui.Name = "SCPCornerLogo"
    _logoGui.ResetOnSpawn = false
    _logoGui.DisplayOrder = 9998
    _logoGui.Parent = _LocalPlayer:WaitForChild("PlayerGui")
    local _cornerLogo = Instance.new("ImageLabel")
    _cornerLogo.Size = UDim2.new(0,55,0,55)
    _cornerLogo.Position = UDim2.new(0,6,0,6)
    _cornerLogo.BackgroundTransparency = 1
    _cornerLogo.Image = "rbxassetid://125515680929159"
    _cornerLogo.ScaleType = Enum.ScaleType.Fit
    _cornerLogo.Parent = _logoGui
end)


-- SCP LOGO OVERLAY
task.spawn(function()
    task.wait(0.5)
    local logoOverlay = Instance.new("ScreenGui")
    logoOverlay.Name = "SCPLogoOverlay"
    logoOverlay.ResetOnSpawn = false
    logoOverlay.DisplayOrder = 999
    logoOverlay.Parent = LocalPlayer:WaitForChild("PlayerGui")
    local logoImg = Instance.new("ImageLabel")
    logoImg.Size = UDim2.new(0, 60, 0, 60)
    logoImg.Position = UDim2.new(0, 8, 0, 8)
    logoImg.BackgroundTransparency = 1
    logoImg.Image = "rbxassetid://125515680929159"
    logoImg.ScaleType = Enum.ScaleType.Fit
    logoImg.Parent = logoOverlay
end)

-- Wait for character and leaderstats to fully load before doing anything
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local leaderstats = LocalPlayer:WaitForChild("leaderstats", 15)
task.wait(2) -- extra safety wait

-- ══════════════════════════════════════
-- KEY SYSTEM UI
-- ══════════════════════════════════════

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.BackgroundTransparency = 0.3
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local Box = Instance.new("Frame")
Box.Size = UDim2.new(0, 400, 0, 220)
Box.Position = UDim2.new(0.5, -200, 0.5, -110)
Box.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Box.BorderSizePixel = 0
Box.Parent = ScreenGui
Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 45)
Title.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
Title.BorderSizePixel = 0
Title.Text = "🔑 SCP HUB - KEY SYSTEM"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 17
Title.Font = Enum.Font.GothamBold
Title.Parent = Box
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 10)

local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1, 0, 0, 30)
Sub.Position = UDim2.new(0, 0, 0, 50)
Sub.BackgroundTransparency = 1
Sub.Text = "Join discord.gg/nDSy4jdVDc to get your key!"
Sub.TextColor3 = Color3.fromRGB(200, 200, 200)
Sub.TextSize = 13
Sub.Font = Enum.Font.Gotham
Sub.Parent = Box

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(0, 340, 0, 40)
Input.Position = UDim2.new(0.5, -170, 0, 95)
Input.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Input.BorderSizePixel = 0
Input.PlaceholderText = "Enter your key here..."
Input.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 14
Input.Font = Enum.Font.Gotham
Input.ClearTextOnFocus = false
Input.Parent = Box
Instance.new("UICorner", Input).CornerRadius = UDim.new(0, 6)

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, 0, 0, 25)
Status.Position = UDim2.new(0, 0, 0, 145)
Status.BackgroundTransparency = 1
Status.Text = ""
Status.TextColor3 = Color3.fromRGB(255, 80, 80)
Status.TextSize = 13
Status.Font = Enum.Font.Gotham
Status.Parent = Box

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 340, 0, 38)
Button.Position = UDim2.new(0.5, -170, 0, 170)
Button.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
Button.BorderSizePixel = 0
Button.Text = "✅ SUBMIT KEY"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 15
Button.Font = Enum.Font.GothamBold
Button.Parent = Box
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 6)

-- ══════════════════════════════════════
-- KEY VALIDATION (fetch from your URL)
-- Replace the KEY_URL below with your
-- own Pastebin (unlisted) or GitHub raw link
-- that contains one key per line
-- ══════════════════════════════════════

local KEY_URL = "https://pastebin.com/raw/n7UWskEA"

local function getValidKeys()
    local success, result = pcall(function()
        return game:HttpGet(KEY_URL)
    end)
    if success then
        local keys = {}
        for key in result:gmatch("[^\n]+") do
            local trimmed = key:match("^%s*(.-)%s*$")
            if trimmed ~= "" then
                table.insert(keys, trimmed)
            end
        end
        return keys
    end
    return {}
end

local function checkKey(entered)
    local keys = getValidKeys()
    for _, v in pairs(keys) do
        if v == entered then
            return true
        end
    end
    return false
end

-- ══════════════════════════════════════
-- BUTTON LOGIC
-- ══════════════════════════════════════

Button.MouseButton1Click:Connect(function()
    local entered = Input.Text
    Status.TextColor3 = Color3.fromRGB(255, 200, 0)
    Status.Text = "⏳ Checking key..."
    Button.Active = false

    task.spawn(function()
        if checkKey(entered) then
            Status.TextColor3 = Color3.fromRGB(0, 255, 100)
            Status.Text = "✅ Key accepted! Loading script..."
            task.wait(1.5)
            ScreenGui:Destroy()

            -- ══════════════════════════════════════
            -- ✅ MAIN SCRIPT LOADS AFTER KEY CHECK
            -- ══════════════════════════════════════

            local v1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/elerium-v2-ui-library/refs/heads/main/Library", true))():AddWindow("⚡ SCP HUB  |  MUSCLE LEGENDS  |  🔥 " .. game.Players.LocalPlayer.DisplayName, {
                main_color = Color3.fromRGB(180, 0, 0),
                min_size = Vector2.new(615, 685),
                can_resize = false,
                scrollable = true
            })

            -- INFO TAB
            local v2 = v1:AddTab("I N F O")
            v2:AddLabel("[ INFO ] [ ABOUT ] [ THE ] [ SCRIPT ]")
            v2:AddLabel("WELCOME TO SCP HUB")
            v2:AddLabel("OWNER OF THIS SCRIPT: MOHA / TEJAZ")
            v2:AddLabel("Script Made By:")
            local vu3 = v2:AddLabel("MOHA || TEJAZ")
            task.spawn(function()
                while true do
                    vu3.TextColor3 = Color3.fromHSV(tick() * 0.22 % 1, 0.8, 1)
                    task.wait(0.02)
                end
            end)
            v2:AddLabel("══════════════════════════════")
            v2:AddLabel("DISCORD INVITE LINK:")
            v2:AddButton("Join Our Discord - discord.gg/nDSy4jdVDc", function()
                setclipboard("https://discord.gg/nDSy4jdVDc")
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "SCP HUB",
                    Text = "Discord link copied! Open Discord and paste it.",
                    Duration = 5
                })
            end)
            v2:AddLabel("Click button above to copy the Discord link!")

            -- STATS TAB
            local vu172 = game:GetService("Players")
            local vu173 = vu172.LocalPlayer
            infoTab1 = v1:AddTab(" STATS ")
            infoTab1:AddLabel("【 STATS 】   ").TextSize = 20
            local vu5 = infoTab1:AddLabel("Time Spent in Server: 0d 0h 0m 0s")
            local vu6 = os.time()
            local function vu14(p7)
                local v8 = math.floor(p7 / 86400)
                local v9 = p7 % 86400
                local v10 = math.floor(v9 / 3600)
                local v11 = v9 % 3600
                local v12 = math.floor(v11 / 60)
                local v13 = v11 % 60
                return string.format("%dd %dh %dm %ds", v8, v10, v12, v13)
            end
            task.spawn(function()
                while task.wait(1) do
                    vu5.Text = "Time Spent in Server: " .. vu14(os.time() - vu6)
                end
            end)
            local vu15 = 0
            local _rebirthStat = game.Players.LocalPlayer:WaitForChild("leaderstats"):WaitForChild("Rebirths")
            local vu16 = _rebirthStat and _rebirthStat.Value or 0
            local vu17 = infoTab1:AddLabel("Rebirths Gained in Server: 0")
            local function vu18()
                vu15 = game.Players.LocalPlayer.leaderstats.Rebirths.Value - vu16
                vu17.Text = "Rebirths Gained in Server: " .. vu15
            end
            task.spawn(function()
                while task.wait(0.5) do
                    vu18()
                end
            end)
            infoTab1:AddLabel("PLAYER STATS").TextSize = 20
            infoTab1:AddLabel(" GAINED ").TextSize = 20
            local vu19 = {
                StrengthGainedLabel = infoTab1:AddLabel("Amount of strength gained in this server: 0"),
                DurabilityGainedLabel = infoTab1:AddLabel("Amount of durability gained in this server: 0"),
                AgilityGainedLabel = infoTab1:AddLabel("Amount of agility gained in this server: 0"),
                KillsGainedLabel = infoTab1:AddLabel("Amount of kills gained in this server: 0"),
                EvilKarmaGainedLabel = infoTab1:AddLabel("Amount of Evil Karma gained in this server: 0"),
                GoodKarmaGainedLabel = infoTab1:AddLabel("Amount of Good Karma gained in this server: 0")
            };
            (function()
                local v20 = game.Players.LocalPlayer
                if v20 then
                    local v21 = v20:WaitForChild("leaderstats")
                    if v21 then
                        local vu22 = v21:WaitForChild("Strength")
                        local vu23 = v20:WaitForChild("Durability")
                        local vu24 = v20:WaitForChild("Agility")
                        local vu25 = v21:WaitForChild("Kills")
                        local vu26 = v20:WaitForChild("evilKarma")
                        local vu27 = v20:WaitForChild("goodKarma")
                        local vu28 = vu22.Value or 0
                        local vu29 = vu23.Value or 0
                        local vu30 = vu24.Value or 0
                        local vu31 = vu25.Value or 0
                        local vu32 = vu26.Value or 0
                        local vu33 = vu27.Value or 0
                        local function vu35(p34)
                            if p34 >= 1000000000 then return string.format("%.1fB", p34 / 1000000000)
                            elseif p34 >= 1000000 then return string.format("%.1fM", p34 / 1000000)
                            elseif p34 >= 1000 then return string.format("%.1fK", p34 / 1000)
                            else return tostring(p34) end
                        end
                        local function v42()
                            vu19.StrengthGainedLabel.Text = "Amount of strength gained in this server: " .. vu35(vu22.Value - vu28)
                            vu19.DurabilityGainedLabel.Text = "Amount of durability gained in this server: " .. vu35(vu23.Value - vu29)
                            vu19.AgilityGainedLabel.Text = "Amount of agility gained in this server: " .. vu35(vu24.Value - vu30)
                            vu19.KillsGainedLabel.Text = "Amount of kills gained in this server: " .. vu35(vu25.Value - vu31)
                            vu19.EvilKarmaGainedLabel.Text = "Amount of Evil Karma gained in this server: " .. vu35(vu26.Value - vu32)
                            vu19.GoodKarmaGainedLabel.Text = "Amount of Good Karma gained in this server: " .. vu35(vu27.Value - vu33)
                        end
                        vu22.Changed:Connect(v42) vu23.Changed:Connect(v42) vu24.Changed:Connect(v42)
                        vu25.Changed:Connect(v42) vu26.Changed:Connect(v42) vu27.Changed:Connect(v42)
                        v42()
                    end
                end
            end)()
            infoTab1:AddLabel(" CURRENT STATS ").TextSize = 20
            local function vu44(p43)
                if p43 >= 1000000000000000 then return tostring(math.floor(p43 * 10 / 1000000000000000) / 10) .. "Qa"
                elseif p43 >= 1000000000000 then return tostring(math.floor(p43 * 10 / 1000000000000) / 10) .. "T"
                elseif p43 >= 1000000000 then return tostring(math.floor(p43 * 10 / 1000000000) / 10) .. "B"
                elseif p43 >= 1000000 then return tostring(math.floor(p43 * 10 / 1000000) / 10) .. "M"
                elseif p43 >= 1000 then return tostring(math.floor(p43 * 10 / 1000) / 10) .. "k"
                else return tostring(p43) end
            end
            local function vu46(p45) return vu44(p45) end
            local function vu48(p47) return not p47 and "N/A" or string.format("%s / %d", vu44(p47), p47) end
            local function vu50(p49) return not p49 and "N/A" or string.format("%s / %d", vu46(p49), p49) end
            local vu51 = {
                Player = infoTab1:AddLabel("Player: " .. game.Players.LocalPlayer.Name),
                Rebirths = infoTab1:AddLabel("Rebirths: 0 / 0"),
                Strength = infoTab1:AddLabel("Strength: 0 / 0"),
                Durability = infoTab1:AddLabel("Durability: 0 / 0"),
                Agility = infoTab1:AddLabel("Agility: 0 / 0"),
                Kills = infoTab1:AddLabel("Kills: 0 / 0"),
                EvilKarma = infoTab1:AddLabel("Evil Karma: 0 / 0"),
                GoodKarma = infoTab1:AddLabel("Good Karma: 0 / 0")
            }
            local function vu56(p52, p53)
                if not p52 then return nil end
                local v54 = p52:FindFirstChild(p53)
                local v55 = tick()
                while true do
                    v54 = v54 or (tick() - v55 >= 3 or p52:FindFirstChild(p53))
                    if v54 then break end
                    task.wait(0.1)
                end
                return v54
            end
            local function vu75(p57)
                local v58 = tostring(p57):lower()
                if #v58 == 0 then return game.Players.LocalPlayer end
                for _, v62 in ipairs(game.Players:GetPlayers()) do
                    if v62.Name:lower() == v58 then return v62 end
                end
                for _, v66 in ipairs(game.Players:GetPlayers()) do
                    if v66.DisplayName and v66.DisplayName:lower() == v58 then return v66 end
                end
                for _, v70 in ipairs(game.Players:GetPlayers()) do
                    if string.find(v70.Name:lower(), v58, 1, true) then return v70 end
                end
                for _, v74 in ipairs(game.Players:GetPlayers()) do
                    if v74.DisplayName and string.find(v74.DisplayName:lower(), v58, 1, true) then return v74 end
                end
                return nil
            end
            local function vu109(p76)
                if p76 then
                    vu51.Player.Text = "Player: " .. p76.Name .. (p76.DisplayName and (" (" .. p76.DisplayName .. ")") or "")
                    local v77 = p76:FindFirstChild("leaderstats") or vu56(p76, "leaderstats")
                    local v78 = v77 and (v77:FindFirstChild("Strength") or vu56(v77, "Strength"))
                    local v79 = v77 and (v77:FindFirstChild("Rebirths") or vu56(v77, "Rebirths"))
                    local v77kills = v77 and (v77:FindFirstChild("Kills") or vu56(v77, "Kills"))
                    local v80 = p76:FindFirstChild("Durability") or vu56(p76, "Durability")
                    local v81 = p76:FindFirstChild("Agility") or vu56(p76, "Agility")
                    local v82 = p76:FindFirstChild("evilKarma") or vu56(p76, "evilKarma")
                    local v83 = p76:FindFirstChild("goodKarma") or vu56(p76, "goodKarma")
                    vu51.Rebirths.Text = "Rebirths: " .. vu48(v79 and v79.Value)
                    vu51.Strength.Text = "Strength: " .. vu50(v78 and v78.Value)
                    vu51.Durability.Text = "Durability: " .. vu50(v80 and v80.Value)
                    vu51.Agility.Text = "Agility: " .. vu50(v81 and v81.Value)
                    vu51.Kills.Text = "Kills: " .. vu48(v77kills and v77kills.Value)
                    vu51.EvilKarma.Text = "Evil Karma: " .. vu48(v82 and v82.Value)
                    vu51.GoodKarma.Text = "Good Karma: " .. vu48(v83 and v83.Value)
                else
                    for k, v in pairs(vu51) do
                        if k ~= "Player" then v.Text = k .. ": N/A" end
                    end
                    vu51.Player.Text = "Player: Not Found"
                end
            end
            local vu110 = {}
            local function vu115()
                for _, c in pairs(vu110) do
                    pcall(function() c:Disconnect() end)
                end
                vu110 = {}
            end
            local function vu120(pu116)
                vu115()
                if pu116 then
                    local function v118(p117)
                        if p117 then
                            table.insert(vu110, p117.Changed:Connect(function() vu109(pu116) end))
                        end
                    end
                    local v119 = pu116:FindFirstChild("leaderstats") or vu56(pu116, "leaderstats")
                    if v119 then
                        v118(v119:FindFirstChild("Strength") or vu56(v119, "Strength"))
                        v118(v119:FindFirstChild("Rebirths") or vu56(v119, "Rebirths"))
                        v118(v119:FindFirstChild("Kills") or vu56(v119, "Kills"))
                    end
                    v118(pu116:FindFirstChild("Durability") or vu56(pu116, "Durability"))
                    v118(pu116:FindFirstChild("Agility") or vu56(pu116, "Agility"))
                    v118(pu116:FindFirstChild("evilKarma") or vu56(pu116, "evilKarma"))
                    v118(pu116:FindFirstChild("goodKarma") or vu56(pu116, "goodKarma"))
                end
            end
            local vu121 = nil
            infoTab1:AddTextBox(" USERNAME or DISPLAY NAME ", function(p122)
                local v123 = vu75(p122)
                if v123 ~= vu121 then
                    vu121 = v123
                    vu109(v123)
                    vu120(v123)
                end
            end, { clear = false, placeholder = "Type username or display name..." })
            infoTab1:AddLabel("EX  username -mohaop just type mo / display name - ZX_BLA BLA just type ZX")
            vu121 = game.Players.LocalPlayer
            vu109(vu121)
            vu120(vu121)

            -- MAIN TAB
            Main = v1:AddTab("MAIN")
            local v124 = Main:AddFolder("Auto Punch")
            v124:AddSwitch("Auto Punch", function(p125)
                local vu126 = game.Players.LocalPlayer
                local function v132(p127, p128)
                    local v129 = vu126:FindFirstChild("Backpack")
                    local v130 = vu126.Character or vu126.CharacterAdded:Wait()
                    local v131 = v129 and v129:FindFirstChild(p127)
                    if v131 then
                        v131.Parent = v130
                        if p128 then v131.Parent = v129 end
                    end
                end
                if p125 then
                    v132("Punch", false)
                    local v133 = not vu126.Backpack:FindFirstChild("Punch") and vu126.Character
                    if v133 then v133 = vu126.Character:FindFirstChild("Punch") end
                    _G.punchanim = true
                    local v134 = vu126
                    while _G.punchanim do
                        if v133 then
                            if v133.Parent ~= v134.Character then v133.Parent = v134.Character end
                            v133:Activate()
                            task.wait()
                        else
                            _G.punchanim = false
                        end
                    end
                else
                    _G.punchanim = false
                end
            end)
            v124:AddSwitch("Fast Punch ", function(p135)
                local v136 = game.Players.LocalPlayer
                local v137 = v136.Backpack:FindFirstChild("Punch")
                local v138 = game.Workspace:FindFirstChild(v136.Name)
                local v139 = v138 and v138:FindFirstChild("Punch")
                if p135 then
                    if v137 and v137:FindFirstChild("attackTime") then v137.attackTime.Value = 0
                    elseif v139 and v139:FindFirstChild("attackTime") then v139.attackTime.Value = 0 end
                else
                    if v137 and v137:FindFirstChild("attackTime") then v137.attackTime.Value = 0.35
                    elseif v139 and v139:FindFirstChild("attackTime") then v139.attackTime.Value = 0.35 end
                end
            end):Set(false)
            Main:AddLabel("---Auto Farm---")
            local v140 = Main:AddFolder("Jungle Machines")
            local vu141 = false
            v140:AddSwitch("Auto Jungle Bench", function(p142)
                vu141 = p142
                if p142 then
                    task.spawn(function()
                        while vu141 do
                            local v143 = game.Players.LocalPlayer
                            if v143.Character and v143.Character:FindFirstChild("HumanoidRootPart") then
                                v143.Character:SetPrimaryPartCFrame(CFrame.new(-8629.88086, 64.8842468, 1855.03467))
                                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bench"].interactSeat)
                            end
                            task.wait(0.1)
                        end
                    end)
                end
            end)
            local vu144 = false
            v140:AddSwitch("Auto Jungle Bar Lift", function(p145)
                vu144 = p145
                if p145 then
                    task.spawn(function()
                        while vu144 do
                            local v146 = game.Players.LocalPlayer
                            if v146.Character and v146.Character:FindFirstChild("HumanoidRootPart") then
                                v146.Character:SetPrimaryPartCFrame(CFrame.new(-8678.05566, 14.5030098, 2089.25977))
                                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bar Lift"].interactSeat)
                            end
                            task.wait(0.1)
                        end
                    end)
                end
            end)
            local vu147 = false
            v140:AddSwitch("Auto Jungle Squat", function(p148)
                vu147 = p148
                if p148 then
                    task.spawn(function()
                        while vu147 do
                            local v149 = game.Players.LocalPlayer
                            if v149.Character and v149.Character:FindFirstChild("HumanoidRootPart") then
                                v149.Character:SetPrimaryPartCFrame(CFrame.new(-8374.25586, 34.5933418, 2932.44995))
                                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Squat"].interactSeat)
                            end
                            task.wait(0.1)
                        end
                    end)
                end
            end)
            Main:AddLabel("AUTO LIFT FUNCTION")
            local v150 = Main:AddFolder("Auto Equip")
            local vu151 = false
            v150:AddSwitch("Auto Equip Weight", function(p152)
                vu151 = p152
                if p152 then
                    task.spawn(function()
                        while vu151 do
                            local v153 = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
                            if v153 and game.Players.LocalPlayer.Character then v153.Parent = game.Players.LocalPlayer.Character end
                            task.wait(0.1)
                        end
                    end)
                end
            end)
            local vu154 = false
            v150:AddSwitch("Auto Equip Pushups", function(p155)
                vu154 = p155
                if p155 then
                    task.spawn(function()
                        while vu154 do
                            local v156 = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
                            if v156 and game.Players.LocalPlayer.Character then v156.Parent = game.Players.LocalPlayer.Character end
                            task.wait(0.1)
                        end
                    end)
                end
            end)
            local vu157 = false
            v150:AddSwitch("Auto Equip Situps", function(p158)
                vu157 = p158
                if p158 then
                    task.spawn(function()
                        while vu157 do
                            local v159 = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
                            if v159 and game.Players.LocalPlayer.Character then v159.Parent = game.Players.LocalPlayer.Character end
                            task.wait(0.1)
                        end
                    end)
                end
            end)
            local vu160 = false
            v150:AddSwitch("Auto Equip Handstands", function(p161)
                vu160 = p161
                if p161 then
                    task.spawn(function()
                        while vu160 do
                            local v162 = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstand")
                            if v162 and game.Players.LocalPlayer.Character then v162.Parent = game.Players.LocalPlayer.Character end
                            task.wait(0.1)
                        end
                    end)
                end
            end)
            local function vu168(p163)
                local v164 = game.Players.LocalPlayer
                local v165 = v164:FindFirstChild("Backpack")
                local v166 = v164.Character or v164.CharacterAdded:Wait()
                local v167 = v165 and v165:FindFirstChild(p163)
                if not v167 then return nil end
                v167.Parent = v166
                return v167
            end
            local vu169 = false
            local function vu170()
                while vu169 do
                    task.wait(0.1)
                    vu168("Pushup")
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                end
            end
            Main:AddSwitch("Auto lift", function(p171)
                vu169 = p171
                if p171 then coroutine.wrap(vu170)() end
            end)

            -- REBIRTH TAB
            rebirthTab = v1:AddTab("REBIRTH")
            local vu174 = false
            rebirthTab:AddSwitch("Auto King ", function(p175)
                vu174 = p175
                local vu176 = CFrame.new(-8865, 430, -5749)
                local vu177 = game.Players.LocalPlayer
                if p175 then
                    local v178 = vu177.Character or vu177.CharacterAdded:Wait()
                    if v178 and v178:FindFirstChild("HumanoidRootPart") then
                        v178.HumanoidRootPart.CFrame = vu176
                    end
                    getgenv().kingLockConnection = game:GetService("RunService").Heartbeat:Connect(function()
                        local v179 = vu177.Character
                        if v179 and v179:FindFirstChild("HumanoidRootPart") then
                            v179.HumanoidRootPart.CFrame = vu176
                        end
                    end)
                elseif getgenv().kingLockConnection then
                    getgenv().kingLockConnection:Disconnect()
                    getgenv().kingLockConnection = nil
                end
            end)
            local vu180 = false
            local vu181 = nil
            rebirthTab:AddTextBox("Target Rebirth Amount", function(p182)
                vu181 = tonumber(p182)
            end, { clear = false, placeholder = "Enter target rebirth amount" })
            rebirthTab:AddSwitch("Auto Rebirth", function(p183)
                vu180 = p183
                if p183 then
                    coroutine.wrap(function()
                        while vu180 do
                            local v184 = game.Players.LocalPlayer
                            local v185 = v184:FindFirstChild("leaderstats")
                            if v185 then v185 = v184.leaderstats:FindFirstChild("Rebirths") end
                            if v185 and (vu181 and vu181 <= v185.Value) then
                                vu180 = false
                            else
                                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                            end
                            task.wait(0.1)
                        end
                    end)()
                end
            end)
            rebirthTab:AddSwitch("AUTO WEIGHT", function(p186)
                isAutoStrength = p186
                local v187 = game.Players.LocalPlayer
                local v188 = v187:FindFirstChild("Backpack")
                while isAutoStrength do
                    wait(0.01)
                    local v189 = v188 and v188:FindFirstChild("Weight")
                    if v189 then v187.Character.Humanoid:EquipTool(v189) end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer(unpack({"rep"}))
                end
                if not isAutoStrength then
                    local v190 = v187.Character:FindFirstChildOfClass("Tool")
                    if v190 and v190.Name == "Weight" then v190.Parent = v188 end
                end
            end):Set(false)
            local vu191 = nil
            rebirthTab:AddSwitch("Auto Size 2", function(p192)
                if p192 then
                    vu191 = task.spawn(function()
                        while task.wait(0) do
                            game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 2)
                        end
                    end)
                else
                    if vu191 then task.cancel(vu191); vu191 = nil end
                end
            end)
            rebirthTab:AddSwitch("Hide All Frames", function(p193)
                for _, v198 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v198.Name:match("Frame$") then v198.Visible = not p193 end
                end
            end)
            rebirthTab:AddSwitch("Lock Position", function(p199)
                if p199 then
                    local vu200 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vu200
                        end
                    end)
                elseif getgenv().posLock then
                    getgenv().posLock:Disconnect()
                    getgenv().posLock = nil
                end
            end)

            -- KILLS TAB
            local function vu223(p201)
                local v202 = tostring(p201):lower()
                if #v202 == 0 then return nil end
                for _, v207 in ipairs(vu172:GetPlayers()) do
                    if v207.Name:lower() == v202 then return v207 end
                end
                for _, v212 in ipairs(vu172:GetPlayers()) do
                    if v212.DisplayName and v212.DisplayName:lower() == v202 then return v212 end
                end
                for _, v217 in ipairs(vu172:GetPlayers()) do
                    if string.find(v217.Name:lower(), v202, 1, true) then return v217 end
                end
                for _, v222 in ipairs(vu172:GetPlayers()) do
                    if v222.DisplayName and string.find(v222.DisplayName:lower(), v202, 1, true) then return v222 end
                end
                return nil
            end
            local function v226()
                local v224 = vu173.Backpack:FindFirstChild("Punch")
                if v224 and vu173.Character then v224.Parent = vu173.Character end
                return vu173.Character and vu173.Character:FindFirstChild("Punch")
            end
            local v227 = v1:AddTab("KILLS")
            v227:Show()
            v227:AddSwitch("Anti Knockback", function(p228)
                if p228 then
                    local v230 = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")
                    local v231 = Instance.new("BodyVelocity")
                    v231.MaxForce = Vector3.new(100000, 0, 100000)
                    v231.Velocity = Vector3.new(0, 0, 0)
                    v231.P = 1250
                    v231.Parent = v230
                else
                    local v233 = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity")
                    if v233 and v233.MaxForce == Vector3.new(100000, 0, 100000) then v233:Destroy() end
                end
            end)
            local vu234 = {}
            local vu235 = "Teleport"
            local v237 = v227:AddDropdown("Select Kill Method", function(p236)
                vu235 = p236
            end)
            v237:Add("Teleport")
            v237:Add("Non-Teleport")
            local vu243 = v227:AddDropdown("Whitelist Players", function(p238)
                if table.find(vu234, p238) then
                    for i, v in ipairs(vu234) do
                        if v == p238 then table.remove(vu234, i); break end
                    end
                else
                    table.insert(vu234, p238)
                end
            end)
            for _, v254 in ipairs(vu172:GetPlayers()) do
                if v254 ~= vu173 then vu243:Add(v254.Name) end
            end
            vu172.PlayerAdded:Connect(function(p255)
                if p255 ~= vu173 then vu243:Add(p255.Name) end
            end)
            vu172.PlayerRemoving:Connect(function(p256)
                if p256 ~= vu173 then vu243:Remove(p256.Name) end
            end)
            local vu257 = false
            v227:AddSwitch("Kill All Players", function(p258)
                vu257 = p258
                if p258 then
                    task.spawn(function()
                        while vu257 do
                            for _, v263 in ipairs(vu172:GetPlayers()) do
                                if v263 ~= vu173 and not table.find(vu234, v263.Name) then
                                    local v264 = v263.Character and v263.Character:FindFirstChild("HumanoidRootPart")
                                    local v265 = v226()
                                    if v265 and v264 then
                                        if vu235 == "Teleport" and vu173.Character and vu173.Character:FindFirstChild("HumanoidRootPart") then
                                            v264.CFrame = vu173.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-2, 2), 0, math.random(-2, 2))
                                        end
                                        v265:Activate()
                                        local v266 = vu173.Character and vu173.Character:FindFirstChild("RightHand")
                                        local v267 = vu173.Character and vu173.Character:FindFirstChild("LeftHand")
                                        if v266 and v267 then
                                            firetouchinterest(v266, v264, 1)
                                            firetouchinterest(v267, v264, 1)
                                            firetouchinterest(v266, v264, 0)
                                            firetouchinterest(v267, v264, 0)
                                        end
                                    end
                                end
                            end
                            task.wait()
                        end
                    end)
                end
            end)
            v227:AddSwitch("Fast Punch ", function(p268)
                local v269 = game.Players.LocalPlayer
                local v270 = v269.Backpack:FindFirstChild("Punch")
                local v271 = game.Workspace:FindFirstChild(v269.Name)
                local v272 = v271 and v271:FindFirstChild("Punch")
                if p268 then
                    if v270 and v270:FindFirstChild("attackTime") then v270.attackTime.Value = 0
                    elseif v272 and v272:FindFirstChild("attackTime") then v272.attackTime.Value = 0 end
                else
                    if v270 and v270:FindFirstChild("attackTime") then v270.attackTime.Value = 0.35
                    elseif v272 and v272:FindFirstChild("attackTime") then v272.attackTime.Value = 0.35 end
                end
            end):Set(false)
            local vu273 = ""
            v227:AddTextBox("Player Username or Display Name", function(p274)
                vu273 = p274
            end, { clear = false, placeholder = "Type username or display name (partial is OK)" })
            v227:AddLabel("EX: username - mohaop just type mo / display name - ZX_BLA BLA just type ZX")
            local vu275 = false
            v227:AddSwitch("Auto Kill Player", function(p276)
                vu275 = p276
                if p276 then
                    task.spawn(function()
                        while vu275 do
                            local v278 = vu223(vu273)
                            if v278 and v278 ~= vu173 and not table.find(vu234, v278.Name) then
                                local v279 = v278.Character and v278.Character:FindFirstChild("HumanoidRootPart")
                                local v280 = v226()
                                if v280 and v279 then
                                    if vu235 == "Teleport" and vu173.Character and vu173.Character:FindFirstChild("HumanoidRootPart") then
                                        vu173.Character.HumanoidRootPart.CFrame = v279.CFrame * CFrame.new(0, 0, 3)
                                    end
                                    v280:Activate()
                                    local v281 = vu173.Character and vu173.Character:FindFirstChild("RightHand")
                                    local v282 = vu173.Character and vu173.Character:FindFirstChild("LeftHand")
                                    if v281 and v282 then
                                        firetouchinterest(v281, v279, 1)
                                        firetouchinterest(v282, v279, 1)
                                        firetouchinterest(v281, v279, 0)
                                        firetouchinterest(v282, v279, 0)
                                    end
                                    local v283 = vu173:FindFirstChild("muscleEvent")
                                    if v283 then
                                        v283:FireServer("punch", "rightHand")
                                        v283:FireServer("punch", "leftHand")
                                    end
                                end
                            end
                            task.wait()
                        end
                    end)
                end
            end)
            local vu284 = ""
            local vu285 = false
            local vu286 = nil
            v227:AddTextBox("Spy enter Username or Display Name", function(p287)
                vu284 = p287
            end, { clear = false, placeholder = "Type username or display name (partial is OK)" })
            v227:AddSwitch("Spy Player", function(p288)
                vu285 = p288
                local vu289 = workspace.CurrentCamera
                if vu285 then
                    vu286 = vu289.CameraSubject
                    coroutine.wrap(function()
                        while vu285 do
                            local v290 = vu223(vu284)
                            if v290 and v290.Character and v290.Character:FindFirstChild("Humanoid") then
                                vu289.CameraSubject = v290.Character.Humanoid
                            end
                            task.wait(0.25)
                        end
                    end)()
                elseif vu286 then
                    workspace.CurrentCamera.CameraSubject = vu286
                else
                    local v292 = vu173.Character
                    if v292 and v292:FindFirstChild("Humanoid") then
                        workspace.CurrentCamera.CameraSubject = v292.Humanoid
                    end
                end
            end)
            v227:AddLabel("EX: username - mohaop just type mo / display name - ZX_BLA BLA just type ZX")

            -- ROCKS TAB
            local vu293 = game.Players.LocalPlayer
            rocksTab = v1:AddTab("ROCKS")
            rocksTab:AddSwitch("Auto Punch", function(p294)
                if p294 then
                    local v301 = not vu293.Backpack:FindFirstChild("Punch") and vu293.Character
                    if v301 then v301 = vu293.Character:FindFirstChild("Punch") end
                    _G.punchanim = true
                    while _G.punchanim do
                        if v301 then
                            if v301.Parent ~= vu293.Character then v301.Parent = vu293.Character end
                            v301:Activate()
                            task.wait()
                        else
                            _G.punchanim = false
                        end
                    end
                else
                    _G.punchanim = false
                end
            end)
            rocksTab:AddSwitch("Fast Punch [v1]", function(p302)
                local v303 = game.Players.LocalPlayer
                local v304 = v303.Backpack:FindFirstChild("Punch")
                local v305 = game.Workspace:FindFirstChild(v303.Name)
                local v306 = v305 and v305:FindFirstChild("Punch")
                if p302 then
                    if v304 and v304:FindFirstChild("attackTime") then v304.attackTime.Value = 0
                    elseif v306 and v306:FindFirstChild("attackTime") then v306.attackTime.Value = 0 end
                else
                    if v304 and v304:FindFirstChild("attackTime") then v304.attackTime.Value = 0.3
                    elseif v306 and v306:FindFirstChild("attackTime") then v306.attackTime.Value = 0.3 end
                end
            end):Set(false)
            rocksTab:AddSwitch("Hide All Frames", function(p307)
                for _, v312 in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
                    if v312.Name:match("Frame$") then v312.Visible = not p307 end
                end
            end)
            local function vu314()
                local v313 = vu293.Backpack:FindFirstChild("Punch")
                if v313 then v313.Parent = vu293.Character end
            end
            local function vu322(p315)
                while getgenv().autoFarm do
                    wait(0.1)
                    local v316 = vu293.Character
                    if v316 and p315 <= vu293.Durability.Value then
                        for _, v320 in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                            if v320.Name == "neededDurability" and v320.Value == p315 and v316:FindFirstChild("LeftHand") and v316:FindFirstChild("RightHand") then
                                firetouchinterest(v320.Parent.Rock, v316.RightHand, 0)
                                firetouchinterest(v320.Parent.Rock, v316.RightHand, 1)
                                firetouchinterest(v320.Parent.Rock, v316.LeftHand, 0)
                                firetouchinterest(v320.Parent.Rock, v316.LeftHand, 1)
                                vu314()
                            end
                        end
                    end
                    if _G.fastHitActive then
                        vu293.muscleEvent:FireServer("punch", "rightHand")
                        vu293.muscleEvent:FireServer("punch", "leftHand")
                        local v321 = v316 and v316:FindFirstChild("Punch")
                        if v321 then v321:Activate() end
                    end
                end
            end
            rocksTab:AddSwitch("Lock Position", function(p324)
                if p324 then
                    local vu325 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
                        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = vu325
                        end
                    end)
                elseif getgenv().posLock then
                    getgenv().posLock:Disconnect()
                    getgenv().posLock = nil
                end
            end)
            local rockList = {
                {"Jungle Rock", 10000000},
                {"Muscle King Rock", 5000000},
                {"Legnds Rock", 1000000},
                {"Large Rock", 1000000},
                {"Inferno Rock", 750000},
                {"Mystic Rock", 400000},
                {"Froze Rock", 150000},
                {"Golden Rock", 5000},
                {"Punch Rock", 10},
                {"Tiny Rock", 0},
            }
            for _, rockData in ipairs(rockList) do
                local rName, rDur = rockData[1], rockData[2]
                rocksTab:AddSwitch(rName, function()
                    _G.fastHitActive = not _G.fastHitActive
                    if _G.fastHitActive then
                        getgenv().autoFarm = true
                        coroutine.wrap(function()
                            while _G.fastHitActive do
                                if vu293.Character then
                                    for _ = 1, 30 do
                                        vu314()
                                        vu322(rDur)
                                        vu293.muscleEvent:FireServer("punch", "rightHand")
                                        vu293.muscleEvent:FireServer("punch", "leftHand")
                                    end
                                end
                                wait(0.05)
                            end
                        end)()
                    else
                        getgenv().autoFarm = false
                        local v = vu293.Character and vu293.Character:FindFirstChild("Punch")
                        if v then v.Parent = vu293.Backpack end
                    end
                end)
            end

            -- TELEPORT TAB
            teleportTab = v1:AddTab("TELEPORT")
            local vu346 = {
                BEACH = Vector3.new(0, 0, 0),
                ["FROST GYM"] = Vector3.new(-2650, 7, -393),
                ["MYTHICAL GYM"] = Vector3.new(2255, 7, 1071),
                ["ETERNAL GYM"] = Vector3.new(-6768, 7, -1287),
                ["LEGEND GYM"] = Vector3.new(4429, 991, -3880),
                ["MUSCLE KING GYM"] = Vector3.new(-8799, 17, -5798),
                ["JUNGLE GYM"] = Vector3.new(-7894, 6, 2386),
                ["TINY GYM"] = Vector3.new(50, 7, 1918),
                ["LAVA BRAWL"] = Vector3.new(4471, 119, -8836),
                ["DESERT BRAWL"] = Vector3.new(960, 17, -7398),
                SECRET = Vector3.new(1947, 2, 6191)
            }
            local v351 = teleportTab:AddDropdown("Select Location", function(p347)
                local v348 = game.Players.LocalPlayer
                local v349 = (v348.Character or v348.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
                local v350 = vu346[p347]
                if v350 and v349 then v349.CFrame = CFrame.new(v350) end
            end)
            for k, _ in pairs(vu346) do v351:Add(k) end
            local vu356 = game:GetService("ReplicatedStorage")
            local vu357 = "Neon Guardian"
            local v359 = teleportTab:AddDropdown("Select Pet", function(p358)
                vu357 = p358
            end)
            local petList = {"Neon Guardian","Blue Birdie","Blue Bunny","Blue Firecaster","Blue Pheonix","Crimson Falcon","Cybernetic Showdown Dragon","Dark Golem","Dark Legends Manticore","Dark Vampy","Darkstar Hunter","Eternal Strike Leviathan","Frostwave Legends Penguin","Gold Warrior","Golden Pheonix","Golden Viking","Green Butterfly","Green Firecaster","Infernal Dragon","Lightning Strike Phantom","Magic Butterfly","Muscle Sensei","Orange Hedgehog","Orange Pegasus","Phantom Genesis Dragon","Purple Dragon","Purple Falcon","Red Dragon","Red Firecaster","Red Kitty","Silver Dog","Ultimate Supernova Pegasus","Ultra Birdie","White Pegasus","White Pheonix","Yellow Butterfly"}
            for _, pet in ipairs(petList) do v359:Add(pet) end
            teleportTab:AddSwitch("Auto Open Pet", function(p360)
                _G.AutoHatchPet = p360
                if p360 then
                    spawn(function()
                        while _G.AutoHatchPet and vu357 ~= "" do
                            local v361 = vu356.cPetShopFolder:FindFirstChild(vu357)
                            if v361 then vu356.cPetShopRemote:InvokeServer(v361) end
                            task.wait(1)
                        end
                    end)
                end
            end)
            local vu362 = "Blue Aura"
            local v364 = teleportTab:AddDropdown("Select Aura", function(p363)
                vu362 = p363
            end)
            local auraList = {"Astral Electro","Azure Tundra","Blue Aura","Dark Electro","Dark Lightning","Dark Storm","Electro","Enchanted Mirage","Entropic Blast","Eternal Megastrike","Grand Supernova","Green Aura","Inferno","Lightning","Muscle King","Power Lightning","Purple Aura","Purple Nova","Red Aura","Supernova","Ultra Inferno","Ultra Mirage","Unstable Mirage","Yellow Aura"}
            for _, aura in ipairs(auraList) do v364:Add(aura) end
            teleportTab:AddSwitch("Auto Open Auras", function(p365)
                _G.AutoHatchAura = p365
                if p365 then
                    spawn(function()
                        while _G.AutoHatchAura and vu362 ~= "" do
                            local v366 = vu356.cPetShopFolder:FindFirstChild(vu362)
                            if v366 then vu356.cPetShopRemote:InvokeServer(v366) end
                            task.wait(1)
                        end
                    end)
                end
            end)
            teleportTab:AddSwitch("Auto Spin Wheel", function(p367)
                _G.AutoSpinWheel = p367
                if p367 then
                    spawn(function()
                        while _G.AutoSpinWheel and wait(1) do
                            game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"])
                        end
                    end)
                end
            end)

            -- SETTINGS TAB
            settingsTab = v1:AddTab("SETTINGS")
            settingsTab:AddSwitch("Low Graphics", function(p368)
                if p368 then
                    game.Lighting.GlobalShadows = false
                    game.Lighting.FogEnd = 9000000000
                    game.Lighting.Brightness = 0
                    settings().Rendering.QualityLevel = "Level01"
                    for _, v372 in pairs(game:GetDescendants()) do
                        if v372:IsA("BasePart") then v372.Material = Enum.Material.Plastic; v372.Reflectance = 0
                        elseif v372:IsA("ParticleEmitter") or v372:IsA("Trail") then v372.Lifetime = NumberRange.new(0)
                        elseif v372:IsA("Explosion") then v372.BlastPressure = 1; v372.BlastRadius = 1 end
                    end
                else
                    game.Lighting.GlobalShadows = true
                    game.Lighting.FogEnd = 100000
                    game.Lighting.Brightness = 2
                    settings().Rendering.QualityLevel = "Level21"
                    for _, v376 in pairs(game:GetDescendants()) do
                        if v376:IsA("BasePart") then v376.Material = Enum.Material.SmoothPlastic; v376.Reflectance = 0.2
                        elseif v376:IsA("ParticleEmitter") or v376:IsA("Trail") then v376.Lifetime = NumberRange.new(1)
                        elseif v376:IsA("Explosion") then v376.BlastPressure = 500000; v376.BlastRadius = 10 end
                    end
                end
            end)
            settingsTab:AddButton("Free AutoLift Gamepass", function()
                local v377 = game:GetService("ReplicatedStorage").gamepassIds
                local v378 = game:GetService("Players").LocalPlayer
                for _, v382 in pairs(v377:GetChildren()) do
                    local v383 = Instance.new("IntValue")
                    v383.Name = v382.Name
                    v383.Value = v382.Value
                    v383.Parent = v378.ownedGamepasses
                end
            end)
            settingsTab:AddButton("Remove Portals", function()
                for _, v387 in pairs(game:GetDescendants()) do
                    if v387.Name == "RobloxForwardPortals" then v387:Destroy() end
                end
                if _G.AdRemovalConnection then _G.AdRemovalConnection:Disconnect() end
                _G.AdRemovalConnection = game.DescendantAdded:Connect(function(p388)
                    if p388.Name == "RobloxForwardPortals" then p388:Destroy() end
                end)
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Ads Removed",
                    Text = "Roblox ad portals have been removed",
                    Duration = 3
                })
            end)
            settingsTab:AddButton("Enable Anti-AFK", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))()
            end)
            settingsTab:AddButton("Enable Anti-LAG/AFK by moha", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/MAIN%20AINTI%20AFK%20.txt"))()
            end)
            settingsTab:AddButton("Enable Anti-AFK v2 by moha", function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/New%20anti%20afk%20v2"))()
            end)
            local vu389 = {}
            local vu390 = 2048
            local vu391 = Vector3.new(-2, -9.5, -2)
            local vu392 = math.ceil(50000 / vu390)
            local function vu400()
                for v393 = 0, vu392 - 1 do
                    for v395 = 0, vu392 - 1 do
                        local function makePart(pos)
                            local p = Instance.new("Part")
                            p.Size = Vector3.new(vu390, 1, vu390)
                            p.Position = pos
                            p.Anchored = true
                            p.Transparency = 1
                            p.CanCollide = true
                            p.Parent = workspace
                            table.insert(vu389, p)
                        end
                        makePart(vu391 + Vector3.new(v393 * vu390, 0, v395 * vu390))
                        makePart(vu391 + Vector3.new(-v393 * vu390, 0, v395 * vu390))
                        makePart(vu391 + Vector3.new(-v393 * vu390, 0, -v395 * vu390))
                        makePart(vu391 + Vector3.new(v393 * vu390, 0, -v395 * vu390))
                    end
                end
            end
            local function vu405()
                for _, v404 in ipairs(vu389) do
                    if v404 and v404.Parent then v404.CanCollide = false end
                end
            end
            settingsTab:AddSwitch("Walk on Water", function(p406)
                if p406 then vu400() else vu405() end
            end)
            local v409 = settingsTab:AddDropdown("Change Time", function(p407)
                local v408 = game:GetService("Lighting")
                if p407 == "Night" then
                    v408.ClockTime = 0; v408.Brightness = 1; v408.Ambient = Color3.fromRGB(40, 40, 40)
                elseif p407 == "Day" then
                    v408.ClockTime = 12; v408.Brightness = 2; v408.Ambient = Color3.fromRGB(255, 255, 255)
                elseif p407 == "Alora" then
                    v408.ClockTime = 18; v408.Brightness = 1; v408.Ambient = Color3.fromRGB(255, 170, 0)
                elseif p407 == "2nd Alora Night" then
                    v408.ClockTime = 20; v408.Brightness = 0.9
                    v408.Ambient = Color3.fromRGB(0, 255, 120)
                    v408.OutdoorAmbient = Color3.fromRGB(0, 120, 255)
                end
                if game:GetService("Lighting"):FindFirstChild("GalaxyStars") then
                    game:GetService("Lighting").GalaxyStars.Enabled = false
                end
            end)
            v409:Add("Night")
            v409:Add("Day")
            v409:Add("Alora")
            v409:Add("2nd Alora Night")


            -- ══════════════════════════════════════
            -- GIFTING TAB
            -- ══════════════════════════════════════
            local giftTab = v1:AddTab("GIFTING")
            local giftPlayers = game:GetService("Players")
            local giftLocalPlayer = giftPlayers.LocalPlayer
            local giftRS = game:GetService("ReplicatedStorage")

            giftTab:AddLabel("[ GIFTING TAB ]")
            giftTab:AddLabel("NOTE: Get on a Machine while gifting!")

            local proteinEggCount = giftTab:AddLabel("Protein Eggs: 0")
            local tropicalShakeCount = giftTab:AddLabel("Tropical Shakes: 0")

            local function updateInventory()
                local consumables = giftLocalPlayer:FindFirstChild("consumablesFolder")
                local eggs = 0
                local shakes = 0
                if consumables then
                    for _, item in ipairs(consumables:GetChildren()) do
                        if item.Name == "Protein Egg" then eggs = eggs + 1 end
                        if item.Name == "Tropical Shake" then shakes = shakes + 1 end
                    end
                end
                proteinEggCount.Text = "Protein Eggs: " .. eggs
                tropicalShakeCount.Text = "Tropical Shakes: " .. shakes
            end
            task.spawn(function()
                while task.wait(5) do updateInventory() end
            end)
            updateInventory()

            giftTab:AddLabel("══════════════════════════════")
            giftTab:AddLabel("PROTEIN EGG GIFTER")

            local selectedEggPlayer = nil
            local eggAmount = 0

            local eggPlayerDropdown = giftTab:AddDropdown("Choose Player (Egg)", function(selected)
                local name = selected:match("| (.+)$")
                if name then selectedEggPlayer = giftPlayers:FindFirstChild(name) end
            end)
            for _, player in ipairs(giftPlayers:GetPlayers()) do
                if player ~= giftLocalPlayer then
                    eggPlayerDropdown:Add(player.DisplayName .. " | " .. player.Name)
                end
            end
            giftPlayers.PlayerAdded:Connect(function(player)
                if player ~= giftLocalPlayer then
                    eggPlayerDropdown:Add(player.DisplayName .. " | " .. player.Name)
                end
            end)
            giftPlayers.PlayerRemoving:Connect(function(player)
                if player ~= giftLocalPlayer then
                    eggPlayerDropdown:Remove(player.DisplayName .. " | " .. player.Name)
                end
            end)
            giftTab:AddTextBox("Amount of Eggs to Gift", function(val)
                eggAmount = tonumber(val) or 0
            end, { clear = false, placeholder = "Enter amount e.g. 5" })
            giftTab:AddButton("Gift Protein Eggs", function()
                if not selectedEggPlayer then
                    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "SCP HUB", Text = "Select a player first!", Duration = 3})
                    return
                end
                if eggAmount <= 0 then
                    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "SCP HUB", Text = "Enter a valid amount!", Duration = 3})
                    return
                end
                task.spawn(function()
                    for i = 1, eggAmount do
                        local egg = giftLocalPlayer.consumablesFolder:FindFirstChild("Protein Egg")
                        if egg then
                            giftRS.rEvents.giftRemote:InvokeServer(selectedEggPlayer, egg)
                        end
                        task.wait(0.5)
                    end
                    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "SCP HUB", Text = "Gifted " .. eggAmount .. " Protein Egg(s) to " .. selectedEggPlayer.Name .. "!", Duration = 4})
                    updateInventory()
                end)
            end)

            giftTab:AddLabel("══════════════════════════════")
            giftTab:AddLabel("TROPICAL SHAKE GIFTER")

            local selectedShakePlayer = nil
            local shakeAmount = 0

            local shakePlayerDropdown = giftTab:AddDropdown("Choose Player (Shake)", function(selected)
                local name = selected:match("| (.+)$")
                if name then selectedShakePlayer = giftPlayers:FindFirstChild(name) end
            end)
            for _, player in ipairs(giftPlayers:GetPlayers()) do
                if player ~= giftLocalPlayer then
                    shakePlayerDropdown:Add(player.DisplayName .. " | " .. player.Name)
                end
            end
            giftPlayers.PlayerAdded:Connect(function(player)
                if player ~= giftLocalPlayer then
                    shakePlayerDropdown:Add(player.DisplayName .. " | " .. player.Name)
                end
            end)
            giftPlayers.PlayerRemoving:Connect(function(player)
                if player ~= giftLocalPlayer then
                    shakePlayerDropdown:Remove(player.DisplayName .. " | " .. player.Name)
                end
            end)
            giftTab:AddTextBox("Amount of Shakes to Gift", function(val)
                shakeAmount = tonumber(val) or 0
            end, { clear = false, placeholder = "Enter amount e.g. 5" })
            giftTab:AddButton("Gift Tropical Shakes", function()
                if not selectedShakePlayer then
                    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "SCP HUB", Text = "Select a player first!", Duration = 3})
                    return
                end
                if shakeAmount <= 0 then
                    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "SCP HUB", Text = "Enter a valid amount!", Duration = 3})
                    return
                end
                task.spawn(function()
                    for i = 1, shakeAmount do
                        local shake = giftLocalPlayer.consumablesFolder:FindFirstChild("Tropical Shake")
                        if shake then
                            giftRS.rEvents.giftRemote:InvokeServer(selectedShakePlayer, shake)
                        end
                        task.wait(0.5)
                    end
                    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "SCP HUB", Text = "Gifted " .. shakeAmount .. " Tropical Shake(s) to " .. selectedShakePlayer.Name .. "!", Duration = 4})
                    updateInventory()
                end)
            end)

        else
            -- Wrong key
            Status.TextColor3 = Color3.fromRGB(255, 60, 60)
            Status.Text = "❌ Invalid key! Get one at our Discord."
            setclipboard("https://discord.gg/nDSy4jdVDc")
            Button.Active = true
        end
    end)
end)
