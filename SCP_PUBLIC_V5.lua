-- ⚡ SCP HUB | MUSCLE LEGENDS V5 | Made by TEJAZ
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()
local Players=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local RunSvc=game:GetService("RunService")
local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end
local function fmt(n) n=tonumber(n)or 0;if n>=1e12 then return("%.1fT"):format(n/1e12)elseif n>=1e9 then return("%.1fB"):format(n/1e9)elseif n>=1e6 then return("%.1fM"):format(n/1e6)elseif n>=1e3 then return("%.1fK"):format(n/1e3)else return tostring(math.floor(n))end end
local function findPlayer(q) if not q or q==""then return LP end;local l=q:lower();for _,p in ipairs(Players:GetPlayers())do if p.Name:lower()==l or p.DisplayName:lower()==l then return p end end;for _,p in ipairs(Players:GetPlayers())do if p.Name:lower():find(l,1,true)then return p end end end
local function getPunch() local p=LP.Backpack:FindFirstChild("Punch");if p and LP.Character then p.Parent=LP.Character end;return LP.Character and LP.Character:FindFirstChild("Punch") end

-- KEY SYSTEM
local KEY_URL="https://pastebin.com/raw/n7UWskEA"
local function getKeys() local ok,res=pcall(function()return game:HttpGet(KEY_URL)end);if not ok then return{"SCPONTOP"}end;local k={};for v in res:gmatch("[^\n]+")do local t=v:match("^%s*(.-)%s*$");if t~=""then table.insert(k,t)end end;return k end
local function checkKey(e) for _,v in pairs(getKeys())do if v==e then return true end end;return false end

-- KEY CHECK
local keyPassed = false
repeat
    local SG2 = game:GetService("StarterGui")
    pcall(function() SG2:SetCore("SendNotification",{Title="⚡ SCP HUB",Text="🔑 Checking key system...",Duration=3}) end)
    task.wait(0.5)
    -- try saved key first
    if isfolder and isfolder("SCP_HUB") and isfile and isfile("SCP_HUB/key.txt") then
        local saved = readfile("SCP_HUB/key.txt"):match("^%s*(.-)%s*$")
        if checkKey(saved) then keyPassed=true;break end
    end
    -- prompt via notify
    pcall(function() SG2:SetCore("SendNotification",{Title="⚡ SCP HUB KEY",Text="Get key at discord.gg/nDSy4jdVDc — type key in chat",Duration=10}) end)
    local conn;conn = game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
        if msg:sub(1,4):lower()=="key:" then
            local k=msg:sub(5):match("^%s*(.-)%s*$")
            if checkKey(k) then
                keyPassed=true
                if makefolder then makefolder("SCP_HUB") end
                if writefile then writefile("SCP_HUB/key.txt",k) end
                pcall(function() SG2:SetCore("SendNotification",{Title="SCP HUB",Text="✅ Key accepted!",Duration=4}) end)
            else
                pcall(function() SG2:SetCore("SendNotification",{Title="SCP HUB",Text="❌ Wrong key!",Duration=3}) end)
            end
        end
    end)
    repeat task.wait(0.5) until keyPassed
    conn:Disconnect()
until keyPassed

