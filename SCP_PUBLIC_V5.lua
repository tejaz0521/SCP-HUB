-- ╔══════════════════════════════════════════════════╗
--    ⚡  SCP HUB  |  MUSCLE LEGENDS  PUBLIC V5  ⚡
--    👑 Made by TEJAZ  |  discord.gg/nDSy4jdVDc
--    🔥 ZERO LIBRARY — PURE ELITE GUI
-- ╚══════════════════════════════════════════════════╝

local Players    = game:GetService("Players")
local RS         = game:GetService("ReplicatedStorage")
local RunSvc     = game:GetService("RunService")
local SG         = game:GetService("StarterGui")
local TS         = game:GetService("TweenService")
local LP         = Players.LocalPlayer
repeat task.wait() until LP and LP.Character

-- ═══════════════════════════════════
-- 🎨 ELITE COLOUR SYSTEM
-- ═══════════════════════════════════
local C = {
    bg      = Color3.fromRGB(8,  8,  14),
    panel   = Color3.fromRGB(13, 13, 22),
    card    = Color3.fromRGB(16, 16, 28),
    cardH   = Color3.fromRGB(21, 21, 36),
    border  = Color3.fromRGB(32, 32, 55),
    white   = Color3.fromRGB(255,255,255),
    off     = Color3.fromRGB(160,160,195),
    muted   = Color3.fromRGB(65, 65, 100),
    red     = Color3.fromRGB(230, 30,  30),
    redD    = Color3.fromRGB(140, 0,   0),
    orange  = Color3.fromRGB(255,130,  0),
    blue    = Color3.fromRGB( 0, 140, 255),
    blueD   = Color3.fromRGB( 0,  80, 180),
    green   = Color3.fromRGB( 0, 210,  90),
    greenD  = Color3.fromRGB( 0, 130,  55),
    amber   = Color3.fromRGB(255,180,  0),
    pink    = Color3.fromRGB(210,  0, 120),
    teal    = Color3.fromRGB( 0, 190, 190),
    purple  = Color3.fromRGB(140, 50, 255),
}

-- ═══════════════════════════════════
-- 🔧 HELPERS
-- ═══════════════════════════════════
local function notify(t,m,d) SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end
local function fmt(n) n=tonumber(n) or 0; if n>=1e12 then return ("%.1fT"):format(n/1e12) elseif n>=1e9 then return ("%.1fB"):format(n/1e9) elseif n>=1e6 then return ("%.1fM"):format(n/1e6) elseif n>=1e3 then return ("%.1fK"):format(n/1e3) else return tostring(math.floor(n)) end end
local function findPlayer(q) if not q or q=="" then return LP end; local l=q:lower(); for _,p in ipairs(Players:GetPlayers()) do if p.Name:lower()==l or (p.DisplayName and p.DisplayName:lower()==l) then return p end end; for _,p in ipairs(Players:GetPlayers()) do if p.Name:lower():find(l,1,true) or (p.DisplayName and p.DisplayName:lower():find(l,1,true)) then return p end end end
local function cr(i,r) Instance.new("UICorner",i).CornerRadius=UDim.new(0,r or 12) end
local function ms(i,c,t) local s=Instance.new("UIStroke",i); s.Color=c; s.Thickness=t or 1.5; return s end
local function fixRound(parent, col) local f=Instance.new("Frame",parent); f.Size=UDim2.new(1,0,0.5,0); f.Position=UDim2.new(0,0,0.5,0); f.BackgroundColor3=col; f.BorderSizePixel=0 end
local function getPunch() local p=LP.Backpack:FindFirstChild("Punch"); if p and LP.Character then p.Parent=LP.Character end; return LP.Character and LP.Character:FindFirstChild("Punch") end

-- ═══════════════════════════════════
-- 🔥 LOADING SCREEN
-- ═══════════════════════════════════
local function runLoadScreen()
    local g=Instance.new("ScreenGui"); g.Name="SCPLoad_V5"; g.ResetOnSpawn=false; g.DisplayOrder=9999; g.Parent=LP:WaitForChild("PlayerGui")
    local ov=Instance.new("Frame",g); ov.Size=UDim2.new(1,0,1,0); ov.BackgroundColor3=Color3.fromRGB(0,0,0); ov.BackgroundTransparency=0; ov.BorderSizePixel=0

    local card=Instance.new("Frame",g); card.Size=UDim2.new(0,320,0,380); card.BackgroundColor3=C.bg; card.BorderSizePixel=0; cr(card,26)
    local bdr=ms(card,C.red,2.5)
    -- Top gradient strip (simulate with 3 thin frames)
    for i,col in ipairs({C.red,Color3.fromRGB(200,60,0),Color3.fromRGB(160,0,80)}) do
        local f=Instance.new("Frame",card); f.Size=UDim2.new(0.34,0,0,3)
        f.Position=UDim2.new((i-1)*0.33,0,0,0); f.BackgroundColor3=col; f.BorderSizePixel=0; f.ZIndex=3
    end

    -- Header bg
    local hdr=Instance.new("Frame",card); hdr.Size=UDim2.new(1,0,0,160); hdr.BackgroundColor3=C.panel; hdr.BorderSizePixel=0; cr(hdr,26); fixRound(hdr,C.panel)

    -- Glow
    local gImg=Instance.new("ImageLabel",hdr); gImg.Size=UDim2.new(0,140,0,140); gImg.Position=UDim2.new(0.5,-70,0,-22); gImg.BackgroundTransparency=1; gImg.Image="rbxassetid://7072725342"; gImg.ImageColor3=C.red; gImg.ImageTransparency=0.72; gImg.ZIndex=2
    -- Logo
    local logo=Instance.new("ImageLabel",card); logo.Size=UDim2.new(0,88,0,88); logo.Position=UDim2.new(0.5,-44,0,10); logo.BackgroundTransparency=1; logo.Image="rbxassetid://125515680929159"; logo.ScaleType=Enum.ScaleType.Fit; logo.ZIndex=4

    local function clbl(txt,y,sz,col,font)
        local l=Instance.new("TextLabel",card); l.Size=UDim2.new(1,0,0,sz+4); l.Position=UDim2.new(0,0,0,y); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.white; l.TextSize=sz or 14; l.Font=font or Enum.Font.GothamBlack; return l
    end
    clbl("⚡  SCP  HUB  ⚡",105,24,C.white)
    clbl("🆓 PUBLIC V5  •  MUSCLE LEGENDS  •  FREE",133,11,C.red,Enum.Font.GothamBold)

    -- Bar bg
    local bbg=Instance.new("Frame",card); bbg.Size=UDim2.new(1,-36,0,8); bbg.Position=UDim2.new(0,18,0,194); bbg.BackgroundColor3=C.card; bbg.BorderSizePixel=0; cr(bbg,6)
    local bfill=Instance.new("Frame",bbg); bfill.Size=UDim2.new(0,0,1,0); bfill.BackgroundColor3=C.red; bfill.BorderSizePixel=0; cr(bfill,6)

    local stLbl=clbl("⏳ Initializing...",210,11,C.off,Enum.Font.GothamBold)
    local pctLbl=clbl("0%",228,13,C.red,Enum.Font.GothamBlack)
    clbl("👑 Made by TEJAZ  •  discord.gg/nDSy4jdVDc",265,10,C.muted,Enum.Font.GothamBold)

    -- Version badge
    local vBg=Instance.new("Frame",card); vBg.Size=UDim2.new(0,0,0,22); vBg.Position=UDim2.new(0.5,0,0,282); vBg.BackgroundColor3=C.redD; vBg.BorderSizePixel=0; vBg.AutomaticSize=Enum.AutomaticSize.X; vBg.AnchorPoint=Vector2.new(0.5,0); cr(vBg,8)
    local vL=Instance.new("TextLabel",vBg); vL.Size=UDim2.new(0,0,1,0); vL.BackgroundTransparency=1; vL.Text="  🔥 V5 • FREE  "; vL.TextColor3=C.white; vL.TextSize=10; vL.Font=Enum.Font.GothamBold; vL.AutomaticSize=Enum.AutomaticSize.X

    -- Slide in
    card.Position=UDim2.new(0.5,-160,1.5,0)
    TS:Create(card,TweenInfo.new(0.65,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-160,0.5,-190)}):Play()

    task.spawn(function() local t=0; while g.Parent do t=t+0.025; bdr.Color=Color3.new(0.88+(math.sin(t)+1)/2*0.12,(math.sin(t)+1)/2*0.1,0); task.wait(0.05) end end)
    task.spawn(function() while g.Parent do TS:Create(logo,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,96,0,96)}):Play(); task.wait(1); TS:Create(logo,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,88,0,88)}):Play(); task.wait(1) end end)

    local steps={{0.15,"⚡ Connecting to servers...","15%"},{0.35,"🔐 Verifying key...","35%"},{0.55,"📦 Loading features...","55%"},{0.75,"🎨 Building interface...","75%"},{0.9,"✅ Almost ready...","90%"},{1,"🔥 Launching SCP HUB!","100%"}}
    for _,s in ipairs(steps) do
        TS:Create(bfill,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(s[1],0,1,0)}):Play()
        stLbl.Text=s[2]; pctLbl.Text=s[3]
        if s[1]>=1 then pctLbl.TextColor3=C.green; bfill.BackgroundColor3=C.green; bdr.Color=C.green end
        task.wait(0.5)
    end
    task.wait(0.35)
    TS:Create(ov,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
    TS:Create(card,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Position=UDim2.new(0.5,-160,1.5,0)}):Play()
    task.wait(0.45); g:Destroy()
