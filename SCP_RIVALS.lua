-- ╔══════════════════════════════════════════════════╗
--   ⚡ SCP HUB - RIVALS  |  Made by TEJAZ
--   discord.gg/nDSy4jdVDc  |  Key: SCPONTOP
-- ╚══════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

repeat task.wait() until LocalPlayer and LocalPlayer.Character

local function notify(title, text, dur)
    StarterGui:SetCore("SendNotification", {Title=title, Text=text, Duration=dur or 3})
end

-- ══════════════════════════════════════
-- 🔑 KEY SYSTEM
-- ══════════════════════════════════════
local CORRECT_KEY = "SCPONTOP"

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "SCPKey"
keyGui.ResetOnSpawn = false
keyGui.DisplayOrder = 999
keyGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local overlay = Instance.new("Frame")
overlay.Size = UDim2.new(1,0,1,0)
overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
overlay.BackgroundTransparency = 0.3
overlay.BorderSizePixel = 0
overlay.Parent = keyGui

local card = Instance.new("Frame")
card.Size = UDim2.new(0,310,0,430)
card.Position = UDim2.new(0.5,-155,0.5,-215)
card.BackgroundColor3 = Color3.fromRGB(7,7,10)
card.BorderSizePixel = 0
card.Parent = keyGui
Instance.new("UICorner",card).CornerRadius = UDim.new(0,22)

local border = Instance.new("UIStroke")
border.Color = Color3.fromRGB(220,0,0)
border.Thickness = 2.5
border.Parent = card

local topAccent = Instance.new("Frame")
topAccent.Size = UDim2.new(1,0,0,4)
topAccent.BackgroundColor3 = Color3.fromRGB(220,0,0)
topAccent.BorderSizePixel = 0
topAccent.Parent = card
Instance.new("UICorner",topAccent).CornerRadius = UDim.new(0,22)

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

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0,75,0,75)
logo.Position = UDim2.new(0.5,-37.5,0,12)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://125515680929159"
logo.ScaleType = Enum.ScaleType.Fit
logo.Parent = card

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
subLbl.Text = "⚔️ RIVALS  •  🔑 KEY SYSTEM"
subLbl.TextColor3 = Color3.fromRGB(220,0,0)
subLbl.TextSize = 12
subLbl.Font = Enum.Font.GothamBold
subLbl.Parent = card

local infoBox = Instance.new("Frame")
infoBox.Size = UDim2.new(1,-24,0,45)
infoBox.Position = UDim2.new(0,12,0,150)
infoBox.BackgroundColor3 = Color3.fromRGB(12,12,20)
infoBox.BorderSizePixel = 0
infoBox.Parent = card
Instance.new("UICorner",infoBox).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke",infoBox).Color = Color3.fromRGB(35,35,55)

local infoLbl = Instance.new("TextLabel")
infoLbl.Size = UDim2.new(1,-16,1,0)
infoLbl.Position = UDim2.new(0,8,0,0)
infoLbl.BackgroundTransparency = 1
infoLbl.Text = "🔓 Enter key below  •  Get key FREE at Discord!"
infoLbl.TextColor3 = Color3.fromRGB(160,160,180)
infoLbl.TextSize = 11
infoLbl.Font = Enum.Font.Gotham
infoLbl.TextWrapped = true
infoLbl.Parent = infoBox

local keyLbl = Instance.new("TextLabel")
keyLbl.Size = UDim2.new(1,-24,0,20)
keyLbl.Position = UDim2.new(0,12,0,205)
keyLbl.BackgroundTransparency = 1
keyLbl.Text = "🔑  YOUR KEY"
keyLbl.TextColor3 = Color3.fromRGB(100,100,130)
keyLbl.TextSize = 10
keyLbl.Font = Enum.Font.GothamBold
keyLbl.TextXAlignment = Enum.TextXAlignment.Left
keyLbl.Parent = card

local inputBg = Instance.new("Frame")
inputBg.Size = UDim2.new(1,-24,0,50)
inputBg.Position = UDim2.new(0,12,0,227)
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

