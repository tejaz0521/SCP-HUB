-- ══════════════════════════════════════════════════
--          SCP HUB - GAME SELECTOR LOADER
--               Made by TEJAZ
--           discord.gg/nDSy4jdVDc
-- ══════════════════════════════════════════════════

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")

local WHITELIST_URL    = "https://pastebin.com/raw/REPLACE_WITH_WHITELIST_PASTEBIN"
local SECRET_PAID_URL  = "https://pastebin.com/raw/727r3bN1"
local FREE_ML_URL      = "https://raw.githubusercontent.com/tejaz0521/Scrip_scp/refs/heads/main/obfuscated_script-1772178325138.lua.txt"
local RIVALS_URL       = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RIVALS.lua"
local RACECLICKER_URL  = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RACECLICKER.lua"

repeat task.wait() until LocalPlayer and LocalPlayer.Character

local function isWhitelisted(username)
    local success, result = pcall(function() return game:HttpGet(WHITELIST_URL) end)
    if success and result then
        for user in string.gmatch(result, "[^\r\n]+") do
            local trimmed = user:match("^%s*(.-)%s*$")
            if string.lower(trimmed) == string.lower(username) then return true end
        end
    end
    return false
end

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SCPSelector"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.4
overlay.BorderSizePixel = 0
overlay.Parent = gui

-- SMALLER container: 300 wide, 360 tall
local container = Instance.new("Frame")
container.Size = UDim2.new(0, 300, 0, 360)
container.Position = UDim2.new(0.5, -150, 0.5, -180)
container.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
container.BorderSizePixel = 0
container.Parent = gui
Instance.new("UICorner", container).CornerRadius = UDim.new(0, 18)

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 62)
header.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
header.BorderSizePixel = 0
header.Parent = container
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 18)

local headerFix = Instance.new("Frame")
headerFix.Size = UDim2.new(1, 0, 0.5, 0)
headerFix.Position = UDim2.new(0, 0, 0.5, 0)
headerFix.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
headerFix.BorderSizePixel = 0
headerFix.Parent = header

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.Position = UDim2.new(0, 0, 0, 4)
title.BackgroundTransparency = 1
title.Text = "⚡ SCP HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 40)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Select a game to load your script"
subtitle.TextColor3 = Color3.fromRGB(220, 220, 220)
subtitle.TextSize = 11
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = header

local userLbl = Instance.new("TextLabel")
userLbl.Size = UDim2.new(1, -16, 0, 20)
userLbl.Position = UDim2.new(0, 8, 0, 66)
userLbl.BackgroundTransparency = 1
userLbl.Text = "👋 Welcome, " .. LocalPlayer.DisplayName
userLbl.TextColor3 = Color3.fromRGB(160, 160, 160)
userLbl.TextSize = 12
userLbl.Font = Enum.Font.Gotham
userLbl.TextXAlignment = Enum.TextXAlignment.Left
userLbl.Parent = container

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -16, 1, -115)
scroll.Position = UDim2.new(0, 8, 0, 92)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = container

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 8)
listLayout.Parent = scroll
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 8)
end)

local discordLbl = Instance.new("TextLabel")
discordLbl.Size = UDim2.new(1, 0, 0, 20)
discordLbl.Position = UDim2.new(0, 0, 1, -22)
discordLbl.BackgroundTransparency = 1
discordLbl.Text = "discord.gg/nDSy4jdVDc | Made by TEJAZ"
discordLbl.TextColor3 = Color3.fromRGB(138, 43, 226)
discordLbl.TextSize = 11
discordLbl.Font = Enum.Font.GothamBold
discordLbl.Parent = container

-- Status overlay
local statusOverlay = Instance.new("Frame")
statusOverlay.Size = UDim2.new(1, 0, 1, 0)
statusOverlay.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
statusOverlay.BackgroundTransparency = 1
statusOverlay.BorderSizePixel = 0
statusOverlay.Visible = false
statusOverlay.ZIndex = 10
statusOverlay.Parent = container
Instance.new("UICorner", statusOverlay).CornerRadius = UDim.new(0, 18)

