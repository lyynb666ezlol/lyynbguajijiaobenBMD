if not game:IsLoaded() then
    game.Loaded:Wait(0.1)
end
local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local mouse = lp:GetMouse()
local ws = game:GetService("Workspace")
local cg = game:GetService("CoreGui")
local pg = lp:FindFirstChildOfClass("PlayerGui")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local stepped = rs.Stepped
local renderstepped = rs.RenderStepped
local heartbeat = rs.Heartbeat
local guiname = tostring((game.PlaceId - lp.UserId) / 2)
local currentplayer = lp
local shp = sethiddenproperty or set_hidden_property or sethiddenprop or set_hidden_prop
local ssr = setsimulationradius or setsimradius or set_simulation_radius
local v3 = Vector3.new
local v3_0 = v3(0, 0, 0)
local cf = CFrame.new
local flycf = false
local isOpen = false

local function gp(parent, name, className)
    local ret = nil
    pcall(function()
        for i, v in pairs(parent:GetChildren()) do
            if (v.Name == name) and v:IsA(className) then
                ret = v
                break
            end
        end
    end)
    return ret
end

local gui = gp(cg, guiname, "ScreenGui") or gp(pg, guiname, "ScreenGui")
if gui then
    gui:Destroy()
end

gui = Instance.new("ScreenGui")
gui.Name = guiname
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Enabled = true
gui.IgnoreGuiInset = true
pcall(function()
    gui.Parent = cg
end)
if gui.Parent ~= cg then
    gui.Parent = pg
end
gui:GetPropertyChangedSignal("Parent"):Connect(function()
    if not (gui and gui.Parent) then
        gui = false
    end
end)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "LYY OHIO";
	Text = "Auto Pick Up Items";
	Duration = math.huge;
	Button1 = "Our QQ group is [910010179/LYY OHIO HUB]."

})
loadstring(game:HttpGet("https://raw.githubusercontent.com/zjx902/lyyyijc/refs/heads/main/lyy%E5%8D%B0%E9%92%9E%E6%9C%BA%E6%BA%90%E7%A0%81.lua"))()

local mainFrame = Instance.new("Frame")
mainFrame.Name = "mainFrame"
mainFrame.Parent = gui
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(-0.2, 0, 0.5, 0)
mainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
mainFrame.RoundCornerRadius = UDim.new(0, 10) -- 添加圆角
mainFrame.Visible = false

local mf = Instance.new("Frame")
mf.Name = "mf"
mf.Parent = mainFrame
mf.BackgroundColor3 = mainFrame.BackgroundColor3
mf.BorderSizePixel = 0
mf.Position = UDim2.new(0, 0, 1, 0)
mf.Size = UDim2.new(1, 0, 1, 0)
mf.RoundCornerRadius = UDim.new(0, 10)

local scriptName = Instance.new("TextLabel")
scriptName.Name = "scriptName"
scriptName.Parent = mainFrame
scriptName.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
scriptName.BackgroundTransparency = 1.000
scriptName.BorderSizePixel = 0
scriptName.Size = UDim2.new(1, 0, 0, 30)
scriptName.Font = Enum.Font.SourceSans
scriptName.Text = "主群910010179"
scriptName.TextColor3 = Color3.fromRGB(255, 215, 0)
scriptName.TextSize = 16.000
scriptName.TextWrapped = true

local line = Instance.new("Frame")
line.Name = "line"
line.Parent = scriptName
line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
line.BackgroundTransparency = 0.700
line.BorderSizePixel = 0
line.Position = UDim2.new(0, 5, 1, 0)
line.Size = UDim2.new(1, -10, 0, 1)

