-- ╔══════════════════════════════════════════════════╗
--    ⚡  SCP HUB  |  RIVALS  V5
--    👑 Made by TEJAZ  |  discord.gg/nDSy4jdVDc
--    Key: SCPONTOP
-- ╚══════════════════════════════════════════════════╝

local Players    = game:GetService("Players")
local RunSvc     = game:GetService("RunService")
local UIS        = game:GetService("UserInputService")
local TS         = game:GetService("TweenService")
local SG         = game:GetService("StarterGui")
local LP         = Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end
local function cr(i,r) Instance.new("UICorner",i).CornerRadius=UDim.new(0,r or 12) end
local function ms(i,c,t) local s=Instance.new("UIStroke",i); s.Color=c; s.Thickness=t or 1.5; return s end
local function fixRound(parent,col) local f=Instance.new("Frame",parent); f.Size=UDim2.new(1,0,0.5,0); f.Position=UDim2.new(0,0,0.5,0); f.BackgroundColor3=col; f.BorderSizePixel=0 end

-- ── ELITE THEME ────────────────────────────────────
local C = {
    bg=Color3.fromRGB(8,8,14), panel=Color3.fromRGB(13,13,22),
    card=Color3.fromRGB(16,16,28), cardH=Color3.fromRGB(21,21,36),
    border=Color3.fromRGB(32,32,55), white=Color3.fromRGB(255,255,255),
    off=Color3.fromRGB(160,160,195), muted=Color3.fromRGB(65,65,100),
    red=Color3.fromRGB(230,30,30), redD=Color3.fromRGB(140,0,0),
    blue=Color3.fromRGB(0,140,255), blueD=Color3.fromRGB(0,80,180),
    green=Color3.fromRGB(0,210,90), greenD=Color3.fromRGB(0,130,55),
    amber=Color3.fromRGB(255,180,0), purple=Color3.fromRGB(140,50,255),
    cyan=Color3.fromRGB(0,210,220), orange=Color3.fromRGB(255,130,0),
}
local CORRECT_KEY = "SCPONTOP"

-- ════════════════════════════════════
-- 🔑 KEY SYSTEM
-- ════════════════════════════════════
local kG=Instance.new("ScreenGui"); kG.Name="SCPRivalsKey"; kG.ResetOnSpawn=false; kG.DisplayOrder=999; kG.Parent=LP:WaitForChild("PlayerGui")
local kOv=Instance.new("Frame",kG); kOv.Size=UDim2.new(1,0,1,0); kOv.BackgroundColor3=Color3.fromRGB(0,0,0); kOv.BackgroundTransparency=0.4; kOv.BorderSizePixel=0

local kCard=Instance.new("Frame",kG); kCard.Size=UDim2.new(0,330,0,460); kCard.BackgroundColor3=C.bg; kCard.BorderSizePixel=0; cr(kCard,26)
local kBdr=ms(kCard,C.blue,2.5)

-- Tri-colour strip (blue theme for Rivals)
for i,col in ipairs({C.blue,Color3.fromRGB(0,100,200),Color3.fromRGB(0,60,160)}) do
    local f=Instance.new("Frame",kCard); f.Size=UDim2.new(0.34,0,0,3); f.Position=UDim2.new((i-1)*0.33,0,0,0); f.BackgroundColor3=col; f.BorderSizePixel=0; f.ZIndex=3
end

local kHdr=Instance.new("Frame",kCard); kHdr.Size=UDim2.new(1,0,0,158); kHdr.BackgroundColor3=C.panel; kHdr.BorderSizePixel=0; cr(kHdr,26); fixRound(kHdr,C.panel)
local kGlow=Instance.new("ImageLabel",kHdr); kGlow.Size=UDim2.new(0,160,0,160); kGlow.Position=UDim2.new(0.5,-80,0,-30); kGlow.BackgroundTransparency=1; kGlow.Image="rbxassetid://7072725342"; kGlow.ImageColor3=C.blue; kGlow.ImageTransparency=0.7; kGlow.ZIndex=2
local kLogo=Instance.new("ImageLabel",kCard); kLogo.Size=UDim2.new(0,84,0,84); kLogo.Position=UDim2.new(0.5,-42,0,11); kLogo.BackgroundTransparency=1; kLogo.Image="rbxassetid://125515680929159"; kLogo.ScaleType=Enum.ScaleType.Fit; kLogo.ZIndex=4

