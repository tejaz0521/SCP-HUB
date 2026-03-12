-- ⚡ SCP HUB | MUSCLE LEGENDS V5 | Made by TEJAZ
-- Library: SilenceElerium by imhenne187

-- Reuse library from selector if available, else load fresh
local library
if _G.scpLibrary then
    library = _G.scpLibrary
else
    library = loadstring(game:HttpGet("https://raw.githubusercontent.com/imhenne187/SilenceElerium/refs/heads/main/src/SilenceEleriumLibrary.luau", true))()
    _G.scpLibrary = library
end

-- SCP LOGO INJECTOR
local injectSCPLogo = _G.injectSCPLogo or (function(wFrame)
    task.spawn(function()
        -- Wait up to 3 seconds for Bar to exist
        local bar
        for i=1,60 do
            bar = wFrame:FindFirstChild("Bar")
            if bar then break end
            task.wait(0.05)
        end
        if not bar then return end
        local tog
        for i=1,20 do
            tog = bar:FindFirstChild("Toggle")
            if tog then break end
            task.wait(0.05)
        end
        if not tog then return end
        pcall(function()
            tog.Image="rbxassetid://3926305904"
            tog.ImageColor3=Color3.fromRGB(200,200,200)
            tog.Size=UDim2.new(0,18,0,18)
            local ex=bar:FindFirstChild("SCPLogo"); if ex then ex:Destroy() end
            local lbl=Instance.new("TextLabel")
            lbl.Name="SCPLogo"; lbl.Size=UDim2.new(0,32,0,14)
            lbl.Position=UDim2.new(0,22,0,2); lbl.BackgroundTransparency=1
            lbl.Text="SCP"; lbl.TextColor3=Color3.fromRGB(180,180,180)
            lbl.TextSize=11; lbl.Font=Enum.Font.FredokaOne
            lbl.ZIndex=tog.ZIndex+1; lbl.Parent=bar
        end)
    end)
end)

local Players    = game:GetService("Players")
local RS         = game:GetService("ReplicatedStorage")
local RunSvc     = game:GetService("RunService")
local SG         = game:GetService("StarterGui")
local LP         = Players.LocalPlayer
repeat task.wait() until LP and LP.Character

-- ══════════════════════════════════════════
--  HELPERS
-- ══════════════════════════════════════════
local function notify(t,m,d)
    pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end)
end
local function fmt(n)
    n=tonumber(n)or 0
    if n>=1e12 then return("%.1fT"):format(n/1e12)
    elseif n>=1e9  then return("%.1fB"):format(n/1e9)
    elseif n>=1e6  then return("%.1fM"):format(n/1e6)
    elseif n>=1e3  then return("%.1fK"):format(n/1e3)
    else return tostring(math.floor(n)) end
end
local function findPlayer(q)
    if not q or q=="" then return LP end
    local l=q:lower()
    for _,p in ipairs(Players:GetPlayers()) do
        if p.Name:lower()==l or p.DisplayName:lower()==l then return p end
    end
    for _,p in ipairs(Players:GetPlayers()) do
        if p.Name:lower():find(l,1,true) then return p end
    end
end
local function getPunch()
    local p=LP.Backpack:FindFirstChild("Punch")
    if p and LP.Character then p.Parent=LP.Character end
    return LP.Character and LP.Character:FindFirstChild("Punch")
end

-- ══════════════════════════════════════════
--  KEY SYSTEM
-- ══════════════════════════════════════════
local KEY_URL = "https://pastebin.com/raw/n7UWskEA"
local function getKeys()
    local ok,res=pcall(function() return game:HttpGet(KEY_URL) end)
    if not ok then return {} end
    local k={}
    for v in res:gmatch("[^\n]+") do
        local t=v:match("^%s*(.-)%s*$"); if t~="" then table.insert(k,t) end
    end
    return k
end
local function checkKey(e)
    for _,v in pairs(getKeys()) do if v==e then return true end end
    return false
end

-- KEY SYSTEM (required every execution)
local keyPassed=false
local kWin, kFrame = library:AddWindow("🔑 SCP HUB — Key System", {
    main_color=Color3.fromRGB(30,30,30),
    title_bar           = {Color3.fromRGB(185,30,30), Color3.fromRGB(100,10,10)},
    background={Color3.fromRGB(8,8,8)},
    background_transparency = 0,
    min_size            = Vector2.new(600,160),
    toggle_key          = Enum.KeyCode.RightShift,
    can_resize          = false,
})
local kt,_ = kWin:AddTab("🔑  Key")
kt:AddLabel("⚡  𝗦𝗖𝗣 𝗛𝗨𝗕  •  𝗠𝘂𝘀𝗰𝗹𝗲 𝗟𝗲𝗴𝗲𝗻𝗱𝘀 𝗩𝟱  •  𝗧𝗘𝗝𝗔𝗭")
kt:AddLabel("🔑  𝗚𝗲𝘁 𝘆𝗼𝘂𝗿 𝗙𝗥𝗘𝗘 𝗸𝗲𝘆 𝗮𝘁  discord.gg/KDx3D8hARN")
local stLbl = kt:AddLabel("📋  𝗣𝗮𝘀𝘁𝗲 𝗸𝗲𝘆 𝗯𝗲𝗹𝗼𝘄 𝘁𝗵𝗲𝗻 𝗽𝗿𝗲𝘀𝘀 𝗘𝗻𝘁𝗲𝗿")
kt:AddTextBox("Paste key here then press Enter...", function(v)
    if checkKey(v) then
        stLbl.Text = "✅  Key accepted!  Loading SCP HUB..."
        keyPassed = true
    else
        stLbl.Text = "❌  Wrong key!  discord.gg/KDx3D8hARN"
    end
end,{clear=true})
kt:AddButton("💬  Copy Discord Link", function()
    setclipboard("https://discord.gg/KDx3D8hARN")
    notify("SCP HUB","✅ Discord copied!",3)
end)
kt:AddButton("🔑  𝗚𝗲𝘁 𝗙𝗿𝗲𝗲 𝗞𝗲𝘆", function()
    setclipboard("https://discord.gg/KDx3D8hARN")
    notify("SCP","🔑 Discord copied! Join to get key 👑",4)
end)
injectSCPLogo(kFrame)
kt:Show()
repeat task.wait(0.5) until keyPassed
kFrame:Destroy()