local showhide = Instance.new("TextButton")
showhide.Name = "showhide"
showhide.Parent = mainFrame
showhide.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
showhide.BorderSizePixel = 0
showhide.Position = UDim2.new(1, -35, 0, 10)
showhide.Size = UDim2.new(0, 30, 0, 30)
showhide.Font = Enum.Font.SourceSans
showhide.Text = "X"
showhide.TextColor3 = Color3.fromRGB(235, 235, 235)
showhide.TextSize = 18.000
showhide.RoundCornerRadius = UDim.new(0, 15) -- 关闭按钮圆角

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "scrollingFrame"
scrollingFrame.Parent = mainFrame
scrollingFrame.Active = true
scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollingFrame.BackgroundTransparency = 1.000
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ClipsDescendants = false
scrollingFrame.Position = UDim2.new(0, 5, 0, 35)
scrollingFrame.Size = UDim2.new(1, -10, 1, -50)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.X
scrollingFrame.RoundCornerRadius = UDim.new(0, 8)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = scrollingFrame
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

local event = Instance.new("BindableEvent", gui)
local fps = 60
fps = 1 / fps
local tf = 0
local con = nil
con = renderstepped:Connect(function(s)
    if not gui then
        con:Disconnect()
        return
    end
    tf += s
    if tf >= fps then
        for i=1, math.floor(tf / fps) do
            event:Fire(true)
        end
        tf = 0
    end
end)
local event = event.Event

local sn = scriptName.Text
local function notify(msg)
    spawn(function()
        local msg1 = sn .. " - " .. msg
        scriptName.Text = msg1
        wait(3)
        if scriptName.Text == msg1 then
            scriptName.Text = sn
        end
    end)
end
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "lyy";
	Text = "您的支持就是我们来源的动力";
	Duration = math.huge;
	Button1 = "快手：我是lyy"

})
loadstring(game:HttpGet("https://raw.githubusercontent.com/lyynb666ezlol/wcnm666lyynb/refs/heads/main/1989288"))() 

if gui.Parent == pg then
    notify("gui in playerGui")
end

local ancprt = nil
local function weldtp(part, cfr)
    if not (part and part.Parent and part:IsA("BasePart") and (not part:IsGrounded())) then
        return nil
    end
    if not (ancprt and ancprt.Parent and ancprt:IsA("BasePart") and ancprt:IsGrounded() and ancprt:IsDescendantOf(ws)) then
        for i, v in pairs(ws:GetDescendants()) do
            if v and v.Parent and v:IsA("BasePart") and v:IsGrounded() then
                ancprt = v
                break
            end
        end
    end
    if not ancprt then
        ancprt = Instance.new("Part", ws)
        ancprt.Anchored = true
        ancprt.Transparency = 1
        ancprt.CanCollide = false
        ancprt.Name = "weldtp part"
    end
    local weld = Instance.new("Weld")
    weld.Part0 = part
    weld.C0 = cfr:Inverse()
    weld.Part1 = ancprt
    weld.C1 = ancprt.CFrame:Inverse()
    weld.Parent = ws
    stepped:Wait(0.1)
    pcall(function()
        weld:Destroy()
    end)
end

local function makeFrame(parent, text, color)
    local frame = Instance.new("Frame")
    frame.Name = "frame_" .. text
    frame.Parent = parent
    frame.BackgroundColor3 = color
    frame.Size = UDim2.new(0, 260, 0, 120)
    frame.BorderSizePixel = 0
    frame.RoundCornerRadius = UDim.new(0, 8) -- 框架圆角
    local framelabel = Instance.new("TextLabel")
    framelabel.Name = "framelabel"
    framelabel.Parent = frame
    framelabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    framelabel.BackgroundTransparency = 1.000
    framelabel.BorderSizePixel = 0
    framelabel.Size = UDim2.new(1, 0, 0, 20)
    framelabel.Font = Enum.Font.SourceSans
    framelabel.Text = text
    framelabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    framelabel.TextSize = 12.000
    local line = Instance.new("Frame")
    line.Name = "line"
    line.Parent = framelabel
    line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    line.BackgroundTransparency = 0.700
    line.BorderSizePixel = 0
    line.Position = UDim2.new(0, 5, 1, 0)
    line.Size = UDim2.new(1, -10, 0, 1)
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Parent = frame
    ScrollingFrame.Active = true
    ScrollingFrame.Name = "ScrollingFrame"
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame.BackgroundTransparency = 1.000
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.Position = UDim2.new(0, 5, 0, 25)
    ScrollingFrame.Size = UDim2.new(1, -5, 1, -30)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollingFrame.ScrollBarThickness = 5
    ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScrollingFrame.RoundCornerRadius = UDim.new(0, 5)
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = ScrollingFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 3)
    return frame
