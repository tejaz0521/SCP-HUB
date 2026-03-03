-- ⚡ SCP HUB | MUSCLE LEGENDS V5 | Made by TEJAZ
local Players=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local RunSvc=game:GetService("RunService")
local TS=game:GetService("TweenService")
local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end
local function fmt(n) n=tonumber(n)or 0;if n>=1e12 then return("%.1fT"):format(n/1e12)elseif n>=1e9 then return("%.1fB"):format(n/1e9)elseif n>=1e6 then return("%.1fM"):format(n/1e6)elseif n>=1e3 then return("%.1fK"):format(n/1e3)else return tostring(math.floor(n))end end
local function findPlayer(q) if not q or q==""then return LP end;local l=q:lower();for _,p in ipairs(Players:GetPlayers())do if p.Name:lower()==l or p.DisplayName:lower()==l then return p end end;for _,p in ipairs(Players:GetPlayers())do if p.Name:lower():find(l,1,true)then return p end end end
local function getPunch() local p=LP.Backpack:FindFirstChild("Punch");if p and LP.Character then p.Parent=LP.Character end;return LP.Character and LP.Character:FindFirstChild("Punch") end

-- THEME (Nova Hub style, SCP branding)
local BG    = Color3.fromRGB(18,5,5)
local PANEL = Color3.fromRGB(28,8,8)
local CARD  = Color3.fromRGB(38,10,10)
local CARD2 = Color3.fromRGB(50,14,14)
local RED   = Color3.fromRGB(185,30,30)
local RED2  = Color3.fromRGB(220,45,45)
local WHITE = Color3.fromRGB(255,255,255)
local DIM   = Color3.fromRGB(190,160,160)
local MUTED = Color3.fromRGB(110,75,75)
local GREEN = Color3.fromRGB(0,210,80)
local BLUE  = Color3.fromRGB(80,140,255)
local AMBER = Color3.fromRGB(255,185,0)
local BORDER= Color3.fromRGB(70,18,18)

local function cr(i,r) local c=Instance.new("UICorner",i);c.CornerRadius=UDim.new(0,r or 8);return c end
local function stk(i,c,t) local s=Instance.new("UIStroke",i);s.Color=c;s.Thickness=t or 1;return s end

-- KEY SYSTEM
local KEY_URL="https://pastebin.com/raw/n7UWskEA"
local function getKeys()
    local ok,res=pcall(function()return game:HttpGet(KEY_URL)end)
    if not ok then return{"SCPONTOP"}end
    local k={}
    for v in res:gmatch("[^\n]+")do
        local t=v:match("^%s*(.-)%s*$")
        if t~=""then table.insert(k,t)end
    end
    return k
end
local function checkKey(e) for _,v in pairs(getKeys())do if v==e then return true end end;return false end

-- KEY SCREEN
local kG=Instance.new("ScreenGui");kG.Name="SCPKey";kG.ResetOnSpawn=false;kG.DisplayOrder=500;kG.Parent=LP:WaitForChild("PlayerGui")
local kOv=Instance.new("Frame",kG);kOv.Size=UDim2.new(1,0,1,0);kOv.BackgroundColor3=Color3.fromRGB(0,0,0);kOv.BackgroundTransparency=0.45;kOv.BorderSizePixel=0
local kC=Instance.new("Frame",kG);kC.Size=UDim2.new(0,310,0,400);kC.AnchorPoint=Vector2.new(0.5,0.5);kC.Position=UDim2.new(0.5,0,2,0);kC.BackgroundColor3=BG;kC.BorderSizePixel=0;cr(kC,12);stk(kC,RED,1.5)

local kTop=Instance.new("Frame",kC);kTop.Size=UDim2.new(1,0,0,110);kTop.BackgroundColor3=PANEL;kTop.BorderSizePixel=0;cr(kTop,12)
local kTopFix=Instance.new("Frame",kTop);kTopFix.Size=UDim2.new(1,0,0.5,0);kTopFix.Position=UDim2.new(0,0,0.5,0);kTopFix.BackgroundColor3=PANEL;kTopFix.BorderSizePixel=0

local kLogo=Instance.new("Frame",kC);kLogo.Size=UDim2.new(0,64,0,64);kLogo.AnchorPoint=Vector2.new(0.5,0);kLogo.Position=UDim2.new(0.5,0,0,14);kLogo.BackgroundColor3=RED;kLogo.BorderSizePixel=0;cr(kLogo,32);stk(kLogo,RED2,2)
local kImg=Instance.new("ImageLabel",kLogo);kImg.Size=UDim2.new(0.84,0,0.84,0);kImg.Position=UDim2.new(0.08,0,0.08,0);kImg.BackgroundTransparency=1;kImg.Image="rbxassetid://125515680929159";kImg.ScaleType=Enum.ScaleType.Fit

local kT1=Instance.new("TextLabel",kC);kT1.Size=UDim2.new(1,0,0,26);kT1.Position=UDim2.new(0,0,0,82);kT1.BackgroundTransparency=1;kT1.Text="⚡ SCP HUB ⚡";kT1.TextColor3=WHITE;kT1.TextSize=18;kT1.Font=Enum.Font.GothamBlack;kT1.TextXAlignment=Enum.TextXAlignment.Center
local kT2=Instance.new("TextLabel",kC);kT2.Size=UDim2.new(1,0,0,16);kT2.Position=UDim2.new(0,0,0,108);kT2.BackgroundTransparency=1;kT2.Text="💎 4.5 Version  |  Made by TEJAZ";kT2.TextColor3=RED2;kT2.TextSize=10;kT2.Font=Enum.Font.GothamBold;kT2.TextXAlignment=Enum.TextXAlignment.Center