-- WINDOW
local win, Window = library:AddWindow("⚡ SCP HUB | Muscle Legends V5 | Made by TEJAZ", {
    main_color = Color3.fromRGB(185,30,30),
    min_size = Vector2.new(420, 320),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- ═══ OP MAIN TAB ═══
local opMain, _ = win:AddTab("⚡ Op Main")

local killM = "Teleport"
local wl = {}

-- Auto Punch folder
local punchF, _ = opMain:AddFolder("👊 Auto Punch")
local ap_sw, _ = punchF:AddSwitch("👊 Auto Punch", function(v)
    _G.ap=v;if v then task.spawn(function() while _G.ap do
        local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"))
        if p then if p.Parent~=LP.Character then p.Parent=LP.Character end;p:Activate() end;task.wait()
    end end) end
end)
local fp_sw, _ = punchF:AddSwitch("⚡ Fast Punch", function(v)
    local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"))
    if p and p:FindFirstChild("attackTime")then p.attackTime.Value=v and 0 or 0.35 end
end)

-- Auto King folder
local kingF, _ = opMain:AddFolder("👑 Auto King")
local king_sw, _ = kingF:AddSwitch("👑 Auto King (Lock Position)", function(v)
    local kCF=CFrame.new(-8865,430,-5749)
    if v then
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=kCF end
        getgenv().kL=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=kCF end end)
    elseif getgenv().kL then getgenv().kL:Disconnect();getgenv().kL=nil end
end)

-- Defense folder
local defF, _ = opMain:AddFolder("🛡️ Defense")
local akb_sw, _ = defF:AddSwitch("🛡️ Anti Knockback", function(v)
    local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if v and hrp then local bv=Instance.new("BodyVelocity",hrp);bv.MaxForce=Vector3.new(1e5,0,1e5);bv.Velocity=Vector3.new(0,0,0);bv.P=1250
    elseif not v and hrp then local bv=hrp:FindFirstChild("BodyVelocity");if bv then bv:Destroy() end end
end)

-- Kill folder
local killF, _ = opMain:AddFolder("⚔️ Kill Players")
killF:AddButton("🔄 Toggle Kill Method: "..killM, function()
    killM=killM=="Teleport" and "Non-Teleport" or "Teleport"
    notify("SCP","Method: "..killM,2)
end)
killF:AddTextBox("Whitelist player...", function(v)
    if table.find(wl,v)then for i,n in ipairs(wl)do if n==v then table.remove(wl,i);break end end
    else table.insert(wl,v) end;notify("SCP","Whitelist updated",2)
end, {clear=true})

local function doKill(t)
    if not t or t==LP then return end
    local hrp=t.Character and t.Character:FindFirstChild("HumanoidRootPart");local p=getPunch()
    if not p or not hrp then return end
    if killM=="Teleport" and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then hrp.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-3) end
    p:Activate()
    local rh=LP.Character:FindFirstChild("RightHand");local lh=LP.Character:FindFirstChild("LeftHand")
    if rh and lh then firetouchinterest(rh,hrp,1);firetouchinterest(lh,hrp,1);firetouchinterest(rh,hrp,0);firetouchinterest(lh,hrp,0) end
    local me=LP:FindFirstChild("muscleEvent");if me then me:FireServer("punch","rightHand");me:FireServer("punch","leftHand") end
end

local ka_sw, _ = killF:AddSwitch("☠️ Kill All Players", function(v)
    getgenv().kA=v;if v then task.spawn(function() while getgenv().kA do
        for _,p in ipairs(Players:GetPlayers())do if p~=LP and not table.find(wl,p.Name)then pcall(function() doKill(p) end) end end;task.wait()
    end end) end
end)

local kTgt=""
killF:AddTextBox("Kill specific player...", function(v) kTgt=v end, {clear=false})
local ko_sw, _ = killF:AddSwitch("🎯 Kill Specific", function(v)
    getgenv().kO=v;if v then task.spawn(function() while getgenv().kO do
        local p=findPlayer(kTgt);if p and not table.find(wl,p.Name)then pcall(function() doKill(p) end) end;task.wait()
    end end) end
end)

-- Spy cam
local scN=""
killF:AddTextBox("Spy camera target...", function(v) scN=v end, {clear=false})
local sc_sw, _ = killF:AddSwitch("📹 Spy Camera", function(v)
    if v then getgenv().sc=true;task.spawn(function() while getgenv().sc do
        local p=findPlayer(scN);if p and p.Character and p.Character:FindFirstChild("Humanoid")then workspace.CurrentCamera.CameraSubject=p.Character.Humanoid end;task.wait(0.25)
    end end)
    else getgenv().sc=false;if LP.Character and LP.Character:FindFirstChild("Humanoid")then workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid end end
end)

