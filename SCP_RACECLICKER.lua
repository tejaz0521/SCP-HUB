-- ╔══════════════════════════════════════════════════╗
--    ⚡  SCP HUB  |  RACE CLICKER  V5
--    👑 Made by TEJAZ  |  discord.gg/nDSy4jdVDc
--    Key: SCPONTOP
-- ╚══════════════════════════════════════════════════╝

local Players = game:GetService("Players")
local RS      = game:GetService("ReplicatedStorage")
local RunSvc  = game:GetService("RunService")
local TS      = game:GetService("TweenService")
local SG      = game:GetService("StarterGui")
local LP      = Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end
local function cr(i,r) Instance.new("UICorner",i).CornerRadius=UDim.new(0,r or 12) end
local function ms(i,c,t) local s=Instance.new("UIStroke",i); s.Color=c; s.Thickness=t or 1.5; return s end
local function fixRound(parent,col) local f=Instance.new("Frame",parent); f.Size=UDim2.new(1,0,0.5,0); f.Position=UDim2.new(0,0,0.5,0); f.BackgroundColor3=col; f.BorderSizePixel=0 end

-- ── ELITE THEME (Purple/Pink for Race Clicker) ─────
local C = {
    bg=Color3.fromRGB(8,8,14), panel=Color3.fromRGB(13,13,22),
    card=Color3.fromRGB(16,16,28), border=Color3.fromRGB(32,32,55),
    white=Color3.fromRGB(255,255,255), off=Color3.fromRGB(160,160,195),
    muted=Color3.fromRGB(65,65,100),
    main=Color3.fromRGB(170,0,255),   -- purple main accent
    mainD=Color3.fromRGB(90,0,160),
    red=Color3.fromRGB(230,30,30), redD=Color3.fromRGB(140,0,0),
    blue=Color3.fromRGB(0,140,255), blueD=Color3.fromRGB(0,80,180),
    green=Color3.fromRGB(0,210,90), greenD=Color3.fromRGB(0,130,55),
    amber=Color3.fromRGB(255,180,0),
    orange=Color3.fromRGB(255,130,0),
    pink=Color3.fromRGB(255,50,160),
    teal=Color3.fromRGB(0,200,200),
}
local CORRECT_KEY = "SCPONTOP"

-- ════════════════════════════════════
-- 🔑 KEY SYSTEM
-- ════════════════════════════════════
local kG=Instance.new("ScreenGui"); kG.Name="SCPRaceKey"; kG.ResetOnSpawn=false; kG.DisplayOrder=999; kG.Parent=LP:WaitForChild("PlayerGui")
Instance.new("Frame",kG).Size=UDim2.new(1,0,1,0); kG.PlayerGui and nil
local kOv=kG:FindFirstChildOfClass("Frame"); if kOv then kOv.BackgroundColor3=Color3.fromRGB(0,0,0); kOv.BackgroundTransparency=0.4; kOv.BorderSizePixel=0 end

local kCard=Instance.new("Frame",kG); kCard.Size=UDim2.new(0,330,0,460); kCard.BackgroundColor3=C.bg; kCard.BorderSizePixel=0; cr(kCard,26)
local kBdr=ms(kCard,C.main,2.5)

-- Tri-colour strip (purple/pink theme)
for i,col in ipairs({C.main,Color3.fromRGB(200,0,200),C.pink}) do
    local f=Instance.new("Frame",kCard); f.Size=UDim2.new(0.34,0,0,3); f.Position=UDim2.new((i-1)*0.33,0,0,0); f.BackgroundColor3=col; f.BorderSizePixel=0; f.ZIndex=3
end

local kHdr=Instance.new("Frame",kCard); kHdr.Size=UDim2.new(1,0,0,158); kHdr.BackgroundColor3=C.panel; kHdr.BorderSizePixel=0; cr(kHdr,26); fixRound(kHdr,C.panel)
local kGlow=Instance.new("ImageLabel",kHdr); kGlow.Size=UDim2.new(0,160,0,160); kGlow.Position=UDim2.new(0.5,-80,0,-30); kGlow.BackgroundTransparency=1; kGlow.Image="rbxassetid://7072725342"; kGlow.ImageColor3=C.main; kGlow.ImageTransparency=0.7; kGlow.ZIndex=2
local kLogo=Instance.new("ImageLabel",kCard); kLogo.Size=UDim2.new(0,84,0,84); kLogo.Position=UDim2.new(0.5,-42,0,11); kLogo.BackgroundTransparency=1; kLogo.Image="rbxassetid://125515680929159"; kLogo.ScaleType=Enum.ScaleType.Fit; kLogo.ZIndex=4

