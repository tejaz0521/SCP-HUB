-- ⚡ SCP HUB | LEGENDS OF SPEED | Made by TEJAZ

-- Reuse library from selector if available, else load fresh
local library
if _G.scpLibrary then
    library = _G.scpLibrary
else
    library = loadstring(game:HttpGet("https://raw.githubusercontent.com/imhenne187/SilenceElerium/refs/heads/main/src/SilenceEleriumLibrary.luau", true))()
    _G.scpLibrary = library
end

-- SCP logo injector
local injectSCPLogo = _G.injectSCPLogo or function(wFrame)
    task.spawn(function()
        local bar
        for i=1,60 do bar=wFrame:FindFirstChild("Bar"); if bar then break end; task.wait(0.05) end
        if not bar then return end
        local tog
        for i=1,20 do tog=bar:FindFirstChild("Toggle"); if tog then break end; task.wait(0.05) end
        if not tog then return end
        pcall(function()
            tog.Image="rbxassetid://3926305904"
            tog.ImageColor3=Color3.fromRGB(0,220,100)
            tog.Size=UDim2.new(0,18,0,18)
            local ex=bar:FindFirstChild("SCPLogo"); if ex then ex:Destroy() end
            local lbl=Instance.new("TextLabel")
            lbl.Name="SCPLogo"; lbl.Size=UDim2.new(0,32,0,14)
            lbl.Position=UDim2.new(0,22,0,2); lbl.BackgroundTransparency=1
            lbl.Text="SCP"; lbl.TextColor3=Color3.fromRGB(0,200,80)
            lbl.TextSize=11; lbl.Font=Enum.Font.FredokaOne
            lbl.ZIndex=tog.ZIndex+1; lbl.Parent=bar
        end)
    end)
end

-- ══════════════════════════════════════════
--  SERVICES
-- ══════════════════════════════════════════
local Players       = game:GetService("Players")
local RS            = game:GetService("ReplicatedStorage")
local RunSvc        = game:GetService("RunService")
local UIS           = game:GetService("UserInputService")
local TeleSvc       = game:GetService("TeleportService")
local SG            = game:GetService("StarterGui")
local LP            = Players.LocalPlayer
repeat task.wait() until LP and LP.Character
local Char          = LP.Character
local Hum           = Char:WaitForChild("Humanoid")
local HRP           = Char:WaitForChild("HumanoidRootPart")

local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

-- Remote references
local rEvents       = RS:WaitForChild("rEvents")
local orbEvent      = rEvents:WaitForChild("orbEvent")
local rebirthEvent  = rEvents:WaitForChild("rebirthEvent")
local raceEvent     = rEvents:WaitForChild("raceEvent")
local freeGiftRemote = rEvents:WaitForChild("freeGiftClaimRemote")
local areaTravelRemote = rEvents:WaitForChild("areaTravelRemote")

-- Orb list
local listOrbs = {}
for _,v in pairs(RS:WaitForChild("Orbs"):GetChildren()) do
    table.insert(listOrbs, v.Name)
end

-- Place list
local listPlaces = {}
task.spawn(function()
    for _,v in pairs(workspace:WaitForChild("orbFolder"):GetChildren()) do
        if not v.Name:find("Race") then
            table.insert(listPlaces, v.Name)
        end
    end
end)

local function getCurrentMap() return LP.currentMap.Value end
local function CollectOrb(orb) pcall(function() orbEvent:FireServer("collectOrb", orb, getCurrentMap()) end) end
local function DoRebirth() pcall(function() rebirthEvent:FireServer("rebirthRequest") end) end
local function getAreaCircle(name)
    for _,v in pairs(workspace:WaitForChild("areaCircles"):GetChildren()) do
        if v:FindFirstChild("areaName") and v.areaName.Value == name then return v end
    end
end
local function TravelToArea(area)
    pcall(function() areaTravelRemote:InvokeServer("travelToArea", getAreaCircle(area)) end)