end
runLoadScreen()

-- Corner logo
local cG=Instance.new("ScreenGui"); cG.Name="SCPLogo_V5"; cG.ResetOnSpawn=false; cG.DisplayOrder=9998; cG.Parent=LP:WaitForChild("PlayerGui")
local cImg=Instance.new("ImageLabel",cG); cImg.Size=UDim2.new(0,52,0,52); cImg.Position=UDim2.new(0,6,0,6); cImg.BackgroundTransparency=1; cImg.Image="rbxassetid://125515680929159"; cImg.ScaleType=Enum.ScaleType.Fit

-- ═══════════════════════════════════
-- 🔑 KEY SYSTEM
-- ═══════════════════════════════════
local KEY_URL = "https://pastebin.com/raw/n7UWskEA"
local function getKeys() local ok,res=pcall(function() return game:HttpGet(KEY_URL) end); if not ok then return {} end; local k={}; for v in res:gmatch("[^\n]+") do local t=v:match("^%s*(.-)%s*$"); if t~="" then table.insert(k,t) end end; return k end
local function checkKey(e) for _,v in pairs(getKeys()) do if v==e then return true end end; return false end

local kG=Instance.new("ScreenGui"); kG.Name="SCPKey_V5"; kG.ResetOnSpawn=false; kG.DisplayOrder=500; kG.Parent=LP:WaitForChild("PlayerGui")
local kOv=Instance.new("Frame",kG); kOv.Size=UDim2.new(1,0,1,0); kOv.BackgroundColor3=Color3.fromRGB(0,0,0); kOv.BackgroundTransparency=0.4; kOv.BorderSizePixel=0

-- Key Card
local kCard=Instance.new("Frame",kG); kCard.Size=UDim2.new(0,330,0,460); kCard.BackgroundColor3=C.bg; kCard.BorderSizePixel=0; cr(kCard,26)
local kBdr=ms(kCard,C.red,2.5)

-- Tri-colour top strip
for i,col in ipairs({C.red,Color3.fromRGB(200,50,0),Color3.fromRGB(150,0,100)}) do
    local f=Instance.new("Frame",kCard); f.Size=UDim2.new(0.34,0,0,3); f.Position=UDim2.new((i-1)*0.33,0,0,0); f.BackgroundColor3=col; f.BorderSizePixel=0; f.ZIndex=3
end

-- Header
local kHdr=Instance.new("Frame",kCard); kHdr.Size=UDim2.new(1,0,0,158); kHdr.BackgroundColor3=C.panel; kHdr.BorderSizePixel=0; cr(kHdr,26); fixRound(kHdr,C.panel)
local kGlow=Instance.new("ImageLabel",kHdr); kGlow.Size=UDim2.new(0,160,0,160); kGlow.Position=UDim2.new(0.5,-80,0,-30); kGlow.BackgroundTransparency=1; kGlow.Image="rbxassetid://7072725342"; kGlow.ImageColor3=C.red; kGlow.ImageTransparency=0.7; kGlow.ZIndex=2
local kLogo=Instance.new("ImageLabel",kCard); kLogo.Size=UDim2.new(0,84,0,84); kLogo.Position=UDim2.new(0.5,-42,0,11); kLogo.BackgroundTransparency=1; kLogo.Image="rbxassetid://125515680929159"; kLogo.ScaleType=Enum.ScaleType.Fit; kLogo.ZIndex=4

local function klbl(txt,y,sz,col,font)
    local l=Instance.new("TextLabel",kCard); l.Size=UDim2.new(1,0,0,sz+4); l.Position=UDim2.new(0,0,0,y); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.white; l.TextSize=sz or 14; l.Font=font or Enum.Font.GothamBlack; return l
end
klbl("⚡  SCP  HUB  ⚡",100,22,C.white)
klbl("🔑 KEY SYSTEM  •  MUSCLE LEGENDS",127,11,C.red,Enum.Font.GothamBold)

-- Info strip
local kInfo=Instance.new("Frame",kCard); kInfo.Size=UDim2.new(1,-24,0,44); kInfo.Position=UDim2.new(0,12,0,155); kInfo.BackgroundColor3=C.card; kInfo.BorderSizePixel=0; cr(kInfo,12); ms(kInfo,C.border,1)
local kInfoL=Instance.new("TextLabel",kInfo); kInfoL.Size=UDim2.new(1,-16,1,0); kInfoL.Position=UDim2.new(0,8,0,0); kInfoL.BackgroundTransparency=1; kInfoL.Text="🔑 Get your FREE key at discord.gg/nDSy4jdVDc — Key: SCPONTOP"; kInfoL.TextColor3=C.off; kInfoL.TextSize=11; kInfoL.Font=Enum.Font.Gotham; kInfoL.TextWrapped=true

klbl("ENTER YOUR KEY",208,10,C.muted,Enum.Font.GothamBold)

-- Input
local kIBg=Instance.new("Frame",kCard); kIBg.Size=UDim2.new(1,-24,0,52); kIBg.Position=UDim2.new(0,12,0,224); kIBg.BackgroundColor3=C.card; kIBg.BorderSizePixel=0; cr(kIBg,14)
local kIS=ms(kIBg,C.border,1.5)
local kInput=Instance.new("TextBox",kIBg); kInput.Size=UDim2.new(1,-18,1,0); kInput.Position=UDim2.new(0,9,0,0); kInput.BackgroundTransparency=1; kInput.Text=""; kInput.PlaceholderText="  Paste or type key here..."; kInput.PlaceholderColor3=C.muted; kInput.TextColor3=C.white; kInput.TextSize=15; kInput.Font=Enum.Font.GothamBold; kInput.ClearTextOnFocus=false

local kStatus=klbl("",285,12,C.red,Enum.Font.GothamBold)

-- Submit btn
local kBtn=Instance.new("TextButton",kCard); kBtn.Size=UDim2.new(1,-24,0,52); kBtn.Position=UDim2.new(0,12,0,308); kBtn.BackgroundColor3=C.red; kBtn.BorderSizePixel=0; kBtn.Text="✅  UNLOCK SCRIPT"; kBtn.TextColor3=C.white; kBtn.TextSize=16; kBtn.Font=Enum.Font.GothamBlack; kBtn.AutoButtonColor=false; cr(kBtn,14)

