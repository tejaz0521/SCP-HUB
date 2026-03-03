-- ⚡ SCP HUB | RACE CLICKER | Made by TEJAZ
local Players=game:GetService("Players")
local RS=game:GetService("ReplicatedStorage")
local RunSvc=game:GetService("RunService")
local TS=game:GetService("TweenService")
local UIS=game:GetService("UserInputService")
local VU=game:GetService("VirtualUser")
local SG=game:GetService("StarterGui")
local LP=Players.LocalPlayer
repeat task.wait() until LP and LP.Character

local function notify(t,m,d) pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end) end

-- THEME
local BG=Color3.fromRGB(18,5,5);local PANEL=Color3.fromRGB(28,8,8);local CARD=Color3.fromRGB(38,10,10);local CARD2=Color3.fromRGB(50,14,14)
local RED=Color3.fromRGB(185,30,30);local RED2=Color3.fromRGB(220,45,45);local WHITE=Color3.fromRGB(255,255,255)
local DIM=Color3.fromRGB(190,160,160);local MUTED=Color3.fromRGB(110,75,75);local GREEN=Color3.fromRGB(0,210,80)
local BLUE=Color3.fromRGB(80,140,255);local AMBER=Color3.fromRGB(255,185,0);local BORDER=Color3.fromRGB(70,18,18)

local function cr(i,r) local c=Instance.new("UICorner",i);c.CornerRadius=UDim.new(0,r or 8);return c end
local function stk(i,c,t) local s=Instance.new("UIStroke",i);s.Color=c;s.Thickness=t or 1;return s end

-- KEY
local KEY_URL="https://pastebin.com/raw/n7UWskEA"
local function getKeys() local ok,res=pcall(function()return game:HttpGet(KEY_URL)end);if not ok then return{"SCPONTOP"}end;local k={};for v in res:gmatch("[^\n]+")do local t=v:match("^%s*(.-)%s*$");if t~=""then table.insert(k,t)end end;return k end
local function checkKey(e) for _,v in pairs(getKeys())do if v==e then return true end end;return false end

