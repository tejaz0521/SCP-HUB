-- ⚡ SCP HUB SELECTOR | Made by TEJAZ
local Players=game:GetService("Players"); local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP
local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

local BASE   = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/main/"
local WL_URL = "https://pastebin.com/raw/RULnktcp"

local function isWhitelisted()
    local ok,res=pcall(function()return game:HttpGet(WL_URL,true)end)
    if not ok then return false end
    local name=LP.Name:lower()
    for line in res:gmatch("[^\n]+")do if line:match("^%s*(.-)%s*$"):lower()==name then return true end end
    return false
end

-- Load library once, store globally so sub-scripts reuse it
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/imhenne187/SilenceElerium/refs/heads/main/src/SilenceEleriumLibrary.luau", true))()
_G.scpLibrary = library

-- SCP logo injector
local function patchBar(bar)
    task.spawn(function()
        local tog
        for i=1,20 do tog=bar:FindFirstChild("Toggle"); if tog then break end; task.wait(0.05) end
        if not tog then return end
        pcall(function()
            tog.Image="rbxassetid://3926305904"
            tog.ImageColor3=Color3.fromRGB(255,60,60)
            tog.Size=UDim2.new(0,18,0,18)
            local ex=bar:FindFirstChild("SCPLogo"); if ex then ex:Destroy() end
            local lbl=Instance.new("TextLabel")
            lbl.Name="SCPLogo"; lbl.Size=UDim2.new(0,32,0,14)
            lbl.Position=UDim2.new(0,22,0,2); lbl.BackgroundTransparency=1
            lbl.Text="SCP"; lbl.TextColor3=Color3.fromRGB(255,80,80)
            lbl.TextSize=11; lbl.Font=Enum.Font.FredokaOne
            lbl.ZIndex=tog.ZIndex+1; lbl.Parent=bar
        end)
    end)
end

local function injectSCPLogo(wFrame)
    task.spawn(function()
        local bar
        for i=1,60 do bar=wFrame:FindFirstChild("Bar"); if bar then break end; task.wait(0.05) end
        if bar then patchBar(bar) end
    end)
end
_G.injectSCPLogo = injectSCPLogo

-- Auto-patch ALL new windows (key windows, main windows)
local function watchForBars(parent)
    parent.DescendantAdded:Connect(function(d)
        if d.Name == "Bar" then patchBar(d) end
    end)
end
pcall(function() watchForBars(game:GetService("CoreGui")) end)
pcall(function() watchForBars(game:GetService("Players").LocalPlayer.PlayerGui) end)

-- Main selector window
local win,winF=library:AddWindow("⚡ SCP HUB  |  Game Selector  |  TEJAZ",{
    main_color=Color3.fromRGB(185,30,30),
    title_bar={Color3.fromRGB(200,35,35),Color3.fromRGB(100,10,10)},
    background={Color3.fromRGB(18,5,5)},
    background_transparency=0,
    min_size=Vector2.new(600,280),
    toggle_key=Enum.KeyCode.RightShift,
    can_resize=false
})
injectSCPLogo(winF)

local selTab,_=win:AddTab("🎮  Select Game")
selTab:AddLabel("━━━━━━━  ⚡ SCP HUB SELECTOR  ━━━━━━━")
selTab:AddLabel("👑  Made by TEJAZ  |  💎  Version 4.5")
selTab:AddLabel("💬  discord.gg/nDSy4jdVDc  |  🔄 RShift toggle")

selTab:AddLabel("━━━━━━━  🏋️ MUSCLE LEGENDS  ━━━━━━━")
selTab:AddButton("🆓  Load FREE Script (Muscle Legends)",function()
    notify("SCP","⚡ Loading...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_PUBLIC_V5.lua",true))() end)
        if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
    end)
end)
selTab:AddButton("💎  Load PAID Script (Muscle Legends)",function()
    if not isWhitelisted() then notify("SCP","❌ Not whitelisted! Join discord",4); return end
    notify("SCP","💎 Loading PAID...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/jc3GPmRY",true))() end)
        if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("━━━━━━━  ⚔️ RIVALS  ━━━━━━━")
selTab:AddButton("⚔️  Load Rivals Script",function()
    notify("SCP","⚔️ Loading...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_RIVALS.lua",true))() end)
        if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("━━━━━━━  🏎️ RACE CLICKER  ━━━━━━━")
selTab:AddButton("🏎️  Load Race Clicker Script",function()
    notify("SCP","🏎️ Loading...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_RACECLICKER.lua",true))() end)
        if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("━━━━━━━  💬 LINKS  ━━━━━━━")
selTab:AddButton("💬  Copy Discord Link",function()
    setclipboard("https://discord.gg/nDSy4jdVDc"); notify("SCP","✅ Copied!",3)
end)

selTab:Show()
notify("SCP HUB","✅ All ready! Choose your game 👑",4)
