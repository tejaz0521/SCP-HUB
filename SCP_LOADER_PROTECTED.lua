-- ══════════════════════════════════════════════════
--          SCP HUB - PROTECTED LOADER
--               Made by TEJAZ
--           discord.gg/nDSy4jdVDc
--
--  This is the ONLY file that goes on GitHub!
--  The real paid script is hidden in secret Pastebin!
-- ══════════════════════════════════════════════════

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- ══════════════════════════════════════
-- STEP 1: SET YOUR LINKS HERE
-- ══════════════════════════════════════

-- Your whitelist pastebin (usernames one per line)
local WHITELIST_URL = "https://pastebin.com/raw/RULnktcp"

-- Your SECRET paid script pastebin (obfuscated script goes here)
-- NEVER share this link with anyone!
local SECRET_PAID_URL = "https://pastebin.com/raw/REPLACE_WITH_SECRET_PAID_PASTEBIN"

-- Your PUBLIC free script link
local FREE_SCRIPT_URL = "https://raw.githubusercontent.com/tejaz0521/Scrip_scp/refs/heads/main/obfuscated_script-1772195851107.lua.txt"

-- ══════════════════════════════════════
-- LOADING SCREEN
-- ══════════════════════════════════════

repeat task.wait() until LocalPlayer and LocalPlayer.Character

local loadGui = Instance.new("ScreenGui")
loadGui.Name = "SCPLoader"
loadGui.ResetOnSpawn = false
loadGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local bg = Instance.new("Frame")
bg.Size = UDim2.new(0, 400, 0, 200)
bg.Position = UDim2.new(0.5, -200, 0.5, -100)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
bg.BorderSizePixel = 0
bg.Parent = loadGui
Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 16)

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 55)
titleBar.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
titleBar.BorderSizePixel = 0
titleBar.Parent = bg
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 16)

local titleLbl = Instance.new("TextLabel")
titleLbl.Size = UDim2.new(1, 0, 1, 0)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "🔐 SCP HUB - SECURE LOADER"
titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLbl.TextSize = 18
titleLbl.Font = Enum.Font.GothamBold
titleLbl.Parent = titleBar

local statusLbl = Instance.new("TextLabel")
statusLbl.Size = UDim2.new(1, 0, 0, 45)
statusLbl.Position = UDim2.new(0, 0, 0, 65)
statusLbl.BackgroundTransparency = 1
statusLbl.Text = "⏳ Checking whitelist..."
statusLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLbl.TextSize = 15
statusLbl.Font = Enum.Font.Gotham
statusLbl.Parent = bg

local subLbl = Instance.new("TextLabel")
subLbl.Size = UDim2.new(1, 0, 0, 30)
subLbl.Position = UDim2.new(0, 0, 0, 110)
subLbl.BackgroundTransparency = 1
subLbl.Text = "Please wait..."
subLbl.TextColor3 = Color3.fromRGB(150, 150, 150)
subLbl.TextSize = 13
subLbl.Font = Enum.Font.Gotham
subLbl.Parent = bg

local discordLbl = Instance.new("TextLabel")
discordLbl.Size = UDim2.new(1, 0, 0, 25)
discordLbl.Position = UDim2.new(0, 0, 0, 165)
discordLbl.BackgroundTransparency = 1
discordLbl.Text = "discord.gg/nDSy4jdVDc | Made by TEJAZ"
discordLbl.TextColor3 = Color3.fromRGB(138, 43, 226)
discordLbl.TextSize = 13
discordLbl.Font = Enum.Font.GothamBold
discordLbl.Parent = bg

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

task.wait(1)

-- ══════════════════════════════════════
-- CHECK & LOAD
-- ══════════════════════════════════════

if isWhitelisted(LocalPlayer.Name) then
    -- ✅ WHITELISTED - Load secret paid script
    statusLbl.Text = "✅ Whitelisted! Loading paid script..."
    statusLbl.TextColor3 = Color3.fromRGB(0, 220, 100)
    subLbl.Text = "Fetching from secure server..."
    task.wait(1.5)

    local success, err = pcall(function()
        loadstring(game:HttpGet(SECRET_PAID_URL))()
    end)

    if success then
        loadGui:Destroy()
    else
        statusLbl.Text = "❌ Error loading paid script!"
        statusLbl.TextColor3 = Color3.fromRGB(255, 60, 60)
        subLbl.Text = "Report at discord.gg/nDSy4jdVDc"
        task.wait(3)
        loadGui:Destroy()
    end

else
    -- ❌ NOT WHITELISTED - Load free script instead
    statusLbl.Text = "⚠️ Not whitelisted - Loading FREE version..."
    statusLbl.TextColor3 = Color3.fromRGB(255, 200, 0)
    subLbl.Text = "Buy paid access at discord.gg/nDSy4jdVDc"
    task.wait(2)

    local success, err = pcall(function()
        loadstring(game:HttpGet(FREE_SCRIPT_URL))()
    end)

    if success then
        loadGui:Destroy()
        StarterGui:SetCore("SendNotification", {
            Title = "SCP HUB FREE",
            Text = "Buy paid version at discord.gg/nDSy4jdVDc for more features!",
            Duration = 6
        })
    else
        statusLbl.Text = "❌ Error loading free script!"
        statusLbl.TextColor3 = Color3.fromRGB(255, 60, 60)
        task.wait(3)
        loadGui:Destroy()
    end
end
