-- ⚡ SCP HUB | RIVALS | Made by TEJAZ
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()
local Players=game:GetService("Players")
local RunSvc=game:GetService("RunService")
local TS=game:GetService("TweenService")
local UIS=game:GetService("UserInputService")
local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end
local function findPlayer(q) if not q or q==""then return LP end;local l=q:lower();for _,p in ipairs(Players:GetPlayers())do if p.Name:lower()==l or p.DisplayName:lower()==l then return p end end;for _,p in ipairs(Players:GetPlayers())do if p.Name:lower():find(l,1,true)then return p end end end

local KEY_URL="https://pastebin.com/raw/n7UWskEA"
local function getKeys() local ok,res=pcall(function()return game:HttpGet(KEY_URL)end);if not ok then return{"SCPONTOP"}end;local k={};for v in res:gmatch("[^\n]+")do local t=v:match("^%s*(.-)%s*$");if t~=""then table.insert(k,t)end end;return k end
local function checkKey(e) for _,v in pairs(getKeys())do if v==e then return true end end;return false end

local keyPassed=false
if isfolder and isfolder("SCP_HUB") and isfile and isfile("SCP_HUB/key.txt") then
    local saved=readfile("SCP_HUB/key.txt"):match("^%s*(.-)%s*$")
    if checkKey(saved) then keyPassed=true end
end
if not keyPassed then
    notify("SCP HUB","🔑 Type key:YOURKEY in chat | discord.gg/nDSy4jdVDc",10)
    local conn;conn=LP.Chatted:Connect(function(msg)
        if msg:sub(1,4):lower()=="key:" then
            local k=msg:sub(5):match("^%s*(.-)%s*$")
            if checkKey(k) then keyPassed=true;if makefolder then makefolder("SCP_HUB") end;if writefile then writefile("SCP_HUB/key.txt",k) end;notify("SCP","✅ Key accepted!",3)
            else notify("SCP","❌ Wrong key!",3) end
        end
    end)
    repeat task.wait(0.5) until keyPassed;conn:Disconnect()
end

