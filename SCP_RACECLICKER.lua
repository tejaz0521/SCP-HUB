-- ══════════════════════════════════════════════════
--            SCP HUB - RACE CLICKER
--               Made by TEJAZ
--           discord.gg/nDSy4jdVDc
-- ══════════════════════════════════════════════════

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VIM = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")

-- ╔══════════════════════════════════════════════════╗
--   ⚡ SCP HUB KEY SYSTEM  |  Made by TEJAZ
-- ╚══════════════════════════════════════════════════╝

local TweenService = game:GetService("TweenService")
local CORRECT_KEY = "SCPONTOP"

repeat task.wait() until LocalPlayer and LocalPlayer.Character

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "SCPKey"
keyGui.ResetOnSpawn = false
keyGui.DisplayOrder = 999
keyGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Dark overlay
local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1,0,1,0)
overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
overlay.BackgroundTransparency = 0.3
overlay.BorderSizePixel = 0
overlay.Parent = keyGui

-- Main card
local card = Instance.new("Frame")
card.Size = UDim2.new(0,310,0,430)
card.Position = UDim2.new(0.5,-155,0.5,-215)
card.BackgroundColor3 = Color3.fromRGB(7,7,10)
card.BorderSizePixel = 0
card.Parent = keyGui
Instance.new("UICorner",card).CornerRadius = UDim.new(0,22)

-- Animated border
local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(220,0,0)
border.Thickness = 2.5
border.Parent = card

-- Top accent
local topAccent = Instance.new("Frame")
topAccent.Size = UDim2.new(1,0,0,4)
topAccent.BackgroundColor3 = Color3.fromRGB(220,0,0)
topAccent.BorderSizePixel = 0
topAccent.Parent = card
Instance.new("UICorner",topAccent).CornerRadius = UDim.new(0,22)

-- Header bg
local headerBg = Instance.new("Frame")
headerBg.Size = UDim2.new(1,0,0,140)
headerBg.BackgroundColor3 = Color3.fromRGB(12,12,18)
headerBg.BorderSizePixel = 0
headerBg.Parent = card
Instance.new("UICorner",headerBg).CornerRadius = UDim.new(0,22)

local hFix = Instance.new("Frame")
hFix.Size = UDim2.new(1,0,0.4,0)
hFix.Position = UDim2.new(0,0,0.6,0)
hFix.BackgroundColor3 = Color3.fromRGB(12,12,18)
hFix.BorderSizePixel = 0
hFix.Parent = headerBg

-- Logo
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0,75,0,75)
logo.Position = UDim2.new(0.5,-37.5,0,12)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://125515680929159"
logo.ScaleType = Enum.ScaleType.Fit
logo.Parent = card

-- Title
local titleLbl = Instance.new("TextLabel")
titleLbl.Size = UDim2.new(1,0,0,26)
titleLbl.Position = UDim2.new(0,0,0,92)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "⚡ SCP HUB ⚡"
titleLbl.TextColor3 = Color3.fromRGB(255,255,255)
titleLbl.TextSize = 20
titleLbl.Font = Enum.Font.GothamBlack
titleLbl.Parent = card

local subLbl = Instance.new("TextLabel")
subLbl.Size = UDim2.new(1,0,0,20)
subLbl.Position = UDim2.new(0,0,0,118)
subLbl.BackgroundTransparency = 1
subLbl.Text = "🔑 KEY SYSTEM"
subLbl.TextColor3 = Color3.fromRGB(220,0,0)
subLbl.TextSize = 12
subLbl.Font = Enum.Font.GothamBold
subLbl.Parent = card

-- Info box
local infoBox = Instance.new("Frame")
infoBox.Size = UDim2.new(1,-24,0,50)
infoBox.Position = UDim2.new(0,12,0,150)
infoBox.BackgroundColor3 = Color3.fromRGB(12,12,20)
infoBox.BorderSizePixel = 0
infoBox.Parent = card
Instance.new("UICorner",infoBox).CornerRadius = UDim.new(0,12)
local infoStroke = Instance.new("UIStroke")
infoStroke.Color = Color3.fromRGB(35,35,55)
infoStroke.Thickness = 1
infoStroke.Parent = infoBox