-- Discord btn
local kDisc=Instance.new("TextButton",kCard); kDisc.Size=UDim2.new(1,-24,0,38); kDisc.Position=UDim2.new(0,12,0,374); kDisc.BackgroundColor3=C.card; kDisc.BorderSizePixel=0; kDisc.Text="💬  Get Key FREE  •  discord.gg/nDSy4jdVDc"; kDisc.TextColor3=C.blue; kDisc.TextSize=11; kDisc.Font=Enum.Font.GothamBold; kDisc.AutoButtonColor=false; cr(kDisc,12); ms(kDisc,C.blueD,1)
kDisc.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/nDSy4jdVDc"); kStatus.Text="✅ Discord copied!"; kStatus.TextColor3=C.green end)

-- Animate
kCard.Position=UDim2.new(0.5,-165,1.5,0)
TS:Create(kCard,TweenInfo.new(0.65,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-165,0.5,-230)}):Play()
task.spawn(function() local t=0; while kG.Parent do t=t+0.025; kBdr.Color=Color3.new(0.88+(math.sin(t)+1)/2*0.12,(math.sin(t)+1)/2*0.1,0); task.wait(0.05) end end)
task.spawn(function() while kG.Parent do TS:Create(kLogo,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,92,0,92)}):Play(); task.wait(1); TS:Create(kLogo,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,84,0,84)}):Play(); task.wait(1) end end)

kBtn.MouseButton1Down:Connect(function() TS:Create(kBtn,TweenInfo.new(0.07),{Size=UDim2.new(1,-24,0,47)}):Play() end)
kBtn.MouseButton1Up:Connect(function() TS:Create(kBtn,TweenInfo.new(0.07),{Size=UDim2.new(1,-24,0,52)}):Play() end)

local keyPassed=false
local function verify()
    local e=kInput.Text:match("^%s*(.-)%s*$"); kStatus.TextColor3=C.amber; kStatus.Text="⏳ Checking key..."
    task.spawn(function()
        if checkKey(e) then
            kStatus.TextColor3=C.green; kStatus.Text="✅ Key accepted! Loading..."
            kBtn.BackgroundColor3=C.greenD; kIS.Color=C.green; kBdr.Color=C.green
            task.wait(1.2); kG:Destroy(); keyPassed=true
        else
            kStatus.TextColor3=C.red; kStatus.Text="❌ Wrong key — Get it at discord.gg/nDSy4jdVDc"
            kIS.Color=C.red
            for i=1,4 do TS:Create(kCard,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-153,0.5,-230)}):Play(); task.wait(0.04); TS:Create(kCard,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-177,0.5,-230)}):Play(); task.wait(0.04) end
            TS:Create(kCard,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-165,0.5,-230)}):Play()
            task.wait(0.4); kIS.Color=C.border
        end
    end)
end
kBtn.MouseButton1Click:Connect(verify)
kInput.FocusLost:Connect(function(e) if e then verify() end end)
repeat task.wait() until keyPassed

-- ═══════════════════════════════════
-- 🎮 MAIN HUB — ELITE DESIGN
-- ═══════════════════════════════════
local WIN_W, WIN_H = 420, 620

local hubG=Instance.new("ScreenGui"); hubG.Name="SCPHub_ML_V5"; hubG.ResetOnSpawn=false; hubG.DisplayOrder=100; hubG.Parent=LP:WaitForChild("PlayerGui")

local mWin=Instance.new("Frame",hubG); mWin.Size=UDim2.new(0,WIN_W,0,WIN_H); mWin.Position=UDim2.new(0.5,-WIN_W/2,1.5,0); mWin.BackgroundColor3=C.bg; mWin.BorderSizePixel=0; mWin.Active=true; mWin.Draggable=true; cr(mWin,22)
local mBdr=ms(mWin,C.red,2)

-- Tri-colour top strip
for i,col in ipairs({C.red,Color3.fromRGB(200,50,0),Color3.fromRGB(150,0,100)}) do
    local f=Instance.new("Frame",mWin); f.Size=UDim2.new(0.34,0,0,3); f.Position=UDim2.new((i-1)*0.33,0,0,0); f.BackgroundColor3=col; f.BorderSizePixel=0; f.ZIndex=4
end

-- ── TITLE BAR ──────────────────────────────────────
local tBar=Instance.new("Frame",mWin); tBar.Size=UDim2.new(1,0,0,54); tBar.BackgroundColor3=C.panel; tBar.BorderSizePixel=0; cr(tBar,22); fixRound(tBar,C.panel)

local tLogo=Instance.new("ImageLabel",tBar); tLogo.Size=UDim2.new(0,36,0,36); tLogo.Position=UDim2.new(0,8,0.5,-18); tLogo.BackgroundTransparency=1; tLogo.Image="rbxassetid://125515680929159"; tLogo.ScaleType=Enum.ScaleType.Fit
local tTitle=Instance.new("TextLabel",tBar); tTitle.Size=UDim2.new(1,-110,1,0); tTitle.Position=UDim2.new(0,50,0,0); tTitle.BackgroundTransparency=1; tTitle.Text="⚡ SCP HUB  •  💪 "..LP.DisplayName; tTitle.TextColor3=C.white; tTitle.TextSize=13; tTitle.Font=Enum.Font.GothamBlack; tTitle.TextXAlignment=Enum.TextXAlignment.Left

-- User badge
local uBadge=Instance.new("Frame",tBar); uBadge.Size=UDim2.new(0,0,0,20); uBadge.Position=UDim2.new(0,50,1,-22); uBadge.BackgroundColor3=C.redD; uBadge.BorderSizePixel=0; uBadge.AutomaticSize=Enum.AutomaticSize.X; cr(uBadge,6)
local uBL=Instance.new("TextLabel",uBadge); uBL.Size=UDim2.new(0,0,1,0); uBL.BackgroundTransparency=1; uBL.Text="  🔥 PUBLIC V5  "; uBL.TextColor3=C.white; uBL.TextSize=9; uBL.Font=Enum.Font.GothamBold; uBL.AutomaticSize=Enum.AutomaticSize.X

local minBtn=Instance.new("TextButton",tBar); minBtn.Size=UDim2.new(0,30,0,30); minBtn.Position=UDim2.new(1,-72,0.5,-15); minBtn.BackgroundColor3=C.card; minBtn.BorderSizePixel=0; minBtn.Text="—"; minBtn.TextColor3=C.off; minBtn.TextSize=13; minBtn.Font=Enum.Font.GothamBold; minBtn.AutoButtonColor=false; cr(minBtn,8)
local closeBtn=Instance.new("TextButton",tBar); closeBtn.Size=UDim2.new(0,30,0,30); closeBtn.Position=UDim2.new(1,-38,0.5,-15); closeBtn.BackgroundColor3=C.red; closeBtn.BorderSizePixel=0; closeBtn.Text="✕"; closeBtn.TextColor3=C.white; closeBtn.TextSize=13; closeBtn.Font=Enum.Font.GothamBold; closeBtn.AutoButtonColor=false; cr(closeBtn,8)
closeBtn.MouseButton1Click:Connect(function() hubG:Destroy(); cG:Destroy() end)

-- ── CONTENT ────────────────────────────────────────
local cH=Instance.new("Frame",mWin); cH.Size=UDim2.new(1,0,1,-54); cH.Position=UDim2.new(0,0,0,54); cH.BackgroundTransparency=1; cH.BorderSizePixel=0

-- Minimize
local isMin=false
minBtn.MouseButton1Click:Connect(function()
    isMin=not isMin
    if isMin then TS:Create(mWin,TweenInfo.new(0.25),{Size=UDim2.new(0,WIN_W,0,54)}):Play(); cH.Visible=false; minBtn.Text="+"
    else TS:Create(mWin,TweenInfo.new(0.25),{Size=UDim2.new(0,WIN_W,0,WIN_H)}):Play(); cH.Visible=true; minBtn.Text="—" end
end)