local function kl(txt,y,sz,col,font) local l=Instance.new("TextLabel",kCard); l.Size=UDim2.new(1,0,0,sz+4); l.Position=UDim2.new(0,0,0,y); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.white; l.TextSize=sz or 14; l.Font=font or Enum.Font.GothamBlack; return l end
kl("⚡  SCP  HUB  ⚡",100,22,C.white); kl("⚔️ RIVALS  •  🔑 KEY SYSTEM",127,11,C.blue,Enum.Font.GothamBold)

local kInfo=Instance.new("Frame",kCard); kInfo.Size=UDim2.new(1,-24,0,44); kInfo.Position=UDim2.new(0,12,0,155); kInfo.BackgroundColor3=C.card; kInfo.BorderSizePixel=0; cr(kInfo,12); ms(kInfo,C.border,1)
local kIL=Instance.new("TextLabel",kInfo); kIL.Size=UDim2.new(1,-16,1,0); kIL.Position=UDim2.new(0,8,0,0); kIL.BackgroundTransparency=1; kIL.Text="🔑 Key: SCPONTOP  •  Or join discord.gg/nDSy4jdVDc"; kIL.TextColor3=C.off; kIL.TextSize=11; kIL.Font=Enum.Font.Gotham; kIL.TextWrapped=true
kl("ENTER YOUR KEY",208,10,C.muted,Enum.Font.GothamBold)

local kIBg=Instance.new("Frame",kCard); kIBg.Size=UDim2.new(1,-24,0,52); kIBg.Position=UDim2.new(0,12,0,224); kIBg.BackgroundColor3=C.card; kIBg.BorderSizePixel=0; cr(kIBg,14)
local kIS=ms(kIBg,C.border,1.5)
local kInput=Instance.new("TextBox",kIBg); kInput.Size=UDim2.new(1,-18,1,0); kInput.Position=UDim2.new(0,9,0,0); kInput.BackgroundTransparency=1; kInput.Text=""; kInput.PlaceholderText="  Type: SCPONTOP"; kInput.PlaceholderColor3=C.muted; kInput.TextColor3=C.white; kInput.TextSize=15; kInput.Font=Enum.Font.GothamBold; kInput.ClearTextOnFocus=false

local kStat=kl("",285,12,C.red,Enum.Font.GothamBold)

local kBtn=Instance.new("TextButton",kCard); kBtn.Size=UDim2.new(1,-24,0,52); kBtn.Position=UDim2.new(0,12,0,308); kBtn.BackgroundColor3=C.blue; kBtn.BorderSizePixel=0; kBtn.Text="✅  UNLOCK RIVALS"; kBtn.TextColor3=C.white; kBtn.TextSize=16; kBtn.Font=Enum.Font.GothamBlack; kBtn.AutoButtonColor=false; cr(kBtn,14)
local kDisc=Instance.new("TextButton",kCard); kDisc.Size=UDim2.new(1,-24,0,38); kDisc.Position=UDim2.new(0,12,0,374); kDisc.BackgroundColor3=C.card; kDisc.BorderSizePixel=0; kDisc.Text="💬  discord.gg/nDSy4jdVDc  •  Key: SCPONTOP"; kDisc.TextColor3=C.cyan; kDisc.TextSize=11; kDisc.Font=Enum.Font.GothamBold; kDisc.AutoButtonColor=false; cr(kDisc,12); ms(kDisc,C.blueD,1)
kDisc.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/nDSy4jdVDc"); kStat.Text="✅ Discord copied!"; kStat.TextColor3=C.green end)

