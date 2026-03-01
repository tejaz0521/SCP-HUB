-- ══════════════════════════════════════════════════
--              SCP HUB - RIVALS
--               Made by TEJAZ
--           discord.gg/nDSy4jdVDc
-- ══════════════════════════════════════════════════

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
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

-- Load UI Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/elerium-v2-ui-library/refs/heads/main/Library", true))()

local displayName = LocalPlayer.DisplayName or LocalPlayer.Name

local window = library:AddWindow("SCP HUB | RIVALS | " .. displayName, {
    main_color = Color3.fromRGB(138, 43, 226),
    min_size = Vector2.new(600, 700),
    can_resize = false,
})

-- ══════════════════════════════════════
-- INFO TAB
-- ══════════════════════════════════════
local infoTab = window:AddTab("INFO")
infoTab:AddLabel("[ SCP HUB - RIVALS ]")
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
-- AIMBOT TAB
-- ══════════════════════════════════════
local aimTab = window:AddTab("AIMBOT")
aimTab:AddLabel("[ AIMBOT ]")
aimTab:AddLabel("══════════════════════════════════════")

local aimbotOn = false
local aimbotFOV = 150
local aimbotSmooth = 0.3
local aimbotPart = "Head"

aimTab:AddTextBox("FOV (default 150)", function(val)
    aimbotFOV = tonumber(val) or 150
end, {clear=false, placeholder="150"})

aimTab:AddTextBox("Smoothness (0.1 = fast, 1 = slow)", function(val)
    aimbotSmooth = tonumber(val) or 0.3
end, {clear=false, placeholder="0.3"})

local partDrop = aimTab:AddDropdown("Target Part", function(sel)
    aimbotPart = sel
end)
partDrop:Add("Head")
partDrop:Add("HumanoidRootPart")
partDrop:Add("Torso")
partDrop:Add("UpperTorso")

aimTab:AddSwitch("Aimbot (Hold Right Click)", function(on)
    aimbotOn = on
    if on then
        notify("SCP HUB", "Aimbot ON! Hold Right Click to aim!", 3)
        spawn(function()
            while aimbotOn do
                task.wait()
                pcall(function()
                    if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
                    local camera = workspace.CurrentCamera
                    local closestPlayer = nil
                    local closestDist = aimbotFOV

                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character then
                            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                            local hum = plr.Character:FindFirstChild("Humanoid")
                            if hrp and hum and hum.Health > 0 then
                                local screenPos, onScreen = camera:WorldToViewportPoint(hrp.Position)
                                if onScreen then
                                    local center = Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)
                                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                                    if dist < closestDist then
                                        closestDist = dist
                                        closestPlayer = plr
                                    end
                                end
                            end
                        end
                    end

                    if closestPlayer and closestPlayer.Character then
                        local targetPart = closestPlayer.Character:FindFirstChild(aimbotPart)
                            or closestPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if targetPart then
                            camera.CFrame = camera.CFrame:Lerp(
                                CFrame.new(camera.CFrame.Position, targetPart.Position),
                                aimbotSmooth
                            )
                        end
                    end
                end)
            end
        end)
    end
end)

-- Silent Aim
aimTab:AddLabel("══════════════════════════════════════")
aimTab:AddLabel("SILENT AIM:")
aimTab:AddSwitch("Silent Aim", function(on)
    getgenv().silentAim = on
    if on then
        notify("SCP HUB", "Silent Aim ON!", 3)
        local mt = getrawmetatable(game)
        local oldIndex = mt.__index
        setreadonly(mt, false)
        mt.__index = function(t, k)
            if getgenv().silentAim and k == "Hit" and t:IsA("BasePart") then
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then return hrp end
                    end
                end
            end
            return oldIndex(t, k)
        end
        setreadonly(mt, true)
    end
end)

-- ══════════════════════════════════════
-- PLAYER TAB
-- ══════════════════════════════════════
local playerTab = window:AddTab("PLAYER")
playerTab:AddLabel("[ PLAYER MODS ]")
playerTab:AddLabel("══════════════════════════════════════")

-- Speed
local speedVal = 16
playerTab:AddTextBox("Walk Speed (default 16)", function(val)
    speedVal = tonumber(val) or 16
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = speedVal
    end
end, {clear=false, placeholder="16"})

playerTab:AddSwitch("Speed Hack", function(on)
    getgenv().speedHack = on
    if on then
        spawn(function()
            while getgenv().speedHack do
                pcall(function()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.WalkSpeed = speedVal
                    end
                end)
                task.wait(0.1)
            end
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
        end)
    end
end)

-- Jump Power
playerTab:AddSwitch("High Jump", function(on)
    getgenv().highJump = on
    spawn(function()
        while getgenv().highJump do
            pcall(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.JumpPower = on and 100 or 50
                end
            end)
            task.wait(0.1)
        end
    end)
end)

-- Noclip
playerTab:AddSwitch("Noclip", function(on)
    getgenv().noclip = on
    if on then
        RunService.Stepped:Connect(function()
            if getgenv().noclip and LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    end
end)

-- Infinite Jump
playerTab:AddSwitch("Infinite Jump", function(on)
    getgenv().infiniteJump = on
    if on then
        UserInputService.JumpRequest:Connect(function()
            if getgenv().infiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

-- Anti Aim
playerTab:AddSwitch("Spin (Anti Aim)", function(on)
    getgenv().spinOn = on
    if on then
        spawn(function()
            local angle = 0
            while getgenv().spinOn do
                pcall(function()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        angle = angle + 10
                        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                            * CFrame.Angles(0, math.rad(10), 0)
                    end
                end)
                task.wait(0.05)
            end
        end)
    end
end)

-- ══════════════════════════════════════
-- VISUALS TAB
-- ══════════════════════════════════════
local visualsTab = window:AddTab("VISUALS")
visualsTab:AddLabel("[ VISUALS / ESP ]")
visualsTab:AddLabel("══════════════════════════════════════")

-- Player ESP
visualsTab:AddSwitch("Player ESP (Box)", function(on)
    getgenv().espOn = on
    if on then
        spawn(function()
            while getgenv().espOn do
                for _, plr in ipairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local box = hrp:FindFirstChild("SCPBox")
                            if not box then
                                local highlight = Instance.new("BoxHandleAdornment")
                                highlight.Name = "SCPBox"
                                highlight.Adornee = hrp
                                highlight.AlwaysOnTop = true
                                highlight.Size = Vector3.new(4, 6, 2)
                                highlight.Transparency = 0.5
                                highlight.Color3 = Color3.fromRGB(138, 43, 226)
                                highlight.Parent = hrp
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
            -- Remove ESP
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr.Character then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local box = hrp:FindFirstChild("SCPBox")
                        if box then box:Destroy() end
                    end
                end
            end
        end)
    end
end)

-- Chams (highlight players)
visualsTab:AddSwitch("Player Chams (Highlight)", function(on)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local existing = plr.Character:FindFirstChild("SCPHighlight")
            if on then
                if not existing then
                    local h = Instance.new("SelectionBox")
                    h.Name = "SCPHighlight"
                    h.Adornee = plr.Character
                    h.Color3 = Color3.fromRGB(138, 43, 226)
                    h.LineThickness = 0.05
                    h.SurfaceTransparency = 0.7
                    h.SurfaceColor3 = Color3.fromRGB(138, 43, 226)
                    h.Parent = plr.Character
                end
            else
                if existing then existing:Destroy() end
            end
        end
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

notify("SCP HUB", "Rivals Hub loaded! Welcome "..displayName.."!", 4)
