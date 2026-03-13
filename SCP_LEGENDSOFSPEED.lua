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
local rEvents          = RS:WaitForChild("rEvents")
local orbEvent         = rEvents:WaitForChild("orbEvent")
local rebirthEvent     = rEvents:WaitForChild("rebirthEvent")
local raceEvent        = rEvents:WaitForChild("raceEvent")
local freeGiftRemote   = rEvents:WaitForChild("freeGiftClaimRemote")
local areaTravelRemote = rEvents:WaitForChild("areaTravelRemote")

-- ══════════════════════════════════════════
--  DATA — loaded SYNCHRONOUSLY before UI
-- ══════════════════════════════════════════

-- ORBS: wait for folder then read names
local listOrbs = {}
local orbsFolder = RS:WaitForChild("Orbs", 10)
if orbsFolder then
    for _,v in pairs(orbsFolder:GetChildren()) do
        table.insert(listOrbs, v.Name)
    end
end
-- Fallback if folder empty or missing
if #listOrbs == 0 then
    listOrbs = {"Bronze Orb","Silver Orb","Gold Orb","Diamond Orb",
                "Emerald Orb","Ruby Orb","Sapphire Orb","Amethyst Orb",
                "Obsidian Orb","Rainbow Orb","Cosmic Orb","Shadow Orb"}
end

-- PLACES: wait then read
local listPlaces = {}
local orbFolder = workspace:FindFirstChild("orbFolder")
if not orbFolder then orbFolder = workspace:WaitForChild("orbFolder", 10) end
if orbFolder then
    for _,v in pairs(orbFolder:GetChildren()) do
        if not v.Name:find("Race") then table.insert(listPlaces, v.Name) end
    end
end

-- PLAYERS
local playerNames = {}
for _,p in pairs(Players:GetPlayers()) do
    if p ~= LP then table.insert(playerNames, p.Name) end
end

-- ══════════════════════════════════════════
--  HELPERS
-- ══════════════════════════════════════════
local function getCurrentMap()
    local ok,v = pcall(function() return LP.currentMap.Value end)
    return ok and tostring(v) or "Unknown"
end
local function CollectOrb(orb)
    pcall(function() orbEvent:FireServer("collectOrb", orb, getCurrentMap()) end)
end
local function DoRebirth()
    pcall(function() rebirthEvent:FireServer("rebirthRequest") end)
end
local function getAreaCircle(name)
    for _,v in pairs(workspace:WaitForChild("areaCircles"):GetChildren()) do
        if v:FindFirstChild("areaName") and v.areaName.Value == name then return v end
    end
end
local function TravelToArea(area)
    pcall(function() areaTravelRemote:InvokeServer("travelToArea", getAreaCircle(area)) end)
end
local function ClaimGift(val)
    pcall(function() freeGiftRemote:InvokeServer("claimGift", val) end)
end
local function getHighestGift()
    local r = 0
    pcall(function()
        for _,v in pairs(LP:WaitForChild("freeGiftsClaimedFolder"):GetChildren()) do
            if tonumber(v.Name) and tonumber(v.Name) > r then r = tonumber(v.Name) end
        end
    end)
    return r
end

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
local function getKeys()
    local ok,res = pcall(function() return game:HttpGet(KEY_URL) end)
    if not ok then return {} end
    local k = {}
    for line in res:gmatch("[^\n]+") do
        local t = line:match("^%s*(.-)%s*$")
        if t ~= "" then table.insert(k, t) end
    end
    return k
