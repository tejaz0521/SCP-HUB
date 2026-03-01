-- ╔══════════════════════════════════════════════════╗
--   ⚡ SCP HUB - GAME SELECTOR  |  Made by TEJAZ ⚡
--        discord.gg/nDSy4jdVDc  |  ON TOP 🔥
-- ╚══════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- ══════════════════════════════════════
-- 🔗 YOUR LINKS
-- ══════════════════════════════════════
local WHITELIST_URL   = "https://pastebin.com/raw/RULnktcp"
local SECRET_PAID_URL = "https://pastebin.com/raw/kyMmrcQN"
local FREE_ML_URL     = "https://raw.githubusercontent.com/tejaz0521/Scrip_scp/refs/heads/main/SCP_PUBLIC_FIRE.lua"
local RIVALS_URL      = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RIVALS.lua"
local RACECLICKER_URL = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RACECLICKER.lua"

repeat task.wait() until LocalPlayer and LocalPlayer.Character

-- ══════════════════════════════════════
-- 🔐 WHITELIST CHECK
-- ══════════════════════════════════════
local function isWhitelisted(username)
    local ok, result = pcall(function() return game:HttpGet(WHITELIST_URL) end)
    if ok and result then
        for user in string.gmatch(result, "[^\r\n]+") do
            if string.lower(user:match("^%s*(.-)%s*$")) == string.lower(username) then
                return true
            end
        end
    end
    return false
end

-- ══════════════════════════════════════
-- 🎨 BUILD GUI
-- ══════════════════════════════════════
local gui = Instance.new("ScreenGui")
gui.Name = "SCPHub"
gui.ResetOnSpawn = false
gui.DisplayOrder = 100
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- No background overlay

-- Main window
local win = Instance.new("Frame")
win.Size = UDim2.new(0,310,0,560)
win.Position = UDim2.new(0.5,-155,0.5,-280)
win.BackgroundColor3 = Color3.fromRGB(7,7,10)
win.BorderSizePixel = 0
win.Parent = gui
Instance.new("UICorner",win).CornerRadius = UDim.new(0,22)

-- Outer glow border (animated red)
local outerBorder = Instance.new("UIStroke")
outerBorder.Color = Color3.fromRGB(220,0,0)
outerBorder.Thickness = 2.5
outerBorder.Parent = win

-- ══ HEADER ══
local header = Instance.new("Frame")
header.Size = UDim2.new(1,0,0,130)
header.BackgroundColor3 = Color3.fromRGB(12,12,18)
header.BorderSizePixel = 0
header.Parent = win
Instance.new("UICorner",header).CornerRadius = UDim.new(0,22)

-- Header bottom fix
local hFix = Instance.new("Frame")
hFix.Size = UDim2.new(1,0,0.4,0)
hFix.Position = UDim2.new(0,0,0.6,0)
hFix.BackgroundColor3 = Color3.fromRGB(12,12,18)
hFix.BorderSizePixel = 0
hFix.Parent = header

-- Red gradient bar at very top
local topAccent = Instance.new("Frame")
topAccent.Size = UDim2.new(1,0,0,4)
topAccent.BackgroundColor3 = Color3.fromRGB(220,0,0)
topAccent.BorderSizePixel = 0
topAccent.Parent = win
Instance.new("UICorner",topAccent).CornerRadius = UDim.new(0,22)

-- Logo image
local logoImg = Instance.new("ImageLabel")
logoImg.Size = UDim2.new(0,70,0,70)
logoImg.Position = UDim2.new(0.5,-35,0,12)
logoImg.BackgroundTransparency = 1
logoImg.Image = "rbxassetid://125515680929159"
logoImg.ScaleType = Enum.ScaleType.Fit
logoImg.Parent = header

-- SCP HUB title
local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1,0,0,28)
hubTitle.Position = UDim2.new(0,0,0,85)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "⚡ SCP HUB ⚡"
hubTitle.TextColor3 = Color3.fromRGB(255,255,255)
hubTitle.TextSize = 22
hubTitle.Font = Enum.Font.GothamBlack
hubTitle.Parent = header

