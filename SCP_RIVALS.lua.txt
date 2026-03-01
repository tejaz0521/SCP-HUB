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

repeat task.wait() until LocalPlayer and LocalPlayer.Character

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
