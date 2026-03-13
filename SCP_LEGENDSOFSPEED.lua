-- ⚡ SCP HUB | LEGENDS OF SPEED v2 | TEJAZ

repeat task.wait() until game:IsLoaded()

-- ══════════════════════════════════════════
--  LIBRARY
-- ══════════════════════════════════════════
local library
if _G.scpLibrary then
    library = _G.scpLibrary
else
    library = loadstring(game:HttpGet("https://raw.githubusercontent.com/imhenne187/SilenceElerium/refs/heads/main/src/SilenceEleriumLibrary.luau", true))()
    _G.scpLibrary = library
end

local injectSCPLogo = _G.injectSCPLogo or function(wFrame)
    task.spawn(function()
        local bar
        for i=1,60 do bar=wFrame:FindFirstChild("Bar"); if bar then break end; task.wait(0.05) end
        if not bar then return end
        local tog
        for i=1,20 do tog=bar:FindFirstChild("Toggle"); if tog then break end; task.wait(0.05) end
        if not tog then return end
        pcall(function()
            tog.Image = "rbxassetid://3926305904"
            tog.ImageColor3 = Color3.fromRGB(0,220,100)
            tog.Size = UDim2.new(0,18,0,18)
            local ex = bar:FindFirstChild("SCPLogo"); if ex then ex:Destroy() end
            local lbl = Instance.new("TextLabel")
            lbl.Name = "SCPLogo"; lbl.Size = UDim2.new(0,32,0,14)
            lbl.Position = UDim2.new(0,22,0,2); lbl.BackgroundTransparency = 1
            lbl.Text = "SCP"; lbl.TextColor3 = Color3.fromRGB(0,200,80)
            lbl.TextSize = 11; lbl.Font = Enum.Font.FredokaOne
            lbl.ZIndex = tog.ZIndex+1; lbl.Parent = bar
        end)
    end)
end

-- ══════════════════════════════════════════
--  SERVICES
-- ══════════════════════════════════════════
local Players  = game:GetService("Players")
local RS       = game:GetService("ReplicatedStorage")
local RunSvc   = game:GetService("RunService")
local UIS      = game:GetService("UserInputService")
local TeleSvc  = game:GetService("TeleportService")
local SG       = game:GetService("StarterGui")
local LP       = Players.LocalPlayer

repeat task.wait() until LP.Character
local Char = LP.Character
local Hum  = Char:WaitForChild("Humanoid")
local HRP  = Char:WaitForChild("HumanoidRootPart")

LP.CharacterAdded:Connect(function(c)
    Char = c; Hum = c:WaitForChild("Humanoid"); HRP = c:WaitForChild("HumanoidRootPart")
end)

local function notify(t,m,d)
    pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end)
end

-- ══════════════════════════════════════════
--  REMOTES
-- ══════════════════════════════════════════
local rEvents           = RS:WaitForChild("rEvents")
local orbEvent          = rEvents:WaitForChild("orbEvent")
local rebirthEvent      = rEvents:WaitForChild("rebirthEvent")
local raceEvent         = rEvents:WaitForChild("raceEvent")
local freeGiftRemote    = rEvents:WaitForChild("freeGiftClaimRemote")
local fortuneWheelRemote= rEvents:WaitForChild("openFortuneWheelRemote")
local codeRemote        = rEvents:WaitForChild("codeRemote")
local tradingEvent      = rEvents:WaitForChild("tradingEvent")
local changeSpeedRemote = rEvents:WaitForChild("changeSpeedJumpRemote")

-- ══════════════════════════════════════════
--  HARDCODED DATA (from game source)
-- ══════════════════════════════════════════
local ORB_LIST = {
    "Blue Orb", "Ethereal Orb", "Gem",
    "Infernal Gem", "Orange Orb", "Red Orb", "Yellow Orb"
}

local CODES = {
    "swiftjungle1000","speedchampion000","racer300",
    "SPRINT250","hyper250","legends500","sparkles300","Launch200"
}

local TELEPORTS = {
    {name="Spawn City",       cframe=CFrame.new(-557.49, 4.13, 417.61)},
    {name="Frost Course",     cframe=CFrame.new(2022.68, 0.93, 984.48)},
    {name="Pirate Course",    cframe=CFrame.new(-1611.52, 18.60, 4939.55)},
    {name="Snow City",        cframe=CFrame.new(-866.39, 4.18, 2165.71)},
    {name="Magma City",       cframe=CFrame.new(1618.00, 4.23, 4328.55)},
    {name="Legends Highway",  cframe=CFrame.new(3742.88, 71.71, 5581.55)},
}