-- Subtitle
local hubSub = Instance.new("TextLabel")
hubSub.Size = UDim2.new(1,0,0,20)
hubSub.Position = UDim2.new(0,0,0,112)
hubSub.BackgroundTransparency = 1
hubSub.Text = "🔥 SELECT YOUR GAME 🔥"
hubSub.TextColor3 = Color3.fromRGB(220,0,0)
hubSub.TextSize = 12
hubSub.Font = Enum.Font.GothamBold
hubSub.Parent = header

-- Welcome strip
local welcomeStrip = Instance.new("Frame")
welcomeStrip.Size = UDim2.new(1,-20,0,32)
welcomeStrip.Position = UDim2.new(0,10,0,135)
welcomeStrip.BackgroundColor3 = Color3.fromRGB(15,15,22)
welcomeStrip.BorderSizePixel = 0
welcomeStrip.Parent = win
Instance.new("UICorner",welcomeStrip).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke",welcomeStrip).Color = Color3.fromRGB(35,35,50)

local welcomeLbl = Instance.new("TextLabel")
welcomeLbl.Size = UDim2.new(1,-10,1,0)
welcomeLbl.Position = UDim2.new(0,5,0,0)
welcomeLbl.BackgroundTransparency = 1
welcomeLbl.Text = "👋  Welcome back,  " .. LocalPlayer.DisplayName .. "  !"
welcomeLbl.TextColor3 = Color3.fromRGB(180,180,200)
welcomeLbl.TextSize = 12
welcomeLbl.Font = Enum.Font.GothamBold
welcomeLbl.TextXAlignment = Enum.TextXAlignment.Left
welcomeLbl.Parent = welcomeStrip

-- Section label
local sectionLbl = Instance.new("TextLabel")
sectionLbl.Size = UDim2.new(1,-20,0,20)
sectionLbl.Position = UDim2.new(0,10,0,175)
sectionLbl.BackgroundTransparency = 1
sectionLbl.Text = "━━  GAMES  ━━━━━━━━━━━━━━━━━━━━━━━━━━"
sectionLbl.TextColor3 = Color3.fromRGB(80,80,100)
sectionLbl.TextSize = 10
sectionLbl.Font = Enum.Font.GothamBold
sectionLbl.TextXAlignment = Enum.TextXAlignment.Left
sectionLbl.Parent = win

-- Scroll frame for buttons
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,-20,0,310)
scroll.Position = UDim2.new(0,10,0,198)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Color3.fromRGB(220,0,0)
scroll.ElasticBehavior = Enum.ElasticBehavior.Always
scroll.ScrollingEnabled = true
scroll.CanvasSize = UDim2.new(0,0,0,0)
scroll.Parent = win

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,8)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = scroll
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scroll.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y+8)
end)

-- Bottom bar
local bottomBar = Instance.new("Frame")
bottomBar.Size = UDim2.new(1,0,0,42)
bottomBar.Position = UDim2.new(0,0,1,-42)
bottomBar.BackgroundColor3 = Color3.fromRGB(12,12,18)
bottomBar.BorderSizePixel = 0
bottomBar.Parent = win
Instance.new("UICorner",bottomBar).CornerRadius = UDim.new(0,22)

local botFix = Instance.new("Frame")
botFix.Size = UDim2.new(1,0,0.5,0)
botFix.BackgroundColor3 = Color3.fromRGB(12,12,18)
botFix.BorderSizePixel = 0
botFix.Parent = bottomBar

local discordLbl = Instance.new("TextLabel")
discordLbl.Size = UDim2.new(0.6,0,1,0)
discordLbl.Position = UDim2.new(0,12,0,0)
discordLbl.BackgroundTransparency = 1
discordLbl.Text = "💬 discord.gg/nDSy4jdVDc"
discordLbl.TextColor3 = Color3.fromRGB(220,0,0)
discordLbl.TextSize = 11
discordLbl.Font = Enum.Font.GothamBold
discordLbl.TextXAlignment = Enum.TextXAlignment.Left
discordLbl.Parent = bottomBar