local function kl(txt,y,sz,col,font) local l=Instance.new("TextLabel",kCard); l.Size=UDim2.new(1,0,0,sz+4); l.Position=UDim2.new(0,0,0,y); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.white; l.TextSize=sz or 14; l.Font=font or Enum.Font.GothamBlack; return l end
kl("⚡  SCP  HUB  ⚡",100,22,C.white); kl("🏎️ RACE CLICKER  •  🔑 KEY SYSTEM",127,11,C.main,Enum.Font.GothamBold)

local kInfo=Instance.new("Frame",kCard); kInfo.Size=UDim2.new(1,-24,0,44); kInfo.Position=UDim2.new(0,12,0,155); kInfo.BackgroundColor3=C.card; kInfo.BorderSizePixel=0; cr(kInfo,12); ms(kInfo,C.border,1)
local kIL=Instance.new("TextLabel",kInfo); kIL.Size=UDim2.new(1,-16,1,0); kIL.Position=UDim2.new(0,8,0,0); kIL.BackgroundTransparency=1; kIL.Text="🔑 Key: SCPONTOP  •  Get FREE key: discord.gg/nDSy4jdVDc"; kIL.TextColor3=C.off; kIL.TextSize=11; kIL.Font=Enum.Font.Gotham; kIL.TextWrapped=true
kl("ENTER YOUR KEY",208,10,C.muted,Enum.Font.GothamBold)

local kIBg=Instance.new("Frame",kCard); kIBg.Size=UDim2.new(1,-24,0,52); kIBg.Position=UDim2.new(0,12,0,224); kIBg.BackgroundColor3=C.card; kIBg.BorderSizePixel=0; cr(kIBg,14)
local kIS=ms(kIBg,C.border,1.5)
local kInput=Instance.new("TextBox",kIBg); kInput.Size=UDim2.new(1,-18,1,0); kInput.Position=UDim2.new(0,9,0,0); kInput.BackgroundTransparency=1; kInput.Text=""; kInput.PlaceholderText="  Type: SCPONTOP"; kInput.PlaceholderColor3=C.muted; kInput.TextColor3=C.white; kInput.TextSize=15; kInput.Font=Enum.Font.GothamBold; kInput.ClearTextOnFocus=false

local kStat=kl("",285,12,C.red,Enum.Font.GothamBold)

local kBtn=Instance.new("TextButton",kCard); kBtn.Size=UDim2.new(1,-24,0,52); kBtn.Position=UDim2.new(0,12,0,308); kBtn.BackgroundColor3=C.main; kBtn.BorderSizePixel=0; kBtn.Text="✅  UNLOCK RACE CLICKER"; kBtn.TextColor3=C.white; kBtn.TextSize=16; kBtn.Font=Enum.Font.GothamBlack; kBtn.AutoButtonColor=false; cr(kBtn,14)
local kDisc=Instance.new("TextButton",kCard); kDisc.Size=UDim2.new(1,-24,0,38); kDisc.Position=UDim2.new(0,12,0,374); kDisc.BackgroundColor3=C.card; kDisc.BorderSizePixel=0; kDisc.Text="💬  Get Key FREE  •  discord.gg/nDSy4jdVDc"; kDisc.TextColor3=C.pink; kDisc.TextSize=11; kDisc.Font=Enum.Font.GothamBold; kDisc.AutoButtonColor=false; cr(kDisc,12); ms(kDisc,C.mainD,1)
kDisc.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/nDSy4jdVDc"); kStat.Text="✅ Discord copied!"; kStat.TextColor3=C.green end)