local infoLbl = Instance.new("TextLabel")
infoLbl.Size = UDim2.new(1,-16,1,0)
infoLbl.Position = UDim2.new(0,8,0,0)
infoLbl.BackgroundTransparency = 1
infoLbl.Text = "🔓  Enter your key below to unlock the script!
📢  Get key FREE at our Discord server!"
infoLbl.TextColor3 = Color3.fromRGB(160,160,180)
infoLbl.TextSize = 11
infoLbl.Font = Enum.Font.Gotham
infoLbl.TextWrapped = true
infoLbl.Parent = infoBox

-- Key label
local keyLbl = Instance.new("TextLabel")
keyLbl.Size = UDim2.new(1,-24,0,20)
keyLbl.Position = UDim2.new(0,12,0,212)
keyLbl.BackgroundTransparency = 1
keyLbl.Text = "🔑  YOUR KEY"
keyLbl.TextColor3 = Color3.fromRGB(100,100,130)
keyLbl.TextSize = 10
keyLbl.Font = Enum.Font.GothamBold
keyLbl.TextXAlignment = Enum.TextXAlignment.Left
keyLbl.Parent = card

-- Input bg
local inputBg = Instance.new("Frame")
inputBg.Size = UDim2.new(1,-24,0,50)
inputBg.Position = UDim2.new(0,12,0,234)
inputBg.BackgroundColor3 = Color3.fromRGB(14,14,22)
inputBg.BorderSizePixel = 0
inputBg.Parent = card
Instance.new("UICorner",inputBg).CornerRadius = UDim.new(0,14)
local inputStroke = Instance.new("UIStroke")
inputStroke.Color = Color3.fromRGB(40,40,60)
inputStroke.Thickness = 1.5
inputStroke.Parent = inputBg

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(1,-20,1,0)
inputBox.Position = UDim2.new(0,10,0,0)
inputBox.BackgroundTransparency = 1
inputBox.Text = ""
inputBox.PlaceholderText = "  Paste key here..."
inputBox.PlaceholderColor3 = Color3.fromRGB(60,60,80)
inputBox.TextColor3 = Color3.fromRGB(255,255,255)
inputBox.TextSize = 15
inputBox.Font = Enum.Font.GothamBold
inputBox.ClearTextOnFocus = false
inputBox.Parent = inputBg

-- Status
local statusLbl = Instance.new("TextLabel")
statusLbl.Size = UDim2.new(1,-24,0,22)
statusLbl.Position = UDim2.new(0,12,0,292)
statusLbl.BackgroundTransparency = 1
statusLbl.Text = ""
statusLbl.TextColor3 = Color3.fromRGB(255,60,60)
statusLbl.TextSize = 12
statusLbl.Font = Enum.Font.GothamBold
statusLbl.Parent = card

-- Submit button
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(1,-24,0,50)
submitBtn.Position = UDim2.new(0,12,0,318)
submitBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
submitBtn.BorderSizePixel = 0
submitBtn.Text = "✅  UNLOCK SCRIPT"
submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
submitBtn.TextSize = 15
submitBtn.Font = Enum.Font.GothamBlack
submitBtn.AutoButtonColor = false
submitBtn.Parent = card
Instance.new("UICorner",submitBtn).CornerRadius = UDim.new(0,14)
Instance.new("UIStroke",submitBtn).Color = Color3.fromRGB(255,60,60)

-- Discord button
local discBtn = Instance.new("TextButton")
discBtn.Size = UDim2.new(1,-24,0,38)
discBtn.Position = UDim2.new(0,12,0,378)
discBtn.BackgroundColor3 = Color3.fromRGB(14,14,22)
discBtn.BorderSizePixel = 0
discBtn.Text = "💬  Get Key FREE  •  discord.gg/nDSy4jdVDc"
discBtn.TextColor3 = Color3.fromRGB(140,140,200)
discBtn.TextSize = 11
discBtn.Font = Enum.Font.GothamBold
discBtn.AutoButtonColor = false
discBtn.Parent = card
Instance.new("UICorner",discBtn).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke",discBtn).Color = Color3.fromRGB(40,40,80)

discBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/nDSy4jdVDc")
    statusLbl.Text = "✅  Discord link copied to clipboard!"
    statusLbl.TextColor3 = Color3.fromRGB(0,220,100)
end)

-- Hover effects
submitBtn.MouseEnter:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(220,0,0)}):Play()
end)
submitBtn.MouseLeave:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(180,0,0)}):Play()
end)
submitBtn.MouseButton1Down:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.07), {Size = UDim2.new(1,-24,0,45)}):Play()
end)
submitBtn.MouseButton1Up:Connect(function()
    TweenService:Create(submitBtn, TweenInfo.new(0.07), {Size = UDim2.new(1,-24,0,50)}):Play()
end)

