-- ╔══════════════════════════════════════════════════╗
--    ⚡  SCP HUB  |  GAME SELECTOR  V5
--    👑 Made by TEJAZ  |  discord.gg/nDSy4jdVDc
-- ╚══════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local TS      = game:GetService("TweenService")
local LP      = Players.LocalPlayer
repeat task.wait() until LP and LP.Character

-- ── LINKS ──────────────────────────────────────────
local WHITELIST_URL   = "https://pastebin.com/raw/RULnktcp"
local PAID_URL        = "https://pastebin.com/raw/kyMmrcQN"
local FREE_URL        = "https://raw.githubusercontent.com/tejaz0521/Scrip_scp/refs/heads/main/SCP_HUB_V5.lua"
local RIVALS_URL      = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RIVALS.lua"
local RACECLICKER_URL = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RACECLICKER.lua"

-- ── WHITELIST ──────────────────────────────────────
local function isWhitelisted(name)
    local ok, res = pcall(function() return game:HttpGet(WHITELIST_URL) end)
    if not ok then return false end
    for line in res:gmatch("[^\r\n]+") do
        if line:match("^%s*(.-)%s*$"):lower() == name:lower() then return true end
    end
    return false
end

-- ── ELITE THEME (Deep Space + Vivid Accents) ───────
local C = {
    bg      = Color3.fromRGB(8, 8, 14),       -- near-black deep navy
    panel   = Color3.fromRGB(13, 13, 22),      -- panel
    card    = Color3.fromRGB(17, 17, 30),      -- cards
    cardH   = Color3.fromRGB(22, 22, 38),      -- card hover
    border  = Color3.fromRGB(35, 35, 60),      -- default border
    white   = Color3.fromRGB(255, 255, 255),
    off     = Color3.fromRGB(155, 155, 185),   -- dim text
    muted   = Color3.fromRGB(60, 60, 90),      -- very dim
    red     = Color3.fromRGB(230, 30, 30),
    orange  = Color3.fromRGB(255, 130, 0),
    cyan    = Color3.fromRGB(0, 210, 255),
    purple  = Color3.fromRGB(160, 60, 255),
    green   = Color3.fromRGB(0, 220, 110),
    gold    = Color3.fromRGB(255, 200, 0),
}

-- ── HELPERS ────────────────────────────────────────
local function cr(i, r) local c = Instance.new("UICorner", i); c.CornerRadius = UDim.new(0, r or 12) end
local function ms(i, col, th) local s = Instance.new("UIStroke", i); s.Color = col; s.Thickness = th or 1.5; return s end
local function lbl(parent, props)
    local l = Instance.new("TextLabel", parent)
    l.BackgroundTransparency = 1
    for k, v in pairs(props) do l[k] = v end
    return l
end
local function pad(parent, c)
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1,0,0.5,0); f.Position = UDim2.new(0,0,0.5,0)
    f.BackgroundColor3 = c; f.BorderSizePixel = 0
end

-- ── MAIN GUI ───────────────────────────────────────
local gui = Instance.new("ScreenGui")
gui.Name = "SCPSelectorV5"; gui.ResetOnSpawn = false
gui.DisplayOrder = 200; gui.Parent = LP:WaitForChild("PlayerGui")

local win = Instance.new("Frame", gui)
win.Size = UDim2.new(0, 340, 0, 610)
win.Position = UDim2.new(0.5, -170, 1.5, 0)
win.BackgroundColor3 = C.bg
win.BorderSizePixel = 0; win.Active = true; win.Draggable = true
cr(win, 26)
local winBdr = ms(win, C.red, 2)

-- ── GRADIENT HEADER PANEL ──────────────────────────
local hdrFrame = Instance.new("Frame", win)
hdrFrame.Size = UDim2.new(1, 0, 0, 168)
hdrFrame.BackgroundColor3 = C.panel
hdrFrame.BorderSizePixel = 0; cr(hdrFrame, 26)
pad(hdrFrame, C.panel)

