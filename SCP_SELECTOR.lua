-- ══════════════════════════════════════════════════
--          SCP HUB - GAME SELECTOR LOADER
--               Made by TEJAZ
--           discord.gg/nDSy4jdVDc
-- ══════════════════════════════════════════════════

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")

-- ══════════════════════════════════════
-- YOUR LINKS
-- ══════════════════════════════════════

local WHITELIST_URL = "https://pastebin.com/raw/REPLACE_WITH_WHITELIST_PASTEBIN"
local SECRET_PAID_URL = "https://pastebin.com/raw/727r3bN1"

local GAME_SCRIPTS = {
    ["Muscle Legends FREE"] = "https://raw.githubusercontent.com/tejaz0521/Scrip_scp/refs/heads/main/obfuscated_script-1772195851107.lua.txt",
    ["Rivals"]              = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RIVALS.lua",
    ["Race Clicker"]        = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RACECLICKER.lua",
}

-- ══════════════════════════════════════
-- WAIT FOR CHARACTER
-- ══════════════════════════════════════

repeat task.wait() until LocalPlayer and LocalPlayer.Character

-- ══════════════════════════════════════
-- WHITELIST CHECK
-- ══════════════════════════════════════

local function isWhitelisted(username)
    local success, result = pcall(function()
        return game:HttpGet(WHITELIST_URL)
    end)
    if success and result then
        for user in string.gmatch(result, "[^\r\n]+") do
            local trimmed = user:match("^%s*(.-)%s*$")
            if string.lower(trimmed) == string.lower(username) then
                return true
            end
        end
    end
    return false
end

-- ══════════════════════════════════════
-- BUILD GUI
-- ══════════════════════════════════════

local gui = Instance.new("ScreenGui")
gui.Name = "SCPSelector"
gui.ResetOnSpawn = false
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Dark background overlay
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.4
overlay.BorderSizePixel = 0
overlay.Parent = gui

-- Main container
local container = Instance.new("Frame")
container.Size = UDim2.new(0, 420, 0, 600)
container.Position = UDim2.new(0.5, -210, 0.5, -300)
container.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
container.BorderSizePixel = 0
container.Parent = gui
Instance.new("UICorner", container).CornerRadius = UDim.new(0, 20)

-- Top header bar
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 75)
header.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
header.BorderSizePixel = 0
header.Parent = container
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 20)

-- Fix bottom corners of header
local headerFix = Instance.new("Frame")
headerFix.Size = UDim2.new(1, 0, 0.5, 0)
headerFix.Position = UDim2.new(0, 0, 0.5, 0)
headerFix.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
headerFix.BorderSizePixel = 0
headerFix.Parent = header

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = "⚡ SCP HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 28
title.Font = Enum.Font.GothamBold
title.Parent = header

-- Subtitle
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, 0, 0, 25)
subtitle.Position = UDim2.new(0, 0, 0, 45)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Select a game to load your script"
subtitle.TextColor3 = Color3.fromRGB(220, 220, 220)
subtitle.TextSize = 13
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = header

-- User greeting
local userLbl = Instance.new("TextLabel")
userLbl.Size = UDim2.new(1, -20, 0, 25)
userLbl.Position = UDim2.new(0, 10, 0, 82)
userLbl.BackgroundTransparency = 1
userLbl.Text = "👋 Welcome, " .. LocalPlayer.DisplayName
userLbl.TextColor3 = Color3.fromRGB(180, 180, 180)
userLbl.TextSize = 13
userLbl.Font = Enum.Font.Gotham
userLbl.TextXAlignment = Enum.TextXAlignment.Left
userLbl.Parent = container

-- Scroll frame for buttons
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -130)
scroll.Position = UDim2.new(0, 10, 0, 115)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 0
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.Parent = container

local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 10)
listLayout.Parent = scroll

-- Auto resize canvas
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
end)

-- Discord label at bottom
local discordLbl = Instance.new("TextLabel")
discordLbl.Size = UDim2.new(1, 0, 0, 25)
discordLbl.Position = UDim2.new(0, 0, 1, -28)
discordLbl.BackgroundTransparency = 1
discordLbl.Text = "discord.gg/nDSy4jdVDc | Made by TEJAZ"
discordLbl.TextColor3 = Color3.fromRGB(138, 43, 226)
discordLbl.TextSize = 12
discordLbl.Font = Enum.Font.GothamBold
discordLbl.Parent = container

-- ══════════════════════════════════════
-- STATUS OVERLAY (shows when loading)
-- ══════════════════════════════════════

local statusOverlay = Instance.new("Frame")
statusOverlay.Size = UDim2.new(1, 0, 1, 0)
statusOverlay.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
statusOverlay.BackgroundTransparency = 1
statusOverlay.BorderSizePixel = 0
statusOverlay.Visible = false
statusOverlay.ZIndex = 10
statusOverlay.Parent = container
Instance.new("UICorner", statusOverlay).CornerRadius = UDim.new(0, 20)