end
local function ClaimGift(val) pcall(function() freeGiftRemote:InvokeServer("claimGift", val) end) end
local function getHighestGift()
    local r = 0
    for _,v in pairs(LP:WaitForChild("freeGiftsClaimedFolder"):GetChildren()) do
        if tonumber(v.Name) and tonumber(v.Name) > r then r = tonumber(v.Name) end
    end
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
    for v in res:gmatch("[^\n]+") do
        local t = v:match("^%s*(.-)%s*$"); if t ~= "" then table.insert(k, t) end
    end
    return k
end
local function checkKey(e) for _,v in pairs(getKeys()) do if v==e then return true end end return false end

local keyPassed = false
local kW,kF = library:AddWindow("🔑 𝗦𝗖𝗣 𝗛𝗨𝗕 — 𝗞𝗲𝘆 𝗦𝘆𝘀𝘁𝗲𝗺", {
    main_color=Color3.fromRGB(0,180,80),
    title_bar={Color3.fromRGB(0,200,90),Color3.fromRGB(0,80,35)},
    background={Color3.fromRGB(3,12,6)},
    background_transparency=0,
    min_size=Vector2.new(600,160),
    can_resize=false
})
local kt,_ = kW:AddTab("🔑  𝗞𝗲𝘆")
kt:AddLabel("⚡  𝗦𝗖𝗣 𝗛𝗨𝗕  •  𝗟𝗲𝗴𝗲𝗻𝗱𝘀 𝗼𝗳 𝗦𝗽𝗲𝗲𝗱  •  𝗧𝗘𝗝𝗔𝗭")
kt:AddLabel("🔑  𝗚𝗲𝘁 𝘆𝗼𝘂𝗿 𝗙𝗥𝗘𝗘 𝗸𝗲𝘆 𝗮𝘁  discord.gg/KDx3D8hARN")
local stL = kt:AddLabel("📋  𝗣𝗮𝘀𝘁𝗲 𝗸𝗲𝘆 𝗯𝗲𝗹𝗼𝘄 𝘁𝗵𝗲𝗻 𝗽𝗿𝗲𝘀𝘀 𝗘𝗻𝘁𝗲𝗿")
kt:AddTextBox("Paste key here...", function(v)
    if checkKey(v) then stL.Text = "✅  𝗞𝗲𝘆 𝗔𝗰𝗰𝗲𝗽𝘁𝗲𝗱!  𝗟𝗼𝗮𝗱𝗶𝗻𝗴..."; keyPassed = true
    else stL.Text = "❌  𝗪𝗿𝗼𝗻𝗴 𝗸𝗲𝘆!  discord.gg/KDx3D8hARN" end
end, {clear=true})
kt:AddButton("💬  𝗖𝗼𝗽𝘆 𝗗𝗶𝘀𝗰𝗼𝗿𝗱", function() setclipboard("https://discord.gg/KDx3D8hARN"); notify("SCP","✅ Copied!",3) end)
kt:AddButton("🔑  𝗚𝗲𝘁 𝗙𝗿𝗲𝗲 𝗞𝗲𝘆", function()
    setclipboard("https://discord.gg/KDx3D8hARN")
    notify("SCP","🔑 Discord copied! Join to get key 👑",4)
end)
kt:AddButton("🔑  𝗚𝗲𝘁 𝗞𝗲𝘆", function() setclipboard("https://discord.gg/KDx3D8hARN"); notify("SCP","🔑 Join Discord to get key!",3) end)
injectSCPLogo(kF)
kt:Show()
repeat task.wait(0.5) until keyPassed
kF:Destroy()