-- Anti AFK
pcall(function()
    local VU = game:GetService("VirtualUser")
    LP.Idled:Connect(function()
        VU:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VU:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

-- ══════════════════════════════════════════
--  KEY SYSTEM
-- ══════════════════════════════════════════
local KEY_URL = "https://pastebin.com/raw/n7UWskEA"
local function checkKey(e)
    local ok,res = pcall(function() return game:HttpGet(KEY_URL) end)
    if not ok then return false end
    for line in res:gmatch("[^\n]+") do
        if line:match("^%s*(.-)%s*$") == e then return true end
    end
    return false
end

local keyPassed = false
local kW,kF = library:AddWindow("SCP HUB — Key System", {
    main_color         = Color3.fromRGB(0,180,80),
    title_bar          = {Color3.fromRGB(0,200,90), Color3.fromRGB(0,80,35)},
    background         = {Color3.fromRGB(3,12,6)},
    background_transparency = 0,
    min_size           = Vector2.new(440,150),
    can_resize         = false
})
local kt,_ = kW:AddTab("Key")
kt:AddLabel("⚡  SCP HUB  |  Legends of Speed  |  TEJAZ")
kt:AddLabel("Get your FREE key at  discord.gg/KDx3D8hARN")
local stL = kt:AddLabel("Paste your key below and press Enter")
kt:AddTextBox("Enter key here...", function(v)
    if checkKey(v) then
        stL.Text = "✅  Key Accepted! Loading..."
        keyPassed = true
    else
        stL.Text = "❌  Wrong key! Get it at  discord.gg/KDx3D8hARN"
    end
end, {clear=true})
kt:AddButton("🔑  Get Key — Copy Discord", function()
    setclipboard("https://discord.gg/KDx3D8hARN")
    notify("SCP HUB","🔑 Discord copied! Join to get your key.",4)
end)
injectSCPLogo(kF)
kt:Show()
repeat task.wait(0.5) until keyPassed
kF:Destroy()

-- ══════════════════════════════════════════
--  MAIN WINDOW
-- ══════════════════════════════════════════
local win,winF = library:AddWindow("⚡ SCP HUB  |  Legends of Speed  |  TEJAZ", {
    main_color         = Color3.fromRGB(0,180,80),
    title_bar          = {Color3.fromRGB(0,200,90), Color3.fromRGB(0,80,35)},
    background         = {Color3.fromRGB(3,12,6)},
    background_transparency = 0,
    min_size           = Vector2.new(600,280),
    toggle_key         = Enum.KeyCode.RightShift,
    can_resize         = true,
})
task.defer(function() injectSCPLogo(winF) end)

-- ══════════════════════════════════════════
--  INFO TAB
-- ══════════════════════════════════════════
local infoTab,_ = win:AddTab("📋  Info")
infoTab:AddLabel("━━━━━━━  ⚡  SCP HUB  |  LEGENDS OF SPEED  ━━━━━━━")
infoTab:AddLabel("👑  Author      TEJAZ")
infoTab:AddLabel("💎  Version     2.0")
infoTab:AddLabel("🔄  Toggle      RightShift")
infoTab:AddLabel("💬  Discord     discord.gg/KDx3D8hARN")
infoTab:AddLabel("━━━━━━━  📊  LIVE STATS  ━━━━━━━")
local pingLbl = infoTab:AddLabel("📶  Ping        loading...")
local plrLbl  = infoTab:AddLabel("🌐  Players     "..#Players:GetPlayers())
local fpsLbl  = infoTab:AddLabel("🖥️  FPS         loading...")
infoTab:AddLabel("━━━━━━━  🔗  LINKS  ━━━━━━━")
infoTab:AddButton("💬  Copy Discord", function()
    setclipboard("https://discord.gg/KDx3D8hARN")
    notify("SCP","✅ Discord Copied!",3)
end)
infoTab:AddButton("🔑  Get Key", function()
    setclipboard("https://discord.gg/KDx3D8hARN")
    notify("SCP","🔑 Join Discord to get your key!",4)
end)

local fpsFrames = 0
RunSvc.RenderStepped:Connect(function() fpsFrames += 1 end)
task.spawn(function()
    local last = tick()
    while task.wait(1) do pcall(function()
        local now = tick()
        local fps = math.floor(fpsFrames / (now - last))
        fpsFrames = 0; last = now
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        pingLbl.Text = "📶  Ping        "..ping.."ms"
        plrLbl.Text  = "🌐  Players     "..#Players:GetPlayers()
        fpsLbl.Text  = "🖥️  FPS         "..fps
    end) end
end)

-- ══════════════════════════════════════════
--  FARM TAB
-- ══════════════════════════════════════════
local farmTab,_ = win:AddTab("🌀  Farm")
farmTab:AddLabel("━━━━━━━  🌀  AUTO ORB FARM  ━━━━━━━")

-- Orb dropdown — hardcoded real names from game source
local selectedOrb = "Orange Orb"
local orbDrop,_ = farmTab:AddDropdown("🔮  Select Orb", function(v)
    selectedOrb = v
    notify("SCP","🔮 Selected: "..tostring(v),2)
end)
for _,orb in ipairs(ORB_LIST) do orbDrop:Add(orb) end

local farmMult = 50
farmTab:AddSlider("⚡  Farm Multiplier", {min=1,max=200,default=50}, function(v) farmMult = v end)

local autoFarm = false
local farmCount = 0
local farmLbl = farmTab:AddLabel("Orbs collected: 0")
farmTab:AddSwitch("🌀  Auto Farm", function(v)
    autoFarm = v
    notify("SCP", v and "✅ Auto Farm ON" or "❌ Auto Farm OFF", 2)
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if autoFarm then
            for i=1,farmMult do
                orbEvent:FireServer("collectOrb", selectedOrb, "City")
                farmCount += 1
            end
            farmLbl.Text = "Orbs collected: "..farmCount
        end
    end) end
end)

farmTab:AddLabel("━━━━━━━  ♾️  INFINITE ORB (ALL)  ━━━━━━━")
farmTab:AddLabel("Farms ALL orb types at max speed")
local infiniteOrb = false
farmTab:AddSwitch("♾️  Infinite Orb", function(v)
    infiniteOrb = v
    notify("SCP", v and "✅ Infinite Orb ON" or "❌ Infinite Orb OFF", 2)
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if infiniteOrb then
            for i=1,1000 do
                for _,orb in ipairs(ORB_LIST) do
                    orbEvent:FireServer("collectOrb", orb, "City")
                end
            end
        end
    end) end
end)

farmTab:AddLabel("━━━━━━━  🏇  AUTO HOOPS  ━━━━━━━")
local autoHoops = false
local hoopConn = nil
farmTab:AddSwitch("🏇  Auto Hoops", function(v)
    autoHoops = v
    if v then
        hoopConn = RunSvc.RenderStepped:Connect(function()
            pcall(function()
                for _,hoop in pairs(workspace.Hoops:GetChildren()) do
                    if hoop.Name == "Hoop" then
                        hoop.CFrame = HRP.CFrame
                    end
                end
            end)
        end)
        notify("SCP","✅ Auto Hoops ON",2)
    else
        if hoopConn then hoopConn:Disconnect(); hoopConn = nil end
        notify("SCP","❌ Auto Hoops OFF",2)
    end
end)

farmTab:AddLabel("━━━━━━━  🔄  AUTO REBIRTH  ━━━━━━━")
local autoRebirth = false
farmTab:AddSwitch("🔄  Auto Rebirth", function(v)
    autoRebirth = v
    notify("SCP", v and "✅ Auto Rebirth ON" or "❌ Auto Rebirth OFF", 2)
end)
task.spawn(function()
    while task.wait(0.1) do pcall(function()
        if autoRebirth then rebirthEvent:FireServer("rebirthRequest") end
    end) end
end)

farmTab:AddLabel("━━━━━━━  🏁  AUTO RACE  ━━━━━━━")
local autoRace = false
farmTab:AddSwitch("🏁  Auto Race Win", function(v)
    autoRace = v
    notify("SCP", v and "✅ Auto Race ON" or "❌ Auto Race OFF", 2)
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if autoRace then
            if LP.PlayerGui.gameGui.raceJoinLabel.Visible then
                raceEvent:FireServer("joinRace")
            end
            for _,map in pairs(workspace.raceMaps:GetChildren()) do
                if LP.currentMap.Value == map.mapValue.Value then
                    repeat task.wait() until LP.PlayerGui.gameGui.countdownLabels.goLabel.Visible
                    HRP.CFrame = map.finishPart.CFrame
                end
            end
        end
    end) end
end)

