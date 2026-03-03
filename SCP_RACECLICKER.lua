-- ⚡ SCP HUB | RACE CLICKER | Made by TEJAZ
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()
local Players=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local UIS=game:GetService("UserInputService")
local VU=game:GetService("VirtualUser")
local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

local KEY_URL="https://pastebin.com/raw/n7UWskEA"
local function getKeys() local ok,res=pcall(function()return game:HttpGet(KEY_URL)end);if not ok then return{"SCPONTOP"}end;local k={};for v in res:gmatch("[^\n]+")do local t=v:match("^%s*(.-)%s*$");if t~=""then table.insert(k,t)end end;return k end
local function checkKey(e) for _,v in pairs(getKeys())do if v==e then return true end end;return false end

local keyPassed=false
if isfolder and isfolder("SCP_HUB") and isfile and isfile("SCP_HUB/key.txt") then
    local saved=readfile("SCP_HUB/key.txt"):match("^%s*(.-)%s*$")
    if checkKey(saved) then keyPassed=true end
end
if not keyPassed then
    notify("SCP HUB","🔑 Type key:YOURKEY in chat",10)
    local conn;conn=LP.Chatted:Connect(function(msg)
        if msg:sub(1,4):lower()=="key:" then
            local k=msg:sub(5):match("^%s*(.-)%s*$")
            if checkKey(k) then keyPassed=true;if makefolder then makefolder("SCP_HUB") end;if writefile then writefile("SCP_HUB/key.txt",k) end;notify("SCP","✅ Key accepted!",3)
            else notify("SCP","❌ Wrong key!",3) end
        end
    end)
    repeat task.wait(0.5) until keyPassed;conn:Disconnect()
end

local win, Window = library:AddWindow("⚡ SCP HUB | Race Clicker | Made by TEJAZ", {
    main_color = Color3.fromRGB(185,30,30),
    min_size = Vector2.new(400, 300),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- FARM TAB
local farmTab, _ = win:AddTab("🏎️ Farm")
local clickF, _ = farmTab:AddFolder("🖱️ Auto Click")
local clickCount=0
local cLbl=clickF:AddLabel("🖱️ Clicks: 0")
clickF:AddSwitch("🖱️ Auto Click", function(v)
    getgenv().autoClick=v;if v then task.spawn(function() while getgenv().autoClick do
        local vp=workspace.CurrentCamera.ViewportSize;VU:Button1Down(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera);VU:Button1Up(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera)
        clickCount=clickCount+1;cLbl.Text="🖱️ Clicks: "..clickCount;task.wait(0.05)
    end end) end
end)
clickF:AddSwitch("⚡ Fast Click", function(v)
    getgenv().fastClick=v;if v then task.spawn(function() while getgenv().fastClick do
        local vp=workspace.CurrentCamera.ViewportSize;VU:Button1Down(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera);VU:Button1Up(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera)
        clickCount=clickCount+1;cLbl.Text="🖱️ Clicks: "..clickCount;task.wait(0.01)
    end end) end
end)
clickF:AddButton("🔄 Reset Count", function() clickCount=0;cLbl.Text="🖱️ Clicks: 0" end)

local raceF, _ = farmTab:AddFolder("🏁 Auto Race")
raceF:AddSwitch("🏁 Auto Race Start", function(v)
    getgenv().autoRace=v;if v then task.spawn(function() while getgenv().autoRace do
        pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and r.Name:lower():find("start")then r:FireServer() end end end);task.wait(2)
    end end) end
end)
raceF:AddSwitch("🏆 Auto Finish", function(v)
    getgenv().autoFinish=v;if v then task.spawn(function() while getgenv().autoFinish do
        pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and r.Name:lower():find("finish")then r:FireServer() end end end);task.wait(1)
    end end) end
end)

-- SPEED TAB
local speedTab, _ = win:AddTab("⚡ Speed")
local spdF, _ = speedTab:AddFolder("🏃 Movement")
spdF:AddSwitch("⚡ Speed (100)", function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 100 or 16 end end)
spdF:AddSwitch("🚀 Ultra Speed (250)", function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 250 or 16 end end)
spdF:AddSwitch("🦘 High Jump", function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.JumpPower=v and 100 or 50 end end)
spdF:AddSwitch("♾️ Infinite Jump", function(v) getgenv().infJump=v;if v then getgenv().ijC=UIS.JumpRequest:Connect(function() if getgenv().infJump and LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) elseif getgenv().ijC then getgenv().ijC:Disconnect() end end)
spdF:AddSwitch("🏎️ Max Vehicle Speed", function(v)
    getgenv().maxVeh=v;if v then task.spawn(function() while getgenv().maxVeh do
        for _,obj in pairs(workspace:GetDescendants())do if obj:IsA("VehicleSeat")then obj.MaxSpeed=1000;obj.Torque=1000 end end;task.wait(0.5)
    end end) end
end)

-- MONEY TAB
local moneyTab, _ = win:AddTab("💰 Money")
local monF, _ = moneyTab:AddFolder("💰 Auto Earn")
monF:AddSwitch("🛒 Auto Buy Upgrades", function(v)
    getgenv().autoBuy=v;if v then task.spawn(function() while getgenv().autoBuy do
        pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and(r.Name:lower():find("upgrade")or r.Name:lower():find("buy"))then r:FireServer() end end end);task.wait(0.5)
    end end) end
end)
monF:AddSwitch("🔄 Auto Prestige", function(v)
    getgenv().autoPrestige=v;if v then task.spawn(function() while getgenv().autoPrestige do
        pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and(r.Name:lower():find("prestige")or r.Name:lower():find("rebirth"))then r:FireServer() end end end);task.wait(3)
    end end) end
end)

-- SETTINGS TAB
local setTab2, _ = win:AddTab("⚙️ Settings")
local setF2, _ = setTab2:AddFolder("⚙️ Settings")
setF2:AddSwitch("🖥️ Low Graphics", function(v) game.Lighting.GlobalShadows=not v;game.Lighting.FogEnd=v and 9e9 or 1e5;settings().Rendering.QualityLevel=v and"Level01"or"Level21" end)
setF2:AddButton("🛡️ Anti AFK", function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end);notify("SCP","🛡️ ON!",3) end)
setF2:AddButton("💬 Copy Discord", function() setclipboard("https://discord.gg/nDSy4jdVDc");notify("SCP","✅ Copied!",3) end)

farmTab:Show()
notify("SCP HUB","🏎️ Race Clicker Loaded! RShift to toggle",5)