local madeLbl = Instance.new("TextLabel")
madeLbl.Size = UDim2.new(0.4,0,1,0)
madeLbl.Position = UDim2.new(0.6,0,0,0)
madeLbl.BackgroundTransparency = 1
madeLbl.Text = "Made by TEJAZ 👑"
madeLbl.TextColor3 = Color3.fromRGB(100,100,120)
madeLbl.TextSize = 10
madeLbl.Font = Enum.Font.GothamBold
madeLbl.TextXAlignment = Enum.TextXAlignment.Right
madeLbl.Parent = bottomBar

-- ══════════════════════════════════════
-- 🔄 STATUS OVERLAY
-- ══════════════════════════════════════
local statusOverlay = Instance.new("Frame")
statusOverlay.Size = UDim2.new(1,0,1,0)
statusOverlay.BackgroundColor3 = Color3.fromRGB(7,7,10)
statusOverlay.BackgroundTransparency = 1
statusOverlay.BorderSizePixel = 0
statusOverlay.Visible = false
statusOverlay.ZIndex = 20
statusOverlay.Parent = win
Instance.new("UICorner",statusOverlay).CornerRadius = UDim.new(0,22)

local statusLogoImg = Instance.new("ImageLabel")
statusLogoImg.Size = UDim2.new(0,70,0,70)
statusLogoImg.Position = UDim2.new(0.5,-35,0.25,0)
statusLogoImg.BackgroundTransparency = 1
statusLogoImg.Image = "rbxassetid://125515680929159"
statusLogoImg.ScaleType = Enum.ScaleType.Fit
statusLogoImg.ZIndex = 21
statusLogoImg.Parent = statusOverlay

local statusIcon = Instance.new("TextLabel")
statusIcon.Size = UDim2.new(1,0,0,45)
statusIcon.Position = UDim2.new(0,0,0.5,-20)
statusIcon.BackgroundTransparency = 1
statusIcon.Text = "⏳"
statusIcon.TextSize = 30
statusIcon.Font = Enum.Font.GothamBold
statusIcon.ZIndex = 21
statusIcon.Parent = statusOverlay

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1,-20,0,30)
statusText.Position = UDim2.new(0,10,0.5,28)
statusText.BackgroundTransparency = 1
statusText.Text = "Loading..."
statusText.TextColor3 = Color3.fromRGB(255,255,255)
statusText.TextSize = 16
statusText.Font = Enum.Font.GothamBlack
statusText.ZIndex = 21
statusText.Parent = statusOverlay

local statusSub = Instance.new("TextLabel")
statusSub.Size = UDim2.new(1,-20,0,22)
statusSub.Position = UDim2.new(0,10,0.5,60)
statusSub.BackgroundTransparency = 1
statusSub.Text = "Please wait..."
statusSub.TextColor3 = Color3.fromRGB(140,140,160)
statusSub.TextSize = 12
statusSub.Font = Enum.Font.Gotham
statusSub.ZIndex = 21
statusSub.Parent = statusOverlay

local function showStatus(icon, text, sub, color)
    statusOverlay.Visible = true
    statusOverlay.BackgroundTransparency = 0
    statusIcon.Text = icon
    statusText.Text = text
    statusText.TextColor3 = color or Color3.fromRGB(255,255,255)
    statusSub.Text = sub
end

-- ══════════════════════════════════════
-- 🎮 LOAD FUNCTION
-- ══════════════════════════════════════
local function loadScript(url, name)
    showStatus("⏳", "Loading "..name.."...", "Connecting to server...", Color3.fromRGB(255,200,0))
    task.wait(1)
    local ok = pcall(function() loadstring(game:HttpGet(url))() end)
    if ok then
        showStatus("✅", name.." Loaded!", "Have fun! 🔥", Color3.fromRGB(0,220,100))
        task.wait(1.5)
        gui:Destroy()
    else
        showStatus("❌", "Failed to load!", "Report at discord.gg/nDSy4jdVDc", Color3.fromRGB(255,50,50))
        task.wait(3)
        gui:Destroy()
    end