-- ══════════════════════════════════════════
--  MISC TAB
-- ══════════════════════════════════════════
local miscTab,_ = win:AddTab("🎁  Misc")
miscTab:AddLabel("━━━━━━━  🎁  GIFTS & CODES  ━━━━━━━")

miscTab:AddButton("🎁  Claim All Gifts", function()
    for i=1,10 do
        pcall(function() freeGiftRemote:InvokeServer("claimGift", i) end)
    end
    notify("SCP","🎁 All gifts claimed!",3)
end)

miscTab:AddButton("🎰  Spin Fortune Wheel", function()
    pcall(function()
        local chances = RS:WaitForChild("fortuneWheelChances"):WaitForChild("Fortune Wheel")
        fortuneWheelRemote:InvokeServer("openFortuneWheel", chances)
    end)
    notify("SCP","🎰 Fortune wheel spun!",3)
end)

miscTab:AddButton("🎟️  Redeem All Codes", function()
    local success = 0
    for _,code in ipairs(CODES) do
        local ok = pcall(function() codeRemote:InvokeServer(code) end)
        if ok then success += 1 end
    end
    notify("SCP","🎟️ Codes redeemed: "..success.."/"..#CODES,4)
end)

miscTab:AddLabel("━━━━━━━  📦  CHESTS  ━━━━━━━")
miscTab:AddButton("📦  Collect All Chests", function()
    local n = 0
    for _,v in pairs(workspace:GetChildren()) do
        if v.Name:find("Chest") and v:FindFirstChild("circleInner") then
            pcall(function()
                firetouchinterest(HRP, v.circleInner, 0)
                firetouchinterest(HRP, v.circleInner, 1)
                n += 1
            end)
        end
    end
    notify("SCP","📦 Collected "..n.." chests!",3)
end)

miscTab:AddLabel("━━━━━━━  😈  FUN  ━━━━━━━")
local tradeConn = nil
miscTab:AddSwitch("😈  Trade Everyone (Annoy)", function(v)
    if v then
        tradeConn = RunSvc.Heartbeat:Connect(function()
            for _,p in ipairs(Players:GetPlayers()) do
                if p ~= LP then
                    pcall(function() tradingEvent:FireServer("sendTradeRequest", p) end)
                end
            end
        end)
        notify("SCP","😈 Trade spam ON",2)
    else
        if tradeConn then tradeConn:Disconnect(); tradeConn = nil end
        pcall(function() tradingEvent:FireServer("cancelTrade") end)
        notify("SCP","Trade spam OFF",2)
    end
end)

-- ══════════════════════════════════════════
--  PLAYER TAB
-- ══════════════════════════════════════════
local plrTab,_ = win:AddTab("🏃  Player")
plrTab:AddLabel("━━━━━━━  ⚡  SPEED  ━━━━━━━")
local speedVal = 300
plrTab:AddSlider("Speed Value", {min=16,max=1000,default=300}, function(v) speedVal = v end)
local speedOn = false
plrTab:AddSwitch("⚡  Speed Hack", function(v)
    speedOn = v
    if not v then pcall(function() Hum.WalkSpeed = 16 end) end
    notify("SCP", v and "✅ Speed ON" or "❌ Speed OFF", 2)
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if speedOn then Hum.WalkSpeed = speedVal end
    end) end
end)