-- Colour band at very top
local topBand = Instance.new("Frame", win)
topBand.Size = UDim2.new(1, 0, 0, 3)
topBand.BackgroundColor3 = C.red; topBand.BorderSizePixel = 0; topBand.ZIndex = 4
cr(topBand, 26)

-- Glow dot behind logo
local glow = Instance.new("ImageLabel", hdrFrame)
glow.Size = UDim2.new(0, 130, 0, 130); glow.Position = UDim2.new(0.5, -65, 0, -20)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://7072725342"  -- circular gradient glow
glow.ImageColor3 = C.red; glow.ImageTransparency = 0.68; glow.ZIndex = 2

-- Logo
local logo = Instance.new("ImageLabel", hdrFrame)
logo.Size = UDim2.new(0, 78, 0, 78); logo.Position = UDim2.new(0.5, -39, 0, 14)
logo.BackgroundTransparency = 1; logo.Image = "rbxassetid://125515680929159"
logo.ScaleType = Enum.ScaleType.Fit; logo.ZIndex = 3

-- Title
lbl(hdrFrame, {
    Size=UDim2.new(1,0,0,28), Position=UDim2.new(0,0,0,97),
    Text="⚡  SCP  HUB  ⚡", TextColor3=C.white, TextSize=24,
    Font=Enum.Font.GothamBlack, ZIndex=3
})
-- Animated rainbow subtitle
local rainbowTag = lbl(hdrFrame, {
    Size=UDim2.new(1,0,0,18), Position=UDim2.new(0,0,0,126),
    Text="🔥 SELECT YOUR GAME 🔥", TextColor3=C.orange, TextSize=12,
    Font=Enum.Font.GothamBold, ZIndex=3
})
-- User chip
local userChip = Instance.new("Frame", hdrFrame)
userChip.Size = UDim2.new(0, 0, 0, 22); userChip.Position = UDim2.new(0.5, 0, 0, 147)
userChip.BackgroundColor3 = C.card; userChip.BorderSizePixel = 0
userChip.AutomaticSize = Enum.AutomaticSize.X; userChip.AnchorPoint = Vector2.new(0.5, 0)
userChip.ZIndex = 3; cr(userChip, 11)
ms(userChip, C.border, 1)
lbl(userChip, {
    Size=UDim2.new(0,0,1,0), Position=UDim2.new(0,0,0,0),
    Text="  👋 "..LP.DisplayName.."  ", TextColor3=C.off, TextSize=11,
    Font=Enum.Font.GothamBold, AutomaticSize=Enum.AutomaticSize.X, ZIndex=4
})

-- ── SECTION DIVIDER ────────────────────────────────
local divF = Instance.new("Frame", win)
divF.Size = UDim2.new(1,-24,0,1); divF.Position = UDim2.new(0,12,0,174)
divF.BackgroundColor3 = C.border; divF.BorderSizePixel = 0

local sectionLbl = lbl(win, {
    Size=UDim2.new(1,-24,0,16), Position=UDim2.new(0,12,0,180),
    Text="GAMES", TextColor3=C.muted, TextSize=10,
    Font=Enum.Font.GothamBlack, TextXAlignment=Enum.TextXAlignment.Left
})

-- ── GAME LIST ──────────────────────────────────────
local gameList = Instance.new("ScrollingFrame", win)
gameList.Size = UDim2.new(1,-20,0,352); gameList.Position = UDim2.new(0,10,0,200)
gameList.BackgroundTransparency = 1; gameList.BorderSizePixel = 0
gameList.ScrollBarThickness = 3; gameList.ScrollBarImageColor3 = C.muted
gameList.CanvasSize = UDim2.new(0,0,0,0)
local gLL = Instance.new("UIListLayout", gameList)
gLL.Padding = UDim.new(0,8); gLL.SortOrder = Enum.SortOrder.LayoutOrder
gLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    gameList.CanvasSize = UDim2.new(0,0,0,gLL.AbsoluteContentSize.Y+8)
end)

