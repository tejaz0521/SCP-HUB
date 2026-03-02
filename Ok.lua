-- SCP HUB Complete UI with Custom Looks & Features
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local LP = Players.LocalPlayer

repeat task.wait() until LP and LP.Character

local C = {
    bg = Color3.fromRGB(12, 12, 20),
    panel = Color3.fromRGB(24, 24, 36),
    accent = Color3.fromRGB(255, 50, 160),
    white = Color3.fromRGB(255, 255, 255),
    muted = Color3.fromRGB(150, 150, 150),
    red = Color3.fromRGB(255, 0, 0),
    blue = Color3.fromRGB(0, 120, 255),
    yellow = Color3.fromRGB(255, 200, 0),
}

local function createLabel(parent, text, size, color, font, pos)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = size or UDim2.new(1, 0, 0, 20)
    lbl.Position = pos or UDim2.new(0, 0, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = color or C.white
    lbl.TextSize = 14
    lbl.Font = font or Enum.Font.GothamBlack
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextWrapped = true
    return lbl
end

local function createButton(parent, text, callback, size, pos)
    local btn = Instance.new("TextButton", parent)
    btn.Size = size or UDim2.new(1, 0, 0, 40)
    btn.Position = pos or UDim2.new(0, 0, 0, 0)
    btn.BackgroundColor3 = C.panel
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.TextColor3 = C.white
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    btn.MouseButton1Down:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 36)}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.1), {Size = UDim2.new(1, 0, 0, 40)}):Play()
    end)
    if callback then
        btn.MouseButton1Click:Connect(callback)
    end
    return btn
end

local function createMainUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "SCP_HUB_Main"
    gui.ResetOnSpawn = false
    gui.Parent = LP:WaitForChild("PlayerGui")
    
    -- Main Frame
    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Size = UDim2.new(0, 800, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -400, 0.5, -250)
    mainFrame.BackgroundColor3 = C.bg
    mainFrame.BorderSizePixel = 0
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 20)
    local border = Instance.new("UIStroke", mainFrame)
    border.Color = C.red
    border.Thickness = 3

    -- Top Bar
    local topBar = Instance.new("Frame", mainFrame)
    topBar.Size = UDim2.new(1, 0, 0, 60)
    topBar.BackgroundColor3 = C.panel
    topBar.BorderSizePixel = 0
    Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 20)

    -- Title
    createLabel(topBar, "⚡ SCP HUB", UDim2.new(1, -20, 1, 0), C.white, Enum.Font.GothamBlack, UDim2.new(0, 10, 0, 0))
    
    -- Side Menu
    local menu = Instance.new("Frame", mainFrame)
    menu.Size = UDim2.new(0, 180, 1, -60)
    menu.Position = UDim2.new(0, 0, 0, 60)
    menu.BackgroundColor3 = C.panel
    menu.BorderSizePixel = 0
    Instance.new("UICorner", menu).CornerRadius = UDim.new(0, 15)
    
    -- Buttons for game options
    local menuButtons = {}
    local function addMenuButton(name, callback)
        local btn = createButton(menu, name, callback)
        table.insert(menuButtons, btn)
        return btn
    end

    -- Main Content Frame
    local content = Instance.new("Frame", mainFrame)
    content.Size = UDim2.new(1, -180, 1, -60)
    content.Position = UDim2.new(0, 180, 0, 60)
    content.BackgroundTransparency = 1

    -- Tabs or pages
    local pages = {}
    local function createPage(name)
        local frame = Instance.new("Frame", content)
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundTransparency = 1
        frame.Visible = false
        table.insert(pages, frame)
        return frame
    end

    -- Example pages
    local pageMain = createPage("Main")
    local pageFarm = createPage("Farm")
    local pageSettings = createPage("Settings")
    -- Add more pages as needed

    -- Helper to switch pages
    local function switchPage(index)
        for i, p in ipairs(pages) do
            p.Visible = (i == index)
        end
    end

    -- Create buttons to switch pages
    addMenuButton("Main", function() switchPage(1) end)
    addMenuButton("Farm", function() switchPage(2) end)
    addMenuButton("Settings", function() switchPage(3) end)

    -- Example content in each page
    createLabel(pageMain, "Welcome to SCP HUB!", UDim2.new(1, 0, 0, 30), C.white, Enum.Font.GothamBlack, UDim2.new(0, 10, 0, 10))
    createLabel(pageFarm, "Farm your way to power!", UDim2.new(1, 0, 0, 30), C.white, Enum.Font.GothamBlack, UDim2.new(0, 10, 0, 10))
    createLabel(pageSettings, "Adjust your settings!", UDim2.new(1, 0, 0, 30), C.white, Enum.Font.GothamBlack, UDim2.new(0, 10, 0, 10))
    
    -- Animate in the main frame
    mainFrame.Position = UDim2.new(0.5, -400, 0.5, -250)
    TweenService:Create(mainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -400, 0.5, -250)
    }):Play()

    -- Set initial page
    switchPage(1)
end

createMainUI()