kCard.Position=UDim2.new(0.5,-165,1.5,0)
TS:Create(kCard,TweenInfo.new(0.65,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-165,0.5,-230)}):Play()
task.spawn(function() local t=0; while kG.Parent do t=t+0.025; kBdr.Color=Color3.new(0,(math.sin(t)+1)/2*0.4+0.35,0.8+(math.sin(t)+1)/2*0.2); task.wait(0.05) end end)
task.spawn(function() while kG.Parent do TS:Create(kLogo,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,92,0,92)}):Play(); task.wait(1); TS:Create(kLogo,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,84,0,84)}):Play(); task.wait(1) end end)
kBtn.MouseButton1Down:Connect(function() TS:Create(kBtn,TweenInfo.new(0.07),{Size=UDim2.new(1,-24,0,47)}):Play() end)
kBtn.MouseButton1Up:Connect(function() TS:Create(kBtn,TweenInfo.new(0.07),{Size=UDim2.new(1,-24,0,52)}):Play() end)

local keyOK=false
local function verify()
    local e=kInput.Text:match("^%s*(.-)%s*$"); kStat.TextColor3=C.amber; kStat.Text="⏳ Checking key..."
    task.spawn(function()
        if e==CORRECT_KEY then
            kStat.TextColor3=C.green; kStat.Text="✅ Key accepted! Loading..."
            kBtn.BackgroundColor3=C.greenD; kIS.Color=C.green; kBdr.Color=C.green
            task.wait(1.2); kG:Destroy(); keyOK=true
        else
            kStat.TextColor3=C.red; kStat.Text="❌ Wrong key! Key is: SCPONTOP"
            kIS.Color=C.red
            for i=1,4 do TS:Create(kCard,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-153,0.5,-230)}):Play(); task.wait(0.04); TS:Create(kCard,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-177,0.5,-230)}):Play(); task.wait(0.04) end
            TS:Create(kCard,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-165,0.5,-230)}):Play(); task.wait(0.4); kIS.Color=C.border
        end
    end)
end
kBtn.MouseButton1Click:Connect(verify); kInput.FocusLost:Connect(function(e) if e then verify() end end)
repeat task.wait() until keyOK

-- ════════════════════════════════════
-- 🎮 RIVALS HUB — ELITE DESIGN
-- ════════════════════════════════════
local cG=Instance.new("ScreenGui"); cG.Name="SCPRivalsLogo"; cG.ResetOnSpawn=false; cG.DisplayOrder=9998; cG.Parent=LP:WaitForChild("PlayerGui")
local cI=Instance.new("ImageLabel",cG); cI.Size=UDim2.new(0,52,0,52); cI.Position=UDim2.new(0,6,0,6); cI.BackgroundTransparency=1; cI.Image="rbxassetid://125515680929159"; cI.ScaleType=Enum.ScaleType.Fit

local WIN_W,WIN_H=360,570
local hG=Instance.new("ScreenGui"); hG.Name="SCPRivals_V5"; hG.ResetOnSpawn=false; hG.DisplayOrder=100; hG.Parent=LP:WaitForChild("PlayerGui")

local mW=Instance.new("Frame",hG); mW.Size=UDim2.new(0,WIN_W,0,WIN_H); mW.Position=UDim2.new(0.5,-WIN_W/2,1.5,0); mW.BackgroundColor3=C.bg; mW.BorderSizePixel=0; mW.Active=true; mW.Draggable=true; cr(mW,22)
local mBdr=ms(mW,C.blue,2)

-- Tri strip (blue for rivals)
for i,col in ipairs({C.blue,Color3.fromRGB(0,100,200),Color3.fromRGB(0,60,160)}) do
    local f=Instance.new("Frame",mW); f.Size=UDim2.new(0.34,0,0,3); f.Position=UDim2.new((i-1)*0.33,0,0,0); f.BackgroundColor3=col; f.BorderSizePixel=0; f.ZIndex=4
end

-- Title bar
local tB=Instance.new("Frame",mW); tB.Size=UDim2.new(1,0,0,54); tB.BackgroundColor3=C.panel; tB.BorderSizePixel=0; cr(tB,22); fixRound(tB,C.panel)
local tLogo=Instance.new("ImageLabel",tB); tLogo.Size=UDim2.new(0,36,0,36); tLogo.Position=UDim2.new(0,8,0.5,-18); tLogo.BackgroundTransparency=1; tLogo.Image="rbxassetid://125515680929159"; tLogo.ScaleType=Enum.ScaleType.Fit
local tTit=Instance.new("TextLabel",tB); tTit.Size=UDim2.new(1,-100,1,0); tTit.Position=UDim2.new(0,50,0,0); tTit.BackgroundTransparency=1; tTit.Text="⚡ SCP HUB  •  ⚔️ RIVALS"; tTit.TextColor3=C.white; tTit.TextSize=14; tTit.Font=Enum.Font.GothamBlack; tTit.TextXAlignment=Enum.TextXAlignment.Left

