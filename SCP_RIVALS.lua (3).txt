-- SCP HUB | RIVALS | Made by TEJAZ
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RunSvc = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local SG = game:GetService("StarterGui")
local LP = Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

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
    Name = "⚡ SCP HUB | Rivals",
    Icon = 0,
    LoadingTitle = "⚡ SCP HUB",
    LoadingSubtitle = "⚔️ Rivals | Made by TEJAZ",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = { Enabled = false },
    KeySystem = true,
    KeySettings = {
        Title = "⚡ SCP HUB",
        Subtitle = "🔑 Key Required | Rivals",
        Note = "Key: SCPONTOP | discord.gg/nDSy4jdVDc",
        FileName = "SCPRivalsKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = getKeys()
    }
})

-- AIMBOT
local AimbotTab = Window:CreateTab("🎯 Aimbot", 4483362458)
AimbotTab:CreateSection("🎯 Aimbot Settings")

local aimbotOn = false
local silentAim = false
local fov = 150
local smoothness = 0.3
local aimPart = "Head"

local fovLabel = AimbotTab:CreateLabel("FOV: 150")
local function updateFOV(n) fov=n; fovLabel:Set("FOV: "..fov) end

AimbotTab:CreateToggle({Name="🎯 Aimbot (Hold Right Click)",CurrentValue=false,Flag="AB",Callback=function(v)
    aimbotOn=v
    if v then
        task.spawn(function()
            while aimbotOn do
                if UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                    local closest,closestDist=nil,fov
                    local cam=workspace.CurrentCamera
                    for _,p in ipairs(Players:GetPlayers()) do
                        if p~=LP and p.Character and p.Character:FindFirstChild(aimPart) then
                            local part=p.Character[aimPart]
                            local screenPos,onScreen=cam:WorldToScreenPoint(part.Position)
                            if onScreen then
                                local mousePos=UIS:GetMouseLocation()
                                local dist=((Vector2.new(screenPos.X,screenPos.Y))-mousePos).Magnitude
                                if dist<closestDist then closestDist=dist;closest=part end
                            end
                        end
                    end
                    if closest then
                        local target=cam:WorldToScreenPoint(closest.Position)
                        local mousePos=UIS:GetMouseLocation()
                        local newPos=mousePos:Lerp(Vector2.new(target.X,target.Y),smoothness)
                        mousemoverel(newPos.X-mousePos.X,newPos.Y-mousePos.Y)
                    end
                end
                task.wait()
            end
        end)
    end
end})

AimbotTab:CreateToggle({Name="👻 Silent Aim",CurrentValue=false,Flag="SA",Callback=function(v)
    silentAim=v; getgenv().silentAim=v
end})

AimbotTab:CreateButton({Name="➕ Increase FOV (+50)",Callback=function() updateFOV(math.min(fov+50,500)) end})
AimbotTab:CreateButton({Name="➖ Decrease FOV (-50)",Callback=function() updateFOV(math.max(fov-50,50)) end})
AimbotTab:CreateDropdown({Name="Aim Part",Options={"Head","HumanoidRootPart"},CurrentOption={"Head"},Flag="AimP",MultipleOptions=false,Callback=function(v) aimPart=v end})