-- ══════════════════════════════════════════
--  MAIN WINDOW
-- ══════════════════════════════════════════
local win,winF = library:AddWindow("⚡ 𝗦𝗖𝗣 𝗛𝗨𝗕  |  𝗟𝗲𝗴𝗲𝗻𝗱𝘀 𝗼𝗳 𝗦𝗽𝗲𝗲𝗱  |  𝗧𝗘𝗝𝗔𝗭", {
    main_color=Color3.fromRGB(0,180,80),
    title_bar={Color3.fromRGB(0,200,90),Color3.fromRGB(0,80,35)},
    background={Color3.fromRGB(3,12,6)},
    background_transparency=0,
    min_size=Vector2.new(600,280),
    toggle_key=Enum.KeyCode.RightShift,
    can_resize=true,
})
task.defer(function() injectSCPLogo(winF) end)

-- ══════════════════════════════════════════
--  INFO TAB
-- ══════════════════════════════════════════
local infoTab,_ = win:AddTab("📋  𝗜𝗻𝗳𝗼")
infoTab:AddLabel("━━━━━━━  ⚡  𝗦𝗖𝗣 𝗛𝗨𝗕  •  𝗟𝗘𝗚𝗘𝗡𝗗𝗦 𝗢𝗙 𝗦𝗣𝗘𝗘𝗗  ━━━━━━━")
infoTab:AddLabel("👑  𝗔𝘂𝘁𝗵𝗼𝗿   TEJAZ  (SCP_TEJAZ)")
infoTab:AddLabel("💎  𝗩𝗲𝗿𝘀𝗶𝗼𝗻   1.0")
infoTab:AddLabel("🔄  𝗧𝗼𝗴𝗴𝗹𝗲   RightShift")
infoTab:AddLabel("💬  𝗗𝗶𝘀𝗰𝗼𝗿𝗱  discord.gg/KDx3D8hARN")
infoTab:AddLabel("━━━━━━━  📊  𝗟𝗜𝗩𝗘 𝗜𝗡𝗙𝗢  ━━━━━━━")
local pingLbl = infoTab:AddLabel("📶  𝗣𝗶𝗻𝗴   calculating...")
local plrLbl  = infoTab:AddLabel("🌐  𝗣𝗹𝗮𝘆𝗲𝗿𝘀   "..#Players:GetPlayers())
local mapLbl  = infoTab:AddLabel("🗺️  𝗠𝗮𝗽   loading...")
infoTab:AddLabel("━━━━━━━  🔗  𝗟𝗜𝗡𝗞𝗦  ━━━━━━━")
infoTab:AddButton("💬  𝗖𝗼𝗽𝘆 𝗗𝗶𝘀𝗰𝗼𝗿𝗱", function() setclipboard("https://discord.gg/KDx3D8hARN"); notify("SCP","✅ Copied!",3) end)

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            pingLbl.Text = "📶  𝗣𝗶𝗻𝗴   "..ping.."ms"
            plrLbl.Text  = "🌐  𝗣𝗹𝗮𝘆𝗲𝗿𝘀   "..#Players:GetPlayers()
            mapLbl.Text  = "🗺️  𝗠𝗮𝗽   "..tostring(getCurrentMap())
        end)
    end
end)

-- ══════════════════════════════════════════
--  FARM TAB
-- ══════════════════════════════════════════
local farmTab,_ = win:AddTab("🌀  𝗙𝗮𝗿𝗺")
farmTab:AddLabel("━━━━━━━  🌀  𝗔𝗨𝗧𝗢 𝗙𝗔𝗥𝗠  ━━━━━━━")
farmTab:AddLabel("⚠️  Select orbs below then toggle Auto Farm")

-- Orb selector
local selectedOrbs = {}
farmTab:AddDropdown("🔮  𝗦𝗲𝗹𝗲𝗰𝘁 𝗢𝗿𝗯𝘀", listOrbs, function(v) selectedOrbs = v end)

-- Farm multiplier
local farmMult = 20
farmTab:AddSlider("⚡  𝗙𝗮𝗿𝗺 𝗠𝘂𝗹𝘁𝗶𝗽𝗹𝗶𝗲𝗿", {min=1,max=100,default=20}, function(v) farmMult = v end)