-- ── STATUS OVERLAY ─────────────────────────────────
local ov = Instance.new("Frame", win)
ov.Size = UDim2.new(1,0,1,0); ov.BackgroundColor3 = C.bg
ov.BackgroundTransparency = 0.08; ov.BorderSizePixel = 0
ov.Visible = false; ov.ZIndex = 40; cr(ov, 26)

local ovIcon = lbl(ov, {Size=UDim2.new(1,0,0,56), Position=UDim2.new(0,0,0.36,-28),
    Text="⏳", TextSize=44, Font=Enum.Font.GothamBold, ZIndex=41})
local ovTitle = lbl(ov, {Size=UDim2.new(1,-30,0,32), Position=UDim2.new(0,15,0.51,0),
    Text="Loading...", TextColor3=C.white, TextSize=22,
    Font=Enum.Font.GothamBlack, ZIndex=41, TextXAlignment=Enum.TextXAlignment.Left})
local ovSub = lbl(ov, {Size=UDim2.new(1,-30,0,22), Position=UDim2.new(0,15,0.63,0),
    Text="Please wait...", TextColor3=C.off, TextSize=12,
    Font=Enum.Font.Gotham, ZIndex=41, TextXAlignment=Enum.TextXAlignment.Left})

local function showStatus(icon, title, sub, col)
    ov.Visible = true
    ovIcon.Text = icon; ovTitle.Text = title
    ovTitle.TextColor3 = col or C.white; ovSub.Text = sub
end

-- ── BOTTOM BAR ─────────────────────────────────────
local botBar = Instance.new("Frame", win)
botBar.Size = UDim2.new(1,0,0,42); botBar.Position = UDim2.new(0,0,1,-42)
botBar.BackgroundColor3 = C.panel; botBar.BorderSizePixel = 0; cr(botBar, 26)
pad(botBar, C.panel)
lbl(botBar, {Size=UDim2.new(0.55,0,1,0), Position=UDim2.new(0,12,0,0),
    Text="💬 discord.gg/nDSy4jdVDc", TextColor3=C.cyan, TextSize=11,
    Font=Enum.Font.GothamBold, TextXAlignment=Enum.TextXAlignment.Left})
lbl(botBar, {Size=UDim2.new(0.45,-12,1,0), Position=UDim2.new(0.55,0,0,0),
    Text="Made by TEJAZ 👑", TextColor3=C.muted, TextSize=10,
    Font=Enum.Font.GothamBold, TextXAlignment=Enum.TextXAlignment.Right})