local statusLbl = Instance.new("TextLabel")
statusLbl.Size = UDim2.new(1,-24,0,22)
statusLbl.Position = UDim2.new(0,12,0,284)
statusLbl.BackgroundTransparency = 1
statusLbl.Text = ""
statusLbl.TextColor3 = Color3.fromRGB(255,60,60)
statusLbl.TextSize = 12
statusLbl.Font = Enum.Font.GothamBold
statusLbl.Parent = card

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(1,-24,0,50)
submitBtn.Position = UDim2.new(0,12,0,310)
submitBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
submitBtn.BorderSizePixel = 0
submitBtn.Text = "✅  UNLOCK SCRIPT"
submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
submitBtn.TextSize = 15
submitBtn.Font = Enum.Font.GothamBlack
submitBtn.AutoButtonColor = false
submitBtn.Parent = card
Instance.new("UICorner",submitBtn).CornerRadius = UDim.new(0,14)

local discBtn = Instance.new("TextButton")
discBtn.Size = UDim2.new(1,-24,0,38)
discBtn.Position = UDim2.new(0,12,0,370)
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
    statusLbl.Text = "✅ Discord link copied!"
    statusLbl.TextColor3 = Color3.fromRGB(0,220,100)
end)

submitBtn.MouseButton1Down:Connect(function()
    TweenService:Create(submitBtn,TweenInfo.new(0.07),{Size=UDim2.new(1,-24,0,45)}):Play()
end)
submitBtn.MouseButton1Up:Connect(function()
    TweenService:Create(submitBtn,TweenInfo.new(0.07),{Size=UDim2.new(1,-24,0,50)}):Play()
end)

card.Position = UDim2.new(0.5,-155,1.5,0)
TweenService:Create(card,TweenInfo.new(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
    Position = UDim2.new(0.5,-155,0.5,-215)
}):Play()

task.spawn(function()
    local t=0
    while keyGui.Parent do
        t=t+0.02
        border.Color=Color3.new(0.7+(math.sin(t)+1)/2*0.3,0,0)
        task.wait(0.05)
    end
end)
task.spawn(function()
    while keyGui.Parent do
        TweenService:Create(logo,TweenInfo.new(0.8,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,82,0,82)}):Play()
        task.wait(0.8)
        TweenService:Create(logo,TweenInfo.new(0.8,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,75,0,75)}):Play()
        task.wait(0.8)
    end
end)

local keyVerified = false
local function checkKey()
    local entered = inputBox.Text:match("^%s*(.-)%s*$")
    if entered == CORRECT_KEY then
        statusLbl.Text = "✅ Key accepted! Loading..."
        statusLbl.TextColor3 = Color3.fromRGB(0,220,100)
        submitBtn.BackgroundColor3 = Color3.fromRGB(0,160,60)
        inputStroke.Color = Color3.fromRGB(0,200,80)
        border.Color = Color3.fromRGB(0,200,80)
        task.wait(1.2)
        keyGui:Destroy()
        keyVerified = true
    else
        statusLbl.Text = "❌ Wrong key! Get it at discord.gg/nDSy4jdVDc"
        statusLbl.TextColor3 = Color3.fromRGB(255,60,60)
        inputStroke.Color = Color3.fromRGB(200,0,0)
        for i=1,3 do
            TweenService:Create(card,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-148,0.5,-215)}):Play()
            task.wait(0.04)
            TweenService:Create(card,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-162,0.5,-215)}):Play()
            task.wait(0.04)
        end
        TweenService:Create(card,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-155,0.5,-215)}):Play()
        task.wait(0.3)
        inputStroke.Color = Color3.fromRGB(40,40,60)
    end
end
submitBtn.MouseButton1Click:Connect(checkKey)
inputBox.FocusLost:Connect(function(e) if e then checkKey() end end)
repeat task.wait() until keyVerified