local uBadge=Instance.new("Frame",tB); uBadge.Size=UDim2.new(0,0,0,18); uBadge.Position=UDim2.new(0,50,1,-20); uBadge.BackgroundColor3=C.blueD; uBadge.BorderSizePixel=0; uBadge.AutomaticSize=Enum.AutomaticSize.X; cr(uBadge,5)
local uBL=Instance.new("TextLabel",uBadge); uBL.Size=UDim2.new(0,0,1,0); uBL.BackgroundTransparency=1; uBL.Text="  ⚔️ RIVALS V5  "; uBL.TextColor3=C.white; uBL.TextSize=9; uBL.Font=Enum.Font.GothamBold; uBL.AutomaticSize=Enum.AutomaticSize.X

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

local TABS={{n="🎯 AIMBOT",c=C.red},{n="👤 PLAYER",c=C.blue},{n="👁️ VISUALS",c=C.green},{n="⚙️ SETUP",c=C.purple}}
local tBtns={};local tPages={}
for i,t in ipairs(TABS) do
    local b=Instance.new("TextButton",tScr); b.Size=UDim2.new(0,76,0,26); b.BackgroundColor3=C.bg; b.BorderSizePixel=0; b.Text=t.n; b.TextColor3=C.muted; b.TextSize=9; b.Font=Enum.Font.GothamBold; b.LayoutOrder=i; b.AutoButtonColor=false; cr(b,8)
    local page=Instance.new("ScrollingFrame",cArea); page.Size=UDim2.new(1,0,1,0); page.BackgroundTransparency=1; page.BorderSizePixel=0; page.ScrollBarThickness=3; page.ScrollBarImageColor3=t.c; page.CanvasSize=UDim2.new(0,0,0,0); page.Visible=false
    local ul=Instance.new("UIListLayout",page); ul.Padding=UDim.new(0,6); ul.SortOrder=Enum.SortOrder.LayoutOrder
    local pd=Instance.new("UIPadding",page); pd.PaddingLeft=UDim.new(0,8); pd.PaddingRight=UDim.new(0,8); pd.PaddingTop=UDim.new(0,8)
    ul:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() page.CanvasSize=UDim2.new(0,0,0,ul.AbsoluteContentSize.Y+16) end)
    b.MouseButton1Click:Connect(function() for _,p in ipairs(tPages) do p.Visible=false end; for _,bx in ipairs(tBtns) do bx.BackgroundColor3=C.bg; bx.TextColor3=C.muted end; page.Visible=true; b.BackgroundColor3=t.c; b.TextColor3=C.white end)
    table.insert(tBtns,b); table.insert(tPages,page)
end
tBtns[1].BackgroundColor3=TABS[1].c; tBtns[1].TextColor3=C.white; tPages[1].Visible=true
local aP,plP,viP,seP=tPages[1],tPages[2],tPages[3],tPages[4]