local statusIcon = Instance.new("TextLabel")
statusIcon.Size = UDim2.new(1, 0, 0, 50)
statusIcon.Position = UDim2.new(0, 0, 0.28, 0)
statusIcon.BackgroundTransparency = 1
statusIcon.Text = "⏳"
statusIcon.TextSize = 34
statusIcon.Font = Enum.Font.GothamBold
statusIcon.ZIndex = 11
statusIcon.Parent = statusOverlay

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -16, 0, 32)
statusText.Position = UDim2.new(0, 8, 0.5, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "Loading..."
statusText.TextColor3 = Color3.fromRGB(255, 255, 255)
statusText.TextSize = 15
statusText.Font = Enum.Font.GothamBold
statusText.ZIndex = 11
statusText.Parent = statusOverlay

local statusSub = Instance.new("TextLabel")
statusSub.Size = UDim2.new(1, -16, 0, 22)
statusSub.Position = UDim2.new(0, 8, 0.5, 35)
statusSub.BackgroundTransparency = 1
statusSub.Text = "Please wait..."
statusSub.TextColor3 = Color3.fromRGB(155, 155, 155)
statusSub.TextSize = 12
statusSub.Font = Enum.Font.Gotham
statusSub.ZIndex = 11
statusSub.Parent = statusOverlay

local function showStatus(icon, text, sub, color)
    statusOverlay.Visible = true
    statusOverlay.BackgroundTransparency = 0
    statusIcon.Text = icon
    statusText.Text = text
    statusText.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    statusSub.Text = sub
end

local function loadScript(url, gameName)
    showStatus("⏳", "Loading " .. gameName .. "...", "Fetching from server...", Color3.fromRGB(255, 200, 0))
    task.wait(1)
    local ok = pcall(function() loadstring(game:HttpGet(url))() end)
    if ok then
        showStatus("✅", gameName .. " Loaded!", "Enjoy! discord.gg/nDSy4jdVDc", Color3.fromRGB(0, 220, 100))
        task.wait(1.5)
        gui:Destroy()
    else
        showStatus("❌", "Failed to load!", "Report at discord.gg/nDSy4jdVDc", Color3.fromRGB(255, 60, 60))
        task.wait(3)
        gui:Destroy()
    end
end

local function createButton(text, color, order, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 50)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
    btn.Font = Enum.Font.GothamBold
    btn.LayoutOrder = order
    btn.Parent = scroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.05), {Size = UDim2.new(1, 0, 0, 45)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.05), {Size = UDim2.new(1, 0, 0, 50)}):Play()
    end)
    btn.MouseButton1Click:Connect(callback)
end

-- ══════════════════════════════════════
-- BUTTONS (correct colors + correct URLs)
-- ══════════════════════════════════════

-- 💎 Paid - Purple
createButton("💎 Muscle Legends PAID", Color3.fromRGB(138, 43, 226), 1, function()
    showStatus("⏳", "Checking whitelist...", "Verifying your access...", Color3.fromRGB(255, 200, 0))
    task.wait(1.5)
    if isWhitelisted(LocalPlayer.Name) then
        showStatus("✅", "Whitelisted!", "Loading paid script...", Color3.fromRGB(0, 220, 100))
        task.wait(1)
        showStatus("⏳", "Loading PAID...", "Please wait...", Color3.fromRGB(255, 200, 0))
        task.wait(1)
        local ok = pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/727r3bN1"))()
        end)
        if ok then
            showStatus("✅", "PAID Loaded!", "Enjoy!", Color3.fromRGB(0, 220, 100))
            task.wait(1.5)
            gui:Destroy()
        else
            showStatus("❌", "Failed!", "Report at discord.gg/nDSy4jdVDc", Color3.fromRGB(255, 60, 60))
            task.wait(3)
            gui:Destroy()
        end
    else
        showStatus("❌", "Not Whitelisted!", "Buy at discord.gg/nDSy4jdVDc", Color3.fromRGB(255, 60, 60))
        task.wait(2)
        gui:Destroy()
        LocalPlayer:Kick("❌ Not whitelisted! Buy at discord.gg/nDSy4jdVDc")
    end
end)

-- FREE button - completely separate, no shared variables with paid
createButton("🆓 Muscle Legends FREE", Color3.fromRGB(200, 20, 20), 2, function()
    showStatus("⏳", "Loading FREE Script...", "Please wait...", Color3.fromRGB(255, 200, 0))
    task.wait(1)
    local ok2 = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tejaz0521/Scrip_scp/refs/heads/main/obfuscated_script-1772178325138.lua.txt"))()
    end)
    if ok2 then
        showStatus("✅", "FREE Script Loaded!", "Enjoy! discord.gg/nDSy4jdVDc", Color3.fromRGB(0, 220, 100))
        task.wait(1.5)
        gui:Destroy()
    else
        showStatus("❌", "Failed to load!", "Report at discord.gg/nDSy4jdVDc", Color3.fromRGB(255, 60, 60))
        task.wait(3)
        gui:Destroy()
    end
end)

-- ⚔️ Rivals - Blue
createButton("⚔️ Rivals", Color3.fromRGB(30, 100, 220), 3, function()
    loadScript(RIVALS_URL, "Rivals")
end)

-- 🏎️ Race Clicker - Dark Purple
createButton("🏎️ Race Clicker", Color3.fromRGB(80, 0, 150), 4, function()
    loadScript(RACECLICKER_URL, "Race Clicker")
end)

-- Animate in
container.Position = UDim2.new(0.5, -150, 1.5, 0)
TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -150, 0.5, -180)
}):Play()