-- ── TAB SCROLL BAR ─────────────────────────────────
local tScroll=Instance.new("ScrollingFrame",cH); tScroll.Size=UDim2.new(1,-16,0,34); tScroll.Position=UDim2.new(0,8,0,6); tScroll.BackgroundColor3=C.panel; tScroll.BorderSizePixel=0; tScroll.ScrollBarThickness=0; tScroll.ScrollingDirection=Enum.ScrollingDirection.X; tScroll.CanvasSize=UDim2.new(0,1200,0,0); cr(tScroll,10)
local tLL=Instance.new("UIListLayout",tScroll); tLL.FillDirection=Enum.FillDirection.Horizontal; tLL.Padding=UDim.new(0,4); tLL.VerticalAlignment=Enum.VerticalAlignment.Center
local tPad=Instance.new("UIPadding",tScroll); tPad.PaddingLeft=UDim.new(0,4); tPad.PaddingRight=UDim.new(0,4)

-- ── CONTENT AREA ───────────────────────────────────
local cArea=Instance.new("Frame",cH); cArea.Size=UDim2.new(1,-16,1,-48); cArea.Position=UDim2.new(0,8,0,46); cArea.BackgroundColor3=C.card; cArea.BorderSizePixel=0; cr(cArea,14); ms(cArea,C.border,1)

-- ── TAB DEFINITIONS ────────────────────────────────
local TABS={
    {n="📋 INFO",    c=C.red},
    {n="📊 STATS",   c=C.blue},
    {n="💪 MAIN",    c=C.green},
    {n="🔄 REBIRTH", c=C.amber},
    {n="⚔️ KILLS",   c=C.pink},
    {n="🪨 ROCKS",   c=C.purple},
    {n="🌀 TELE",    c=C.teal},
    {n="⚙️ SETUP",   c=Color3.fromRGB(90,90,170)},
    {n="🎁 GIFT",    c=C.orange},
}

local tBtns={}; local tPages={}

for i,t in ipairs(TABS) do
    local btn=Instance.new("TextButton",tScroll); btn.Size=UDim2.new(0,86,0,26); btn.BackgroundColor3=C.bg; btn.BorderSizePixel=0; btn.Text=t.n; btn.TextColor3=C.muted; btn.TextSize=9; btn.Font=Enum.Font.GothamBold; btn.LayoutOrder=i; btn.AutoButtonColor=false; cr(btn,8)

    local page=Instance.new("ScrollingFrame",cArea); page.Size=UDim2.new(1,0,1,0); page.BackgroundTransparency=1; page.BorderSizePixel=0; page.ScrollBarThickness=3; page.ScrollBarImageColor3=t.c; page.CanvasSize=UDim2.new(0,0,0,0); page.Visible=false
    local ul=Instance.new("UIListLayout",page); ul.Padding=UDim.new(0,6); ul.SortOrder=Enum.SortOrder.LayoutOrder
    local pd=Instance.new("UIPadding",page); pd.PaddingLeft=UDim.new(0,8); pd.PaddingRight=UDim.new(0,8); pd.PaddingTop=UDim.new(0,8)
    ul:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() page.CanvasSize=UDim2.new(0,0,0,ul.AbsoluteContentSize.Y+16) end)

    btn.MouseButton1Click:Connect(function()
        for _,p in ipairs(tPages) do p.Visible=false end
        for _,b in ipairs(tBtns) do b.BackgroundColor3=C.bg; b.TextColor3=C.muted end
        page.Visible=true; btn.BackgroundColor3=t.c; btn.TextColor3=C.white
    end)
    table.insert(tBtns,btn); table.insert(tPages,page)
end

-- Activate INFO by default
tBtns[1].BackgroundColor3=TABS[1].c; tBtns[1].TextColor3=C.white; tPages[1].Visible=true
local iP,stP,mP,rP,kP,rkP,tpP,seP,gP=tPages[1],tPages[2],tPages[3],tPages[4],tPages[5],tPages[6],tPages[7],tPages[8],tPages[9]

-- ── UI ELEMENT BUILDERS ────────────────────────────
local function sec(page,txt,col)
    local f=Instance.new("Frame",page); f.Size=UDim2.new(1,0,0,28); f.BackgroundColor3=Color3.fromRGB(12,12,22); f.BorderSizePixel=0; cr(f,8)
    -- Left colour accent
    local a=Instance.new("Frame",f); a.Size=UDim2.new(0,3,0.6,0); a.Position=UDim2.new(0,0,0.2,0); a.BackgroundColor3=col or C.red; a.BorderSizePixel=0; cr(a,3)
    local l=Instance.new("TextLabel",f); l.Size=UDim2.new(1,-16,1,0); l.Position=UDim2.new(0,12,0,0); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.red; l.TextSize=11; l.Font=Enum.Font.GothamBlack; l.TextXAlignment=Enum.TextXAlignment.Left
    return f
end

local function lbl2(page,txt,col)
    local l=Instance.new("TextLabel",page); l.Size=UDim2.new(1,0,0,0); l.AutomaticSize=Enum.AutomaticSize.Y; l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.off; l.TextSize=11; l.Font=Enum.Font.GothamBold; l.TextXAlignment=Enum.TextXAlignment.Left; l.TextWrapped=true; return l
end

local function div(page)
    local d=Instance.new("Frame",page); d.Size=UDim2.new(1,0,0,1); d.BackgroundColor3=C.border; d.BorderSizePixel=0
end

local function tog(page,txt,cb,col)
    local col=col or C.red
    local row=Instance.new("Frame",page); row.Size=UDim2.new(1,0,0,48); row.BackgroundColor3=C.card; row.BorderSizePixel=0; cr(row,12); ms(row,C.border,1)
    local stripe=Instance.new("Frame",row); stripe.Size=UDim2.new(0,3,0.5,0); stripe.Position=UDim2.new(0,0,0.25,0); stripe.BackgroundColor3=col; stripe.BackgroundTransparency=1; stripe.BorderSizePixel=0; cr(stripe,3)
    local l=Instance.new("TextLabel",row); l.Size=UDim2.new(1,-62,1,0); l.Position=UDim2.new(0,12,0,0); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=C.off; l.TextSize=12; l.Font=Enum.Font.GothamBold; l.TextXAlignment=Enum.TextXAlignment.Left; l.TextWrapped=true
    local bg=Instance.new("TextButton",row); bg.Size=UDim2.new(0,48,0,26); bg.Position=UDim2.new(1,-56,0.5,-13); bg.BackgroundColor3=Color3.fromRGB(24,24,42); bg.BorderSizePixel=0; bg.Text=""; bg.AutoButtonColor=false; cr(bg,13)
    local ci=Instance.new("Frame",bg); ci.Size=UDim2.new(0,20,0,20); ci.Position=UDim2.new(0,3,0.5,-10); ci.BackgroundColor3=C.muted; ci.BorderSizePixel=0; cr(ci,10)
    local on=false
    bg.MouseButton1Click:Connect(function()
        on=not on
        if on then
            TS:Create(bg,TweenInfo.new(0.18),{BackgroundColor3=col}):Play()
            TS:Create(ci,TweenInfo.new(0.18),{Position=UDim2.new(1,-23,0.5,-10),BackgroundColor3=C.white}):Play()
            TS:Create(l,TweenInfo.new(0.18),{TextColor3=C.white}):Play()
            TS:Create(stripe,TweenInfo.new(0.18),{BackgroundTransparency=0}):Play()
        else
            TS:Create(bg,TweenInfo.new(0.18),{BackgroundColor3=Color3.fromRGB(24,24,42)}):Play()
            TS:Create(ci,TweenInfo.new(0.18),{Position=UDim2.new(0,3,0.5,-10),BackgroundColor3=C.muted}):Play()
            TS:Create(l,TweenInfo.new(0.18),{TextColor3=C.off}):Play()
            TS:Create(stripe,TweenInfo.new(0.18),{BackgroundTransparency=1}):Play()
        end
        cb(on)
    end)
    return row
end

