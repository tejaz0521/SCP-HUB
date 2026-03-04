-- ⚡ SCP HUB | RACE CLICKER | Made by TEJAZ
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

local Players=game:GetService("Players"); local RS=game:GetService("ReplicatedStorage")
local UIS=game:GetService("UserInputService"); local VU=game:GetService("VirtualUser"); local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP and LP.Character
local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

local KEY_URL="https://pastebin.com/raw/n7UWskEA"
local function getKeys() local ok,res=pcall(function()return game:HttpGet(KEY_URL)end); if not ok then return{}end; local k={}; for v in res:gmatch("[^\n]+")do local t=v:match("^%s*(.-)%s*$"); if t~=""then table.insert(k,t)end end; return k end
local function checkKey(e) for _,v in pairs(getKeys())do if v==e then return true end end; return false end

-- KEY SYSTEM (required every execution)
local keyPassed=false
local kW,kF=library:AddWindow("🔑 SCP HUB — Key",{main_color=Color3.fromRGB(185,30,30),title_bar={Color3.fromRGB(185,30,30),Color3.fromRGB(100,10,10)},background={Color3.fromRGB(18,5,5)},background_transparency=0,min_size=Vector2.new(600,160),can_resize=false})
local kt,_=kW:AddTab("🔑  Key"); kt:AddLabel("⚡ SCP HUB | Race Clicker | Made by TEJAZ"); kt:AddLabel("🔑  Get key at: discord.gg/nDSy4jdVDc")
local stL=kt:AddLabel("📋  Paste key below then press Enter")
kt:AddTextBox("Paste key here...",function(v) if checkKey(v)then stL.Text="✅ Accepted!"; keyPassed=true else stL.Text="❌ Wrong key!" end end,{clear=true})
kt:AddButton("💬  Copy Discord",function() setclipboard("https://discord.gg/nDSy4jdVDc"); notify("SCP","✅ Copied!",3) end); kt:Show()
repeat task.wait(0.5) until keyPassed; kF:Destroy()

local WIN_CFG={main_color=Color3.fromRGB(185,30,30),title_bar={Color3.fromRGB(200,35,35),Color3.fromRGB(100,10,10)},background={Color3.fromRGB(18,5,5)},background_transparency=0,min_size=Vector2.new(600,260),toggle_key=Enum.KeyCode.RightShift,can_resize=true}
local win,winF=library:AddWindow("⚡ SCP HUB  |  Race Clicker  |  TEJAZ",WIN_CFG)
task.defer(function() injectSCPLogo(winF) end)