-- KEY SCREEN
local kG=Instance.new("ScreenGui");kG.Name="SCPKey";kG.ResetOnSpawn=false;kG.DisplayOrder=500;kG.Parent=LP:WaitForChild("PlayerGui")
local kOv=Instance.new("Frame",kG);kOv.Size=UDim2.new(1,0,1,0);kOv.BackgroundColor3=Color3.fromRGB(0,0,0);kOv.BackgroundTransparency=0.45;kOv.BorderSizePixel=0
local kC=Instance.new("Frame",kG);kC.Size=UDim2.new(0,310,0,390);kC.AnchorPoint=Vector2.new(0.5,0.5);kC.Position=UDim2.new(0.5,0,2,0);kC.BackgroundColor3=BG;kC.BorderSizePixel=0;cr(kC,12);stk(kC,RED,1.5)
local kTop=Instance.new("Frame",kC);kTop.Size=UDim2.new(1,0,0,100);kTop.BackgroundColor3=PANEL;kTop.BorderSizePixel=0;cr(kTop,12)
local kTopFix=Instance.new("Frame",kTop);kTopFix.Size=UDim2.new(1,0,0.5,0);kTopFix.Position=UDim2.new(0,0,0.5,0);kTopFix.BackgroundColor3=PANEL;kTopFix.BorderSizePixel=0
local kLogo=Instance.new("Frame",kC);kLogo.Size=UDim2.new(0,60,0,60);kLogo.AnchorPoint=Vector2.new(0.5,0);kLogo.Position=UDim2.new(0.5,0,0,16);kLogo.BackgroundColor3=RED;kLogo.BorderSizePixel=0;cr(kLogo,30);stk(kLogo,RED2,2)
local kImg=Instance.new("ImageLabel",kLogo);kImg.Size=UDim2.new(0.84,0,0.84,0);kImg.Position=UDim2.new(0.08,0,0.08,0);kImg.BackgroundTransparency=1;kImg.Image="rbxassetid://125515680929159";kImg.ScaleType=Enum.ScaleType.Fit
local kT1=Instance.new("TextLabel",kC);kT1.Size=UDim2.new(1,0,0,24);kT1.Position=UDim2.new(0,0,0,80);kT1.BackgroundTransparency=1;kT1.Text="⚡ SCP HUB | RACE CLICKER ⚡";kT1.TextColor3=WHITE;kT1.TextSize=14;kT1.Font=Enum.Font.GothamBlack;kT1.TextXAlignment=Enum.TextXAlignment.Center
local kT2=Instance.new("TextLabel",kC);kT2.Size=UDim2.new(1,0,0,14);kT2.Position=UDim2.new(0,0,0,104);kT2.BackgroundTransparency=1;kT2.Text="💎 Made by TEJAZ  |  discord.gg/nDSy4jdVDc";kT2.TextColor3=RED2;kT2.TextSize=9;kT2.Font=Enum.Font.GothamBold;kT2.TextXAlignment=Enum.TextXAlignment.Center
local kInfo=Instance.new("Frame",kC);kInfo.Size=UDim2.new(1,-24,0,32);kInfo.Position=UDim2.new(0,12,0,126);kInfo.BackgroundColor3=CARD;kInfo.BorderSizePixel=0;cr(kInfo,8)
local kIL=Instance.new("TextLabel",kInfo);kIL.Size=UDim2.new(1,-8,1,0);kIL.Position=UDim2.new(0,4,0,0);kIL.BackgroundTransparency=1;kIL.Text="🔑 Get free key at discord.gg/nDSy4jdVDc";kIL.TextColor3=DIM;kIL.TextSize=9;kIL.Font=Enum.Font.GothamBold;kIL.TextWrapped=true
local kLbl=Instance.new("TextLabel",kC);kLbl.Size=UDim2.new(1,-24,0,14);kLbl.Position=UDim2.new(0,12,0,165);kLbl.BackgroundTransparency=1;kLbl.Text="💎 ENTER KEY";kLbl.TextColor3=MUTED;kLbl.TextSize=9;kLbl.Font=Enum.Font.GothamBlack;kLbl.TextXAlignment=Enum.TextXAlignment.Left
local kIBg=Instance.new("Frame",kC);kIBg.Size=UDim2.new(1,-24,0,40);kIBg.Position=UDim2.new(0,12,0,181);kIBg.BackgroundColor3=CARD;kIBg.BorderSizePixel=0;cr(kIBg,8);local kIS=stk(kIBg,BORDER,1.5)
local kIn=Instance.new("TextBox",kIBg);kIn.Size=UDim2.new(1,-16,1,0);kIn.Position=UDim2.new(0,8,0,0);kIn.BackgroundTransparency=1;kIn.Text="";kIn.PlaceholderText="Paste your key here...";kIn.PlaceholderColor3=MUTED;kIn.TextColor3=WHITE;kIn.TextSize=11;kIn.Font=Enum.Font.GothamBold;kIn.ClearTextOnFocus=false
local kSt=Instance.new("TextLabel",kC);kSt.Size=UDim2.new(1,-24,0,14);kSt.Position=UDim2.new(0,12,0,227);kSt.BackgroundTransparency=1;kSt.Text="";kSt.TextColor3=RED2;kSt.TextSize=9;kSt.Font=Enum.Font.GothamBold;kSt.TextXAlignment=Enum.TextXAlignment.Left
local kBtn=Instance.new("TextButton",kC);kBtn.Size=UDim2.new(1,-24,0,40);kBtn.Position=UDim2.new(0,12,0,245);kBtn.BackgroundColor3=RED;kBtn.BorderSizePixel=0;kBtn.Text="⚡  UNLOCK SCP HUB";kBtn.TextColor3=WHITE;kBtn.TextSize=12;kBtn.Font=Enum.Font.GothamBlack;kBtn.AutoButtonColor=false;cr(kBtn,8)
local kDb=Instance.new("TextButton",kC);kDb.Size=UDim2.new(1,-24,0,32);kDb.Position=UDim2.new(0,12,0,295);kDb.BackgroundColor3=CARD;kDb.BorderSizePixel=0;kDb.Text="💬  Get Key  •  discord.gg/nDSy4jdVDc";kDb.TextColor3=BLUE;kDb.TextSize=9;kDb.Font=Enum.Font.GothamBold;kDb.AutoButtonColor=false;cr(kDb,8);stk(kDb,BORDER,1)
local kCr=Instance.new("TextLabel",kC);kCr.Size=UDim2.new(1,0,0,14);kCr.Position=UDim2.new(0,0,0,338);kCr.BackgroundTransparency=1;kCr.Text="👑 Made by TEJAZ  •  SCP_TEJAZ";kCr.TextColor3=MUTED;kCr.TextSize=8;kCr.Font=Enum.Font.GothamBold
kDb.MouseButton1Click:Connect(function() setclipboard("https://discord.gg/nDSy4jdVDc");kSt.Text="✅ Discord copied!";kSt.TextColor3=GREEN end)
TS:Create(kC,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,0)}):Play()
local keyOK=false
local function verify()
    local e=kIn.Text:match("^%s*(.-)%s*$");if e==""then kSt.TextColor3=RED2;kSt.Text="❌ Enter a key first!";return end
    kSt.TextColor3=AMBER;kSt.Text="⏳ Checking..."
    task.spawn(function()
        if checkKey(e) then
            kSt.TextColor3=GREEN;kSt.Text="✅ Accepted!";kBtn.BackgroundColor3=GREEN;kIS.Color=GREEN
            task.wait(1);TS:Create(kC,TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Position=UDim2.new(0.5,0,2,0)}):Play()
            task.wait(0.35);kG:Destroy();keyOK=true
        else
            kSt.TextColor3=RED2;kSt.Text="❌ Wrong key!";kIS.Color=RED2
            for i=1,5 do TS:Create(kC,TweenInfo.new(0.04),{Position=UDim2.new(0.5,10,0.5,0)}):Play();task.wait(0.04);TS:Create(kC,TweenInfo.new(0.04),{Position=UDim2.new(0.5,-10,0.5,0)}):Play();task.wait(0.04) end
            TS:Create(kC,TweenInfo.new(0.04),{Position=UDim2.new(0.5,0,0.5,0)}):Play();task.wait(0.2);kIS.Color=BORDER
        end
    end)