-- ═══ FARM TAB ═══
local farmTab, _ = win:AddTab("🌴 Farm")

local liftF, _ = farmTab:AddFolder("⚡ Auto Lift")
local al_sw, _ = liftF:AddSwitch("⚡ Auto Lift (Rep Fire)", function(v)
    getgenv().aL=v;if v then task.spawn(function() while getgenv().aL do
        pcall(function() local pu=LP.Backpack:FindFirstChild("Pushup")or LP.Backpack:FindFirstChild("Pushups");if pu and LP.Character then pu.Parent=LP.Character end;LP.muscleEvent:FireServer("rep") end);task.wait(0.1)
    end end) end
end)
local awr_sw, _ = liftF:AddSwitch("⚖️ Auto Weight Rep", function(v)
    getgenv().aWR=v;if v then task.spawn(function() while getgenv().aWR do
        pcall(function() local w=LP.Backpack:FindFirstChild("Weight");if w and LP.Character then LP.Character.Humanoid:EquipTool(w) end;LP.muscleEvent:FireServer("rep") end);task.wait(0.01)
    end end) end
end)

local eqF, _ = farmTab:AddFolder("🎒 Auto Equip")
for _,tn in ipairs({"Weight","Pushups","Situps","Handstand"}) do
    eqF:AddSwitch("⚙️ "..tn, function(v)
        getgenv()["eq"..tn]=v;if v then task.spawn(function() while getgenv()["eq"..tn] do
            local w=LP.Backpack:FindFirstChild(tn);if w and LP.Character then w.Parent=LP.Character end;task.wait(0.1)
        end end) end
    end)
end

local jungF, _ = farmTab:AddFolder("🌴 Jungle Machines")
for _,m in ipairs({{"🌴 Jungle Bench","Jungle Bench",CFrame.new(-8629.88,64.88,1855.03)},{"🏋️ Bar Lift","Jungle Bar Lift",CFrame.new(-8678.06,14.50,2089.26)},{"🦵 Squat","Jungle Squat",CFrame.new(-8374.26,34.59,2932.45)}}) do
    local gk="jM_"..m[2]:gsub(" ","")
    jungF:AddSwitch(m[1], function(v)
        getgenv()[gk]=v;if v then task.spawn(function() while getgenv()[gk] do
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then
                LP.Character:SetPrimaryPartCFrame(m[3])
                pcall(function() RS.rEvents.machineInteractRemote:InvokeServer("useMachine",workspace.machinesFolder[m[2]].interactSeat) end)
            end;task.wait(0.1)
        end end) end
    end)
end

local rebF, _ = farmTab:AddFolder("🔄 Auto Rebirth")
local tReb=nil
rebF:AddTextBox("Target rebirth amount...", function(v) tReb=tonumber(v) end, {clear=false})
local ar_sw, _ = rebF:AddSwitch("🔄 Auto Rebirth", function(v)
    getgenv().aReb=v;if v then coroutine.wrap(function() while getgenv().aReb do
        local r=LP:FindFirstChild("leaderstats")and LP.leaderstats:FindFirstChild("Rebirths")
        if r and tReb and r.Value>=tReb then getgenv().aReb=false;notify("SCP","✅ Done!",3);break end
        pcall(function() RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest") end);task.wait(0.1)
    end end)() end
end)
rebF:AddSwitch("📐 Auto Size 2", function(v)
    getgenv().aS2=v;if v then task.spawn(function() while getgenv().aS2 do
        pcall(function() RS.rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",2) end);task.wait(0)
    end end) end
end)
rebF:AddSwitch("🙈 Hide Frames", function(v)
    for _,f in pairs(RS:GetChildren())do if f.Name:match("Frame$")then f.Visible=not v end end
end)
rebF:AddSwitch("📍 Lock Position", function(v)
    if v then local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if hrp then local pos=hrp.CFrame;getgenv().pL=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=pos end end) end
    elseif getgenv().pL then getgenv().pL:Disconnect();getgenv().pL=nil end
end)

-- ═══ FAST FARM TAB (Rocks) ═══
local fastTab, _ = win:AddTab("⚡ Fast Farm")

local rockSetF, _ = fastTab:AddFolder("🪨 Rock Setup")
rockSetF:AddSwitch("👊 Auto Punch", function(v)
    _G.ap=v;if v then task.spawn(function() while _G.ap do
        local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"))
        if p then if p.Parent~=LP.Character then p.Parent=LP.Character end;p:Activate() end;task.wait()
    end end) end
end)
rockSetF:AddSwitch("⚡ Fast Punch", function(v)
    local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"))
    if p and p:FindFirstChild("attackTime")then p.attackTime.Value=v and 0 or 0.3 end
end)
rockSetF:AddSwitch("📍 Lock Position", function(v)
    if v then local pos=LP.Character.HumanoidRootPart.CFrame;getgenv().pL2=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=pos end end)
    elseif getgenv().pL2 then getgenv().pL2:Disconnect();getgenv().pL2=nil end
end)
rockSetF:AddSwitch("🙈 Hide Frames", function(v)
    for _,f in pairs(RS:GetChildren())do if f.Name:match("Frame$")then f.Visible=not v end end
end)