kCard.Position=UDim2.new(0.5,-165,1.5,0)
TS:Create(kCard,TweenInfo.new(0.65,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-165,0.5,-230)}):Play()
task.spawn(function() local t=0; while kG.Parent do t=t+0.025; kBdr.Color=Color3.new(0.55+(math.sin(t)+1)/2*0.1,0,0.8+(math.sin(t)+1)/2*0.2); task.wait(0.05) end end)
task.spawn(function() while kG.Parent do TS:Create(kLogo,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,92,0,92)}):Play(); task.wait(1); TS:Create(kLogo,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,84,0,84)}):Play(); task.wait(1) end end)
kBtn.MouseButton1Down:Connect(function() TS:Create(kBtn,TweenInfo.new(0.07),{Size=UDim2.new(1,-24,0,47)}):Play() end)
kBtn.MouseButton1Up:Connect(function() TS:Create(kBtn,TweenInfo.new(0.07),{Size=UDim2.new(1,-24,0,52)}):Play() end)

local keyOK=false
local function verify()
    local e=kInput.Text:match("^%s*(.-)%s*$"); kStat.TextColor3=C.amber; kStat.Text="⏳ Checking..."
    task.spawn(function()
        if e==CORRECT_KEY then
            kStat.TextColor3=C.green; kStat.Text="✅ Correct! Loading..."
            kBtn.BackgroundColor3=C.greenD; kIS.Color=C.green; kBdr.Color=C.green
            task.wait(1.2); kG:Destroy(); keyOK=true
        else
            kStat.TextColor3=C.red; kStat.Text="❌ Wrong! Key: SCPONTOP"
            kIS.Color=C.red
            for i=1,4 do TS:Create(kCard,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-153,0.5,-230)}):Play(); task.wait(0.04); TS:Create(kCard,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-177,0.5,-230)}):Play(); task.wait(0.04) end
            TS:Create(kCard,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-165,0.5,-230)}):Play(); task.wait(0.4); kIS.Color=C.border
        end
    end)
end
kBtn.MouseButton1Click:Connect(verify); kInput.FocusLost:Connect(function(e) if e then verify() end end)
repeat task.wait() until keyOK

-- ════════════════════════════════════
-- 🎮 RACE CLICKER HUB — ELITE DESIGN
-- ════════════════════════════════════
local cG=Instance.new("ScreenGui"); cG.Name="SCPRaceLogo"; cG.ResetOnSpawn=false; cG.DisplayOrder=9998; cG.Parent=LP:WaitForChild("PlayerGui")
local cI=Instance.new("ImageLabel",cG); cI.Size=UDim2.new(0,52,0,52); cI.Position=UDim2.new(0,6,0,6); cI.BackgroundTransparency=1; cI.Image="rbxassetid://125515680929159"; cI.ScaleType=Enum.ScaleType.Fit

local WIN_W,WIN_H=380,570
local hG=Instance.new("ScreenGui"); hG.Name="SCPRace_V5"; hG.ResetOnSpawn=false; hG.DisplayOrder=100; hG.Parent=LP:WaitForChild("PlayerGui")

local mW=Instance.new("Frame",hG); mW.Size=UDim2.new(0,WIN_W,0,WIN_H); mW.Position=UDim2.new(0.5,-WIN_W/2,1.5,0); mW.BackgroundColor3=C.bg; mW.BorderSizePixel=0; mW.Active=true; mW.Draggable=true; cr(mW,22)
local mBdr=ms(mW,C.main,2)

-- Tri strip (purple/pink)
for i,col in ipairs({C.main,Color3.fromRGB(200,0,200),C.pink}) do
    local f=Instance.new("Frame",mW); f.Size=UDim2.new(0.34,0,0,3); f.Position=UDim2.new((i-1)*0.33,0,0,0); f.BackgroundColor3=col; f.BorderSizePixel=0; f.ZIndex=4
end

-- Title bar
local tB=Instance.new("Frame",mW); tB.Size=UDim2.new(1,0,0,54); tB.BackgroundColor3=C.panel; tB.BorderSizePixel=0; cr(tB,22); fixRound(tB,C.panel)
local tLogo=Instance.new("ImageLabel",tB); tLogo.Size=UDim2.new(0,36,0,36); tLogo.Position=UDim2.new(0,8,0.5,-18); tLogo.BackgroundTransparency=1; tLogo.Image="rbxassetid://125515680929159"; tLogo.ScaleType=Enum.ScaleType.Fit
local tTit=Instance.new("TextLabel",tB); tTit.Size=UDim2.new(1,-100,1,0); tTit.Position=UDim2.new(0,50,0,0); tTit.BackgroundTransparency=1; tTit.Text="⚡ SCP HUB  •  🏎️ RACE CLICKER"; tTit.TextColor3=C.white; tTit.TextSize=13; tTit.Font=Enum.Font.GothamBlack; tTit.TextXAlignment=Enum.TextXAlignment.Left