end
kBtn.MouseButton1Click:Connect(verify);kIn.FocusLost:Connect(function(e) if e then verify() end end)
repeat task.wait() until keyOK

-- MAIN GUI
local W,H=338,480
local hG=Instance.new("ScreenGui");hG.Name="SCPHUB_RACE";hG.ResetOnSpawn=false;hG.DisplayOrder=100;hG.Parent=LP:WaitForChild("PlayerGui")
local mW=Instance.new("Frame",hG);mW.Size=UDim2.new(0,W,0,H);mW.AnchorPoint=Vector2.new(0.5,0.5);mW.Position=UDim2.new(0.5,0,0.5,0);mW.BackgroundColor3=BG;mW.BorderSizePixel=0;mW.Active=true;mW.Draggable=true;cr(mW,10);stk(mW,RED,1.5)
TS:Create(mW,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,0)}):Play()

local topBar=Instance.new("Frame",mW);topBar.Size=UDim2.new(1,0,0,44);topBar.BackgroundColor3=PANEL;topBar.BorderSizePixel=0;cr(topBar,10)
local tbFix=Instance.new("Frame",topBar);tbFix.Size=UDim2.new(1,0,0.5,0);tbFix.Position=UDim2.new(0,0,0.5,0);tbFix.BackgroundColor3=PANEL;tbFix.BorderSizePixel=0
local tLogo=Instance.new("Frame",topBar);tLogo.Size=UDim2.new(0,30,0,30);tLogo.Position=UDim2.new(0,8,0.5,-15);tLogo.BackgroundColor3=RED;tLogo.BorderSizePixel=0;cr(tLogo,15)
local tLImg=Instance.new("ImageLabel",tLogo);tLImg.Size=UDim2.new(0.84,0,0.84,0);tLImg.Position=UDim2.new(0.08,0,0.08,0);tLImg.BackgroundTransparency=1;tLImg.Image="rbxassetid://125515680929159";tLImg.ScaleType=Enum.ScaleType.Fit
local tTi=Instance.new("TextLabel",topBar);tTi.Size=UDim2.new(0,180,1,0);tTi.Position=UDim2.new(0,44,0,0);tTi.BackgroundTransparency=1;tTi.Text="Nova hub || 4.5 Version || Have good day ! - SCP_TEJAZ";tTi.TextColor3=WHITE;tTi.TextSize=8;tTi.Font=Enum.Font.GothamBold;tTi.TextXAlignment=Enum.TextXAlignment.Left;tTi.TextWrapped=true
local clsB=Instance.new("TextButton",topBar);clsB.Size=UDim2.new(0,24,0,24);clsB.Position=UDim2.new(1,-30,0.5,-12);clsB.BackgroundColor3=RED;clsB.BorderSizePixel=0;clsB.Text="✕";clsB.TextColor3=WHITE;clsB.TextSize=10;clsB.Font=Enum.Font.GothamBlack;clsB.AutoButtonColor=false;cr(clsB,6)
clsB.MouseButton1Click:Connect(function() hG:Destroy() end)
local minB=Instance.new("TextButton",topBar);minB.Size=UDim2.new(0,24,0,24);minB.Position=UDim2.new(1,-58,0.5,-12);minB.BackgroundColor3=CARD;minB.BorderSizePixel=0;minB.Text="—";minB.TextColor3=DIM;minB.TextSize=10;minB.Font=Enum.Font.GothamBlack;minB.AutoButtonColor=false;cr(minB,6)

