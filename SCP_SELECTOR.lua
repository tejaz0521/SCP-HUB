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
    main_color=Color3.fromRGB(200,20,20),
    title_bar={Color3.fromRGB(220,25,25),Color3.fromRGB(120,5,5)},
    background={Color3.fromRGB(12,3,3)},
    background_transparency=0,
    min_size=Vector2.new(600,280),
    toggle_key=Enum.KeyCode.RightShift,
    can_resize=false
})
injectSCPLogo(winF)

local selTab,_=win:AddTab("🎮  Select Game")
selTab:AddLabel("⚡  𝗦𝗖𝗣 𝗛𝗨𝗕  •  𝗚𝗔𝗠𝗘 𝗦𝗘𝗟𝗘𝗖𝗧𝗢𝗥  ⚡")
selTab:AddLabel("👑  𝗔𝘂𝘁𝗵𝗼𝗿  TEJAZ   💎  𝗩𝗲𝗿𝘀𝗶𝗼𝗻  4.5")
selTab:AddLabel("💬  discord.gg/KDx3D8hARN   🔄  𝗧𝗼𝗴𝗴𝗹𝗲  RightShift")

selTab:AddLabel("━━━━━━━  🏋️  𝗠𝗨𝗦𝗖𝗟𝗘 𝗟𝗘𝗚𝗘𝗡𝗗𝗦  ━━━━━━━")
selTab:AddButton("🆓  𝗟𝗼𝗮𝗱 𝗙𝗥𝗘𝗘 𝗦𝗰𝗿𝗶𝗽𝘁  —  Muscle Legends",function()
    notify("SCP","⚡ Loading...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_PUBLIC_V5.lua",true))() end)
        if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
    end)
end)
selTab:AddButton("💎  𝗟𝗼𝗮𝗱 𝗣𝗔𝗜𝗗 𝗦𝗰𝗿𝗶𝗽𝘁  —  Muscle Legends",function()
    if not isWhitelisted() then notify("SCP","❌ Not whitelisted! Join discord",4); return end
    notify("SCP","💎 Loading PAID...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/moonveil.lua.txt",true))() end)
        if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("━━━━━━━  ⚔️  𝗥𝗜𝗩𝗔𝗟𝗦  ━━━━━━━")
selTab:AddButton("⚔️  𝗟𝗼𝗮𝗱 𝗥𝗶𝘃𝗮𝗹𝘀 𝗦𝗰𝗿𝗶𝗽𝘁",function()
    notify("SCP","⚔️ Loading...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_RIVALS.lua",true))() end)
        if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("━━━━━━━  🏎️  𝗥𝗔𝗖𝗘 𝗖𝗟𝗜𝗖𝗞𝗘𝗥  ━━━━━━━")
selTab:AddButton("🏎️  𝗟𝗼𝗮𝗱 𝗥𝗮𝗰𝗲 𝗖𝗹𝗶𝗰𝗸𝗲𝗿 𝗦𝗰𝗿𝗶𝗽𝘁",function()
    notify("SCP","🏎️ Loading...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_RACECLICKER.lua",true))() end)
        if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("━━━━━━━  🟢  𝗟𝗘𝗚𝗘𝗡𝗗𝗦 𝗢𝗙 𝗦𝗣𝗘𝗘𝗗  ━━━━━━━")
selTab:AddButton("🟢  𝗟𝗼𝗮𝗱 𝗟𝗲𝗴𝗲𝗻𝗱𝘀 𝗼𝗳 𝗦𝗽𝗲𝗲𝗱 𝗦𝗰𝗿𝗶𝗽𝘁",function()
    notify("SCP","🟢 Loading Legends of Speed...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_LEGENDSOFSPEED.lua",true))() end)
        if not ok then notify("SCP","❌ "..tostring(err):sub(1,50),5) end
    end)
end)
selTab:AddLabel("━━━━━━━  💬  𝗟𝗜𝗡𝗞𝗦  ━━━━━━━")
selTab:AddButton("💬  𝗖𝗼𝗽𝘆 𝗗𝗶𝘀𝗰𝗼𝗿𝗱 𝗟𝗶𝗻𝗸",function()
    setclipboard("https://discord.gg/KDx3D8hARN"); notify("SCP","✅ Discord Copied!",3)
end)

selTab:Show()
notify("SCP HUB","✅ 𝗔𝗹𝗹 𝗿𝗲𝗮𝗱𝘆! Choose your game 👑",4)