local rockF, _ = fastTab:AddFolder("🪨 Rock Farm")
local function eqP() local p=LP.Backpack:FindFirstChild("Punch");if p then p.Parent=LP.Character end end
for _,rd in ipairs({{"🌴 Jungle Rock",10000000},{"👑 Muscle King",5000000},{"⚡ Legnds",1000000},{"🪨 Large",1000000},{"🔥 Inferno",750000},{"🔮 Mystic",400000},{"❄️ Froze",150000},{"🥇 Golden",5000},{"👊 Punch",10},{"🪨 Tiny",0}}) do
    local rN,rD=rd[1],rd[2]
    rockF:AddSwitch(rN.." ("..fmt(rD)..")", function(v)
        _G.rfA=v
        if v then getgenv().autoFarm=true;notify("SCP","🪨 "..rN,2)
            coroutine.wrap(function() while _G.rfA do
                if LP.Character then
                    eqP();local mf=workspace:FindFirstChild("machinesFolder")
                    if mf then for _,v2 in pairs(mf:GetDescendants())do
                        if v2.Name=="neededDurability" and v2.Value==rD then
                            local rh=LP.Character:FindFirstChild("RightHand");local lh=LP.Character:FindFirstChild("LeftHand")
                            if rh and lh then firetouchinterest(v2.Parent.Rock,rh,0);firetouchinterest(v2.Parent.Rock,rh,1);firetouchinterest(v2.Parent.Rock,lh,0);firetouchinterest(v2.Parent.Rock,lh,1) end
                        end
                    end end
                    pcall(function() LP.muscleEvent:FireServer("punch","rightHand");LP.muscleEvent:FireServer("punch","leftHand") end)
                    local pu=LP.Character:FindFirstChild("Punch");if pu then pu:Activate() end
                end;task.wait(0.05)
            end end)()
        else getgenv().autoFarm=false end
    end)
end

-- ═══ GIFTS TAB ═══
local giftTab, _ = win:AddTab("🎁 Gifts")

local invF, _ = giftTab:AddFolder("📦 Inventory")
local eCL = invF:AddLabel("🥚 Eggs: 0")
local sCL = invF:AddLabel("🥤 Shakes: 0")
local function refInv()
    local cf=LP:FindFirstChild("consumablesFolder");local e,s=0,0
    if cf then for _,i in ipairs(cf:GetChildren())do if i.Name=="Protein Egg"then e=e+1 elseif i.Name=="Tropical Shake"then s=s+1 end end end
    eCL.Text="🥚 Eggs: "..e;sCL.Text="🥤 Shakes: "..s
end
task.spawn(function() while task.wait(5) do refInv() end end);refInv()
invF:AddButton("🔄 Refresh", function() refInv() end)