local uBadge=Instance.new("Frame",tB); uBadge.Size=UDim2.new(0,0,0,18); uBadge.Position=UDim2.new(0,50,1,-20); uBadge.BackgroundColor3=C.mainD; uBadge.BorderSizePixel=0; uBadge.AutomaticSize=Enum.AutomaticSize.X; cr(uBadge,5)
local uBL=Instance.new("TextLabel",uBadge); uBL.Size=UDim2.new(0,0,1,0); uBL.BackgroundTransparency=1; uBL.Text="  🏎️ RACE V5  "; uBL.TextColor3=C.white; uBL.TextSize=9; uBL.Font=Enum.Font.GothamBold; uBL.AutomaticSize=Enum.AutomaticSize.X

local minB=Instance.new("TextButton",tB); minB.Size=UDim2.new(0,30,0,30); minB.Position=UDim2.new(1,-72,0.5,-15); minB.BackgroundColor3=C.card; minB.BorderSizePixel=0; minB.Text="—"; minB.TextColor3=C.off; minB.TextSize=13; minB.Font=Enum.Font.GothamBold; minB.AutoButtonColor=false; cr(minB,8)
local clsB=Instance.new("TextButton",tB); clsB.Size=UDim2.new(0,30,0,30); clsB.Position=UDim2.new(1,-38,0.5,-15); clsB.BackgroundColor3=C.red; clsB.BorderSizePixel=0; clsB.Text="✕"; clsB.TextColor3=C.white; clsB.TextSize=13; clsB.Font=Enum.Font.GothamBold; clsB.AutoButtonColor=false; cr(clsB,8)
clsB.MouseButton1Click:Connect(function() hG:Destroy(); cG:Destroy() end)

local cH=Instance.new("Frame",mW); cH.Size=UDim2.new(1,0,1,-54); cH.Position=UDim2.new(0,0,0,54); cH.BackgroundTransparency=1; cH.BorderSizePixel=0
local isMin=false
minB.MouseButton1Click:Connect(function() isMin=not isMin; if isMin then TS:Create(mW,TweenInfo.new(0.25),{Size=UDim2.new(0,WIN_W,0,54)}):Play(); cH.Visible=false; minB.Text="+" else TS:Create(mW,TweenInfo.new(0.25),{Size=UDim2.new(0,WIN_W,0,WIN_H)}):Play(); cH.Visible=true; minB.Text="—" end end)

-- Tab bar
local tScr=Instance.new("Frame",cH); tScr.Size=UDim2.new(1,-16,0,34); tScr.Position=UDim2.new(0,8,0,6); tScr.BackgroundColor3=C.panel; tScr.BorderSizePixel=0; cr(tScr,10)
local tLL=Instance.new("UIListLayout",tScr); tLL.FillDirection=Enum.FillDirection.Horizontal; tLL.Padding=UDim.new(0,4); tLL.VerticalAlignment=Enum.VerticalAlignment.Center; tLL.HorizontalAlignment=Enum.HorizontalAlignment.Center

local cArea=Instance.new("Frame",cH); cArea.Size=UDim2.new(1,-16,1,-48); cArea.Position=UDim2.new(0,8,0,46); cArea.BackgroundColor3=C.card; cArea.BorderSizePixel=0; cr(cArea,14); ms(cArea,C.border,1)