-- ══════════════════════════════════════
-- 🎮 MAIN HUB (Pure Roblox GUI - No Library)
-- ══════════════════════════════════════

-- Corner logo
local logoGui = Instance.new("ScreenGui")
logoGui.Name = "SCPCornerLogo"
logoGui.ResetOnSpawn = false
logoGui.DisplayOrder = 9998
logoGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
local cornerLogo = Instance.new("ImageLabel")
cornerLogo.Size = UDim2.new(0,55,0,55)
cornerLogo.Position = UDim2.new(0,6,0,6)
cornerLogo.BackgroundTransparency = 1
cornerLogo.Image = "rbxassetid://125515680929159"
cornerLogo.ScaleType = Enum.ScaleType.Fit
cornerLogo.Parent = logoGui

-- Main Hub GUI
local hubGui = Instance.new("ScreenGui")
hubGui.Name = "SCPRivals"
hubGui.ResetOnSpawn = false
hubGui.DisplayOrder = 100
hubGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Main window
local mainWin = Instance.new("Frame")
mainWin.Size = UDim2.new(0,340,0,560)
mainWin.Position = UDim2.new(0.5,-170,0.5,-280)
mainWin.BackgroundColor3 = Color3.fromRGB(7,7,10)
mainWin.BorderSizePixel = 0
mainWin.Active = true
mainWin.Draggable = true
mainWin.Parent = hubGui
Instance.new("UICorner",mainWin).CornerRadius = UDim.new(0,18)
local winBorder = Instance.new("UIStroke")
winBorder.Color = Color3.fromRGB(220,0,0)
winBorder.Thickness = 2
winBorder.Parent = mainWin

-- Top accent
local winAccent = Instance.new("Frame")
winAccent.Size = UDim2.new(1,0,0,4)
winAccent.BackgroundColor3 = Color3.fromRGB(220,0,0)
winAccent.BorderSizePixel = 0
winAccent.Parent = mainWin
Instance.new("UICorner",winAccent).CornerRadius = UDim.new(0,18)

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1,0,0,50)
titleBar.BackgroundColor3 = Color3.fromRGB(12,12,18)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainWin
Instance.new("UICorner",titleBar).CornerRadius = UDim.new(0,18)
local tbFix = Instance.new("Frame")
tbFix.Size = UDim2.new(1,0,0.5,0)
tbFix.Position = UDim2.new(0,0,0.5,0)
tbFix.BackgroundColor3 = Color3.fromRGB(12,12,18)
tbFix.BorderSizePixel = 0
tbFix.Parent = titleBar

-- Title logo small
local titleLogo = Instance.new("ImageLabel")
titleLogo.Size = UDim2.new(0,35,0,35)
titleLogo.Position = UDim2.new(0,8,0.5,-17.5)
titleLogo.BackgroundTransparency = 1
titleLogo.Image = "rbxassetid://125515680929159"
titleLogo.ScaleType = Enum.ScaleType.Fit
titleLogo.Parent = titleBar

local winTitle = Instance.new("TextLabel")
winTitle.Size = UDim2.new(1,-90,1,0)
winTitle.Position = UDim2.new(0,48,0,0)
winTitle.BackgroundTransparency = 1
winTitle.Text = "⚡ SCP HUB  •  RIVALS"
winTitle.TextColor3 = Color3.fromRGB(255,255,255)
winTitle.TextSize = 15
winTitle.Font = Enum.Font.GothamBlack
winTitle.TextXAlignment = Enum.TextXAlignment.Left
winTitle.Parent = titleBar

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,32,0,32)
closeBtn.Position = UDim2.new(1,-40,0.5,-16)
closeBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar
Instance.new("UICorner",closeBtn).CornerRadius = UDim.new(0,8)
closeBtn.MouseButton1Click:Connect(function() hubGui:Destroy() logoGui:Destroy() end)

