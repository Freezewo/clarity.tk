local players = game:GetService("Players")
local coreGui = game:GetService("CoreGui")
local localPlayer = players.LocalPlayer

if coreGui:FindFirstChild("ClarityLoaderGui") then
    coreGui.ClarityLoaderGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "ClarityLoaderGui"
gui.ResetOnSpawn = false

if gethui then
    gui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(gui)
    gui.Parent = coreGui
else
    gui.Parent = coreGui
end

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 270, 0, 355)
mainFrame.Position = UDim2.new(0.5, -135, 0.5, -177)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(28, 28, 28)
mainStroke.Thickness = 1
mainStroke.Parent = mainFrame

local topIcon = Instance.new("ImageLabel")
topIcon.Name = "TopIcon"
topIcon.Size = UDim2.new(0, 46, 0, 46)
topIcon.Position = UDim2.new(0.5, -23, 0, 12)
topIcon.BackgroundTransparency = 1
topIcon.Image = "rbxassetid://6031075931"
topIcon.ImageColor3 = Color3.fromRGB(80, 220, 50)
topIcon.Parent = mainFrame

pcall(function()
    if writefile and isfile and getcustomasset then
        local fileName = "clarity_movement.png"
        if not isfile(fileName) then
            local iconData = game:HttpGet("https://raw.githubusercontent.com/Freezewo/clarity.tk/main/movement.png")
            writefile(fileName, iconData)
        end
        topIcon.Image = getcustomasset(fileName)
        topIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

local innerPanel = Instance.new("Frame")
innerPanel.Name = "InnerPanel"
innerPanel.Size = UDim2.new(0, 244, 0, 272)
innerPanel.Position = UDim2.new(0, 13, 0, 68)
innerPanel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
innerPanel.BorderSizePixel = 0
innerPanel.Parent = mainFrame

local innerCorner = Instance.new("UICorner")
innerCorner.CornerRadius = UDim.new(0, 6)
innerCorner.Parent = innerPanel

local innerStroke = Instance.new("UIStroke")
innerStroke.Color = Color3.fromRGB(26, 26, 26)
innerStroke.Thickness = 1
innerStroke.Parent = innerPanel

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 24)
titleLabel.Position = UDim2.new(0, 0, 0, 8)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "select a cheat"
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 15
titleLabel.Parent = innerPanel

local welcomeLabel = Instance.new("TextLabel")
welcomeLabel.Size = UDim2.new(1, -24, 0, 18)
welcomeLabel.Position = UDim2.new(0, 12, 0, 38)
welcomeLabel.BackgroundTransparency = 1
welcomeLabel.Text = "welcome, " .. localPlayer.Name .. "."
welcomeLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
welcomeLabel.Font = Enum.Font.SourceSans
welcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
welcomeLabel.TextSize = 15
welcomeLabel.Parent = innerPanel

local roleLabel = Instance.new("TextLabel")
roleLabel.Size = UDim2.new(1, -24, 0, 18)
roleLabel.Position = UDim2.new(0, 12, 0, 56)
roleLabel.BackgroundTransparency = 1
roleLabel.Text = "role: USER"
roleLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
roleLabel.Font = Enum.Font.SourceSans
roleLabel.TextXAlignment = Enum.TextXAlignment.Left
roleLabel.TextSize = 15
roleLabel.Parent = innerPanel

local availableLabel = Instance.new("TextLabel")
availableLabel.Size = UDim2.new(1, -24, 0, 18)
availableLabel.Position = UDim2.new(0, 12, 0, 82)
availableLabel.BackgroundTransparency = 1
availableLabel.Text = "cheats available:"
availableLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
availableLabel.Font = Enum.Font.SourceSans
availableLabel.TextXAlignment = Enum.TextXAlignment.Left
availableLabel.TextSize = 15
availableLabel.Parent = innerPanel

local listContainer = Instance.new("Frame")
listContainer.Size = UDim2.new(1, -24, 0, 110)
listContainer.Position = UDim2.new(0, 12, 0, 104)
listContainer.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
listContainer.BorderSizePixel = 0
listContainer.Parent = innerPanel