-- ══════════════════════════════════════════
--  MAIN WINDOW
-- ══════════════════════════════════════════
local WIN_CFG = {
    main_color=Color3.fromRGB(30,30,30),
    title_bar           = {Color3.fromRGB(200,35,35), Color3.fromRGB(100,10,10)},
    background={Color3.fromRGB(8,8,8)},
    background_transparency = 0,
    min_size            = Vector2.new(600,280),
    toggle_key          = Enum.KeyCode.RightShift,
    can_resize          = true,
}
local win, winFrame = library:AddWindow("⚡ SCP HUB  |  Muscle Legends V5  |  TEJAZ", WIN_CFG)
task.defer(function() injectSCPLogo(winFrame) end)

-- Replace Silence logo with SCP skull icon
pcall(function()
    local bar=winFrame:FindFirstChild("Bar")
    if bar then local tog=bar:FindFirstChild("Toggle")
        if tog then tog.Image="rbxassetid://6031075931"; tog.ImageColor3=Color3.fromRGB(200,200,200) end
    end
end)
-- ══════════════════════════════════════════
--  TAB: INFO
-- ══════════════════════════════════════════
local infoTab,_ = win:AddTab("📋  𝗜𝗻𝗳𝗼")
infoTab:AddLabel("━━━━━━━  ⚡  𝗦𝗖𝗣 𝗛𝗨𝗕 𝗜𝗡𝗙𝗢  ━━━━━━━")
infoTab:AddLabel("🎮  𝗦𝗰𝗿𝗶𝗽𝘁   SCP HUB  •  Muscle Legends V5")
infoTab:AddLabel("👑  𝗔𝘂𝘁𝗵𝗼𝗿   TEJAZ  (SCP_TEJAZ)")
infoTab:AddLabel("💎  𝗩𝗲𝗿𝘀𝗶𝗼𝗻   4.5")
infoTab:AddLabel("🔑  𝗞𝗲𝘆      discord.gg/KDx3D8hARN")
infoTab:AddLabel("💬  𝗗𝗶𝘀𝗰𝗼𝗿𝗱  discord.gg/KDx3D8hARN")
infoTab:AddLabel("🔄  𝗧𝗼𝗴𝗴𝗹𝗲   RightShift")
infoTab:AddLabel("━━━━━━━  📊  𝗟𝗜𝗩𝗘 𝗣𝗟𝗔𝗬𝗘𝗥 𝗜𝗡𝗙𝗢  ━━━━━━━")
local pingLbl  = infoTab:AddLabel("📶  Ping:  calculating...")
local nameLbl  = infoTab:AddLabel("👤  Name:  "..LP.Name)
local dispLbl  = infoTab:AddLabel("🏷️  Display:  "..LP.DisplayName)
local idLbl    = infoTab:AddLabel("🆔  UserID:  "..LP.UserId)
local charLbl  = infoTab:AddLabel("🌐  Server Players:  "..#Players:GetPlayers())
infoTab:AddLabel("━━━━━━━  🔧  𝗦𝗘𝗥𝗩𝗘𝗥 𝗜𝗡𝗙𝗢  ━━━━━━━")
local jobLbl   = infoTab:AddLabel("🖥️  JobID:  "..game.JobId:sub(1,20).."...")
local placeLbl = infoTab:AddLabel("📍  PlaceID:  "..game.PlaceId)
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            charLbl.Text = "🌐  Server Players:  "..#Players:GetPlayers()
            local s=tick()
            game:GetService("RunService").Heartbeat:Wait()
            pingLbl.Text = "📶  Ping:  "..math.floor((tick()-s)*1000).."ms"
        end)
    end
end)
infoTab:AddLabel("━━━━━━━  🔗  𝗟𝗜𝗡𝗞𝗦  ━━━━━━━")
infoTab:AddButton("💬  Copy Discord Link", function()
    setclipboard("https://discord.gg/KDx3D8hARN")
    notify("SCP HUB","✅ Discord copied!",3)
end)
infoTab:AddButton("🗑️  Clear Saved Key", function()
    if writefile then writefile("SCP_HUB/key.txt","") end
    notify("SCP HUB","🗑️ Key cleared — rejoin to re-enter",4)
end)

