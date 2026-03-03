-- SCP HUB | MUSCLE LEGENDS PUBLIC V5 | Made by TEJAZ
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RunSvc = game:GetService("RunService")
local SG = game:GetService("StarterGui")
local LP = Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end
local function fmt(n) n=tonumber(n)or 0;if n>=1e12 then return("%.1fT"):format(n/1e12)elseif n>=1e9 then return("%.1fB"):format(n/1e9)elseif n>=1e6 then return("%.1fM"):format(n/1e6)elseif n>=1e3 then return("%.1fK"):format(n/1e3)else return tostring(math.floor(n))end end
local function findPlayer(q) if not q or q==""then return LP end;local l=q:lower();for _,p in ipairs(Players:GetPlayers())do if p.Name:lower()==l or p.DisplayName:lower()==l then return p end end;for _,p in ipairs(Players:GetPlayers())do if p.Name:lower():find(l,1,true)then return p end end end
local function getPunch() local p=LP.Backpack:FindFirstChild("Punch");if p and LP.Character then p.Parent=LP.Character end;return LP.Character and LP.Character:FindFirstChild("Punch") end

local KEY_URL = "https://pastebin.com/raw/n7UWskEA"
local function getKeys()
    local ok,res = pcall(function() return game:HttpGet(KEY_URL) end)
    if not ok then return {"SCPONTOP"} end
    local k = {}
    for v in res:gmatch("[^\n]+") do
        local t = v:match("^%s*(.-)%s*$")
        if t ~= "" then table.insert(k,t) end
    end
    return k
end

local Window = Rayfield:CreateWindow({
    Name = "⚡ SCP HUB | Muscle Legends",
    Icon = 0,
    LoadingTitle = "⚡ SCP HUB",
    LoadingSubtitle = "🔥 Public V5 | Made by TEJAZ",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = { Enabled = false },
    KeySystem = true,
    KeySettings = {
        Title = "⚡ SCP HUB",
        Subtitle = "🔑 Key System | Muscle Legends",
        Note = "Get FREE key at discord.gg/nDSy4jdVDc",
        FileName = "SCPHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = getKeys()
    }
})

-- INFO
local InfoTab = Window:CreateTab("📋 Info", 4483362458)
InfoTab:CreateSection("⚡ Welcome")
InfoTab:CreateParagraph({Title="👑 SCP HUB V5",Content="Made by TEJAZ\ndiscord.gg/nDSy4jdVDc\n🔥 100% Free | All features unlocked"})
InfoTab:CreateButton({Name="💬 Copy Discord",Callback=function() setclipboard("https://discord.gg/nDSy4jdVDc");Rayfield:Notify({Title="SCP HUB",Content="✅ Discord copied!",Duration=3}) end})