-- UI helpers
local function sec(p,txt,col) local f=Instance.new("Frame",p); f.Size=UDim2.new(1,0,0,28); f.BackgroundColor3=Color3.fromRGB(12,12,22); f.BorderSizePixel=0; cr(f,8); local a=Instance.new("Frame",f); a.Size=UDim2.new(0,3,0.6,0); a.Position=UDim2.new(0,0,0.2,0); a.BackgroundColor3=col or C.red; a.BorderSizePixel=0; cr(a,3); local l=Instance.new("TextLabel",f); l.Size=UDim2.new(1,-16,1,0); l.Position=UDim2.new(0,12,0,0); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.red; l.TextSize=11; l.Font=Enum.Font.GothamBlack; l.TextXAlignment=Enum.TextXAlignment.Left; return f end
local function lbl2(p,txt,col) local l=Instance.new("TextLabel",p); l.Size=UDim2.new(1,0,0,0); l.AutomaticSize=Enum.AutomaticSize.Y; l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=col or C.off; l.TextSize=11; l.Font=Enum.Font.GothamBold; l.TextXAlignment=Enum.TextXAlignment.Left; l.TextWrapped=true; return l end
local function div(p) local d=Instance.new("Frame",p); d.Size=UDim2.new(1,0,0,1); d.BackgroundColor3=C.border; d.BorderSizePixel=0 end
local function tog(p,txt,cb,col) local col=col or C.red; local row=Instance.new("Frame",p); row.Size=UDim2.new(1,0,0,48); row.BackgroundColor3=C.card; row.BorderSizePixel=0; cr(row,12); ms(row,C.border,1); local stripe=Instance.new("Frame",row); stripe.Size=UDim2.new(0,3,0.5,0); stripe.Position=UDim2.new(0,0,0.25,0); stripe.BackgroundColor3=col; stripe.BackgroundTransparency=1; stripe.BorderSizePixel=0; cr(stripe,3); local l=Instance.new("TextLabel",row); l.Size=UDim2.new(1,-62,1,0); l.Position=UDim2.new(0,12,0,0); l.BackgroundTransparency=1; l.Text=txt; l.TextColor3=C.off; l.TextSize=12; l.Font=Enum.Font.GothamBold; l.TextXAlignment=Enum.TextXAlignment.Left; l.TextWrapped=true; local bg=Instance.new("TextButton",row); bg.Size=UDim2.new(0,48,0,26); bg.Position=UDim2.new(1,-56,0.5,-13); bg.BackgroundColor3=Color3.fromRGB(24,24,42); bg.BorderSizePixel=0; bg.Text=""; bg.AutoButtonColor=false; cr(bg,13); local ci=Instance.new("Frame",bg); ci.Size=UDim2.new(0,20,0,20); ci.Position=UDim2.new(0,3,0.5,-10); ci.BackgroundColor3=C.muted; ci.BorderSizePixel=0; cr(ci,10); local on=false; bg.MouseButton1Click:Connect(function() on=not on; if on then TS:Create(bg,TweenInfo.new(0.18),{BackgroundColor3=col}):Play(); TS:Create(ci,TweenInfo.new(0.18),{Position=UDim2.new(1,-23,0.5,-10),BackgroundColor3=C.white}):Play(); TS:Create(l,TweenInfo.new(0.18),{TextColor3=C.white}):Play(); TS:Create(stripe,TweenInfo.new(0.18),{BackgroundTransparency=0}):Play() else TS:Create(bg,TweenInfo.new(0.18),{BackgroundColor3=Color3.fromRGB(24,24,42)}):Play(); TS:Create(ci,TweenInfo.new(0.18),{Position=UDim2.new(0,3,0.5,-10),BackgroundColor3=C.muted}):Play(); TS:Create(l,TweenInfo.new(0.18),{TextColor3=C.off}):Play(); TS:Create(stripe,TweenInfo.new(0.18),{BackgroundTransparency=1}):Play() end; cb(on) end); return row end
local function btn(p,txt,cb,col) local col=col or C.red; local b=Instance.new("TextButton",p); b.Size=UDim2.new(1,0,0,46); b.BackgroundColor3=col; b.BorderSizePixel=0; b.Text=txt; b.TextColor3=C.white; b.TextSize=12; b.Font=Enum.Font.GothamBold; b.AutoButtonColor=false; cr(b,12); b.MouseButton1Down:Connect(function() TS:Create(b,TweenInfo.new(0.07),{Size=UDim2.new(1,0,0,41)}):Play() end); b.MouseButton1Up:Connect(function() TS:Create(b,TweenInfo.new(0.07),{Size=UDim2.new(1,0,0,46)}):Play() end); b.MouseButton1Click:Connect(cb); return b end