local kInfo=Instance.new("Frame",kC);kInfo.Size=UDim2.new(1,-24,0,34);kInfo.Position=UDim2.new(0,12,0,132);kInfo.BackgroundColor3=CARD;kInfo.BorderSizePixel=0;cr(kInfo,8)
local kIL=Instance.new("TextLabel",kInfo);kIL.Size=UDim2.new(1,-8,1,0);kIL.Position=UDim2.new(0,4,0,0);kIL.BackgroundTransparency=1;kIL.Text="🔑 Get free key at discord.gg/nDSy4jdVDc";kIL.TextColor3=DIM;kIL.TextSize=9;kIL.Font=Enum.Font.GothamBold;kIL.TextWrapped=true

local kLbl=Instance.new("TextLabel",kC);kLbl.Size=UDim2.new(1,-24,0,14);kLbl.Position=UDim2.new(0,12,0,174);kLbl.BackgroundTransparency=1;kLbl.Text="💎 ENTER KEY";kLbl.TextColor3=MUTED;kLbl.TextSize=9;kLbl.Font=Enum.Font.GothamBlack;kLbl.TextXAlignment=Enum.TextXAlignment.Left

local kIBg=Instance.new("Frame",kC);kIBg.Size=UDim2.new(1,-24,0,42);kIBg.Position=UDim2.new(0,12,0,190);kIBg.BackgroundColor3=CARD;kIBg.BorderSizePixel=0;cr(kIBg,8)
local kIS=stk(kIBg,BORDER,1.5)
local kIn=Instance.new("TextBox",kIBg);kIn.Size=UDim2.new(1,-16,1,0);kIn.Position=UDim2.new(0,8,0,0);kIn.BackgroundTransparency=1;kIn.Text="";kIn.PlaceholderText="Paste your key here...";kIn.PlaceholderColor3=MUTED;kIn.TextColor3=WHITE;kIn.TextSize=12;kIn.Font=Enum.Font.GothamBold;kIn.ClearTextOnFocus=false

local kSt=Instance.new("TextLabel",kC);kSt.Size=UDim2.new(1,-24,0,16);kSt.Position=UDim2.new(0,12,0,238);kSt.BackgroundTransparency=1;kSt.Text="";kSt.TextColor3=RED2;kSt.TextSize=9;kSt.Font=Enum.Font.GothamBold;kSt.TextXAlignment=Enum.TextXAlignment.Left

local kBtn=Instance.new("TextButton",kC);kBtn.Size=UDim2.new(1,-24,0,42);kBtn.Position=UDim2.new(0,12,0,258);kBtn.BackgroundColor3=RED;kBtn.BorderSizePixel=0;kBtn.Text="⚡  UNLOCK SCP HUB";kBtn.TextColor3=WHITE;kBtn.TextSize=13;kBtn.Font=Enum.Font.GothamBlack;kBtn.AutoButtonColor=false;cr(kBtn,8)
local kDb=Instance.new("TextButton",kC);kDb.Size=UDim2.new(1,-24,0,34);kDb.Position=UDim2.new(0,12,0,310);kDb.BackgroundColor3=CARD;kDb.BorderSizePixel=0;kDb.Text="💬  Get Key  •  discord.gg/nDSy4jdVDc";kDb.TextColor3=BLUE;kDb.TextSize=9;kDb.Font=Enum.Font.GothamBold;kDb.AutoButtonColor=false;cr(kDb,8);stk(kDb,BORDER,1)
local kCr=Instance.new("TextLabel",kC);kCr.Size=UDim2.new(1,0,0,14);kCr.Position=UDim2.new(0,0,0,354);kCr.BackgroundTransparency=1;kCr.Text="👑 Made by TEJAZ  •  SCP_TEJAZ";kCr.TextColor3=MUTED;kCr.TextSize=8;kCr.Font=Enum.Font.GothamBold

kDb.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/nDSy4jdVDc");kSt.Text="✅ Discord copied!";kSt.TextColor3=GREEN end)

-- slide in
TS:Create(kC,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,0)}):Play()

local keyOK=false
local function verify()
    local e=kIn.Text:match("^%s*(.-)%s*$")
    if e==""then kSt.TextColor3=RED2;kSt.Text="❌ Enter a key first!";return end
    kSt.TextColor3=AMBER;kSt.Text="⏳ Checking..."
    task.spawn(function()
        if checkKey(e) then
            kSt.TextColor3=GREEN;kSt.Text="✅ Accepted! Loading..."
            kBtn.BackgroundColor3=GREEN;kIS.Color=GREEN
            task.wait(1)
            TS:Create(kC,TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Position=UDim2.new(0.5,0,2,0)}):Play()
            task.wait(0.35);kG:Destroy();keyOK=true
        else
            kSt.TextColor3=RED2;kSt.Text="❌ Wrong key! Check discord"
            kIS.Color=RED2
            for i=1,5 do
                TS:Create(kC,TweenInfo.new(0.04),{Position=UDim2.new(0.5,10,0.5,0)}):Play();task.wait(0.04)
                TS:Create(kC,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-10,0.5,0)}):Play();task.wait(0.04)
            end
            TS:Create(kC,TweenInfo.new(0.04),{Position=UDim2.new(0.5,0,0.5,0)}):Play()
            task.wait(0.2);kIS.Color=BORDER
        end
    end)
end
kBtn.MouseButton1Click:Connect(verify)
kIn.FocusLost:Connect(function(e) if e then verify() end end)
repeat task.wait() until keyOK

-- ══════════════════════════════
--  MAIN HUB GUI - NOVA STYLE
-- ══════════════════════════════
local W,H=338,520
local hG=Instance.new("ScreenGui");hG.Name="SCPHUB_V5";hG.ResetOnSpawn=false;hG.DisplayOrder=100;hG.Parent=LP:WaitForChild("PlayerGui")
local mW=Instance.new("Frame",hG);mW.Size=UDim2.new(0,W,0,H);mW.AnchorPoint=Vector2.new(0.5,0.5);mW.Position=UDim2.new(0.5,0,0.5,0);mW.BackgroundColor3=BG;mW.BorderSizePixel=0;mW.Active=true;mW.Draggable=true;cr(mW,10);stk(mW,RED,1.5)
TS:Create(mW,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,0)}):Play()