local tabScroll=Instance.new("ScrollingFrame",mW);tabScroll.Size=UDim2.new(1,0,0,30);tabScroll.Position=UDim2.new(0,0,0,44);tabScroll.BackgroundColor3=Color3.fromRGB(12,3,3);tabScroll.BorderSizePixel=0;tabScroll.ScrollBarThickness=0;tabScroll.ScrollingDirection=Enum.ScrollingDirection.X;tabScroll.CanvasSize=UDim2.new(0,400,0,0)
Instance.new("UIListLayout",tabScroll).FillDirection=Enum.FillDirection.Horizontal

local cArea=Instance.new("ScrollingFrame",mW);cArea.Size=UDim2.new(1,-6,1,-80);cArea.Position=UDim2.new(0,3,0,78);cArea.BackgroundColor3=BG;cArea.BorderSizePixel=0;cArea.ScrollBarThickness=3;cArea.ScrollBarImageColor3=RED;cArea.CanvasSize=UDim2.new(0,0,0,0)
local cLL=Instance.new("UIListLayout",cArea);cLL.Padding=UDim.new(0,3);cLL.SortOrder=Enum.SortOrder.LayoutOrder
local cPd=Instance.new("UIPadding",cArea);cPd.PaddingLeft=UDim.new(0,3);cPd.PaddingRight=UDim.new(0,3);cPd.PaddingTop=UDim.new(0,3);cPd.PaddingBottom=UDim.new(0,3)
cLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() cArea.CanvasSize=UDim2.new(0,0,0,cLL.AbsoluteContentSize.Y+10) end)