-- Animate in
card.Position = UDim2.new(0.5,-155,1.5,0)
TweenService:Create(card, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5,-155,0.5,-215)
}):Play()

-- Animated border glow
task.spawn(function()
    local t = 0
    while keyGui.Parent do
        t = t + 0.02
        local r = (math.sin(t)+1)/2
        border.Color = Color3.new(0.7+r*0.3, 0, 0)
        task.wait(0.05)
    end
end)

-- Pulse logo
task.spawn(function()
    while keyGui.Parent do
        TweenService:Create(logo, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0,80,0,80)}):Play()
        task.wait(1)
        TweenService:Create(logo, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Size = UDim2.new(0,75,0,75)}):Play()
        task.wait(1)
    end
end)

-- Key check
local keyVerified = false
local function checkKey()
    local entered = inputBox.Text:match("^%s*(.-)%s*$")
    if entered == CORRECT_KEY then
        statusLbl.Text = "✅  Key accepted! Loading script..."
        statusLbl.TextColor3 = Color3.fromRGB(0,220,100)
        submitBtn.BackgroundColor3 = Color3.fromRGB(0,160,60)
        inputStroke.Color = Color3.fromRGB(0,200,80)
        border.Color = Color3.fromRGB(0,200,80)
        task.wait(1.2)
        keyGui:Destroy()
        keyVerified = true
    else
        statusLbl.Text = "❌  Wrong key! Get it at discord.gg/nDSy4jdVDc"
        statusLbl.TextColor3 = Color3.fromRGB(255,60,60)
        inputStroke.Color = Color3.fromRGB(200,0,0)
        -- Shake animation
        for i = 1, 3 do
            TweenService:Create(card, TweenInfo.new(0.04), {Position = UDim2.new(0.5,-148,0.5,-215)}):Play()
            task.wait(0.04)
            TweenService:Create(card, TweenInfo.new(0.04), {Position = UDim2.new(0.5,-162,0.5,-215)}):Play()
            task.wait(0.04)
        end
        TweenService:Create(card, TweenInfo.new(0.04), {Position = UDim2.new(0.5,-155,0.5,-215)}):Play()
        task.wait(0.3)
        inputStroke.Color = Color3.fromRGB(40,40,60)
    end
end

submitBtn.MouseButton1Click:Connect(checkKey)
inputBox.FocusLost:Connect(function(enter) if enter then checkKey() end end)
repeat task.wait() until keyVerified



local function notify(title, text, dur)
    StarterGui:SetCore("SendNotification", {Title = title, Text = text, Duration = dur or 3})
end

local function formatNumber(n)
    n = tonumber(n) or 0
    if n >= 1e9 then return string.format("%.2fB", n/1e9)
    elseif n >= 1e6 then return string.format("%.2fM", n/1e6)
    elseif n >= 1e3 then return string.format("%.2fK", n/1e3)
    else return tostring(math.floor(n)) end
end

-- Load UI Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/elerium-v2-ui-library/refs/heads/main/Library", true))()

local displayName = LocalPlayer.DisplayName or LocalPlayer.Name

local window = library:AddWindow("SCP HUB | Race Clicker | " .. displayName, {
    main_color = Color3.fromRGB(255, 140, 0),
    min_size = Vector2.new(600, 650),
    can_resize = false,
})

-- ══════════════════════════════════════
-- INFO TAB
-- ══════════════════════════════════════
local infoTab = window:AddTab("INFO")
infoTab:AddLabel("[ SCP HUB - RACE CLICKER ]")
local rainbow = infoTab:AddLabel("Made by TEJAZ")
task.spawn(function()
    while true do
        rainbow.TextColor3 = Color3.fromHSV(tick() * 0.2 % 1, 0.9, 1)
        task.wait(0.02)
    end
end)
infoTab:AddLabel("══════════════════════════════════════")
infoTab:AddButton("Join Discord - discord.gg/nDSy4jdVDc", function()
    setclipboard("https://discord.gg/nDSy4jdVDc")
    
-- SCP Logo corner overlay
task.spawn(function()
    task.wait(0.5)
    local logoOverlay = Instance.new("ScreenGui")
    logoOverlay.Name = "SCPLogoOverlay"
    logoOverlay.ResetOnSpawn = false
    logoOverlay.DisplayOrder = 999
    logoOverlay.Parent = LocalPlayer:WaitForChild("PlayerGui")
    local cornerLogo = Instance.new("ImageLabel")
    cornerLogo.Size = UDim2.new(0,58,0,58)
    cornerLogo.Position = UDim2.new(0,6,0,6)
    cornerLogo.BackgroundTransparency = 1
    cornerLogo.Image = "rbxassetid://125515680929159"
    cornerLogo.ScaleType = Enum.ScaleType.Fit
    cornerLogo.Parent = logoOverlay
end)
notify("SCP HUB", "Discord copied!", 3)
end)