end

-- ══════════════════════════════════════
-- 🔘 BUTTON CREATOR
-- ══════════════════════════════════════
local function makeButton(icon, title, tag, tagColor, bgColor, accentColor, order, cb)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,62)
    btn.BackgroundColor3 = Color3.fromRGB(14,14,20)
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.LayoutOrder = order
    btn.AutoButtonColor = false
    btn.Parent = scroll
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,14)

    -- Left accent bar
    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0,4,0.7,0)
    accent.Position = UDim2.new(0,0,0.15,0)
    accent.BackgroundColor3 = accentColor
    accent.BorderSizePixel = 0
    accent.Parent = btn
    Instance.new("UICorner",accent).CornerRadius = UDim.new(0,4)

    -- Icon
    local iconLbl = Instance.new("TextLabel")
    iconLbl.Size = UDim2.new(0,40,1,0)
    iconLbl.Position = UDim2.new(0,10,0,0)
    iconLbl.BackgroundTransparency = 1
    iconLbl.Text = icon
    iconLbl.TextSize = 26
    iconLbl.Font = Enum.Font.GothamBold
    iconLbl.Parent = btn

    -- Title
    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size = UDim2.new(1,-100,0,24)
    titleLbl.Position = UDim2.new(0,56,0,10)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = title
    titleLbl.TextColor3 = Color3.fromRGB(240,240,255)
    titleLbl.TextSize = 15
    titleLbl.Font = Enum.Font.GothamBlack
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left
    titleLbl.Parent = btn

    -- Tag badge
    local tagBg = Instance.new("Frame")
    tagBg.Size = UDim2.new(0,0,0,20)
    tagBg.Position = UDim2.new(0,56,0,36)
    tagBg.BackgroundColor3 = tagColor
    tagBg.BorderSizePixel = 0
    tagBg.AutomaticSize = Enum.AutomaticSize.X
    tagBg.Parent = btn
    Instance.new("UICorner",tagBg).CornerRadius = UDim.new(0,6)

    local tagLbl = Instance.new("TextLabel")
    tagLbl.Size = UDim2.new(0,0,1,0)
    tagLbl.BackgroundTransparency = 1
    tagLbl.Text = "  "..tag.."  "
    tagLbl.TextColor3 = Color3.fromRGB(255,255,255)
    tagLbl.TextSize = 10
    tagLbl.Font = Enum.Font.GothamBold
    tagLbl.AutomaticSize = Enum.AutomaticSize.X
    tagLbl.Parent = tagBg

    -- Arrow
    local arrow = Instance.new("TextLabel")
    arrow.Size = UDim2.new(0,30,1,0)
    arrow.Position = UDim2.new(1,-35,0,0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "›"
    arrow.TextColor3 = Color3.fromRGB(80,80,100)
    arrow.TextSize = 28
    arrow.Font = Enum.Font.GothamBold
    arrow.Parent = btn

    -- Stroke
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(30,30,45)
    stroke.Thickness = 1
    stroke.Parent = btn

    -- Hover
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(20,20,30)}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.15), {Color = accentColor}):Play()
        TweenService:Create(arrow, TweenInfo.new(0.15), {TextColor3 = accentColor}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(14,14,20)}):Play()
        TweenService:Create(stroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(30,30,45)}):Play()
        TweenService:Create(arrow, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(80,80,100)}):Play()
    end)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08), {Size = UDim2.new(1,0,0,58)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.08), {Size = UDim2.new(1,0,0,62)}):Play()
    end)
    btn.MouseButton1Click:Connect(cb)
end

-- ══════════════════════════════════════
-- 🎮 CREATE BUTTONS
-- ══════════════════════════════════════