end
local function checkKey(e)
    for _,v in pairs(getKeys()) do if v == e then return true end end
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
kt:AddButton("🔑  Get Key — Copy Discord Link", function()
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
infoTab:AddLabel("🔮  Orbs loaded: "..#listOrbs)
infoTab:AddLabel("━━━━━━━  📊  LIVE STATS  ━━━━━━━")
local pingLbl = infoTab:AddLabel("📶  Ping        loading...")
local plrLbl  = infoTab:AddLabel("🌐  Players     "..#Players:GetPlayers())
local mapLbl  = infoTab:AddLabel("🗺️  Map         loading...")
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
        mapLbl.Text  = "🗺️  Map         "..getCurrentMap()
        fpsLbl.Text  = "🖥️  FPS         "..fps
    end) end
end)

-- ══════════════════════════════════════════
--  FARM TAB
-- ══════════════════════════════════════════
local farmTab,_ = win:AddTab("🌀  Farm")
farmTab:AddLabel("━━━━━━━  🌀  AUTO FARM  ━━━━━━━")
farmTab:AddLabel("✅  "..#listOrbs.." orbs loaded and ready to select!")

-- ── Orb selection ──
local selectedOrbs = {}

-- Dropdown is built NOW with the already-loaded listOrbs
farmTab:AddDropdown("🔮  Select Orb", listOrbs, function(v)
    selectedOrbs = type(v) == "table" and v or {v}
end)

farmTab:AddButton("✅  Select ALL Orbs", function()
    selectedOrbs = {}
    for _,v in pairs(listOrbs) do table.insert(selectedOrbs, v) end
    notify("SCP","✅ All "..#selectedOrbs.." orbs selected!",3)
end)
farmTab:AddButton("❌  Deselect All", function()
    selectedOrbs = {}
    notify("SCP","Orbs deselected",2)
end)

local farmMult = 20
farmTab:AddSlider("⚡  Farm Multiplier", {min=1,max=100,default=20}, function(v) farmMult = v end)

local autoFarm   = false
local farmCount  = 0
local farmStatLbl = farmTab:AddLabel("Orbs collected this session: 0")

farmTab:AddSwitch("🌀  Auto Farm", function(v)
    autoFarm = v
    if v and #selectedOrbs == 0 then
        for _,orb in pairs(listOrbs) do table.insert(selectedOrbs, orb) end
        notify("SCP","✅ Auto Farm ON — all orbs selected",3)
    else
        notify("SCP", v and "✅ Auto Farm ON" or "❌ Auto Farm OFF", 2)
    end
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if autoFarm then
            for _,orb in pairs(selectedOrbs) do
                for i=1,farmMult do
                    CollectOrb(orb)
                    farmCount += 1
                end
            end
            farmStatLbl.Text = "Orbs collected this session: "..farmCount
        end
    end) end
end)

farmTab:AddLabel("━━━━━━━  🏇  AUTO HOOPS  ━━━━━━━")
local autoHoops = false
farmTab:AddSwitch("🏇  Auto Hoops", function(v)
    autoHoops = v
    notify("SCP", v and "✅ Auto Hoops ON" or "❌ Auto Hoops OFF", 2)
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if autoHoops then
            local hf = workspace:FindFirstChild("Hoops")
            if hf then
                for _,v in pairs(hf:GetChildren()) do
                    pcall(function() firetouchinterest(HRP,v,0); firetouchinterest(HRP,v,1) end)
                end
            end
        end
    end) end
end)

farmTab:AddLabel("━━━━━━━  🔄  AUTO REBIRTH  ━━━━━━━")
local autoRebirth = false
farmTab:AddSwitch("🔄  Auto Rebirth", function(v)
    autoRebirth = v
    notify("SCP", v and "✅ Auto Rebirth ON" or "❌ Auto Rebirth OFF", 2)
end)
task.spawn(function()
    while task.wait(0.5) do pcall(function()
        if autoRebirth then DoRebirth() end
    end) end
end)

farmTab:AddLabel("━━━━━━━  🎁  AUTO GIFTS  ━━━━━━━")
local autoGifts = false
farmTab:AddSwitch("🎁  Auto Claim Gifts", function(v)
    autoGifts = v
    notify("SCP", v and "✅ Auto Gifts ON" or "❌ Auto Gifts OFF", 2)
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if autoGifts then ClaimGift(getHighestGift() + 1) end
    end) end
end)