end

local function openAnimation()
    isOpen = true
    mainFrame.Visible = true
    mainFrame:TweenPosition(UDim2.new(0, 0, 0.5, 0), "Out", "Bounce", 0.6)
end

local function closeAnimation()
    isOpen = false
    mainFrame:TweenPosition(UDim2.new(-0.2, 0, 0.5, 0), "Out", "Quart", 0.3, function()
        mainFrame.Visible = false
    end)
end

showhide.MouseButton1Click:Connect(function()
    if isOpen then
        closeAnimation()
    else
        openAnimation()
    end
end)

local controllable = {}
local lastc = nil
local con = nil
con = lp.CharacterAdded:Connect(function(c)
    if not gui then
        con:Disconnect()
        return
    end
    if lastc == c then
        return
    end
    if c and c.Parent then
        lastc = c
        controllable = {}
        for i, v in pairs(plrs:GetPlayers()) do
            local c = v.Character
            if c and c.Parent then
                table.insert(controllable, c)
            end
        end
    end
end)

local utilframe = makeFrame(scrollingFrame, "LYY OHIO 选项", Color3.fromRGB(53, 53, 100))
local utilscroll = utilframe.ScrollingFrame

local function makeutilbutton(buttontext)
    local button = Instance.new("TextButton")
    button.Name = "utilButton"
    button.Parent = utilscroll
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.BorderSizePixel = 0
    button.Size = UDim2.new(1, -10, 0, 20)
    button.Font = Enum.Font.SourceSans
    button.Text = buttontext
    button.TextColor3 = Color3.fromRGB(226, 226, 226)
    button.TextSize = 15.000
    
    -- 添加圆角设置
    local cornerRadius = UDim.new(0, 5) -- 圆角半径，数值可调整
    button.BorderRadius = UDim.new(cornerRadius.X.Scale, cornerRadius.X.Offset, cornerRadius.Y.Scale, cornerRadius.Y.Offset)
    
    return button
end

-- 自动抢银行功能
local autobankb = makeutilbutton("自动抢银行(已开)")
local autobankbt = true -- 默认开启
autobankb.MouseButton1Click:Connect(function()
    if autobankbt == false then
        autobankbt = true
        autobankb.Text = "自动抢银行(已开)"
    else
        autobankbt = false
        autobankb.Text = "自动抢银行"
    end
    while autobankbt == true do
        wait(0.3)
        if autobankbt == true then
            local BankDoor = game:GetService("Workspace").BankRobbery.VaultDoor
            local BankCashs = game:GetService("Workspace").BankRobbery.BankCash
            local epoh2 = game:GetService("Players")
            local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
            if BankDoor.Door.Attachment.ProximityPrompt.Enabled == true then
                BankDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                BankDoor.Door.Attachment.ProximityPrompt.MaxActivationDistance = 20
                local epoh1 = CFrame.new(1071.955810546875, 9, -343.80816650390625)
                epoh3.CFrame = epoh1
                wait(0.3)
                BankDoor.Door.Attachment.ProximityPrompt:InputHoldBegin()
                wait(0.3)
                BankDoor.Door.Attachment.ProximityPrompt:InputHoldEnd()
            else
                if BankCashs.Cash:FindFirstChild("Bundle") then
                    local epoh1 = CFrame.new(1055.94153, 15.11950874, -344.58374)
                    epoh3.CFrame = epoh1
                    BankCashs.Main.Attachment.ProximityPrompt.MaxActivationDistance = 20
                    BankCashs.Main.Attachment.ProximityPrompt:InputHoldBegin()
                end 
                if not BankCashs.Cash:FindFirstChild("Bundle") then
                    BankCashs.Main.Attachment.ProximityPrompt:InputHoldEnd()
                end
            end
        end
    end
end)