-- ══════════════════════════════════════════
--  TAB: OP MAIN
-- ══════════════════════════════════════════
local opTab,_ = win:AddTab("⚡  𝗢𝗽 𝗠𝗮𝗶𝗻")
local killM = "Teleport"
local wl = {}

opTab:AddLabel("━━━━━━━  👊  𝗔𝗨𝗧𝗢 𝗣𝗨𝗡𝗖𝗛  ━━━━━━━")
opTab:AddSwitch("👊  Auto Punch", function(v)
    _G.scpAP=v
    if v then task.spawn(function() while _G.scpAP do
        local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch"))
        if p then if p.Parent~=LP.Character then p.Parent=LP.Character end; p:Activate() end
        task.wait()
    end end) end
end)
opTab:AddSwitch("⚡  Fast Punch (0 cooldown)", function(v)
    local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch"))
    if p then local at=p:FindFirstChild("attackTime"); if at then at.Value=v and 0 or 0.35 end end
end)

opTab:AddLabel("━━━━━━━  👑  𝗔𝗨𝗧𝗢 𝗞𝗜𝗡𝗚  ━━━━━━━")
opTab:AddSwitch("👑  Auto King (Lock at throne)", function(v)
    local kCF=CFrame.new(-8865,430,-5749)
    if v then
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame=kCF
        end
        getgenv().scpKL=RunSvc.Heartbeat:Connect(function()
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                LP.Character.HumanoidRootPart.CFrame=kCF
            end
        end)
    else
        if getgenv().scpKL then getgenv().scpKL:Disconnect(); getgenv().scpKL=nil end
    end
end)

opTab:AddLabel("━━━━━━━  🛡️  𝗗𝗘𝗙𝗘𝗡𝗦𝗘  ━━━━━━━")
opTab:AddSwitch("🛡️  Anti Knockback", function(v)
    local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if v and hrp then
        local bv=Instance.new("BodyVelocity",hrp)
        bv.MaxForce=Vector3.new(1e5,0,1e5); bv.Velocity=Vector3.zero; bv.P=1250
    elseif not v and hrp then
        local bv=hrp:FindFirstChild("BodyVelocity"); if bv then bv:Destroy() end
    end
end)
opTab:AddSwitch("♾️  Infinite Jump", function(v)
    getgenv().scpIJ=v
    if v then
        getgenv().scpIJC=game:GetService("UserInputService").JumpRequest:Connect(function()
            if getgenv().scpIJ and LP.Character and LP.Character:FindFirstChild("Humanoid") then
                LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    elseif getgenv().scpIJC then getgenv().scpIJC:Disconnect() end
end)
opTab:AddSwitch("🌌  Low Gravity", function(v) workspace.Gravity=v and 50 or 196.2 end)
opTab:AddSwitch("👻  Noclip", function(v)
    getgenv().scpNC=v
    if v then
        getgenv().scpNCC=RunSvc.Stepped:Connect(function()
            if getgenv().scpNC and LP.Character then
                for _,p in pairs(LP.Character:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide=false end
                end
            end
        end)
    elseif getgenv().scpNCC then getgenv().scpNCC:Disconnect() end
end)
opTab:AddSwitch("🌀  Spin (Anti-Aim)", function(v)
    getgenv().scpSpin=v
    if v then task.spawn(function() while getgenv().scpSpin do
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(10),0)
        end; task.wait(0.05)
    end end) end
end)

opTab:AddLabel("━━━━━━━  ⚔️  𝗞𝗜𝗟𝗟 𝗣𝗟𝗔𝗬𝗘𝗥𝗦  ━━━━━━━")
opTab:AddButton("🔄  Toggle Kill Method (now: Teleport)", function()
    killM=killM=="Teleport" and "None" or "Teleport"
    notify("SCP HUB","Kill Method: "..killM,2)
end)
opTab:AddTextBox("➕  Whitelist name (enter to add/remove)", function(v)
    if table.find(wl,v) then
        for i,n in ipairs(wl) do if n==v then table.remove(wl,i); break end end
        notify("SCP","❌ Removed: "..v,2)
    else table.insert(wl,v); notify("SCP","✅ Added: "..v,2) end
end,{clear=true})

local function doKill(target)
    if not target or target==LP then return end
    local hrp=target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    local punch=getPunch(); if not hrp then return end
    if killM=="Teleport" and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        hrp.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-3)
    end
    if punch then punch:Activate() end
    local rh=LP.Character:FindFirstChild("RightHand"); local lh=LP.Character:FindFirstChild("LeftHand")
    if rh and lh then
        pcall(firetouchinterest,rh,hrp,1); pcall(firetouchinterest,lh,hrp,1)
        pcall(firetouchinterest,rh,hrp,0); pcall(firetouchinterest,lh,hrp,0)
    end
    pcall(function() LP.muscleEvent:FireServer("punch","rightHand") end)
    pcall(function() LP.muscleEvent:FireServer("punch","leftHand") end)
end