-- ══════════════════════════════════════
-- AUTO CLICK TAB
-- ══════════════════════════════════════
local clickTab = window:AddTab("AUTO CLICK")
clickTab:AddLabel("[ AUTO CLICKER ]")
clickTab:AddLabel("══════════════════════════════════════")

local clickSpeed = 100
local clicksPerSec = clickTab:AddLabel("Clicks/sec: 0")
local totalClicks = 0
local sessionStart = tick()

clickTab:AddTextBox("Click Speed (per second, default 100)", function(val)
    clickSpeed = math.clamp(tonumber(val) or 100, 1, 1000)
end, {clear=false, placeholder="100"})

-- Auto Clicker - clicks the race button
clickTab:AddSwitch("Auto Clicker (FASTEST)", function(on)
    getgenv().autoClick = on
    totalClicks = 0
    sessionStart = tick()
    if on then
        notify("SCP HUB", "Auto Clicker started! Speed: "..clickSpeed.."/sec!", 3)
        spawn(function()
            while getgenv().autoClick do
                pcall(function()
                    -- Fire the click event directly
                    local clickEvent = ReplicatedStorage:FindFirstChild("ClickEvent")
                        or ReplicatedStorage:FindFirstChild("click")
                        or ReplicatedStorage:FindFirstChild("Click")
                    if clickEvent then
                        for i = 1, clickSpeed do
                            clickEvent:FireServer()
                            totalClicks = totalClicks + 1
                        end
                    else
                        -- Try mouse click simulation
                        for i = 1, math.floor(clickSpeed / 10) do
                            VIM:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                            VIM:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                            totalClicks = totalClicks + 1
                        end
                    end
                    -- Update label
                    local elapsed = tick() - sessionStart
                    if elapsed > 0 then
                        clicksPerSec.Text = "Total Clicks: "..formatNumber(totalClicks).." | Rate: "..formatNumber(math.floor(totalClicks/elapsed)).."/sec"
                    end
                end)
                task.wait(1)
            end
        end)
    end
end)

-- Spam Click (fastest possible)
clickTab:AddSwitch("Spam Click (MAX SPEED)", function(on)
    getgenv().spamClick = on
    if on then
        notify("SCP HUB", "Spam Click MAX SPEED started!", 3)
        spawn(function()
            while getgenv().spamClick do
                pcall(function()
                    local clickEvent = ReplicatedStorage:FindFirstChild("ClickEvent")
                        or ReplicatedStorage:FindFirstChild("click")
                        or ReplicatedStorage:FindFirstChild("Click")
                    for i = 1, 500 do
                        if clickEvent then
                            clickEvent:FireServer()
                        end
                        task.spawn(function()
                            VIM:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                            VIM:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                        end)
                    end
                end)
                task.wait(0)
            end
        end)
    end
end)

clickTab:AddLabel("══════════════════════════════════════")
clickTab:AddLabel("CLICK STATS:")
clickTab:AddButton("Reset Click Counter", function()
    totalClicks = 0
    sessionStart = tick()
    clicksPerSec.Text = "Total Clicks: 0 | Rate: 0/sec"
end)

-- ══════════════════════════════════════
-- RACE TAB
-- ══════════════════════════════════════
local raceTab = window:AddTab("RACE")
raceTab:AddLabel("[ RACE FEATURES ]")
raceTab:AddLabel("══════════════════════════════════════")

-- Speed boost during race
raceTab:AddSwitch("Speed Boost (during race)", function(on)
    getgenv().raceSpeed = on
    spawn(function()
        while getgenv().raceSpeed do
            pcall(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.WalkSpeed = on and 100 or 16
                end
            end)
            task.wait(0.1)
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end)
end)

