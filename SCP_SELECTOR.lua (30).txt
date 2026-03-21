-- SCP HUB SELECTOR | Made by TEJAZ
local Players=game:GetService("Players"); local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP
local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

local BASE = "https://raw.githubusercontent.com/tejaz0521/SCP-HUB/refs/heads/main/"

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()
_G.scpLibrary = library

local win,winF=library:AddWindow("SCP HUB | Game Selector | TEJAZ",{
    main_color=Color3.fromRGB(200,20,20),
    title_bar={Color3.fromRGB(220,25,25),Color3.fromRGB(120,5,5)},
    background={Color3.fromRGB(12,3,3)},
    background_transparency=0,
    min_size=Vector2.new(600,500),
    toggle_key=Enum.KeyCode.RightShift,
    can_resize=true
})

local selTab,_=win:AddTab("Select Game")
selTab:AddLabel("SCP HUB - GAME SELECTOR")
selTab:AddLabel("Author: TEJAZ | Version: 4.5")
selTab:AddLabel("Discord: discord.gg/KDx3D8hARN | Toggle: RightShift")

selTab:AddLabel("--- MUSCLE LEGENDS ---")
selTab:AddButton("Load Muscle Legends - Free Script", function()
    notify("SCP HUB","Loading Muscle Legends...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_PUBLIC_V5.lua",true))() end)
        if not ok then notify("SCP HUB","Error: "..tostring(err):sub(1,50),5) end
    end)
end)
selTab:AddButton("Load Muscle Master - Free Script", function()
    notify("SCP HUB","Loading Muscle Master...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_MUSCLEMASTER.lua",true))() end)
        if not ok then notify("SCP HUB","Error: "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("--- RIVALS ---")
selTab:AddButton("Load Rivals Script", function()
    notify("SCP HUB","Loading Rivals...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_RIVALS.lua",true))() end)
        if not ok then notify("SCP HUB","Error: "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("--- RACE CLICKER ---")
selTab:AddButton("Load Race Clicker Script", function()
    notify("SCP HUB","Loading Race Clicker...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_RACECLICKER.lua",true))() end)
        if not ok then notify("SCP HUB","Error: "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("--- LEGENDS OF SPEED ---")
selTab:AddButton("Load Legends of Speed Script", function()
    notify("SCP HUB","Loading Legends of Speed...",2)
    task.spawn(function()
        pcall(function() winF.Visible=false end)
        local ok,err=pcall(function() loadstring(game:HttpGet(BASE.."SCP_LEGENDSOFSPEED.lua",true))() end)
        if not ok then notify("SCP HUB","Error: "..tostring(err):sub(1,50),5) end
    end)
end)

selTab:AddLabel("--- LINKS ---")
selTab:AddButton("Copy Discord Link", function()
    setclipboard("https://discord.gg/KDx3D8hARN")
    notify("SCP HUB","Discord copied!",3)
end)

selTab:Show()
notify("SCP HUB","All ready! Choose your game | Made by TEJAZ",4)