-- Auto Farm
local autoFarm = false
farmTab:AddSwitch("🌀  𝗔𝘂𝘁𝗼 𝗙𝗮𝗿𝗺", function(v) autoFarm = v; notify("SCP", v and "✅ Auto Farm ON" or "❌ Auto Farm OFF", 2) end)
task.spawn(function()
    while task.wait() do pcall(function()
        if autoFarm then
            for _,orb in pairs(selectedOrbs) do
                for i=1,farmMult do CollectOrb(orb) end
            end
        end
    end) end
end)

farmTab:AddLabel("━━━━━━━  🔄  𝗔𝗨𝗧𝗢 𝗥𝗘𝗕𝗜𝗥𝗧𝗛  ━━━━━━━")
local autoRebirth = false
farmTab:AddSwitch("🔄  𝗔𝘂𝘁𝗼 𝗥𝗲𝗯𝗶𝗿𝘁𝗵", function(v) autoRebirth = v; notify("SCP", v and "✅ Auto Rebirth ON" or "❌ Auto Rebirth OFF", 2) end)
task.spawn(function()
    while task.wait(0.5) do pcall(function()
        if autoRebirth then DoRebirth() end
    end) end
end)

farmTab:AddLabel("━━━━━━━  🎁  𝗔𝗨𝗧𝗢 𝗚𝗜𝗙𝗧𝗦  ━━━━━━━")
local autoGifts = false
farmTab:AddSwitch("🎁  𝗔𝘂𝘁𝗼 𝗖𝗹𝗮𝗶𝗺 𝗚𝗶𝗳𝘁𝘀", function(v) autoGifts = v; notify("SCP", v and "✅ Auto Gifts ON" or "❌ Auto Gifts OFF", 2) end)
task.spawn(function()
    while task.wait() do pcall(function()
        if autoGifts then ClaimGift(getHighestGift() + 1) end
    end) end
end)

farmTab:AddLabel("━━━━━━━  🏁  𝗔𝗨𝗧𝗢 𝗥𝗔𝗖𝗘  ━━━━━━━")
local autoRace = false
farmTab:AddSwitch("🏁  𝗔𝘂𝘁𝗼 𝗥𝗮𝗰𝗲 𝗪𝗶𝗻", function(v) autoRace = v; notify("SCP", v and "✅ Auto Race ON" or "❌ Auto Race OFF", 2) end)

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
                    local fp = map.finishPart
                    local old = fp.CFrame
                    fp.CFrame = HRP.CFrame
                    task.wait()
                    fp.CFrame = old
                end
            end
        end
    end)
end)

farmTab:AddLabel("━━━━━━━  📦  𝗖𝗢𝗟𝗟𝗘𝗖𝗧 𝗖𝗛𝗘𝗦𝗧𝗦  ━━━━━━━")
farmTab:AddButton("📦  𝗖𝗼𝗹𝗹𝗲𝗰𝘁 𝗔𝗹𝗹 𝗖𝗵𝗲𝘀𝘁𝘀", function()
    local count = 0
    for _,v in pairs(workspace:GetChildren()) do
        if v.Name:find("Chest") and v:FindFirstChild("circleInner") then
            pcall(function()
                firetouchinterest(HRP, v.circleInner, 0)
                firetouchinterest(HRP, v.circleInner, 1)
                count = count + 1
            end)
        end
    end
    notify("SCP","📦 Collected "..count.." chests!",3)
end)

-- ══════════════════════════════════════════
--  PLAYER TAB
-- ══════════════════════════════════════════
local plrTab,_ = win:AddTab("🏃  𝗣𝗹𝗮𝘆𝗲𝗿")
plrTab:AddLabel("━━━━━━━  ⚡  𝗦𝗣𝗘𝗘𝗗  ━━━━━━━")