-- Tab buttons
local tabNames = {"AIMBOT","PLAYER","VISUALS","SETTINGS"}
local tabColors = {
    Color3.fromRGB(220,0,0),
    Color3.fromRGB(0,120,220),
    Color3.fromRGB(0,180,80),
    Color3.fromRGB(150,0,200)
}
local tabs = {}
local tabContents = {}
local activeTab = nil

local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1,-16,0,36)
tabBar.Position = UDim2.new(0,8,0,56)
tabBar.BackgroundColor3 = Color3.fromRGB(12,12,20)
tabBar.BorderSizePixel = 0
tabBar.Parent = mainWin
Instance.new("UICorner",tabBar).CornerRadius = UDim.new(0,10)

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0,4)
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
tabLayout.Parent = tabBar

-- Content area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1,-16,1,-110)
contentArea.Position = UDim2.new(0,8,0,100)
contentArea.BackgroundColor3 = Color3.fromRGB(10,10,16)
contentArea.BorderSizePixel = 0
contentArea.Parent = mainWin
Instance.new("UICorner",contentArea).CornerRadius = UDim.new(0,12)

local function createTab(name, color, order)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0,72,0,28)
    btn.BackgroundColor3 = Color3.fromRGB(18,18,28)
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(120,120,140)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.LayoutOrder = order
    btn.AutoButtonColor = false
    btn.Parent = tabBar
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1,0,1,0)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 3
    scroll.ScrollBarImageColor3 = Color3.fromRGB(220,0,0)
    scroll.CanvasSize = UDim2.new(0,0,0,0)
    scroll.Visible = false
    scroll.Parent = contentArea

    local layout2 = Instance.new("UIListLayout")
    layout2.Padding = UDim.new(0,6)
    layout2.SortOrder = Enum.SortOrder.LayoutOrder
    layout2.Parent = scroll
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0,8)
    pad.PaddingRight = UDim.new(0,8)
    pad.PaddingTop = UDim.new(0,8)
    pad.Parent = scroll

    layout2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scroll.CanvasSize = UDim2.new(0,0,0,layout2.AbsoluteContentSize.Y+16)
    end)

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabContents) do t.Visible = false end
        for _, b in pairs(tabs) do
            b.BackgroundColor3 = Color3.fromRGB(18,18,28)
            b.TextColor3 = Color3.fromRGB(120,120,140)
        end
        scroll.Visible = true
        btn.BackgroundColor3 = color
        btn.TextColor3 = Color3.fromRGB(255,255,255)
    end)

    table.insert(tabs, btn)
    table.insert(tabContents, scroll)
    return scroll
end

local aimbotTab = createTab("AIMBOT", tabColors[1], 1)
local playerTab = createTab("PLAYER", tabColors[2], 2)
local visualsTab = createTab("VISUALS", tabColors[3], 3)
local settingsTab = createTab("SETTINGS", tabColors[4], 4)

-- Activate first tab
tabs[1].BackgroundColor3 = tabColors[1]
tabs[1].TextColor3 = Color3.fromRGB(255,255,255)
tabContents[1].Visible = true

-- Helper to add items
local function addLabel(parent, text)
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1,0,0,22)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(100,100,130)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = parent
    return lbl
end

