-- ⚡ SCP HUB SELECTOR | Made by TEJAZ
local Players=game:GetService("Players"); local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP
local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

local BASE = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/main/"
local WL_URL = "https://pastebin.com/raw/RULnktcp"

-- PRE-FETCH ALL SCRIPTS BEFORE GUI (fixes executor nested HttpGet block)
notify("SCP HUB","⏳ Pre-loading scripts...",3)
local scriptML, scriptPaid, scriptRivals, scriptRC
local ok1 = pcall(function() scriptML     = game:HttpGet(BASE.."SCP_PUBLIC_V5.lua",true) end)
local ok2 = pcall(function() scriptPaid   = game:HttpGet("https://pastebin.com/raw/kyMmrcQN",true) end)
local ok3 = pcall(function() scriptRivals = game:HttpGet(BASE.."SCP_RIVALS.lua",true) end)
local ok4 = pcall(function() scriptRC     = game:HttpGet(BASE.."SCP_RACECLICKER.lua",true) end)

local function isWhitelisted()
    local ok,res=pcall(function()return game:HttpGet(WL_URL,true)end)
    if not ok then return false end
    local name=LP.Name:lower()
    for line in res:gmatch("[^\n]+")do if line:match("^%s*(.-)%s*$"):lower()==name then return true end end
    return false
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/imhenne187/SilenceElerium/refs/heads/main/src/SilenceEleriumLibrary.luau", true))()

-- SCP LOGO INJECTOR
local function injectSCPLogo(wFrame)
    pcall(function()
        local bar=wFrame:FindFirstChild('Bar')
        if not bar then return end
        local tog=bar:FindFirstChild('Toggle')
        if not tog then return end
        tog.Image='rbxassetid://3926305904'
        tog.ImageColor3=Color3.fromRGB(255,60,60)
        tog.Size=UDim2.new(0,18,0,18)
        local existing=bar:FindFirstChild('SCPLogo')
        if existing then existing:Destroy() end
        local lbl=Instance.new('TextLabel')
        lbl.Name='SCPLogo'
        lbl.Size=UDim2.new(0,32,0,14)
        lbl.Position=UDim2.new(0,22,0,2)
        lbl.BackgroundTransparency=1
        lbl.Text='SCP'
        lbl.TextColor3=Color3.fromRGB(255,80,80)
        lbl.TextSize=11
        lbl.Font=Enum.Font.FredokaOne
        lbl.ZIndex=tog.ZIndex+1
        lbl.Parent=bar
    end)
end

local Players=game:GetService("Players"); local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP
local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

local WL_URL="https://pastebin.com/raw/RULnktcp"
local function isWhitelisted()
    local ok,res=pcall(function()return game:HttpGet(WL_URL)end); if not ok then return false end
    local name=LP.Name:lower()
    for line in res:gmatch("[^\n]+")do if line:match("^%s*(.-)%s*$"):lower()==name then return true end end
    return false
end

local WIN_CFG={main_color=Color3.fromRGB(185,30,30),title_bar={Color3.fromRGB(200,35,35),Color3.fromRGB(100,10,10)},background={Color3.fromRGB(18,5,5)},background_transparency=0,min_size=Vector2.new(600,280),toggle_key=Enum.KeyCode.RightShift,can_resize=false}
local win,winF=library:AddWindow("⚡ SCP HUB  |  Game Selector  |  TEJAZ",WIN_CFG)
task.defer(function() injectSCPLogo(winF) end)

local selTab,_=win:AddTab("🎮  Select Game")
selTab:AddLabel("━━━━━━━  ⚡ SCP HUB SELECTOR  ━━━━━━━")
selTab:AddLabel("👑  Made by TEJAZ  |  💎  Version 4.5")
selTab:AddLabel("💬  discord.gg/nDSy4jdVDc  |  🔄 RShift toggle")
selTab:AddLabel("━━━━━━━  🏋️ MUSCLE LEGENDS  ━━━━━━━")
selTab:AddButton("🆓  Load FREE Script (Muscle Legends)",function()
    if not ok1 or not scriptML then notify("SCP","❌ Failed to load! Rejoin & retry",4); return end
    notify("SCP","⚡ Loading FREE script...",2); task.wait(0.5)
    local ok,err=pcall(loadstring(scriptML))
    if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
end)
selTab:AddButton("💎  Load PAID Script (Muscle Legends)",function()
    if not isWhitelisted() then notify("SCP","❌ Not whitelisted! Join discord",4); return end
    if not ok2 or not scriptPaid then notify("SCP","❌ Failed to load PAID!",4); return end
    notify("SCP","💎 Loading PAID script...",2); task.wait(0.5)
    local ok,err=pcall(loadstring(scriptPaid))
    if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
end)
selTab:AddLabel("━━━━━━━  ⚔️ RIVALS  ━━━━━━━")
selTab:AddButton("⚔️  Load Rivals Script",function()
    if not ok3 or not scriptRivals then notify("SCP","❌ Failed to load! Rejoin & retry",4); return end
    notify("SCP","⚔️ Loading Rivals...",2); task.wait(0.5)
    local ok,err=pcall(loadstring(scriptRivals))
    if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
end)
selTab:AddLabel("━━━━━━━  🏎️ RACE CLICKER  ━━━━━━━")
selTab:AddButton("🏎️  Load Race Clicker Script",function()
    if not ok4 or not scriptRC then notify("SCP","❌ Failed to load! Rejoin & retry",4); return end
    notify("SCP","🏎️ Loading Race Clicker...",2); task.wait(0.5)
    local ok,err=pcall(loadstring(scriptRC))
    if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
end)
selTab:AddLabel("━━━━━━━  💬 LINKS  ━━━━━━━")
selTab:AddButton("💬  Copy Discord Link",function() setclipboard("https://discord.gg/nDSy4jdVDc"); notify("SCP","✅ Copied!",3) end)

selTab:Show()
notify("SCP HUB","✅ All ready! Choose your game 👑",4)