-- TOP BAR
local topBar=Instance.new("Frame",mW);topBar.Size=UDim2.new(1,0,0,44);topBar.BackgroundColor3=PANEL;topBar.BorderSizePixel=0;cr(topBar,10)
local tbFix=Instance.new("Frame",topBar);tbFix.Size=UDim2.new(1,0,0.5,0);tbFix.Position=UDim2.new(0,0,0.5,0);tbFix.BackgroundColor3=PANEL;tbFix.BorderSizePixel=0
local tLogo=Instance.new("Frame",topBar);tLogo.Size=UDim2.new(0,30,0,30);tLogo.Position=UDim2.new(0,8,0.5,-15);tLogo.BackgroundColor3=RED;tLogo.BorderSizePixel=0;cr(tLogo,15)
local tLImg=Instance.new("ImageLabel",tLogo);tLImg.Size=UDim2.new(0.84,0,0.84,0);tLImg.Position=UDim2.new(0.08,0,0.08,0);tLImg.BackgroundTransparency=1;tLImg.Image="rbxassetid://125515680929159";tLImg.ScaleType=Enum.ScaleType.Fit
local tTi=Instance.new("TextLabel",topBar);tTi.Size=UDim2.new(0,180,1,0);tTi.Position=UDim2.new(0,44,0,0);tTi.BackgroundTransparency=1;tTi.Text="Nova hub || 4.5 Version || Have good day ! - SCP_TEJAZ";tTi.TextColor3=WHITE;tTi.TextSize=8;tTi.Font=Enum.Font.GothamBold;tTi.TextXAlignment=Enum.TextXAlignment.Left;tTi.TextWrapped=true
local clsB=Instance.new("TextButton",topBar);clsB.Size=UDim2.new(0,24,0,24);clsB.Position=UDim2.new(1,-30,0.5,-12);clsB.BackgroundColor3=RED;clsB.BorderSizePixel=0;clsB.Text="✕";clsB.TextColor3=WHITE;clsB.TextSize=10;clsB.Font=Enum.Font.GothamBlack;clsB.AutoButtonColor=false;cr(clsB,6)
clsB.MouseButton1Click:Connect(function() hG:Destroy() end)
local minB=Instance.new("TextButton",topBar);minB.Size=UDim2.new(0,24,0,24);minB.Position=UDim2.new(1,-58,0.5,-12);minB.BackgroundColor3=CARD;minB.BorderSizePixel=0;minB.Text="—";minB.TextColor3=DIM;minB.TextSize=10;minB.Font=Enum.Font.GothamBlack;minB.AutoButtonColor=false;cr(minB,6)

-- TAB BAR (horizontal scrollable like Nova Hub)
local tabScroll=Instance.new("ScrollingFrame",mW);tabScroll.Size=UDim2.new(1,0,0,30);tabScroll.Position=UDim2.new(0,0,0,44);tabScroll.BackgroundColor3=Color3.fromRGB(12,3,3);tabScroll.BorderSizePixel=0;tabScroll.ScrollBarThickness=0;tabScroll.ScrollingDirection=Enum.ScrollingDirection.X;tabScroll.CanvasSize=UDim2.new(0,700,0,0)
Instance.new("UIListLayout",tabScroll).FillDirection=Enum.FillDirection.Horizontal

-- CONTENT
local cArea=Instance.new("ScrollingFrame",mW);cArea.Size=UDim2.new(1,-6,1,-80);cArea.Position=UDim2.new(0,3,0,78);cArea.BackgroundColor3=BG;cArea.BorderSizePixel=0;cArea.ScrollBarThickness=3;cArea.ScrollBarImageColor3=RED;cArea.CanvasSize=UDim2.new(0,0,0,0)
local cLL=Instance.new("UIListLayout",cArea);cLL.Padding=UDim.new(0,3);cLL.SortOrder=Enum.SortOrder.LayoutOrder
local cPd=Instance.new("UIPadding",cArea);cPd.PaddingLeft=UDim.new(0,3);cPd.PaddingRight=UDim.new(0,3);cPd.PaddingTop=UDim.new(0,3);cPd.PaddingBottom=UDim.new(0,3)
cLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() cArea.CanvasSize=UDim2.new(0,0,0,cLL.AbsoluteContentSize.Y+10) end)

local isMini=false
minB.MouseButton1Click:Connect(function()
    isMini=not isMini
    if isMini then TS:Create(mW,TweenInfo.new(0.2),{Size=UDim2.new(0,W,0,44)}):Play();tabScroll.Visible=false;cArea.Visible=false;minB.Text="+"
    else TS:Create(mW,TweenInfo.new(0.2),{Size=UDim2.new(0,W,0,H)}):Play();tabScroll.Visible=true;cArea.Visible=true;minB.Text="—" end
end)

-- TAB NAMES (exactly like Nova Hub)
local TABS={"Op Main","Farm","Fast Farm","Gifts","Misc","Crystals","Stats"}
local tBtns={}
local pages={}
for i=1,#TABS do pages[i]={} end

local function switchTab(idx)
    for i,p in ipairs(pages) do
        for _,v in ipairs(p) do v.Visible=(i==idx) end
    end
    for i,b in ipairs(tBtns) do
        if i==idx then b.BackgroundColor3=RED;b.TextColor3=WHITE
        else b.BackgroundColor3=Color3.fromRGB(12,3,3);b.TextColor3=MUTED end
    end
    cArea.CanvasPosition=Vector2.new(0,0)
end

for i,name in ipairs(TABS) do
    local b=Instance.new("TextButton",tabScroll)
    b.Size=UDim2.new(0,82,1,0);b.BackgroundColor3=i==1 and RED or Color3.fromRGB(12,3,3)
    b.BorderSizePixel=0;b.Text=name;b.TextColor3=i==1 and WHITE or MUTED
    b.TextSize=9;b.Font=Enum.Font.GothamBold;b.AutoButtonColor=false
    b.MouseButton1Click:Connect(function() switchTab(i) end)
    table.insert(tBtns,b)