local TABS={{n="🏎️ FARM",c=C.main},{n="⚡ SPEED",c=C.orange},{n="💰 MONEY",c=C.amber},{n="⚙️ SETUP",c=C.blue}}
local tBtns={};local tPages={}
for i,t in ipairs(TABS) do
    local b=Instance.new("TextButton",tScr); b.Size=UDim2.new(0,80,0,26); b.BackgroundColor3=C.bg; b.BorderSizePixel=0; b.Text=t.n; b.TextColor3=C.muted; b.TextSize=9; b.Font=Enum.Font.GothamBold; b.LayoutOrder=i; b.AutoButtonColor=false; cr(b,8)
    local page=Instance.new("ScrollingFrame",cArea); page.Size=UDim2.new(1,0,1,0); page.BackgroundTransparency=1; page.BorderSizePixel=0; page.ScrollBarThickness=3; page.ScrollBarImageColor3=t.c; page.CanvasSize=UDim2.new(0,0,0,0); page.Visible=false
    local ul=Instance.new("UIListLayout",page); ul.Padding=UDim.new(0,6); ul.SortOrder=Enum.SortOrder.LayoutOrder
    local pd=Instance.new("UIPadding",page); pd.PaddingLeft=UDim.new(0,8); pd.PaddingRight=UDim.new(0,8); pd.PaddingTop=UDim.new(0,8)
    ul:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() page.CanvasSize=UDim2.new(0,0,0,ul.AbsoluteContentSize.Y+16) end)
    b.MouseButton1Click:Connect(function() for _,p in ipairs(tPages) do p.Visible=false end; for _,bx in ipairs(tBtns) do bx.BackgroundColor3=C.bg; bx.TextColor3=C.muted end; page.Visible=true; b.BackgroundColor3=t.c; b.TextColor3=C.white end)
    table.insert(tBtns,b); table.insert(tPages,page)
end
tBtns[1].BackgroundColor3=TABS[1].c; tBtns[1].TextColor3=C.white; tPages[1].Visible=true
local fP,spP,mnP,seP=tPages[1],tPages[2],tPages[3],tPages[4]

-- UI helpers
local function sec(p,txt,col) local f=Instance.new("Frame",p); f.Size=UDim2.new(1,0,0,28); f.BackgroundColor3=Color3.fromRGB(12,12,22); f.BorderSizePixel=0; cr(f,8); local a=Instance.new("Frame",f); a.Size=UDim2.new(0,3,0.6,0); a.Position=UDim2.new(0,0,0.2,0); a.BackgroundColor3=col or C.main; a.BorderSizePixel=0; cr(a,3); local l=Instance.new("TextLabel",f); l.Size=UDim2.new(1,-16,1,0); l.Position=UDim2.new(0,12,0,0); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.main; l.TextSize=11; l.Font=Enum.Font.GothamBlack; l.TextXAlignment=Enum.TextXAlignment.Left end
local function lbl2(p,txt,col) local l=Instance.new("TextLabel",p); l.Size=UDim2.new(1,0,0,0); l.AutomaticSize=Enum.AutomaticSize.Y; l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.off; l.TextSize=11; l.Font=Enum.Font.GothamBold; l.TextXAlignment=Enum.TextXAlignment.Left; l.TextWrapped=true; return l end
local function div(p) local d=Instance.new("Frame",p); d.Size=UDim2.new(1,0,0,1); d.BackgroundColor3=C.border; d.BorderSizePixel=0 end
local function tog(p,txt,cb,col) local col=col or C.main; local row=Instance.new("Frame",p); row.Size=UDim2.new(1,0,0,48); row.BackgroundColor3=C.card; row.BorderSizePixel=0; cr(row,12); ms(row,C.border,1); local stripe=Instance.new("Frame",row); stripe.Size=UDim2.new(0,3,0.5,0); stripe.Position=UDim2.new(0,0,0.25,0); stripe.BackgroundColor3=col; stripe.BackgroundTransparency=1; stripe.BorderSizePixel=0; cr(stripe,3); local l=Instance.new("TextLabel",row); l.Size=UDim2.new(1,-62,1,0); l.Position=UDim2.new(0,12,0,0); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=C.off; l.TextSize=12; l.Font=Enum.Font.GothamBold; l.TextXAlignment=Enum.TextXAlignment.Left; l.TextWrapped=true; local bg=Instance.new("TextButton",row); bg.Size=UDim2.new(0,48,0,26); bg.Position=UDim2.new(1,-56,0.5,-13); bg.BackgroundColor3=Color3.fromRGB(24,24,42); bg.BorderSizePixel=0; bg.Text=""; bg.AutoButtonColor=false; cr(bg,13); local ci=Instance.new("Frame",bg); ci.Size=UDim2.new(0,20,0,20); ci.Position=UDim2.new(0,3,0.5,-10); ci.BackgroundColor3=C.muted; ci.BorderSizePixel=0; cr(ci,10); local on=false; bg.MouseButton1Click:Connect(function() on=not on; if on then TS:Create(bg,TweenInfo.new(0.18),{BackgroundColor3=col}):Play(); TS:Create(ci,TweenInfo.new(0.18),{Position=UDim2.new(1,-23,0.5,-10),BackgroundColor3=C.white}):Play(); TS:Create(l,TweenInfo.new(0.18),{TextColor3=C.white}):Play(); TS:Create(stripe,TweenInfo.new(0.18),{BackgroundTransparency=0}):Play() else TS:Create(bg,TweenInfo.new(0.18),{BackgroundColor3=Color3.fromRGB(24,24,42)}):Play(); TS:Create(ci,TweenInfo.new(0.18),{Position=UDim2.new(0,3,0.5,-10),BackgroundColor3=C.muted}):Play(); TS:Create(l,TweenInfo.new(0.18),{TextColor3=C.off}):Play(); TS:Create(stripe,TweenInfo.new(0.18),{BackgroundTransparency=1}):Play() end; cb(on) end); return row end
local function btn(p,txt,cb,col) local col=col or C.main; local b=Instance.new("TextButton",p); b.Size=UDim2.new(1,0,0,46); b.BackgroundColor3=col; b.BorderSizePixel=0; b.Text=txt; b.TextColor3=C.white; b.TextSize=12; b.Font=Enum.Font.GothamBold; b.AutoButtonColor=false; cr(b,12); b.MouseButton1Down:Connect(function() TS:Create(b,TweenInfo.new(0.07),{Size=UDim2.new(1,0,0,41)}):Play() end); b.MouseButton1Up:Connect(function() TS:Create(b,TweenInfo.new(0.07),{Size=UDim2.new(1,0,0,46)}):Play() end); b.MouseButton1Click:Connect(cb); return b end