local speedVal = 300
plrTab:AddSlider("🏃  𝗦𝗽𝗲𝗲𝗱 𝗠𝘂𝗹𝘁𝗶𝗽𝗹𝗶𝗲𝗿", {min=16,max=5000,default=300}, function(v) speedVal = v end)
local speedOn = false
plrTab:AddSwitch("⚡  𝗦𝗽𝗲𝗲𝗱 𝗛𝗮𝗰𝗸", function(v)
    speedOn = v
    if not v then Hum.WalkSpeed = 16 end
    notify("SCP", v and "✅ Speed ON" or "❌ Speed OFF", 2)
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if speedOn then Hum.WalkSpeed = speedVal end
    end) end
end)

plrTab:AddLabel("━━━━━━━  🦘  𝗝𝗨𝗠𝗣  ━━━━━━━")
local jumpVal = 100
plrTab:AddSlider("🦘  𝗝𝘂𝗺𝗽 𝗣𝗼𝘄𝗲𝗿", {min=50,max=1000,default=100}, function(v) jumpVal = v end)
local jumpOn = false
plrTab:AddSwitch("🦘  𝗦𝗲𝘁 𝗝𝘂𝗺𝗽 𝗣𝗼𝘄𝗲𝗿", function(v)
    jumpOn = v
    if not v then Hum.JumpPower = 50 end
    notify("SCP", v and "✅ Jump Power ON" or "❌ Jump Power OFF", 2)
end)
task.spawn(function()
    while task.wait() do pcall(function()
        if jumpOn then Hum.JumpPower = jumpVal end
    end) end
end)

local infJump = false
plrTab:AddSwitch("♾️  𝗜𝗻𝗳𝗶𝗻𝗶𝘁𝗲 𝗝𝘂𝗺𝗽", function(v) infJump = v; notify("SCP", v and "✅ Inf Jump ON" or "❌ Inf Jump OFF", 2) end)
UIS.JumpRequest:Connect(function()
    if infJump and Hum then pcall(function() Hum:ChangeState(Enum.HumanoidStateType.Jumping) end) end
end)