local listCorner = Instance.new("UICorner")
listCorner.CornerRadius = UDim.new(0, 5)
listCorner.Parent = listContainer

local listStroke = Instance.new("UIStroke")
listStroke.Color = Color3.fromRGB(30, 30, 30)
listStroke.Thickness = 1
listStroke.Parent = listContainer

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 2)
uiListLayout.Parent = listContainer

local uiPadding = Instance.new("UIPadding")
uiPadding.PaddingTop = UDim.new(0, 8)
uiPadding.PaddingLeft = UDim.new(0, 10)
uiPadding.PaddingRight = UDim.new(0, 10)
uiPadding.Parent = listContainer

local gameConfigs = {
    ["counter blox"] = {
        placeIds = {301549746},
        url = "https://raw.githubusercontent.com/Freezewo/clarity.tk/main/clarity.tk.lua"
    },
    ["killstreak"] = {
        placeIds = {90184287580174},
        url = "https://raw.githubusercontent.com/Freezewo/PoopHook/main/poophook.lua"
    },
    ["arsenal"] = {
        placeIds = {286090429},
        url = "https://raw.githubusercontent.com/Freezewo/awarehook/main/awarehook.lua"
    }
}

local currentPlaceId = game.PlaceId
local selectedGame = "arsenal"

for gameName, config in gameConfigs do
    for _, id in config.placeIds do
        if id == currentPlaceId then
            selectedGame = gameName
            break
        end
    end
end

local games = {"killstreak", "counter blox", "arsenal"}
local gameButtons = {}

for _, gameName in games do
    local btn = Instance.new("TextButton")
    btn.Name = gameName
    btn.Size = UDim2.new(1, 0, 0, 22)
    btn.BackgroundTransparency = 1
    btn.Text = gameName
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 15
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.TextColor3 = if gameName == selectedGame then Color3.fromRGB(80, 220, 50) else Color3.fromRGB(150, 150, 150)
    btn.Parent = listContainer

    gameButtons[gameName] = btn

    btn.MouseButton1Click:Connect(function()
        selectedGame = gameName
        for name, button in gameButtons do
            button.TextColor3 = if name == selectedGame then Color3.fromRGB(80, 220, 50) else Color3.fromRGB(150, 150, 150)
        end
    end)
end

local injectBtn = Instance.new("TextButton")
injectBtn.Name = "InjectBtn"
injectBtn.Size = UDim2.new(1, -24, 0, 34)
injectBtn.Position = UDim2.new(0, 12, 0, 226)
injectBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
injectBtn.BorderSizePixel = 0
injectBtn.Text = "inject"
injectBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
injectBtn.Font = Enum.Font.SourceSansBold
injectBtn.TextSize = 15
injectBtn.Parent = innerPanel

local injectCorner = Instance.new("UICorner")
injectCorner.CornerRadius = UDim.new(0, 5)
injectCorner.Parent = injectBtn

local injectStroke = Instance.new("UIStroke")
injectStroke.Color = Color3.fromRGB(34, 34, 34)
injectStroke.Thickness = 1
injectStroke.Parent = injectBtn

injectBtn.MouseEnter:Connect(function()
    injectBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    injectBtn.TextColor3 = Color3.fromRGB(80, 220, 50)
end)

injectBtn.MouseLeave:Connect(function()
    injectBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    injectBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
end)

injectBtn.MouseButton1Click:Connect(function()
    local config = gameConfigs[selectedGame]
    if not config then return end

    local isMatch = false
    for _, id in config.placeIds do
        if id == game.PlaceId then
            isMatch = true
            break
        end
    end

    if not isMatch then
        injectBtn.Text = "invalid game!"
        injectBtn.TextColor3 = Color3.fromRGB(255, 75, 75)
        task.wait(1.5)
        injectBtn.Text = "inject"
        injectBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
        return
    end

    injectBtn.Text = "loading..."
    injectBtn.TextColor3 = Color3.fromRGB(80, 220, 50)

    task.wait(0.5)

    loadstring(game:HttpGet(config.url))()

    injectBtn.Text = "injected!"
    task.wait(1)
    gui:Destroy()
end)