pcall(function() local b=winF and winF:FindFirstChild(chr(34)Bar"); if b then local t=b:FindFirstChild(chr(34)Toggle"); if t then t.Image=chr(34)rbxassetid://6031075931"; t.ImageColor3=Color3.fromRGB(255,80,80) end end end)
-- INFO TAB
local infoTab,_=win:AddTab("📋  Info")
infoTab:AddLabel("━━━━━━━  ⚡ SCP HUB | RACE CLICKER  ━━━━━━━")
infoTab:AddLabel("👑  Author: TEJAZ  |  💎  Version: 4.5")
infoTab:AddLabel("💬  Discord: discord.gg/nDSy4jdVDc  |  🔄 Toggle: RShift")
infoTab:AddButton("💬  Copy Discord",function() setclipboard("https://discord.gg/nDSy4jdVDc"); notify("SCP","✅ Copied!",3) end)

-- FARM TAB
local farmTab,_=win:AddTab("🏎️  Farm")
farmTab:AddLabel("━━━━━━━  🖱️ AUTO CLICK  ━━━━━━━")
local clickCount=0; local cLbl=farmTab:AddLabel("🖱️  Clicks this session: 0")
farmTab:AddSwitch("🖱️  Auto Click (normal)",function(v)
    getgenv().scpClick=v; if v then task.spawn(function() while getgenv().scpClick do
        local vp=workspace.CurrentCamera.ViewportSize; VU:Button1Down(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera); VU:Button1Up(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera)
        clickCount=clickCount+1; cLbl.Text="🖱️  Clicks: "..clickCount; task.wait(0.05)
    end end) end
end)
farmTab:AddSwitch("⚡  Fast Click (0.01s)",function(v)
    getgenv().scpFC=v; if v then task.spawn(function() while getgenv().scpFC do
        local vp=workspace.CurrentCamera.ViewportSize; VU:Button1Down(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera); VU:Button1Up(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera)
        clickCount=clickCount+1; cLbl.Text="🖱️  Clicks: "..clickCount; task.wait(0.01)
    end end) end
end)
farmTab:AddButton("🔄  Reset Click Count",function() clickCount=0; cLbl.Text="🖱️  Clicks: 0" end)
farmTab:AddLabel("━━━━━━━  🏁 AUTO RACE  ━━━━━━━")
farmTab:AddSwitch("🏁  Auto Race Start",function(v) getgenv().scpRace=v; if v then task.spawn(function() while getgenv().scpRace do pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and r.Name:lower():find("start")then r:FireServer()end end end); task.wait(2)end end)end end)
farmTab:AddSwitch("🏆  Auto Finish Race",function(v) getgenv().scpFin=v; if v then task.spawn(function() while getgenv().scpFin do pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and r.Name:lower():find("finish")then r:FireServer()end end end); task.wait(1)end end)end end)
farmTab:AddLabel("━━━━━━━  💰 AUTO EARN  ━━━━━━━")
farmTab:AddSwitch("🛒  Auto Buy Upgrades",function(v) getgenv().scpBuy=v; if v then task.spawn(function() while getgenv().scpBuy do pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and(r.Name:lower():find("upgrade")or r.Name:lower():find("buy"))then r:FireServer()end end end); task.wait(0.5)end end)end end)
farmTab:AddSwitch("🔄  Auto Prestige/Rebirth",function(v) getgenv().scpPres=v; if v then task.spawn(function() while getgenv().scpPres do pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and(r.Name:lower():find("prestige")or r.Name:lower():find("rebirth"))then r:FireServer()end end end); task.wait(3)end end)end end)

-- SPEED TAB
local spdTab,_=win:AddTab("⚡  Speed")
spdTab:AddLabel("━━━━━━━  🏃 MOVEMENT  ━━━━━━━")
spdTab:AddSwitch("⚡  Speed (100)",function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 100 or 16 end end)
spdTab:AddSwitch("🚀  Ultra Speed (250)",function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 250 or 16 end end)
spdTab:AddSwitch("🦘  High Jump",function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.JumpPower=v and 100 or 50 end end)
spdTab:AddSwitch("♾️  Infinite Jump",function(v) getgenv().scpIJ=v; if v then getgenv().scpIJC=UIS.JumpRequest:Connect(function() if getgenv().scpIJ and LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)end end) elseif getgenv().scpIJC then getgenv().scpIJC:Disconnect()end end)
spdTab:AddSwitch("🏎️  Max Vehicle Speed",function(v) getgenv().scpVeh=v; if v then task.spawn(function() while getgenv().scpVeh do for _,o in pairs(workspace:GetDescendants())do if o:IsA("VehicleSeat")then o.MaxSpeed=1000; o.Torque=1000 end end; task.wait(0.5)end end)end end)
spdTab:AddSwitch("🖥️  Low Graphics",function(v) game.Lighting.GlobalShadows=not v; settings().Rendering.QualityLevel=v and"Level01"or"Level21" end)
spdTab:AddButton("🛡️  Anti AFK",function() pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))()end); notify("SCP","🛡️ ON",3) end)
spdTab:AddButton("💬  Copy Discord",function() setclipboard("https://discord.gg/nDSy4jdVDc"); notify("SCP","✅ Copied!",3) end)

infoTab:Show()
notify("SCP HUB","🏎️ Race Clicker Loaded! RShift to toggle 👑",5)