-- ════════════════════════════════════
-- 🏎️ FARM TAB
-- ════════════════════════════════════
sec(fP,"🏎️  AUTO RACE FARM",C.main)
local clickCount=0; local clickLbl=lbl2(fP,"🖱️ Clicks this session: 0",C.white)
tog(fP,"🏎️  Auto Click (Race Clicking)",function(on)
    getgenv().autoClick=on
    if on then task.spawn(function()
        while getgenv().autoClick do
            pcall(function()
                local vps=game:GetService("VirtualUser")
                vps:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                vps:Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                clickCount=clickCount+1; clickLbl.Text="🖱️ Clicks this session: "..clickCount
            end); task.wait(0.05)
        end
    end) end
end,C.main)
tog(fP,"⚡  Fast Auto Click (0.01s)",function(on)
    getgenv().fastClick=on
    if on then task.spawn(function()
        while getgenv().fastClick do
            pcall(function()
                local vps=game:GetService("VirtualUser")
                vps:Button1Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                vps:Button1Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                clickCount=clickCount+1; clickLbl.Text="🖱️ Clicks this session: "..clickCount
            end); task.wait(0.01)
        end
    end) end
end,C.main)
div(fP)
sec(fP,"🔄  AUTO RACE",C.pink)
tog(fP,"🔄  Auto Race Start/Restart",function(on)
    getgenv().autoRace=on
    if on then task.spawn(function()
        while getgenv().autoRace do
            pcall(function()
                local rs=RS:FindFirstChild("rEvents") or RS:FindFirstChild("GameEvents") or RS:FindFirstChild("RemoteEvents")
                if rs then
                    local startRemote=rs:FindFirstChild("startRace") or rs:FindFirstChild("RaceStart") or rs:FindFirstChild("Start")
                    if startRemote then startRemote:FireServer() end
                end
            end); task.wait(2)
        end
    end) end
end,C.pink)
tog(fP,"🏁  Auto Finish Race",function(on)
    getgenv().autoFinish=on
    if on then task.spawn(function()
        while getgenv().autoFinish do
            pcall(function()
                local rs=RS:FindFirstChild("rEvents") or RS:FindFirstChild("GameEvents")
                if rs then
                    local finish=rs:FindFirstChild("finishRace") or rs:FindFirstChild("RaceFinish")
                    if finish then finish:FireServer() end
                end
            end); task.wait(1)
        end
    end) end
end,C.pink)