local function btn(page,txt,cb,col)
    local col=col or C.red
    local b=Instance.new("TextButton",page); b.Size=UDim2.new(1,0,0,46); b.BackgroundColor3=col; b.BorderSizePixel=0; b.Text=txt; b.TextColor3=C.white; b.TextSize=12; b.Font=Enum.Font.GothamBold; b.AutoButtonColor=false; cr(b,12)
    -- Shine overlay
    local sh=Instance.new("Frame",b); sh.Size=UDim2.new(1,0,0.5,0); sh.BackgroundColor3=C.white; sh.BackgroundTransparency=0.95; sh.BorderSizePixel=0; cr(sh,12)
    b.MouseButton1Down:Connect(function() TS:Create(b,TweenInfo.new(0.07),{Size=UDim2.new(1,0,0,41)}):Play() end)
    b.MouseButton1Up:Connect(function() TS:Create(b,TweenInfo.new(0.07),{Size=UDim2.new(1,0,0,46)}):Play() end)
    b.MouseButton1Click:Connect(cb); return b
end

local function inp(page,ph,cb)
    local bg=Instance.new("Frame",page); bg.Size=UDim2.new(1,0,0,46); bg.BackgroundColor3=C.card; bg.BorderSizePixel=0; cr(bg,12); ms(bg,C.border,1.5)
    local box=Instance.new("TextBox",bg); box.Size=UDim2.new(1,-18,1,0); box.Position=UDim2.new(0,9,0,0); box.BackgroundTransparency=1; box.Text=""; box.PlaceholderText=ph; box.PlaceholderColor3=C.muted; box.TextColor3=C.white; box.TextSize=12; box.Font=Enum.Font.Gotham; box.ClearTextOnFocus=false
    box.FocusLost:Connect(function() if box.Text~="" then cb(box.Text) end end); return box
end

-- ══════════════════════════════════════════
-- INFO TAB
-- ══════════════════════════════════════════
sec(iP,"⚡  WELCOME TO SCP HUB",C.red)
local rLbl=lbl2(iP,"👑 Made by TEJAZ  •  discord.gg/nDSy4jdVDc",C.white)
lbl2(iP,"🔥 Public V5  •  100% Free  •  No Library Required")
lbl2(iP,"✅ All features below — scroll tabs for more!")
div(iP)
sec(iP,"📋  TAB GUIDE",C.blue)
lbl2(iP,"📊 Stats — session data + rate tracker")
lbl2(iP,"💪 Main — auto punch/farm/equip/lift")
lbl2(iP,"🔄 Rebirth — auto rebirth/king/weight")
lbl2(iP,"⚔️ Kills — kill all/specific/anti knockback")
lbl2(iP,"🪨 Rocks — rock farm for all durability levels")
lbl2(iP,"🌀 Teleport — gyms/brawl/pets/auras/wheel")
lbl2(iP,"⚙️ Settings — graphics/time/portals/anti-afk")
lbl2(iP,"🎁 Gifting — gift eggs & shakes to players")
div(iP)
btn(iP,"📋  Copy Discord Link",function() setclipboard("https://discord.gg/nDSy4jdVDc"); notify("SCP HUB","✅ Discord copied!",3) end,C.blueD)

task.spawn(function() local h=0; while hubG.Parent do h=(h+0.004)%1; rLbl.TextColor3=Color3.fromHSV(h,0.8,1); task.wait(0.05) end end)

-- ══════════════════════════════════════════
-- STATS TAB
-- ══════════════════════════════════════════
sec(stP,"⏱️  SESSION TIMER",C.blue)
local sStart=os.time()
local timeLbl=lbl2(stP,"⏱️ Time: 0d 0h 0m 0s",C.white)
task.spawn(function() while task.wait(1) do local e=os.time()-sStart; timeLbl.Text=("⏱️ Time: %dd %dh %dm %ds"):format(math.floor(e/86400),math.floor(e%86400/3600),math.floor(e%3600/60),e%60) end end)

div(stP)
sec(stP,"📈  GAINED THIS SESSION",C.green)
local ls=LP:WaitForChild("leaderstats",10)
local strS=ls and ls:WaitForChild("Strength",5); local rebS=ls and ls:WaitForChild("Rebirths",5); local killS=ls and ls:WaitForChild("Kills",5)
local durS=LP:WaitForChild("Durability",5); local agiS=LP:WaitForChild("Agility",5)
local evilS=LP:WaitForChild("evilKarma",5); local goodS=LP:WaitForChild("goodKarma",5)
local iStr=strS and strS.Value or 0; local iDur=durS and durS.Value or 0; local iReb=rebS and rebS.Value or 0; local iKill=killS and killS.Value or 0
local sL=lbl2(stP,"💪 Str: — | Gained: 0",C.white); local dL=lbl2(stP,"🛡️ Dur: — | Gained: 0",C.white)
local rL=lbl2(stP,"🔄 Rebs: — | Gained: 0",C.white); local kL=lbl2(stP,"⚔️ Kills: — | Gained: 0",C.white)
local eL=lbl2(stP,"😈 Evil Karma: —"); local gL=lbl2(stP,"😇 Good Karma: —")
task.spawn(function() while task.wait(0.5) do pcall(function()
    sL.Text="💪 Str: "..fmt(strS.Value).." | +"..fmt(strS.Value-iStr)
    dL.Text="🛡️ Dur: "..fmt(durS.Value).." | +"..fmt(durS.Value-iDur)
    rL.Text="🔄 Rebs: "..fmt(rebS.Value).." | +"..fmt(rebS.Value-iReb)
    kL.Text="⚔️ Kills: "..fmt(killS.Value).." | +"..fmt(killS.Value-iKill)
    eL.Text="😈 Evil: "..fmt(evilS.Value); gL.Text="😇 Good: "..fmt(goodS.Value)
end) end end)

div(stP)
sec(stP,"📉  RATE TRACKER (per hr)",C.amber)
local rStrL=lbl2(stP,"💪 Str/hr: warming up..."); local rDurL=lbl2(stP,"🛡️ Dur/hr: warming up...")
local sH,dH={},{}
task.spawn(function() while task.wait(0.5) do pcall(function()
    local n=tick(); table.insert(sH,{t=n,v=strS.Value}); table.insert(dH,{t=n,v=durS.Value})
    while #sH>0 and n-sH[1].t>10 do table.remove(sH,1) end; while #dH>0 and n-dH[1].t>10 do table.remove(dH,1) end
    if #sH>=2 then rStrL.Text="💪 Str/hr: "..fmt(math.floor((sH[#sH].v-sH[1].v)/10*3600)) end
    if #dH>=2 then rDurL.Text="🛡️ Dur/hr: "..fmt(math.floor((dH[#dH].v-dH[1].v)/10*3600)) end
end) end end)

div(stP)
sec(stP,"🔍  INSPECT PLAYER",C.teal)
local spyT=LP; local spyN=lbl2(stP,"Player: "..LP.Name,C.white); local spyStr2=lbl2(stP,"💪 Str: —"); local spyDur2=lbl2(stP,"🛡️ Dur: —"); local spyR=lbl2(stP,"🔄 Rebs: —"); local spyK=lbl2(stP,"⚔️ Kills: —")
inp(stP,"Search player name...",function(v) local p=findPlayer(v); if p then spyT=p; spyN.Text="Player: "..p.Name.." ("..p.DisplayName..")"; notify("SCP HUB","🔍 Spying: "..p.Name,2) else notify("SCP HUB","❌ Not found",3) end end)
task.spawn(function() while task.wait(1) do pcall(function()
    if not spyT then return end
    local tls=spyT:FindFirstChild("leaderstats")
    if tls then spyStr2.Text="💪 Str: "..fmt((tls:FindFirstChild("Strength") and tls.Strength.Value) or 0); spyR.Text="🔄 Rebs: "..fmt((tls:FindFirstChild("Rebirths") and tls.Rebirths.Value) or 0); spyK.Text="⚔️ Kills: "..fmt((tls:FindFirstChild("Kills") and tls.Kills.Value) or 0) end
    local td=spyT:FindFirstChild("Durability"); if td then spyDur2.Text="🛡️ Dur: "..fmt(td.Value) end
end) end end)