local eggF, _ = giftTab:AddFolder("🥚 Egg Gifter")
local eT,eA=nil,0
eggF:AddTextBox("Target player...", function(v) local p=Players:FindFirstChild(v)or findPlayer(v);if p then eT=p;notify("SCP","Target: "..p.Name,2) end end, {clear=false})
eggF:AddTextBox("Amount of eggs...", function(v) eA=tonumber(v)or 0 end, {clear=false})
eggF:AddButton("🥚 Gift Eggs", function()
    if not eT then notify("SCP","❌ No target!",3);return end
    task.spawn(function()
        local n=0;local cf=LP:FindFirstChild("consumablesFolder")
        if cf then for i=1,eA do local egg=cf:FindFirstChild("Protein Egg");if egg then pcall(function() RS.rEvents.giftRemote:InvokeServer(eT,egg) end);n=n+1 end;task.wait(0.5) end end
        notify("SCP","✅ "..n.." Eggs → "..eT.Name,4);refInv()
    end)
end)

local shakeF, _ = giftTab:AddFolder("🥤 Shake Gifter")
local sT2,sA2=nil,0
shakeF:AddTextBox("Target player...", function(v) local p=Players:FindFirstChild(v)or findPlayer(v);if p then sT2=p;notify("SCP","Target: "..p.Name,2) end end, {clear=false})
shakeF:AddTextBox("Amount of shakes...", function(v) sA2=tonumber(v)or 0 end, {clear=false})
shakeF:AddButton("🥤 Gift Shakes", function()
    if not sT2 then notify("SCP","❌ No target!",3);return end
    task.spawn(function()
        local n=0;local cf=LP:FindFirstChild("consumablesFolder")
        if cf then for i=1,sA2 do local sh=cf:FindFirstChild("Tropical Shake");if sh then pcall(function() RS.rEvents.giftRemote:InvokeServer(sT2,sh) end);n=n+1 end;task.wait(0.5) end end
        notify("SCP","✅ "..n.." Shakes → "..sT2.Name,4);refInv()
    end)
end)

-- ═══ MISC TAB ═══
local miscTab, _ = win:AddTab("⚙️ Misc")

local perfF, _ = miscTab:AddFolder("🖥️ Performance")
perfF:AddSwitch("🖥️ Low Graphics", function(v)
    game.Lighting.GlobalShadows=not v;game.Lighting.FogEnd=v and 9e9 or 1e5;game.Lighting.Brightness=v and 0 or 2;settings().Rendering.QualityLevel=v and"Level01"or"Level21"
    if v then for _,f in pairs(game:GetDescendants())do pcall(function() if f:IsA("ParticleEmitter")or f:IsA("Trail")then f.Lifetime=NumberRange.new(0) end end) end end
end)
perfF:AddSwitch("🌊 Walk on Water", function(v)
    if v then local sz=2048;local ct=math.ceil(50000/sz);for x=-ct,ct do for z=-ct,ct do local p=Instance.new("Part");p.Size=Vector3.new(sz,1,sz);p.Position=Vector3.new(x*sz,-9.5,z*sz);p.Anchored=true;p.Transparency=1;p.CanCollide=true;p.Parent=workspace end end end
end)
perfF:AddButton("🚫 Remove Ad Portals", function()
    local c=0;for _,v in pairs(game:GetDescendants())do if v.Name=="RobloxForwardPortals"then v:Destroy();c=c+1 end end
    if _G.AdC then _G.AdC:Disconnect() end;_G.AdC=game.DescendantAdded:Connect(function(v) if v.Name=="RobloxForwardPortals"then v:Destroy() end end)
    notify("SCP","🚫 "..c.." removed!",3)
end)
perfF:AddButton("🎮 Free AutoLift Gamepass", function()
    pcall(function() for _,gp in pairs(RS.gamepassIds:GetChildren())do local val=Instance.new("IntValue");val.Name=gp.Name;val.Value=gp.Value;val.Parent=LP.ownedGamepasses end end)
    notify("SCP","🎮 Done!",3)
end)
perfF:AddButton("🛡️ Anti AFK", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end);notify("SCP","🛡️ ON!",3)
end)