-- 💎 Muscle Legends PAID
makeButton("💎","Muscle Legends PAID","💰 PAID • WHITELIST",
    Color3.fromRGB(150,0,200), Color3.fromRGB(80,0,120), Color3.fromRGB(180,0,255), 1,
    function()
        showStatus("⏳","Checking whitelist...","Verifying your access... 🔐", Color3.fromRGB(255,200,0))
        task.wait(1.5)
        if isWhitelisted(LocalPlayer.Name) then
            showStatus("✅","Access Granted! 👑","Loading PAID script...", Color3.fromRGB(0,220,100))
            task.wait(1)
            local ok = pcall(function() loadstring(game:HttpGet(SECRET_PAID_URL))() end)
            if ok then
                showStatus("✅","PAID Script Loaded! 🔥","Enjoy the premium features!", Color3.fromRGB(0,220,100))
                task.wait(1.5)
                gui:Destroy()
            else
                showStatus("❌","Failed!","Report at discord.gg/nDSy4jdVDc", Color3.fromRGB(255,50,50))
                task.wait(3); gui:Destroy()
            end
        else
            showStatus("❌","Not Whitelisted! 🔒","Buy access at discord.gg/nDSy4jdVDc", Color3.fromRGB(255,50,50))
            task.wait(2); gui:Destroy()
            LocalPlayer:Kick("❌ SCP HUB | Not whitelisted! Buy at discord.gg/nDSy4jdVDc")
        end
    end)

-- 🆓 Muscle Legends FREE
makeButton("💪","Muscle Legends FREE","🆓 FREE • PUBLIC",
    Color3.fromRGB(180,0,0), Color3.fromRGB(80,0,0), Color3.fromRGB(220,0,0), 2,
    function()
        showStatus("⏳","Loading FREE Script...","Please wait... 💪", Color3.fromRGB(255,200,0))
        task.wait(1)
        local ok2 = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tejaz0521/Scrip_scp/refs/heads/main/obfuscated_script-1772178325138.lua.txt"))()
        end)
        if ok2 then
            showStatus("✅","FREE Script Loaded! 🎉","Enjoy! discord.gg/nDSy4jdVDc", Color3.fromRGB(0,220,100))
            task.wait(1.5); gui:Destroy()
        else
            showStatus("❌","Failed!","Report at discord.gg/nDSy4jdVDc", Color3.fromRGB(255,50,50))
            task.wait(3); gui:Destroy()
        end
    end)

-- ⚔️ Rivals
makeButton("⚔️","Rivals","🔑 KEY REQUIRED",
    Color3.fromRGB(0,80,200), Color3.fromRGB(0,40,100), Color3.fromRGB(0,120,255), 3,
    function() loadScript(RIVALS_URL,"⚔️ Rivals") end)

-- 🏎️ Race Clicker
makeButton("🏎️","Race Clicker","🔑 KEY REQUIRED",
    Color3.fromRGB(100,0,160), Color3.fromRGB(50,0,80), Color3.fromRGB(140,0,220), 4,
    function() loadScript(RACECLICKER_URL,"🏎️ Race Clicker") end)

-- ══════════════════════════════════════
-- ✨ ANIMATIONS
-- ══════════════════════════════════════

-- Slide in animation
win.Position = UDim2.new(0.5,-155,1.5,0)
win.BackgroundTransparency = 1
TweenService:Create(win, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5,-155,0.5,-280),
    BackgroundTransparency = 0
}):Play()

-- Animated border glow
task.spawn(function()
    local t = 0
    while gui.Parent do
        t = t + 0.02
        local r = (math.sin(t) + 1) / 2
        outerBorder.Color = Color3.new(0.8 + r*0.2, 0, 0)
        task.wait(0.05)
    end
end)

-- Rainbow welcome text
task.spawn(function()
    local h = 0
    while gui.Parent do
        h = (h + 0.003) % 1
        hubSub.TextColor3 = Color3.fromHSV(h, 1, 1)
        task.wait(0.05)
    end
end)

-- Pulse logo
task.spawn(function()
    while gui.Parent do
        TweenService:Create(logoImg, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0,75,0,75)
        }):Play()
        task.wait(1)
        TweenService:Create(logoImg, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0,70,0,70)
        }):Play()
        task.wait(1)
    end
end)