-- ══════════════════════════════════════════
-- MAIN TAB
-- ══════════════════════════════════════════
sec(mP,"👊  AUTO PUNCH",C.green)
tog(mP,"👊  Auto Punch",function(on) _G.punchanim=on; if on then task.spawn(function() while _G.punchanim do local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch")); if p then if p.Parent~=LP.Character then p.Parent=LP.Character end; p:Activate() end; task.wait() end end) end end,C.green)
tog(mP,"⚡  Fast Punch (attackTime=0)",function(on) local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch")); if p and p:FindFirstChild("attackTime") then p.attackTime.Value=on and 0 or 0.35 end end,C.green)
div(mP)
sec(mP,"🌴  JUNGLE MACHINE FARM",C.teal)
for _,m in ipairs({{"🌴 Jungle Bench","Jungle Bench",CFrame.new(-8629.88,64.88,1855.03)},{"🏋️ Jungle Bar Lift","Jungle Bar Lift",CFrame.new(-8678.06,14.50,2089.26)},{"🦵 Jungle Squat","Jungle Squat",CFrame.new(-8374.26,34.59,2932.45)}}) do
    local gk="jM_"..m[2]:gsub(" ","")
    tog(mP,m[1],function(on) getgenv()[gk]=on; if on then task.spawn(function() while getgenv()[gk] do if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character:SetPrimaryPartCFrame(m[3]); pcall(function() RS.rEvents.machineInteractRemote:InvokeServer("useMachine",workspace.machinesFolder[m[2]].interactSeat) end) end; task.wait(0.1) end end) end end,C.teal)
end
div(mP)
sec(mP,"🎒  AUTO EQUIP TOOLS",C.amber)
for _,tn in ipairs({"Weight","Pushups","Situps","Handstand"}) do
    local gk="autoEq_"..tn
    tog(mP,"⚙️  Auto Equip "..tn,function(on) getgenv()[gk]=on; if on then task.spawn(function() while getgenv()[gk] do local w=LP.Backpack:FindFirstChild(tn); if w and LP.Character then w.Parent=LP.Character end; task.wait(0.1) end end) end end,C.amber)
end
div(mP)
sec(mP,"⚡  AUTO LIFT",C.red)
tog(mP,"⚡  Auto Lift (Rep Fire)",function(on) getgenv().autoLift=on; if on then task.spawn(function() while getgenv().autoLift do pcall(function() local pu=LP.Backpack:FindFirstChild("Pushup") or LP.Backpack:FindFirstChild("Pushups"); if pu and LP.Character then pu.Parent=LP.Character end; LP.muscleEvent:FireServer("rep") end); task.wait(0.1) end end) end end,C.red)

-- ══════════════════════════════════════════
-- REBIRTH TAB
-- ══════════════════════════════════════════
sec(rP,"👑  AUTO KING",C.amber)
tog(rP,"👑  Auto King (Lock Position)",function(on) local kCF=CFrame.new(-8865,430,-5749); if on then if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame=kCF end; getgenv().kingLock=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame=kCF end end) elseif getgenv().kingLock then getgenv().kingLock:Disconnect(); getgenv().kingLock=nil end end,C.amber)
div(rP)
sec(rP,"🔄  AUTO REBIRTH",C.green)
local tgtReb=nil; inp(rP,"Target Rebirth Amount (optional)...",function(v) tgtReb=tonumber(v) end)
tog(rP,"🔄  Auto Rebirth",function(on) getgenv().autoRebirth=on; if on then coroutine.wrap(function() while getgenv().autoRebirth do local r=ls and ls:FindFirstChild("Rebirths"); if r and tgtReb and r.Value>=tgtReb then getgenv().autoRebirth=false; notify("SCP HUB","✅ Target rebirths reached!",4); break end; pcall(function() RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest") end); task.wait(0.1) end end)() end end,C.green)
div(rP)
sec(rP,"⚙️  HELPERS",C.teal)
tog(rP,"⚖️  Auto Weight Rep",function(on) getgenv().aWR=on; if on then task.spawn(function() while getgenv().aWR do pcall(function() local w=LP.Backpack:FindFirstChild("Weight"); if w and LP.Character then LP.Character.Humanoid:EquipTool(w) end; LP.muscleEvent:FireServer("rep") end); task.wait(0.01) end end) end end,C.teal)
tog(rP,"📐  Auto Size 2",function(on) getgenv().aS2=on; if on then task.spawn(function() while getgenv().aS2 do pcall(function() RS.rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",2) end); task.wait(0) end end) end end,C.teal)
tog(rP,"🙈  Hide All Frames",function(on) for _,v in pairs(RS:GetChildren()) do if v.Name:match("Frame$") then v.Visible=not on end end end,C.teal)
tog(rP,"📍  Lock Position",function(on) if on then local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then local pos=hrp.CFrame; getgenv().posLock=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame=pos end end) end elseif getgenv().posLock then getgenv().posLock:Disconnect(); getgenv().posLock=nil end end,C.teal)

-- ══════════════════════════════════════════
-- KILLS TAB
-- ══════════════════════════════════════════
sec(kP,"🛡️  ANTI KNOCKBACK",C.pink)
tog(kP,"🛡️  Anti Knockback",function(on) local hrp=workspace:FindFirstChild(LP.Name) and workspace[LP.Name]:FindFirstChild("HumanoidRootPart"); if on and hrp then local bv=Instance.new("BodyVelocity",hrp); bv.MaxForce=Vector3.new(1e5,0,1e5); bv.Velocity=Vector3.new(0,0,0); bv.P=1250 elseif not on and hrp then local bv=hrp:FindFirstChild("BodyVelocity"); if bv then bv:Destroy() end end end,C.pink)
div(kP)
sec(kP,"☠️  KILL OPTIONS",C.pink)
local killM="Teleport"; local whitelist={}
local mLbl=lbl2(kP,"Method: 🟢 Teleport",C.off)
btn(kP,"🔄  Toggle Method: Teleport / Non-Teleport",function() killM=killM=="Teleport" and "Non-Teleport" or "Teleport"; mLbl.Text="Method: "..(killM=="Teleport" and "🟢 Teleport" or "🔵 Non-Teleport"); notify("SCP HUB","Kill method: "..killM,3) end,C.blueD)
lbl2(kP,"Whitelist: type name to protect them from kill:"); inp(kP,"Whitelist player name...",function(v) if table.find(whitelist,v) then for i,n in ipairs(whitelist) do if n==v then table.remove(whitelist,i); break end end; notify("SCP HUB","Removed: "..v,3) else table.insert(whitelist,v); notify("SCP HUB","Whitelisted: "..v,3) end end)
local function doKill(target) if not target or target==LP then return end; local hrp=target.Character and target.Character:FindFirstChild("HumanoidRootPart"); local p=getPunch(); if not p or not hrp then return end; if killM=="Teleport" and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then hrp.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.new(math.random(-2,2),0,math.random(-2,2)) end; p:Activate(); local rh=LP.Character:FindFirstChild("RightHand"); local lh=LP.Character:FindFirstChild("LeftHand"); if rh and lh then firetouchinterest(rh,hrp,1); firetouchinterest(lh,hrp,1); firetouchinterest(rh,hrp,0); firetouchinterest(lh,hrp,0) end; local me=LP:FindFirstChild("muscleEvent"); if me then me:FireServer("punch","rightHand"); me:FireServer("punch","leftHand") end end
tog(kP,"☠️  Kill All Players",function(on) getgenv().killAll=on; if on then task.spawn(function() while getgenv().killAll do for _,p in ipairs(Players:GetPlayers()) do if p~=LP and not table.find(whitelist,p.Name) then pcall(function() doKill(p) end) end end; task.wait() end end) end end,C.pink)
local killTarget=""; inp(kP,"Target player name (partial OK)...",function(v) killTarget=v end)
tog(kP,"🎯  Auto Kill Specific Player",function(on) getgenv().killOne=on; if on then task.spawn(function() while getgenv().killOne do local p=findPlayer(killTarget); if p and not table.find(whitelist,p.Name) then pcall(function() doKill(p) end) end; task.wait() end end) end end,C.pink)
div(kP)
sec(kP,"⚡  FAST PUNCH",C.pink)
tog(kP,"⚡  Fast Punch (attackTime=0)",function(on) local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch")); if p and p:FindFirstChild("attackTime") then p.attackTime.Value=on and 0 or 0.35 end end,C.pink)
div(kP)
sec(kP,"📹  SPY CAMERA",C.pink)
local spyCam=""; inp(kP,"Spy target name...",function(v) spyCam=v end)
tog(kP,"📹  Spy Camera",function(on) if on then getgenv().spyCamOn=true; task.spawn(function() while getgenv().spyCamOn do local p=findPlayer(spyCam); if p and p.Character and p.Character:FindFirstChild("Humanoid") then workspace.CurrentCamera.CameraSubject=p.Character.Humanoid end; task.wait(0.25) end end) else getgenv().spyCamOn=false; if LP.Character and LP.Character:FindFirstChild("Humanoid") then workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid end end end,C.pink)

-- ══════════════════════════════════════════
-- ROCKS TAB
-- ══════════════════════════════════════════
sec(rkP,"🪨  SETUP",C.purple)
tog(rkP,"👊  Auto Punch",function(on) _G.punchanim=on; if on then task.spawn(function() while _G.punchanim do local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch")); if p then if p.Parent~=LP.Character then p.Parent=LP.Character end; p:Activate() end; task.wait() end end) end end,C.purple)
tog(rkP,"⚡  Fast Punch v1",function(on) local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch")); if p and p:FindFirstChild("attackTime") then p.attackTime.Value=on and 0 or 0.3 end end,C.purple)
tog(rkP,"🙈  Hide All Frames",function(on) for _,v in pairs(RS:GetChildren()) do if v.Name:match("Frame$") then v.Visible=not on end end end,C.purple)
tog(rkP,"📍  Lock Position",function(on) if on then local pos=LP.Character.HumanoidRootPart.CFrame; getgenv().posLock2=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame=pos end end) elseif getgenv().posLock2 then getgenv().posLock2:Disconnect(); getgenv().posLock2=nil end end,C.purple)
div(rkP)
sec(rkP,"🪨  SELECT ROCK TO FARM",C.purple)
local function equipPunch() local p=LP.Backpack:FindFirstChild("Punch"); if p then p.Parent=LP.Character end end
local function doRockFarm(d) while getgenv().autoFarm do task.wait(0.1); local char=LP.Character; if char and LP:FindFirstChild("Durability") and d<=LP.Durability.Value then local mf=workspace:FindFirstChild("machinesFolder"); if mf then for _,v in pairs(mf:GetDescendants()) do if v.Name=="neededDurability" and v.Value==d and char:FindFirstChild("LeftHand") and char:FindFirstChild("RightHand") then firetouchinterest(v.Parent.Rock,char.RightHand,0); firetouchinterest(v.Parent.Rock,char.RightHand,1); firetouchinterest(v.Parent.Rock,char.LeftHand,0); firetouchinterest(v.Parent.Rock,char.LeftHand,1); equipPunch() end end end end; if _G.fastHitActive then LP.muscleEvent:FireServer("punch","rightHand"); LP.muscleEvent:FireServer("punch","leftHand"); local p=LP.Character and LP.Character:FindFirstChild("Punch"); if p then p:Activate() end end end end
for _,rd in ipairs({{"🌴 Jungle Rock",10000000},{"👑 Muscle King Rock",5000000},{"⚡ Legnds Rock",1000000},{"🪨 Large Rock",1000000},{"🔥 Inferno Rock",750000},{"🔮 Mystic Rock",400000},{"❄️ Froze Rock",150000},{"🥇 Golden Rock",5000},{"👊 Punch Rock",10},{"🪨 Tiny Rock",0}}) do
    local rN,rD=rd[1],rd[2]
    tog(rkP,rN.."  ("..fmt(rD).." dur)",function() _G.fastHitActive=not _G.fastHitActive; if _G.fastHitActive then getgenv().autoFarm=true; notify("SCP HUB","🪨 "..rN,3); coroutine.wrap(function() while _G.fastHitActive do if LP.Character then for _=1,30 do equipPunch(); doRockFarm(rD); LP.muscleEvent:FireServer("punch","rightHand"); LP.muscleEvent:FireServer("punch","leftHand") end end; task.wait(0.05) end end)() else getgenv().autoFarm=false; local p=LP.Character and LP.Character:FindFirstChild("Punch"); if p then p.Parent=LP.Backpack end end end,C.purple)
end

-- ══════════════════════════════════════════
-- TELEPORT TAB
-- ══════════════════════════════════════════
sec(tpP,"🌀  TELEPORT TO GYM / BRAWL",C.teal)
for _,loc in ipairs({{"🏖️ Beach",Vector3.new(0,0,0)},{"❄️ Frost Gym",Vector3.new(-2650,7,-393)},{"🔮 Mythical Gym",Vector3.new(2255,7,1071)},{"♾️ Eternal Gym",Vector3.new(-6768,7,-1287)},{"⚡ Legend Gym",Vector3.new(4429,991,-3880)},{"👑 Muscle King Gym",Vector3.new(-8799,17,-5798)},{"🌴 Jungle Gym",Vector3.new(-7894,6,2386)},{"🏋️ Tiny Gym",Vector3.new(50,7,1918)},{"🔥 Lava Brawl",Vector3.new(4471,119,-8836)},{"🏜️ Desert Brawl",Vector3.new(960,17,-7398)},{"🤫 Secret",Vector3.new(1947,2,6191)}}) do
    btn(tpP,loc[1],function() local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart"); if hrp then hrp.CFrame=CFrame.new(loc[2]); notify("SCP HUB","🌀 "..loc[1],2) end end,C.blueD)
end
div(tpP)
sec(tpP,"🥚  AUTO OPEN PETS",C.orange)
local selPet="Neon Guardian"; local sPL=lbl2(tpP,"Selected: Neon Guardian",C.white)
inp(tpP,"Pet name exactly...",function(v) selPet=v; sPL.Text="Selected: "..v end)
tog(tpP,"🥚  Auto Open Pet",function(on) getgenv().autoPet=on; if on then task.spawn(function() while getgenv().autoPet do pcall(function() local v=RS.cPetShopFolder:FindFirstChild(selPet); if v then RS.cPetShopRemote:InvokeServer(v) end end); task.wait(1) end end) end end,C.orange)
div(tpP)
sec(tpP,"🌀  AUTO OPEN AURAS",C.purple)
local selAura="Blue Aura"; local sAL=lbl2(tpP,"Selected: Blue Aura",C.white)
inp(tpP,"Aura name exactly...",function(v) selAura=v; sAL.Text="Selected: "..v end)
tog(tpP,"🌀  Auto Open Aura",function(on) getgenv().autoAura=on; if on then task.spawn(function() while getgenv().autoAura do pcall(function() local v=RS.cPetShopFolder:FindFirstChild(selAura); if v then RS.cPetShopRemote:InvokeServer(v) end end); task.wait(1) end end) end end,C.purple)
div(tpP)
sec(tpP,"🎡  AUTO SPIN WHEEL",C.amber)
tog(tpP,"🎡  Auto Spin Fortune Wheel",function(on) getgenv().autoSpin=on; if on then task.spawn(function() while getgenv().autoSpin do pcall(function() RS.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel",RS.fortuneWheelChances["Fortune Wheel"]) end); task.wait(1) end end) end end,C.amber)

-- ══════════════════════════════════════════
-- SETTINGS TAB
-- ══════════════════════════════════════════
local sCol=Color3.fromRGB(90,90,170)
sec(seP,"🖥️  PERFORMANCE",sCol)
tog(seP,"🖥️  Low Graphics (Max FPS)",function(on) game.Lighting.GlobalShadows=not on; game.Lighting.FogEnd=on and 9e9 or 1e5; game.Lighting.Brightness=on and 0 or 2; settings().Rendering.QualityLevel=on and "Level01" or "Level21"; for _,v in pairs(game:GetDescendants()) do pcall(function() if v:IsA("BasePart") then v.Material=on and Enum.Material.Plastic or Enum.Material.SmoothPlastic; v.Reflectance=on and 0 or 0.2 elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Lifetime=NumberRange.new(on and 0 or 1) end end) end; notify("SCP HUB",on and "🖥️ Low Graphics ON!" or "🖥️ Normal Graphics",3) end,sCol)
for _,q in ipairs({{"🟢 Low Quality (Best FPS)","Level01"},{"🟡 Medium Quality","Level10"},{"🔴 High Quality","Level21"}}) do
    btn(seP,q[1],function() settings().Rendering.QualityLevel=q[2]; notify("SCP HUB",q[1],3) end,C.card)
end
div(seP)
sec(seP,"🌅  TIME OF DAY",sCol)
for _,t in ipairs({{"🌙 Night",0,1,Color3.fromRGB(40,40,40)},{"☀️ Day",12,2,Color3.fromRGB(255,255,255)},{"🌅 Alora Sunset",18,1,Color3.fromRGB(255,170,0)},{"🌌 Aurora Night",20,0.9,Color3.fromRGB(0,255,120)}}) do
    btn(seP,t[1],function() game.Lighting.ClockTime=t[2]; game.Lighting.Brightness=t[3]; game.Lighting.Ambient=t[4]; if game.Lighting:FindFirstChild("GalaxyStars") then game.Lighting.GalaxyStars.Enabled=false end; notify("SCP HUB",t[1],3) end,C.card)
end
div(seP)
sec(seP,"🎮  MISC TOOLS",sCol)
btn(seP,"🎮  Free AutoLift Gamepass",function() pcall(function() for _,v in pairs(RS.gamepassIds:GetChildren()) do local val=Instance.new("IntValue"); val.Name=v.Name; val.Value=v.Value; val.Parent=LP.ownedGamepasses end end); notify("SCP HUB","🎮 Gamepass applied!",3) end,sCol)
btn(seP,"🚫  Remove Ad Portals",function() local c=0; for _,v in pairs(game:GetDescendants()) do if v.Name=="RobloxForwardPortals" then v:Destroy(); c=c+1 end end; if _G.AdRC then _G.AdRC:Disconnect() end; _G.AdRC=game.DescendantAdded:Connect(function(v) if v.Name=="RobloxForwardPortals" then v:Destroy() end end); notify("SCP HUB","🚫 Removed "..c.." portals!",3) end,sCol)
tog(seP,"🌊  Walk on Water",function(on) if on then local parts={}; local sz=2048; local ct=math.ceil(50000/sz); for x=-ct,ct do for z=-ct,ct do local p=Instance.new("Part"); p.Size=Vector3.new(sz,1,sz); p.Position=Vector3.new(x*sz,-9.5,z*sz); p.Anchored=true; p.Transparency=1; p.CanCollide=true; p.Parent=workspace; table.insert(parts,p) end end; getgenv().wParts=parts else if getgenv().wParts then for _,p in ipairs(getgenv().wParts) do if p and p.Parent then p.CanCollide=false end end end end end,sCol)
div(seP)
sec(seP,"🛡️  ANTI AFK",sCol)
btn(seP,"🛡️  Anti AFK v1",function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end); notify("SCP HUB","🛡️ Anti AFK v1 ON!",3) end,C.greenD)
btn(seP,"🛡️  Anti AFK v2 (TEJAZ)",function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/New%20anti%20afk%20v2"))() end); notify("SCP HUB","🛡️ Anti AFK v2 ON!",3) end,C.greenD)

-- ══════════════════════════════════════════
-- GIFTING TAB
-- ══════════════════════════════════════════
sec(gP,"🎁  GIFTING",C.orange)
lbl2(gP,"⚠️ Stand on a machine while gifting!",C.amber)
div(gP)
local eCL=lbl2(gP,"🥚 Protein Eggs: 0",C.white); local sCL=lbl2(gP,"🥤 Tropical Shakes: 0",C.white)
local function refreshInv() local cf=LP:FindFirstChild("consumablesFolder"); local eggs,shakes=0,0; if cf then for _,item in ipairs(cf:GetChildren()) do if item.Name=="Protein Egg" then eggs=eggs+1 end; if item.Name=="Tropical Shake" then shakes=shakes+1 end end end; eCL.Text="🥚 Protein Eggs: "..eggs; sCL.Text="🥤 Tropical Shakes: "..shakes end
task.spawn(function() while task.wait(5) do refreshInv() end end); refreshInv()
btn(gP,"🔄  Refresh Inventory",function() refreshInv(); notify("SCP HUB","✅ Refreshed!",2) end,C.card)
div(gP)
sec(gP,"🥚  PROTEIN EGG GIFTER",C.orange)
local eT,eA=nil,0; local eTL=lbl2(gP,"Target: none",C.muted)
inp(gP,"Target player name...",function(v) local p=Players:FindFirstChild(v) or findPlayer(v); if p then eT=p; eTL.Text="Target: "..p.Name; notify("SCP HUB","✅ "..p.Name,2) else notify("SCP HUB","❌ Not found",3) end end)
inp(gP,"Number of eggs...",function(v) eA=tonumber(v) or 0 end)
btn(gP,"🥚  Gift Protein Eggs",function() if not eT then notify("SCP HUB","❌ Select target!",3); return end; if eA<=0 then notify("SCP HUB","❌ Enter amount!",3); return end; task.spawn(function() local n=0; local cf=LP:FindFirstChild("consumablesFolder"); if cf then for i=1,eA do local egg=cf:FindFirstChild("Protein Egg"); if egg then pcall(function() RS.rEvents.giftRemote:InvokeServer(eT,egg) end); n=n+1 end; task.wait(0.5) end end; notify("SCP HUB","✅ Gifted "..n.." Eggs to "..eT.Name,4); refreshInv() end) end,C.orange)
div(gP)
sec(gP,"🥤  TROPICAL SHAKE GIFTER",C.orange)
local sT2,sA2=nil,0; local sTL=lbl2(gP,"Target: none",C.muted)
inp(gP,"Target player name...",function(v) local p=Players:FindFirstChild(v) or findPlayer(v); if p then sT2=p; sTL.Text="Target: "..p.Name; notify("SCP HUB","✅ "..p.Name,2) else notify("SCP HUB","❌ Not found",3) end end)
inp(gP,"Number of shakes...",function(v) sA2=tonumber(v) or 0 end)
btn(gP,"🥤  Gift Tropical Shakes",function() if not sT2 then notify("SCP HUB","❌ Select target!",3); return end; if sA2<=0 then notify("SCP HUB","❌ Enter amount!",3); return end; task.spawn(function() local n=0; local cf=LP:FindFirstChild("consumablesFolder"); if cf then for i=1,sA2 do local sh=cf:FindFirstChild("Tropical Shake"); if sh then pcall(function() RS.rEvents.giftRemote:InvokeServer(sT2,sh) end); n=n+1 end; task.wait(0.5) end end; notify("SCP HUB","✅ Gifted "..n.." Shakes to "..sT2.Name,4); refreshInv() end) end,C.orange)

-- ═══════════════════════════════════
-- ✨ HUB ANIMATIONS
-- ═══════════════════════════════════
TS:Create(mWin,TweenInfo.new(0.7,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
    Position=UDim2.new(0.5,-WIN_W/2,0.5,-WIN_H/2)
}):Play()

task.spawn(function()
    local t=0; while hubG.Parent do
        t=t+0.025; mBdr.Color=Color3.new(0.88+(math.sin(t)+1)/2*0.12,(math.sin(t)+1)/2*0.1,0); task.wait(0.05)
    end
end)

notify("SCP HUB","🔥 Muscle Legends V5 Loaded! Made by TEJAZ",5)