local isMini=false
minB.MouseButton1Click:Connect(function() isMini=not isMini;if isMini then TS:Create(mW,TweenInfo.new(0.2),{Size=UDim2.new(0,W,0,44)}):Play();tabScroll.Visible=false;cArea.Visible=false;minB.Text="+" else TS:Create(mW,TweenInfo.new(0.2),{Size=UDim2.new(0,W,0,H)}):Play();tabScroll.Visible=true;cArea.Visible=true;minB.Text="—" end end)

local TABS={"Farm","Speed","Money","Settings"}
local tBtns={};local pages={}
for i=1,#TABS do pages[i]={} end

local function switchTab(idx)
    for i,p in ipairs(pages) do for _,v in ipairs(p) do v.Visible=(i==idx) end end
    for i,b in ipairs(tBtns) do if i==idx then b.BackgroundColor3=RED;b.TextColor3=WHITE else b.BackgroundColor3=Color3.fromRGB(12,3,3);b.TextColor3=MUTED end end
    cArea.CanvasPosition=Vector2.new(0,0)
end

for i,name in ipairs(TABS) do
    local b=Instance.new("TextButton",tabScroll);b.Size=UDim2.new(0,82,1,0);b.BackgroundColor3=i==1 and RED or Color3.fromRGB(12,3,3);b.BorderSizePixel=0;b.Text=name;b.TextColor3=i==1 and WHITE or MUTED;b.TextSize=9;b.Font=Enum.Font.GothamBold;b.AutoButtonColor=false
    b.MouseButton1Click:Connect(function() switchTab(i) end);table.insert(tBtns,b)
end