-- STATS
local StatsTab = Window:CreateTab("📊 Stats", 4483362458)
StatsTab:CreateSection("⏱️ Session")
local ss=os.time()
local TL=StatsTab:CreateLabel("⏱️ 0d 0h 0m 0s")
task.spawn(function() while task.wait(1) do local e=os.time()-ss;TL:Set("⏱️ "..math.floor(e/86400).."d "..math.floor(e%86400/3600).."h "..math.floor(e%3600/60).."m "..e%60 .."s") end end)
StatsTab:CreateSection("📈 Stats Gained")
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
local SL=StatsTab:CreateLabel("💪 Str: —")
local DL=StatsTab:CreateLabel("🛡️ Dur: —")
local RL=StatsTab:CreateLabel("🔄 Rebs: —")
local KL=StatsTab:CreateLabel("⚔️ Kills: —")
local EL=StatsTab:CreateLabel("😈 Evil: —")
local GL=StatsTab:CreateLabel("😇 Good: —")
task.spawn(function() while task.wait(0.5) do pcall(function()
    SL:Set("💪 Str: "..fmt(strS.Value).." | +"..fmt(strS.Value-iStr))
    DL:Set("🛡️ Dur: "..fmt(durS.Value).." | +"..fmt(durS.Value-iDur))
    RL:Set("🔄 Rebs: "..fmt(rebS.Value).." | +"..fmt(rebS.Value-iReb))
    KL:Set("⚔️ Kills: "..fmt(killS.Value).." | +"..fmt(killS.Value-iKill))
    EL:Set("😈 Evil: "..fmt(evilS.Value))
    GL:Set("😇 Good: "..fmt(goodS.Value))
end) end end)
StatsTab:CreateSection("📉 Rate /hr")
local RSL=StatsTab:CreateLabel("💪 Str/hr: ...")
local RDL=StatsTab:CreateLabel("🛡️ Dur/hr: ...")
local sH,dH={},{}
task.spawn(function() while task.wait(0.5) do pcall(function()
    local n=tick();table.insert(sH,{t=n,v=strS.Value});table.insert(dH,{t=n,v=durS.Value})
    while #sH>0 and n-sH[1].t>10 do table.remove(sH,1) end
    while #dH>0 and n-dH[1].t>10 do table.remove(dH,1) end
    if #sH>=2 then RSL:Set("💪 Str/hr: "..fmt(math.floor((sH[#sH].v-sH[1].v)/10*3600))) end
    if #dH>=2 then RDL:Set("🛡️ Dur/hr: "..fmt(math.floor((dH[#dH].v-dH[1].v)/10*3600))) end
end) end end)
StatsTab:CreateSection("🔍 Spy Player")
local spyT=LP
local SPN=StatsTab:CreateLabel("Player: "..LP.Name)
local SPS=StatsTab:CreateLabel("Stats: —")
StatsTab:CreateInput({Name="Search Player",PlaceholderText="Name...",RemoveTextAfterFocusLost=false,Callback=function(v) local p=findPlayer(v);if p then spyT=p;SPN:Set("Player: "..p.Name) end end})
task.spawn(function() while task.wait(1) do pcall(function()
    if not spyT then return end
    local tls=spyT:FindFirstChild("leaderstats")
    local s1=tls and tls:FindFirstChild("Strength") and fmt(tls.Strength.Value) or "—"
    local s2=spyT:FindFirstChild("Durability") and fmt(spyT.Durability.Value) or "—"
    local s3=tls and tls:FindFirstChild("Rebirths") and fmt(tls.Rebirths.Value) or "—"
    local s4=tls and tls:FindFirstChild("Kills") and fmt(tls.Kills.Value) or "—"
    SPS:Set("💪"..s1.." 🛡️"..s2.." 🔄"..s3.." ⚔️"..s4)
end) end end)