local teleF, _ = miscTab:AddFolder("🌀 Teleport")
for _,loc in ipairs({{"🏖️ Beach",Vector3.new(0,0,0)},{"❄️ Frost Gym",Vector3.new(-2650,7,-393)},{"🔮 Mythical Gym",Vector3.new(2255,7,1071)},{"♾️ Eternal Gym",Vector3.new(-6768,7,-1287)},{"⚡ Legend Gym",Vector3.new(4429,991,-3880)},{"👑 Muscle King",Vector3.new(-8799,17,-5798)},{"🌴 Jungle Gym",Vector3.new(-7894,6,2386)},{"🏋️ Tiny Gym",Vector3.new(50,7,1918)},{"🔥 Lava Brawl",Vector3.new(4471,119,-8836)},{"🏜️ Desert Brawl",Vector3.new(960,17,-7398)}}) do
    teleF:AddButton(loc[1], function()
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if hrp then hrp.CFrame=CFrame.new(loc[2]);notify("SCP","🌀 "..loc[1],2) end
    end)
end

-- ═══ CRYSTALS TAB ═══
local crystTab, _ = win:AddTab("💎 Crystals")

local petF, _ = crystTab:AddFolder("🥚 Pets & Auras")
local sP="Neon Guardian"
local sA2="Blue Aura"
petF:AddTextBox("Pet name...", function(v) sP=v end, {clear=false})
petF:AddSwitch("🥚 Auto Buy Pet", function(v)
    getgenv().aPet=v;if v then task.spawn(function() while getgenv().aPet do
        pcall(function() local f=RS.cPetShopFolder:FindFirstChild(sP);if f then RS.cPetShopRemote:InvokeServer(f) end end);task.wait(1)
    end end) end
end)
petF:AddTextBox("Aura name...", function(v) sA2=v end, {clear=false})
petF:AddSwitch("🌀 Auto Buy Aura", function(v)
    getgenv().aAura=v;if v then task.spawn(function() while getgenv().aAura do
        pcall(function() local f=RS.cPetShopFolder:FindFirstChild(sA2);if f then RS.cPetShopRemote:InvokeServer(f) end end);task.wait(1)
    end end) end
end)

local ultF, _ = crystTab:AddFolder("⚡ Ultimates")
local sU="Select ultimate"
ultF:AddTextBox("Ultimate name...", function(v) sU=v end, {clear=false})
ultF:AddSwitch("⚡ Auto Buy Ultimate", function(v)
    getgenv().aUlt=v;if v then task.spawn(function() while getgenv().aUlt do
        pcall(function() local f=RS:FindFirstChild("ultimatesFolder")and RS.ultimatesFolder:FindFirstChild(sU);if f then RS.rEvents.buyUltimateRemote:InvokeServer(f) end end);task.wait(1)
    end end) end
end)