plrTab:AddLabel("━━━━━━━  👻  𝗠𝗜𝗦𝗖  ━━━━━━━")
local noclip = false
plrTab:AddSwitch("👻  𝗡𝗼𝗰𝗹𝗶𝗽", function(v) noclip = v; notify("SCP", v and "✅ Noclip ON" or "❌ Noclip OFF", 2) end)
RunSvc.Stepped:Connect(function()
    if noclip and Char then
        for _,p in pairs(Char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- ══════════════════════════════════════════
--  TELEPORT TAB
-- ══════════════════════════════════════════
local tpTab,_ = win:AddTab("🗺️  𝗧𝗲𝗹𝗲𝗽𝗼𝗿𝘁")
tpTab:AddLabel("━━━━━━━  📍  𝗔𝗥𝗘𝗔 𝗧𝗘𝗟𝗘𝗣𝗢𝗥𝗧  ━━━━━━━")

local selPlace = nil
tpTab:AddDropdown("📍  𝗦𝗲𝗹𝗲𝗰𝘁 𝗔𝗿𝗲𝗮", listPlaces, function(v) selPlace = v end)
tpTab:AddButton("🚀  𝗧𝗲𝗹𝗲𝗽𝗼𝗿𝘁 𝘁𝗼 𝗔𝗿𝗲𝗮", function()
    if selPlace then TravelToArea(selPlace); notify("SCP","🚀 Teleporting to "..selPlace,3)
    else notify("SCP","❌ Select an area first!",3) end
end)

tpTab:AddLabel("━━━━━━━  🌍  𝗪𝗢𝗥𝗟𝗗 𝗧𝗘𝗟𝗘𝗣𝗢𝗥𝗧  ━━━━━━━")
tpTab:AddButton("🏙️  𝗖𝗶𝘁𝘆", function() TeleSvc:Teleport(3101667897, LP); notify("SCP","🏙️ Teleporting to City",3) end)
tpTab:AddButton("🌌  𝗦𝗽𝗮𝗰𝗲", function() TeleSvc:Teleport(3232996272, LP); notify("SCP","🌌 Teleporting to Space",3) end)
tpTab:AddButton("🏜️  𝗗𝗲𝘀𝗲𝗿𝘁", function() TeleSvc:Teleport(3276265788, LP); notify("SCP","🏜️ Teleporting to Desert",3) end)

tpTab:AddLabel("━━━━━━━  👤  𝗣𝗟𝗔𝗬𝗘𝗥 𝗧𝗘𝗟𝗘𝗣𝗢𝗥𝗧  ━━━━━━━")
local playerNames = {}
for _,p in pairs(Players:GetPlayers()) do if p ~= LP then table.insert(playerNames, p.Name) end end
local selPlayer = nil
tpTab:AddDropdown("👤  𝗦𝗲𝗹𝗲𝗰𝘁 𝗣𝗹𝗮𝘆𝗲𝗿", playerNames, function(v) selPlayer = v end)
tpTab:AddButton("🚀  𝗧𝗲𝗹𝗲𝗽𝗼𝗿𝘁 𝘁𝗼 𝗣𝗹𝗮𝘆𝗲𝗿", function()
    if selPlayer and Players:FindFirstChild(selPlayer) then
        local tChar = Players[selPlayer].Character
        if tChar and tChar:FindFirstChild("HumanoidRootPart") then
            HRP.CFrame = tChar.HumanoidRootPart.CFrame + Vector3.new(3,0,0)
            notify("SCP","🚀 Teleported to "..selPlayer,3)
        end
    else notify("SCP","❌ Player not found!",3) end
end)

-- ══════════════════════════════════════════
--  SERVER TAB
-- ══════════════════════════════════════════
local srvTab,_ = win:AddTab("🖥️  𝗦𝗲𝗿𝘃𝗲𝗿")
srvTab:AddLabel("━━━━━━━  🖥️  𝗦𝗘𝗥𝗩𝗘𝗥  ━━━━━━━")
srvTab:AddLabel("🆔  𝗝𝗼𝗯𝗜𝗗   "..game.JobId:sub(1,25).."...")
srvTab:AddLabel("📍  𝗣𝗹𝗮𝗰𝗲𝗜𝗗   "..game.PlaceId)
srvTab:AddButton("📋  𝗖𝗼𝗽𝘆 𝗝𝗼𝗯 𝗜𝗗", function() setclipboard(game.JobId); notify("SCP","✅ JobID Copied!",3) end)
srvTab:AddButton("🔄  𝗥𝗲𝗷𝗼𝗶𝗻", function() TeleSvc:Teleport(game.PlaceId, LP) end)
srvTab:AddButton("🔀  𝗛𝗼𝗽 𝗦𝗲𝗿𝘃𝗲𝗿", function()
    local ok,res = pcall(function()
        local servers = game:GetService("HttpService"):JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
        )
        for _,srv in pairs(servers.data) do
            if srv.id ~= game.JobId and srv.playing < srv.maxPlayers then
                TeleSvc:TeleportToPlaceInstance(game.PlaceId, srv.id, LP)
                return
            end
        end
    end)
    if not ok then TeleSvc:Teleport(game.PlaceId, LP) end
    notify("SCP","🔀 Hopping server...",3)
end)

farmTab:Show()
notify("SCP HUB","⚡ 𝗟𝗲𝗴𝗲𝗻𝗱𝘀 𝗼𝗳 𝗦𝗽𝗲𝗲𝗱 𝗟𝗼𝗮𝗱𝗲𝗱! 𝗥𝗦𝗵𝗶𝗳𝘁 𝘁𝗼 𝘁𝗼𝗴𝗴𝗹𝗲 👑",5)