-- PLAYER
local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
PlayerTab:CreateSection("🏃 Movement")
PlayerTab:CreateToggle({Name="⚡ Speed Hack (100)",CurrentValue=false,Flag="SPH",Callback=function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 100 or 16 end end})
PlayerTab:CreateToggle({Name="🦘 High Jump (100)",CurrentValue=false,Flag="HJ",Callback=function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.JumpPower=v and 100 or 50 end end})
PlayerTab:CreateToggle({Name="♾️ Infinite Jump",CurrentValue=false,Flag="IJ",Callback=function(v)
    getgenv().infJump=v
    if v then
        getgenv().ijConn=UIS.JumpRequest:Connect(function()
            if getgenv().infJump and LP.Character and LP.Character:FindFirstChild("Humanoid") then
                LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    elseif getgenv().ijConn then getgenv().ijConn:Disconnect() end
end})
PlayerTab:CreateToggle({Name="👻 Noclip",CurrentValue=false,Flag="NC",Callback=function(v)
    getgenv().noclip=v
    if v then
        getgenv().ncConn=RunSvc.Stepped:Connect(function()
            if getgenv().noclip and LP.Character then
                for _,p in pairs(LP.Character:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide=false end
                end
            end
        end)
    elseif getgenv().ncConn then getgenv().ncConn:Disconnect() end
end})
PlayerTab:CreateToggle({Name="🌀 Spin (Anti Aim)",CurrentValue=false,Flag="Spin",Callback=function(v)
    getgenv().spin=v
    if v then task.spawn(function() while getgenv().spin do
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(10),0)
        end; task.wait(0.05)
    end end) end
end})

-- VISUALS
local VisTab = Window:CreateTab("👁️ Visuals", 4483362458)
VisTab:CreateSection("👁️ ESP")
VisTab:CreateToggle({Name="📦 Box ESP",CurrentValue=false,Flag="BoxESP",Callback=function(v)
    getgenv().boxESP=v
    if v then task.spawn(function() while getgenv().boxESP do
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp=p.Character.HumanoidRootPart
                if not hrp:FindFirstChild("SCPBox") then
                    local box=Instance.new("BoxHandleAdornment")
                    box.Name="SCPBox"; box.Adornee=hrp; box.Size=Vector3.new(4,6,2)
                    box.Color3=Color3.fromRGB(255,0,0); box.Transparency=0.5
                    box.AlwaysOnTop=true; box.ZIndex=5; box.Parent=hrp
                end
            end
        end; task.wait(0.1)
    end end)
    else for _,p in ipairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then local b=p.Character.HumanoidRootPart:FindFirstChild("SCPBox");if b then b:Destroy() end end end end
end})
VisTab:CreateToggle({Name="✨ Player Chams",CurrentValue=false,Flag="Chams",Callback=function(v)
    getgenv().chams=v
    if v then task.spawn(function() while getgenv().chams do
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character then
                if not p.Character:FindFirstChild("SCPChams") then
                    local sel=Instance.new("SelectionBox")
                    sel.Name="SCPChams"; sel.Adornee=p.Character
                    sel.Color3=Color3.fromRGB(0,100,255); sel.SurfaceTransparency=0.7
                    sel.LineThickness=0.05; sel.Parent=p.Character
                end
            end
        end; task.wait(0.1)
    end end)
    else for _,p in ipairs(Players:GetPlayers()) do if p.Character then local c=p.Character:FindFirstChild("SCPChams");if c then c:Destroy() end end end end
end})
VisTab:CreateToggle({Name="🏷️ Name Tags",CurrentValue=false,Flag="Names",Callback=function(v)
    getgenv().nameTags=v
    if v then task.spawn(function() while getgenv().nameTags do
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp=p.Character.HumanoidRootPart
                if not hrp:FindFirstChild("SCPTag") then
                    local bb=Instance.new("BillboardGui")
                    bb.Name="SCPTag"; bb.Adornee=hrp; bb.Size=UDim2.new(0,100,0,40)
                    bb.StudsOffset=Vector3.new(0,3,0); bb.AlwaysOnTop=true; bb.Parent=hrp
                    local tl=Instance.new("TextLabel",bb); tl.Size=UDim2.new(1,0,1,0)
                    tl.BackgroundTransparency=1; tl.Text=p.Name; tl.TextColor3=Color3.fromRGB(255,50,50)
                    tl.TextSize=14; tl.Font=Enum.Font.GothamBlack; tl.TextStrokeTransparency=0
                end
            end
        end; task.wait(0.1)
    end end)
    else for _,p in ipairs(Players:GetPlayers()) do if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then local t=p.Character.HumanoidRootPart:FindFirstChild("SCPTag");if t then t:Destroy() end end end end
end})

-- SETTINGS
local SetTab = Window:CreateTab("⚙️ Settings", 4483362458)
SetTab:CreateSection("🖥️ Performance")
SetTab:CreateToggle({Name="🖥️ Low Graphics",CurrentValue=false,Flag="LG",Callback=function(v) game.Lighting.GlobalShadows=not v;game.Lighting.FogEnd=v and 9e9 or 1e5;settings().Rendering.QualityLevel=v and"Level01"or"Level21" end})
SetTab:CreateButton({Name="🛡️ Anti AFK",Callback=function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end);Rayfield:Notify({Title="SCP",Content="🛡️ AFK ON!",Duration=3}) end})
SetTab:CreateButton({Name="💬 Copy Discord",Callback=function() setclipboard("https://discord.gg/nDSy4jdVDc");Rayfield:Notify({Title="SCP",Content="✅ Copied!",Duration=3}) end})

notify("SCP HUB","⚔️ Rivals Loaded! Made by TEJAZ 👑",5)