local wheelF, _ = crystTab:AddFolder("🎡 Fortune Wheel")
wheelF:AddSwitch("🎡 Auto Spin Wheel", function(v)
    getgenv().aSpin=v;if v then task.spawn(function() while getgenv().aSpin do
        pcall(function() RS.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel",RS.fortuneWheelChances["Fortune Wheel"]) end);task.wait(1)
    end end) end
end)

-- ═══ STATS TAB ═══
local statsTab, _ = win:AddTab("📊 Stats")

local sesF, _ = statsTab:AddFolder("⏱️ Session")
local ss=os.time()
local timeLbl = sesF:AddLabel("⏱️ 0d 0h 0m 0s")
task.spawn(function() while task.wait(1) do local e=os.time()-ss;timeLbl.Text="⏱️ "..math.floor(e/86400).."d "..math.floor(e%86400/3600).."h "..math.floor(e%3600/60).."m "..e%60 .."s" end end)

local statF, _ = statsTab:AddFolder("📈 Stats")
local ls=LP:WaitForChild("leaderstats",10)
local strS=ls and ls:WaitForChild("Strength",5)
local rebS=ls and ls:WaitForChild("Rebirths",5)
local killS=ls and ls:WaitForChild("Kills",5)
local durS=LP:WaitForChild("Durability",5)
local evilS=LP:WaitForChild("evilKarma",5)
local goodS=LP:WaitForChild("goodKarma",5)
local iStr=strS and strS.Value or 0
local iDur=durS and durS.Value or 0
local iReb=rebS and rebS.Value or 0
local iKill=killS and killS.Value or 0
local SL=statF:AddLabel("💪 Str: —")
local DL=statF:AddLabel("🛡️ Dur: —")
local RL=statF:AddLabel("🔄 Rebs: —")
local KL=statF:AddLabel("⚔️ Kills: —")
local EL=statF:AddLabel("😈 Evil: —")
local GL=statF:AddLabel("😇 Good: —")
task.spawn(function() while task.wait(0.5) do pcall(function()
    SL.Text="💪 Str: "..fmt(strS.Value).." | +"..fmt(strS.Value-iStr)
    DL.Text="🛡️ Dur: "..fmt(durS.Value).." | +"..fmt(durS.Value-iDur)
    RL.Text="🔄 Rebs: "..fmt(rebS.Value).." | +"..fmt(rebS.Value-iReb)
    KL.Text="⚔️ Kills: "..fmt(killS.Value).." | +"..fmt(killS.Value-iKill)
    EL.Text="😈 Evil: "..fmt(evilS.Value)
    GL.Text="😇 Good: "..fmt(goodS.Value)
end) end end)

local rateF, _ = statsTab:AddFolder("📉 Rate /hr")
local RSL=rateF:AddLabel("💪 Str/hr: warming up...")
local RDL=rateF:AddLabel("🛡️ Dur/hr: warming up...")
local sH,dH={},{}
task.spawn(function() while task.wait(0.5) do pcall(function()
    local n=tick();table.insert(sH,{t=n,v=strS.Value});table.insert(dH,{t=n,v=durS.Value})
    while #sH>0 and n-sH[1].t>10 do table.remove(sH,1) end
    while #dH>0 and n-dH[1].t>10 do table.remove(dH,1) end
    if #sH>=2 then RSL.Text="💪 Str/hr: "..fmt(math.floor((sH[#sH].v-sH[1].v)/10*3600)) end
    if #dH>=2 then RDL.Text="🛡️ Dur/hr: "..fmt(math.floor((dH[#dH].v-dH[1].v)/10*3600)) end
end) end end)

local spyF, _ = statsTab:AddFolder("🔍 Spy Player")
local spyT=LP
local SPN=spyF:AddLabel("👤 "..LP.Name)
local SPS=spyF:AddLabel("Stats: —")
spyF:AddTextBox("Search player...", function(v) local p=findPlayer(v);if p then spyT=p;SPN.Text="👤 "..p.Name end end, {clear=false})
task.spawn(function() while task.wait(1) do pcall(function()
    if not spyT then return end
    local tls=spyT:FindFirstChild("leaderstats")
    local s1=tls and tls:FindFirstChild("Strength") and fmt(tls.Strength.Value) or "—"
    local s2=spyT:FindFirstChild("Durability") and fmt(spyT.Durability.Value) or "—"
    local s3=tls and tls:FindFirstChild("Rebirths") and fmt(tls.Rebirths.Value) or "—"
    local s4=tls and tls:FindFirstChild("Kills") and fmt(tls.Kills.Value) or "—"
    SPS.Text="💪"..s1.." 🛡️"..s2.." 🔄"..s3.." ⚔️"..s4
end) end end)

-- Show first tab
opMain:Show()
notify("SCP HUB","⚡ V5 Loaded! Made by TEJAZ 👑  |  RShift to toggle",5)
