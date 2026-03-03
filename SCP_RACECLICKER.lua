-- SCP HUB | RACE CLICKER | Made by TEJAZ
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local RunSvc = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local VU = game:GetService("VirtualUser")
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
    Name = "⚡ SCP HUB | Race Clicker",
    Icon = 0,
    LoadingTitle = "⚡ SCP HUB",
    LoadingSubtitle = "🏎️ Race Clicker | Made by TEJAZ",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = { Enabled = false },
    KeySystem = true,
    KeySettings = {
        Title = "⚡ SCP HUB",
        Subtitle = "🔑 Key Required | Race Clicker",
        Note = "Key: SCPONTOP | discord.gg/nDSy4jdVDc",
        FileName = "SCPRaceKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = getKeys()
    }
})

-- FARM
local FarmTab = Window:CreateTab("🏎️ Farm", 4483362458)
FarmTab:CreateSection("🖱️ Auto Click")

local clickCount = 0
local clickLabel = FarmTab:CreateLabel("Clicks: 0")

FarmTab:CreateToggle({Name="🖱️ Auto Click",CurrentValue=false,Flag="AC",Callback=function(v)
    getgenv().autoClick=v
    if v then task.spawn(function() while getgenv().autoClick do
        VU:Button1Down(Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2), workspace.CurrentCamera)
        VU:Button1Up(Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2), workspace.CurrentCamera)
        clickCount=clickCount+1; clickLabel:Set("Clicks: "..clickCount); task.wait(0.05)
    end end) end
end})

FarmTab:CreateToggle({Name="⚡ Fast Auto Click",CurrentValue=false,Flag="FAC",Callback=function(v)
    getgenv().fastClick=v
    if v then task.spawn(function() while getgenv().fastClick do
        VU:Button1Down(Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2), workspace.CurrentCamera)
        VU:Button1Up(Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2), workspace.CurrentCamera)
        clickCount=clickCount+1; clickLabel:Set("Clicks: "..clickCount); task.wait(0.01)
    end end) end
end})

FarmTab:CreateButton({Name="🔄 Reset Click Count",Callback=function() clickCount=0; clickLabel:Set("Clicks: 0") end})

FarmTab:CreateSection("🏁 Auto Race")
FarmTab:CreateToggle({Name="🏁 Auto Race Start",CurrentValue=false,Flag="ARS",Callback=function(v)
    getgenv().autoRace=v
    if v then task.spawn(function() while getgenv().autoRace do
        pcall(function()
            for _,r in pairs(RS:GetDescendants()) do
                if r:IsA("RemoteEvent") and r.Name:lower():find("start") then r:FireServer() end
                if r:IsA("RemoteFunction") and r.Name:lower():find("start") then r:InvokeServer() end
            end
        end); task.wait(2)
    end end) end
end})

FarmTab:CreateToggle({Name="🏆 Auto Finish Race",CurrentValue=false,Flag="AFR",Callback=function(v)
    getgenv().autoFinish=v
    if v then task.spawn(function() while getgenv().autoFinish do
        pcall(function()
            for _,r in pairs(RS:GetDescendants()) do
                if r:IsA("RemoteEvent") and r.Name:lower():find("finish") then r:FireServer() end
                if r:IsA("RemoteFunction") and r.Name:lower():find("finish") then r:InvokeServer() end
            end
        end); task.wait(1)
    end end) end
end})

-- SPEED
local SpeedTab = Window:CreateTab("⚡ Speed", 4483362458)
SpeedTab:CreateSection("🏃 Movement")
SpeedTab:CreateToggle({Name="⚡ Speed Hack (100)",CurrentValue=false,Flag="SPH",Callback=function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 100 or 16 end end})
SpeedTab:CreateToggle({Name="🚀 Ultra Speed (250)",CurrentValue=false,Flag="US",Callback=function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 250 or 16 end end})
SpeedTab:CreateToggle({Name="🦘 High Jump",CurrentValue=false,Flag="HJ",Callback=function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.JumpPower=v and 100 or 50 end end})
SpeedTab:CreateToggle({Name="♾️ Infinite Jump",CurrentValue=false,Flag="IJ",Callback=function(v)
    getgenv().infJump=v
    if v then getgenv().ijC=UIS.JumpRequest:Connect(function() if getgenv().infJump and LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end)
    elseif getgenv().ijC then getgenv().ijC:Disconnect() end
end})
SpeedTab:CreateToggle({Name="🏎️ Max Vehicle Speed",CurrentValue=false,Flag="MVS",Callback=function(v)
    getgenv().maxVeh=v
    if v then task.spawn(function() while getgenv().maxVeh do
        for _,obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("VehicleSeat") then obj.MaxSpeed=1000; obj.Torque=1000 end
        end; task.wait(0.5)
    end end) end
end})

-- MONEY
local MoneyTab = Window:CreateTab("💰 Money", 4483362458)
MoneyTab:CreateSection("💰 Auto Earn")
MoneyTab:CreateToggle({Name="🛒 Auto Buy Upgrades",CurrentValue=false,Flag="ABU",Callback=function(v)
    getgenv().autoBuy=v
    if v then task.spawn(function() while getgenv().autoBuy do
        pcall(function()
            for _,r in pairs(RS:GetDescendants()) do
                if r:IsA("RemoteEvent") and (r.Name:lower():find("upgrade") or r.Name:lower():find("buy")) then r:FireServer() end
                if r:IsA("RemoteFunction") and (r.Name:lower():find("upgrade") or r.Name:lower():find("buy")) then r:InvokeServer() end
            end
        end); task.wait(1)
    end end) end
end})
MoneyTab:CreateToggle({Name="🔄 Auto Prestige/Rebirth",CurrentValue=false,Flag="APR",Callback=function(v)
    getgenv().autoPrestige=v
    if v then task.spawn(function() while getgenv().autoPrestige do
        pcall(function()
            for _,r in pairs(RS:GetDescendants()) do
                if r:IsA("RemoteEvent") and (r.Name:lower():find("prestige") or r.Name:lower():find("rebirth")) then r:FireServer() end
            end
        end); task.wait(3)
    end end) end
end})

-- SETTINGS
local SetTab = Window:CreateTab("⚙️ Settings", 4483362458)
SetTab:CreateSection("🖥️ Performance")
SetTab:CreateToggle({Name="🖥️ Low Graphics",CurrentValue=false,Flag="LG",Callback=function(v) game.Lighting.GlobalShadows=not v;game.Lighting.FogEnd=v and 9e9 or 1e5;settings().Rendering.QualityLevel=v and"Level01"or"Level21" end})
SetTab:CreateButton({Name="🛡️ Anti AFK",Callback=function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end);Rayfield:Notify({Title="SCP",Content="🛡️ AFK ON!",Duration=3}) end})
SetTab:CreateButton({Name="💬 Copy Discord",Callback=function() setclipboard("https://discord.gg/nDSy4jdVDc");Rayfield:Notify({Title="SCP",Content="✅ Copied!",Duration=3}) end})

notify("SCP HUB","🏎️ Race Clicker Loaded! Made by TEJAZ 👑",5)