opTab:AddSwitch("☠️  Kill All Players", function(v)
    getgenv().scpKA=v
    if v then task.spawn(function() while getgenv().scpKA do
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and not table.find(wl,p.Name) then pcall(doKill,p) end
        end; task.wait(0.1)
    end end) end
end)
local kTgt=""
opTab:AddTextBox("🎯  Kill specific — player name", function(v) kTgt=v end,{clear=false})
opTab:AddSwitch("🎯  Kill Specific Player", function(v)
    getgenv().scpKO=v
    if v then task.spawn(function() while getgenv().scpKO do
        local p=findPlayer(kTgt)
        if p and p~=LP and not table.find(wl,p.Name) then pcall(doKill,p) end
        task.wait(0.1)
    end end) end
end)
local scN=""
opTab:AddTextBox("📹  Spy camera — player name", function(v) scN=v end,{clear=false})
opTab:AddSwitch("📹  Spy Camera", function(v)
    if v then
        getgenv().scpSC=true
        task.spawn(function() while getgenv().scpSC do
            local p=findPlayer(scN)
            if p and p.Character and p.Character:FindFirstChild("Humanoid") then
                workspace.CurrentCamera.CameraSubject=p.Character.Humanoid
            end; task.wait(0.25)
        end end)
    else
        getgenv().scpSC=false
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid
        end
    end
end)

-- ══════════════════════════════════════════
--  TAB: FARM
-- ══════════════════════════════════════════
local farmTab,_ = win:AddTab("🌴  𝗙𝗮𝗿𝗺")

farmTab:AddLabel("━━━━━━━  ⚡  𝗔𝗨𝗧𝗢 𝗟𝗜𝗙𝗧  ━━━━━━━")
farmTab:AddSwitch("⚡  Auto Lift (FireServer rep)", function(v)
    getgenv().scpAL=v
    if v then task.spawn(function() while getgenv().scpAL do
        pcall(function()
            local pu=LP.Backpack:FindFirstChild("Pushup") or LP.Backpack:FindFirstChild("Pushups")
            if pu and LP.Character then pu.Parent=LP.Character end
            LP.muscleEvent:FireServer("rep")
        end); task.wait(0.1)
    end end) end
end)
farmTab:AddSwitch("⚖️  Auto Weight Rep", function(v)
    getgenv().scpWR=v
    if v then task.spawn(function() while getgenv().scpWR do
        pcall(function()
            local w=LP.Backpack:FindFirstChild("Weight")
            if w and LP.Character then LP.Character.Humanoid:EquipTool(w) end
            LP.muscleEvent:FireServer("rep")
        end); task.wait(0.01)
    end end) end
end)
farmTab:AddSwitch("🏋️  Auto Bench Press", function(v)
    getgenv().scpBP=v
    if v then task.spawn(function() while getgenv().scpBP do
        pcall(function() LP.muscleEvent:FireServer("rep","bench") end); task.wait(0.05)
    end end) end
end)

farmTab:AddLabel("━━━━━━━  🎒  𝗔𝗨𝗧𝗢 𝗘𝗤𝗨𝗜𝗣  ━━━━━━━")
for _,tn in ipairs({"Weight","Pushups","Situps","Handstand","Dumbbell"}) do
    farmTab:AddSwitch("🎒  Equip "..tn, function(v)
        getgenv()["scpEQ"..tn]=v
        if v then task.spawn(function() while getgenv()["scpEQ"..tn] do
            local w=LP.Backpack:FindFirstChild(tn)
            if w and LP.Character then w.Parent=LP.Character end
            task.wait(0.1)
        end end) end
    end)
end

farmTab:AddLabel("━━━━━━━  🌴  𝗝𝗨𝗡𝗚𝗟𝗘 𝗠𝗔𝗖𝗛𝗜𝗡𝗘𝗦  ━━━━━━━")
local machines={
    {"🌴  Jungle Bench",  "Jungle Bench",   CFrame.new(-8629.88,64.88,1855.03)},
    {"🏋️  Bar Lift",      "Jungle Bar Lift", CFrame.new(-8678.06,14.50,2089.26)},
    {"🦵  Squat",         "Jungle Squat",    CFrame.new(-8374.26,34.59,2932.45)},
}
for _,m in ipairs(machines) do
    local gk="scpJM"..m[2]:gsub(" ","")
    farmTab:AddSwitch(m[1], function(v)
        getgenv()[gk]=v
        if v then task.spawn(function() while getgenv()[gk] do
            pcall(function()
                if LP.Character then
                    LP.Character:SetPrimaryPartCFrame(m[3])
                    RS.rEvents.machineInteractRemote:InvokeServer("useMachine",workspace.machinesFolder[m[2]].interactSeat)
                end
            end); task.wait(0.1)
        end end) end
    end)
end