local function addSwitch(parent, text, callback)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1,0,0,44)
    row.BackgroundColor3 = Color3.fromRGB(14,14,22)
    row.BorderSizePixel = 0
    row.Parent = parent
    Instance.new("UICorner",row).CornerRadius = UDim.new(0,10)
    Instance.new("UIStroke",row).Color = Color3.fromRGB(25,25,40)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1,-60,1,0)
    lbl.Position = UDim2.new(0,12,0,0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = Color3.fromRGB(210,210,225)
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local togBg = Instance.new("TextButton")
    togBg.Size = UDim2.new(0,46,0,26)
    togBg.Position = UDim2.new(1,-56,0.5,-13)
    togBg.BackgroundColor3 = Color3.fromRGB(30,30,45)
    togBg.BorderSizePixel = 0
    togBg.Text = ""
    togBg.AutoButtonColor = false
    togBg.Parent = row
    Instance.new("UICorner",togBg).CornerRadius = UDim.new(0,13)

    local togCircle = Instance.new("Frame")
    togCircle.Size = UDim2.new(0,20,0,20)
    togCircle.Position = UDim2.new(0,3,0.5,-10)
    togCircle.BackgroundColor3 = Color3.fromRGB(100,100,120)
    togCircle.BorderSizePixel = 0
    togCircle.Parent = togBg
    Instance.new("UICorner",togCircle).CornerRadius = UDim.new(0,10)

    local on = false
    togBg.MouseButton1Click:Connect(function()
        on = not on
        if on then
            TweenService:Create(togBg,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(220,0,0)}):Play()
            TweenService:Create(togCircle,TweenInfo.new(0.2),{Position=UDim2.new(1,-23,0.5,-10),BackgroundColor3=Color3.fromRGB(255,255,255)}):Play()
        else
            TweenService:Create(togBg,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(30,30,45)}):Play()
            TweenService:Create(togCircle,TweenInfo.new(0.2),{Position=UDim2.new(0,3,0.5,-10),BackgroundColor3=Color3.fromRGB(100,100,120)}):Play()
        end
        callback(on)
    end)
    return row
end

local function addButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,44)
    btn.BackgroundColor3 = Color3.fromRGB(180,0,0)
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = parent
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,10)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.07),{Size=UDim2.new(1,0,0,40)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn,TweenInfo.new(0.07),{Size=UDim2.new(1,0,0,44)}):Play()
    end)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ══ AIMBOT TAB ══
addLabel(aimbotTab, "⚙️  AIMBOT SETTINGS")
local aimbotOn = false
local aimbotFOV = 150
local aimbotSmooth = 0.3
local aimbotPart = "Head"

addSwitch(aimbotTab, "🎯  Aimbot (Hold Right Click)", function(on)
    aimbotOn = on
    if on then
        notify("SCP HUB","🎯 Aimbot ON! Hold Right Click!",3)
        spawn(function()
            while aimbotOn do
                task.wait()
                pcall(function()
                    if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
                    local cam = workspace.CurrentCamera
                    local closest, closestDist = nil, aimbotFOV
                    for _,p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character then
                            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                            local hum = p.Character:FindFirstChild("Humanoid")
                            if hrp and hum and hum.Health > 0 then
                                local sp, onScreen = cam:WorldToViewportPoint(hrp.Position)
                                if onScreen then
                                    local d = (Vector2.new(sp.X,sp.Y) - Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/2)).Magnitude
                                    if d < closestDist then closestDist=d; closest=p end
                                end
                            end
                        end
                    end
                    if closest and closest.Character then
                        local tp = closest.Character:FindFirstChild(aimbotPart) or closest.Character:FindFirstChild("HumanoidRootPart")
                        if tp then cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, tp.Position), aimbotSmooth) end
                    end
                end)
            end
        end)
    end
end)

addSwitch(aimbotTab, "🔇  Silent Aim", function(on)
    getgenv().silentAim = on
    notify("SCP HUB", on and "🔇 Silent Aim ON!" or "Silent Aim OFF!", 3)
end)