end

-- UI HELPERS
local lo=0
local function newLO() lo=lo+1;return lo end

local function sec(parent,txt,emoji)
    local f=Instance.new("Frame",parent);f.Size=UDim2.new(1,0,0,26);f.BackgroundColor3=CARD2;f.BorderSizePixel=0;f.LayoutOrder=newLO();cr(f,6)
    local bar=Instance.new("Frame",f);bar.Size=UDim2.new(0,3,0.6,0);bar.Position=UDim2.new(0,0,0.2,0);bar.BackgroundColor3=RED2;bar.BorderSizePixel=0
    local l=Instance.new("TextLabel",f);l.Size=UDim2.new(1,-12,1,0);l.Position=UDim2.new(0,10,0,0);l.BackgroundTransparency=1
    l.Text=(emoji or "💎").." "..txt;l.TextColor3=WHITE;l.TextSize=10;l.Font=Enum.Font.GothamBlack;l.TextXAlignment=Enum.TextXAlignment.Left
    f.Visible=false;return f
end

local function tog(parent,txt,emoji,cb)
    local row=Instance.new("Frame",parent);row.Size=UDim2.new(1,0,0,38);row.BackgroundColor3=CARD;row.BorderSizePixel=0;row.LayoutOrder=newLO();cr(row,6);stk(row,BORDER,1)
    local icon=Instance.new("TextLabel",row);icon.Size=UDim2.new(0,22,1,0);icon.Position=UDim2.new(0,6,0,0);icon.BackgroundTransparency=1;icon.Text=emoji or "🛒";icon.TextSize=13
    local l=Instance.new("TextLabel",row);l.Size=UDim2.new(1,-74,1,0);l.Position=UDim2.new(0,30,0,0);l.BackgroundTransparency=1;l.Text=txt;l.TextColor3=DIM;l.TextSize=10;l.Font=Enum.Font.GothamBold;l.TextXAlignment=Enum.TextXAlignment.Left
    local bg=Instance.new("TextButton",row);bg.Size=UDim2.new(0,42,0,20);bg.Position=UDim2.new(1,-50,0.5,-10);bg.BackgroundColor3=Color3.fromRGB(28,8,8);bg.BorderSizePixel=0;bg.Text="";bg.AutoButtonColor=false;cr(bg,10)
    stk(bg,BORDER,1)
    local ci=Instance.new("Frame",bg);ci.Size=UDim2.new(0,14,0,14);ci.Position=UDim2.new(0,3,0.5,-7);ci.BackgroundColor3=MUTED;ci.BorderSizePixel=0;cr(ci,7)
    local on=false
    bg.MouseButton1Click:Connect(function()
        on=not on
        if on then
            TS:Create(bg,TweenInfo.new(0.15),{BackgroundColor3=RED}):Play()
            TS:Create(ci,TweenInfo.new(0.15),{Position=UDim2.new(1,-17,0.5,-7),BackgroundColor3=WHITE}):Play()
            TS:Create(l,TweenInfo.new(0.1),{TextColor3=WHITE}):Play()
        else
            TS:Create(bg,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(28,8,8)}):Play()
            TS:Create(ci,TweenInfo.new(0.15),{Position=UDim2.new(0,3,0.5,-7),BackgroundColor3=MUTED}):Play()
            TS:Create(l,TweenInfo.new(0.1),{TextColor3=DIM}):Play()
        end
        cb(on)
    end)
    row.Visible=false;return row
end

local function btn(parent,txt,emoji,cb)
    local b=Instance.new("TextButton",parent);b.Size=UDim2.new(1,0,0,38);b.BackgroundColor3=CARD;b.BorderSizePixel=0;b.Text="";b.AutoButtonColor=false;b.LayoutOrder=newLO();cr(b,6);stk(b,BORDER,1)
    local icon=Instance.new("TextLabel",b);icon.Size=UDim2.new(0,22,1,0);icon.Position=UDim2.new(0,6,0,0);icon.BackgroundTransparency=1;icon.Text=emoji or "▶️";icon.TextSize=13
    local l=Instance.new("TextLabel",b);l.Size=UDim2.new(1,-34,1,0);l.Position=UDim2.new(0,30,0,0);l.BackgroundTransparency=1;l.Text=txt;l.TextColor3=DIM;l.TextSize=10;l.Font=Enum.Font.GothamBold;l.TextXAlignment=Enum.TextXAlignment.Left
    b.MouseButton1Down:Connect(function() TS:Create(b,TweenInfo.new(0.07),{BackgroundColor3=CARD2}):Play() end)
    b.MouseButton1Up:Connect(function() TS:Create(b,TweenInfo.new(0.07),{BackgroundColor3=CARD}):Play() end)
    b.MouseButton1Click:Connect(cb);b.Visible=false;return b
end

local function inp(parent,ph,cb)
    local bg=Instance.new("Frame",parent);bg.Size=UDim2.new(1,0,0,38);bg.BackgroundColor3=CARD;bg.BorderSizePixel=0;bg.LayoutOrder=newLO();cr(bg,6);stk(bg,BORDER,1.5)
    local box=Instance.new("TextBox",bg);box.Size=UDim2.new(1,-14,1,0);box.Position=UDim2.new(0,7,0,0);box.BackgroundTransparency=1;box.Text="";box.PlaceholderText=ph;box.PlaceholderColor3=MUTED;box.TextColor3=WHITE;box.TextSize=10;box.Font=Enum.Font.Gotham;box.ClearTextOnFocus=false
    box.FocusLost:Connect(function() if box.Text~=""then cb(box.Text) end end)
    bg.Visible=false;return box,bg
end