-- MAIN
local MainTab=Window:CreateTab("💪 Main", 4483362458)
MainTab:CreateSection("👊 Punch")
MainTab:CreateToggle({Name="👊 Auto Punch",CurrentValue=false,Flag="AP",Callback=function(v) _G.ap=v;if v then task.spawn(function() while _G.ap do local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"));if p then if p.Parent~=LP.Character then p.Parent=LP.Character end;p:Activate() end;task.wait() end end) end end})
MainTab:CreateToggle({Name="⚡ Fast Punch",CurrentValue=false,Flag="FP",Callback=function(v) local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"));if p and p:FindFirstChild("attackTime")then p.attackTime.Value=v and 0 or 0.35 end end})
MainTab:CreateSection("🌴 Jungle Farm")
for _,m in ipairs({{"🌴 Jungle Bench","Jungle Bench",CFrame.new(-8629.88,64.88,1855.03)},{"🏋️ Bar Lift","Jungle Bar Lift",CFrame.new(-8678.06,14.50,2089.26)},{"🦵 Squat","Jungle Squat",CFrame.new(-8374.26,34.59,2932.45)}}) do
    local gk="jM_"..m[2]:gsub(" ","")
    MainTab:CreateToggle({Name=m[1],CurrentValue=false,Flag=gk,Callback=function(v) getgenv()[gk]=v;if v then task.spawn(function() while getgenv()[gk] do if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character:SetPrimaryPartCFrame(m[3]);pcall(function() RS.rEvents.machineInteractRemote:InvokeServer("useMachine",workspace.machinesFolder[m[2]].interactSeat) end) end;task.wait(0.1) end end) end end})
end
MainTab:CreateSection("🎒 Auto Equip")
for _,tn in ipairs({"Weight","Pushups","Situps","Handstand"}) do
    MainTab:CreateToggle({Name="⚙️ "..tn,CurrentValue=false,Flag="eq"..tn,Callback=function(v) getgenv()["eq"..tn]=v;if v then task.spawn(function() while getgenv()["eq"..tn] do local w=LP.Backpack:FindFirstChild(tn);if w and LP.Character then w.Parent=LP.Character end;task.wait(0.1) end end) end end})
end
MainTab:CreateSection("⚡ Auto Lift")
MainTab:CreateToggle({Name="⚡ Auto Lift",CurrentValue=false,Flag="AL",Callback=function(v) getgenv().aL=v;if v then task.spawn(function() while getgenv().aL do pcall(function() local pu=LP.Backpack:FindFirstChild("Pushup")or LP.Backpack:FindFirstChild("Pushups");if pu and LP.Character then pu.Parent=LP.Character end;LP.muscleEvent:FireServer("rep") end);task.wait(0.1) end end) end end})

-- REBIRTH
local RebTab=Window:CreateTab("🔄 Rebirth", 4483362458)
RebTab:CreateSection("👑 Auto King")
RebTab:CreateToggle({Name="👑 Auto King",CurrentValue=false,Flag="AK",Callback=function(v) local kCF=CFrame.new(-8865,430,-5749);if v then if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=kCF end;getgenv().kL=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=kCF end end) elseif getgenv().kL then getgenv().kL:Disconnect();getgenv().kL=nil end end})
RebTab:CreateSection("🔄 Auto Rebirth")
local tReb=nil
RebTab:CreateInput({Name="Target Amount",PlaceholderText="Optional...",RemoveTextAfterFocusLost=false,Callback=function(v) tReb=tonumber(v) end})
RebTab:CreateToggle({Name="🔄 Auto Rebirth",CurrentValue=false,Flag="AReb",Callback=function(v) getgenv().aReb=v;if v then coroutine.wrap(function() while getgenv().aReb do local r=ls and ls:FindFirstChild("Rebirths");if r and tReb and r.Value>=tReb then getgenv().aReb=false;Rayfield:Notify({Title="SCP",Content="✅ Done!",Duration=4});break end;pcall(function() RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest") end);task.wait(0.1) end end)() end end})
RebTab:CreateSection("⚙️ Helpers")
RebTab:CreateToggle({Name="⚖️ Auto Weight Rep",CurrentValue=false,Flag="AWR",Callback=function(v) getgenv().aWR=v;if v then task.spawn(function() while getgenv().aWR do pcall(function() local w=LP.Backpack:FindFirstChild("Weight");if w and LP.Character then LP.Character.Humanoid:EquipTool(w) end;LP.muscleEvent:FireServer("rep") end);task.wait(0.01) end end) end end})
RebTab:CreateToggle({Name="📐 Auto Size 2",CurrentValue=false,Flag="AS2",Callback=function(v) getgenv().aS2=v;if v then task.spawn(function() while getgenv().aS2 do pcall(function() RS.rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",2) end);task.wait(0) end end) end end})
RebTab:CreateToggle({Name="🙈 Hide Frames",CurrentValue=false,Flag="HF",Callback=function(v) for _,f in pairs(RS:GetChildren())do if f.Name:match("Frame$")then f.Visible=not v end end end})
RebTab:CreateToggle({Name="📍 Lock Position",CurrentValue=false,Flag="LP2",Callback=function(v) if v then local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if hrp then local pos=hrp.CFrame;getgenv().pL=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=pos end end) end elseif getgenv().pL then getgenv().pL:Disconnect();getgenv().pL=nil end end})

-- KILLS
local KillTab=Window:CreateTab("⚔️ Kills", 4483362458)
KillTab:CreateSection("🛡️ Defense")
KillTab:CreateToggle({Name="🛡️ Anti Knockback",CurrentValue=false,Flag="AKB",Callback=function(v) local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if v and hrp then local bv=Instance.new("BodyVelocity",hrp);bv.MaxForce=Vector3.new(1e5,0,1e5);bv.Velocity=Vector3.new(0,0,0);bv.P=1250 elseif not v and hrp then local bv=hrp:FindFirstChild("BodyVelocity");if bv then bv:Destroy() end end end})
KillTab:CreateSection("☠️ Kill")
local killM="Teleport"
KillTab:CreateButton({Name="🔄 Method: Teleport (tap to switch)",Callback=function() killM=killM=="Teleport" and "Non-Teleport" or "Teleport";Rayfield:Notify({Title="SCP",Content="Method: "..killM,Duration=3}) end})
local wl={}
KillTab:CreateInput({Name="Whitelist Player",PlaceholderText="Name...",RemoveTextAfterFocusLost=false,Callback=function(v) if table.find(wl,v)then for i,n in ipairs(wl)do if n==v then table.remove(wl,i);break end end;Rayfield:Notify({Title="SCP",Content="Removed: "..v,Duration=2}) else table.insert(wl,v);Rayfield:Notify({Title="SCP",Content="Whitelisted: "..v,Duration=2}) end end})
local function doKill(t) if not t or t==LP then return end;local hrp=t.Character and t.Character:FindFirstChild("HumanoidRootPart");local p=getPunch();if not p or not hrp then return end;if killM=="Teleport" and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then hrp.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-3) end;p:Activate();local rh=LP.Character:FindFirstChild("RightHand");local lh=LP.Character:FindFirstChild("LeftHand");if rh and lh then firetouchinterest(rh,hrp,1);firetouchinterest(lh,hrp,1);firetouchinterest(rh,hrp,0);firetouchinterest(lh,hrp,0) end;local me=LP:FindFirstChild("muscleEvent");if me then me:FireServer("punch","rightHand");me:FireServer("punch","leftHand") end end
KillTab:CreateToggle({Name="☠️ Kill All",CurrentValue=false,Flag="KA",Callback=function(v) getgenv().kA=v;if v then task.spawn(function() while getgenv().kA do for _,p in ipairs(Players:GetPlayers())do if p~=LP and not table.find(wl,p.Name)then pcall(function() doKill(p) end) end end;task.wait() end end) end end})
local kTgt=""
KillTab:CreateInput({Name="Kill Specific",PlaceholderText="Name...",RemoveTextAfterFocusLost=false,Callback=function(v) kTgt=v end})
KillTab:CreateToggle({Name="🎯 Auto Kill Specific",CurrentValue=false,Flag="KO",Callback=function(v) getgenv().kO=v;if v then task.spawn(function() while getgenv().kO do local p=findPlayer(kTgt);if p and not table.find(wl,p.Name)then pcall(function() doKill(p) end) end;task.wait() end end) end end})
KillTab:CreateToggle({Name="⚡ Fast Punch",CurrentValue=false,Flag="KFP",Callback=function(v) local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"));if p and p:FindFirstChild("attackTime")then p.attackTime.Value=v and 0 or 0.35 end end})
local scN=""
KillTab:CreateInput({Name="Spy Cam Target",PlaceholderText="Name...",RemoveTextAfterFocusLost=false,Callback=function(v) scN=v end})
KillTab:CreateToggle({Name="📹 Spy Camera",CurrentValue=false,Flag="SC",Callback=function(v) if v then getgenv().sc=true;task.spawn(function() while getgenv().sc do local p=findPlayer(scN);if p and p.Character and p.Character:FindFirstChild("Humanoid")then workspace.CurrentCamera.CameraSubject=p.Character.Humanoid end;task.wait(0.25) end end) else getgenv().sc=false;if LP.Character and LP.Character:FindFirstChild("Humanoid")then workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid end end end})

-- ROCKS
local RocksTab=Window:CreateTab("🪨 Rocks", 4483362458)
RocksTab:CreateSection("Setup")
RocksTab:CreateToggle({Name="👊 Auto Punch",CurrentValue=false,Flag="RP",Callback=function(v) _G.ap=v;if v then task.spawn(function() while _G.ap do local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"));if p then if p.Parent~=LP.Character then p.Parent=LP.Character end;p:Activate() end;task.wait() end end) end end})
RocksTab:CreateToggle({Name="⚡ Fast Punch",CurrentValue=false,Flag="RFP",Callback=function(v) local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"));if p and p:FindFirstChild("attackTime")then p.attackTime.Value=v and 0 or 0.3 end end})
RocksTab:CreateToggle({Name="🙈 Hide Frames",CurrentValue=false,Flag="RHF",Callback=function(v) for _,f in pairs(RS:GetChildren())do if f.Name:match("Frame$")then f.Visible=not v end end end})
RocksTab:CreateToggle({Name="📍 Lock Position",CurrentValue=false,Flag="RLP",Callback=function(v) if v then local pos=LP.Character.HumanoidRootPart.CFrame;getgenv().pL2=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=pos end end) elseif getgenv().pL2 then getgenv().pL2:Disconnect();getgenv().pL2=nil end end})
RocksTab:CreateSection("🪨 Rock Farm")
local function eqP() local p=LP.Backpack:FindFirstChild("Punch");if p then p.Parent=LP.Character end end
for _,rd in ipairs({{"🌴 Jungle Rock",10000000},{"👑 Muscle King",5000000},{"⚡ Legnds",1000000},{"🪨 Large",1000000},{"🔥 Inferno",750000},{"🔮 Mystic",400000},{"❄️ Froze",150000},{"🥇 Golden",5000},{"👊 Punch",10},{"🪨 Tiny",0}}) do
    local rN,rD=rd[1],rd[2]
    RocksTab:CreateToggle({Name=rN.." ("..fmt(rD)..")",CurrentValue=false,Flag="R"..rN,Callback=function(v)
        _G.rfA=v
        if v then getgenv().autoFarm=true;Rayfield:Notify({Title="SCP",Content="🪨 "..rN,Duration=3})
            coroutine.wrap(function() while _G.rfA do
                if LP.Character then eqP();local mf=workspace:FindFirstChild("machinesFolder");if mf then for _,v2 in pairs(mf:GetDescendants())do if v2.Name=="neededDurability" and v2.Value==rD then local rh=LP.Character:FindFirstChild("RightHand");local lh=LP.Character:FindFirstChild("LeftHand");if rh and lh then firetouchinterest(v2.Parent.Rock,rh,0);firetouchinterest(v2.Parent.Rock,rh,1);firetouchinterest(v2.Parent.Rock,lh,0);firetouchinterest(v2.Parent.Rock,lh,1) end end end end;pcall(function() LP.muscleEvent:FireServer("punch","rightHand");LP.muscleEvent:FireServer("punch","leftHand") end);local pu=LP.Character:FindFirstChild("Punch");if pu then pu:Activate() end end;task.wait(0.05)
            end end)()
        else getgenv().autoFarm=false end
    end})
end

-- TELEPORT
local TeleTab=Window:CreateTab("🌀 Tele", 4483362458)
TeleTab:CreateSection("🌀 Locations")
for _,loc in ipairs({{"🏖️ Beach",Vector3.new(0,0,0)},{"❄️ Frost Gym",Vector3.new(-2650,7,-393)},{"🔮 Mythical Gym",Vector3.new(2255,7,1071)},{"♾️ Eternal Gym",Vector3.new(-6768,7,-1287)},{"⚡ Legend Gym",Vector3.new(4429,991,-3880)},{"👑 Muscle King",Vector3.new(-8799,17,-5798)},{"🌴 Jungle Gym",Vector3.new(-7894,6,2386)},{"🏋️ Tiny Gym",Vector3.new(50,7,1918)},{"🔥 Lava Brawl",Vector3.new(4471,119,-8836)},{"🏜️ Desert Brawl",Vector3.new(960,17,-7398)},{"🤫 Secret",Vector3.new(1947,2,6191)}}) do
    TeleTab:CreateButton({Name=loc[1],Callback=function() local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if hrp then hrp.CFrame=CFrame.new(loc[2]);Rayfield:Notify({Title="SCP",Content="🌀 "..loc[1],Duration=2}) end end})
end
TeleTab:CreateSection("🥚 Pets & Auras")
local sP="Neon Guardian"
TeleTab:CreateInput({Name="Pet Name",PlaceholderText="Neon Guardian...",RemoveTextAfterFocusLost=false,Callback=function(v) sP=v end})
TeleTab:CreateToggle({Name="🥚 Auto Open Pet",CurrentValue=false,Flag="APet",Callback=function(v) getgenv().aPet=v;if v then task.spawn(function() while getgenv().aPet do pcall(function() local f=RS.cPetShopFolder:FindFirstChild(sP);if f then RS.cPetShopRemote:InvokeServer(f) end end);task.wait(1) end end) end end})
local sA="Blue Aura"
TeleTab:CreateInput({Name="Aura Name",PlaceholderText="Blue Aura...",RemoveTextAfterFocusLost=false,Callback=function(v) sA=v end})
TeleTab:CreateToggle({Name="🌀 Auto Open Aura",CurrentValue=false,Flag="AAura",Callback=function(v) getgenv().aAura=v;if v then task.spawn(function() while getgenv().aAura do pcall(function() local f=RS.cPetShopFolder:FindFirstChild(sA);if f then RS.cPetShopRemote:InvokeServer(f) end end);task.wait(1) end end) end end})
TeleTab:CreateSection("🎡 Wheel")
TeleTab:CreateToggle({Name="🎡 Auto Spin Wheel",CurrentValue=false,Flag="ASpin",Callback=function(v) getgenv().aSpin=v;if v then task.spawn(function() while getgenv().aSpin do pcall(function() RS.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel",RS.fortuneWheelChances["Fortune Wheel"]) end);task.wait(1) end end) end end})

-- SETTINGS
local SetTab=Window:CreateTab("⚙️ Settings", 4483362458)
SetTab:CreateSection("🖥️ Graphics")
SetTab:CreateToggle({Name="🖥️ Low Graphics",CurrentValue=false,Flag="LG",Callback=function(v) game.Lighting.GlobalShadows=not v;game.Lighting.FogEnd=v and 9e9 or 1e5;game.Lighting.Brightness=v and 0 or 2;settings().Rendering.QualityLevel=v and"Level01"or"Level21";if v then for _,f in pairs(game:GetDescendants())do pcall(function() if f:IsA("ParticleEmitter")or f:IsA("Trail")then f.Lifetime=NumberRange.new(0) end end) end end end})
SetTab:CreateDropdown({Name="Quality",Options={"Low","Medium","High"},CurrentOption={"Low"},Flag="GQ",MultipleOptions=false,Callback=function(v) local m={Low="Level01",Medium="Level10",High="Level21"};settings().Rendering.QualityLevel=m[v] end})
SetTab:CreateSection("🌅 Time")
SetTab:CreateDropdown({Name="Time of Day",Options={"🌙 Night","☀️ Day","🌅 Sunset","🌌 Aurora"},CurrentOption={"☀️ Day"},Flag="TD",MultipleOptions=false,Callback=function(v) local t={["🌙 Night"]={0,1,Color3.fromRGB(40,40,40)},["☀️ Day"]={12,2,Color3.fromRGB(255,255,255)},["🌅 Sunset"]={18,1,Color3.fromRGB(255,170,0)},["🌌 Aurora"]={20,0.9,Color3.fromRGB(0,255,120)}};local d=t[v];if d then game.Lighting.ClockTime=d[1];game.Lighting.Brightness=d[2];game.Lighting.Ambient=d[3] end end})
SetTab:CreateSection("🎮 Misc")
SetTab:CreateButton({Name="🎮 Free AutoLift Gamepass",Callback=function() pcall(function() for _,v in pairs(RS.gamepassIds:GetChildren())do local val=Instance.new("IntValue");val.Name=v.Name;val.Value=v.Value;val.Parent=LP.ownedGamepasses end end);Rayfield:Notify({Title="SCP",Content="🎮 Done!",Duration=3}) end})
SetTab:CreateButton({Name="🚫 Remove Ad Portals",Callback=function() local c=0;for _,v in pairs(game:GetDescendants())do if v.Name=="RobloxForwardPortals"then v:Destroy();c=c+1 end end;if _G.AdC then _G.AdC:Disconnect() end;_G.AdC=game.DescendantAdded:Connect(function(v) if v.Name=="RobloxForwardPortals"then v:Destroy() end end);Rayfield:Notify({Title="SCP",Content="🚫 "..c.." removed!",Duration=3}) end})
SetTab:CreateToggle({Name="🌊 Walk on Water",CurrentValue=false,Flag="WW",Callback=function(v) if v then local sz=2048;local ct=math.ceil(50000/sz);for x=-ct,ct do for z=-ct,ct do local p=Instance.new("Part");p.Size=Vector3.new(sz,1,sz);p.Position=Vector3.new(x*sz,-9.5,z*sz);p.Anchored=true;p.Transparency=1;p.CanCollide=true;p.Parent=workspace end end end end})
SetTab:CreateButton({Name="🛡️ Anti AFK v1",Callback=function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end);Rayfield:Notify({Title="SCP",Content="🛡️ ON!",Duration=3}) end})
SetTab:CreateButton({Name="🛡️ Anti AFK v2",Callback=function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/New%20anti%20afk%20v2"))() end);Rayfield:Notify({Title="SCP",Content="🛡️ v2 ON!",Duration=3}) end})

-- GIFT
local GiftTab=Window:CreateTab("🎁 Gift", 4483362458)
GiftTab:CreateSection("🎁 Gift Items")
GiftTab:CreateParagraph({Title="⚠️ Important",Content="Stand on a machine while gifting!"})
local eC=GiftTab:CreateLabel("🥚 Eggs: 0")
local sC=GiftTab:CreateLabel("🥤 Shakes: 0")
local function refInv() local cf=LP:FindFirstChild("consumablesFolder");local e,s=0,0;if cf then for _,i in ipairs(cf:GetChildren())do if i.Name=="Protein Egg"then e=e+1 elseif i.Name=="Tropical Shake"then s=s+1 end end end;eC:Set("🥚 Eggs: "..e);sC:Set("🥤 Shakes: "..s) end
task.spawn(function() while task.wait(5) do refInv() end end);refInv()
GiftTab:CreateButton({Name="🔄 Refresh",Callback=function() refInv() end})
GiftTab:CreateSection("🥚 Egg Gifter")
local eT,eA=nil,0
GiftTab:CreateInput({Name="Target",PlaceholderText="Name...",RemoveTextAfterFocusLost=false,Callback=function(v) local p=Players:FindFirstChild(v)or findPlayer(v);if p then eT=p;Rayfield:Notify({Title="SCP",Content="Target: "..p.Name,Duration=2}) end end})
GiftTab:CreateInput({Name="Amount",PlaceholderText="Number...",RemoveTextAfterFocusLost=false,Callback=function(v) eA=tonumber(v)or 0 end})
GiftTab:CreateButton({Name="🥚 Gift Eggs",Callback=function() if not eT then Rayfield:Notify({Title="SCP",Content="❌ No target!",Duration=3});return end;task.spawn(function() local n=0;local cf=LP:FindFirstChild("consumablesFolder");if cf then for i=1,eA do local egg=cf:FindFirstChild("Protein Egg");if egg then pcall(function() RS.rEvents.giftRemote:InvokeServer(eT,egg) end);n=n+1 end;task.wait(0.5) end end;Rayfield:Notify({Title="SCP",Content="✅ "..n.." Eggs → "..eT.Name,Duration=4});refInv() end) end})
GiftTab:CreateSection("🥤 Shake Gifter")
local sT2,sA2=nil,0
GiftTab:CreateInput({Name="Target",PlaceholderText="Name...",RemoveTextAfterFocusLost=false,Callback=function(v) local p=Players:FindFirstChild(v)or findPlayer(v);if p then sT2=p;Rayfield:Notify({Title="SCP",Content="Target: "..p.Name,Duration=2}) end end})
GiftTab:CreateInput({Name="Amount",PlaceholderText="Number...",RemoveTextAfterFocusLost=false,Callback=function(v) sA2=tonumber(v)or 0 end})
GiftTab:CreateButton({Name="🥤 Gift Shakes",Callback=function() if not sT2 then Rayfield:Notify({Title="SCP",Content="❌ No target!",Duration=3});return end;task.spawn(function() local n=0;local cf=LP:FindFirstChild("consumablesFolder");if cf then for i=1,sA2 do local sh=cf:FindFirstChild("Tropical Shake");if sh then pcall(function() RS.rEvents.giftRemote:InvokeServer(sT2,sh) end);n=n+1 end;task.wait(0.5) end end;Rayfield:Notify({Title="SCP",Content="✅ "..n.." Shakes → "..sT2.Name,Duration=4});refInv() end) end})

notify("SCP HUB","🔥 V5 Loaded! Made by TEJAZ 👑",5)