addLabel(aimbotTab, "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

-- ══ PLAYER TAB ══
addLabel(playerTab, "⚙️  PLAYER MODS")
addSwitch(playerTab, "⚡  Speed Hack (100 speed)", function(on)
    getgenv().speedHack = on
    if on then
        spawn(function()
            while getgenv().speedHack do
                pcall(function()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.WalkSpeed = 100
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

addSwitch(playerTab, "🦘  High Jump", function(on)
    getgenv().highJump = on
    spawn(function()
        while getgenv().highJump do
            pcall(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.JumpPower = 100
                end
            end)
            task.wait(0.1)
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    end)
end)

addSwitch(playerTab, "👻  Noclip", function(on)
    getgenv().noclip = on
    if on then
        RunService.Stepped:Connect(function()
            if getgenv().noclip and LocalPlayer.Character then
                for _,p in pairs(LocalPlayer.Character:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
        end)
    end
end)

addSwitch(playerTab, "♾️  Infinite Jump", function(on)
    getgenv().infJump = on
    if on then
        UserInputService.JumpRequest:Connect(function()
            if getgenv().infJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

addSwitch(playerTab, "🌀  Spin (Anti Aim)", function(on)
    getgenv().spinOn = on
    if on then
        spawn(function()
            while getgenv().spinOn do
                pcall(function()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(10),0)
                    end
                end)
                task.wait(0.05)
            end
        end)
    end
end)

-- ══ VISUALS TAB ══
addLabel(visualsTab, "⚙️  VISUALS / ESP")
addSwitch(visualsTab, "📦  Player ESP (Box)", function(on)
    getgenv().espOn = on
    if on then
        spawn(function()
            while getgenv().espOn do
                for _,p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and not hrp:FindFirstChild("SCPBox") then
                            local box = Instance.new("BoxHandleAdornment")
                            box.Name = "SCPBox"
                            box.Adornee = hrp
                            box.AlwaysOnTop = true
                            box.Size = Vector3.new(4,6,2)
                            box.Transparency = 0.5
                            box.Color3 = Color3.fromRGB(220,0,0)
                            box.Parent = hrp
                        end
                    end
                end
                task.wait(0.1)
            end
            for _,p in ipairs(Players:GetPlayers()) do
                if p.Character then
                    local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then local b=hrp:FindFirstChild("SCPBox") if b then b:Destroy() end end
                end
            end
        end)
    end
end)

addSwitch(visualsTab, "✨  Player Chams", function(on)
    for _,p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local ex = p.Character:FindFirstChild("SCPHighlight")
            if on then
                if not ex then
                    local h = Instance.new("SelectionBox")
                    h.Name = "SCPHighlight"
                    h.Adornee = p.Character
                    h.Color3 = Color3.fromRGB(220,0,0)
                    h.LineThickness = 0.05
                    h.SurfaceTransparency = 0.7
                    h.SurfaceColor3 = Color3.fromRGB(220,0,0)
                    h.Parent = p.Character
                end
            else
                if ex then ex:Destroy() end
            end
        end
    end
end)

-- ══ SETTINGS TAB ══
addLabel(settingsTab, "⚙️  SETTINGS")
addSwitch(settingsTab, "🖥️  Low Graphics (FPS Boost)", function(on)
    game.Lighting.GlobalShadows = not on
    game.Lighting.FogEnd = on and 9e9 or 100000
    game.Lighting.Brightness = on and 0 or 2
    settings().Rendering.QualityLevel = on and "Level01" or "Level21"
    if on then
        for _,v in pairs(game:GetDescendants()) do
            pcall(function()
                if v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Lifetime = NumberRange.new(0) end
            end)
        end
    end
    notify("SCP HUB", on and "🖥️ Low Graphics ON!" or "Low Graphics OFF!", 3)
end)

addButton(settingsTab, "🛡️  Anti AFK", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/New%20anti%20afk%20v2"))()
    notify("SCP HUB","🛡️ Anti AFK enabled!",3)
end)

addButton(settingsTab, "📋  Copy Discord Link", function()
    setclipboard("https://discord.gg/nDSy4jdVDc")
    notify("SCP HUB","📋 Discord copied!",3)
end)

addLabel(settingsTab, "👑 Made by TEJAZ • discord.gg/nDSy4jdVDc")

-- Animate in
mainWin.Position = UDim2.new(0.5,-170,1.5,0)
TweenService:Create(mainWin,TweenInfo.new(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
    Position = UDim2.new(0.5,-170,0.5,-280)
}):Play()

task.spawn(function()
    local t=0
    while hubGui.Parent do
        t=t+0.02
        winBorder.Color=Color3.new(0.7+(math.sin(t)+1)/2*0.3,0,0)
        task.wait(0.05)
    end
end)

notify("SCP HUB","⚔️ Rivals Hub loaded! 🔥",4)