-- ════════════════════════════════════
-- 🎯 AIMBOT TAB
-- ════════════════════════════════════
sec(aP,"🎯  AIMBOT SETTINGS",C.red)
local aimbotOn=false; local aFOV=150; local aSmooth=0.3; local aPart="Head"
tog(aP,"🎯  Aimbot (Hold Right Click)",function(on)
    aimbotOn=on; if on then notify("SCP HUB","🎯 Aimbot ON! Hold Right Click!",3)
        task.spawn(function()
            while aimbotOn do task.wait()
                pcall(function()
                    if not UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
                    local cam=workspace.CurrentCamera; local closest,closestDist=nil,aFOV
                    for _,p in ipairs(Players:GetPlayers()) do
                        if p~=LP and p.Character then
                            local hrp=p.Character:FindFirstChild("HumanoidRootPart"); local hum=p.Character:FindFirstChild("Humanoid")
                            if hrp and hum and hum.Health>0 then
                                local sp,onS=cam:WorldToViewportPoint(hrp.Position)
                                if onS then local d=(Vector2.new(sp.X,sp.Y)-Vector2.new(cam.ViewportSize.X/2,cam.ViewportSize.Y/2)).Magnitude; if d<closestDist then closestDist=d; closest=p end end
                            end
                        end
                    end
                    if closest and closest.Character then
                        local tp=closest.Character:FindFirstChild(aPart) or closest.Character:FindFirstChild("HumanoidRootPart")
                        if tp then cam.CFrame=cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position,tp.Position),aSmooth) end
                    end
                end)
            end
        end)
    end
end,C.red)
tog(aP,"🔇  Silent Aim",function(on) getgenv().silentAim=on; notify("SCP HUB",on and "🔇 Silent Aim ON!" or "Silent Aim OFF",3) end,C.red)
div(aP)
sec(aP,"⚙️  AIMBOT OPTIONS",C.amber)
lbl2(aP,"FOV: "..aFOV.." px  •  Smoothness: "..aSmooth)
btn(aP,"⬆️  Increase FOV (+50)",function() aFOV=math.min(aFOV+50,500); notify("SCP HUB","FOV: "..aFOV,2) end,C.card)
btn(aP,"⬇️  Decrease FOV (-50)",function() aFOV=math.max(aFOV-50,50); notify("SCP HUB","FOV: "..aFOV,2) end,C.card)
btn(aP,"⚡  Toggle Aim Part: Head/HRP",function() aPart=aPart=="Head" and "HumanoidRootPart" or "Head"; notify("SCP HUB","Aim Part: "..aPart,3) end,C.card)

-- ════════════════════════════════════
-- 👤 PLAYER TAB
-- ════════════════════════════════════
sec(plP,"⚡  MOVEMENT",C.blue)
tog(plP,"⚡  Speed Hack (100 speed)",function(on) getgenv().speedH=on; if on then task.spawn(function() while getgenv().speedH do pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=100 end end); task.wait(0.1) end; pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=16 end end) end) end end,C.blue)
tog(plP,"🦘  High Jump (100 power)",function(on) getgenv().hjump=on; task.spawn(function() while getgenv().hjump do pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower=100 end end); task.wait(0.1) end; pcall(function() if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower=50 end end) end) end,C.blue)
tog(plP,"♾️  Infinite Jump",function(on) getgenv().infJ=on; if on then UIS.JumpRequest:Connect(function() if getgenv().infJ and LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) end end,C.blue)
div(plP)
sec(plP,"🛡️  MECHANICS",C.blue)
tog(plP,"👻  Noclip",function(on) getgenv().noclip=on; if on then RunSvc.Stepped:Connect(function() if getgenv().noclip and LP.Character then for _,p in pairs(LP.Character:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide=false end end end end) end end,C.blue)
tog(plP,"🌀  Spin (Anti Aim)",function(on) getgenv().spinOn=on; if on then task.spawn(function() while getgenv().spinOn do pcall(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then LP.Character.HumanoidRootPart.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(10),0) end end); task.wait(0.05) end end) end end,C.blue)