plrTab:AddLabel("━━━━━━━  🦘  JUMP  ━━━━━━━")
local jumpVal = 100
plrTab:AddSlider("Jump Value", {min=0,max=1500,default=100}, function(v) jumpVal = v end)
local jumpOn = false
plrTab:AddSwitch("🦘  Jump Power", function(v)
    jumpOn = v
    if not v then pcall(function() Hum.JumpPower = 50 end) end
    notify("SCP", v and "✅ Jump ON" or "❌ Jump OFF", 2)
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if jumpOn then Hum.JumpPower = jumpVal end
    end) end
end)

local infJump = false
plrTab:AddSwitch("♾️  Infinite Jump", function(v)
    infJump = v
    notify("SCP", v and "✅ Inf Jump ON" or "❌ Inf Jump OFF", 2)
end)
UIS.JumpRequest:Connect(function()
    if infJump and Hum then
        pcall(function() Hum:ChangeState(Enum.HumanoidStateType.Jumping) end)
    end
end)

plrTab:AddLabel("━━━━━━━  🖥️  FPS  ━━━━━━━")
plrTab:AddSlider("FPS Cap", {min=30,max=240,default=60}, function(v)
    pcall(function() setfpscap(v) end)
end)

plrTab:AddLabel("━━━━━━━  👻  MISC  ━━━━━━━")
local noclip = false
local noclipConn = nil
plrTab:AddSwitch("👻  Noclip", function(v)
    noclip = v
    if v then
        noclipConn = RunSvc.Stepped:Connect(function()
            if Char then
                for _,p in pairs(Char:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
        end)
    else
        if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
        if Char then
            for _,p in pairs(Char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = true end
            end
        end
    end
    notify("SCP", v and "✅ Noclip ON" or "❌ Noclip OFF", 2)
end)

plrTab:AddButton("🔄  Reset Character", function()
    LP:LoadCharacter()
    notify("SCP","🔄 Character reset!",2)
end)

-- ══════════════════════════════════════════
--  TELEPORT TAB
-- ══════════════════════════════════════════
local tpTab,_ = win:AddTab("🗺️  Teleport")
tpTab:AddLabel("━━━━━━━  📍  LOCATIONS  ━━━━━━━")

for _,tp in ipairs(TELEPORTS) do
    local cf = tp.cframe
    tpTab:AddButton("📍  "..tp.name, function()
        pcall(function() HRP.CFrame = cf end)
        notify("SCP","📍 "..tp.name,2)
    end)
end

tpTab:AddLabel("━━━━━━━  👤  PLAYER TELEPORT  ━━━━━━━")
local playerNames = {}
for _,p in pairs(Players:GetPlayers()) do
    if p ~= LP then table.insert(playerNames, p.Name) end
end
local selPlayer = nil
local plrDrop,_ = tpTab:AddDropdown("👤  Select Player", function(v) selPlayer = v end)
for _,pn in ipairs(playerNames) do plrDrop:Add(pn) end
tpTab:AddButton("🚀  Teleport to Player", function()
    if selPlayer then
        local p = Players:FindFirstChild(selPlayer)
        if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            HRP.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(3,0,0)
            notify("SCP","🚀 Teleported to "..selPlayer,3)
        else notify("SCP","❌ Player not available!",3) end
    else notify("SCP","❌ Select a player first!",3) end
end)

tpTab:AddLabel("━━━━━━━  🌍  WORLD SERVERS  ━━━━━━━")
tpTab:AddButton("🏙️  City World",   function() TeleSvc:Teleport(3101667897,LP) end)
tpTab:AddButton("🌌  Space World",  function() TeleSvc:Teleport(3232996272,LP) end)
tpTab:AddButton("🏜️  Desert World", function() TeleSvc:Teleport(3276265788,LP) end)

-- ══════════════════════════════════════════
--  SERVER TAB
-- ══════════════════════════════════════════
local srvTab,_ = win:AddTab("🖥️  Server")
srvTab:AddLabel("━━━━━━━  🖥️  SERVER INFO  ━━━━━━━")
srvTab:AddLabel("Job ID    "..game.JobId:sub(1,22).."...")
srvTab:AddLabel("Place ID  "..game.PlaceId)
srvTab:AddLabel("Players   "..#Players:GetPlayers().."/"..Players.MaxPlayers)
srvTab:AddButton("📋  Copy Job ID", function()
    setclipboard(game.JobId); notify("SCP","✅ Job ID Copied!",3)
end)
srvTab:AddLabel("━━━━━━━  🔀  SERVER HOP  ━━━━━━━")
srvTab:AddButton("🔄  Rejoin", function() TeleSvc:Teleport(game.PlaceId, LP) end)
srvTab:AddButton("🔀  Hop Server", function()
    notify("SCP","🔀 Finding new server...",2)
    task.spawn(function()
        local ok = pcall(function()
            local data = game:GetService("HttpService"):JSONDecode(
                game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
            )
            for _,srv in pairs(data.data) do
                if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                    TeleSvc:TeleportToPlaceInstance(game.PlaceId, srv.id, LP)
                    return
                end
            end
        end)
        if not ok then TeleSvc:Teleport(game.PlaceId, LP) end
    end)
end)

farmTab:Show()
notify("SCP HUB","⚡ Legends of Speed v2  |  RShift to toggle  👑",5)