-- ── GAME BUTTON FACTORY ────────────────────────────
-- Design: floating card with left colored bar + icon + text + badge + arrow
local GAMES = {
    {
        icon = "💎", title = "Muscle Legends",
        sub  = "PREMIUM FEATURES",
        badge = "💰 PAID • WHITELIST", badgeCol = Color3.fromRGB(110,0,200),
        accent = C.purple, glow = Color3.fromRGB(80,0,180),
        order = 1,
        onClick = function()
            showStatus("🔐","Checking Whitelist…","Verifying access…",C.gold)
            task.wait(1.4)
            if isWhitelisted(LP.Name) then
                showStatus("✅","Access Granted! 👑","Loading paid script…",C.green)
                task.wait(0.8)
                local ok = pcall(function() loadstring(game:HttpGet(PAID_URL,true))() end)
                if ok then showStatus("✅","PAID Script Loaded!","Enjoy premium 🔥",C.green); task.wait(1.5); gui:Destroy()
                else showStatus("❌","Load Failed","Report on Discord",C.red); task.wait(3); gui:Destroy() end
            else
                showStatus("🔒","Not Whitelisted","Buy at discord.gg/nDSy4jdVDc",C.red)
                task.wait(2); gui:Destroy(); LP:Kick("❌ SCP HUB — Not whitelisted. Buy: discord.gg/nDSy4jdVDc")
            end
        end
    },
    {
        icon = "💪", title = "Muscle Legends",
        sub  = "PUBLIC FEATURES",
        badge = "🆓 FREE • PUBLIC", badgeCol = Color3.fromRGB(160,0,0),
        accent = C.red, glow = Color3.fromRGB(180,0,0),
        order = 2,
        onClick = function()
            showStatus("⏳","Loading Public Script…","Please wait 💪",C.gold)
            task.wait(0.8)
            local ok = pcall(function() loadstring(game:HttpGet(FREE_URL,true))() end)
            if ok then showStatus("✅","Script Loaded! 🎉","Enjoy!",C.green); task.wait(1.5); gui:Destroy()
            else showStatus("❌","Load Failed","Report on Discord",C.red); task.wait(3); gui:Destroy() end
        end
    },
    {
        icon = "⚔️", title = "Rivals",
        sub  = "AIMBOT • ESP • PLAYER MODS",
        badge = "🔑 KEY REQUIRED", badgeCol = Color3.fromRGB(0,80,180),
        accent = C.cyan, glow = Color3.fromRGB(0,120,200),
        order = 3,
        onClick = function()
            showStatus("⏳","Loading Rivals…","Starting ⚔️",C.cyan)
            task.wait(0.8)
            local ok = pcall(function() loadstring(game:HttpGet(RIVALS_URL,true))() end)
            if ok then showStatus("✅","Rivals Loaded!","Have fun! ⚔️",C.green); task.wait(1.5); gui:Destroy()
            else showStatus("❌","Load Failed","Report on Discord",C.red); task.wait(3); gui:Destroy() end
        end
    },
    {
        icon = "🏎️", title = "Race Clicker",
        sub  = "AUTO RACE • SPEED • UPGRADES",
        badge = "🔑 KEY REQUIRED", badgeCol = Color3.fromRGB(100,0,160),
        accent = C.purple, glow = Color3.fromRGB(110,0,180),
        order = 4,
        onClick = function()
            showStatus("⏳","Loading Race Clicker…","Starting 🏎️",C.purple)
            task.wait(0.8)
            local ok = pcall(function() loadstring(game:HttpGet(RACECLICKER_URL,true))() end)
            if ok then showStatus("✅","Race Clicker Loaded!","Have fun! 🏎️",C.green); task.wait(1.5); gui:Destroy()
            else showStatus("❌","Load Failed","Report on Discord",C.red); task.wait(3); gui:Destroy() end
        end
    },
}

