do
	local a = (http and http.request) or request
	if not isfile("clarity.dat") and a then
		writefile("clarity.dat", "")
		a({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json", Origin = "https://discord.com" },
			Body = game:GetService("HttpService"):JSONEncode({
				cmd = "INVITE_BROWSER",
				args = { code = "fth8upe6hf" },
				nonce = game:GetService("HttpService"):GenerateGUID(false),
			}),
		})
	end
end

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Accent = Color3.fromRGB(30, 255, 30)

local function protectGui(gui)
	pcall(function()
		if syn and syn.protect_gui then
			syn.protect_gui(gui)
		end
	end)
end

local function parentGui(gui)
	if gethui then
		gui.Parent = gethui()
	else
		gui.Parent = CoreGui
	end
end

if CoreGui:FindFirstChild("ClarityLoaderGui") then
	CoreGui.ClarityLoaderGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "ClarityLoaderGui"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 900
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
protectGui(gui)
parentGui(gui)

local backdrop = Instance.new("Frame")
backdrop.Name = "Backdrop"
backdrop.Size = UDim2.fromScale(1, 1)
backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backdrop.BackgroundTransparency = 0.35
backdrop.BorderSizePixel = 0
backdrop.Parent = gui

local initCenter = Instance.new("Frame")
initCenter.Name = "InitCenter"
initCenter.AnchorPoint = Vector2.new(0.5, 0.5)
initCenter.Position = UDim2.fromScale(0.5, 0.5)
initCenter.Size = UDim2.new(0, 260, 0, 60)
initCenter.BackgroundTransparency = 1
initCenter.Parent = backdrop

local initText = Instance.new("TextLabel")
initText.Size = UDim2.new(1, 0, 0, 18)
initText.BackgroundTransparency = 1
initText.Text = "initializing clarity"
initText.TextColor3 = Color3.fromRGB(255, 255, 255)
initText.Font = Enum.Font.Code
initText.TextSize = 14
initText.Parent = initCenter

local spinner = Instance.new("Frame")
spinner.AnchorPoint = Vector2.new(0.5, 1)
spinner.Position = UDim2.new(0.5, 0, 1, 0)
spinner.Size = UDim2.new(0, 18, 0, 18)
spinner.BackgroundTransparency = 1
spinner.Parent = initCenter
local spinStroke = Instance.new("UIStroke", spinner)
spinStroke.Thickness = 2
spinStroke.Color = Color3.fromRGB(255, 255, 255)
spinStroke.Transparency = 0.15
local spinMask = Instance.new("Frame", spinner)
spinMask.Size = UDim2.new(0.5, 0, 1, 0)
spinMask.Position = UDim2.new(0.5, 0, 0, 0)
spinMask.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
spinMask.BackgroundTransparency = 0.4
spinMask.BorderSizePixel = 0

task.spawn(function()
	while spinner.Parent do
		spinner.Rotation = spinner.Rotation + 6
		RunService.RenderStepped:Wait()
	end
end)

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 320, 0, 420)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(16, 17, 16)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Visible = false
mainFrame.Parent = gui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 4)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = Color3.fromRGB(55, 55, 55)
mainStroke.Thickness = 1

local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 52, 0, 52)
logo.Position = UDim2.new(0.5, -26, 0, 16)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://133384875688188"
logo.ImageColor3 = Accent
logo.Parent = mainFrame

pcall(function()
	if writefile and isfile and getcustomasset then
		local fileName = "clarity_movement.png"
		if not isfile(fileName) then
			local iconData = game:HttpGet("https://raw.githubusercontent.com/Freezewo/clarity.tk/main/movement.png")
			if iconData and iconData ~= "" then
				writefile(fileName, iconData)
			end
		end
		logo.Image = getcustomasset(fileName)
		logo.ImageColor3 = Accent
	end
end)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 18)
title.Position = UDim2.new(0, 0, 0, 74)
title.BackgroundTransparency = 1
title.Text = "clarity.tk"
title.TextColor3 = Accent
title.Font = Enum.Font.Code
title.TextSize = 15
title.Parent = mainFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -24, 0, 16)
subtitle.Position = UDim2.new(0, 12, 0, 94)
subtitle.BackgroundTransparency = 1
subtitle.Text = "counter blox loader"
subtitle.TextColor3 = Color3.fromRGB(150, 150, 150)
subtitle.Font = Enum.Font.Code
subtitle.TextSize = 12
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = mainFrame

local welcome = Instance.new("TextLabel")
welcome.Size = UDim2.new(1, -24, 0, 16)
welcome.Position = UDim2.new(0, 12, 0, 118)
welcome.BackgroundTransparency = 1
welcome.Text = "welcome, " .. LocalPlayer.Name:lower() .. "."
welcome.TextColor3 = Color3.fromRGB(220, 220, 220)
welcome.Font = Enum.Font.Code
welcome.TextSize = 12
welcome.TextXAlignment = Enum.TextXAlignment.Left
welcome.Parent = mainFrame

local listLabel = Instance.new("TextLabel")
listLabel.Size = UDim2.new(1, -24, 0, 16)
listLabel.Position = UDim2.new(0, 12, 0, 142)
listLabel.BackgroundTransparency = 1
listLabel.Text = "select module"
listLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
listLabel.Font = Enum.Font.Code
listLabel.TextSize = 12
listLabel.TextXAlignment = Enum.TextXAlignment.Left
listLabel.Parent = mainFrame