local function lbl(parent,txt,col)
    local l=Instance.new("TextLabel",parent);l.Size=UDim2.new(1,0,0,22);l.BackgroundColor3=CARD;l.TextColor3=col or DIM;l.Text="  "..txt;l.TextSize=10;l.Font=Enum.Font.GothamBold;l.TextXAlignment=Enum.TextXAlignment.Left;l.BorderSizePixel=0;l.LayoutOrder=newLO();cr(l,6)
    l.Visible=false;return l
end

local function addTo(idx,item) table.insert(pages[idx],item) end

-- ═══ TAB 1: OP MAIN ═══
local s=sec(cArea,"Auto Punch","⚡");addTo(1,s)
local t=tog(cArea,"Auto Punch","👊",function(v) _G.ap=v;if v then task.spawn(function() while _G.ap do local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"));if p then if p.Parent~=LP.Character then p.Parent=LP.Character end;p:Activate() end;task.wait() end end) end end);addTo(1,t)
local t=tog(cArea,"Fast Punch","⚡",function(v) local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"));if p and p:FindFirstChild("attackTime")then p.attackTime.Value=v and 0 or 0.35 end end);addTo(1,t)
local s=sec(cArea,"Auto King","👑");addTo(1,s)
local t=tog(cArea,"Auto King (Lock Position)","👑",function(v) local kCF=CFrame.new(-8865,430,-5749);if v then if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=kCF end;getgenv().kL=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=kCF end end) elseif getgenv().kL then getgenv().kL:Disconnect();getgenv().kL=nil end end);addTo(1,t)
local s=sec(cArea,"Kill Players","⚔️");addTo(1,s)
local killM="Teleport"
local b=btn(cArea,"Toggle Kill Method: Teleport","🔄",function() killM=killM=="Teleport" and "Non-Teleport" or "Teleport";notify("SCP","Method: "..killM,2) end);addTo(1,b)
local wl={}
local _,wi=inp(cArea,"Whitelist player...",function(v) if table.find(wl,v)then for i,n in ipairs(wl)do if n==v then table.remove(wl,i);break end end else table.insert(wl,v) end;notify("SCP","Whitelist updated",2) end);addTo(1,wi)
local function doKill(t) if not t or t==LP then return end;local hrp=t.Character and t.Character:FindFirstChild("HumanoidRootPart");local p=getPunch();if not p or not hrp then return end;if killM=="Teleport" and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then hrp.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-3) end;p:Activate();local rh=LP.Character:FindFirstChild("RightHand");local lh=LP.Character:FindFirstChild("LeftHand");if rh and lh then firetouchinterest(rh,hrp,1);firetouchinterest(lh,hrp,1);firetouchinterest(rh,hrp,0);firetouchinterest(lh,hrp,0) end;local me=LP:FindFirstChild("muscleEvent");if me then me:FireServer("punch","rightHand");me:FireServer("punch","leftHand") end end
local t=tog(cArea,"Kill All Players","☠️",function(v) getgenv().kA=v;if v then task.spawn(function() while getgenv().kA do for _,p in ipairs(Players:GetPlayers())do if p~=LP and not table.find(wl,p.Name)then pcall(function() doKill(p) end) end end;task.wait() end end) end end);addTo(1,t)
local kTgt=""
local _,ki=inp(cArea,"Kill specific player...",function(v) kTgt=v end);addTo(1,ki)
local t=tog(cArea,"Kill Specific Player","🎯",function(v) getgenv().kO=v;if v then task.spawn(function() while getgenv().kO do local p=findPlayer(kTgt);if p and not table.find(wl,p.Name)then pcall(function() doKill(p) end) end;task.wait() end end) end end);addTo(1,t)
local s=sec(cArea,"Defense","🛡️");addTo(1,s)
local t=tog(cArea,"Anti Knockback","🛡️",function(v) local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if v and hrp then local bv=Instance.new("BodyVelocity",hrp);bv.MaxForce=Vector3.new(1e5,0,1e5);bv.Velocity=Vector3.new(0,0,0);bv.P=1250 elseif not v and hrp then local bv=hrp:FindFirstChild("BodyVelocity");if bv then bv:Destroy() end end end);addTo(1,t)

-- ═══ TAB 2: FARM ═══
local s=sec(cArea,"Auto Lift","⚡");addTo(2,s)
local t=tog(cArea,"Auto Lift (Rep Fire)","⚡",function(v) getgenv().aL=v;if v then task.spawn(function() while getgenv().aL do pcall(function() local pu=LP.Backpack:FindFirstChild("Pushup")or LP.Backpack:FindFirstChild("Pushups");if pu and LP.Character then pu.Parent=LP.Character end;LP.muscleEvent:FireServer("rep") end);task.wait(0.1) end end) end end);addTo(2,t)
local t=tog(cArea,"Auto Weight Rep","⚖️",function(v) getgenv().aWR=v;if v then task.spawn(function() while getgenv().aWR do pcall(function() local w=LP.Backpack:FindFirstChild("Weight");if w and LP.Character then LP.Character.Humanoid:EquipTool(w) end;LP.muscleEvent:FireServer("rep") end);task.wait(0.01) end end) end end);addTo(2,t)
local s=sec(cArea,"Auto Equip","🎒");addTo(2,s)
for _,tn in ipairs({"Weight","Pushups","Situps","Handstand"}) do
    local t=tog(cArea,"Auto Equip "..tn,"🎒",function(v) getgenv()["eq"..tn]=v;if v then task.spawn(function() while getgenv()["eq"..tn] do local w=LP.Backpack:FindFirstChild(tn);if w and LP.Character then w.Parent=LP.Character end;task.wait(0.1) end end) end end);addTo(2,t)
end
local s=sec(cArea,"Jungle Machines","🌴");addTo(2,s)
for _,m in ipairs({{"Jungle Bench","Jungle Bench",CFrame.new(-8629.88,64.88,1855.03)},{"Bar Lift","Jungle Bar Lift",CFrame.new(-8678.06,14.50,2089.26)},{"Squat","Jungle Squat",CFrame.new(-8374.26,34.59,2932.45)}}) do
    local gk="jM_"..m[2]:gsub(" ","")
    local t=tog(cArea,m[1],"🏋️",function(v) getgenv()[gk]=v;if v then task.spawn(function() while getgenv()[gk] do if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character:SetPrimaryPartCFrame(m[3]);pcall(function() RS.rEvents.machineInteractRemote:InvokeServer("useMachine",workspace.machinesFolder[m[2]].interactSeat) end) end;task.wait(0.1) end end) end end);addTo(2,t)
end
local s=sec(cArea,"Auto Rebirth","🔄");addTo(2,s)
local tReb=nil
local _,ri=inp(cArea,"Target rebirth amount (optional)...",function(v) tReb=tonumber(v) end);addTo(2,ri)
local t=tog(cArea,"Auto Rebirth","🔄",function(v) getgenv().aReb=v;if v then coroutine.wrap(function() while getgenv().aReb do local r=LP:FindFirstChild("leaderstats")and LP.leaderstats:FindFirstChild("Rebirths");if r and tReb and r.Value>=tReb then getgenv().aReb=false;notify("SCP","✅ Done!",3);break end;pcall(function() RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest") end);task.wait(0.1) end end)() end end);addTo(2,t)
local t=tog(cArea,"Auto Size 2","📐",function(v) getgenv().aS2=v;if v then task.spawn(function() while getgenv().aS2 do pcall(function() RS.rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",2) end);task.wait(0) end end) end end);addTo(2,t)

-- ═══ TAB 3: FAST FARM (Rocks) ═══
local s=sec(cArea,"Rock Setup","🪨");addTo(3,s)
local t=tog(cArea,"Auto Punch","👊",function(v) _G.ap=v;if v then task.spawn(function() while _G.ap do local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"));if p then if p.Parent~=LP.Character then p.Parent=LP.Character end;p:Activate() end;task.wait() end end) end end);addTo(3,t)
local t=tog(cArea,"Fast Punch","⚡",function(v) local p=LP.Backpack:FindFirstChild("Punch")or(LP.Character and LP.Character:FindFirstChild("Punch"));if p and p:FindFirstChild("attackTime")then p.attackTime.Value=v and 0 or 0.3 end end);addTo(3,t)
local t=tog(cArea,"Lock Position","📍",function(v) if v then local pos=LP.Character.HumanoidRootPart.CFrame;getgenv().pL2=RunSvc.Heartbeat:Connect(function() if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=pos end end) elseif getgenv().pL2 then getgenv().pL2:Disconnect();getgenv().pL2=nil end end);addTo(3,t)
local t=tog(cArea,"Hide Frames","🙈",function(v) for _,f in pairs(RS:GetChildren())do if f.Name:match("Frame$")then f.Visible=not v end end end);addTo(3,t)
local s=sec(cArea,"Select Rock","🪨");addTo(3,s)
local function eqP() local p=LP.Backpack:FindFirstChild("Punch");if p then p.Parent=LP.Character end end
for _,rd in ipairs({{"🌴 Jungle Rock",10000000},{"👑 Muscle King",5000000},{"⚡ Legnds",1000000},{"🪨 Large Rock",1000000},{"🔥 Inferno",750000},{"🔮 Mystic",400000},{"❄️ Froze",150000},{"🥇 Golden",5000},{"👊 Punch Rock",10},{"🪨 Tiny Rock",0}}) do
    local rN,rD=rd[1],rd[2]
    local t=tog(cArea,rN.." ("..fmt(rD)..")","🪨",function(v) _G.rfA=v;if v then getgenv().autoFarm=true;coroutine.wrap(function() while _G.rfA do if LP.Character then eqP();local mf=workspace:FindFirstChild("machinesFolder");if mf then for _,v2 in pairs(mf:GetDescendants())do if v2.Name=="neededDurability" and v2.Value==rD then local rh=LP.Character:FindFirstChild("RightHand");local lh=LP.Character:FindFirstChild("LeftHand");if rh and lh then firetouchinterest(v2.Parent.Rock,rh,0);firetouchinterest(v2.Parent.Rock,rh,1);firetouchinterest(v2.Parent.Rock,lh,0);firetouchinterest(v2.Parent.Rock,lh,1) end end end end;pcall(function() LP.muscleEvent:FireServer("punch","rightHand");LP.muscleEvent:FireServer("punch","leftHand") end);local pu=LP.Character:FindFirstChild("Punch");if pu then pu:Activate() end end;task.wait(0.05) end end)() else getgenv().autoFarm=false end end);addTo(3,t)
end

-- ═══ TAB 4: GIFTS ═══
local s=sec(cArea,"Inventory","🎁");addTo(4,s)
local eC=lbl(cArea,"🥚 Eggs: 0",WHITE);addTo(4,eC)
local sC=lbl(cArea,"🥤 Shakes: 0",WHITE);addTo(4,sC)
local function refInv() local cf=LP:FindFirstChild("consumablesFolder");local e,s=0,0;if cf then for _,i in ipairs(cf:GetChildren())do if i.Name=="Protein Egg"then e=e+1 elseif i.Name=="Tropical Shake"then s=s+1 end end end;eC.Text="  🥚 Eggs: "..e;sC.Text="  🥤 Shakes: "..s end
task.spawn(function() while task.wait(5) do refInv() end end);refInv()
local b=btn(cArea,"Refresh Inventory","🔄",function() refInv() end);addTo(4,b)
local s=sec(cArea,"Egg Gifter","🥚");addTo(4,s)
local eT,eA=nil,0
local _,eti=inp(cArea,"Target player name...",function(v) local p=Players:FindFirstChild(v)or findPlayer(v);if p then eT=p;notify("SCP","Target: "..p.Name,2) end end);addTo(4,eti)
local _,eai=inp(cArea,"Number of eggs...",function(v) eA=tonumber(v)or 0 end);addTo(4,eai)
local b=btn(cArea,"🥚 Gift Eggs","🥚",function() if not eT then notify("SCP","❌ No target!",3);return end;task.spawn(function() local n=0;local cf=LP:FindFirstChild("consumablesFolder");if cf then for i=1,eA do local egg=cf:FindFirstChild("Protein Egg");if egg then pcall(function() RS.rEvents.giftRemote:InvokeServer(eT,egg) end);n=n+1 end;task.wait(0.5) end end;notify("SCP","✅ "..n.." Eggs → "..eT.Name,4);refInv() end) end);addTo(4,b)
local s=sec(cArea,"Shake Gifter","🥤");addTo(4,s)
local sT2,sA2=nil,0
local _,sti=inp(cArea,"Target player name...",function(v) local p=Players:FindFirstChild(v)or findPlayer(v);if p then sT2=p;notify("SCP","Target: "..p.Name,2) end end);addTo(4,sti)
local _,sai=inp(cArea,"Number of shakes...",function(v) sA2=tonumber(v)or 0 end);addTo(4,sai)
local b=btn(cArea,"🥤 Gift Shakes","🥤",function() if not sT2 then notify("SCP","❌ No target!",3);return end;task.spawn(function() local n=0;local cf=LP:FindFirstChild("consumablesFolder");if cf then for i=1,sA2 do local sh=cf:FindFirstChild("Tropical Shake");if sh then pcall(function() RS.rEvents.giftRemote:InvokeServer(sT2,sh) end);n=n+1 end;task.wait(0.5) end end;notify("SCP","✅ "..n.." Shakes → "..sT2.Name,4);refInv() end) end);addTo(4,b)

-- ═══ TAB 5: MISC ═══
local s=sec(cArea,"Settings","⚙️");addTo(5,s)
local t=tog(cArea,"Low Graphics (FPS Boost)","🖥️",function(v) game.Lighting.GlobalShadows=not v;game.Lighting.FogEnd=v and 9e9 or 1e5;game.Lighting.Brightness=v and 0 or 2;settings().Rendering.QualityLevel=v and"Level01"or"Level21";if v then for _,f in pairs(game:GetDescendants())do pcall(function() if f:IsA("ParticleEmitter")or f:IsA("Trail")then f.Lifetime=NumberRange.new(0) end end) end end end);addTo(5,t)
local t=tog(cArea,"Walk on Water","🌊",function(v) if v then local sz=2048;local ct=math.ceil(50000/sz);for x=-ct,ct do for z=-ct,ct do local p=Instance.new("Part");p.Size=Vector3.new(sz,1,sz);p.Position=Vector3.new(x*sz,-9.5,z*sz);p.Anchored=true;p.Transparency=1;p.CanCollide=true;p.Parent=workspace end end end end);addTo(5,t)
local t=tog(cArea,"Free AutoLift Gamepass","🎮",function(v) if v then pcall(function() for _,gp in pairs(RS.gamepassIds:GetChildren())do local val=Instance.new("IntValue");val.Name=gp.Name;val.Value=gp.Value;val.Parent=LP.ownedGamepasses end end);notify("SCP","🎮 Done!",3) end end);addTo(5,t)
local b=btn(cArea,"Remove Ad Portals","🚫",function() local c=0;for _,v in pairs(game:GetDescendants())do if v.Name=="RobloxForwardPortals"then v:Destroy();c=c+1 end end;if _G.AdC then _G.AdC:Disconnect() end;_G.AdC=game.DescendantAdded:Connect(function(v) if v.Name=="RobloxForwardPortals"then v:Destroy() end end);notify("SCP","🚫 "..c.." removed!",3) end);addTo(5,b)
local b=btn(cArea,"Anti AFK","🛡️",function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end);notify("SCP","🛡️ ON!",3) end);addTo(5,b)
local s=sec(cArea,"Teleport","🌀");addTo(5,s)
for _,loc in ipairs({{"🏖️ Beach",Vector3.new(0,0,0)},{"❄️ Frost Gym",Vector3.new(-2650,7,-393)},{"🔮 Mythical Gym",Vector3.new(2255,7,1071)},{"♾️ Eternal Gym",Vector3.new(-6768,7,-1287)},{"⚡ Legend Gym",Vector3.new(4429,991,-3880)},{"👑 Muscle King",Vector3.new(-8799,17,-5798)},{"🌴 Jungle Gym",Vector3.new(-7894,6,2386)},{"🔥 Lava Brawl",Vector3.new(4471,119,-8836)},{"🏜️ Desert Brawl",Vector3.new(960,17,-7398)}}) do
    local b=btn(cArea,loc[1],"🌀",function() local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart");if hrp then hrp.CFrame=CFrame.new(loc[2]);notify("SCP","🌀 "..loc[1],2) end end);addTo(5,b)
end

-- ═══ TAB 6: CRYSTALS (Pets & Auras) ═══
local s=sec(cArea,"Buy Pets and Auras","💎");addTo(6,s)
local sP="Neon Guardian"
local _,pi=inp(cArea,"Select pet name...",function(v) sP=v end);addTo(6,pi)
local sA="Blue Aura"
local _,ai=inp(cArea,"Select aura name...",function(v) sA=v end);addTo(6,ai)
local s=sec(cArea,"System to buy","🛒");addTo(6,s)
local t=tog(cArea,"Auto Buy Pet","🛒",function(v) getgenv().aPet=v;if v then task.spawn(function() while getgenv().aPet do pcall(function() local f=RS.cPetShopFolder:FindFirstChild(sP);if f then RS.cPetShopRemote:InvokeServer(f) end end);task.wait(1) end end) end end);addTo(6,t)
local t=tog(cArea,"Auto buy Aura","🛒",function(v) getgenv().aAura=v;if v then task.spawn(function() while getgenv().aAura do pcall(function() local f=RS.cPetShopFolder:FindFirstChild(sA);if f then RS.cPetShopRemote:InvokeServer(f) end end);task.wait(1) end end) end end);addTo(6,t)
local s=sec(cArea,"Buy Ultimates","⚡");addTo(6,s)
local sU="Select ultimate"
local _,ui=inp(cArea,"Select ultimate name...",function(v) sU=v end);addTo(6,ui)
local t=tog(cArea,"Auto Buy Ultimates","⚡",function(v) getgenv().aUlt=v;if v then task.spawn(function() while getgenv().aUlt do pcall(function() local f=RS:FindFirstChild("ultimatesFolder")and RS.ultimatesFolder:FindFirstChild(sU);if f then RS.rEvents.buyUltimateRemote:InvokeServer(f) end end);task.wait(1) end end) end end);addTo(6,t)
local s=sec(cArea,"Fortune Wheel","🎡");addTo(6,s)
local t=tog(cArea,"Auto Spin Wheel","🎡",function(v) getgenv().aSpin=v;if v then task.spawn(function() while getgenv().aSpin do pcall(function() RS.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel",RS.fortuneWheelChances["Fortune Wheel"]) end);task.wait(1) end end) end end);addTo(6,t)

-- ═══ TAB 7: STATS ═══
local s=sec(cArea,"⏱️ Session","📊");addTo(7,s)
local ss=os.time()
local TL=lbl(cArea,"⏱️ 0d 0h 0m 0s",WHITE);addTo(7,TL)
task.spawn(function() while task.wait(1) do local e=os.time()-ss;TL.Text="  ⏱️ "..math.floor(e/86400).."d "..math.floor(e%86400/3600).."h "..math.floor(e%3600/60).."m "..e%60 .."s" end end)
local s=sec(cArea,"Stats Gained","📈");addTo(7,s)
local ls=LP:WaitForChild("leaderstats",10)
local strS=ls and ls:WaitForChild("Strength",5)
local rebS=ls and ls:WaitForChild("Rebirths",5)
local killS=ls and ls:WaitForChild("Kills",5)
local durS=LP:WaitForChild("Durability",5)
local evilS=LP:WaitForChild("evilKarma",5)
local goodS=LP:WaitForChild("goodKarma",5)
local iStr=strS and strS.Value or 0
local iDur=durS and durS.Value or 0
local iReb=rebS and rebS.Value or 0
local iKill=killS and killS.Value or 0
local SL=lbl(cArea,"💪 Str: —",WHITE);addTo(7,SL)
local DL=lbl(cArea,"🛡️ Dur: —",WHITE);addTo(7,DL)
local RL=lbl(cArea,"🔄 Rebs: —",WHITE);addTo(7,RL)
local KL=lbl(cArea,"⚔️ Kills: —",WHITE);addTo(7,KL)
local EL=lbl(cArea,"😈 Evil: —",WHITE);addTo(7,EL)
local GL=lbl(cArea,"😇 Good: —",WHITE);addTo(7,GL)
task.spawn(function() while task.wait(0.5) do pcall(function()
    SL.Text="  💪 Str: "..fmt(strS.Value).." | +"..fmt(strS.Value-iStr)
    DL.Text="  🛡️ Dur: "..fmt(durS.Value).." | +"..fmt(durS.Value-iDur)
    RL.Text="  🔄 Rebs: "..fmt(rebS.Value).." | +"..fmt(rebS.Value-iReb)
    KL.Text="  ⚔️ Kills: "..fmt(killS.Value).." | +"..fmt(killS.Value-iKill)
    EL.Text="  😈 Evil: "..fmt(evilS.Value)
    GL.Text="  😇 Good: "..fmt(goodS.Value)
end) end end)
local s=sec(cArea,"Rate /hr","📉");addTo(7,s)
local RSL=lbl(cArea,"💪 Str/hr: warming up...",WHITE);addTo(7,RSL)
local RDL=lbl(cArea,"🛡️ Dur/hr: warming up...",WHITE);addTo(7,RDL)
local sH,dH={},{}
task.spawn(function() while task.wait(0.5) do pcall(function()
    local n=tick();table.insert(sH,{t=n,v=strS.Value});table.insert(dH,{t=n,v=durS.Value})
    while #sH>0 and n-sH[1].t>10 do table.remove(sH,1) end
    while #dH>0 and n-dH[1].t>10 do table.remove(dH,1) end
    if #sH>=2 then RSL.Text="  💪 Str/hr: "..fmt(math.floor((sH[#sH].v-sH[1].v)/10*3600)) end
    if #dH>=2 then RDL.Text="  🛡️ Dur/hr: "..fmt(math.floor((dH[#dH].v-dH[1].v)/10*3600)) end
end) end end)
local s=sec(cArea,"Spy Player","🔍");addTo(7,s)
local spyT=LP
local SPN=lbl(cArea,"👤 Player: "..LP.Name,WHITE);addTo(7,SPN)
local SPS=lbl(cArea,"Stats: —",DIM);addTo(7,SPS)
local _,si=inp(cArea,"Search player name...",function(v) local p=findPlayer(v);if p then spyT=p;SPN.Text="  👤 Player: "..p.Name end end);addTo(7,si)
task.spawn(function() while task.wait(1) do pcall(function()
    if not spyT then return end
    local tls=spyT:FindFirstChild("leaderstats")
    local s1=tls and tls:FindFirstChild("Strength") and fmt(tls.Strength.Value) or "—"
    local s2=spyT:FindFirstChild("Durability") and fmt(spyT.Durability.Value) or "—"
    local s3=tls and tls:FindFirstChild("Rebirths") and fmt(tls.Rebirths.Value) or "—"
    local s4=tls and tls:FindFirstChild("Kills") and fmt(tls.Kills.Value) or "—"
    SPS.Text="  💪"..s1.." 🛡️"..s2.." 🔄"..s3.." ⚔️"..s4
end) end end)

-- START ON TAB 1
switchTab(1)
notify("SCP HUB","⚡ V5 Loaded! Made by TEJAZ 👑",5)
