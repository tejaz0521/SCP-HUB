-- SCP HUB | SELECTOR | Made by TEJAZ
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local SG = game:GetService("StarterGui")
local LP = Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

local WHITELIST_URL = "https://pastebin.com/raw/RULnktcp"
local PAID_URL      = "https://pastebin.com/raw/kyMmrcQN"
local FREE_URL      = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_PUBLIC_V5.lua"
local RIVALS_URL    = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RIVALS.lua"
local RACE_URL      = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/SCP_RACECLICKER.lua"

local function getWhitelist()
    local ok,res = pcall(function() return game:HttpGet(WHITELIST_URL) end)
    if not ok then return {} end
    local k = {}
    for v in res:gmatch("[^\n]+") do
        local t = v:match("^%s*(.-)%s*$")
        if t ~= "" then table.insert(k,t) end
    end
    return k
end

local function isWhitelisted()
    local name = LP.Name
    for _,v in pairs(getWhitelist()) do
        if v == name then return true end
    end
    return false
end

local Window = Rayfield:CreateWindow({
    Name = "⚡ SCP HUB | Game Selector",
    Icon = 0,
    LoadingTitle = "⚡ SCP HUB",
    LoadingSubtitle = "👑 Made by TEJAZ | Select Your Game",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

local SelectTab = Window:CreateTab("🎮 Select Game", 4483362458)
SelectTab:CreateSection("👋 Welcome, " .. LP.DisplayName)
SelectTab:CreateParagraph({
    Title = "⚡ SCP HUB",
    Content = "👑 Made by TEJAZ\ndiscord.gg/nDSy4jdVDc\n\nSelect a game below to load the script!"
})

SelectTab:CreateSection("🎮 Available Games")

-- Muscle Legends PAID
SelectTab:CreateButton({
    Name = "💎 Muscle Legends PAID (Whitelist)",
    Callback = function()
        Rayfield:Notify({Title="SCP HUB",Content="🔐 Checking whitelist...",Duration=3})
        task.spawn(function()
            if isWhitelisted() then
                Rayfield:Notify({Title="SCP HUB",Content="✅ Whitelisted! Loading PAID...",Duration=3})
                task.wait(1)
                local ok,err = pcall(function() loadstring(game:HttpGet(PAID_URL))() end)
                if not ok then Rayfield:Notify({Title="SCP HUB",Content="❌ Load failed: "..tostring(err),Duration=5}) end
            else
                Rayfield:Notify({Title="SCP HUB",Content="🔒 Not whitelisted! Join discord to get access.",Duration=5})
            end
        end)
    end
})

-- Muscle Legends FREE
SelectTab:CreateButton({
    Name = "💪 Muscle Legends FREE (Public)",
    Callback = function()
        Rayfield:Notify({Title="SCP HUB",Content="⏳ Loading FREE script...",Duration=3})
        task.spawn(function()
            local ok,err = pcall(function() loadstring(game:HttpGet(FREE_URL))() end)
            if not ok then Rayfield:Notify({Title="SCP HUB",Content="❌ Load failed: "..tostring(err),Duration=5}) end
        end)
    end
})

-- Rivals
SelectTab:CreateButton({
    Name = "⚔️ Rivals",
    Callback = function()
        Rayfield:Notify({Title="SCP HUB",Content="⏳ Loading Rivals...",Duration=3})
        task.spawn(function()
            local ok,err = pcall(function() loadstring(game:HttpGet(RIVALS_URL))() end)
            if not ok then Rayfield:Notify({Title="SCP HUB",Content="❌ Load failed: "..tostring(err),Duration=5}) end
        end)
    end
})

-- Race Clicker
SelectTab:CreateButton({
    Name = "🏎️ Race Clicker",
    Callback = function()
        Rayfield:Notify({Title="SCP HUB",Content="⏳ Loading Race Clicker...",Duration=3})
        task.spawn(function()
            local ok,err = pcall(function() loadstring(game:HttpGet(RACE_URL))() end)
            if not ok then Rayfield:Notify({Title="SCP HUB",Content="❌ Load failed: "..tostring(err),Duration=5}) end
        end)
    end
})

SelectTab:CreateSection("💬 Discord")
SelectTab:CreateButton({
    Name = "💬 Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/nDSy4jdVDc")
        Rayfield:Notify({Title="SCP HUB",Content="✅ Discord copied!",Duration=3})
    end
})

notify("SCP HUB","⚡ Selector Loaded! Made by TEJAZ 👑",5)