for _, g in ipairs(GAMES) do
    local card = Instance.new("TextButton", gameList)
    card.Size = UDim2.new(1,0,0,76); card.BackgroundColor3 = C.card
    card.BorderSizePixel = 0; card.Text = ""; card.LayoutOrder = g.order
    card.AutoButtonColor = false; cr(card, 16)
    local cBdr = ms(card, C.border, 1)

    -- Glow underneath on hover (using a frame)
    local glowFrame = Instance.new("Frame", card)
    glowFrame.Size = UDim2.new(1,0,1,0); glowFrame.BackgroundColor3 = g.accent
    glowFrame.BackgroundTransparency = 1; glowFrame.BorderSizePixel = 0; cr(glowFrame, 16)

    -- Left accent strip  
    local strip = Instance.new("Frame", card)
    strip.Size = UDim2.new(0, 4, 0.55, 0); strip.Position = UDim2.new(0, 0, 0.225, 0)
    strip.BackgroundColor3 = g.accent; strip.BorderSizePixel = 0; cr(strip, 4)

    -- Icon circle
    local iconBg = Instance.new("Frame", card)
    iconBg.Size = UDim2.new(0, 44, 0, 44); iconBg.Position = UDim2.new(0, 10, 0.5, -22)
    iconBg.BackgroundColor3 = C.bg; iconBg.BorderSizePixel = 0; cr(iconBg, 14)
    ms(iconBg, g.accent, 1.5)
    lbl(iconBg, {Size=UDim2.new(1,0,1,0), Text=g.icon, TextSize=24, Font=Enum.Font.GothamBold})

    -- Title & sub
    lbl(card, {
        Size=UDim2.new(1,-110,0,22), Position=UDim2.new(0,60,0,12),
        Text=g.title, TextColor3=C.white, TextSize=15,
        Font=Enum.Font.GothamBlack, TextXAlignment=Enum.TextXAlignment.Left
    })
    lbl(card, {
        Size=UDim2.new(1,-110,0,14), Position=UDim2.new(0,60,0,32),
        Text=g.sub, TextColor3=C.muted, TextSize=10,
        Font=Enum.Font.GothamBold, TextXAlignment=Enum.TextXAlignment.Left
    })

    -- Badge pill
    local badge = Instance.new("Frame", card)
    badge.Size = UDim2.new(0,0,0,18); badge.Position = UDim2.new(0,60,0,52)
    badge.BackgroundColor3 = g.badgeCol; badge.BorderSizePixel = 0
    badge.AutomaticSize = Enum.AutomaticSize.X; cr(badge, 6)
    lbl(badge, {
        Size=UDim2.new(0,0,1,0), Text="  "..g.badge.."  ",
        TextColor3=C.white, TextSize=9, Font=Enum.Font.GothamBold,
        AutomaticSize=Enum.AutomaticSize.X
    })

    -- Arrow
    lbl(card, {
        Size=UDim2.new(0,26,1,0), Position=UDim2.new(1,-32,0,0),
        Text="›", TextColor3=C.border, TextSize=30, Font=Enum.Font.GothamBlack
    })

    -- Hover
    card.MouseEnter:Connect(function()
        TS:Create(card, TweenInfo.new(0.15), {BackgroundColor3=C.cardH}):Play()
        TS:Create(cBdr, TweenInfo.new(0.15), {Color=g.accent, Thickness=1.5}):Play()
        TS:Create(glowFrame, TweenInfo.new(0.15), {BackgroundTransparency=0.94}):Play()
    end)
    card.MouseLeave:Connect(function()
        TS:Create(card, TweenInfo.new(0.15), {BackgroundColor3=C.card}):Play()
        TS:Create(cBdr, TweenInfo.new(0.15), {Color=C.border, Thickness=1}):Play()
        TS:Create(glowFrame, TweenInfo.new(0.15), {BackgroundTransparency=1}):Play()
    end)
    card.MouseButton1Down:Connect(function()
        TS:Create(card, TweenInfo.new(0.07), {Size=UDim2.new(1,0,0,71)}):Play()
    end)
    card.MouseButton1Up:Connect(function()
        TS:Create(card, TweenInfo.new(0.07), {Size=UDim2.new(1,0,0,76)}):Play()
    end)
    card.MouseButton1Click:Connect(g.onClick)
end

-- ── ANIMATIONS ─────────────────────────────────────
TS:Create(win, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -170, 0.5, -305)
}):Play()

-- Border color cycle: red → orange → red
task.spawn(function()
    local t = 0
    while gui.Parent do
        t = t + 0.025
        local r = (math.sin(t) + 1) / 2
        winBdr.Color = Color3.new(0.88 + r*0.12, r*0.12, 0)
        task.wait(0.05)
    end
end)
-- Logo breathe
task.spawn(function()
    while gui.Parent do
        TS:Create(logo, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Size=UDim2.new(0,85,0,85)}):Play(); task.wait(1.2)
        TS:Create(logo, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Size=UDim2.new(0,78,0,78)}):Play(); task.wait(1.2)
    end
end)
-- Rainbow subtitle
task.spawn(function()
    local h = 0
    while gui.Parent do
        h = (h + 0.004) % 1
        rainbowTag.TextColor3 = Color3.fromHSV(h, 0.85, 1)
        task.wait(0.05)
    end
end)