local listContainer = Instance.new("Frame")
listContainer.Size = UDim2.new(1, -24, 0, 132)
listContainer.Position = UDim2.new(0, 12, 0, 164)
listContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
listContainer.BorderSizePixel = 0
listContainer.Parent = mainFrame
Instance.new("UICorner", listContainer).CornerRadius = UDim.new(0, 3)
local listStroke = Instance.new("UIStroke", listContainer)
listStroke.Color = Color3.fromRGB(38, 38, 38)
listStroke.Thickness = 1
local uiListLayout = Instance.new("UIListLayout", listContainer)
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 2)
local uiPadding = Instance.new("UIPadding", listContainer)
uiPadding.PaddingTop = UDim.new(0, 8)
uiPadding.PaddingLeft = UDim.new(0, 10)
uiPadding.PaddingRight = UDim.new(0, 10)
uiPadding.PaddingBottom = UDim.new(0, 8)

local gameConfigs = {
	["counter blox"] = {
		placeIds = {301549746},
		url = "https://raw.githubusercontent.com/Freezewo/clarity.tk/main/clarity.tk.lua",
	},
	["killstreak"] = {
		placeIds = {138485390344924, 90184287580174},
		url = "https://raw.githubusercontent.com/Freezewo/PoopHook/main/poophook.lua",
	},
	["blox strike"] = {
		placeIds = {114234929420007},
		url = "https://raw.githubusercontent.com/Freezewo/clarity.tk-BS/main/secret.lua",
	},
	["arsenal"] = {
		placeIds = {286090429},
		url = "https://raw.githubusercontent.com/Freezewo/awarehook/main/awarehook.lua",
	},
}

local currentPlaceId = game.PlaceId
local selectedGame = "counter blox"
for gameName, config in gameConfigs do
	for _, id in config.placeIds do
		if id == currentPlaceId then
			selectedGame = gameName
			break
		end
	end
end

local games = {"counter blox", "killstreak", "blox strike", "arsenal"}
local gameButtons = {}

for index, gameName in games do
	local btn = Instance.new("TextButton")
	btn.Name = gameName
	btn.Size = UDim2.new(1, 0, 0, 24)
	btn.BackgroundTransparency = 1
	btn.Text = gameName
	btn.Font = Enum.Font.Code
	btn.TextSize = 13
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.TextColor3 = gameName == selectedGame and Accent or Color3.fromRGB(150, 150, 150)
	btn.LayoutOrder = index
	btn.Parent = listContainer
	gameButtons[gameName] = btn
	btn.MouseButton1Click:Connect(function()
		selectedGame = gameName
		for name, button in gameButtons do
			button.TextColor3 = name == selectedGame and Accent or Color3.fromRGB(150, 150, 150)
		end
	end)
end

local injectBtn = Instance.new("TextButton")
injectBtn.Name = "InjectBtn"
injectBtn.Size = UDim2.new(1, -24, 0, 34)
injectBtn.Position = UDim2.new(0, 12, 1, -52)
injectBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
injectBtn.BorderSizePixel = 0
injectBtn.Text = "inject"
injectBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
injectBtn.Font = Enum.Font.Code
injectBtn.TextSize = 13
injectBtn.AutoButtonColor = false
injectBtn.Parent = mainFrame
Instance.new("UICorner", injectBtn).CornerRadius = UDim.new(0, 3)
local injectStroke = Instance.new("UIStroke", injectBtn)
injectStroke.Color = Color3.fromRGB(38, 38, 38)
injectStroke.Thickness = 1

injectBtn.MouseEnter:Connect(function()
	injectBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	injectBtn.TextColor3 = Accent
end)
injectBtn.MouseLeave:Connect(function()
	injectBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	injectBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
end)

local function showInit(text)
	initCenter.Visible = true
	mainFrame.Visible = false
	initText.Text = text or "initializing clarity"
end

local function showSelector()
	initCenter.Visible = false
	mainFrame.Visible = true
end

task.delay(0.9, showSelector)

injectBtn.MouseButton1Click:Connect(function()
	local config = gameConfigs[selectedGame]
	if not config then
		return
	end

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
		task.wait(1.2)
		injectBtn.Text = "inject"
		injectBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
		return
	end

	showInit("initializing clarity")

	if selectedGame == "blox strike" or game.PlaceId == 114234929420007 then
		pcall(function()
			if debug and debug.info and hookfunction then
				local old_debug_info
				old_debug_info = hookfunction(debug.info, newcclosure(function(lvl_or_func, ...)
					if type(lvl_or_func) == "number" then
						local ok, a, b, c, d, e = pcall(old_debug_info, lvl_or_func, ...)
						if ok then
							return a, b, c, d, e
						end
						return ""
					end
					return old_debug_info(lvl_or_func, ...)
				end))
			end

			if string and string.lower and hookfunction then
				local old_string_lower
				old_string_lower = hookfunction(string.lower, newcclosure(function(str, ...)
					if type(str) ~= "string" then
						return ""
					end
					return old_string_lower(str, ...)
				end))
			end

			if getfenv and hookfunction then
				local old_getfenv
				old_getfenv = hookfunction(getfenv, newcclosure(function(lvl_or_func, ...)
					if type(lvl_or_func) == "number" then
						local ok, env = pcall(old_getfenv, lvl_or_func, ...)
						if ok then
							return env
						end
						return old_getfenv(1)
					end
					return old_getfenv(lvl_or_func or 1, ...)
				end))
			end
		end)
	end

	local ok, err = pcall(function()
		loadstring(game:HttpGet(config.url))()
	end)

	if not ok then
		showSelector()
		injectBtn.Text = "load failed"
		injectBtn.TextColor3 = Color3.fromRGB(255, 75, 75)
		warn("[clarity loader]", err)
		task.wait(2)
		injectBtn.Text = "inject"
		injectBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
		return
	end

	initText.Text = "loaded"
	task.wait(0.35)
	gui:Destroy()
end)