local lo=0
local function newLO() lo=lo+1;return lo end
local function sec(txt,emoji) local f=Instance.new("Frame",cArea);f.Size=UDim2.new(1,0,0,26);f.BackgroundColor3=CARD2;f.BorderSizePixel=0;f.LayoutOrder=newLO();cr(f,6);local bar=Instance.new("Frame",f);bar.Size=UDim2.new(0,3,0.6,0);bar.Position=UDim2.new(0,0,0.2,0);bar.BackgroundColor3=RED2;bar.BorderSizePixel=0;local l=Instance.new("TextLabel",f);l.Size=UDim2.new(1,-12,1,0);l.Position=UDim2.new(0,10,0,0);l.BackgroundTransparency=1;l.Text=(emoji or "💎").." "..txt;l.TextColor3=WHITE;l.TextSize=10;l.Font=Enum.Font.GothamBlack;l.TextXAlignment=Enum.TextXAlignment.Left;f.Visible=false;return f end
local function tog(txt,emoji,cb) local row=Instance.new("Frame",cArea);row.Size=UDim2.new(1,0,0,38);row.BackgroundColor3=CARD;row.BorderSizePixel=0;row.LayoutOrder=newLO();cr(row,6);stk(row,BORDER,1);local icon=Instance.new("TextLabel",row);icon.Size=UDim2.new(0,22,1,0);icon.Position=UDim2.new(0,6,0,0);icon.BackgroundTransparency=1;icon.Text=emoji or "🛒";icon.TextSize=13;local l=Instance.new("TextLabel",row);l.Size=UDim2.new(1,-74,1,0);l.Position=UDim2.new(0,30,0,0);l.BackgroundTransparency=1;l.Text=txt;l.TextColor3=DIM;l.TextSize=10;l.Font=Enum.Font.GothamBold;l.TextXAlignment=Enum.TextXAlignment.Left;local bg=Instance.new("TextButton",row);bg.Size=UDim2.new(0,42,0,20);bg.Position=UDim2.new(1,-50,0.5,-10);bg.BackgroundColor3=Color3.fromRGB(28,8,8);bg.BorderSizePixel=0;bg.Text="";bg.AutoButtonColor=false;cr(bg,10);stk(bg,BORDER,1);local ci=Instance.new("Frame",bg);ci.Size=UDim2.new(0,14,0,14);ci.Position=UDim2.new(0,3,0.5,-7);ci.BackgroundColor3=MUTED;ci.BorderSizePixel=0;cr(ci,7);local on=false;bg.MouseButton1Click:Connect(function() on=not on;if on then TS:Create(bg,TweenInfo.new(0.15),{BackgroundColor3=RED}):Play();TS:Create(ci,TweenInfo.new(0.15),{Position=UDim2.new(1,-17,0.5,-7),BackgroundColor3=WHITE}):Play();TS:Create(l,TweenInfo.new(0.1),{TextColor3=WHITE}):Play() else TS:Create(bg,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(28,8,8)}):Play();TS:Create(ci,TweenInfo.new(0.15),{Position=UDim2.new(0,3,0.5,-7),BackgroundColor3=MUTED}):Play();TS:Create(l,TweenInfo.new(0.1),{TextColor3=DIM}):Play() end;cb(on) end);row.Visible=false;return row end
local function btn(txt,emoji,cb) local b=Instance.new("TextButton",cArea);b.Size=UDim2.new(1,0,0,38);b.BackgroundColor3=CARD;b.BorderSizePixel=0;b.Text="";b.AutoButtonColor=false;b.LayoutOrder=newLO();cr(b,6);stk(b,BORDER,1);local icon=Instance.new("TextLabel",b);icon.Size=UDim2.new(0,22,1,0);icon.Position=UDim2.new(0,6,0,0);icon.BackgroundTransparency=1;icon.Text=emoji or "▶️";icon.TextSize=13;local l=Instance.new("TextLabel",b);l.Size=UDim2.new(1,-34,1,0);l.Position=UDim2.new(0,30,0,0);l.BackgroundTransparency=1;l.Text=txt;l.TextColor3=DIM;l.TextSize=10;l.Font=Enum.Font.GothamBold;l.TextXAlignment=Enum.TextXAlignment.Left;b.MouseButton1Down:Connect(function() TS:Create(b,TweenInfo.new(0.07),{BackgroundColor3=CARD2}):Play() end);b.MouseButton1Up:Connect(function() TS:Create(b,TweenInfo.new(0.07),{BackgroundColor3=CARD}):Play() end);b.MouseButton1Click:Connect(cb);b.Visible=false;return b end
local function lbl(txt,col) local l=Instance.new("TextLabel",cArea);l.Size=UDim2.new(1,0,0,22);l.BackgroundColor3=CARD;l.TextColor3=col or DIM;l.Text="  "..txt;l.TextSize=10;l.Font=Enum.Font.GothamBold;l.TextXAlignment=Enum.TextXAlignment.Left;l.BorderSizePixel=0;l.LayoutOrder=newLO();cr(l,6);l.Visible=false;return l end
local function addTo(idx,item) table.insert(pages[idx],item) end

-- ═══ TAB 1: FARM ═══
local s=sec("Auto Click","🖱️");addTo(1,s)
local clickCount=0
local cL=lbl("🖱️ Clicks this session: 0",WHITE);addTo(1,cL)
local t=tog("Auto Click","🖱️",function(v) getgenv().autoClick=v;if v then task.spawn(function() while getgenv().autoClick do local vp=workspace.CurrentCamera.ViewportSize;VU:Button1Down(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera);VU:Button1Up(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera);clickCount=clickCount+1;cL.Text="  🖱️ Clicks: "..clickCount;task.wait(0.05) end end) end end);addTo(1,t)
local t=tog("Fast Click (0.01s)","⚡",function(v) getgenv().fastClick=v;if v then task.spawn(function() while getgenv().fastClick do local vp=workspace.CurrentCamera.ViewportSize;VU:Button1Down(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera);VU:Button1Up(Vector2.new(vp.X/2,vp.Y/2),workspace.CurrentCamera);clickCount=clickCount+1;cL.Text="  🖱️ Clicks: "..clickCount;task.wait(0.01) end end) end end);addTo(1,t)
local b=btn("Reset Click Count","🔄",function() clickCount=0;cL.Text="  🖱️ Clicks: 0" end);addTo(1,b)
local s=sec("Auto Race","🏁");addTo(1,s)
local t=tog("Auto Race Start","🏁",function(v) getgenv().autoRace=v;if v then task.spawn(function() while getgenv().autoRace do pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and r.Name:lower():find("start")then r:FireServer() end;if r:IsA("RemoteFunction")and r.Name:lower():find("start")then r:InvokeServer() end end end);task.wait(2) end end) end end);addTo(1,t)
local t=tog("Auto Finish Race","🏆",function(v) getgenv().autoFinish=v;if v then task.spawn(function() while getgenv().autoFinish do pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and r.Name:lower():find("finish")then r:FireServer() end;if r:IsA("RemoteFunction")and r.Name:lower():find("finish")then r:InvokeServer() end end end);task.wait(1) end end) end end);addTo(1,t)