local statusIcon = Instance.new("TextLabel")
statusIcon.Size = UDim2.new(1, 0, 0, 60)
statusIcon.Position = UDim2.new(0, 0, 0.35, 0)
statusIcon.BackgroundTransparency = 1
statusIcon.Text = "⏳"
statusIcon.TextSize = 40
statusIcon.Font = Enum.Font.GothamBold
statusIcon.ZIndex = 11
statusIcon.Parent = statusOverlay

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -20, 0, 40)
statusText.Position = UDim2.new(0, 10, 0.5, 0)
statusText.BackgroundTransparency = 1
statusText.Text = "Loading..."
statusText.TextColor3 = Color3.fromRGB(255, 255, 255)
statusText.TextSize = 18
statusText.Font = Enum.Font.GothamBold
statusText.ZIndex = 11
statusText.Parent = statusOverlay

local statusSub = Instance.new("TextLabel")
statusSub.Size = UDim2.new(1, -20, 0, 30)
statusSub.Position = UDim2.new(0, 10, 0.5, 45)
statusSub.BackgroundTransparency = 1
statusSub.Text = "Please wait..."
statusSub.TextColor3 = Color3.fromRGB(170, 170, 170)
statusSub.TextSize = 14
statusSub.Font = Enum.Font.Gotham
statusSub.ZIndex = 11
statusSub.Parent = statusOverlay

-- ══════════════════════════════════════
-- SHOW STATUS FUNCTION
-- ══════════════════════════════════════

local function showStatus(icon, text, sub, color)
    statusOverlay.Visible = true
    statusOverlay.BackgroundTransparency = 0
    statusIcon.Text = icon
    statusText.Text = text
    statusText.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    statusSub.Text = sub
end

-- ══════════════════════════════════════
-- LOAD SCRIPT FUNCTION
-- ══════════════════════════════════════

local function loadScript(url, gameName)
    showStatus("⏳", "Loading " .. gameName .. "...", "Fetching script from server...", Color3.fromRGB(255, 200, 0))
    task.wait(1)
    local ok, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)
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

-- ══════════════════════════════════════
-- CREATE BUTTON FUNCTION
-- ══════════════════════════════════════

local function createButton(text, color, order, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 65)
    btn.BackgroundColor3 = color
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 20
    btn.Font = Enum.Font.GothamBold
    btn.LayoutOrder = order
    btn.Parent = scroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 14)

    -- Hover effect
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.new(
                math.min(color.R + 0.1, 1),
                math.min(color.G + 0.1, 1),
                math.min(color.B + 0.1, 1)
            )
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = color}):Play()
    end)

    -- Click effect
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.05), {Size = UDim2.new(1, 0, 0, 60)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.05), {Size = UDim2.new(1, 0, 0, 65)}):Play()
    end)

    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ══════════════════════════════════════
-- CREATE ALL BUTTONS
-- ══════════════════════════════════════

-- 🔴 Muscle Legends PAID (whitelist check)
createButton("💎 Muscle Legends PAID", Color3.fromRGB(138, 43, 226), 1, function()
    showStatus("⏳", "Checking whitelist...", "Verifying your access...", Color3.fromRGB(255, 200, 0))
    task.wait(1.5)
    if isWhitelisted(LocalPlayer.Name) then
        showStatus("✅", "Whitelisted!", "Loading paid script...", Color3.fromRGB(0, 220, 100))
        task.wait(1)
        loadScript(SECRET_PAID_URL, "Muscle Legends PAID")
    else
        showStatus("❌", "Not Whitelisted!", "Buy access at discord.gg/nDSy4jdVDc", Color3.fromRGB(255, 60, 60))
        task.wait(2)
        gui:Destroy()
        LocalPlayer:Kick("❌ Not whitelisted! Buy access at discord.gg/nDSy4jdVDc")
    end
end)

-- 🟠 Muscle Legends FREE
createButton("🆓 Muscle Legends FREE", Color3.fromRGB(220, 80, 0), 2, function()
    loadScript(GAME_SCRIPTS["Muscle Legends FREE"], "Muscle Legends FREE")
end)

-- 🔵 Rivals
createButton("⚔️ Rivals", Color3.fromRGB(30, 100, 220), 3, function()
    loadScript(GAME_SCRIPTS["Rivals"], "Rivals")
end)

-- 🟡 Race Clicker
createButton("🏎️ Race Clicker", Color3.fromRGB(200, 150, 0), 4, function()
    loadScript(GAME_SCRIPTS["Race Clicker"], "Race Clicker")
end)



-- ══════════════════════════════════════
-- ANIMATE IN
-- ══════════════════════════════════════

container.Position = UDim2.new(0.5, -210, 1.5, 0)
TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -210, 0.5, -300)
}):Play()