local win, Window = library:AddWindow("⚡ SCP HUB | Rivals | Made by TEJAZ", {
    main_color = Color3.fromRGB(185,30,30),
    min_size = Vector2.new(400, 300),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

-- AIMBOT TAB
local aimTab, _ = win:AddTab("🎯 Aimbot")
local aimbotOn=false;local fov=150;local aimPart="Head"
local aimF, _ = aimTab:AddFolder("🎯 Aimbot Settings")
local fovLbl=aimF:AddLabel("FOV: 150")
aimF:AddSwitch("🎯 Aimbot (Hold RMB)", function(v)
    aimbotOn=v
    if v then task.spawn(function() while aimbotOn do
        if UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local closest,closestDist=nil,fov;local cam=workspace.CurrentCamera
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP and p.Character and p.Character:FindFirstChild(aimPart) then
                    local part=p.Character[aimPart];local sp,onScreen=cam:WorldToScreenPoint(part.Position)
                    if onScreen then local mp=UIS:GetMouseLocation();local dist=(Vector2.new(sp.X,sp.Y)-mp).Magnitude;if dist<closestDist then closestDist=dist;closest=part end end
                end
            end
            if closest then local target=cam:WorldToScreenPoint(closest.Position);local mp=UIS:GetMouseLocation();local np=mp:Lerp(Vector2.new(target.X,target.Y),0.3);mousemoverel(np.X-mp.X,np.Y-mp.Y) end
        end;task.wait()
    end end) end
end)
aimF:AddSwitch("👻 Silent Aim", function(v) getgenv().silentAim=v end)
aimF:AddButton("➕ FOV +25", function() fov=math.min(fov+25,500);fovLbl.Text="FOV: "..fov end)
aimF:AddButton("➖ FOV -25", function() fov=math.max(fov-25,25);fovLbl.Text="FOV: "..fov end)
aimF:AddButton("🎯 Aim: Head", function() aimPart="Head";notify("SCP","Aim: Head",2) end)
aimF:AddButton("🎯 Aim: HRP", function() aimPart="HumanoidRootPart";notify("SCP","Aim: HRP",2) end)
aimF:AddButton("🎯 Aim: Torso", function() aimPart="UpperTorso";notify("SCP","Aim: Torso",2) end)

-- PLAYER TAB
local plrTab, _ = win:AddTab("👤 Player")
local moveF, _ = plrTab:AddFolder("🏃 Movement")
moveF:AddSwitch("⚡ Speed (100)", function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 100 or 16 end end)
moveF:AddSwitch("🚀 Ultra Speed (250)", function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 250 or 16 end end)
moveF:AddSwitch("🦘 High Jump", function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.JumpPower=v and 100 or 50 end end)
moveF:AddSwitch("♾️ Infinite Jump", function(v) getgenv().infJump=v;if v then getgenv().ijC=UIS.JumpRequest:Connect(function() if getgenv().infJump and LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) elseif getgenv().ijC then getgenv().ijC:Disconnect() end end)
moveF:AddSwitch("👻 Noclip", function(v) getgenv().noclip=v;if v then getgenv().ncC=RunSvc.Stepped:Connect(function() if getgenv().noclip and LP.Character then for _,p in pairs(LP.Character:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=false end end end end) elseif getgenv().ncC then getgenv().ncC:Disconnect() end end)
moveF:AddSwitch("🌀 Spin Anti-Aim", function(v) getgenv().spin=v;if v then task.spawn(function() while getgenv().spin do if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(10),0) end;task.wait(0.05) end end) end end)
moveF:AddSwitch("🌌 Low Gravity", function(v) workspace.Gravity=v and 50 or 196.2 end)

-- VISUALS TAB
local visTab, _ = win:AddTab("👁️ Visuals")
local espF, _ = visTab:AddFolder("👁️ ESP")
espF:AddSwitch("📦 Box ESP", function(v)
    getgenv().boxESP=v
    if v then task.spawn(function() while getgenv().boxESP do
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and not p.Character.HumanoidRootPart:FindFirstChild("SCPBox") then
                local box=Instance.new("BoxHandleAdornment");box.Name="SCPBox";box.Adornee=p.Character.HumanoidRootPart;box.Size=Vector3.new(4,6,2);box.Color3=Color3.fromRGB(220,45,45);box.Transparency=0.5;box.AlwaysOnTop=true;box.ZIndex=5;box.Parent=p.Character.HumanoidRootPart
            end
        end;task.wait(0.1)
    end end)
    else for _,p in ipairs(Players:GetPlayers())do if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then local b=p.Character.HumanoidRootPart:FindFirstChild("SCPBox");if b then b:Destroy() end end end end
end)
espF:AddSwitch("✨ Chams", function(v)
    getgenv().chams=v
    if v then task.spawn(function() while getgenv().chams do
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character and not p.Character:FindFirstChild("SCPChams") then
                local sel=Instance.new("SelectionBox");sel.Name="SCPChams";sel.Adornee=p.Character;sel.Color3=Color3.fromRGB(185,30,30);sel.SurfaceTransparency=0.7;sel.LineThickness=0.05;sel.Parent=p.Character
            end
        end;task.wait(0.1)
    end end)
    else for _,p in ipairs(Players:GetPlayers())do if p.Character then local c=p.Character:FindFirstChild("SCPChams");if c then c:Destroy() end end end end
end)
espF:AddSwitch("🏷️ Name + Health Tags", function(v)
    getgenv().nameTags=v
    if v then task.spawn(function() while getgenv().nameTags do
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and not p.Character.HumanoidRootPart:FindFirstChild("SCPTag") then
                local hrp=p.Character.HumanoidRootPart
                local bb=Instance.new("BillboardGui");bb.Name="SCPTag";bb.Adornee=hrp;bb.Size=UDim2.new(0,120,0,40);bb.StudsOffset=Vector3.new(0,3.5,0);bb.AlwaysOnTop=true;bb.Parent=hrp
                local tl=Instance.new("TextLabel",bb);tl.Size=UDim2.new(1,0,0.5,0);tl.BackgroundTransparency=1;tl.Text=p.Name;tl.TextColor3=Color3.new(1,1,1);tl.TextSize=13;tl.Font=Enum.Font.GothamBlack;tl.TextStrokeTransparency=0
                local hl=Instance.new("TextLabel",bb);hl.Size=UDim2.new(1,0,0.5,0);hl.Position=UDim2.new(0,0,0.5,0);hl.BackgroundTransparency=1
                local hum=p.Character:FindFirstChild("Humanoid");if hum then hl.Text="❤️ "..math.floor(hum.Health) end
                hl.TextColor3=Color3.fromRGB(0,210,80);hl.TextSize=10;hl.Font=Enum.Font.GothamBold;hl.TextStrokeTransparency=0
            end
        end;task.wait(0.25)
    end end)
    else for _,p in ipairs(Players:GetPlayers())do if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then local t2=p.Character.HumanoidRootPart:FindFirstChild("SCPTag");if t2 then t2:Destroy() end end end end
end)
espF:AddSwitch("🔆 Fullbright", function(v) game.Lighting.Brightness=v and 10 or 2;game.Lighting.GlobalShadows=not v end)

-- KILL TAB
local killTab2, _ = win:AddTab("⚔️ Kill")
local kF2, _ = killTab2:AddFolder("⚔️ Kill Players")
local wl2={}
kF2:AddTextBox("Whitelist player...", function(v) if table.find(wl2,v)then for i,n in ipairs(wl2)do if n==v then table.remove(wl2,i);break end end else table.insert(wl2,v) end;notify("SCP","Updated",2) end, {clear=true})
kF2:AddSwitch("☠️ Kill All", function(v)
    getgenv().kA=v;if v then task.spawn(function() while getgenv().kA do
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and not table.find(wl2,p.Name) and p.Character and p.Character:FindFirstChild("Humanoid")then
                pcall(function() p.Character.Humanoid.Health=0 end)
            end
        end;task.wait(0.5)
    end end) end
end)
local kTgt2=""
kF2:AddTextBox("Kill specific...", function(v) kTgt2=v end, {clear=false})
kF2:AddSwitch("🎯 Kill Specific", function(v)
    getgenv().kO=v;if v then task.spawn(function() while getgenv().kO do
        local p=findPlayer(kTgt2);if p and p~=LP and not table.find(wl2,p.Name) and p.Character and p.Character:FindFirstChild("Humanoid")then pcall(function() p.Character.Humanoid.Health=0 end) end;task.wait(0.5)
    end end) end
end)
local scN2=""
kF2:AddTextBox("Spy cam target...", function(v) scN2=v end, {clear=false})
kF2:AddSwitch("📹 Spy Camera", function(v)
    if v then getgenv().sc=true;task.spawn(function() while getgenv().sc do local p=findPlayer(scN2);if p and p.Character and p.Character:FindFirstChild("Humanoid")then workspace.CurrentCamera.CameraSubject=p.Character.Humanoid end;task.wait(0.25) end end)
    else getgenv().sc=false;if LP.Character and LP.Character:FindFirstChild("Humanoid")then workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid end end
end)

-- SETTINGS TAB
local setTab, _ = win:AddTab("⚙️ Settings")
local setF, _ = setTab:AddFolder("⚙️ Settings")
setF:AddSwitch("🖥️ Low Graphics", function(v) game.Lighting.GlobalShadows=not v;game.Lighting.FogEnd=v and 9e9 or 1e5;settings().Rendering.QualityLevel=v and"Level01"or"Level21" end)
setF:AddButton("🛡️ Anti AFK", function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end);notify("SCP","🛡️ ON!",3) end)
setF:AddButton("💬 Copy Discord", function() setclipboard("https://discord.gg/nDSy4jdVDc");notify("SCP","✅ Copied!",3) end)

aimTab:Show()
notify("SCP HUB","⚔️ Rivals Loaded! RShift to toggle",5)