-- Auto Race (auto joins and finishes races)
raceTab:AddSwitch("Auto Race (auto join + finish)", function(on)
    getgenv().autoRace = on
    if on then
        notify("SCP HUB", "Auto Race started!", 3)
        spawn(function()
            while getgenv().autoRace do
                pcall(function()
                    -- Try to find and fire race events
                    local joinRace = ReplicatedStorage:FindFirstChild("JoinRace")
                        or ReplicatedStorage:FindFirstChild("joinRace")
                        or ReplicatedStorage:FindFirstChild("StartRace")
                    if joinRace then joinRace:FireServer() end

                    -- Teleport to finish line if possible
                    local finish = workspace:FindFirstChild("FinishLine")
                        or workspace:FindFirstChild("Finish")
                        or workspace:FindFirstChild("End")
                    if finish and LocalPlayer.Character then
                        LocalPlayer.Character:MoveTo(finish.Position)
                    end
                end)
                task.wait(3)
            end
        end)
    end
end)

-- Infinite Jump (useful for race obstacles)
raceTab:AddSwitch("Infinite Jump", function(on)
    getgenv().infJump = on
    if on then
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if getgenv().infJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

-- Noclip
raceTab:AddSwitch("Noclip (go through walls)", function(on)
    getgenv().noclipRC = on
    if on then
        RunService.Stepped:Connect(function()
            if getgenv().noclipRC and LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    end
end)

-- ══════════════════════════════════════
-- PETS TAB
-- ══════════════════════════════════════
local petsTab = window:AddTab("PETS")
petsTab:AddLabel("[ PETS ]")
petsTab:AddLabel("══════════════════════════════════════")

petsTab:AddSwitch("Auto Open Eggs (fastest)", function(on)
    getgenv().autoEggs = on
    if on then
        notify("SCP HUB", "Auto Open Eggs started!", 3)
        spawn(function()
            while getgenv().autoEggs do
                pcall(function()
                    -- Find egg open event
                    local eggEvent = ReplicatedStorage:FindFirstChild("OpenEgg")
                        or ReplicatedStorage:FindFirstChild("openEgg")
                        or ReplicatedStorage:FindFirstChild("HatchEgg")
                    -- Find eggs
                    local eggs = LocalPlayer:FindFirstChild("Eggs") or LocalPlayer:FindFirstChild("Inventory")
                    if eggEvent then
                        if eggs then
                            for _, egg in pairs(eggs:GetChildren()) do
                                eggEvent:FireServer(egg)
                                task.wait(0.1)
                            end
                        else
                            eggEvent:FireServer()
                        end
                    end
                end)
                task.wait(1)
            end
        end)
    end
end)

petsTab:AddSwitch("Auto Equip Best Pets", function(on)
    getgenv().autoEquipPets = on
    if on then
        spawn(function()
            while getgenv().autoEquipPets do
                pcall(function()
                    local equipEvent = ReplicatedStorage:FindFirstChild("EquipPet")
                        or ReplicatedStorage:FindFirstChild("equipPet")
                    local petsFolder = LocalPlayer:FindFirstChild("Pets")
                        or LocalPlayer:FindFirstChild("OwnedPets")
                    if equipEvent and petsFolder then
                        local count = 0
                        for _, pet in pairs(petsFolder:GetChildren()) do
                            if count >= 3 then break end
                            equipEvent:FireServer(pet)
                            count = count + 1
                            task.wait(0.1)
                        end
                    end
                end)
                task.wait(10)
            end
        end)
    end
end)

-- ══════════════════════════════════════
-- SETTINGS TAB
-- ══════════════════════════════════════
local settingsTab = window:AddTab("SETTINGS")
settingsTab:AddLabel("[ SETTINGS ]")
settingsTab:AddLabel("══════════════════════════════════════")

settingsTab:AddSwitch("Low Graphics (FPS Boost)", function(on)
    game.Lighting.GlobalShadows = not on
    game.Lighting.FogEnd = on and 9e9 or 100000
    game.Lighting.Brightness = on and 0 or 2
    settings().Rendering.QualityLevel = on and "Level01" or "Level21"
end)

settingsTab:AddButton("Anti AFK", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/New%20anti%20afk%20v2"))()
    notify("SCP HUB", "Anti AFK enabled!", 3)
end)

settingsTab:AddLabel("discord.gg/nDSy4jdVDc | Made by TEJAZ")

notify("SCP HUB", "Race Clicker Hub loaded! Welcome "..displayName.."!", 4)