-- ════════════════════════════════════
-- ⚡ SPEED TAB
-- ════════════════════════════════════
sec(spP,"⚡  SPEED MODS",C.orange)
tog(spP,"⚡  Speed Hack (100 speed)",function(on) getgenv().spH=on; if on then task.spawn(function() while getgenv().spH do pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=100 end end); task.wait(0.1) end; pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=16 end end) end) end end,C.orange)
tog(spP,"🚀  Ultra Speed (250 speed)",function(on) getgenv().ultraSp=on; if on then task.spawn(function() while getgenv().ultraSp do pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=250 end end); task.wait(0.1) end; pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=16 end end) end) end end,C.orange)
tog(spP,"🦘  High Jump",function(on) getgenv().hjump=on; task.spawn(function() while getgenv().hjump do pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower=100 end end); task.wait(0.1) end; pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower=50 end end) end) end,C.orange)
tog(spP,"♾️  Infinite Jump",function(on) getgenv().infJ2=on; if on then game:GetService("UserInputService").JumpRequest:Connect(function() if getgenv().infJ2 and LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) end end,C.orange)
div(spP)
sec(spP,"🚗  VEHICLE SPEED",C.orange)
tog(spP,"🚗  Auto Max Vehicle Speed",function(on)
    getgenv().carSpeed=on
    if on then task.spawn(function()
        while getgenv().carSpeed do
            pcall(function()
                local char=LP.Character
                if char then for _,v in pairs(char:GetDescendants()) do
                    if v:IsA("VehicleSeat") then v.MaxSpeed=1000; v.Torque=1000 end
                end end
            end); task.wait(0.2)
        end
    end) end
end,C.orange)

-- ════════════════════════════════════
-- 💰 MONEY TAB
-- ════════════════════════════════════
sec(mnP,"💰  AUTO UPGRADE",C.amber)
tog(mnP,"💰  Auto Buy Upgrades",function(on)
    getgenv().autoUpgrade=on
    if on then task.spawn(function()
        while getgenv().autoUpgrade do
            pcall(function()
                local rs=RS:FindFirstChild("rEvents") or RS:FindFirstChild("GameEvents")
                if rs then
                    for _,remote in pairs(rs:GetChildren()) do
                        if remote.ClassName=="RemoteEvent" and (remote.Name:lower():find("upgrade") or remote.Name:lower():find("buy")) then
                            remote:FireServer()
                        end
                    end
                end
            end); task.wait(1)
        end
    end) end
end,C.amber)
tog(mnP,"⭐  Auto Prestige/Rebirth",function(on)
    getgenv().autoPrestige=on
    if on then task.spawn(function()
        while getgenv().autoPrestige do
            pcall(function()
                local rs=RS:FindFirstChild("rEvents") or RS:FindFirstChild("GameEvents")
                if rs then
                    local pRemote=rs:FindFirstChild("prestige") or rs:FindFirstChild("Prestige") or rs:FindFirstChild("rebirth")
                    if pRemote then pRemote:FireServer() end
                end
            end); task.wait(3)
        end
    end) end
end,C.amber)

-- ════════════════════════════════════
-- ⚙️ SETTINGS TAB
-- ════════════════════════════════════
sec(seP,"🖥️  PERFORMANCE",C.blue)
tog(seP,"🖥️  Low Graphics (FPS Boost)",function(on) game.Lighting.GlobalShadows=not on; game.Lighting.FogEnd=on and 9e9 or 1e5; settings().Rendering.QualityLevel=on and "Level01" or "Level21"; notify("SCP HUB",on and "🖥️ Low Graphics ON!" or "Normal",3) end,C.blue)
div(seP)
sec(seP,"🛡️  MISC",C.blue)
btn(seP,"🛡️  Anti AFK",function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/New%20anti%20afk%20v2"))() end); notify("SCP HUB","🛡️ Anti AFK ON!",3) end,C.greenD)
btn(seP,"📋  Copy Discord",function() setclipboard("https://discord.gg/nDSy4jdVDc"); notify("SCP HUB","📋 Discord copied!",3) end,C.blueD)
lbl2(seP,"👑 Made by TEJAZ  •  discord.gg/nDSy4jdVDc")

-- ════════════════════════════════════
-- ✨ ANIMATIONS
-- ════════════════════════════════════
TS:Create(mW,TweenInfo.new(0.7,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-WIN_W/2,0.5,-WIN_H/2)}):Play()
task.spawn(function() local t=0; while hG.Parent do t=t+0.025; mBdr.Color=Color3.new(0.55+(math.sin(t)+1)/2*0.1,0,0.8+(math.sin(t)+1)/2*0.2); task.wait(0.05) end end)
notify("SCP HUB","🏎️ Race Clicker Hub Loaded! Made by TEJAZ 🔥",4)