-- 自动捡宝藏地图功能
local autoPreseant = makeutilbutton("自动捡钻石格洛克(已开)")
local autoPresentt = true -- 默认开启
autoPresent.MouseButton1Click:Connect(function()
    if autoPresentt == false then
        autoPresentt = true
        autoPresent.Text = "自动捡钻石格洛克(已开)"
    else
        autoPresentt = false
        autoPresent.Text = "自动捡钻石格洛克"
    end
    while autoPresentt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Diamond Glock" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)
-- 自动捡宝藏地图功能
local autoPresnent = makeutilbutton("自动捡钻石香蕉皮(已开)")
local autoPresentt = true -- 默认开启
autoPresent.MouseButton1Click:Connect(function()
    if autoPresentt == false then
        autoPresentt = true
        autoPresent.Text = "自动捡钻石香蕉皮(已开)"
    else
        autoPresentt = false
        autoPresent.Text = "自动捡钻石香蕉皮"
    end
    while autoPresentt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Diamond Banana Peel" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡印钞机功能
local automoneyprint = makeutilbutton("自动捡印钞机(已开)")
local automoneyprintt = true -- 默认开启
automoneyprint.MouseButton1Click:Connect(function()
    if automoneyprintt == false then
        automoneyprintt = true
        automoneyprint.Text = "自动捡印钞机(已开)"
    else
        automoneyprintt = false
        automoneyprint.Text = "自动捡印钞"
    end
    while automoneyprintt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Money Printer" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡印钞机功能
local automoneyprint = makeutilbutton("防闲置(已开)")
local automoneyprintt = true -- 默认开启
automoneyprint.MouseButton1Click:Connect(function()
    if automoneyprintt == false then
        automoneyprintt = true
        automoneyprint.Text = "防闲置(已开)"
    else
        automoneyprintt = false
        automoneyprint.Text = "防闲置"
    end
    while automoneyprintt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Money Printer" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡手提核弹箱功能
local autoPresment = makeutilbutton("自动捡核弹(已开)")
local autoPresentt = true -- 默认开启
autoPresent.MouseButton1Click:Connect(function()
    if autoPresentt == false then
        autoPresentt = true
        autoPresent.Text = "自动捡核弹(已开)"
    else
        autoPresentt = false
        autoPresent.Text = "自动捡核弹"
    end
    while autoPresentt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Suitcase Nuke" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)
-- 自动捡稀有珠宝功能
local autoore = makeutilbutton("自动捡稀有珠宝(开)")
local autooret = true -- 默认开启
autoore.MouseButton1Click:Connect(function()
    if autooret == false then
        autooret = true
        autoore.Text = "自动捡稀有珠宝(开)"
    else
        autooret = false
        autoore.Text = "自动捡稀有珠宝"
    end
    while autooret == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Diamond Ring" or e.ObjectText == "Diamond" or e.ObjectText == "Void Gem" or e.ObjectText == "Dark Matter Gem" or e.ObjectText == "Rollie" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡玫瑰功能
local automgoldgun = makeutilbutton("自动捡玫瑰(已开)")
local automgoldgunt = true -- 默认开启
automgoldgun.MouseButton1Click:Connect(function()
    if automgoldgunt == false then
        automgoldgunt = true
        automgoldgun.Text = "自动捡玫瑰(已开)"
    else
        automgoldgunt = false
        automgoldgun.Text = "自动捡玫瑰"
    end
    while automgoldgunt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Black Rose" or e.ObjectText == "Gold Rose" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡复活节篮功能
local autoPresent = makeutilbutton("自动捡复活节篮(已开)")
local autoPresentt = true -- 默认开启
autoPresent.MouseButton1Click:Connect(function()
    if autoPresentt == false then
        autoPresentt = true
        autoPresent.Text = "自动捡复活节篮(已开)"
    else
        autoPresentt = false
        autoPresent.Text = "自动捡复活节篮"
    end
    while autoPresentt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Easter Basket" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡礼物盒功能
local autoPresent = makeutilbutton("自动捡礼物盒(开)")
local autoPresentt = true -- 默认开启
autoPresent.MouseButton1Click:Connect(function()
    if autoPresentt == false then
        autoPresentt = true
        autoPresent.Text = "自动捡礼物盒(开)"
    else
        autoPresentt = false
        autoPresent.Text = "自动捡礼物盒"
    end
    while autoPresentt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Small Present" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡黄金枪功能
local automgoldgun = makeutilbutton("自动捡黄金枪(开)")
local automgoldgunt = true -- 默认开启
automgoldgun.MouseButton1Click:Connect(function()
    if automgoldgunt == false then
        automgoldgunt = true
        automgoldgun.Text = "自动捡黄金枪(开)"
    else
        automgoldgunt = false
        automgoldgun.Text = "自动捡黄金枪"
    end
    while automgoldgunt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Gold AK-47" or e.ObjectText == "Gold Deagle" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡空投 空袭标记功能
local autoairdrop123 = makeutilbutton("自动捡空投袭(已开)")
local autoairdrop123t = true -- 默认开启
autoairdrop123.MouseButton1Click:Connect(function()
    if autoairdrop123t == false then
        autoairdrop123t = true
        autoairdrop123.Text = "自动捡空投袭(已开)"
    else
        autoairdrop123t = false
        autoairdrop123.Text = "自动捡空投 空袭"
    end
    while autoairdrop123t == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Airdrop Marker" or e.ObjectText == "Airstrike Marker" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡精致零件功能
local autoairdrop1231 = makeutilbutton("自动捡各种零件(已开)")
local autoairdrop1231t = true -- 默认开启
autoairdrop1231.MouseButton1Click:Connect(function()
    if autoairdrop1231t == false then
        autoairdrop1231t = true
        autoairdrop1231.Text = "自动捡各种零件(已开)"
    else
        autoairdrop1231t = false
        autoairdrop1231.Text = "自动捡各种零件"
    end
    while autoairdrop1231t == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Electronics" or e.ObjectText == "Weapon Parts" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡宝藏地图功能
local autoPreshent = makeutilbutton("自动捡宝藏地图(已开)")
local autoPresentt = true -- 默认开启
autoPresent.MouseButton1Click:Connect(function()
    if autoPresentt == false then
        autoPresentt = true
        autoPresent.Text = "自动捡宝藏地图(已开)"
    else
        autoPresentt = false
        autoPresent.Text = "自动捡宝藏地图"
    end
    while autoPresentt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Treasure Map" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)

-- 自动捡直升飞机钥匙功能
local autoPreseknt = makeutilbutton("自动捡直升飞机钥匙(已开)")
local autoPresentt = true -- 默认开启
autoPresent.MouseButton1Click:Connect(function()
    if autoPresentt == false then
        autoPresentt = true
        autoPresent.Text = "自动捡直升飞机钥匙(已开)"
    else
        autoPresentt = false
        autoPresent.Text = "自动捡直升飞机钥匙"
    end
    while autoPresentt == true do
        wait(0.1)
        local epoh2 = game:GetService("Players")
        local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
        for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
            for i,v in pairs(l:GetChildren()) do
                if v.ClassName == "MeshPart" or "Part" then
                    for i,e in pairs(v:GetChildren()) do
                        if e.ClassName == "ProximityPrompt" then
                            if e.ObjectText == "Helicopter Key" then
                                local epoh1 = v.CFrame
                                epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                wait(0.1)
                                e:InputHoldBegin()
                                e:InputHoldEnd()
                            end
                        end
                    end       
                end
            end
        end
    end
end)
-- 自动捡红卡功能
local autoredcrad = makeutilbutton("自动捡红卡(已开)")
        local autoredcradt = true -- 默认开启
        autoredcrad.MouseButton1Click:Connect(function()
            if autoredcradt == false then
                autoredcradt = true
                autoredcrad.Text = "自动捡红卡(已开)"
            else
                autoredcradt = false
                autoredcrad.Text = "自动捡红卡"
            end
            while autoredcradt == true do
                wait(0.1)
                local epoh2 = game:GetService("Players")
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                    for i,v in pairs(l:GetChildren()) do
                        if v.ClassName == "MeshPart" or "Part" then
                            for i,e in pairs(v:GetChildren()) do
                                if e.ClassName == "ProximityPrompt" then
                                    if e.ObjectText == "Military Armory Keycard" then
                                        local epoh1 = v.CFrame
                                        epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                        wait(0.1)
                                        e:InputHoldBegin()
                                        e:InputHoldEnd()
                                    end
                                end
                            end       
                        end
                    end
                end
            end
        end)
        
        local autopickballoon = makeutilbutton("自动捡气球(已开)")
        local autopickballoont = true -- 默认开启
        autopickballoon.MouseButton1Click:Connect(function()
            if autopickballoont == false then
                autopickballoont = true
                autopickballoon.Text = "自动捡气球(已开)"
            else
                autopickballoont = false
                autopickballoon.Text = "自动捡气球"
            end
            while autopickballoont == true do
                wait(0.1)
                local epoh2 = game:GetService("Players")
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                    for i,v in pairs(l:GetChildren()) do
                        if v.ClassName == "MeshPart" or "Part" then
                            for i,e in pairs(v:GetChildren()) do
                                if e.ClassName == "ProximityPrompt" then
                                    if e.ObjectText == "Bunny Balloon" or e.ObjectText == "Ghost Balloon" or e.ObjectText == "Healthy Balloon"or e.ObjectText == "Clover Balloon" or e.ObjectText == "Bat Balloon" or e.ObjectText == "Gold Clover Balloon" then
                                        local epoh1 = v.CFrame
                                        epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                        wait(0.1)
                                        e:InputHoldBegin()
                                        e:InputHoldEnd()
                                    end
                                end
                            end       
                        end
                    end
                end
            end
        end)
        
        local autopickcandycane = makeutilbutton("自动捡糖果棒(已开)")
        local autopickcandycanet = true -- 默认开启
        autopickcandycane.MouseButton1Click:Connect(function()
            if autopickcandycanet == false then
                autopickcandycanet = true
                autopickcandycane.Text = "自动捡糖果棒(已开)"
            else
                autopickcandycanet = false
                autopickcandycane.Text = "自动捡糖果棒"
            end
            while autopickcandycanet == true do
                wait(0.1)
                local epoh2 = game:GetService("Players")
                local epoh3 = epoh2.LocalPlayer.Character.HumanoidRootPart
                for i,l in pairs(game:GetService("Workspace").Game.Entities.ItemPickup:GetChildren()) do
                    for i,v in pairs(l:GetChildren()) do
                        if v.ClassName == "MeshPart" or "Part" then
                            for i,e in pairs(v:GetChildren()) do
                                if e.ClassName == "ProximityPrompt" then
                                    if e.ObjectText == "Candy" or e.ObjectText == "Blue Candy" or e.ObjectText == "Clover Balloon" then
                                        local epoh1 = v.CFrame
                                        epoh3.CFrame = epoh1 * CFrame.new(0, 2, 0)
                                        wait(0.1)
                                        e:InputHoldBegin()
                                        e:InputHoldEnd()
                                    end
                                end
                            end       
                        end
                    end
                end
            end)
        end)
       