farmTab:AddLabel("━━━━━━━  🏁  AUTO RACE  ━━━━━━━")
local autoRace = false
farmTab:AddSwitch("🏁  Auto Race Win", function(v)
    autoRace = v
    notify("SCP", v and "✅ Auto Race ON" or "❌ Auto Race OFF", 2)
end)
pcall(function()
    RS:WaitForChild("raceInProgress").Changed:Connect(function(state)
        if autoRace and state then
            pcall(function() raceEvent:FireServer("joinRace") end)
            pcall(function() LP.PlayerGui.gameGui.raceJoinLabel.Visible = false end)
        end
    end)
    RS:WaitForChild("raceStarted").Changed:Connect(function(state)
        if autoRace and state then
            for _,map in pairs(workspace:WaitForChild("raceMaps"):GetChildren()) do
                if map:FindFirstChild("finishPart") then
                    local fp  = map.finishPart
                    local old = fp.CFrame
                    fp.CFrame = HRP.CFrame
                    task.wait()
                    fp.CFrame = old
                end
            end
        end
    end)
end)

farmTab:AddLabel("━━━━━━━  📦  CHESTS  ━━━━━━━")
farmTab:AddButton("📦  Collect All Chests", function()
    local n = 0
    for _,v in pairs(workspace:GetChildren()) do
        if v.Name:find("Chest") and v:FindFirstChild("circleInner") then
            pcall(function()
                firetouchinterest(HRP,v.circleInner,0)
                firetouchinterest(HRP,v.circleInner,1)
                n += 1
            end)
        end
    end
    notify("SCP","📦 Collected "..n.." chests!",3)
end)

-- ══════════════════════════════════════════
--  PLAYER TAB
-- ══════════════════════════════════════════
local plrTab,_ = win:AddTab("🏃  Player")
plrTab:AddLabel("━━━━━━━  ⚡  SPEED  ━━━━━━━")
local speedVal = 300
plrTab:AddSlider("Speed Value", {min=16,max=5000,default=300}, function(v) speedVal = v end)
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
plrTab:AddSlider("Jump Value", {min=50,max=1000,default=100}, function(v) jumpVal = v end)
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

plrTab:AddLabel("━━━━━━━  👻  MISC  ━━━━━━━")
local noclip = false
plrTab:AddSwitch("👻  Noclip", function(v)
    noclip = v
    notify("SCP", v and "✅ Noclip ON" or "❌ Noclip OFF", 2)
end)
RunSvc.Stepped:Connect(function()
    if noclip and Char then
        for _,p in pairs(Char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)
plrTab:AddButton("🔄  Reset Character", function()
    LP:LoadCharacter()
    notify("SCP","🔄 Character reset!",2)
end)

-- ══════════════════════════════════════════
--  TELEPORT TAB
-- ══════════════════════════════════════════
local tpTab,_ = win:AddTab("🗺️  Teleport")
tpTab:AddLabel("━━━━━━━  📍  AREA TELEPORT  ━━━━━━━")
local selPlace = nil
tpTab:AddDropdown("📍  Select Area", listPlaces, function(v) selPlace = v end)
tpTab:AddButton("🚀  Teleport to Area", function()
    if selPlace then TravelToArea(selPlace); notify("SCP","🚀 Teleporting to "..selPlace,3)
    else notify("SCP","❌ Select an area first!",3) end
end)

tpTab:AddLabel("━━━━━━━  🌍  WORLD TELEPORT  ━━━━━━━")
tpTab:AddButton("🏙️  City",   function() TeleSvc:Teleport(3101667897,LP); notify("SCP","🏙️ Going to City...",3) end)
tpTab:AddButton("🌌  Space",  function() TeleSvc:Teleport(3232996272,LP); notify("SCP","🌌 Going to Space...",3) end)
tpTab:AddButton("🏜️  Desert", function() TeleSvc:Teleport(3276265788,LP); notify("SCP","🏜️ Going to Desert...",3) end)

tpTab:AddLabel("━━━━━━━  👤  PLAYER TELEPORT  ━━━━━━━")
local selPlayer = nil
tpTab:AddDropdown("👤  Select Player", playerNames, function(v) selPlayer = v end)
tpTab:AddButton("🚀  Teleport to Player", function()
    if selPlayer then
        local p = Players:FindFirstChild(selPlayer)
        if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            HRP.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(3,0,0)
            notify("SCP","🚀 Teleported to "..selPlayer,3)
        else notify("SCP","❌ Player not available!",3) end
    else notify("SCP","❌ Select a player first!",3) end
end)

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
srvTab:AddButton("🔄  Rejoin", function()
    TeleSvc:Teleport(game.PlaceId, LP)
end)
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