farmTab:AddLabel("━━━━━━━  🔄  𝗔𝗨𝗧𝗢 𝗥𝗘𝗕𝗜𝗥𝗧𝗛  ━━━━━━━")
local tReb=nil
farmTab:AddTextBox("Target rebirths (blank = infinite)", function(v) tReb=tonumber(v) end,{clear=false})
farmTab:AddSwitch("🔄  Auto Rebirth", function(v)
    getgenv().scpAReb=v
    if v then task.spawn(function() while getgenv().scpAReb do
        local r=LP:FindFirstChild("leaderstats") and LP.leaderstats:FindFirstChild("Rebirths")
        if r and tReb and r.Value>=tReb then
            getgenv().scpAReb=false; notify("SCP","✅ Rebirth goal reached!",4); break
        end
        pcall(function() RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest") end)
        task.wait(0.15)
    end end) end
end)
farmTab:AddSwitch("📐  Auto Size 2", function(v)
    getgenv().scpAS2=v
    if v then task.spawn(function() while getgenv().scpAS2 do
        pcall(function() RS.rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",2) end)
        task.wait(0)
    end end) end
end)
farmTab:AddSwitch("📍  Lock Position", function(v)
    if v then
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos=hrp.CFrame
            getgenv().scpPL=RunSvc.Heartbeat:Connect(function()
                if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                    LP.Character.HumanoidRootPart.CFrame=pos
                end
            end)
        end
    else
        if getgenv().scpPL then getgenv().scpPL:Disconnect(); getgenv().scpPL=nil end
    end
end)
farmTab:AddSwitch("🙈  Hide Frames (FPS Boost)", function(v)
    for _,f in pairs(RS:GetChildren()) do
        if f.Name:match("Frame$") then f.Visible=not v end
    end
end)
farmTab:AddSwitch("🎮  Free AutoLift Gamepass", function(v)
    if v then pcall(function()
        for _,gp in pairs(RS.gamepassIds:GetChildren()) do
            local val=Instance.new("IntValue"); val.Name=gp.Name; val.Value=gp.Value; val.Parent=LP.ownedGamepasses
        end
    end); notify("SCP","🎮 Gamepass unlocked!",3) end
end)

-- ══════════════════════════════════════════
--  TAB: FAST FARM (Rocks)
-- ══════════════════════════════════════════
local fastTab,_ = win:AddTab("⚡  𝗙𝗮𝘀𝘁 𝗙𝗮𝗿𝗺")

fastTab:AddLabel("━━━━━━━  🪨 ROCK SETUP  ━━━━━━━")
fastTab:AddSwitch("👊  Auto Punch", function(v)
    _G.scpAP2=v
    if v then task.spawn(function() while _G.scpAP2 do
        local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch"))
        if p then if p.Parent~=LP.Character then p.Parent=LP.Character end; p:Activate() end
        task.wait()
    end end) end
end)
fastTab:AddSwitch("⚡  Fast Punch (0 cooldown)", function(v)
    local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch"))
    if p then local at=p:FindFirstChild("attackTime"); if at then at.Value=v and 0 or 0.3 end end
end)
fastTab:AddSwitch("📍  Lock Position", function(v)
    if v then
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos=hrp.CFrame
            getgenv().scpPL2=RunSvc.Heartbeat:Connect(function()
                if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                    LP.Character.HumanoidRootPart.CFrame=pos
                end
            end)
        end
    else
        if getgenv().scpPL2 then getgenv().scpPL2:Disconnect(); getgenv().scpPL2=nil end
    end
end)
fastTab:AddSwitch("🙈  Hide Frames", function(v)
    for _,f in pairs(RS:GetChildren()) do if f.Name:match("Frame$") then f.Visible=not v end end
end)

fastTab:AddLabel("━━━━━━━  🪨 SELECT ROCK  ━━━━━━━")
local rockList={
    {"🌴  Jungle Rock",10000000},{"👑  Muscle King",5000000},{"⚡  Legnds",1000000},
    {"🪨  Large Rock",1000000},{"🔥  Inferno",750000},{"🔮  Mystic",400000},
    {"❄️  Froze",150000},{"🥇  Golden",5000},{"👊  Punch Rock",10},{"🪨  Tiny Rock",0},
}
for _,rd in ipairs(rockList) do
    local rN,rD=rd[1],rd[2]
    fastTab:AddSwitch(rN.." ("..fmt(rD)..")", function(v)
        _G.scpRock=v
        if v then
            notify("SCP","🪨 Farming: "..rN,2)
            task.spawn(function() while _G.scpRock do
                pcall(function()
                    if not LP.Character then return end
                    local punch=LP.Backpack:FindFirstChild("Punch")
                    if punch then punch.Parent=LP.Character end
                    local mf=workspace:FindFirstChild("machinesFolder")
                    if mf then for _,obj in pairs(mf:GetDescendants()) do
                        if obj.Name=="neededDurability" and obj.Value==rD then
                            local rock=obj.Parent:FindFirstChild("Rock")
                            if rock then
                                local rh=LP.Character:FindFirstChild("RightHand")
                                local lh=LP.Character:FindFirstChild("LeftHand")
                                if rh then pcall(firetouchinterest,rh,rock,0); pcall(firetouchinterest,rh,rock,1) end
                                if lh then pcall(firetouchinterest,lh,rock,0); pcall(firetouchinterest,lh,rock,1) end
                            end
                        end
                    end end
                    LP.muscleEvent:FireServer("punch","rightHand")
                    LP.muscleEvent:FireServer("punch","leftHand")
                    local pu=LP.Character:FindFirstChild("Punch"); if pu then pu:Activate() end
                end); task.wait(0.05)
            end end)
        end
    end)
end

-- ══════════════════════════════════════════
--  TAB: GIFTS
-- ══════════════════════════════════════════
local giftTab,_ = win:AddTab("🎁  𝗚𝗶𝗳𝘁𝘀")

giftTab:AddLabel("━━━━━━━  📦 INVENTORY  ━━━━━━━")
local eLbl=giftTab:AddLabel("🥚  Eggs: 0")
local sLbl=giftTab:AddLabel("🥤  Shakes: 0")
local function refInv()
    local cf=LP:FindFirstChild("consumablesFolder"); local e,s=0,0
    if cf then for _,i in ipairs(cf:GetChildren()) do
        if i.Name=="Protein Egg" then e=e+1
        elseif i.Name=="Tropical Shake" then s=s+1 end
    end end
    eLbl.Text="🥚  Eggs: "..e; sLbl.Text="🥤  Shakes: "..s
end
task.spawn(function() while task.wait(5) do refInv() end end); refInv()
giftTab:AddButton("🔄  Refresh Inventory", function() refInv() end)

giftTab:AddLabel("━━━━━━━  🥚 EGG GIFTER  ━━━━━━━")
local eTarget,eAmount=nil,1
giftTab:AddTextBox("Target player name", function(v)
    local p=Players:FindFirstChild(v) or findPlayer(v)
    if p then eTarget=p; notify("SCP","Target: "..p.Name,2)
    else notify("SCP","❌ Player not found",2) end
end,{clear=false})
giftTab:AddTextBox("Amount of eggs", function(v) eAmount=tonumber(v) or 1 end,{clear=false})
giftTab:AddButton("🥚  Gift Eggs Now", function()
    if not eTarget then notify("SCP","❌ Set target first!",3); return end
    task.spawn(function()
        local n=0; local cf=LP:FindFirstChild("consumablesFolder")
        if cf then for i=1,eAmount do
            local egg=cf:FindFirstChild("Protein Egg")
            if egg then pcall(function() RS.rEvents.giftRemote:InvokeServer(eTarget,egg) end); n=n+1 end
            task.wait(0.5)
        end end
        notify("SCP","✅ Gifted "..n.." eggs → "..eTarget.Name,4); refInv()
    end)
end)

giftTab:AddLabel("━━━━━━━  🥤 SHAKE GIFTER  ━━━━━━━")
local sTarget,sAmount=nil,1
giftTab:AddTextBox("Target player name", function(v)
    local p=Players:FindFirstChild(v) or findPlayer(v)
    if p then sTarget=p; notify("SCP","Target: "..p.Name,2)
    else notify("SCP","❌ Player not found",2) end
end,{clear=false})
giftTab:AddTextBox("Amount of shakes", function(v) sAmount=tonumber(v) or 1 end,{clear=false})
giftTab:AddButton("🥤  Gift Shakes Now", function()
    if not sTarget then notify("SCP","❌ Set target first!",3); return end
    task.spawn(function()
        local n=0; local cf=LP:FindFirstChild("consumablesFolder")
        if cf then for i=1,sAmount do
            local sh=cf:FindFirstChild("Tropical Shake")
            if sh then pcall(function() RS.rEvents.giftRemote:InvokeServer(sTarget,sh) end); n=n+1 end
            task.wait(0.5)
        end end
        notify("SCP","✅ Gifted "..n.." shakes → "..sTarget.Name,4); refInv()
    end)
end)

-- ══════════════════════════════════════════
--  TAB: MISC
-- ══════════════════════════════════════════
local miscTab,_ = win:AddTab("⚙️  𝗠𝗶𝘀𝗰")

miscTab:AddLabel("━━━━━━━  🖥️ PERFORMANCE  ━━━━━━━")
miscTab:AddSwitch("🖥️  Low Graphics (FPS Boost)", function(v)
    game.Lighting.GlobalShadows=not v; game.Lighting.FogEnd=v and 9e9 or 1e5
    game.Lighting.Brightness=v and 0 or 2; settings().Rendering.QualityLevel=v and "Level01" or "Level21"
    if v then for _,f in pairs(game:GetDescendants()) do
        pcall(function() if f:IsA("ParticleEmitter") or f:IsA("Trail") then f.Lifetime=NumberRange.new(0) end end)
    end end
end)
miscTab:AddSwitch("🔆  Fullbright", function(v)
    game.Lighting.Brightness=v and 10 or 2; game.Lighting.GlobalShadows=not v
    game.Lighting.ClockTime=v and 14 or 6
end)
miscTab:AddSwitch("🌊  Walk on Water", function(v)
    if v then
        local sz=2048; local ct=math.ceil(50000/sz)
        for x=-ct,ct do for z=-ct,ct do
            local p=Instance.new("Part"); p.Size=Vector3.new(sz,1,sz)
            p.Position=Vector3.new(x*sz,-9.5,z*sz); p.Anchored=true
            p.Transparency=1; p.CanCollide=true; p.Name="SCPWater"; p.Parent=workspace
        end end
    else
        for _,p in pairs(workspace:GetChildren()) do if p.Name=="SCPWater" then p:Destroy() end end
    end
end)
miscTab:AddButton("🚫  Remove Ad Portals", function()
    local c=0
    for _,v in pairs(game:GetDescendants()) do if v.Name=="RobloxForwardPortals" then v:Destroy(); c=c+1 end end
    if _G.scpAdC then _G.scpAdC:Disconnect() end
    _G.scpAdC=game.DescendantAdded:Connect(function(v) if v.Name=="RobloxForwardPortals" then v:Destroy() end end)
    notify("SCP","🚫 Removed "..c.." portals",3)
end)
miscTab:AddButton("🛡️  Anti AFK", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end)
    notify("SCP","🛡️ Anti AFK ON",3)
end)
miscTab:AddSwitch("⚡  Speed Hack (100)", function(v)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=v and 100 or 16 end
end)
miscTab:AddSwitch("🚀  Ultra Speed (250)", function(v)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=v and 250 or 16 end
end)
miscTab:AddSwitch("🦘  High Jump", function(v)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower=v and 100 or 50 end
end)

miscTab:AddLabel("━━━━━━━  🌀 TELEPORT  ━━━━━━━")
local tpList={
    {"🏖️  Beach",Vector3.new(0,0,0)},{"❄️  Frost Gym",Vector3.new(-2650,7,-393)},
    {"🔮  Mythical Gym",Vector3.new(2255,7,1071)},{"♾️  Eternal Gym",Vector3.new(-6768,7,-1287)},
    {"⚡  Legend Gym",Vector3.new(4429,991,-3880)},{"👑  Muscle King",Vector3.new(-8799,17,-5798)},
    {"🌴  Jungle Gym",Vector3.new(-7894,6,2386)},{"🔥  Lava Brawl",Vector3.new(4471,119,-8836)},
    {"🏜️  Desert Brawl",Vector3.new(960,17,-7398)},{"🏋️  Tiny Gym",Vector3.new(50,7,1918)},
}
for _,loc in ipairs(tpList) do
    miscTab:AddButton(loc[1], function()
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.CFrame=CFrame.new(loc[2]); notify("SCP","🌀 "..loc[1],2) end
    end)
end

-- ══════════════════════════════════════════
--  TAB: BUY PETS
-- ══════════════════════════════════════════
local petsTab,_ = win:AddTab("💎  Buy Pets")

petsTab:AddLabel("━━━━━━━  🥚 BUY PETS  ━━━━━━━")
local petNames={
    "Neon Guardian","Shadow Titan","Crystal Drake","Golden Phoenix","Storm Wolf",
    "Void Serpent","Frost Bear","Lava Golem","Thunder Eagle","Mystic Fox",
    "Iron Gorilla","Plasma Shark","Celestial Lion","Doom Reaper","Emerald Dragon",
}
local selPet=petNames[1]
local petDrop,_=petsTab:AddDropdown("🥚  Select Pet", function(v) selPet=v end)
for _,pn in ipairs(petNames) do petDrop:Add(pn) end
petsTab:AddTextBox("Or type pet name manually", function(v) selPet=v end,{clear=false})
petsTab:AddSwitch("🥚  Auto Buy Pet", function(v)
    getgenv().scpPet=v
    if v then task.spawn(function() while getgenv().scpPet do
        pcall(function()
            local f=RS.cPetShopFolder:FindFirstChild(selPet)
            if f then RS.cPetShopRemote:InvokeServer(f) end
        end); task.wait(1)
    end end) end
end)
petsTab:AddButton("🥚  Buy Once", function()
    pcall(function()
        local f=RS.cPetShopFolder:FindFirstChild(selPet)
        if f then RS.cPetShopRemote:InvokeServer(f); notify("SCP","🥚 Bought: "..selPet,3) end
    end)
end)

petsTab:AddLabel("━━━━━━━  🌀 BUY AURAS  ━━━━━━━")
local auraNames={
    "Blue Aura","Red Aura","Gold Aura","Shadow Aura","Neon Aura",
    "Crystal Aura","Storm Aura","Frost Aura","Flame Aura","Void Aura",
}
local selAura=auraNames[1]
local auraDrop,_=petsTab:AddDropdown("🌀  Select Aura", function(v) selAura=v end)
for _,an in ipairs(auraNames) do auraDrop:Add(an) end
petsTab:AddTextBox("Or type aura name manually", function(v) selAura=v end,{clear=false})
petsTab:AddSwitch("🌀  Auto Buy Aura", function(v)
    getgenv().scpAura=v
    if v then task.spawn(function() while getgenv().scpAura do
        pcall(function()
            local f=RS.cPetShopFolder:FindFirstChild(selAura)
            if f then RS.cPetShopRemote:InvokeServer(f) end
        end); task.wait(1)
    end end) end
end)
petsTab:AddButton("🌀  Buy Aura Once", function()
    pcall(function()
        local f=RS.cPetShopFolder:FindFirstChild(selAura)
        if f then RS.cPetShopRemote:InvokeServer(f); notify("SCP","🌀 Bought: "..selAura,3) end
    end)
end)

petsTab:AddLabel("━━━━━━━  ⚡ ULTIMATES  ━━━━━━━")
local ultNames={
    "Ultimate 1","Ultimate 2","Ultimate 3","Ultimate 4","Ultimate 5",
}
local selUlt=ultNames[1]
local ultDrop,_=petsTab:AddDropdown("⚡  Select Ultimate", function(v) selUlt=v end)
for _,un in ipairs(ultNames) do ultDrop:Add(un) end
petsTab:AddTextBox("Or type ultimate name manually", function(v) selUlt=v end,{clear=false})
petsTab:AddSwitch("⚡  Auto Buy Ultimate", function(v)
    getgenv().scpUlt=v
    if v then task.spawn(function() while getgenv().scpUlt do
        pcall(function()
            local f=RS.ultimatesFolder and RS.ultimatesFolder:FindFirstChild(selUlt)
            if f then RS.rEvents.buyUltimateRemote:InvokeServer(f) end
        end); task.wait(1)
    end end) end
end)
petsTab:AddSwitch("🎡  Auto Spin Fortune Wheel", function(v)
    getgenv().scpWheel=v
    if v then task.spawn(function() while getgenv().scpWheel do
        pcall(function()
            RS.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel",RS.fortuneWheelChances["Fortune Wheel"])
        end); task.wait(1)
    end end) end
end)

-- ══════════════════════════════════════════
--  TAB: STATS
-- ══════════════════════════════════════════
local statsTab,_ = win:AddTab("📊  Stats")

statsTab:AddLabel("━━━━━━━  ⏱️ SESSION TIMER  ━━━━━━━")
local ss=os.time()
local timeLbl=statsTab:AddLabel("⏱️  0d 0h 0m 0s")
task.spawn(function() while task.wait(1) do
    local e=os.time()-ss
    timeLbl.Text="⏱️  "..math.floor(e/86400).."d "..math.floor(e%86400/3600).."h "..math.floor(e%3600/60).."m "..(e%60).."s"
end end)

statsTab:AddLabel("━━━━━━━  📈 STATS GAINED  ━━━━━━━")
local ls=LP:WaitForChild("leaderstats",10)
local strS=ls and ls:FindFirstChild("Strength")
local rebS=ls and ls:FindFirstChild("Rebirths")
local killS=ls and ls:FindFirstChild("Kills")
local durS=LP:FindFirstChild("Durability")
local evilS=LP:FindFirstChild("evilKarma")
local goodS=LP:FindFirstChild("goodKarma")
local iStr=strS and strS.Value or 0; local iDur=durS and durS.Value or 0
local iReb=rebS and rebS.Value or 0; local iKill=killS and killS.Value or 0
local SL=statsTab:AddLabel("💪  Strength:    —")
local DL=statsTab:AddLabel("🛡️  Durability:  —")
local RL=statsTab:AddLabel("🔄  Rebirths:    —")
local KL=statsTab:AddLabel("⚔️  Kills:       —")
local EL=statsTab:AddLabel("😈  Evil Karma:  —")
local GL=statsTab:AddLabel("😇  Good Karma:  —")
task.spawn(function() while task.wait(0.5) do pcall(function()
    if strS then SL.Text="💪  Strength:    "..fmt(strS.Value).."  (+"..fmt(strS.Value-iStr)..")" end
    if durS then DL.Text="🛡️  Durability:  "..fmt(durS.Value).."  (+"..fmt(durS.Value-iDur)..")" end
    if rebS then RL.Text="🔄  Rebirths:    "..fmt(rebS.Value).."  (+"..fmt(rebS.Value-iReb)..")" end
    if killS then KL.Text="⚔️  Kills:       "..fmt(killS.Value).."  (+"..fmt(killS.Value-iKill)..")" end
    if evilS then EL.Text="😈  Evil Karma:  "..fmt(evilS.Value) end
    if goodS then GL.Text="😇  Good Karma:  "..fmt(goodS.Value) end
end) end end)

statsTab:AddLabel("━━━━━━━  📉 GAIN RATE / HR  ━━━━━━━")
local RSL=statsTab:AddLabel("💪  Str/hr:  warming up...")
local RDL=statsTab:AddLabel("🛡️  Dur/hr:  warming up...")
local sH,dH={},{}
task.spawn(function() while task.wait(0.5) do pcall(function()
    local n=tick()
    if strS then table.insert(sH,{t=n,v=strS.Value}) end
    if durS then table.insert(dH,{t=n,v=durS.Value}) end
    while #sH>0 and n-sH[1].t>30 do table.remove(sH,1) end
    while #dH>0 and n-dH[1].t>30 do table.remove(dH,1) end
    if #sH>=2 and sH[#sH].t~=sH[1].t then
        RSL.Text="💪  Str/hr:  "..fmt(math.floor((sH[#sH].v-sH[1].v)/(sH[#sH].t-sH[1].t)*3600))
    end
    if #dH>=2 and dH[#dH].t~=dH[1].t then
        RDL.Text="🛡️  Dur/hr:  "..fmt(math.floor((dH[#dH].v-dH[1].v)/(dH[#dH].t-dH[1].t)*3600))
    end
end) end end)

statsTab:AddLabel("━━━━━━━  🔍 PLAYER SPY  ━━━━━━━")
local spyT=LP
local spyName=statsTab:AddLabel("👤  Spying:  "..LP.Name)
local spyStat=statsTab:AddLabel("📊  Stats loading...")
statsTab:AddTextBox("Enter player name to spy", function(v)
    local p=findPlayer(v); if p then spyT=p; spyName.Text="👤  Spying:  "..p.Name end
end,{clear=false})
task.spawn(function() while task.wait(1) do pcall(function()
    if not spyT then return end
    local tls=spyT:FindFirstChild("leaderstats")
    local s1=tls and tls:FindFirstChild("Strength") and fmt(tls.Strength.Value) or "?"
    local s2=spyT:FindFirstChild("Durability") and fmt(spyT.Durability.Value) or "?"
    local s3=tls and tls:FindFirstChild("Rebirths") and fmt(tls.Rebirths.Value) or "?"
    local s4=tls and tls:FindFirstChild("Kills") and fmt(tls.Kills.Value) or "?"
    spyStat.Text="💪"..s1.."  🛡️"..s2.."  🔄"..s3.."  ⚔️"..s4
end) end end)

-- Show info tab first
infoTab:Show()
notify("SCP HUB","⚡ V5 Loaded! RShift to toggle  👑  Made by TEJAZ",5)