-- ═══ TAB 2: SPEED ═══
local s=sec("Movement","🏃");addTo(2,s)
local t=tog("Speed Hack (100)","⚡",function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 100 or 16 end end);addTo(2,t)
local t=tog("Ultra Speed (250)","🚀",function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.WalkSpeed=v and 250 or 16 end end);addTo(2,t)
local t=tog("High Jump","🦘",function(v) if LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid.JumpPower=v and 100 or 50 end end);addTo(2,t)
local t=tog("Infinite Jump","♾️",function(v) getgenv().infJump=v;if v then getgenv().ijC=UIS.JumpRequest:Connect(function() if getgenv().infJump and LP.Character and LP.Character:FindFirstChild("Humanoid")then LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) elseif getgenv().ijC then getgenv().ijC:Disconnect() end end);addTo(2,t)
local t=tog("Max Vehicle Speed","🏎️",function(v) getgenv().maxVeh=v;if v then task.spawn(function() while getgenv().maxVeh do for _,obj in pairs(workspace:GetDescendants())do if obj:IsA("VehicleSeat")then obj.MaxSpeed=1000;obj.Torque=1000 end end;task.wait(0.5) end end) end end);addTo(2,t)

-- ═══ TAB 3: MONEY ═══
local s=sec("Auto Earn","💰");addTo(3,s)
local t=tog("Auto Buy Upgrades","🛒",function(v) getgenv().autoBuy=v;if v then task.spawn(function() while getgenv().autoBuy do pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and(r.Name:lower():find("upgrade")or r.Name:lower():find("buy"))then r:FireServer() end;if r:IsA("RemoteFunction")and(r.Name:lower():find("upgrade")or r.Name:lower():find("buy"))then r:InvokeServer() end end end);task.wait(0.5) end end) end end);addTo(3,t)
local t=tog("Auto Prestige/Rebirth","🔄",function(v) getgenv().autoPrestige=v;if v then task.spawn(function() while getgenv().autoPrestige do pcall(function() for _,r in pairs(RS:GetDescendants())do if r:IsA("RemoteEvent")and(r.Name:lower():find("prestige")or r.Name:lower():find("rebirth"))then r:FireServer() end end end);task.wait(3) end end) end end);addTo(3,t)

-- ═══ TAB 4: SETTINGS ═══
local s=sec("Performance","🖥️");addTo(4,s)
local t=tog("Low Graphics","🖥️",function(v) game.Lighting.GlobalShadows=not v;game.Lighting.FogEnd=v and 9e9 or 1e5;game.Lighting.Brightness=v and 0 or 2;settings().Rendering.QualityLevel=v and"Level01"or"Level21" end);addTo(4,t)
local b=btn("Anti AFK","🛡️",function() pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end);notify("SCP","🛡️ ON!",3) end);addTo(4,b)
local b=btn("Copy Discord","💬",function() setclipboard("https://discord.gg/nDSy4jdVDc");notify("SCP","✅ Copied!",3) end);addTo(4,b)

switchTab(1)
notify("SCP HUB","🏎️ Race Clicker Loaded! Made by TEJAZ 👑",5)