-- ════════════════════════════════════
-- 👁️ VISUALS TAB
-- ════════════════════════════════════
sec(viP,"📦  ESP",C.green)
tog(viP,"📦  Player Box ESP",function(on)
    getgenv().espOn=on
    if on then task.spawn(function()
        while getgenv().espOn do
            for _,p in ipairs(Players:GetPlayers()) do if p~=LP and p.Character then local hrp=p.Character:FindFirstChild("HumanoidRootPart"); if hrp and not hrp:FindFirstChild("SCPBox_V5") then local box=Instance.new("BoxHandleAdornment"); box.Name="SCPBox_V5"; box.Adornee=hrp; box.AlwaysOnTop=true; box.Size=Vector3.new(4,6,2); box.Transparency=0.5; box.Color3=C.red; box.Parent=hrp end end end; task.wait(0.1)
        end
        for _,p in ipairs(Players:GetPlayers()) do if p.Character then local hrp=p.Character:FindFirstChild("HumanoidRootPart"); if hrp then local b=hrp:FindFirstChild("SCPBox_V5"); if b then b:Destroy() end end end end
    end) end
end,C.green)
tog(viP,"✨  Player Chams (Selection Box)",function(on)
    for _,p in ipairs(Players:GetPlayers()) do if p~=LP and p.Character then local ex=p.Character:FindFirstChild("SCP_Chams"); if on then if not ex then local h=Instance.new("SelectionBox"); h.Name="SCP_Chams"; h.Adornee=p.Character; h.Color3=C.blue; h.LineThickness=0.05; h.SurfaceTransparency=0.7; h.SurfaceColor3=C.blue; h.Parent=p.Character end else if ex then ex:Destroy() end end end end
end,C.green)
tog(viP,"🏷️  Name Tags (Billboard)",function(on)
    for _,p in ipairs(Players:GetPlayers()) do if p~=LP and p.Character then local hrp=p.Character:FindFirstChild("HumanoidRootPart"); if hrp then local ex=hrp:FindFirstChild("SCPTag"); if on and not ex then local bb=Instance.new("BillboardGui"); bb.Name="SCPTag"; bb.Size=UDim2.new(0,100,0,30); bb.StudsOffset=Vector3.new(0,3,0); bb.AlwaysOnTop=true; bb.Parent=hrp; local tl=Instance.new("TextLabel",bb); tl.Size=UDim2.new(1,0,1,0); tl.BackgroundTransparency=1; tl.Text=p.Name; tl.TextColor3=C.red; tl.TextSize=14; tl.Font=Enum.Font.GothamBlack elseif not on and ex then ex:Destroy() end end end end
end,C.green)

-- ════════════════════════════════════
-- ⚙️ SETTINGS TAB
-- ════════════════════════════════════
sec(seP,"🖥️  PERFORMANCE",C.purple)
tog(seP,"🖥️  Low Graphics (FPS Boost)",function(on) game.Lighting.GlobalShadows=not on; game.Lighting.FogEnd=on and 9e9 or 1e5; game.Lighting.Brightness=on and 0 or 2; settings().Rendering.QualityLevel=on and "Level01" or "Level21"; if on then for _,v in pairs(game:GetDescendants()) do pcall(function() if v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Lifetime=NumberRange.new(0) end end) end end; notify("SCP HUB",on and "🖥️ Low Graphics ON!" or "Normal Graphics",3) end,C.purple)
div(seP)
sec(seP,"🛡️  MISC",C.purple)
btn(seP,"🛡️  Anti AFK",function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/New%20anti%20afk%20v2"))() end); notify("SCP HUB","🛡️ Anti AFK ON!",3) end,C.greenD)
btn(seP,"📋  Copy Discord",function() setclipboard("https://discord.gg/nDSy4jdVDc"); notify("SCP HUB","📋 Discord copied!",3) end,C.blueD)
lbl2(seP,"👑 Made by TEJAZ  •  discord.gg/nDSy4jdVDc")

-- ════════════════════════════════════
-- ✨ ANIMATIONS
-- ════════════════════════════════════
TS:Create(mW,TweenInfo.new(0.7,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,-WIN_W/2,0.5,-WIN_H/2)}):Play()
task.spawn(function() local t=0; while hG.Parent do t=t+0.025; mBdr.Color=Color3.new(0,(math.sin(t)+1)/2*0.4+0.35,0.8+(math.sin(t)+1)/2*0.2); task.wait(0.05) end end)
notify("SCP HUB","⚔️ Rivals Hub Loaded! Made by TEJAZ 🔥",4)
