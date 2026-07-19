local env = getgenv()

L_1_ = true;
if game.PlaceId == 101013872711019 and L_1_ then
    local rs = game:GetService("ReplicatedStorage")
    local demosFolder = rs:FindFirstChild("Demos")
    if not demosFolder then
        demosFolder = Instance.new("Folder")
        demosFolder.Name = "Demos"
        demosFolder.Parent = rs
    end
    if listfiles then
        for _, folderPath in listfiles("clarity.tk/demos/") do
            local folderName = tostring(folderPath):match("([^/\\]+)$") or tostring(folderPath)
            local folderObj = Instance.new("Folder", demosFolder)
            folderObj.Name = folderName
            for _, filePath in next, listfiles(folderPath) do
                local fileName = filePath:match("([^/\\]+)%.tick$") or filePath:match("([^/\\]+)%.txt$")
                if fileName then
                    local strVal = Instance.new("StringValue")
                    strVal.Name = fileName
                    strVal.Parent = folderObj
                    strVal.Value = readfile(filePath)
                end
            end
        end
    end
    return
end

L_2_ = os.time()
local L_4_;

env.runService = game:GetService"RunService"
env.textService = game:GetService"TextService"
env.inputService = game:GetService"UserInputService"
env.tweenService = game:GetService"TweenService"
if env.library then
	env.library:Unload()
end;
L_5_ = {
	tabs = {},
	draggable = true,
	flags = {},
	title = "YE BRO U BRAINLESS IF U REALLY DUMP IT 3iq script is free",
	open = false,
	mousestate = inputService.MouseIconEnabled,
	popup = nil,
	instances = {},
	connections = {},
	options = {},
	notifications = {},
	tabSize = 0,
	theme = {},
	foldername = "clarity.tk/configs",
	fileext = ".txt"
}
library_flags = L_5_.flags;
env.library = L_5_;
env._cursor_outer = Drawing.new("Circle")
env._cursor_outer.Color = Color3.new(0, 0, 0)
env._cursor_outer.Thickness = 2
env._cursor_outer.NumSides = 24
env._cursor_outer.Radius = 5
env._cursor_outer.Filled = false
env._cursor_outer.Visible = false
env._cursor_inner = Drawing.new("Circle")
env._cursor_inner.Color = Color3.new(1, 1, 1)
env._cursor_inner.Thickness = 1
env._cursor_inner.NumSides = 24
env._cursor_inner.Radius = 3
env._cursor_inner.Filled = true
env._cursor_inner.Visible = false
local L_6_, L_7_, L_8_, L_9_, L_10_;
L_11_ = {
	Enum.KeyCode.Unknown,
	Enum.KeyCode.W,
	Enum.KeyCode.A,
	Enum.KeyCode.S,
	Enum.KeyCode.D,
	Enum.KeyCode.Slash,
	Enum.KeyCode.Tab,
	Enum.KeyCode.Escape
}
L_12_ = {}
for _, _mbName in { "MouseButton1", "MouseButton2", "MouseButton3", "MouseButton4", "MouseButton5" } do
	local _ok, _enum = pcall(function() return Enum.UserInputType[_mbName] end)
	if _ok and _enum then
		table.insert(L_12_, _enum)
	end
end
L_5_.round = function(llll1ll11, l1l111l1)
	l1l111l1 = l1l111l1 or 1;
	local L_723_;
	if typeof(llll1ll11) == "Vector2" then
		L_723_ = Vector2.new(L_5_.round(llll1ll11.X), L_5_.round(llll1ll11.Y))
	elseif typeof(llll1ll11) == "Color3" then
		return L_5_.round(llll1ll11.r * 255), L_5_.round(llll1ll11.g * 255), L_5_.round(llll1ll11.b * 255)
	else
		L_723_ = math.floor(llll1ll11 / l1l111l1 + math.sign(llll1ll11) * 0.5) * l1l111l1;
		if L_723_ < 0 then
			L_723_ = L_723_ + l1l111l1
		end;
		return L_723_
	end;
	return L_723_
end;
function L_5_:Create(l1111ll, l111111l11l)
	l111111l11l = l111111l11l or {}
	if not l1111ll then
		return
	end;
	local L_726_ = l1111ll == "Square" or l1111ll == "Line" or l1111ll == "Text" or l1111ll == "Quad" or l1111ll == "Circle" or l1111ll == "Triangle"
	local L_727_ = L_726_ and Drawing or Instance;
	local L_728_ = L_727_.new(l1111ll)
	for l111l1l11111, l1l111llll1l in next, l111111l11l do
		L_728_[l111l1l11111] = l1l111llll1l
	end;
	table.insert(self.instances, {
		object = L_728_,
		method = L_726_
	})
	return L_728_
end;
function L_5_:AddConnection(l11l1l, l1111l1l, lll1111ll1l1)
	lll1111ll1l1 = type(l1111l1l) == "function" and l1111l1l or lll1111ll1l1;
	l11l1l = l11l1l:connect(lll1111ll1l1)
	if l1111l1l ~= lll1111ll1l1 then
		self.connections[l1111l1l] = l11l1l
	else
		table.insert(self.connections, l11l1l)
	end;
	return l11l1l
end;
function L_5_:Unload()
	inputService.MouseIconEnabled = self.mousestate;
	for l1ll11l11, l11l1l1l1l1 in next, self.connections do
		l11l1l1l1l1:Disconnect()
	end;
	for ll1ll111, l1lll1 in next, self.instances do
		if l1lll1.method then
			pcall(function()
				l1lll1.object:Remove()
			end)
		else
			l1lll1.object:Destroy()
		end
	end;
	for l1l1l1111l, llllll1lll11 in next, self.options do
		if llllll1lll11.type == "toggle" then
			pcall(function()
				llllll1lll11:SetState()
			end)
		end
	end;
	L_5_ = nil;
	env.library = nil
end;
L_5_.lastConfig = ""
function L_5_:LoadConfig(L_732_arg0, L_733_arg1)
	L_5_.lastConfig = L_732_arg0 or L_5_.lastConfig;
	loadingCFG = true;
	changing = true;
	local L_734_, L_735_ = nil, {}
	local fileData = nil
	if L_733_arg1 then
		L_734_, fileData = pcall(function() return L_733_arg1 end)
	else
		L_734_, fileData = pcall(function()
			return readfile(self.foldername .. "/" .. L_732_arg0 .. self.fileext)
		end)
	end
	if L_734_ and fileData and fileData ~= "" then
		if string.sub(fileData, 1, 1) == "{" then
			pcall(function()
				L_735_ = game:GetService"HttpService":JSONDecode(fileData)
			end)
		else
			for line in string.gmatch(fileData, "[^\r\n]+") do
				local eqPos = string.find(line, "=")
				if eqPos then
					local key = string.sub(line, 1, eqPos - 1)
					local data = string.sub(line, eqPos + 1)
					local colonPos = string.find(data, ":")
					if colonPos then
						local typeStr = string.sub(data, 1, colonPos - 1)
						local valStr = string.sub(data, colonPos + 1)
						if typeStr == "toggle" then
							L_735_[key] = tonumber(valStr)
						elseif typeStr == "color" then
							local parts = string.split(valStr, ",")
							if #parts >= 3 then
								local r = tonumber(parts[1]) or tonumber((string.gsub(parts[1], ",", "."))) or tonumber((string.gsub(parts[1], "%.", ","))) or 1
								local g = tonumber(parts[2]) or tonumber((string.gsub(parts[2], ",", "."))) or tonumber((string.gsub(parts[2], "%.", ","))) or 1
								local b = tonumber(parts[3]) or tonumber((string.gsub(parts[3], ",", "."))) or tonumber((string.gsub(parts[3], "%.", ","))) or 1
								if r > 1 or g > 1 or b > 1 or (r == 0 and g == 0 and b == 0 and not string.find(valStr, "%.")) then
									r, g, b = r / 255, g / 255, b / 255
								end
								L_735_[key] = {r, g, b}
							end
							if #parts == 4 then
								L_735_[key .. " Transparency"] = tonumber(parts[4]) or tonumber((string.gsub(parts[4], "%.", ","))) or 0
							end
						elseif typeStr == "bind" then
							L_735_[key] = valStr
						elseif typeStr == "list" then
							local tbl = {}
							for item in string.gmatch(valStr, "([^,]+)") do tbl[item] = true end
							L_735_[key] = tbl
						elseif typeStr == "number" then
							L_735_[key] = tonumber(valStr)
						else
							if typeStr == "string" and string.match(valStr, "^table: 0x") then
								L_735_[key] = {}
							else
								L_735_[key] = valStr
							end
						end
					end
				end
			end
		end
	end
	do local _opt = L_5_.options["Loop Kill"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
	do local _opt = L_5_.options["Target ESP"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
	if not L_734_ and L_733_arg1 ~= nil then
		loadingCFG = false;
		changing = false;
		return true
	end;
	if table.find(self:GetConfigs(), L_732_arg0) or L_733_arg1 ~= nil then
		local colorCount = 0
		for L_736_forvar0, L_737_forvar1 in next, self.options do
			if type(L_737_forvar1) == "table" and L_737_forvar1.type ~= "button" and L_737_forvar1.flag and not L_737_forvar1.skipflag then
				if L_737_forvar1.type == "toggle" then
					if L_735_[L_737_forvar1.flag] ~= nil then
						spawn(function()
							pcall(function() L_737_forvar1:SetState(L_735_[L_737_forvar1.flag] == 1) end)
						end)
					end
				elseif L_737_forvar1.type == "color" then
					local colorData = L_735_[L_737_forvar1.flag]
					if colorData then
						colorCount = colorCount + 1
						local clr = Color3.new(colorData[1], colorData[2], colorData[3])
						L_737_forvar1.color = clr
						library_flags[L_737_forvar1.flag] = clr
						spawn(function()
							pcall(function() L_737_forvar1:SetColor(colorData) end)
						end)
						local transVal = L_735_[L_737_forvar1.flag .. " Transparency"]
						if L_737_forvar1.trans and transVal then
							L_737_forvar1.trans = transVal
							library_flags[L_737_forvar1.flag .. " Transparency"] = 1 - transVal
							spawn(function()
								pcall(function() L_737_forvar1:SetTrans(transVal) end)
							end)
						end
					end
				elseif L_737_forvar1.type == "bind" then
					if L_735_[L_737_forvar1.flag] then
						spawn(function()
							pcall(function() L_737_forvar1:SetKey(L_735_[L_737_forvar1.flag]) end)
						end)
					end
				elseif L_737_forvar1.type == "list" and L_737_forvar1.flag == "skinGloveModel" then
					spawn(function()
						wait(0.1)
						pcall(function() L_737_forvar1:SetValue(L_735_[L_737_forvar1.flag]) end)
						wait(0.1)
						local skinOption = self.options["skinGloveSkin"]
						if skinOption and L_735_["skinGloveSkin"] then
							pcall(function() skinOption:SetValue(L_735_["skinGloveSkin"]) end)
						end
					end)
				elseif L_737_forvar1.flag == "skinGloveSkin" then
				else
					if L_735_[L_737_forvar1.flag] ~= nil then
						spawn(function()
							pcall(function() L_737_forvar1:SetValue(L_735_[L_737_forvar1.flag]) end)
						end)
					end
				end
			end
		end
		for key, val in next, L_735_ do
			if type(key) == "string" and (key:sub(1, 5) == "skin_" or key:sub(1, 7) == "ui_pos_" or key:sub(1, 13) == "practiceBind_" or key:match("Color$") or key:match("ColorChanger$") or key == "skinKnifeModel" or key == "skinGloveModel" or key == "skinGloveSkin" or key == "skinSkinChanger" or key == "skinKnifeChanger" or key == "skinGloveChanger" or key == "skinSleeveChanger" or key == "skinSleeveCT" or key == "skinSleeveT" or key == "spoofedNameValue" or key == "Custom Models" or key == "Custom Models Favorites") then
				if val == 1 then library_flags[key] = true
				elseif val == 0 then library_flags[key] = false
				elseif type(val) == "table" and #val >= 3 and not val["Enemy"] then
					library_flags[key] = Color3.new(val[1], val[2], val[3])
				else library_flags[key] = val end
			elseif type(val) == "string" and string.match(val, "^table: 0x") then
				library_flags[key] = nil
			end 
		end
		if type(library_flags["Custom Models Favorites"]) == "string" and library_flags["Custom Models Favorites"] ~= "" then
			pcall(function()
				env._FavoriteCustomModels = game:GetService("HttpService"):JSONDecode(library_flags["Custom Models Favorites"])
				if env._RebuildCustomModelsList then env._RebuildCustomModelsList() end
			end)
		end
		if type(library_flags["Custom Models"]) == "string" and library_flags["Custom Models"] ~= "" then
			pcall(function()
				if env._SetCustomModelDropdownSelection then env._SetCustomModelDropdownSelection(library_flags["Custom Models"]) end
			end)
		end
		spawn(function()
			wait(0.5)
			local function applyPos(flagName, obj)
				if library_flags[flagName] and obj then
					local p = {}
					for v in string.gmatch(library_flags[flagName], "([^,]+)") do
						table.insert(p, tonumber(v))
					end
					if #p == 4 then
						pcall(function() obj.Position = UDim2.new(p[1], p[2], p[3], p[4]) end)
					end
				end
			end
			if game:GetService("CoreGui"):FindFirstChild("NativeWatermark") then
				applyPos("ui_pos_Watermark", game:GetService("CoreGui").NativeWatermark:FindFirstChild("Container"))
			end
			applyPos("ui_pos_SpectatorList", env.SpectatorList)
			applyPos("ui_pos_KeybindsList", env.KeybindsList)
			applyPos("ui_pos_mainFrame", env.MenuFrame)
			applyPos("ui_pos_RouteCalc", env.RouteCalc)
			applyPos("ui_pos_PracticePanel", env.PracticePanel)
		end)
		spawn(function()
			wait(0.5)
			if library_flags["skinKnifeModel"] then env.lastKnife = library_flags["skinKnifeModel"] end
			if library_flags["skinGloveModel"] then env.lastGlove = library_flags["skinGloveModel"] end
			if library_flags["skinGloveSkin"] then env.lastGloveSkin = library_flags["skinGloveSkin"] end
			pcall(function()
				if L_5_.options["skinSleeveCT"] and library_flags["skinSleeveCT"] then L_5_.options["skinSleeveCT"]:SetValue(library_flags["skinSleeveCT"]) end
				if L_5_.options["skinSleeveT"] and library_flags["skinSleeveT"] then L_5_.options["skinSleeveT"]:SetValue(library_flags["skinSleeveT"]) end
				if L_5_.options["skinSleeveChanger"] and library_flags["skinSleeveChanger"] ~= nil then L_5_.options["skinSleeveChanger"]:SetState(library_flags["skinSleeveChanger"] == true) end
			end)
			-- nah bro really thought he'd find some 1000iq SKID ALERT
			if env.ApplySleeveChangerToCurrent then pcall(env.ApplySleeveChangerToCurrent) end
			if env.UpdateSkinUI then pcall(env.UpdateSkinUI) end
		end)
		spawn(function()
			wait(0.6)
			if env.UpdatePracticeUI then pcall(env.UpdatePracticeUI) end
			pcall(function()
				if library_flags["Custom Models Favorites"] then
					local dec = game:GetService("HttpService"):JSONDecode(library_flags["Custom Models Favorites"])
					if type(dec) == "table" then
						env._FavoriteCustomModels = dec
						if env._RebuildCustomModelsList then env._RebuildCustomModelsList() end
					end
				end
			end)
		end)
	end;
	loadingCFG = false;
	changing = false;
	do local _opt = L_5_.options["Loop Kill"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
	do local _opt = L_5_.options["Target ESP"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
end;
function L_5_:SaveConfig(L_738_arg0, L_739_arg1, L_740_arg2)
	local strData = ""
	pcall(function()
		local function sPos(name, obj)
			if obj then library_flags["ui_pos_"..name] = tostring(obj.Position.X.Scale)..","..tostring(obj.Position.X.Offset)..","..tostring(obj.Position.Y.Scale)..","..tostring(obj.Position.Y.Offset) end
		end
		local cg = game:GetService("CoreGui"):FindFirstChild("NativeWatermark")
		if cg then sPos("Watermark", cg:FindFirstChild("Container")) end
		sPos("SpectatorList", env.SpectatorList)
		sPos("KeybindsList", env.KeybindsList)
		sPos("mainFrame", env.MenuFrame)
		sPos("RouteCalc", env.RouteCalc)
		sPos("PracticePanel", env.PracticePanel)
	end)
	for _, opt in next, self.options do
		if opt.type ~= "button" and opt.flag and not opt.skipflag then
			local line = opt.flag .. "="
			if opt.type == "toggle" then
				line = line .. "toggle:" .. (opt.state and "1" or "0")
			elseif opt.type == "color" then
				local _r, _g, _b = math.floor((opt.color.R or opt.color.r or 1) * 255), math.floor((opt.color.G or opt.color.g or 1) * 255), math.floor((opt.color.B or opt.color.b or 1) * 255)
				line = line .. "color:" .. tostring(_r) .. "," .. tostring(_g) .. "," .. tostring(_b)
				if opt.trans then
					line = line .. "," .. string.gsub(tostring(opt.trans), ",", ".")
				end
			elseif opt.type == "bind" then
				line = line .. "bind:" .. tostring(opt.key)
			elseif opt.type == "list" and opt.multiselect and type(opt.value) == "table" then
				local str = ""
				for k, v in next, opt.value do if v then str = str .. tostring(k) .. "," end end
				line = line .. "list:" .. str
			elseif type(opt.value) == "number" then
				line = line .. "number:" .. tostring(opt.value)
			else
				local vStr = tostring(opt.value)
				if string.match(vStr, "^table: 0x") then vStr = "" end
				line = line .. "string:" .. vStr
			end
			strData = strData .. line .. "\n"
		end
	end
	for flag, value in next, library_flags do
		if type(flag) == "string" and (flag:sub(1, 5) == "skin_" or flag:sub(1, 7) == "ui_pos_" or flag:sub(1, 13) == "practiceBind_" or flag:match("Color$") or flag:match("ColorChanger$") or flag == "skinKnifeModel" or flag == "skinGloveModel" or flag == "skinGloveSkin" or flag == "skinSkinChanger" or flag == "skinKnifeChanger" or flag == "skinGloveChanger" or flag == "skinSleeveChanger" or flag == "skinSleeveCT" or flag == "skinSleeveT" or flag == "spoofedNameValue" or flag == "Custom Models" or flag == "Custom Models Favorites") then
			if type(value) == "boolean" then
				strData = strData .. flag .. "=toggle:" .. (value and "1" or "0") .. "\n"
			elseif type(value) == "string" then
				strData = strData .. flag .. "=string:" .. tostring(value) .. "\n"
			elseif type(value) == "number" then
				strData = strData .. flag .. "=number:" .. tostring(value) .. "\n"
			elseif typeof(value) == "Color3" then
				local _r, _g, _b = math.floor(value.R * 255), math.floor(value.G * 255), math.floor(value.B * 255)
				strData = strData .. flag .. "=color:" .. _r .. "," .. _g .. "," .. _b .. "\n"
			end
		end
	end
	if L_739_arg1 then
		setclipboard(strData)
	else
		writefile(self.foldername .. "/" .. L_738_arg0 .. self.fileext, strData)
	end
end;
function L_5_:GetConfigs()
	if not isfolder(self.foldername) then
		makefolder(self.foldername)
	end;
	local L_744_ = listfiles(self.foldername)
	local files = {}
	local count = 0
	for _, filepath in next, L_744_ do
		if filepath:sub(#filepath - #self.fileext + 1, #filepath) == self.fileext then
			count = count + 1
			local name = filepath:gsub("^.*[/\\\\]", "")
			name = name:gsub(self.fileext .. "$", "")
			files[count] = name
		end
	end;
	return files
end;
local function llll1l(lll111, lll111l)
	lll111.main = L_5_:Create("TextLabel", {
		LayoutOrder = lll111.position,
		Position = UDim2.new(0, 6, 0, 0),
		Size = UDim2.new(1, -12, 0, 24),
		BackgroundTransparency = 1,
		Text = lll111.text,
		TextSize = 15,
		Font = Enum.Font.Code,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = lll111l
	})
	setmetatable(lll111, {
		__newindex = function(lll111l11, ll1ll1, l11llll)
			if ll1ll1 == "Text" then
				lll111.main.Text = tostring(l11llll)
			end
		end
	})
end;
local function InitCheckbox(checkbox, parent)
	checkbox.hasInit = true;
	checkbox.main = L_5_:Create("Frame", {
		LayoutOrder = checkbox.position,
		Size = UDim2.new(1, 0, 0, 20),
		BackgroundTransparency = 1,
		Parent = parent
	})
	local boxFrame;
	local checkImage;
	if checkbox.style then
		boxFrame = L_5_:Create("ImageLabel", {
			Position = UDim2.new(0, 6, 0, 4),
			Size = UDim2.new(0, 12, 0, 12),
			BackgroundTransparency = 1,
			Image = "rbxassetid://3570695787",
			ImageColor3 = Color3.new(),
			Parent = checkbox.main
		})
		L_5_:Create("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -2, 1, -2),
			BackgroundTransparency = 1,
			Image = "rbxassetid://3570695787",
			ImageColor3 = Color3.fromRGB(60, 60, 60),
			Parent = boxFrame
		})
		L_5_:Create("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -6, 1, -6),
			BackgroundTransparency = 1,
			Image = "rbxassetid://3570695787",
			ImageColor3 = Color3.fromRGB(40, 40, 40),
			Parent = boxFrame
		})
		checkImage = L_5_:Create("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, -6, 1, -6),
			BackgroundTransparency = 1,
			Image = "rbxassetid://3570695787",
			ImageColor3 = library_flags["Menu Accent Color"],
			Visible = checkbox.state,
			Parent = boxFrame
		})
		L_5_:Create("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Image = "rbxassetid://5941353943",
			ImageTransparency = 0.6,
			Parent = boxFrame
		})
		table.insert(L_5_.theme, checkImage)
	else
		boxFrame = L_5_:Create("Frame", {
			Position = UDim2.new(0, 6, 0, 4),
			Size = UDim2.new(0, 12, 0, 12),
			BackgroundColor3 = library_flags["Menu Accent Color"],
			BorderColor3 = Color3.new(),
			Parent = checkbox.main
		})
		checkImage = L_5_:Create("ImageLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = checkbox.state and 1 or 0,
			BackgroundColor3 = Color3.fromRGB(50, 50, 50),
			BorderColor3 = Color3.new(),
			Image = "rbxassetid://4155801252",
			ImageTransparency = 0.6,
			ImageColor3 = Color3.new(),
			Parent = boxFrame
		})
		L_5_:Create("ImageLabel", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Image = "rbxassetid://2592362371",
			ImageColor3 = Color3.fromRGB(60, 60, 60),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(2, 2, 62, 62),
			Parent = boxFrame
		})
		table.insert(L_5_.theme, boxFrame)
	end;
	checkbox.interest = L_5_:Create("Frame", {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, 20),
		BackgroundTransparency = 1,
		Parent = checkbox.main
	})
	checkbox.title = L_5_:Create("TextLabel", {
		Position = UDim2.new(0, 24, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Text = checkbox.text,
		TextColor3 = checkbox.state and Color3.fromRGB(210, 210, 210) or Color3.fromRGB(180, 180, 180),
		TextSize = 15,
		Font = Enum.Font.Code,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = checkbox.interest
	})
	checkbox.interest.InputBegan:connect(function(inputBeganEvent)
		if inputBeganEvent.UserInputType.Name == "MouseButton1" then
			checkbox:SetState(not checkbox.state)
		end;
		if inputBeganEvent.UserInputType.Name == "MouseMovement" then
			if not L_5_.popup and not L_5_.warning and not L_5_.slider then
				if checkbox.style then
					boxFrame.ImageColor3 = library_flags["Menu Accent Color"]
					tweenService:Create(boxFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						ImageColor3 = library_flags["Menu Accent Color"]
					}):Play()
				else
					boxFrame.BorderColor3 = library_flags["Menu Accent Color"]
					checkImage.BorderColor3 = library_flags["Menu Accent Color"]
				end
			end;
			if checkbox.tip then
				L_5_.tooltip.Text = checkbox.tip;
				L_5_.tooltip.Size = UDim2.new(0, textService:GetTextSize(checkbox.tip, 15, Enum.Font.Code, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	checkbox.interest.InputChanged:connect(function(inputChangedEvent)
		if inputChangedEvent.UserInputType.Name == "MouseMovement" then
			if checkbox.tip then
				L_5_.tooltip.Position = UDim2.new(0, inputChangedEvent.Position.X + 56, 0, inputChangedEvent.Position.Y - 10)
			end
		end
	end)
	checkbox.interest.InputEnded:connect(function(inputEndedEvent)
		if inputEndedEvent.UserInputType.Name == "MouseMovement" then
			if checkbox.style then
				boxFrame.ImageColor3 = Color3.new()
			else
				boxFrame.BorderColor3 = Color3.new()
				checkImage.BorderColor3 = Color3.new()
			end;
			L_5_.tooltip.Position = UDim2.new(2)
		end
	end)
function checkbox:SetState(l1ll111, lll11l1ll)
		l1ll111 = typeof(l1ll111) == "boolean" and l1ll111;
		l1ll111 = l1ll111 or false;
		library_flags[self.flag] = l1ll111;
		self.state = l1ll111;
		checkbox.title.TextColor3 = l1ll111 and Color3.fromRGB(210, 210, 210) or Color3.fromRGB(160, 160, 160)
		if checkbox.style then
			checkImage.Visible = l1ll111
		else
			checkImage.BackgroundTransparency = l1ll111 and 1 or 0
		end;
		if not lll11l1ll and type(self.callback) == "function" then
			self.callback(l1ll111)
		end
	end;
	if checkbox.state then
		delay(1, function()
			if L_5_ then
				if type(checkbox.callback) == "function" then
					checkbox.callback(true)
				end
			end
		end)
	end;
	setmetatable(checkbox, {
		__newindex = function(llll1lll, l1ll11l1llll, l1ll111)
			if l1ll11l1llll == "Text" then
				checkbox.title.Text = tostring(l1ll111)
			end
		end
	})
end;
local function l111l1lll1(ll11lll111ll, l1ll11ll1l1)
	ll11lll111ll.hasInit = true;
	ll11lll111ll.main = L_5_:Create("Frame", {
		LayoutOrder = ll11lll111ll.position,
		Size = UDim2.new(1, 0, 0, 26),
		BackgroundTransparency = 1,
		Parent = l1ll11ll1l1
	})
	ll11lll111ll.title = L_5_:Create("TextLabel", {
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.new(0.5, 0, 1, -5),
		Size = UDim2.new(1, -12, 0, 18),
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BorderColor3 = Color3.new(),
		Text = ll11lll111ll.text,
		TextColor3 = Color3.new(1, 1, 1),
		TextSize = 15,
		Font = Enum.Font.Code,
		Parent = ll11lll111ll.main
	})
	L_5_:Create("ImageLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2592362371",
		ImageColor3 = Color3.fromRGB(60, 60, 60),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(2, 2, 62, 62),
		Parent = ll11lll111ll.title
	})
	L_5_:Create("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 180, 180)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 253, 253))
		}),
		Rotation = -90,
		Parent = ll11lll111ll.title
	})
	ll11lll111ll.title.InputBegan:connect(function(lllllll11ll)
		if lllllll11ll.UserInputType.Name == "MouseButton1" then
			if type(ll11lll111ll.callback) == "function" then
				ll11lll111ll.callback()
			end
			if L_5_ then
				library_flags[ll11lll111ll.flag] = true
			end;
			if ll11lll111ll.tip then
				L_5_.tooltip.Text = ll11lll111ll.tip;
				L_5_.tooltip.Size = UDim2.new(0, textService:GetTextSize(ll11lll111ll.tip, 15, Enum.Font.Code, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end;
		if lllllll11ll.UserInputType.Name == "MouseMovement" then
			if not L_5_.popup and not L_5_.warning and not L_5_.slider then
				ll11lll111ll.title.BorderColor3 = library_flags["Menu Accent Color"]
			end
		end
	end)
	ll11lll111ll.title.InputChanged:connect(function(l1llll1)
		if l1llll1.UserInputType.Name == "MouseMovement" then
			if ll11lll111ll.tip then
				L_5_.tooltip.Position = UDim2.new(0, l1llll1.Position.X + 56, 0, l1llll1.Position.Y - 10)
			end
		end
	end)
	ll11lll111ll.title.InputEnded:connect(function(lll1ll1)
		if lll1ll1.UserInputType.Name == "MouseMovement" then
			ll11lll111ll.title.BorderColor3 = Color3.new()
			L_5_.tooltip.Position = UDim2.new(2)
		end
	end)
end;
local function shortenBindName(key)
    if not key or key == "none" then return "none" end
    local name = typeof(key) == "EnumItem" and key.Name or tostring(key)
    name = name:gsub("Enum.UserInputType.", ""):gsub("Enum.KeyCode.", "")
    if name:find("MouseButton") then
        return "M" .. name:sub(-1)
    end
    return name
end
local function getFullBindName(key)
    if not key or typeof(key) ~= "string" then return key end
    local num = key:match("^M(%d)$")
    if num then
        return "MouseButton" .. num
    end
    return key
end
local function l11lllll1(ll111l, l11lll11l1l)
	ll111l.hasInit = true;
	local L_779_;
	local L_781_;
	if ll111l.sub then
		ll111l.main = ll111l:getMain()
	else
		ll111l.main = ll111l.main or L_5_:Create("Frame", {
			LayoutOrder = ll111l.position,
			Size = UDim2.new(1, 0, 0, 20),
			BackgroundTransparency = 1,
			Parent = l11lll11l1l
		})
		L_5_:Create("TextLabel", {
			Position = UDim2.new(0, 6, 0, 0),
			Size = UDim2.new(1, -12, 1, 0),
			BackgroundTransparency = 1,
			Text = ll111l.text,
			TextSize = 15,
			Font = Enum.Font.Code,
			TextColor3 = Color3.fromRGB(210, 210, 210),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = ll111l.main
		})
	end;
	local L_782_Icon = L_5_:Create("ImageButton", {
		Name = "BindSettings",
		Position = UDim2.new(1, -26 - (ll111l.subpos or 0), 0, 2),
		Size = UDim2.new(0, 16, 0, 16),
		BackgroundTransparency = 1,
		Image = "rbxassetid://7072714742",
		ImageColor3 = Color3.fromRGB(180, 180, 180),
		AutoButtonColor = false,
		Parent = ll111l.main
	})
	local L_782_Popup = L_5_:Create("Frame", {
		Name = "BindPopup",
		ZIndex = 20,
		Size = UDim2.new(0, 150, 0, 65),
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		BorderColor3 = Color3.new(),
		Visible = false,
		Parent = L_5_.base
	})
	local L_PopStroke = Instance.new("UIStroke", L_782_Popup)
	L_PopStroke.Color = Color3.fromRGB(45, 45, 45)
	local L_KeyLabel = L_5_:Create("TextLabel", {
		Position = UDim2.new(0, 10, 0, 8),
		Size = UDim2.new(0, 60, 0, 20),
		BackgroundTransparency = 1,
		Text = "keybind",
		TextSize = 14,
		Font = Enum.Font.Code,
		TextColor3 = Color3.fromRGB(200, 200, 200),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = L_782_Popup
	})
	local L_KeyBtn = L_5_:Create("TextButton", {
		Position = UDim2.new(1, -70, 0, 8),
		Size = UDim2.new(0, 60, 0, 20),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BorderSizePixel = 0,
		Text = shortenBindName(ll111l.key),
		TextSize = 14,
		Font = Enum.Font.Code,
		TextColor3 = Color3.new(1, 1, 1),
		AutoButtonColor = false,
		Parent = L_782_Popup
	})
	local L_ModeLabel = L_5_:Create("TextLabel", {
		Position = UDim2.new(0, 10, 0, 35),
		Size = UDim2.new(0, 60, 0, 20),
		BackgroundTransparency = 1,
		Text = "mode",
		TextSize = 14,
		Font = Enum.Font.Code,
		TextColor3 = Color3.fromRGB(200, 200, 200),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = L_782_Popup
	})
	local L_ModeBtn = L_5_:Create("TextButton", {
		Position = UDim2.new(1, -70, 0, 35),
		Size = UDim2.new(0, 60, 0, 20),
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BorderSizePixel = 0,
		Text = ll111l.mode or "toggle",
		TextSize = 14,
		Font = Enum.Font.Code,
		TextColor3 = Color3.new(1, 1, 1),
		AutoButtonColor = false,
		Parent = L_782_Popup
	})
	L_782_Icon.MouseButton1Click:connect(function()
		if L_5_.popup == ll111l then
			ll111l:Close()
			return
		end;
		if L_5_.popup then L_5_.popup:Close() end;
		L_5_.popup = ll111l;
		L_782_Popup.Visible = true;
		local absPos = L_782_Icon.AbsolutePosition;
		L_782_Popup.Position = UDim2.new(0, absPos.X - 160, 0, absPos.Y)
		L_782_Icon.ImageColor3 = library_flags["Menu Accent Color"]
	end)
	local L_RowKeyBtn = L_5_:Create("TextButton", {
		Name = "RowKeyDisplay",
		Position = UDim2.new(1, -92 - (ll111l.subpos or 0), 0, 2),
		Size = UDim2.new(0, 60, 0, 16),
		BackgroundColor3 = Color3.fromRGB(24, 24, 24),
		BorderSizePixel = 0,
		Text = shortenBindName(ll111l.key or "none"),
		TextSize = 12,
		Font = Enum.Font.Code,
		TextColor3 = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 255, 0),
		AutoButtonColor = false,
		Parent = ll111l.main
	})
	Instance.new("UICorner", L_RowKeyBtn).CornerRadius = UDim.new(0, 3)
	local L_RowKeyStroke = Instance.new("UIStroke", L_RowKeyBtn)
	L_RowKeyStroke.Color = Color3.fromRGB(45, 45, 45)
	L_RowKeyBtn.MouseButton1Click:connect(function()
		L_779_ = true;
		L_RowKeyBtn.Text = "[...]"
		L_KeyBtn.Text = "[...]"
		L_KeyBtn.TextColor3 = library_flags["Menu Accent Color"]
	end)
	function ll111l:Close()
		L_5_.popup = nil;
		L_782_Popup.Visible = false;
		L_782_Icon.ImageColor3 = Color3.fromRGB(180, 180, 180)
		L_779_ = false;
	end
	L_KeyBtn.MouseButton1Click:connect(function()
		L_779_ = true;
		L_KeyBtn.Text = "[...]"
		L_KeyBtn.TextColor3 = library_flags["Menu Accent Color"]
	end)
	L_ModeBtn.MouseButton1Click:connect(function()
		local modes = {"always on", "hold", "toggle"}
		local curIdx = table.find(modes, ll111l.mode) or 3
		curIdx = curIdx + 1
		if curIdx > #modes then curIdx = 1 end
		ll111l.mode = modes[curIdx]
		L_ModeBtn.Text = ll111l.mode
		if ll111l.mode == "always on" then
			library_flags[ll111l.flag] = true
			ll111l.callback(true)
		else
			library_flags[ll111l.flag] = false
			ll111l.callback(false)
		end
	end)
	L_5_:AddConnection(inputService.InputBegan, function(input)
		if inputService:GetFocusedTextBox() then return end;
		if L_779_ then
			local key = table.find(L_12_, input.UserInputType) and not ll111l.nomouse and input.UserInputType;
			key = key or not table.find(L_11_, input.KeyCode) and input.KeyCode;
			if key then
				ll111l:SetKey(key)
			end
		else
			if ll111l.mode == "always on" then
				library_flags[ll111l.flag] = true
				return
			end
			local isKey = (shortenBindName(input.KeyCode.Name) == ll111l.key or shortenBindName(input.UserInputType.Name) == ll111l.key)
			if isKey then
				if ll111l.mode == "toggle" then
					library_flags[ll111l.flag] = not library_flags[ll111l.flag]
					ll111l.callback(library_flags[ll111l.flag], 0)
				elseif ll111l.mode == "hold" then
					library_flags[ll111l.flag] = true;
					if L_781_ then L_781_:Disconnect() end;
					L_781_ = L_5_:AddConnection(runService.RenderStepped, function(dt)
						if not inputService:GetFocusedTextBox() then
							ll111l.callback(true, dt)
						end
					end)
				end
			end
		end
	end)
	L_5_:AddConnection(inputService.InputEnded, function(input)
		if ll111l.key ~= "none" and ll111l.mode == "hold" then
			if shortenBindName(input.KeyCode.Name) == ll111l.key or shortenBindName(input.UserInputType.Name) == ll111l.key then
				if L_781_ then
					L_781_:Disconnect()
					L_781_ = nil
					library_flags[ll111l.flag] = false
					ll111l.callback(false, 0)
				end
			end
		end
	end)
	function ll111l:SetKey(key)
		L_779_ = false;
		L_KeyBtn.TextColor3 = Color3.new(1, 1, 1)
		if L_781_ then L_781_:Disconnect() L_781_ = nil end;
		self.key = shortenBindName(key and key.Name or key or self.key);
		if self.key == "Backspace" then
			self.key = "none"
		end;
		L_KeyBtn.Text = shortenBindName(self.key):upper()
		if L_RowKeyBtn then
			L_RowKeyBtn.Text = shortenBindName(self.key):upper()
			L_RowKeyBtn.TextColor3 = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 255, 0)
		end
	end;
	ll111l:SetKey()
end;
local function lll1l1(l1ll11lll1l, l11lll11)
	l1ll11lll1l.hasInit = true;
	if l1ll11lll1l.sub then
		l1ll11lll1l.main = l1ll11lll1l:getMain()
		l1ll11lll1l.main.Size = UDim2.new(1, 0, 0, 36)
	else
		l1ll11lll1l.main = L_5_:Create("Frame", {
			LayoutOrder = l1ll11lll1l.position,
			BackgroundTransparency = 1,
			Parent = l11lll11
		})
		l1ll11lll1l.main.Size = UDim2.new(1, 0, 0, l1ll11lll1l.textpos and 20 or 36)
	end;
	l1ll11lll1l.title = L_5_:Create("TextLabel", {
		Position = UDim2.new(0, 6, 0, 0),
		Size = UDim2.new(0.5, -6, 0, 14),
		BackgroundTransparency = 1,
		Text = string.lower(l1ll11lll1l.text == "nil" and "" or l1ll11lll1l.text),
		TextSize = 13,
		Font = Enum.Font.Code,
		TextColor3 = Color3.fromRGB(200, 200, 200),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = l1ll11lll1l.main
	})
	l1ll11lll1l.valueLabel = L_5_:Create("TextBox", {
		Position = UDim2.new(0.5, 0, 0, 0),
		Size = UDim2.new(0.5, -6, 0, 14),
		BackgroundTransparency = 1,
		Text = tostring(l1ll11lll1l.value) .. l1ll11lll1l.suffix,
		TextSize = 13,
		Font = Enum.Font.Code,
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextXAlignment = Enum.TextXAlignment.Right,
		ClearTextOnFocus = false,
		TextEditable = true,
		Parent = l1ll11lll1l.main
	})
	l1ll11lll1l.valueLabel.FocusLost:connect(function()
		local typed = tostring(l1ll11lll1l.valueLabel.Text):match("[-]?%d+%.?%d*")
		local num = tonumber(typed)
		if num then
			l1ll11lll1l:SetValue(num)
		else
			l1ll11lll1l.valueLabel.Text = tostring(l1ll11lll1l.value) .. l1ll11lll1l.suffix
		end
	end)
	l1ll11lll1l.slider = L_5_:Create("Frame", {
		Position = UDim2.new(0, 6, 0, 20),
		Size = UDim2.new(1, -12, 0, 2),
		BackgroundColor3 = Color3.fromRGB(35, 35, 35),
		BorderSizePixel = 0,
		Parent = l1ll11lll1l.main
	})
	l1ll11lll1l.fill = L_5_:Create("Frame", {
		BackgroundColor3 = library_flags["Menu Accent Color"],
		BorderSizePixel = 0,
		Parent = l1ll11lll1l.slider
	})
	l1ll11lll1l.thumb = L_5_:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(0, 4, 0, 6),
		BackgroundColor3 = library_flags["Menu Accent Color"],
		BorderSizePixel = 0,
		Parent = l1ll11lll1l.fill
	})
	table.insert(L_5_.theme, l1ll11lll1l.fill)
	table.insert(L_5_.theme, l1ll11lll1l.thumb)
	if l1ll11lll1l.min >= 0 then
		l1ll11lll1l.fill.Size = UDim2.new((l1ll11lll1l.value - l1ll11lll1l.min) / (l1ll11lll1l.max - l1ll11lll1l.min), 0, 1, 0)
	else
		l1ll11lll1l.fill.Position = UDim2.new((0 - l1ll11lll1l.min) / (l1ll11lll1l.max - l1ll11lll1l.min), 0, 0, 0)
		l1ll11lll1l.fill.Size = UDim2.new(l1ll11lll1l.value / (l1ll11lll1l.max - l1ll11lll1l.min), 0, 1, 0)
	end;
	local L_794_ = l1ll11lll1l.main;
	L_794_.InputBegan:connect(function(ll11ll1111)
		if ll11ll1111.UserInputType.Name == "MouseButton1" then
			local vb = l1ll11lll1l.valueLabel
			local mp = inputService:GetMouseLocation()
			if vb and mp.X >= vb.AbsolutePosition.X and mp.X <= vb.AbsolutePosition.X + vb.AbsoluteSize.X
				and mp.Y >= vb.AbsolutePosition.Y and mp.Y <= vb.AbsolutePosition.Y + vb.AbsoluteSize.Y then
				return
			end
			L_5_.slider = l1ll11lll1l;
			l1ll11lll1l.slider.BorderColor3 = library_flags["Menu Accent Color"]
			local _mx = inputService:GetMouseLocation().X
			l1ll11lll1l:SetValue(l1ll11lll1l.min + (_mx - l1ll11lll1l.slider.AbsolutePosition.X) / l1ll11lll1l.slider.AbsoluteSize.X * (l1ll11lll1l.max - l1ll11lll1l.min))
		end;
		if ll11ll1111.UserInputType.Name == "MouseMovement" then
			if not L_5_.popup and not L_5_.warning and not L_5_.slider then
				l1ll11lll1l.slider.BorderColor3 = library_flags["Menu Accent Color"]
			end;
			if l1ll11lll1l.tip then
				L_5_.tooltip.Text = l1ll11lll1l.tip;
				L_5_.tooltip.Size = UDim2.new(0, textService:GetTextSize(l1ll11lll1l.tip, 15, Enum.Font.Code, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	L_794_.InputChanged:connect(function(lll111l1lll1)
		if lll111l1lll1.UserInputType.Name == "MouseMovement" then
			if l1ll11lll1l.tip then
				L_5_.tooltip.Position = UDim2.new(0, lll111l1lll1.Position.X + 56, 0, lll111l1lll1.Position.Y - 10)
			end
		end
		if lll111l1lll1.UserInputType.Name == "MouseWheel" then
			if not L_5_.popup and not L_5_.warning then
				local _step = l1ll11lll1l.float ~= 0 and l1ll11lll1l.float or 1
				l1ll11lll1l:SetValue(l1ll11lll1l.value + _step * math.sign(lll111l1lll1.Position.Z))
			end
		end
	end)
	L_794_.InputEnded:connect(function(l11111lll1ll)
		if l11111lll1ll.UserInputType.Name == "MouseMovement" then
			L_5_.tooltip.Position = UDim2.new(2)
			if l1ll11lll1l ~= L_5_.slider then
				l1ll11lll1l.slider.BorderColor3 = Color3.new()
			end
		end
	end)
function l1ll11lll1l:SetValue(ll1lll1lll, lll111l)
		if typeof(ll1lll1lll) ~= "number" then
			ll1lll1lll = 0
		end;
		ll1lll1lll = L_5_.round(ll1lll1lll, l1ll11lll1l.float)
		ll1lll1lll = math.clamp(ll1lll1lll, self.min, self.max)
		if self.min >= 0 then
			l1ll11lll1l.fill:TweenSize(UDim2.new((ll1lll1lll - self.min) / (self.max - self.min), 0, 1, 0), "Out", "Quad", 0.05, true)
		else
			l1ll11lll1l.fill:TweenPosition(UDim2.new((0 - self.min) / (self.max - self.min), 0, 0, 0), "Out", "Quad", 0.05, true)
			l1ll11lll1l.fill:TweenSize(UDim2.new(ll1lll1lll / (self.max - self.min), 0, 1, 0), "Out", "Quad", 0.1, true)
		end;
		library_flags[self.flag] = ll1lll1lll;
		self.value = ll1lll1lll;
		l1ll11lll1l.valueLabel.Text = tostring(l1ll11lll1l.value) .. l1ll11lll1l.suffix;
		if not lll111l and type(self.callback) == "function" then
			self.callback(ll1lll1lll)
		end
	end;
	delay(1, function()
		if L_5_ then
			l1ll11lll1l:SetValue(l1ll11lll1l.value)
		end
	end)
end;
local function ll1ll1(lll111l, l1111l11)
	lll111l.hasInit = true;
	if lll111l.sub then
		lll111l.main = lll111l:getMain()
		lll111l.main.Size = UDim2.new(1, 0, 0, 44)
	else
		lll111l.main = L_5_:Create("Frame", {
			LayoutOrder = lll111l.position,
			Size = UDim2.new(1, 0, 0, lll111l.text == " " and 26 or 44),
			BackgroundTransparency = 1,
			Parent = l1111l11
		})
		if lll111l.text ~= " " then
			L_5_:Create("TextLabel", {
				Position = UDim2.new(0, 6, 0, 0),
				Size = UDim2.new(1, -12, 0, 18),
				BackgroundTransparency = 1,
				Text = lll111l.text,
				TextSize = 15,
				Font = Enum.Font.Code,
				TextColor3 = Color3.fromRGB(210, 210, 210),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = lll111l.main
			})
		end
	end;
	local function lll11lllllll()
		local L_807_ = ""
		if type(lll111l.value) == "table" then
			for ll1l1lll, lll11ll11ll in next, lll111l.values do
				if lll111l.value[lll11ll11ll] then
					L_807_ = L_807_ .. tostring(lll11ll11ll) .. ", "
				end
			end
		end
		if L_807_ == "" then return "None" end
		return string.sub(L_807_, 1, #L_807_ - 2)
	end;
	local txt = ""
	if lll111l.multiselect then
		txt = lll11lllllll()
	else
		txt = (type(lll111l.value) == "table" or tostring(lll111l.value):match("table:")) and "None" or tostring(lll111l.value)
	end
	if tostring(txt):find("table:") then txt = "None" end
	lll111l.listvalue = L_5_:Create("TextLabel", {
		Position = UDim2.new(0, 6, 0, lll111l.text == " " and not lll111l.sub and 4 or 22),
		Size = UDim2.new(1, -12, 0, 18),
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BorderColor3 = Color3.new(),
		Text = " " .. txt,
		TextSize = 15,
		Font = Enum.Font.Code,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = lll111l.main
	})
	
	local listStroke = Instance.new("UIStroke")
	listStroke.Color = Color3.fromRGB(60, 60, 60)
	listStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	listStroke.Parent = lll111l.listvalue
	
	lll111l.arrow = L_5_:Create("Frame", {
		Position = UDim2.new(1, -14, 0, 5),
		Size = UDim2.new(0, 8, 0, 8),
		Rotation = 90,
		BackgroundTransparency = 1,
		Visible = false,
		Parent = lll111l.listvalue
	})
	lll111l.holder = L_5_:Create("TextButton", {
		ZIndex = 5,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		BorderColor3 = Color3.new(),
		Text = "",
		AutoButtonColor = false,
		Visible = false,
		Parent = L_5_.mainFrame or L_5_.base
	})
	lll111l.closeBtn = L_5_:Create("TextButton", {
		ZIndex = 4,
		Size = UDim2.new(1, 4000, 1, 4000),
		Position = UDim2.new(0, -2000, 0, -2000),
		BackgroundTransparency = 1,
		Text = "",
		Visible = false,
		Parent = L_5_.mainFrame or L_5_.base
	})
	lll111l.closeBtn.MouseButton1Click:Connect(function()
		lll111l:Close()
	end)
	lll111l.content = L_5_:Create("ScrollingFrame", {
		ZIndex = 4,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarImageColor3 = Color3.new(),
		ScrollBarThickness = 3,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		VerticalScrollBarInset = Enum.ScrollBarInset.Always,
		TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
		Parent = lll111l.holder
	})
	L_5_:Create("ImageLabel", {
		ZIndex = 4,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2592362371",
		ImageColor3 = Color3.fromRGB(60, 60, 60),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(2, 2, 62, 62),
		Parent = lll111l.holder
	})
	local L_803_ = L_5_:Create("UIListLayout", {
		Padding = UDim.new(0, 2),
		Parent = lll111l.content
	})
	L_5_:Create("UIPadding", {
		PaddingTop = UDim.new(0, 3),
		PaddingLeft = UDim.new(0, 3),
		Parent = lll111l.content
	})
	local L_804_ = 0;
	L_803_.Changed:connect(function()
		lll111l.holder.Size = UDim2.new(0, lll111l.listvalue.AbsoluteSize.X, 0, 6 + (L_804_ > lll111l.max and lll111l.max * 22 or L_803_.AbsoluteContentSize.Y))
		lll111l.content.CanvasSize = UDim2.new(0, 0, 0, 4 + L_803_.AbsoluteContentSize.Y)
	end)
	local L_805_ = lll111l.sub and lll111l.listvalue or lll111l.main;
	lll111l.listvalue.InputBegan:connect(function(ll11111l11)
		if ll11111l11.UserInputType.Name == "MouseButton1" then
			if L_5_.popup == lll111l then
				L_5_.popup:Close()
				return
			end;
			if L_5_.popup then
				L_5_.popup:Close()
			end;
			lll111l.arrow.Rotation = -90;
			lll111l.open = true;
			lll111l.holder.Visible = true;
			local L_811_ = lll111l.listvalue.AbsolutePosition - (L_5_.mainFrame and L_5_.mainFrame.AbsolutePosition or Vector2.new());
			lll111l.holder.Position = UDim2.new(0, L_811_.X, 0, L_811_.Y + lll111l.listvalue.AbsoluteSize.Y + 2)
			if lll111l.posTrack then lll111l.posTrack:Disconnect() end
			lll111l.posTrack = game:GetService("RunService").RenderStepped:Connect(function()
				if lll111l.open and lll111l.holder and lll111l.holder.Visible then
					local curPos = lll111l.listvalue.AbsolutePosition - (L_5_.mainFrame and L_5_.mainFrame.AbsolutePosition or Vector2.new());
					lll111l.holder.Position = UDim2.new(0, curPos.X, 0, curPos.Y + lll111l.listvalue.AbsoluteSize.Y + 2)
				else
					if lll111l.posTrack then lll111l.posTrack:Disconnect() lll111l.posTrack = nil end
				end
			end)
			L_5_.popup = lll111l;
			lll111l.listvalue.BorderColor3 = library_flags["Menu Accent Color"]
			if lll111l.closeBtn then lll111l.closeBtn.Visible = true end
		end;
		if ll11111l11.UserInputType.Name == "MouseMovement" then
			if not L_5_.popup and not L_5_.warning and not L_5_.slider then
				lll111l.listvalue.BorderColor3 = library_flags["Menu Accent Color"]
			end
		end
	end)
	lll111l.listvalue.InputEnded:connect(function(l11lll)
		if l11lll.UserInputType.Name == "MouseMovement" then
			if not lll111l.open then
				lll111l.listvalue.BorderColor3 = Color3.new()
			end
		end
	end)
	L_805_.InputBegan:connect(function(ll1lll11l)
		if ll1lll11l.UserInputType.Name == "MouseMovement" then
			if lll111l.tip then
				L_5_.tooltip.Text = lll111l.tip;
				L_5_.tooltip.Size = UDim2.new(0, textService:GetTextSize(lll111l.tip, 15, Enum.Font.Code, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	L_805_.InputChanged:connect(function(ll1lll1)
		if ll1lll1.UserInputType.Name == "MouseMovement" then
			if lll111l.tip then
				L_5_.tooltip.Position = UDim2.new(0, ll1lll1.Position.X + 56, 0, ll1lll1.Position.Y - 10)
			end
		end
	end)
	L_805_.InputEnded:connect(function(ll1l1l1ll)
		if ll1l1l1ll.UserInputType.Name == "MouseMovement" then
			L_5_.tooltip.Position = UDim2.new(2)
		end
	end)
	local L_806_;
function lll111l:AddValue(llll1111ll, l1ll11l)
		if self.labels[llll1111ll] then
			return
		end;
		L_804_ = L_804_ + 1;
		if self.multiselect then
			self.values[llll1111ll] = l1ll11l
		else
			if not table.find(self.values, llll1111ll) then
				table.insert(self.values, llll1111ll)
			end
		end;
		local L_818_ = L_5_:Create("TextLabel", {
			ZIndex = 4,
			Size = UDim2.new(1, 0, 0, 20),
			BackgroundTransparency = 1,
			Text = llll1111ll,
			TextSize = 15,
			Font = Enum.Font.Code,
			TextTransparency = self.multiselect and (self.value[llll1111ll] and 1 or 0) or self.value == llll1111ll and 1 or 0,
			TextColor3 = Color3.fromRGB(210, 210, 210),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = lll111l.content
		})
		self.labels[llll1111ll] = L_818_;
		local L_819_ = L_5_:Create("TextLabel", {
			ZIndex = 4,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 0.8,
			Text = " " .. llll1111ll,
			TextSize = 15,
			Font = Enum.Font.Code,
			TextColor3 = library_flags["Menu Accent Color"],
			TextXAlignment = Enum.TextXAlignment.Left,
			Visible = self.multiselect and self.value[llll1111ll] or self.value == llll1111ll,
			Parent = L_818_
		})
		L_806_ = L_806_ or self.value == llll1111ll and L_819_;
		table.insert(L_5_.theme, L_819_)
		L_818_.InputBegan:connect(function(ll1ll111)
			if ll1ll111.UserInputType.Name == "MouseButton1" then
				if self.multiselect then
					self.value[llll1111ll] = not self.value[llll1111ll]
					self:SetValue(self.value)
				else
					self:SetValue(llll1111ll)
					self:Close()
				end
			end
		end)
	end;
	for l1111ll1l11l, ll11ll1l1ll1 in next, lll111l.values do
		lll111l:AddValue(tostring(typeof(l1111ll1l11l) == "number" and ll11ll1l1ll1 or l1111ll1l11l))
	end;
function lll111l:RemoveValue(lll1l111l1l)
		local L_824_ = self.labels[lll1l111l1l]
		if L_824_ then
			L_824_:Destroy()
			self.labels[lll1l111l1l] = nil;
			L_804_ = L_804_ - 1;
			if self.multiselect then
				self.values[lll1l111l1l] = nil;
				self:SetValue(self.value)
			else
				table.remove(self.values, table.find(self.values, lll1l111l1l))
				if self.value == lll1l111l1l then
					L_806_ = nil;
					self:SetValue(self.values[1] or "")
				end
			end
		end
	end;
function lll111l:SetValue(ll11l1, l11l111ll1l1)
		if self.multiselect and typeof(ll11l1) ~= "table" then
			ll11l1 = {}
			for l11l1llll1, ll11ll in next, self.values do
				ll11l1[ll11ll] = false
			end
		end;
		self.value = typeof(ll11l1) == "table" and ll11l1 or tostring(table.find(self.values, ll11l1) and ll11l1 or self.values[1])
		library_flags[self.flag] = self.value;
		local txt = ""
		if self.multiselect then
			txt = lll11lllllll()
		else
			txt = (type(self.value) == "table" or tostring(self.value):match("table:")) and "None" or tostring(self.value)
		end
		if tostring(txt):find("table:") then txt = "None" end
		lll111l.listvalue.Text = " " .. txt
		if self.multiselect then
			for ll1111llll1, l111l1 in next, self.labels do
				l111l1.TextTransparency = self.value[ll1111llll1] and 1 or 0;
				if l111l1:FindFirstChild"TextLabel" then
					l111l1.TextLabel.Visible = self.value[ll1111llll1]
				end
			end
		else
			if L_806_ then
				L_806_.TextTransparency = 0;
				if L_806_:FindFirstChild"TextLabel" then
					L_806_.TextLabel.Visible = false
				end
			end;
			if self.labels[self.value] then
				L_806_ = self.labels[self.value]
				L_806_.TextTransparency = 1;
				if L_806_:FindFirstChild"TextLabel" then
					L_806_.TextLabel.Visible = true
				end
			end
		end;
		if not l11l111ll1l1 and type(self.callback) == "function" then
			self.callback(self.value)
		end
	end;
	delay(1, function()
		if L_5_ then
			lll111l:SetValue(lll111l.value)
		end
	end)
	function lll111l:Close()
		L_5_.popup = nil;
		lll111l.arrow.Rotation = 90;
		self.open = false;
		if lll111l.closeBtn then lll111l.closeBtn.Visible = false end
		lll111l.holder:TweenSize(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.2, true)
		delay(0.2, function()
			if not self.open then
				lll111l.holder.Visible = false
			end
		end)
		lll111l.listvalue.BorderColor3 = Color3.new()
	end;
	return lll111l
end;
local function l11l1lll1(lll1111, l1ll111l1)
	lll1111.hasInit = true;
	lll1111.main = L_5_:Create("Frame", {
		LayoutOrder = lll1111.position,
		Size = UDim2.new(1, 0, 0, lll1111.text == "nil" and 26 or 44),
		BackgroundTransparency = 1,
		Parent = l1ll111l1
	})
	if lll1111.text ~= "nil" then
		lll1111.title = L_5_:Create("TextLabel", {
			Position = UDim2.new(0, 6, 0, 0),
			Size = UDim2.new(1, -12, 0, 18),
			BackgroundTransparency = 1,
			Text = lll1111.text,
			TextSize = 15,
			Font = Enum.Font.Code,
			TextColor3 = Color3.fromRGB(210, 210, 210),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = lll1111.main
		})
	end;
	lll1111.holder = L_5_:Create("Frame", {
		Position = UDim2.new(0, 6, 0, lll1111.text == "nil" and 4 or 20),
		Size = UDim2.new(1, -12, 0, 20),
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BorderColor3 = Color3.new(),
		Parent = lll1111.main
	})
	L_5_:Create("ImageLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2454009026",
		ImageColor3 = Color3.new(),
		ImageTransparency = 0.8,
		Parent = lll1111.holder
	})
	L_5_:Create("ImageLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2592362371",
		ImageColor3 = Color3.fromRGB(60, 60, 60),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(2, 2, 62, 62),
		Parent = lll1111.holder
	})
	local L_833_ = L_5_:Create("TextBox", {
		Position = UDim2.new(0, 4, 0, 0),
		Size = UDim2.new(1, -4, 1, 0),
		BackgroundTransparency = 1,
		Text = "  " .. lll1111.value,
		TextSize = 15,
		Font = Enum.Font.Code,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextWrapped = true,
		ClearTextOnFocus = false,
		Parent = lll1111.holder
	})
	L_833_.FocusLost:connect(function(l111l1111ll1)
		lll1111.holder.BorderColor3 = Color3.new()
		lll1111:SetValue(L_833_.Text, l111l1111ll1)
	end)
	L_833_.Focused:connect(function()
		lll1111.holder.BorderColor3 = library_flags["Menu Accent Color"]
	end)
	L_833_.InputBegan:connect(function(lll1l11111)
		if lll1l11111.UserInputType.Name == "MouseButton1" then
			pcall(function() lll1111:SetState(not lll1111.state) end)
		end;
		if lll1l11111.UserInputType.Name == "MouseMovement" then
			if not L_5_.popup and not L_5_.warning and not L_5_.slider then
				lll1111.holder.BorderColor3 = library_flags["Menu Accent Color"]
			end;
			if lll1111.tip then
				L_5_.tooltip.Text = lll1111.tip;
				L_5_.tooltip.Size = UDim2.new(0, textService:GetTextSize(lll1111.tip, 15, Enum.Font.Code, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	L_833_.InputChanged:connect(function(l11ll1l1)
		if l11ll1l1.UserInputType.Name == "MouseMovement" then
			if lll1111.tip then
				L_5_.tooltip.Position = UDim2.new(0, l11ll1l1.Position.X + 56, 0, l11ll1l1.Position.Y - 10)
			end
		end
	end)
	L_833_.InputEnded:connect(function(l1ll1llll)
		if l1ll1llll.UserInputType.Name == "MouseMovement" then
			if not L_833_:IsFocused() then
				lll1111.holder.BorderColor3 = Color3.new()
			end;
			L_5_.tooltip.Position = UDim2.new(2)
		end
	end)
function lll1111:SetValue(l11ll1l11l, l1ll111l1)
		if tostring(l11ll1l11l) == "" then
			L_833_.Text = self.value
		else
			library_flags[self.flag] = tostring(l11ll1l11l)
			self.value = tostring(l11ll1l11l)
			L_833_.Text = self.value;
			if type(self.callback) == "function" then
				self.callback(l11ll1l11l, l1ll111l1)
			end
		end
	end;
	delay(1, function()
		if L_5_ then
			lll1111:SetValue(lll1111.value)
		end
	end)
end;
local function lll111(l1111l1ll)
	l1111l1ll.mainHolder = L_5_:Create("TextButton", {
		ZIndex = 14,
		Size = UDim2.new(0, l1111l1ll.trans and 170 or 150, 0, 160),
		BackgroundColor3 = Color3.fromRGB(22, 22, 22),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		AutoButtonColor = false,
		Visible = false,
		Parent = L_5_.base
	})
	local L_841_, L_842_, L_843_ = Color3.toHSV(l1111l1ll.color)
	L_841_, L_842_, L_843_ = L_841_ == 0 and 1 or L_841_, L_842_ + 0.005, L_843_ - 0.005;
	local L_844_;
	local L_845_;
	local L_846_;
	local L_847_;
	local marginX = l1111l1ll.trans and -20 or -10
	local L_848_ = L_5_:Create("Frame", {
		ZIndex = 14,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 5, 1, -5),
		Size = UDim2.new(1, marginX, 0, 10),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Parent = l1111l1ll.mainHolder
	})
	local L_849_ = L_5_:Create("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
			ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),
			ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
			ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),
			ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
		}),
		Parent = L_848_
	})
	local L_850_ = L_5_:Create("Frame", {
		ZIndex = 15,
		Position = UDim2.new(1 - L_841_, 0, 0, 0),
		Size = UDim2.new(0, 2, 1, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Parent = L_848_
	})
	L_848_.InputBegan:connect(function(lll111lll)
		if lll111lll.UserInputType.Name == "MouseButton1" then
			L_844_ = true;
			X = L_848_.AbsolutePosition.X + L_848_.AbsoluteSize.X - L_848_.AbsolutePosition.X;
			X = math.clamp((lll111lll.Position.X - L_848_.AbsolutePosition.X) / X, 0, 1)
			l1111l1ll:SetColor(Color3.fromHSV(1 - X, L_842_, L_843_))
		end
	end)
	L_848_.InputEnded:connect(function(inputBeganEvent)
		if inputBeganEvent.UserInputType.Name == "MouseButton1" then
			L_844_ = false
		end
	end)
	local L_851_ = L_5_:Create("ImageLabel", {
		ZIndex = 14,
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(1, marginX, 1, -25),
		BackgroundColor3 = Color3.fromHSV(L_841_, 1, 1),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Image = "rbxassetid://4155801252",
		ClipsDescendants = true,
		Parent = l1111l1ll.mainHolder
	})
	local L_852_ = L_5_:Create("Frame", {
		ZIndex = 15,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(L_842_, 0, 1 - L_843_, 0),
		Size = UDim2.new(0, 4, 0, 4),
		Rotation = 45,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
		Parent = L_851_
	})
	L_851_.InputBegan:connect(function(ll1l1lll11l)
		if ll1l1lll11l.UserInputType.Name == "MouseButton1" then
			L_845_ = true;
			X = L_851_.AbsolutePosition.X + L_851_.AbsoluteSize.X - L_851_.AbsolutePosition.X;
			Y = L_851_.AbsolutePosition.Y + L_851_.AbsoluteSize.Y - L_851_.AbsolutePosition.Y;
			X = math.clamp((ll1l1lll11l.Position.X - L_851_.AbsolutePosition.X) / X, 0.005, 1)
			Y = math.clamp((ll1l1lll11l.Position.Y - L_851_.AbsolutePosition.Y) / Y, 0, 1)
			l1111l1ll:SetColor(Color3.fromHSV(L_841_, X, 1 - Y))
		end
	end)
	L_851_.InputEnded:connect(function(llll1l1)
		if llll1l1.UserInputType.Name == "MouseButton1" then
			L_845_ = false
		end
	end)
	if l1111l1ll.trans then
		L_847_ = L_5_:Create("ImageLabel", {
			ZIndex = 15,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			Image = "rbxassetid://2454009026",
			ImageColor3 = Color3.fromHSV(L_841_, 1, 1),
			Rotation = 180,
			Parent = L_5_:Create("ImageLabel", {
				ZIndex = 14,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -5, 0, 5),
				Size = UDim2.new(0, 10, 1, -25),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Image = "rbxassetid://4632082392",
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.new(0, 5, 0, 5),
				Parent = l1111l1ll.mainHolder
			})
		})
		l1111l1ll.transSlider = L_5_:Create("Frame", {
			ZIndex = 16,
			Position = UDim2.new(0, -1, l1111l1ll.trans, 0),
			Size = UDim2.new(1, 2, 0, 2),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Parent = L_847_
		})
		L_847_.InputBegan:connect(function(lll111l1)
			if lll111l1.UserInputType.Name == "MouseButton1" then
				L_846_ = true;
				l1111l1ll:SetTrans(1 - (lll111l1.Position.Y - L_847_.AbsolutePosition.Y) / L_847_.AbsoluteSize.Y)
			end
		end)
		L_847_.InputEnded:connect(function(lll11ll1ll)
			if lll11ll1ll.UserInputType.Name == "MouseButton1" then
				L_846_ = false
			end
		end)
	end;
	L_5_:AddConnection(inputService.InputChanged, function(lll11ll11ll)
		if lll11ll11ll.UserInputType.Name == "MouseMovement" then
			if L_845_ then
				X = L_851_.AbsolutePosition.X + L_851_.AbsoluteSize.X - L_851_.AbsolutePosition.X;
				Y = L_851_.AbsolutePosition.Y + L_851_.AbsoluteSize.Y - L_851_.AbsolutePosition.Y;
				X = math.clamp((lll11ll11ll.Position.X - L_851_.AbsolutePosition.X) / X, 0.005, 1)
				Y = math.clamp((lll11ll11ll.Position.Y - L_851_.AbsolutePosition.Y) / Y, 0, 1)
				l1111l1ll:SetColor(Color3.fromHSV(L_841_, X, 1 - Y))
			elseif L_844_ then
				X = L_848_.AbsolutePosition.X + L_848_.AbsoluteSize.X - L_848_.AbsolutePosition.X;
				X = math.clamp((lll11ll11ll.Position.X - L_848_.AbsolutePosition.X) / X, 0, 1)
				l1111l1ll:SetColor(Color3.fromHSV(1 - X, L_842_, L_843_))
			elseif L_846_ then
				l1111l1ll:SetTrans(1 - (lll11ll11ll.Position.Y - L_847_.AbsolutePosition.Y) / L_847_.AbsoluteSize.Y)
			end
		end
	end)
function l1111l1ll:updateVisuals(l111l1l1lll)
		L_841_, L_842_, L_843_ = Color3.toHSV(l111l1l1lll)
		L_841_ = L_841_ == 0 and 1 or L_841_;
		L_851_.BackgroundColor3 = Color3.fromHSV(L_841_, 1, 1)
		if l1111l1ll.trans then
			L_847_.ImageColor3 = Color3.fromHSV(L_841_, 1, 1)
		end;
		L_850_.Position = UDim2.new(1 - L_841_, 0, 0, 0)
		L_852_.Position = UDim2.new(L_842_, 0, 1 - L_843_, 0)
	end;
	return l1111l1ll
end;
local function lll111ll1(l111ll1l111, l11l1111l)
	l111ll1l111.hasInit = true;
	if l111ll1l111.sub then
		l111ll1l111.main = l111ll1l111:getMain()
	else
		l111ll1l111.main = L_5_:Create("Frame", {
			LayoutOrder = l111ll1l111.position,
			Size = UDim2.new(1, 0, 0, 20),
			BackgroundTransparency = 1,
			Parent = l11l1111l
		})
		l111ll1l111.title = L_5_:Create("TextLabel", {
			Position = UDim2.new(0, 6, 0, 0),
			Size = UDim2.new(1, -12, 1, 0),
			BackgroundTransparency = 1,
			Text = l111ll1l111.text,
			TextSize = 15,
			Font = Enum.Font.Code,
			TextColor3 = Color3.fromRGB(210, 210, 210),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = l111ll1l111.main
		})
	end;
	l111ll1l111.visualize = L_5_:Create(l111ll1l111.sub and "TextButton" or "Frame", {
		Position = UDim2.new(1, - (l111ll1l111.subpos or 0) - 24, 0, 4),
		Size = UDim2.new(0, 18, 0, 12),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		BackgroundColor3 = l111ll1l111.color,
		BorderColor3 = Color3.new(),
		Parent = l111ll1l111.main
	})
	L_5_:Create("ImageLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2454009026",
		ImageColor3 = Color3.new(),
		ImageTransparency = 0.6,
		Parent = l111ll1l111.visualize
	})
	L_5_:Create("ImageLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2592362371",
		ImageColor3 = Color3.fromRGB(60, 60, 60),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(2, 2, 62, 62),
		Parent = l111ll1l111.visualize
	})
	local L_863_ = l111ll1l111.sub and l111ll1l111.visualize or l111ll1l111.main;
	if l111ll1l111.sub then
		l111ll1l111.visualize.Text = ""
		l111ll1l111.visualize.AutoButtonColor = false
	end;
	L_863_.InputBegan:connect(function(llll11l)
		if llll11l.UserInputType.Name == "MouseButton1" then
			if not l111ll1l111.mainHolder then
				lll111(l111ll1l111)
			end;
			if L_5_.popup == l111ll1l111 then
				L_5_.popup:Close()
				return
			end;
			if L_5_.popup then
				L_5_.popup:Close()
			end;
			l111ll1l111.open = true;
			local L_865_ = l111ll1l111.main.AbsolutePosition;
			l111ll1l111.mainHolder.Position = UDim2.new(0, L_865_.X + 36 + (l111ll1l111.trans and -16 or 0), 0, L_865_.Y + 56)
			l111ll1l111.mainHolder.Visible = true;
			L_5_.popup = l111ll1l111;
			l111ll1l111.visualize.BorderColor3 = library_flags["Menu Accent Color"]
		end;
		if llll11l.UserInputType.Name == "MouseMovement" then
			if not L_5_.popup and not L_5_.warning and not L_5_.slider then
				l111ll1l111.visualize.BorderColor3 = library_flags["Menu Accent Color"]
			end;
			if l111ll1l111.tip then
				L_5_.tooltip.Text = l111ll1l111.tip;
				L_5_.tooltip.Size = UDim2.new(0, textService:GetTextSize(l111ll1l111.tip, 15, Enum.Font.Code, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	L_863_.InputChanged:connect(function(ll111l1l)
		if ll111l1l.UserInputType.Name == "MouseMovement" then
			if l111ll1l111.tip then
				L_5_.tooltip.Position = UDim2.new(0, ll111l1l.Position.X + 56, 0, ll111l1l.Position.Y - 10)
			end
		end
	end)
	L_863_.InputEnded:connect(function(l1111l1lll)
		if l1111l1lll.UserInputType.Name == "MouseMovement" then
			if not l111ll1l111.open then
				l111ll1l111.visualize.BorderColor3 = Color3.new()
			end;
			L_5_.tooltip.Position = UDim2.new(2)
		end
	end)
function l111ll1l111:SetColor(llll1l1, l1111lll11l1)
		if typeof(llll1l1) == "table" then
			llll1l1 = Color3.new(llll1l1[1], llll1l1[2], llll1l1[3])
		end;
		llll1l1 = llll1l1 or Color3.new(1, 1, 1)
		if self.mainHolder then
			self:updateVisuals(llll1l1)
		end;
		l111ll1l111.visualize.BackgroundColor3 = llll1l1;
		library_flags[self.flag] = llll1l1;
		self.color = llll1l1;
		if not ll1111l1l111 and type(self.callback) == "function" then
			self.callback(llll1l1)
		end
	end;
	if l111ll1l111.trans then
function l111ll1l111:SetTrans(ll1l1l1l1111, ll1l1ll111)
			ll1l1l1l1111 = math.clamp(tonumber(ll1l1l1l1111) or 0, 0, 1)
			if self.transSlider then
				self.transSlider.Position = UDim2.new(0, 0, ll1l1l1l1111, 0)
			end;
			self.trans = ll1l1l1l1111;
			library_flags[self.flag .. " Transparency"] = 1 - ll1l1l1l1111;
			if type(self.calltrans) == "function" then
				self.calltrans(ll1l1l1l1111)
			end
		end;
		l111ll1l111:SetTrans(l111ll1l111.trans)
	end;
	delay(1, function()
		if L_5_ then
			l111ll1l111:SetColor(l111ll1l111.color)
		end
	end)
function l111ll1l111:Close()
		L_5_.popup = nil;
		self.open = false;
		self.mainHolder.Visible = false;
		l111ll1l111.visualize.BorderColor3 = Color3.new()
	end
end;
	function L_5_:RegisterTabObject(obj)
		function obj:GetColumn(l11l111l1ll1)
			return self.columns[l11l111l1ll1]
		end;
		function obj:AddColumn()
			local L_876_ = {
				sections = {},
				position = # self.columns,
				canInit = true,
				tab = self
			}
			table.insert(self.columns, L_876_)
			function L_876_:AddSection(ll1ll1l1)
				local L_878_ = {
					title = tostring(ll1ll1l1),
					hasInit = false,
					options = {},
					canInit = true,
					column = self
				}
				table.insert(self.sections, L_878_)
				function L_878_:AddLabel(lll11l)
					local L_880_ = {}
					L_880_.section = self;
					L_880_.text = tostring(lll11l)
					L_880_.type = "label"
					L_880_.position = # self.options;
					L_880_.canInit = true;
					table.insert(self.options, L_880_)
					if L_5_.hasInit and self.hasInit then
						llll1l(L_880_, self.content)
					else
						L_880_.Init = llll1l
					end;
					return L_880_
				end;
				function L_878_:AddToggle(ll1l11llllll)
					ll1l11llllll = typeof(ll1l11llllll) == "table" and ll1l11llllll or {}
					ll1l11llllll.section = self;
					ll1l11llllll.text = tostring(ll1l11llllll.text)
					ll1l11llllll.state = typeof(ll1l11llllll.state) == "boolean" and ll1l11llllll.state or false;
					ll1l11llllll.callback = typeof(ll1l11llllll.callback) == "function" and ll1l11llllll.callback or function() end;
					ll1l11llllll.type = "toggle"
					ll1l11llllll.position = # self.options;
					ll1l11llllll.flag = (L_5_.flagprefix and L_5_.flagprefix .. " " or "") .. (ll1l11llllll.flag or ll1l11llllll.text)
					ll1l11llllll.subcount = 0;
					ll1l11llllll.canInit = ll1l11llllll.canInit ~= nil and ll1l11llllll.canInit or true;
					ll1l11llllll.tip = ll1l11llllll.tip and tostring(ll1l11llllll.tip)
					ll1l11llllll.style = ll1l11llllll.style == 2;
					library_flags[ll1l11llllll.flag] = ll1l11llllll.state;
					table.insert(self.options, ll1l11llllll)
					L_5_.options[ll1l11llllll.flag] = ll1l11llllll;
					function ll1l11llllll:AddColor(l1l1llll1l1)
						l1l1llll1l1 = typeof(l1l1llll1l1) == "table" and l1l1llll1l1 or {}
						l1l1llll1l1.sub = true;
						l1l1llll1l1.subpos = self.subcount * 24;
						function l1l1llll1l1:getMain() return ll1l11llllll.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddColor(l1l1llll1l1)
					end;
					function ll1l11llllll:AddBind(lllll1)
						lllll1 = typeof(lllll1) == "table" and lllll1 or {}
						lllll1.sub = true;
						lllll1.subpos = self.subcount * 24;
						lllll1.flag = lllll1.flag or ((ll1l11llllll.flag or ll1l11llllll.text or "Bind") .. " Bind")
						function lllll1:getMain() return ll1l11llllll.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddBind(lllll1)
					end;
					function ll1l11llllll:AddList(llll1l11l1)
						llll1l11l1 = typeof(llll1l11l1) == "table" and llll1l11l1 or {}
						llll1l11l1.sub = true;
						function llll1l11l1:getMain() return ll1l11llllll.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddList(llll1l11l1)
					end;
					function ll1l11llllll:AddSlider(l1l11111ll)
						l1l11111ll = typeof(l1l11111ll) == "table" and l1l11111ll or {}
						l1l11111ll.sub = true;
						function l1l11111ll:getMain() return ll1l11llllll.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddSlider(l1l11111ll)
					end;
					if L_5_.hasInit and self.hasInit then
						InitCheckbox(ll1l11llllll, self.content)
					else
						ll1l11llllll.Init = lll1ll
					end;
					return ll1l11llllll
				end;
				function L_878_:AddButton(l11l11l)
					l11l11l = typeof(l11l11l) == "table" and l11l11l or {}
					l11l11l.section = self;
					l11l11l.text = tostring(l11l11l.text)
					l11l11l.callback = typeof(l11l11l.callback) == "function" and l11l11l.callback or function() end;
					l11l11l.type = "button"
					l11l11l.position = # self.options;
					l11l11l.flag = (L_5_.flagprefix and L_5_.flagprefix .. " " or "") .. (l11l11l.flag or l11l11l.text)
					l11l11l.subcount = 0;
					l11l11l.canInit = l11l11l.canInit ~= nil and l11l11l.canInit or true;
					l11l11l.tip = l11l11l.tip and tostring(l11l11l.tip)
					table.insert(self.options, l11l11l)
					L_5_.options[l11l11l.flag] = l11l11l;
					function l11l11l:AddBind(l1l11ll111l1)
						l1l11ll111l1 = typeof(l1l11ll111l1) == "table" and l1l11ll111l1 or {}
						l1l11ll111l1.sub = true;
						l1l11ll111l1.subpos = self.subcount * 24;
						l1l11ll111l1.flag = l1l11ll111l1.flag or ((l11l11l.flag or l11l11l.text or "Bind") .. " Bind")
						function l1l11ll111l1:getMain() l11l11l.main.Size = UDim2.new(1, 0, 0, 40) return l11l11l.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddBind(l1l11ll111l1)
					end;
					function l11l11l:AddColor(ll1ll1lll1l1)
						ll1ll1lll1l1 = typeof(ll1ll1lll1l1) == "table" and ll1ll1lll1l1 or {}
						ll1ll1lll1l1.sub = true;
						ll1ll1lll1l1.subpos = self.subcount * 24;
						function ll1ll1lll1l1:getMain() l11l11l.main.Size = UDim2.new(1, 0, 0, 40) return l11l11l.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddColor(ll1ll1lll1l1)
					end;
					if L_5_.hasInit and self.hasInit then
						l111l1lll1(l11l11l, self.content)
					else
						l11l11l.Init = l111l1lll1
					end;
					return l11l11l
				end;
				function L_878_:AddBind(llll1ll1111l)
					llll1ll1111l = typeof(llll1ll1111l) == "table" and llll1ll1111l or {}
					llll1ll1111l.section = self;
					llll1ll1111l.text = tostring(llll1ll1111l.text)
					llll1ll1111l.key = shortenBindName(llll1ll1111l.key or "none")
					llll1ll1111l.nomouse = typeof(llll1ll1111l.nomouse) == "boolean" and llll1ll1111l.nomouse or false;
					llll1ll1111l.mode = typeof(llll1ll1111l.mode) == "string" and (llll1ll1111l.mode == "toggle" or llll1ll1111l.mode == "hold" and llll1ll1111l.mode) or "toggle"
					llll1ll1111l.callback = typeof(llll1ll1111l.callback) == "function" and llll1ll1111l.callback or function() end;
					llll1ll1111l.type = "bind"
					llll1ll1111l.position = # self.options;
					llll1ll1111l.flag = (L_5_.flagprefix and L_5_.flagprefix .. " " or "") .. (llll1ll1111l.flag or llll1ll1111l.text)
					llll1ll1111l.canInit = llll1ll1111l.canInit ~= nil and llll1ll1111l.canInit or true;
					llll1ll1111l.tip = llll1ll1111l.tip and tostring(llll1ll1111l.tip)
					table.insert(self.options, llll1ll1111l)
					L_5_.options[llll1ll1111l.flag] = llll1ll1111l;
					if L_5_.hasInit and self.hasInit then
						l11lllll1(llll1ll1111l, self.content)
					else
						llll1ll1111l.Init = l11lllll1
					end;
					return llll1ll1111l
				end;
				function L_878_:AddSlider(l1ll1l11)
					l1ll1l11 = typeof(l1ll1l11) == "table" and l1ll1l11 or {}
					l1ll1l11.section = self;
					l1ll1l11.text = tostring(l1ll1l11.text)
					l1ll1l11.min = typeof(l1ll1l11.min) == "number" and l1ll1l11.min or 0;
					l1ll1l11.max = typeof(l1ll1l11.max) == "number" and l1ll1l11.max or 0;
					l1ll1l11.value = l1ll1l11.min < 0 and 0 or math.clamp(typeof(l1ll1l11.value) == "number" and l1ll1l11.value or l1ll1l11.min, l1ll1l11.min, l1ll1l11.max)
					l1ll1l11.callback = typeof(l1ll1l11.callback) == "function" and l1ll1l11.callback or function() end;
					l1ll1l11.float = typeof(l1ll1l11.value) == "number" and l1ll1l11.float or 1;
					l1ll1l11.suffix = l1ll1l11.suffix and tostring(l1ll1l11.suffix) or ""
					l1ll1l11.textpos = l1ll1l11.textpos == 2;
					l1ll1l11.type = "slider"
					l1ll1l11.position = # self.options;
					l1ll1l11.flag = (L_5_.flagprefix and L_5_.flagprefix .. " " or "") .. (l1ll1l11.flag or l1ll1l11.text)
					l1ll1l11.subcount = 0;
					l1ll1l11.canInit = l1ll1l11.canInit ~= nil and l1ll1l11.canInit or true;
					l1ll1l11.tip = l1ll1l11.tip and tostring(l1ll1l11.tip)
					library_flags[l1ll1l11.flag] = l1ll1l11.value;
					table.insert(self.options, l1ll1l11)
					L_5_.options[l1ll1l11.flag] = l1ll1l11;
					function l1ll1l11:AddColor(lll111)
						lll111 = typeof(lll111) == "table" and lll111 or {}
						lll111.sub = true;
						lll111.subpos = self.subcount * 24;
						function lll111:getMain() return l1ll1l11.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddColor(lll111)
					end;
					function l1ll1l11:AddBind(ll111l1111)
						ll111l1111 = typeof(ll111l1111) == "table" and ll111l1111 or {}
						ll111l1111.sub = true;
						ll111l1111.flag = ll111l1111.flag or ((l1ll1l11.flag or l1ll1l11.text or "Bind") .. " Bind")
						ll111l1111.subpos = self.subcount * 24;
						function ll111l1111:getMain() return l1ll1l11.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddBind(ll111l1111)
					end;
					if L_5_.hasInit and self.hasInit then
						lll1l1(l1ll1l11, self.content)
					else
						l1ll1l11.Init = lll1l1
					end;
						return l1ll1l11
				end;
				function L_878_:AddList(lllll1)
					lllll1 = typeof(lllll1) == "table" and lllll1 or {}
					lllll1.section = self;
					lllll1.text = tostring(lllll1.text)
					lllll1.values = typeof(lllll1.values) == "table" and lllll1.values or {}
					lllll1.callback = typeof(lllll1.callback) == "function" and lllll1.callback or function() end;
					lllll1.multiselect = typeof(lllll1.multiselect) == "boolean" and lllll1.multiselect or false;
					lllll1.value = lllll1.multiselect and (typeof(lllll1.value) == "table" and lllll1.value or {}) or tostring(lllll1.value or lllll1.values[1] or "")
					if lllll1.multiselect then for l1l1l11l11ll, lllll1_ in next, lllll1.values do lllll1.value[lllll1_] = false end end;
					lllll1.max = lllll1.max or 4;
					lllll1.open = false;
					lllll1.type = "list"
					lllll1.position = # self.options;
					lllll1.labels = {}
					lllll1.flag = (L_5_.flagprefix and L_5_.flagprefix .. " " or "") .. (lllll1.flag or lllll1.text)
					lllll1.subcount = 0;
					lllll1.canInit = lllll1.canInit ~= nil and lllll1.canInit or true;
					lllll1.tip = lllll1.tip and tostring(lllll1.tip)
					library_flags[lllll1.flag] = lllll1.value;
					table.insert(self.options, lllll1)
					L_5_.options[lllll1.flag] = lllll1;
					function lllll1:AddValue(l1l1l111ll1, lll111) if self.multiselect then self.values[l1l1l111ll1] = lll111 else table.insert(self.values, l1l1l111ll1) end end;
					function lllll1:AddColor(l1ll1ll1lll)
						l1ll1ll1lll = typeof(l1ll1ll1lll) == "table" and l1ll1ll1lll or {}
						l1ll1ll1lll.sub = true;
						l1ll1ll1lll.subpos = self.subcount * 24;
						function l1ll1ll1lll:getMain() return lllll1.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddColor(l1ll1ll1lll)
					end;
					function lllll1:AddBind(ll1llllll)
						ll1llllll = typeof(ll1llllll) == "table" and ll1llllll or {}
						ll1llllll.sub = true;
						ll1llllll.subpos = self.subcount * 24;
						ll1llllll.flag = ll1llllll.flag or ((lllll1.flag or lllll1.text or "Bind") .. " Bind")
						function ll1llllll:getMain() return lllll1.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddBind(ll1llllll)
					end;
					if L_5_.hasInit and self.hasInit then ll1ll1(lllll1, self.content) else lllll1.Init = ll1ll1 end;
					return lllll1
				end;
				function L_878_:AddBox(l1llllll1l11)
					l1llllll1l11 = typeof(l1llllll1l11) == "table" and l1llllll1l11 or {}
					l1llllll1l11.section = self;
					l1llllll1l11.text = tostring(l1llllll1l11.text)
					l1llllll1l11.value = tostring(l1llllll1l11.value or "")
					l1llllll1l11.callback = typeof(l1llllll1l11.callback) == "function" and l1llllll1l11.callback or function() end;
					l1llllll1l11.type = "box"
					l1llllll1l11.position = # self.options;
					l1llllll1l11.flag = (L_5_.flagprefix and L_5_.flagprefix .. " " or "") .. (l1llllll1l11.flag or l1llllll1l11.text)
					l1llllll1l11.canInit = l1llllll1l11.canInit ~= nil and l1llllll1l11.canInit or true;
					l1llllll1l11.tip = l1llllll1l11.tip and tostring(l1llllll1l11.tip)
					library_flags[l1llllll1l11.flag] = l1llllll1l11.value;
					table.insert(self.options, l1llllll1l11)
					L_5_.options[l1llllll1l11.flag] = l1llllll1l11;
					if L_5_.hasInit and self.hasInit then l11l1lll1(l1llllll1l11, self.content) else l1llllll1l11.Init = l11l1lll1 end;
					return l1llllll1l11
				end;
				function L_878_:AddColor(l11ll1l1ll)
					l11ll1l1ll = typeof(l11ll1l1ll) == "table" and l11ll1l1ll or {}
					l11ll1l1ll.section = self;
					l11ll1l1ll.text = tostring(l11ll1l1ll.text)
					l11ll1l1ll.color = typeof(l11ll1l1ll.color) == "table" and Color3.new(tonumber(l11ll1l1ll.color[1]), tonumber(l11ll1l1ll.color[2]), tonumber(l11ll1l1ll.color[3])) or l11ll1l1ll.color or Color3.new(255, 255, 255)
					l11ll1l1ll.callback = typeof(l11ll1l1ll.callback) == "function" and l11ll1l1ll.callback or function() end;
					l11ll1l1ll.calltrans = typeof(l11ll1l1ll.calltrans) == "function" and l11ll1l1ll.calltrans or l11ll1l1ll.calltrans == 1 and l11ll1l1ll.callback or function() end;
					l11ll1l1ll.open = false;
					l11ll1l1ll.trans = tonumber(l11ll1l1ll.trans)
					l11ll1l1ll.subcount = 1;
					l11ll1l1ll.type = "color"
					l11ll1l1ll.position = # self.options;
					l11ll1l1ll.flag = (L_5_.flagprefix and L_5_.flagprefix .. " " or "") .. (l11ll1l1ll.flag or l11ll1l1ll.text)
					l11ll1l1ll.canInit = l11ll1l1ll.canInit ~= nil and l11ll1l1ll.canInit or true;
					l11ll1l1ll.tip = l11ll1l1ll.tip and tostring(l11ll1l1ll.tip)
					library_flags[l11ll1l1ll.flag] = l11ll1l1ll.color;
					table.insert(self.options, l11ll1l1ll)
					L_5_.options[l11ll1l1ll.flag] = l11ll1l1ll;
					function l11ll1l1ll:AddColor(l11111)
						l11111 = typeof(l11111) == "table" and l11111 or {}
						l11111.sub = true;
						l11111.subpos = self.subcount * 24;
						function l11111:getMain() return l11ll1l1ll.main end;
						self.subcount = self.subcount + 1;
						return L_878_:AddColor(l11111)
					end;
					if l11ll1l1ll.trans then library_flags[l11ll1l1ll.flag .. " Transparency"] = l11ll1l1ll.trans end;
					if L_5_.hasInit and self.hasInit then lll111ll1(l11ll1l1ll, self.content) else l11ll1l1ll.Init = lll111ll1 end;
					return l11ll1l1ll
				end;
				function L_878_:AddPlayerList(opt)
					opt = typeof(opt) == "table" and opt or {}
					opt.section = self
					opt.type = "player_list"
					opt.flag = (L_5_.flagprefix and L_5_.flagprefix .. " " or "") .. (opt.flag or "Player List")
					opt.canInit = opt.canInit ~= nil and opt.canInit or true
					table.insert(self.options, opt)
					L_5_.options[opt.flag] = opt
					return opt
				end;
				function L_878_:SetTitle(lll111111) self.title = tostring(lll111111) if self.titleText then self.titleText.Text = tostring(lll111111) end end;
				function L_878_:Init()
					if self.hasInit then return end
					self.hasInit = true;
					self.main = L_5_:Create("Frame", { BackgroundColor3 = Color3.fromRGB(30,30,30), BorderColor3 = Color3.new(), Parent = L_876_.main })
					self.content = L_5_:Create("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(60, 60, 60), BorderMode = Enum.BorderMode.Inset, Parent = self.main })
					table.insert(L_5_.theme, L_5_:Create("Frame", { Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = library_flags["Menu Accent Color"], BorderSizePixel = 0, BorderMode = Enum.BorderMode.Inset, Parent = self.main }))
					local L_904_ = L_5_:Create("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = self.content })
					L_5_:Create("UIPadding", { PaddingTop = UDim.new(0, 12), Parent = self.content })
					self.titleText = L_5_:Create("TextLabel", { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(0, textService:GetTextSize(self.title, 15, Enum.Font.Code, Vector2.new(387420489, 387420489)).X + 10, 0, 2), BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderSizePixel = 0, Text = self.title, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.new(1, 1, 1), Parent = self.main })
					L_904_.Changed:connect(function() self.main.Size = UDim2.new(1, 0, 0, L_904_.AbsoluteContentSize.Y + 16) end)
					for ll1l1l, l1111ll11l1l in next, self.options do l1111ll11l1l.Init(l1111ll11l1l, self.content) end
				end;
				return L_878_
			end;
			function L_876_:Init()
				if self.hasInit then return end
				self.hasInit = true
				self.main = L_5_:Create("ScrollingFrame", {
					ZIndex = 2,
					Position = UDim2.new(0, 6 + self.position * 239, 0, 2),
					Size = UDim2.new(0, 233, 1, -4),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ScrollBarImageColor3 = Color3.fromRGB(),
					ScrollBarThickness = 4,
					VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					Visible = false,
					Parent = L_5_.columnHolder
				})
				local L_907_ = L_5_:Create("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 12), Parent = self.main
				})
				L_5_:Create("UIPadding", { PaddingTop = UDim.new(0, 8), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), Parent = self.main })
				L_907_.Changed:connect(function() self.main.CanvasSize = UDim2.new(0, 0, 0, L_907_.AbsoluteContentSize.Y + 14) end)
				for l1ll11ll, l11l1l in next, self.sections do if l11l1l.canInit and # l11l1l.options > 0 then l11l1l:Init() end end
			end
			return L_876_
		end
	end
	function L_5_:AddTab(lllll11l1ll1, lll111l)
		local L_874_ = {
			canInit = true,
			hasInit = false,
			columns = {},
			subtabs = {},
			title = tostring(lllll11l1ll1)
		}
		table.insert(self.tabs, lll111l or # self.tabs + 1, L_874_)
		self:RegisterTabObject(L_874_)
		function L_874_:AddSubTab(name)
			local subtab = {
				title = tostring(name),
				columns = {},
				parent = self,
				canInit = true,
				hasInit = false
			}
			table.insert(self.subtabs, subtab)
			L_5_:RegisterTabObject(subtab)
			return subtab
		end
		return L_874_
	end;
function L_5_:AddWarning(ll111l)
	ll111l = typeof(ll111l) == "table" and ll111l or {}
	ll111l.text = tostring(ll111l.text)
	ll111l.type = ll111l.type == "confirm" and "confirm" or ""
	local L_915_;
	function ll111l:Show()
		L_915_ = nil;
		L_5_.warning = ll111l;
		if ll111l.main and ll111l.type == "" then
			return true
		end;
		if L_5_.popup then
			L_5_.popup:Close()
		end;
		if not ll111l.main then
			ll111l.main = L_5_:Create("TextButton", {
				ZIndex = 11,
				Size = UDim2.new(1, 400, 1, 400),
				Position = UDim2.new(0, -200, 0, -200),
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.new(0,0,0),
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				Parent = L_5_.main
			})
			local modal = L_5_:Create("Frame", {
				ZIndex = 12,
				Size = UDim2.new(0, 260, 0, 140),
				Position = UDim2.new(0.5, -130, 0.5, -70),
				BackgroundColor3 = Color3.fromRGB(15, 15, 15),
				BorderSizePixel = 0,
				Parent = ll111l.main
			})
			Instance.new("UICorner", modal).CornerRadius = UDim.new(0, 6)
			local stroke = Instance.new("UIStroke", modal)
			stroke.Color = Color3.fromRGB(30, 30, 30)
			ll111l.message = L_5_:Create("TextLabel", {
				ZIndex = 13,
				Position = UDim2.new(0, 15, 0, 15),
				Size = UDim2.new(1, -30, 0, 75),
				BackgroundTransparency = 1,
				TextSize = 14,
				Font = Enum.Font.SourceSansBold,
				TextColor3 = Color3.fromRGB(220, 220, 220),
				TextWrapped = true,
				RichText = true,
				TextYAlignment = Enum.TextYAlignment.Top,
				Parent = modal
			})
			if ll111l.type == "confirm" then
				local yesBtn = L_5_:Create("TextButton", {
					ZIndex = 13,
					Position = UDim2.new(0.12, 0, 1, -45),
					Size = UDim2.new(0, 85, 0, 25),
					BackgroundColor3 = Color3.fromRGB(22, 22, 22),
					Text = "Yes",
					TextSize = 14,
					Font = Enum.Font.SourceSansBold,
					TextColor3 = Color3.fromRGB(0, 200, 0),
					Parent = modal
				})
				Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 4)
				local ySt = Instance.new("UIStroke", yesBtn) ySt.Color = Color3.fromRGB(35,35,35)
				local noBtn = L_5_:Create("TextButton", {
					ZIndex = 13,
					Position = UDim2.new(0.54, 0, 1, -45),
					Size = UDim2.new(0, 85, 0, 25),
					BackgroundColor3 = Color3.fromRGB(22, 22, 22),
					Text = "No",
					TextSize = 14,
					Font = Enum.Font.SourceSansBold,
					TextColor3 = Color3.fromRGB(200, 200, 200),
					Parent = modal
				})
				Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 4)
				local nSt = Instance.new("UIStroke", noBtn) nSt.Color = Color3.fromRGB(35,35,35)
				yesBtn.MouseButton1Click:Connect(function() L_915_ = true end)
				noBtn.MouseButton1Click:Connect(function() L_915_ = false end)
			else
				local okBtn = L_5_:Create("TextButton", {
					ZIndex = 12,
					Position = UDim2.new(0.33, 0, 1, -35),
					Size = UDim2.new(0, 85, 0, 24),
					BackgroundColor3 = Color3.fromRGB(22, 22, 22),
					Text = "OK",
					TextSize = 14,
					Font = Enum.Font.SourceSansBold,
					TextColor3 = Color3.fromRGB(200, 200, 200),
					Parent = modal
				})
				Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 4)
				local oSt = Instance.new("UIStroke", okBtn) oSt.Color = Color3.fromRGB(35,35,35)
				okBtn.MouseButton1Click:Connect(function() L_915_ = true end)
			end
		end;
		ll111l.main.Visible = true;
		ll111l.message.Text = ll111l.text;
		L_915_ = nil;
		repeat
			wait()
		until L_915_ ~= nil;
		local res = L_915_
		spawn(ll111l.Close)
		L_5_.warning = nil;
		return res
	end;
	function ll111l:Close()
		L_915_ = nil;
		if not ll111l.main then
			return
		end;
		ll111l.main.Visible = false
	end;
	return ll111l
end;
function L_5_:Close()
	self.open = not self.open;
	if self.open then
		inputService.MouseIconEnabled = false
		inputService.MouseBehavior = Enum.MouseBehavior.Default
	else
		inputService.MouseIconEnabled = self.mousestate ~= nil and self.mousestate or true;
		if L_4_ and L_4_.mainFrame then L_4_.mainFrame.Visible = false end
	end;
	if self.mainFrame then
		if self.popup then
			self.popup:Close()
		end;
		self.mainFrame.Visible = self.open;
		if self.base then self.base.Enabled = self.open end
	end
	env._cursor_outer.Visible = self.open
	env._cursor_inner.Visible = self.open
end;
function L_5_:Init()
	if self.hasInit then
		return
	end;
	self.hasInit = true;
	self.base = L_5_:Create("ScreenGui", {
		IgnoreGuiInset = true
	})
	self.base.Parent = game:GetService"CoreGui"
	self.main = self:Create("ImageButton", {
		AutoButtonColor = false,
		Position = UDim2.new(0, 100, 0, 46),
		Size = UDim2.new(0, 500, 0, 700),
		BackgroundColor3 = Color3.fromRGB(12, 12, 12),
		BorderColor3 = Color3.new(),
		ScaleType = Enum.ScaleType.Tile,
		Modal = true,
		Visible = false,
		Parent = self.base
	})
	local L_922_ = self:Create("Frame", {
		Size = UDim2.new(1, 0, 0, 50),
		BackgroundColor3 = Color3.fromRGB(16, 16, 16),
		BorderColor3 = Color3.new(),
		Parent = self.main
	})
	self:Create("TextLabel", {
		Position = UDim2.new(0, 6, 0, -1),
		Size = UDim2.new(0, 0, 0, 20),
		BackgroundTransparency = 1,
		Text = tostring(self.title),
		Font = Enum.Font.Code,
		TextSize = 18,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = self.main
	})
	table.insert(L_5_.theme, self:Create("Frame", {
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 0, 24),
		BackgroundColor3 = library_flags["Menu Accent Color"],
		BorderSizePixel = 0,
		Parent = self.main
	}))
	L_5_:Create("ImageLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2454009026",
		ImageColor3 = Color3.new(),
		ImageTransparency = 0.4,
		Parent = L_922_
	})
	self.tabHighlight = self:Create("Frame", {
		BackgroundColor3 = library_flags["Menu Accent Color"],
		BorderSizePixel = 0,
		Parent = self.main
	})
	table.insert(L_5_.theme, self.tabHighlight)
	self.columnHolder = self:Create("Frame", {
		Position = UDim2.new(0, 5, 0, 55),
		Size = UDim2.new(1, -10, 1, -60),
		BackgroundTransparency = 1,
		Parent = self.main
	})
	self.tooltip = self:Create("TextLabel", {
		ZIndex = 2,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		TextSize = 15,
		Font = Enum.Font.Code,
		TextColor3 = Color3.new(1, 1, 1),
		Visible = true,
		Parent = self.base
	})
	self:Create("Frame", {
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		Size = UDim2.new(1, 10, 1, 0),
		Style = Enum.FrameStyle.RobloxRound,
		Parent = self.tooltip
	})
	self:Create("ImageLabel", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2592362371",
		ImageColor3 = Color3.fromRGB(60, 60, 60),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(2, 2, 62, 62),
		Parent = self.main
	})
	L_922_.InputBegan:connect(function(ll111lll11)
		if ll111lll11.UserInputType.Name == "MouseButton1" then
			L_10_ = self.main;
			L_6_ = true;
			L_8_ = ll111lll11.Position;
			L_9_ = L_10_.Position;
			if L_5_.popup then
				L_5_.popup:Close()
			end
		end
	end)
	L_922_.InputChanged:connect(function(ll11l1ll1lll)
		if L_6_ and ll11l1ll1lll.UserInputType.Name == "MouseMovement" then
			L_7_ = ll11l1ll1lll
		end
	end)
	L_922_.InputEnded:connect(function(l11ll111l111)
		if l11ll111l111.UserInputType.Name == "MouseButton1" then
			L_6_ = false
		end
	end)
function self:selectTab(ll111ll1l)
		if self.currentTab == ll111ll1l then return end;
		if L_5_.popup then L_5_.popup:Close() end;
		if self.currentTab then
			self.currentTab.button.TextColor3 = Color3.fromRGB(255, 255, 255)
			if self.currentTab.subtabHolder then self.currentTab.subtabHolder.Visible = false end
			for ll11l1, l1lll111l11l in next, self.currentTab.columns do l1lll111l11l.main.Visible = false end
			if self.currentTab.activeSubTab then
				for _, col in next, self.currentTab.activeSubTab.columns do col.main.Visible = false end
			end
		end;
		self.currentTab = ll111ll1l;
		ll111ll1l.button.TextColor3 = library_flags["Menu Accent Color"]
		self.tabHighlight:TweenPosition(UDim2.new(0, ll111ll1l.button.Position.X.Offset, 0, 50), "Out", "Quad", 0.2, true)
		self.tabHighlight:TweenSize(UDim2.new(0, ll111ll1l.button.AbsoluteSize.X, 0, -1), "Out", "Quad", 0.1, true)
		if #ll111ll1l.subtabs > 0 then
			ll111ll1l.subtabHolder.Visible = true
			if not ll111ll1l.activeSubTab then ll111ll1l:selectSubTab(ll111ll1l.subtabs[1])
			else
				local sub = ll111ll1l.activeSubTab
				self.main.Size = UDim2.new(0, 16 + (# sub.columns < 2 and 2 or # sub.columns) * 239, 0, 600)
				for _, col in next, sub.columns do if col.canInit then col:Init() col.main.Visible = true end end
			end
		else
			self.main.Size = UDim2.new(0, 16 + (# ll111ll1l.columns < 2 and 2 or # ll111ll1l.columns) * 239, 0, 600)
			for lllll1l1l1l1, llllll1111l1 in next, ll111ll1l.columns do if llllll1111l1.canInit then llllll1111l1:Init() llllll1111l1.main.Visible = true end end
		end
	end;
	for lllll11, ll111111l1l in next, self.tabs do
		if ll111111l1l.canInit then
			ll111111l1l:Init()
			self:selectTab(ll111111l1l)
		end
	end;
	self:AddConnection(inputService.InputEnded, function(lllllll1l)
		if lllllll1l.UserInputType.Name == "MouseButton1" and self.slider then
			self.slider.slider.BorderColor3 = Color3.new()
			self.slider = nil
		end
	end)
	self:AddConnection(inputService.InputChanged, function(llll1l1ll11l)
		if self.open then
			if llll1l1ll11l.UserInputType.Name == "MouseMovement" then
				if self.open then
					local mPos = inputService:GetMouseLocation()
					local p = Vector2.new(mPos.X, mPos.Y)
					env._cursor_outer.Position = p
					env._cursor_inner.Position = p
				end;
				if self.slider then
					local _mx = inputService:GetMouseLocation().X
					self.slider:SetValue(self.slider.min + (_mx - self.slider.slider.AbsolutePosition.X) / self.slider.slider.AbsoluteSize.X * (self.slider.max - self.slider.min))
				end
			end;
			if llll1l1ll11l == L_7_ and L_6_ and L_5_.draggable then
				local L_950_ = llll1l1ll11l.Position - L_8_;
				local L_951_ = L_9_.Y.Offset + L_950_.Y < -36 and -36 or L_9_.Y.Offset + L_950_.Y;
				L_10_:TweenPosition(UDim2.new(L_9_.X.Scale, L_9_.X.Offset + L_950_.X, L_9_.Y.Scale, L_951_), "Out", "Quint", 0.1, true)
			end
		end
	end)
	if not env.silent then
		delay(1, function()
			self:Close()
		end)
	end
end;
function hasProperty(l1ll111111l, ll1l1ll11)
	return pcall(function()
		_ = l1ll111111l[ll1l1ll11]
	end)
end;
L_22_ = {
	"HeadHB",
	"UpperTorso",
	"LowerTorso",
	"LeftUpperArm",
	"LeftLowerArm",
	"LeftHand",
	"RightUpperArm",
	"RightLowerArm",
	"RightHand",
	"LeftUpperLeg",
	"LeftLowerLeg",
	"LeftFoot",
	"RightUpperLeg",
	"RightLowerLeg",
	"RightFoot"
}
L_23_ = game:GetService("ReplicatedStorage").Events.DataEvent;
L_24_ = game:GetService("ReplicatedStorage")
L_25_ = game:GetService("UserInputService")
L_26_ = game:GetService("NetworkClient")
L_27_ = game:GetService("TweenService")
L_28_ = game:GetService("RunService")
L_29_ = game:GetService("Lighting")
L_30_ = game:GetService("Players")
L_31_ = game:GetService("Debris")
L_32_ = L_30_.LocalPlayer;
L_33_ = L_32_:GetMouse()
L_34_ = workspace.CurrentCamera;
L_35_ = L_32_.PlayerGui.Client;
L_36_ = getsenv(L_35_)
local L_37_, L_38_, L_39_ = false, false, false;
L_40_ = L_24_.Events.HitParl;
L_41_ = L_24_.Events.Vote;
L_42_ = L_24_.Events.DropMag;
L_43_ = Instance.new("Folder", workspace)
L_44_ = Instance.new("ColorCorrectionEffect", L_29_)
L_45_ = getsenv(L_32_.PlayerScripts.ControlScript.MasterControl)
L_46_ = Instance.new("Folder", L_34_)
L_47_ = {}
L_48_ = Vector3.new(0, 0, 0)
L_49_ = true;
L_50_ = false;
env.oldPositions = {}
L_51_ = {}
L_52_ = {}
L_53_ = false;
L_54_ = false;
L_55_ = 0;
L_56_ = {}
env.target = nil;
env.CB_SilentDebug = env.CB_SilentDebug or false;
env.hookWS = false;
env.hookJP = nil;
env.holdE = false;
L_57_ = {
	alive = false,
	melee = false,
	clientgun = nil,
	ammo = 0,
	name = "",
	sniper = false,
	silentAim = false,
	FOV = 0,
	silentFOV = 0,
	smoothness = 0,
	deadzone = 0,
	baim = false,
	mindmg = 0,
	hitboxes = {},
	hitchance = 100,
	closestHitbox = false,
	trigger = false,
	triggerDelay = 0,
	type = ""
}
L_58_ = 0;
local L_59_;
cbCHAMS = nil;
fonts = {
	UI = 0,
	System = 1,
	Plex = 2,
	Monospace = 3
}
_LightingSky = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
currentSky = _LightingSky or { 
	SkyboxBk = "", SkyboxDn = "", SkyboxFt = "", SkyboxLf = "", SkyboxRt = "", SkyboxUp = "" 
}
Skyboxes = {
	["Game's Sky"] = { 
		["SkyboxBk"] = currentSky.SkyboxBk,
		["SkyboxDn"] = currentSky.SkyboxDn,
		["SkyboxFt"] = currentSky.SkyboxFt,
		["SkyboxLf"] = currentSky.SkyboxLf,
		["SkyboxRt"] = currentSky.SkyboxRt,
		["SkyboxUp"] = currentSky.SkyboxUp
	},
	["Purple Nebula"] = { 
		["SkyboxBk"] = "rbxassetid://159454299",
		["SkyboxDn"] = "rbxassetid://159454296",
		["SkyboxFt"] = "rbxassetid://159454293",
		["SkyboxLf"] = "rbxassetid://159454286",
		["SkyboxRt"] = "rbxassetid://159454300",
		["SkyboxUp"] = "rbxassetid://159454288"
	},
	["Night Sky"] = {
		["SkyboxBk"] = "rbxassetid://12064107",
		["SkyboxDn"] = "rbxassetid://12064152",
		["SkyboxFt"] = "rbxassetid://12064121",
		["SkyboxLf"] = "rbxassetid://12063984",
		["SkyboxRt"] = "rbxassetid://12064115",
		["SkyboxUp"] = "rbxassetid://12064131"
	},
	["Pink Daylight"] = {
		["SkyboxBk"] = "rbxassetid://271042516",
		["SkyboxDn"] = "rbxassetid://271077243",
		["SkyboxFt"] = "rbxassetid://271042556",
		["SkyboxLf"] = "rbxassetid://271042310",
		["SkyboxRt"] = "rbxassetid://271042467",
		["SkyboxUp"] = "rbxassetid://271077958"
	},
	["Morning Glow"] = {
		["SkyboxBk"] = "rbxassetid://1417494030",
		["SkyboxDn"] = "rbxassetid://1417494146",
		["SkyboxFt"] = "rbxassetid://1417494253",
		["SkyboxLf"] = "rbxassetid://1417494402",
		["SkyboxRt"] = "rbxassetid://1417494499",
		["SkyboxUp"] = "rbxassetid://1417494643"
	},
	["Setting Sun"] = {
		["SkyboxBk"] = "rbxassetid://626460377",
		["SkyboxDn"] = "rbxassetid://626460216",
		["SkyboxFt"] = "rbxassetid://626460513",
		["SkyboxLf"] = "rbxassetid://626473032",
		["SkyboxRt"] = "rbxassetid://626458639",
		["SkyboxUp"] = "rbxassetid://626460625"
	},
	["Fade Blue"] = {
		["SkyboxBk"] = "rbxassetid://153695414",
		["SkyboxDn"] = "rbxassetid://153695352",
		["SkyboxFt"] = "rbxassetid://153695452",
		["SkyboxLf"] = "rbxassetid://153695320",
		["SkyboxRt"] = "rbxassetid://153695383",
		["SkyboxUp"] = "rbxassetid://153695471"
	},
	["Elegant Morning"] = {
		["SkyboxBk"] = "rbxassetid://153767241",
		["SkyboxDn"] = "rbxassetid://153767216",
		["SkyboxFt"] = "rbxassetid://153767266",
		["SkyboxLf"] = "rbxassetid://153767200",
		["SkyboxRt"] = "rbxassetid://153767231",
		["SkyboxUp"] = "rbxassetid://153767288"
	},
	["Neptune"] = {
		["SkyboxBk"] = "rbxassetid://218955819",
		["SkyboxDn"] = "rbxassetid://218953419",
		["SkyboxFt"] = "rbxassetid://218954524",
		["SkyboxLf"] = "rbxassetid://218958493",
		["SkyboxRt"] = "rbxassetid://218957134",
		["SkyboxUp"] = "rbxassetid://218950090"
	},
	["Redshift"] = {
		["SkyboxBk"] = "rbxassetid://401664839",
		["SkyboxDn"] = "rbxassetid://401664862",
		["SkyboxFt"] = "rbxassetid://401664960",
		["SkyboxLf"] = "rbxassetid://401664881",
		["SkyboxRt"] = "rbxassetid://401664901",
		["SkyboxUp"] = "rbxassetid://401664936"
	},
	["Aesthetic Night"] = { 
		["SkyboxBk"] = "rbxassetid://1045964490",
		["SkyboxDn"] = "rbxassetid://1045964368",
		["SkyboxFt"] = "rbxassetid://1045964655",
		["SkyboxLf"] = "rbxassetid://1045964655",
		["SkyboxRt"] = "rbxassetid://1045964655",
		["SkyboxUp"] = "rbxassetid://1045962969"
	},
	["Gloomy Gray"] = {
		["SkyboxBk"] = "rbxassetid://4495864450",
		["SkyboxDn"] = "rbxassetid://4495864887",
		["SkyboxFt"] = "rbxassetid://4495865458",
		["SkyboxLf"] = "rbxassetid://4495866035",
		["SkyboxRt"] = "rbxassetid://4495866584",
		["SkyboxUp"] = "rbxassetid://4495867486"
	},
	["Light Within Dark"] = {
		["SkyboxBk"] = "rbxassetid://15502511288",
		["SkyboxDn"] = "rbxassetid://15502508460",
		["SkyboxFt"] = "rbxassetid://15502510289",
		["SkyboxLf"] = "rbxassetid://15502507918",
		["SkyboxRt"] = "rbxassetid://15502509398",
		["SkyboxUp"] = "rbxassetid://15502511911"
	},
	["Green Space"] = {
		["SkyboxBk"] = "rbxassetid://16823270864",
		["SkyboxDn"] = "rbxassetid://16823272150",
		["SkyboxFt"] = "rbxassetid://16823273508",
		["SkyboxLf"] = "rbxassetid://16823274898",
		["SkyboxRt"] = "rbxassetid://16823276281",
		["SkyboxUp"] = "rbxassetid://16823277547"
	},
	["The Winter"] = {
		["SkyboxBk"] = "rbxassetid://7307273436",
		["SkyboxDn"] = "rbxassetid://7307275898",
		["SkyboxFt"] = "rbxassetid://7307282434",
		["SkyboxLf"] = "rbxassetid://7307284944",
		["SkyboxRt"] = "rbxassetid://7307287254",
		["SkyboxUp"] = "rbxassetid://7307290025"
	},
	["Oblivion"] = {
		["SkyboxBk"] = "rbxassetid://16642312709",
		["SkyboxDn"] = "rbxassetid://16642313526",
		["SkyboxFt"] = "rbxassetid://16642314757",
		["SkyboxLf"] = "rbxassetid://16642315809",
		["SkyboxRt"] = "rbxassetid://16642317038",
		["SkyboxUp"] = "rbxassetid://16642318139"
	},
	["Final Bloodmoon"] = {
		["SkyboxBk"] = "rbxassetid://15493709538",
		["SkyboxDn"] = "rbxassetid://15493710499",
		["SkyboxFt"] = "rbxassetid://15493711616",
		["SkyboxLf"] = "rbxassetid://15493712720",
		["SkyboxRt"] = "rbxassetid://15493713902",
		["SkyboxUp"] = "rbxassetid://15493714708"
	},
	["Clouds"] = {
		["SkyboxBk"] = "rbxassetid://570557514",
		["SkyboxDn"] = "rbxassetid://570557775",
		["SkyboxFt"] = "rbxassetid://570557559",
		["SkyboxLf"] = "rbxassetid://570557620",
		["SkyboxRt"] = "rbxassetid://570557672",
		["SkyboxUp"] = "rbxassetid://570557727"
	},
	["Twilight"] = {
		["SkyboxBk"] = "rbxassetid://264908339",
		["SkyboxDn"] = "rbxassetid://264907909",
		["SkyboxFt"] = "rbxassetid://264909420",
		["SkyboxLf"] = "rbxassetid://264909758",
		["SkyboxRt"] = "rbxassetid://264908886",
		["SkyboxUp"] = "rbxassetid://264907379"
	},
	["Red Mountain"] = {
		["SkyboxBk"] = "rbxassetid://6636457509",
		["SkyboxDn"] = "rbxassetid://6636457509",
		["SkyboxFt"] = "rbxassetid://6636457509",
		["SkyboxLf"] = "rbxassetid://6636457509",
		["SkyboxRt"] = "rbxassetid://6636457509",
		["SkyboxUp"] = "rbxassetid://6636457509"
	},
	["Cloudy Skies"] = {
		["SkyboxBk"] = "rbxassetid://252760981",
		["SkyboxDn"] = "rbxassetid://252763035",
		["SkyboxFt"] = "rbxassetid://252761439",
		["SkyboxLf"] = "rbxassetid://252760980",
		["SkyboxRt"] = "rbxassetid://252762652",
		["SkyboxUp"] = "rbxassetid://252762652"
	},
	["Dark Blue"] = {
		["SkyboxBk"] = "rbxassetid://30306692",
		["SkyboxDn"] = "rbxassetid://25901058",
		["SkyboxFt"] = "rbxassetid://30306730",
		["SkyboxLf"] = "rbxassetid://30306626",
		["SkyboxRt"] = "rbxassetid://30306665",
		["SkyboxUp"] = "rbxassetid://30306603"
	},
	["Minecraft"] = {
		["SkyboxBk"] = "rbxassetid://3822390508",
		["SkyboxDn"] = "rbxassetid://3822392871",
		["SkyboxFt"] = "rbxassetid://3822391392",
		["SkyboxLf"] = "rbxassetid://3822391866",
		["SkyboxRt"] = "rbxassetid://3822390968",
		["SkyboxUp"] = "rbxassetid://3822392413"
	},
	["Vaporwave"] = {
		["SkyboxBk"] = "rbxassetid://1417494030",
		["SkyboxDn"] = "rbxassetid://1417494146",
		["SkyboxFt"] = "rbxassetid://1417494253",
		["SkyboxLf"] = "rbxassetid://1417494402",
		["SkyboxRt"] = "rbxassetid://1417494499",
		["SkyboxUp"] = "rbxassetid://1417494643"
	},
	["Space"] = {
		["SkyboxBk"] = "rbxassetid://149397692",
		["SkyboxDn"] = "rbxassetid://149397686",
		["SkyboxFt"] = "rbxassetid://149397697",
		["SkyboxLf"] = "rbxassetid://149397684",
		["SkyboxRt"] = "rbxassetid://149397688",
		["SkyboxUp"] = "rbxassetid://149397702"
	},
	["Pink Vision"] = {
		["SkyboxBk"] = "rbxassetid://6593929026",
		["SkyboxDn"] = "rbxassetid://6593930140",
		["SkyboxFt"] = "rbxassetid://6593931249",
		["SkyboxLf"] = "rbxassetid://6593932587",
		["SkyboxRt"] = "rbxassetid://6593933789",
		["SkyboxUp"] = "rbxassetid://6593935319"
	},
	["Anime Sky"] = {
		["SkyboxBk"] = "rbxassetid://6598038571",
		["SkyboxDn"] = "rbxassetid://6598060864",
		["SkyboxFt"] = "rbxassetid://6598069162",
		["SkyboxLf"] = "rbxassetid://6598081281",
		["SkyboxRt"] = "rbxassetid://6598083861",
		["SkyboxUp"] = "rbxassetid://6598088065"
	},
	["Alien Red"] = {
		["SkyboxBk"] = "rbxassetid://1012890",
		["SkyboxDn"] = "rbxassetid://1012891",
		["SkyboxFt"] = "rbxassetid://1012887",
		["SkyboxLf"] = "rbxassetid://1012889",
		["SkyboxRt"] = "rbxassetid://1012888",
		["SkyboxUp"] = "rbxassetid://1014449"
	},
	["CS City"] = {
		["SkyboxBk"] = "rbxassetid://2240134413",
		["SkyboxDn"] = "rbxassetid://2240136039",
		["SkyboxFt"] = "rbxassetid://2240130790",
		["SkyboxLf"] = "rbxassetid://2240133550",
		["SkyboxRt"] = "rbxassetid://2240132643",
		["SkyboxUp"] = "rbxassetid://2240135222"
	},
	["Dark City"] = {
		["SkyboxBk"] = "rbxassetid://1424486234",
		["SkyboxDn"] = "rbxassetid://1424485998",
		["SkyboxFt"] = "rbxassetid://1424485697",
		["SkyboxLf"] = "rbxassetid://1424484951",
		["SkyboxRt"] = "rbxassetid://1424484760",
		["SkyboxUp"] = "rbxassetid://1424484510"
	},
	["Earth"] = {
		["SkyboxBk"] = "rbxassetid://166509999",
		["SkyboxDn"] = "rbxassetid://166510057",
		["SkyboxFt"] = "rbxassetid://166510116",
		["SkyboxLf"] = "rbxassetid://166510092",
		["SkyboxRt"] = "rbxassetid://166510131",
		["SkyboxUp"] = "rbxassetid://166510114"
	},
	["Mountains"] = {
		["SkyboxBk"] = "rbxassetid://368385273",
		["SkyboxDn"] = "rbxassetid://48015300",
		["SkyboxFt"] = "rbxassetid://368388290",
		["SkyboxLf"] = "rbxassetid://368390615",
		["SkyboxRt"] = "rbxassetid://368385190",
		["SkyboxUp"] = "rbxassetid://48015387"
	},
	["Old Skybox"] = {
		["SkyboxBk"] = "rbxassetid://15436783",
		["SkyboxDn"] = "rbxassetid://15436796",
		["SkyboxFt"] = "rbxassetid://15436831",
		["SkyboxLf"] = "rbxassetid://15437157",
		["SkyboxRt"] = "rbxassetid://15437166",
		["SkyboxUp"] = "rbxassetid://15437184"
	},
	["Red Sky"] = {
		["SkyboxBk"] = "rbxassetid://401664839",
		["SkyboxDn"] = "rbxassetid://401664862",
		["SkyboxFt"] = "rbxassetid://401664960",
		["SkyboxLf"] = "rbxassetid://401664881",
		["SkyboxRt"] = "rbxassetid://401664901",
		["SkyboxUp"] = "rbxassetid://401664936"
	},
	["Stormy Sky"] = {
		["SkyboxBk"] = "rbxassetid://1327366",
		["SkyboxDn"] = "rbxassetid://1327367",
		["SkyboxFt"] = "rbxassetid://1327362",
		["SkyboxLf"] = "rbxassetid://1327363",
		["SkyboxRt"] = "rbxassetid://1327361",
		["SkyboxUp"] = "rbxassetid://1327368"
	},
	["Wasteland"] = {
		["SkyboxBk"] = "rbxassetid://2046134302",
		["SkyboxDn"] = "rbxassetid://2046134976",
		["SkyboxFt"] = "rbxassetid://2046135977",
		["SkyboxLf"] = "rbxassetid://2046135392",
		["SkyboxRt"] = "rbxassetid://2046136939",
		["SkyboxUp"] = "rbxassetid://2046136551"
	},
	["Blue Sky"] = {
		["SkyboxBk"] = "rbxassetid://226060119",
		["SkyboxDn"] = "rbxassetid://226060115",
		["SkyboxFt"] = "rbxassetid://226060143",
		["SkyboxLf"] = "rbxassetid://226060136",
		["SkyboxRt"] = "rbxassetid://226060155",
		["SkyboxUp"] = "rbxassetid://226060167"
	},
	["Green Sky"] = {
		["SkyboxBk"] = "rbxassetid://157711514",
		["SkyboxDn"] = "rbxassetid://157711501",
		["SkyboxFt"] = "rbxassetid://157711522",
		["SkyboxLf"] = "rbxassetid://157711494",
		["SkyboxRt"] = "rbxassetid://157711509",
		["SkyboxUp"] = "rbxassetid://157711528"
	}
}
L_60_ = {
	SmoothPlastic = "",
	ForceField = "4573037993"
}
hitSounds = {
	Bameware = "rbxassetid://3124331820",
	Bell = "rbxassetid://6534947240",
	Bubble = "rbxassetid://6534947588",
	Pick = "rbxassetid://1347140027",
	Pop = "rbxassetid://198598793",
	Rust = "rbxassetid://1255040462",
	Sans = "rbxassetid://3188795283",
	Fart = "rbxassetid://130833677",
	Big = "rbxassetid://5332005053",
	Vine = "rbxassetid://5332680810",
	Bruh = "rbxassetid://4578740568",
	Skeet = "rbxassetid://5633695679",
	Neverlose = "rbxassetid://6534948092",
	Fatality = "rbxassetid://6534947869",
	Bonk = "rbxassetid://5766898159",
	Minecraft = "rbxassetid://4018616850",
	Moan = {
		"rbxassetid://2440888376",
		"rbxassetid://2440889605",
		"rbxassetid://2440889869",
		"rbxassetid://2440889381",
		"rbxassetid://2440891382"
	}
}
L_33_.TargetFilter = L_34_;
indicatorHolder = Instance.new("ScreenGui", game.CoreGui)
leftIndicator = Instance.new("TextLabel", indicatorHolder)
rightIndicator = Instance.new("TextLabel", indicatorHolder)
indicatorHolder.Enabled = false;
leftIndicator.BackgroundTransparency = 1;
leftIndicator.Size = UDim2.new(0.4, 0, 0, 0)
leftIndicator.Position = UDim2.new(0, 0, 0.5, 0)
leftIndicator.TextXAlignment = "Right"
leftIndicator.TextColor3 = Color3.new(1, 1, 1)
leftIndicator.Text = "<"
leftIndicator.TextSize = 40;
leftIndicator.TextTransparency = 0.5;
leftIndicator.Font = "Bodoni"
rightIndicator.BackgroundTransparency = 1;
rightIndicator.Size = UDim2.new(0.6, 0, 0, 0)
rightIndicator.Position = UDim2.new(0, 0, 0.5, 0)
rightIndicator.TextXAlignment = "Right"
rightIndicator.TextColor3 = Color3.new(1, 1, 1)
rightIndicator.Text = ">"
rightIndicator.TextSize = 40;
rightIndicator.Font = "Bodoni"
rightIndicator.TextTransparency = 0.5;
local success, result = pcall(function() return game:GetObjects("rbxassetid://6219220506")[1] end)
if success and result then
    L_4_ = result
else
    warn("Failed to load asset 6219220506")
    L_4_ = Instance.new("ScreenGui")
    local dummyFrame = Instance.new("Frame", L_4_)
    dummyFrame.Name = "mainFrame"
    dummyFrame.Visible = false
end
L_4_.Parent = game.CoreGui;
L_4_.mainFrame.Visible = false;
L_4_.mainFrame.ZIndex = 100;
onHit = Instance.new("BindableEvent", workspace)
onHit.Name = "onHit"
onKill = Instance.new("BindableEvent", workspace)
onKill.Name = "onKill"
L_61_ = -3846999;
L_62_ = 8532252;
L_63_ = -1162714;
L_64_ = 52;
L_65_ = 4;
L_66_ = 82;
function encodePos(l111ll)
	local L_955_, L_956_, L_957_ = l111ll.X * L_64_, l111ll.Y * L_65_, l111ll.Z * L_66_;
	return Vector3.new(L_61_ + L_955_, L_62_ + L_956_, L_63_ + L_957_)
end;
function decodePos(lll1lll)
	local L_959_, L_960_, L_961_ = lll1lll.X - L_61_, lll1lll.Y - L_62_, lll1lll.Z - L_63_;
	return Vector3.new(L_959_ / L_64_, L_960_ / L_65_, L_961_ / L_66_)
end;
env.encodePos = encodePos;
env.decodePos = decodePos;
function addSkin(llll11l1l, lll1ll1l1, l1llll1llll, ll11l1111ll1, l1llllll1l1l)
	local L_967_, L_968_ = pcall(function()
		local L_969_ = {}
		for lllll111l, llll1ll11l1 in next, l1llll1llll do
			if llll1ll11l1:match("^%w+://([^/]+)") then
				local L_982_ = request({
					Url = llll1ll11l1,
					Method = "GET"
				})
				if L_982_.Success then
					table.insert(L_969_, lllll111l)
				end
			end
		end;
		local L_970_ = false;
		if ll11l1111ll1:match("^%w+://([^/]+)") then
			local L_984_ = request({
				Url = ll11l1111ll1,
				Method = "GET"
			})
			if L_984_.Success then
				L_970_ = true
			end
		end;
		local L_971_ = llll11l1l .. "_" .. lll1ll1l1;
		local L_972_ = string.split(L_971_, "_")[2]
		local L_973_ = string.split(L_971_, "_")[1]
		if not L_970_ then
			ll11l1111ll1 = ll11l1111ll1 and "rbxassetid://" .. tostring(ll11l1111ll1) or "rbxassetid://1541381206"
		end;
		local L_974_ = nil;
		if l1llllll1l1l == "Glove" then
			L_974_ = "Knife"
		else
			L_974_ = l1llllll1l1l or "Red"
		end;
		local L_975_ = Instance.new("StringValue")
		L_975_.Name = L_972_;
		local L_976_ = Instance.new("StringValue")
		L_976_.Name = L_971_;
		local L_977_ = Instance.new("StringValue")
		L_977_.Name = L_972_;
		L_977_.Value = ll11l1111ll1;
		pcall(function()
			L_977_.Parent = game.Players.LocalPlayer.PlayerGui.Client.Images[L_973_]
		end)
		local L_978_ = Instance.new("StringValue")
		L_978_.Name = L_972_;
		L_978_.Name = "Quality"
		L_978_.Value = L_974_;
		L_978_.Parent = L_977_;
		local L_979_ = Instance.new("StringValue")
		L_979_.Name = L_971_;
		L_979_.Value = L_974_;
		pcall(function()
			L_979_.Parent = game.Players.LocalPlayer.PlayerGui.Client.Rarities;
		end)
		if l1llllll1l1l == "Glove" then
			local gloveChildren = L_24_.Gloves[L_973_]:GetChildren()
			local template = gloveChildren[1]
			if not template then
				for _, otherGlove in L_24_.Gloves:GetChildren() do
					if #otherGlove:GetChildren() > 0 then
						template = otherGlove:GetChildren()[1]
						break
					end
				end
			end
			local L_986_ = template:Clone()
			L_986_.Textures.TextureId = "rbxassetid://" .. l1llll1llll.Main;
			L_986_.Name = L_972_;
			L_986_.Parent = L_24_.Gloves[L_973_]
		else
			local L_987_ = game.ReplicatedStorage.Skins[L_973_]:GetChildren()[1]:Clone()
			L_987_.Name = L_972_;
			L_987_.Parent = game.ReplicatedStorage.Skins[L_973_]
			for l1lll1111l1l, l1l111 in next, L_987_:GetChildren() do
				if l1l111.ClassName ~= "Folder" then
					local vname = l1l111.Name
					local L_990_ = table.find(L_969_, vname) and "" or "rbxassetid://"
					if l1llll1llll[vname] then
						l1l111.Value = L_990_ .. l1llll1llll[vname]
					elseif l1llll1llll.Main then
						L_990_ = table.find(L_969_, "Main") and "" or "rbxassetid://"
						l1l111.Value = L_990_ .. l1llll1llll.Main
					end
				end
			end
			for reqPart, reqId in l1llll1llll do
				if reqPart ~= "Main" and not L_987_:FindFirstChild(reqPart) then
					local nv = Instance.new("StringValue")
					nv.Name = reqPart
					local L_990_ = table.find(L_969_, reqPart) and "" or "rbxassetid://"
					nv.Value = L_990_ .. reqId
					nv.Parent = L_987_
				end
			end
		end
	end)
	if not L_967_ then
		warn(L_968_)
	end
end;
function chat(lll1ll1ll11)
	L_24_.Events.PlayerChatted:FireServer(lll1ll1ll11, false, false, true)
end;
function alive(llll1l111l)
	if llll1l111l == nil then
		llll1l111l = L_32_
	end;
	if llll1l111l.Character and llll1l111l:FindFirstChild("Ragdoll") and llll1l111l.Character.PrimaryPart and llll1l111l.Character:FindFirstChild("UpperTorso") and llll1l111l.Character:FindFirstChild("Head") and llll1l111l.Character:FindFirstChild("EquippedTool") and llll1l111l.Character:FindFirstChild("HumanoidRootPart") and llll1l111l.Character:FindFirstChild("Humanoid") and llll1l111l.Character.Humanoid.Health > 0 then
		return true
	end;
	return false
end;
function updateViewModelVisuals()
	local L_997_;
	if L_34_:FindFirstChild("Arms") then
		L_997_ = L_34_.Arms
	end;
	if L_997_ and L_997_.Name == "Arms" then
		for llll11l1, ll1111l1l111 in next, L_997_:GetChildren() do
			if library_flags["Weapon Chams"] then
				if ll1111l1l111:IsA"MeshPart" or ll1111l1l111.Name == "Part" then
					if ll1111l1l111.Name == "StatClock" then
						ll1111l1l111:ClearAllChildren()
					end;
					ll1111l1l111.Color = library_flags["weaponColor"]
					ll1111l1l111.Transparency = 1 - L_5_.options["weaponColor"].trans;
					ll1111l1l111.Material = library_flags["weaponMaterial"]
					if hasProperty(ll1111l1l111, "TextureID") then
						ll1111l1l111.TextureID = ""
					end;
					if hasProperty(ll1111l1l111, "Reflectance") then
						ll1111l1l111.Reflectance = library_flags["weaponReflectance"] / 50
					end;
					if ll1111l1l111:FindFirstChild("SurfaceAppearance") then
						ll1111l1l111.SurfaceAppearance:Destroy()
					end
				end;
				local L_1000_ = false;
				for l1l11l11ll1l, ll1l111ll in next, L_34_.Arms:GetChildren() do
					if string.find(ll1l111ll.Name, 'Knife') or ll1l111ll.Name == "Handle2" or ll1l111ll.Name == "Blade" then
						L_1000_ = true
					end
				end;
				if L_1000_ then
					if L_34_.Arms:FindFirstChild("Handle") then
						L_34_.Arms.Handle.Transparency = 1
					end
				end;
				pcall(function()
					if L_34_.Arms:FindFirstChild("Silencer2") and workspace:FindFirstChild("Map") then
						if workspace.Map.SpawnPoints:FindFirstChild("BuyArea") then
							L_34_.Arms.Silencer2.Welded.Part0 = workspace.Map.SpawnPoints.BuyArea
						end
					end
				end)
			end;
			if ll1111l1l111:IsA"Model" then
                local descendants = L_997_:GetDescendants()
				if env.ApplySleeveChangerToCurrent then
					pcall(env.ApplySleeveChangerToCurrent)
				end
				for ll1lll, llll1ll in next, descendants do
					if llll1ll.Name == "Sleeve" or llll1ll.Name == "Glove" then
                        if library_flags["Remove Sleeves"] and llll1ll.Name == "Sleeve" and llll1ll:GetAttribute("Applied") == nil then
    						llll1ll:Destroy()
                        end
						if llll1ll.Name == "Sleeve" then
							local motor = llll1ll:FindFirstChild("SleeveMotor")
							if motor then
								local sx = (library_flags["skinSleeveX"] or 0) / 10
								local sy = (library_flags["skinSleeveY"] or 0) / 10
								local sz = (library_flags["skinSleeveZ"] or 0) / 10
								if not library_flags["skinSleeveChangerToggle"] then
									sx, sy, sz = 0, 0, 0
								end
								local origC1 = motor:GetAttribute("OrigC1")
								if not origC1 then
									origC1 = motor.C1
									motor:SetAttribute("OrigC1", origC1)
								end
								motor.C1 = origC1 * CFrame.new(sx, sy, -sz):Inverse()
							end
						end
					end;
					if library_flags["Arm Chams"] then
						if hasProperty(llll1ll, "CastShadow") then
							llll1ll.CastShadow = false
						end;
						local L_1005_ = library_flags["armMaterial"]
						if llll1ll:IsA"SpecialMesh" then
							if L_1005_ == "ForceField" then
								llll1ll.TextureId = L_60_[L_1005_]
							else
								llll1ll.TextureId = ""
							end;
							local L_1006_ = library_flags["armColor"]
							llll1ll.VertexColor = Vector3.new(L_1006_.R, L_1006_.G, L_1006_.B)
						end;
						if llll1ll:IsA"Part" then
							llll1ll.Material = L_1005_;
							llll1ll.Color = library_flags["armColor"]
							if llll1ll.Transparency == 1 then
								continue;
							end;
							llll1ll.Transparency = 1.01 - L_5_.options["armColor"].trans
						end
					end
				end
			end
		end
	end
end;
L_67_ = {
	{
		"",
		"DualBerettas",
		"",
		"",
		"Deagle/R8"
	},
	{},
	{},
	{
		"",
		"AK47/M4",
		"Scout",
		"",
		"AWP",
		"Autosniper"
	},
	{
		"Kevlar Vest",
		"Kevlar + Helmet",
		""
	},
	{
		"Fire Grenade",
		"Decoy Grenade",
		"Flashbang",
		"HE Grenade",
		"Smoke Grenade"
	}
}
function buyWeapon(ll11111llll)
	if ll11111llll == "None" then
		return
	end;
	wait(0.15)
	CreateThread(function()
		L_36_.createNotification2("Purchasing " .. ll11111llll .. "...")
	end)
	L_36_.Buymenuframe.Visible = true;
	L_36_.BuyMenuOpen = true;
	for l1l1ll1111l, l1l1ll1 in L_67_ do
		if table.find(l1l1ll1, ll11111llll) then
			L_36_.Click(l1l1ll1111l)
			wait()
			for l1l1lll1l1, l1llllll1l11 in next, l1l1ll1 do
				if l1llllll1l11 == ll11111llll then
					L_36_.Click(l1l1lll1l1)
					wait()
					L_36_.Back(l1l1lll1l1)
				end
			end
		end
	end
end;
function draggable(l11ll11l)
	local L_1013_ = game:GetService("UserInputService")
	local L_1014_;
	local L_1015_;
	local L_1016_;
	local L_1017_;
local function l1lll1(ll11ll1l111)
		if not scrollon then
			local L_1020_ = ll11ll1l111.Position - L_1016_;
			l11ll11l.Position = UDim2.new(L_1017_.X.Scale, L_1017_.X.Offset + L_1020_.X, L_1017_.Y.Scale, L_1017_.Y.Offset + L_1020_.Y)
		end
	end;
	l11ll11l.InputBegan:Connect(function(l1ll111111)
		if l1ll111111.UserInputType == Enum.UserInputType.MouseButton1 or l1ll111111.UserInputType == Enum.UserInputType.Touch then
			L_1014_ = true;
			L_1016_ = l1ll111111.Position;
			L_1017_ = l11ll11l.Position;
			l1ll111111.Changed:Connect(function()
				if l1ll111111.UserInputState == Enum.UserInputState.End then
					L_1014_ = false
					if l11ll11l.Name and l11ll11l.Name ~= "Frame" then
						library_flags["ui_pos_" .. l11ll11l.Name] = tostring(l11ll11l.Position.X.Scale)..","..tostring(l11ll11l.Position.X.Offset)..","..tostring(l11ll11l.Position.Y.Scale)..","..tostring(l11ll11l.Position.Y.Offset)
					end
				end
			end)
		end
	end)
	l11ll11l.InputChanged:Connect(function(l1l1l1)
		if l1l1l1.UserInputType == Enum.UserInputType.MouseMovement or l1l1l1.UserInputType == Enum.UserInputType.Touch then
			L_1015_ = l1l1l1
		end
	end)
	L_1013_.InputChanged:Connect(function(llll1l)
		if llll1l == L_1015_ and L_1014_ then
			l1lll1(llll1l)
		end
	end)
end;
function returntime(l1lll11)
	return os.date("*t", os.time())[l1lll11]
end;
L_68_ = {
	DiamondPlate = 3,
	CorrodedMetal = 2,
	Metal = 2,
	Concrete = 2,
	Brick = 2,
	WoodPlanks = 0.1,
	Wood = 0.1,
	nowallbang = 100,
	Grate = 0.1,
	Glass = 0.1,
	Cardboard = 0.1
}
env.damagemod = 1;
function wallbangCheck(l1lll1)
	return l1lll1 and l1lll1.Parent and l1lll1.Parent.Name == "Hitboxes" or l1lll1 and l1lll1.Parent and l1lll1.Parent.Parent and l1lll1.Parent.Parent:FindFirstChild("Humanoid") or l1lll1 and l1lll1.Parent and l1lll1.Parent:FindFirstChild("Humanoid") or l1lll1 and l1lll1.Parent and l1lll1.Parent:FindFirstChild("Humanoid") and (1 > l1lll1.Transparency or l1lll1.Name == "HeadHB") and l1lll1.Parent:IsA("Model")
end;
L_69_ = false;
L_70_ = Instance.new("Part")
L_70_.Size = Vector3.new(0.75, 0.75, 0.75)
L_70_.Anchored = true;
L_70_.Material = "Neon"
L_70_.Color = Color3.new(0.85, 0.25, 0.75)
L_70_.Transparency = 1;
L_70_.Name = "jigpart"
function calculateWallbang(lll111, l1l1111, llllll1llll)
	local L_1029_ = L_36_.gun;
	if type(L_1029_) == "string" or not L_1029_ or not L_1029_:FindFirstChild("Penetration") or L_1029_:FindFirstChild("Melee") or not lll111:FindFirstChild(l1l1111) then
		return 0, 0
	end;
	if not workspace:FindFirstChild("Map") then
		return 0, 0
	end;
	L_69_ = not L_69_;
	if llllll1llll and L_69_ then
		local L_1042_ = L_70_:Clone()
		L_1042_.CFrame = lll111[l1l1111].CFrame + lll111[l1l1111].Velocity * library_flags["predictAmount"] / 400;
		L_1042_.Parent = lll111;
		l1l1111 = "jigpart"
	end;
	local L_1030_ = lll111[l1l1111]
	local L_1031_ = library_flags["From Camera"] and L_34_.CFrame.p or Vector3.new(L_32_.Character.PrimaryPart.Position.X, L_32_.Character.Head.Position.Y, L_32_.Character.PrimaryPart.Position.Z)
	local L_1032_ = CFrame.new(L_1031_, L_1030_.Position).lookVector.unit * 4096 * 0.0694;
	local L_1033_ = Ray.new(L_1031_, L_1032_)
	local L_1034_ = L_1029_.Penetration.Value * 0.013 or 0;
	local L_1035_ = {
		L_34_,
		L_32_.Character,
		workspace.Debris,
		workspace.Ray_Ignore,
		workspace.Map.Clips,
		workspace.Map.SpawnPoints
	}
	local L_1036_ = {}
	local L_1037_ = nil;
	local L_1038_ = 1;
	local L_1039_ = 0;
	local L_1040_ = 0;
	local L_1041_ = 0;
	repeat
		L_1041_ = L_1041_ + 1;
		L_1037_, pos = workspace:FindPartOnRayWithIgnoreList(L_1033_, L_1035_, false, true)
		if L_1037_ and L_1037_ ~= L_1030_ or L_1037_ and L_1037_.Parent and L_1037_ ~= L_1030_ then
			if not L_1037_:IsDescendantOf(lll111) and not string.find(L_1037_.Name, "Head") then
				local L_1043_ = 1;
				local L_1044_ = tostring(L_1037_.Material)
				local L_1045_ = string.sub(tostring(L_1037_.Material), 15, # L_1044_)
				local L_1046_ = L_68_[L_1037_.Name]
				local L_1047_ = L_68_[L_1045_]
				local L_1048_ = 2 - library_flags["awallMod"] == 0 and 0.1 or 2 - library_flags["awallMod"]
				L_1043_ = (L_1046_ or L_1047_ or 1) * L_1048_;
				if string.find(L_1037_.Name, "Hat") or string.find(L_1037_.Parent.Name, "Hat") then
					L_1043_ = 0
				end;
				local L_1049_, L_1050_ = workspace:FindPartOnRayWithWhitelist(Ray.new(pos + L_1032_ * 1, L_1032_ * -2), {
					L_1037_
				}, true)
				local L_1051_ = (L_1050_ - pos).magnitude;
				local L_1052_ = L_1051_ * L_1043_;
				L_1040_ = math.min(L_1034_, L_1040_ + L_1052_)
				L_1038_ = 1 - L_1040_ / L_1034_;
				if L_1043_ > 0 then
					L_1039_ = L_1039_ + 1
				end;
				table.insert(L_1036_, L_1037_)
				if wallbangCheck(L_1037_) then
					table.insert(L_1035_, L_1037_.Parent)
				else
					table.insert(L_1035_, L_1037_)
				end
			end
		end
	until L_1037_ == nil or L_1037_ == L_1030_ or L_1037_:IsDescendantOf(lll111) or L_1039_ >= 4 or L_1040_ >= L_1034_ or L_1041_ > 20 or L_1037_.Name == "jigpart" or string.find(L_1037_.Name, "Head")
	if L_1039_ >= 4 or L_1041_ >= 20 then
		L_1038_ = 0
	end;
	if llllll1llll and L_69_ then
		if L_1038_ ~= 0 then
			if library_flags["Show Prediction Position"] then
				local L_1053_ = Instance.new("Part")
				L_1053_.Size = Vector3.new(0.5, 0.5, 0.5)
				L_1053_.Anchored = true;
				L_1053_.CanCollide = false;
				L_1053_.Transparency = 0.6;
				L_1053_.Position = L_1030_.Position;
				L_1053_.Color = Color3.new(0.3, 1, 0.3)
				L_1053_.Material = "Neon"
				L_1053_.Parent = workspace.Ray_Ignore;
				L_31_:AddItem(L_1053_, 3)
			end
		end;
		L_1030_:Destroy()
	end;
	return L_1038_, L_1039_
end;
function returnDamage(l1l1l111lll, ll11l1l1ll1l)
	local L_1056_ = 0;
	local L_1057_ = 0;
	if L_36_.gun and L_36_.gun:FindFirstChild("Melee") then
		return 0, 0
	end;
	if not workspace:FindFirstChild("Map") then
		return 0, 0
	end;
	pcall(function()
		local L_1058_ = {
			L_34_,
			L_32_.Character,
			workspace.Debris,
			workspace.Ray_Ignore,
			workspace.Map:FindFirstChild("Clips"),
			workspace.Map:FindFirstChild("SpawnPoints")
		}
		local L_1059_ = L_36_.gun;
		local L_1060_ = L_1059_.Penetration.Value * 0.01 or 0;
		local L_1061_ = L_1059_.Range.Value;
		local L_1062_ = L_1059_.DMG.Value;
		local L_1063_ = l1l1l111lll[ll11l1l1ll1l].Position;
		local L_1064_ = library_flags["From Camera"] and L_34_.CFrame.p or Vector3.new(L_32_.Character.PrimaryPart.Position.X, L_32_.Character.Head.Position.Y, L_32_.Character.PrimaryPart.Position.Z)
		local L_1065_ = CFrame.new(L_1064_, L_1063_).lookVector.unit * L_1061_ * 0.0694;
		local L_1066_ = Ray.new(L_1064_, L_1065_)
		local L_1067_, L_1068_ = workspace:FindPartOnRayWithIgnoreList(L_1066_, L_1058_, false, true)
		local L_1069_ = 0;
		local L_1070_ = 0;
		local L_1071_, L_1072_, L_1073_;
		local L_1074_ = 1;
		L_1056_ = 1;
		pcall(function()
			repeat
				L_1071_, L_1072_, L_1073_ = workspace:FindPartOnRayWithIgnoreList(L_1066_, L_1058_, false, true)
				if L_1071_ and L_1071_.Parent then
					L_1074_ = 1;
					local L_1075_ = tostring(L_1071_.Material)
					local L_1076_ = string.sub(tostring(L_1071_.Material), 15, # L_1075_)
					local L_1077_ = L_68_[L_1071_.Name]
					local L_1078_ = L_68_[L_1076_]
					L_1074_ = L_1077_ or L_1078_ or 1;
					if L_1071_:FindFirstChild("PartModifier") then
						L_1074_ = L_1071_.PartModifier.Value
					end;
					if L_1071_:IsDescendantOf(game.Workspace.Ray_Ignore) or L_1071_:IsDescendantOf(game.Workspace.Debris) then
						L_1074_ = 0
					end;
					local L_1079_, L_1080_ = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(L_1072_ + L_1065_ * 1, L_1065_ * -2), {
						L_1071_
					}, true)
					local L_1081_ = (L_1080_ - L_1072_).magnitude;
					local L_1082_ = L_1081_ * L_1074_;
					L_1070_ = math.min(L_1060_, L_1070_ + L_1082_)
					L_1056_ = 1 - L_1070_ / L_1060_;
					if L_1074_ > 0 then
						L_1069_ = L_1069_ + 1
					end;
					if L_1071_ and L_1071_.Parent and L_1071_.Parent.Name == "Hitboxes" or L_1071_ and L_1071_.Parent and L_1071_.Parent.Parent and L_1071_.Parent.Parent:FindFirstChild("Humanoid") or L_1071_ and L_1071_.Parent and L_1071_.Parent:FindFirstChild("Humanoid") or L_1071_ and L_1071_.Parent and L_1071_.Parent:FindFirstChild("Humanoid") and (1 > L_1071_.Transparency or L_1071_.Name == "HeadHB") and L_1071_.Parent:IsA("Model") then
						table.insert(L_1058_, L_1071_.Parent)
					else
						table.insert(L_1058_, L_1071_)
					end
				end
			until L_1071_ == nil or L_1071_.Parent == l1l1l111lll or L_1070_ >= L_1060_ or 0 >= L_1056_ or L_1069_ >= 4
		end)
		if L_1069_ >= 5 then
			L_1056_ = 0
		end
	end)
	return L_1056_, L_1057_
end;
function tracerTable(ll11llll1ll)
	if not workspace:FindFirstChild("Map") then
		return {}
	end;
	local L_1084_ = {
		L_34_,
		L_32_.Character,
		game.Workspace.Debris,
		game.Workspace.Ray_Ignore,
		game.Workspace.Map:FindFirstChild("Clips"),
		game.Workspace.Map:FindFirstChild("SpawnPoints")
	}
	local L_1085_ = game.ReplicatedStorage.Weapons:FindFirstChild(L_32_.Character.EquippedTool.Value)
	local L_1086_ = L_1085_.Penetration.Value * 0.01;
	local L_1087_ = L_1085_.Range.Value;
	local L_1088_ = L_1085_.DMG.Value;
	local L_1089_ = ll11llll1ll;
	local L_1090_ = CFrame.new(L_34_.CFrame.p, L_1089_).lookVector.unit * L_1087_ * 0.0694;
	local L_1091_ = Ray.new(L_34_.CFrame.p, L_1090_)
	local L_1092_, L_1093_ = workspace:FindPartOnRayWithIgnoreList(L_1091_, L_1084_, false, true)
	local L_1094_ = 0;
	local L_1095_ = 0;
	local L_1096_, L_1097_, L_1098_;
	local L_1099_ = 1;
	damagemodifier = 1;
	pcall(function()
		repeat
			L_1096_, L_1097_, L_1098_ = workspace:FindPartOnRayWithIgnoreList(L_1091_, L_1084_, false, true)
			if L_1096_ and L_1096_.Parent then
				L_1099_ = 1;
				L_1094_ = L_1094_ + 1;
				if L_1096_.Name == "nowallbang" then
					L_1099_ = 100
				elseif L_1096_:FindFirstChild("PartModifier") then
					L_1099_ = L_1096_.PartModifier.Value
				end;
				local L_1100_, L_1101_ = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(L_1097_ + L_1090_ * 1, L_1090_ * -2), {
					L_1096_
				}, true)
				local L_1102_ = (L_1101_ - L_1097_).magnitude;
				local L_1103_ = L_1102_ * L_1099_;
				L_1095_ = math.min(L_1086_, L_1095_ + L_1103_)
				damagemodifier = 1 - L_1095_ / L_1086_;
				if damagemodifier > 0 and L_1099_ < 100 then
					if L_1096_ and L_1096_.Parent and L_1096_.Parent.Name == "Hitboxes" or L_1096_ and L_1096_.Parent and L_1096_.Parent.Parent and L_1096_.Parent.Parent:FindFirstChild("Humanoid") or L_1096_ and L_1096_.Parent and L_1096_.Parent:FindFirstChild("Humanoid") or L_1096_ and L_1096_.Parent and L_1096_.Parent:FindFirstChild("Humanoid") and (1 > L_1096_.Transparency or L_1096_.Name == "HeadHB") and L_1096_.Parent:IsA("Model") then
						table.insert(L_1084_, L_1096_.Parent)
					else
						table.insert(L_1084_, L_1096_)
					end
				end
			end
		until L_1096_ == nil or L_1095_ >= L_1086_ or 0 >= damagemodifier or L_1094_ >= 4
	end)
	return L_1084_
end;
function teamCheck(lll1111l, ll1l1111l)
	if lll1111l == L_32_ then
		return false
	end
	if ll1l1111l then
		return true
	end
	local sameTeam = false
	local myStatusTeam, otherStatusTeam = nil, nil
	pcall(function()
		if L_32_ and L_32_:FindFirstChild("Status") and L_32_.Status:FindFirstChild("Team") then
			myStatusTeam = L_32_.Status.Team.Value
		end
		if lll1111l and lll1111l:FindFirstChild("Status") and lll1111l.Status:FindFirstChild("Team") then
			otherStatusTeam = lll1111l.Status.Team.Value
		end
	end)
	if myStatusTeam and otherStatusTeam and myStatusTeam ~= "" and otherStatusTeam ~= "" then
		return myStatusTeam ~= otherStatusTeam
	end
	if lll1111l.Team and L_32_.Team then
		if lll1111l.Team == L_32_.Team or lll1111l.Team.Name == L_32_.Team.Name then
			sameTeam = true
		end
	end
	if lll1111l.TeamColor == L_32_.TeamColor then
		sameTeam = true
	end
	return not sameTeam
end;
function getWeaponInfo()
	local L_1106_ = {
		alive = false,
		melee = false,
		clientgun = nil,
		ammo = 0,
		name = "",
		sniper = false,
		silentAim = library_flags["otherSilentAim"],
		FOV = library_flags["otherFOV"],
		silentFOV = library_flags["otherSilentFOV"],
		smoothness = library_flags["otherSmoothness"],
		deadzone = library_flags["otherDeadzone"],
		baim = library_flags["otherBaim"],
		mindmg = library_flags["otherMin"],
		hitboxes = library_flags["otherHitboxes"],
		hitchance = library_flags["otherHitchance"] or 100,
		closestHitbox = library_flags["otherClosestHitbox"],
		trigger = library_flags["otherTrigger"],
		triggerDelay = library_flags["otherTriggerDelay"],
		type = ""
	}
	if alive() and L_24_.Weapons:FindFirstChild(L_32_.Character.EquippedTool.Value) then
		local L_1107_ = L_24_.Weapons[L_32_.Character.EquippedTool.Value]
		L_1106_.clientgun = L_1107_;
		L_1106_.ammo = (L_32_.PlayerGui:FindFirstChild("GUI") and L_32_.PlayerGui.GUI:FindFirstChild("AmmoGUI") and L_32_.PlayerGui.GUI.AmmoGUI:FindFirstChild("AmmoClip")) and tonumber(L_32_.PlayerGui.GUI.AmmoGUI.AmmoClip.Text) or 0
		L_1106_.melee = L_1107_:FindFirstChild("Melee")
		L_1106_.name = L_1107_.Name;
		L_1106_.alive = true;
		if L_1106_.melee then
			L_1106_.mindmg = 387420489;
			L_1106_.hitboxes = {
				"Body"
			}
			L_1106_.silentAim = false;
			L_1106_.silentFOV = 0
		end;
		if L_1107_:FindFirstChild("RifleThing") then
			L_1106_.FOV = library_flags["riflesFOV"]
			L_1106_.silentFOV = library_flags["riflesSilentFOV"]
			L_1106_.deadzone = library_flags["riflesDeadzone"]
			L_1106_.baim = library_flags["riflesBaim"]
			L_1106_.silentAim = library_flags["riflesSilentAim"]
			L_1106_.smoothness = library_flags["riflesSmoothness"]
			L_1106_.mindmg = library_flags["riflesMin"]
			L_1106_.hitboxes = library_flags["riflesHitboxes"]
			L_1106_.hitchance = library_flags["riflesHitchance"] or 100
			L_1106_.closestHitbox = library_flags["riflesClosestHitbox"]
			L_1106_.trigger = library_flags["riflesTrigger"]
			L_1106_.triggerDelay = library_flags["riflesTriggerDelay"]
			L_1106_.type = "main"
		elseif L_1107_:FindFirstChild("Secondary") and L_1107_.Name ~= "R8" and L_1107_.Name ~= "DesertEagle" then
			L_1106_.FOV = library_flags["pistolFOV"]
			L_1106_.silentFOV = library_flags["pistolSilentFOV"]
			L_1106_.deadzone = library_flags["pistolDeadzone"]
			L_1106_.baim = library_flags["pistolBaim"]
			L_1106_.silentAim = library_flags["pistolSilentAim"]
			L_1106_.smoothness = library_flags["pistolSmoothness"]
			L_1106_.mindmg = library_flags["pistolMin"]
			L_1106_.hitboxes = library_flags["pistolHitboxes"]
			L_1106_.hitchance = library_flags["pistolHitchance"] or 100
			L_1106_.closestHitbox = library_flags["pistolClosestHitbox"]
			L_1106_.trigger = library_flags["pistolTrigger"]
			L_1106_.triggerDelay = library_flags["pistolTriggerDelay"]
			L_1106_.type = "secondary"
		elseif L_1107_.Name == "R8" or L_1107_.Name == "DesertEagle" then
			L_1106_.FOV = library_flags["heavypFOV"]
			L_1106_.silentFOV = library_flags["heavypSilentFOV"]
			L_1106_.deadzone = library_flags["heavypDeadzone"]
			L_1106_.baim = library_flags["heavypBaim"]
			L_1106_.silentAim = library_flags["heavypSilentAim"]
			L_1106_.smoothness = library_flags["heavypSmoothness"]
			L_1106_.mindmg = library_flags["heavypMin"]
			L_1106_.hitboxes = library_flags["heavypHitboxes"]
			L_1106_.hitchance = library_flags["heavypHitchance"] or 100
			L_1106_.closestHitbox = library_flags["heavypClosestHitbox"]
			L_1106_.trigger = library_flags["heavypTrigger"]
			L_1106_.triggerDelay = library_flags["heavypTriggerDelay"]
			L_1106_.type = "secondary"
		elseif L_1107_.Name == "AWP" then
			L_1106_.FOV = library_flags["awpFOV"]
			L_1106_.silentFOV = library_flags["awpSilentFOV"]
			L_1106_.deadzone = library_flags["awpDeadzone"]
			L_1106_.baim = library_flags["awpBaim"]
			L_1106_.silentAim = library_flags["awpSilentAim"]
			L_1106_.smoothness = library_flags["awpSmoothness"]
			L_1106_.mindmg = library_flags["awpMin"]
			L_1106_.hitboxes = library_flags["awpHitboxes"]
			L_1106_.hitchance = library_flags["awpHitchance"] or 100
			L_1106_.closestHitbox = library_flags["awpClosestHitbox"]
			L_1106_.trigger = library_flags["awpTrigger"]
			L_1106_.triggerDelay = library_flags["awpTriggerDelay"]
			L_1106_.sniper = true;
			L_1106_.type = "main"
		elseif L_1107_.Name == "Scout" then
			L_1106_.FOV = library_flags["scoutFOV"]
			L_1106_.silentFOV = library_flags["scoutSilentFOV"]
			L_1106_.deadzone = library_flags["scoutDeadzone"]
			L_1106_.baim = library_flags["scoutBaim"]
			L_1106_.silentAim = library_flags["scoutSilentAim"]
			L_1106_.smoothness = library_flags["scoutSmoothness"]
			L_1106_.mindmg = library_flags["scoutMin"]
			L_1106_.hitboxes = library_flags["scoutHitboxes"]
			L_1106_.hitchance = library_flags["scoutHitchance"] or 100
			L_1106_.closestHitbox = library_flags["scoutClosestHitbox"]
			L_1106_.trigger = library_flags["scoutTrigger"]
			L_1106_.triggerDelay = library_flags["scoutTriggerDelay"]
			L_1106_.sniper = true;
			L_1106_.type = "main"
		elseif L_1107_.Name == "G3SG1" then
			L_1106_.mindmg = library_flags["autoMin"]
			L_1106_.hitboxes = library_flags["autoHitboxes"]
			L_1106_.sniper = true;
			L_1106_.type = "main"
		end
	end;
	return L_1106_
end;
function getNearest(l1l11l111, l1ll1lll1l, ll11l1111111)
	l1l11l111 = l1l11l111 * 3;
	if not L_57_.alive then
		return
	end;
	if not workspace:FindFirstChild("Map") then
		return
	end;
	local L_1111_, L_1112_ = 387420489, nil;
	for l11111, ll11ll1l11 in next, L_30_:GetPlayers() do
		if ll11ll1l11.Character and ll11ll1l11.Character.PrimaryPart and ll11ll1l11.Character:FindFirstChild("Head") and teamCheck(ll11ll1l11, l1ll1lll1l) then
			local L_1115_, L_1116_ = L_34_:WorldToScreenPoint(ll11ll1l11.Character.Head.Position)
			local L_1117_ = false;
			if ll11l1111111 then
				local L_1118_ = Ray.new(L_34_.CFrame.p, (ll11ll1l11.Character.Head.Position - L_34_.CFrame.p).unit * 500)
				local L_1119_, L_1120_ = workspace:FindPartOnRayWithIgnoreList(L_1118_, {
					L_34_,
					L_32_.Character,
					workspace.Ray_Ignore,
					workspace.Map:FindFirstChild("Clips"),
					workspace.Map:FindFirstChild("SpawnPoints")
				})
				if L_1119_:IsDescendantOf(ll11ll1l11.Character) then
					L_1117_ = true
				end
			end;
			if L_1116_ then
				if not ll11l1111111 or ll11l1111111 and L_1117_ then
					local L_1121_ = Vector2.new(L_33_.X, L_33_.Y)
					local L_1122_ = (Vector2.new(L_1115_.X, L_1115_.Y) - L_1121_).magnitude;
					if L_1122_ < L_1111_ and L_1122_ <= l1l11l111 then
						L_1111_ = L_1122_;
						L_1112_ = ll11ll1l11
					end
				end
			end
		end
	end;
	return L_1112_, L_1111_
end;
function encodeHitPos(pos)
	return Vector3.new(
		((pos.X - 156325) * 13 + 17854) * 16,
		(pos.Y + 64000) * 7 - 142657,
		(pos.Z * 9 - 47000) * 6
	)
end
SILENT_HITBOX_NAMES = {
	"Head", "HeadHB", "UpperTorso", "LowerTorso", "Torso",
	"LeftUpperArm", "RightUpperArm", "Left Arm", "Right Arm",
	"LeftUpperLeg", "RightUpperLeg", "Left Leg", "Right Leg",
	"HumanoidRootPart"
}
function getClosestHitboxPart(char)
	local aimPos = Vector2.new(L_33_.X, L_33_.Y)
	local best, bestDist = nil, math.huge
	for _, name in SILENT_HITBOX_NAMES do
		local part = char:FindFirstChild(name) or (char:FindFirstChild("Hitboxes") and char.Hitboxes:FindFirstChild(name))
		if part and part:IsA("BasePart") then
			local sp, onScreen = L_34_:WorldToScreenPoint(part.Position)
			if onScreen then
				local d = (Vector2.new(sp.X, sp.Y) - aimPos).Magnitude
				if d < bestDist then
					bestDist = d
					best = part
				end
			end
		end
	end
	return best
end
function getSilentTargetPart(char)
	if L_57_.baim then
		return char.PrimaryPart or char:FindFirstChild("HumanoidRootPart")
	end
	if L_57_.closestHitbox then
		local closest = getClosestHitboxPart(char)
		if closest then
			return closest
		end
	end
	local hitboxes = char:FindFirstChild("Hitboxes")
	return (hitboxes and hitboxes:FindFirstChild("HeadHB")) or char:FindFirstChild("HeadHB") or char:FindFirstChild("Head")
end
function buildSilentRay(targetPart)
	local targetPos = targetPart.CFrame and targetPart.CFrame.p or targetPart.Position
	local rayOrigin = L_34_.CFrame.p
	if not library_flags["From Camera"] and L_32_.Character and L_32_.Character.PrimaryPart then
		rayOrigin = Vector3.new(
			L_32_.Character.PrimaryPart.Position.X,
			L_32_.Character.Head.Position.Y,
			L_32_.Character.PrimaryPart.Position.Z
		)
	end
	local dist = (rayOrigin - targetPos).Magnitude
	local predicted = targetPos + Vector3.new(0, dist / 500, 0)
	return Ray.new(rayOrigin, (predicted - rayOrigin).Unit * 500), rayOrigin, predicted
end
function applySilentHitParl(args)
	local tgt = env.target
	if not tgt or not tgt.Parent then return args end
	local hitPos = tgt.CFrame and tgt.CFrame.p or tgt.Position
	args[1] = tgt
	args[2] = encodeHitPos(hitPos)
	if typeof(args[10]) == "Vector3" and typeof(args[12]) == "Vector3" then
		local dir = hitPos - args[10]
		if dir.Magnitude > 0.001 then
			args[12] = dir.Unit
		end
	end
	return args
end
function playAudio(ll1l1ll11)
	if not game.ReplicatedStorage.Weapons:FindFirstChild(ll1l1ll11) then
		return
	end;
	local L_1124_ = game.ReplicatedStorage.Weapons[ll1l1ll11]
	local L_1125_ = L_1124_.Model:FindFirstChild("PreSounds") or L_1124_.Model;
	local L_1126_ = "Shoot"
	if L_1124_.Name == "USP" or L_1124_.Name == "M4A1" then
		L_1126_ = "SShoot"
	end;
	if L_57_.alive and L_1125_:FindFirstChild(L_1126_) then
		local L_1127_ = Instance.new('Sound', workspace)
		L_1127_.SoundId = L_1125_[L_1126_].Value;
		L_1127_.PlayOnRemove = true;
		L_1127_.Volume = 0.7;
		L_1127_:Destroy()
	end
end;
L_71_ = {
	["AK47"] = "rbxassetid://6061266272",
	["AWP"] = "rbxassetid://6067278314",
	["G3SG1"] = "rbxassetid://6067426225",
	["DesertEagle"] = "rbxassetid://6067333190",
	["Glock"] = "rbxassetid://6067337612",
	["USP"] = "rbxassetid://6067338308",
	["Scout"] = "rbxassetid://6067338138",
	["P250"] = "rbxassetid://6067337798",
	["M4A4"] = "rbxassetid://6067358591",
	["M4A1"] = "rbxassetid://6067358774"
}
L_72_ = {
	["USP"] = "SShoot",
	["M4A1"] = "SShoot"
}
function replaceAudio(ll1l1ll11l1)
	if not L_71_[ll1l1ll11l1] then
		return
	end;
	local L_1129_ = "Shoot"
	if L_72_[ll1l1ll11l1] then
		L_1129_ = L_72_[ll1l1ll11l1]
	end;
	pcall(function()
		L_32_.Character.Gun[L_1129_].Value = L_71_[ll1l1ll11l1]
	end)
end;
L_73_ = 0;
L_74_ = false;
function CreateThread(ll1l111l1l)
	local L_1134_ = coroutine.create(ll1l111l1l)
	coroutine.resume(L_1134_)
	return L_1134_
end;
L_75_ = false;
function tracers(lll11ll11, l1l1llll)
	if not L_75_ and L_32_.Character and L_32_.Character:FindFirstChild("Gun") and l1l1llll then
		L_75_ = true;
		CreateThread(function()
			wait()
			L_75_ = false
		end)
		local L_1137_ = Instance.new("Part")
		local L_1138_ = Instance.new("Part")
		local L_1139_ = Instance.new("Beam", L_1137_)
		local L_1140_ = Instance.new("Part")
		local L_1141_ = Instance.new("Attachment")
		local L_1142_ = Instance.new("Attachment")
		if library_flags["Tracer Mode"] == "Part" then
			local L_1143_ = l1l1llll.Position - lll11ll11;
			L_1140_.Material = "ForceField"
			L_1140_.CFrame = CFrame.new(lll11ll11 + L_1143_ / 2, lll11ll11)
			L_1140_.Size = Vector3.new(0.125, 0.125, L_1143_.Magnitude)
			L_1140_.CanCollide = false;
			L_1140_.Transparency = 0;
			L_1140_.Anchored = true;
			L_1140_.Color = library_flags["tracerColor"]
			L_1140_.Parent = workspace.Debris
		elseif library_flags["Tracer Mode"] == "Beam" then
			L_1137_.Size = Vector3.new(0.1, 0.1, 0.1)
			L_1137_.Transparency = 1;
			L_1137_.Parent = workspace;
			L_1137_.Position = lll11ll11;
			L_1137_.CanCollide = false;
			L_1137_.Anchored = true;
			L_1141_.Parent = L_1137_;
			L_1138_.Size = Vector3.new(0.1, 0.1, 0.1)
			L_1138_.Transparency = 1;
			L_1138_.Parent = workspace;
			L_1138_.Position = l1l1llll.Position;
			L_1138_.CanCollide = false;
			L_1138_.Anchored = true;
			L_1142_.Parent = L_1138_;
			L_1139_.Color = ColorSequence.new(library_flags["tracerColor"])
			L_1139_.LightEmission = 1;
			L_1139_.LightInfluence = 0;
			L_1139_.Transparency = NumberSequence.new{
				NumberSequenceKeypoint.new(0, 1 - L_5_.options["tracerColor"].trans),
				NumberSequenceKeypoint.new(1, 1 - L_5_.options["tracerColor"].trans)
			}
			L_1139_.Width0 = 0.25;
			L_1139_.Width1 = 0.25;
			L_1139_.Attachment0 = L_1141_;
			L_1139_.Attachment1 = L_1142_;
			L_1139_.FaceCamera = library_flags["Beams Face Camera"]
			local texMap = {
				["Solid"] = "rbxassetid://446111271",
				["Lightning"] = "rbxassetid://7216850022",
				["Laser"] = "rbxassetid://7136858729",
				["Twisted Energy"] = "rbxassetid://7071778278",
				["Anime Lazer"] = "rbxassetid://17441065350",
				["Arrow"] = "rbxassetid://1274378728",
				["Minecraft"] = "rbxassetid://152410036",
				["Alien Energy Ray"] = "rbxassetid://6091341618",
				["Energy Ray"] = "rbxassetid://13832105797",
				["Matrix"] = "rbxassetid://15097610754",
				["Cartoony Eletric"] = "rbxassetid://18722421816"
			}
			local texName = library_flags["Tracer Texture"] or library_flags["tracerTexture"] or "Solid"
			L_1139_.Texture = texMap[texName] or texMap["Solid"]
			L_1139_.Parent = L_1137_
		end;
		CreateThread(function()
			wait(0.3)
			for l111l11ll111 = 1, 100, 4 do
				wait()
				if l111l11ll111 / 100 > 1 - L_5_.options["tracerColor"].trans then
					L_1140_.Transparency = l111l11ll111 / 100;
					L_1139_.Transparency = NumberSequence.new{
						NumberSequenceKeypoint.new(0, l111l11ll111 / 100),
						NumberSequenceKeypoint.new(1, l111l11ll111 / 100)
					}
				end
			end;
			L_1140_:Destroy()
			L_1137_:Destroy()
			L_1138_:Destroy()
		end)
	end
end;
env.tracers = tracers;
function fireHitpart(l1ll11l1l, llll11l1l1ll, l11lll, ll111111l, lll111ll1l1)
	if workspace.CurrentCamera:FindFirstChild("Arms") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("EquippedTool") and game.Players.LocalPlayer.Character:FindFirstChild("Gun") then
		local L_1151_ = game.Players.LocalPlayer.Character.EquippedTool.Value
		local L_1152_ = game.Players.LocalPlayer.Character.Gun
		local L_1153_ = workspace.CurrentCamera.Arms:FindFirstChild("Guy")
		local L_1154_ = workspace.CurrentCamera.Arms:FindFirstChild("fire")
		if L_1153_ and L_1154_ then
			pcall(function()
				L_1153_:LoadAnimation(L_1154_):Play()
			end)
			L_40_:FireServer(l1ll11l1l, lll111ll1l1 or encodePos(l1ll11l1l.Position), L_1151_, 4096, L_1152_, nil, llll11l1l1ll, false, llll11l1l1ll < 1, workspace.CurrentCamera.CFrame.p, game.Workspace.DistributedTime.Value, Vector3.zAxis, false, false, false, false, true)
			if not ll111111l then
				playAudio(L_1151_)
			end
		end
	end
end;
function countESP()
	local L_1155_ = 0;
	for l11ll111ll11, l1ll111lllll in next, L_56_ do
		if l1ll111lllll.type == "plr" then
			L_1155_ = L_1155_ + 1
		end
	end;
	return L_1155_
end;
L_76_ = 0;
GetIcon = require(game.ReplicatedStorage.GetIcon)
espIconsGui = Instance.new("ScreenGui")
pcall(function() if syn and syn.protect_gui then syn.protect_gui(espIconsGui) end end)
espIconsGui.Name = "espIconsGui"
espIconsGui.Parent = game.CoreGui
function createEsp(ll1111l11l, llllll1l11l)
	local L_1160_ = Drawing.new("Text")
	local L_1161_ = Drawing.new("Text")
	local L_1162_ = Drawing.new("Line")
	local L_1163_ = Drawing.new("Square")
	local L_1164_ = Drawing.new("Square")
	local L_1164_fill = Drawing.new("Square")
	local L_1165_ = Drawing.new("Square")
	local L_1166_ = Drawing.new("Square")
	local lll1l1ll = Drawing.new("Square")
	local l11ll1lllll = Drawing.new("Square")
	lll1l1ll.Color = Color3.new(0, 0, 0)
	lll1l1ll.Thickness = 2;
	lll1l1ll.Transparency = 1;
	lll1l1ll.Visible = false;
	l11ll1lllll.Color = Color3.fromRGB(0, 100, 255)
	l11ll1lllll.Thickness = 1;
	l11ll1lllll.Transparency = 1;
	l11ll1lllll.Visible = false;
	local L_1167_ = "Object" .. tostring(L_76_)
	local L_1168_;
	local iconLabel = Instance.new("ImageLabel")
	iconLabel.BackgroundTransparency = 1
	iconLabel.Size = UDim2.new(0, 62, 0, 25)
	iconLabel.Visible = false
	iconLabel.ScaleType = Enum.ScaleType.Fit
	iconLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	iconLabel.Parent = espIconsGui
	if ll1111l11l == "plr" then
		L_1168_ = Instance.new("Folder", L_46_)
		L_1167_ = llllll1l11l.Name;
		L_1168_.Name = L_1167_;
		L_1165_.Color = Color3.new(0, 0, 0)
		L_1165_.Thickness = 2;
		L_1165_.Transparency = 1;
		L_1165_.Visible = false;
		L_1166_.Color = Color3.new(0, 1, 0)
		L_1166_.Thickness = 1;
		L_1166_.Transparency = 1;
		L_1166_.Visible = false
	else
		L_76_ = L_76_ + 1
	end;
	L_1163_.Color = Color3.new(0, 0, 0)
	L_1163_.Thickness = 3;
	L_1163_.Transparency = 1;
	L_1163_.Filled = false;
	L_1163_.Visible = false;
	L_1164_.Color = Color3.new(1, 1, 1)
	L_1164_.Thickness = 1;
	L_1164_.Transparency = 1;
	L_1164_.Filled = false;
	L_1164_.Visible = false;
	L_1164_fill.Color = Color3.new(1, 1, 1)
	L_1164_fill.Thickness = 1;
	L_1164_fill.Transparency = 0.5;
	L_1164_fill.Filled = true;
	L_1164_fill.Visible = false;
	L_1162_.From = Vector2.new(L_34_.ViewportSize.X / 2, L_34_.ViewportSize.Y * 0.9)
	L_1162_.Color = Color3.new(1, 1, 1)
	L_1162_.Thickness = 1;
	L_1162_.Transparency = 1;
	L_1162_.Visible = false;
	L_1160_.Text = llllll1l11l.Name;
	L_1160_.Size = 13;
	L_1160_.Center = true;
	L_1160_.OutlineColor = Color3.new(0, 0, 0)
	L_1160_.Color = Color3.new(1, 1, 1)
	L_1160_.Visible = false;
	L_1161_.Text = "Gun"
	L_1161_.Size = 13;
	L_1161_.Center = true;
	L_1161_.OutlineColor = Color3.new(0, 0, 0)
	L_1161_.Color = Color3.new(1, 1, 1)
	L_1161_.Visible = false;
	local L_flags_ = Drawing.new("Text")
	L_flags_.Text = ""
	L_flags_.Size = 12;
	L_flags_.Center = false;
	L_flags_.OutlineColor = Color3.new(0, 0, 0)
	L_flags_.Outline = true;
	L_flags_.Color = Color3.fromRGB(255, 255, 255)
	L_flags_.Visible = false; 
	
	local skeleton = {}
	local function skelLine(idx)
		local ln = skeleton[idx]
		if not ln then
			ln = Drawing.new("Line")
			ln.Thickness = 1
			ln.Transparency = 1
			ln.Visible = false
			skeleton[idx] = ln
		end
		return ln
	end

	local HEALTH_SEGMENTS = 16
	local healthSegs = {}
	for i = 1, HEALTH_SEGMENTS do
		local seg = Drawing.new("Square")
		seg.Filled = true
		seg.Thickness = 1
		seg.Transparency = 1
		seg.Visible = false
		healthSegs[i] = seg
	end

	local healthNum = Drawing.new("Text")
	healthNum.Text = ""
	healthNum.Size = 13
	healthNum.Center = true
	healthNum.Outline = true
	healthNum.OutlineColor = Color3.new(0, 0, 0)
	healthNum.Color = Color3.new(1, 1, 1)
	healthNum.Visible = false
	function invis()
		if lll11ll1lll and lll11ll1lll._isInvis then return end
		L_1164_.Visible = false;
		L_1164_fill.Visible = false;
		L_1162_.Visible = false;
		L_1160_.Visible = false;
		L_1166_.Visible = false;
		L_1163_.Visible = false;
		L_1165_.Visible = false;
		L_1161_.Visible = false;
		lll1l1ll.Visible = false;
		l11ll1lllll.Visible = false;
		if L_flags_ then L_flags_.Visible = false end
		if iconLabel then iconLabel.Visible = false end
		for llll111l1lll, llll1l in skeleton do
			llll1l.Visible = false
		end
		for _, seg in healthSegs do seg.Visible = false end
		healthNum.Visible = false
		if lll11ll1lll then lll11ll1lll._isInvis = true end
	end;
function remove()
		L_1164_fill:Remove()
		L_1162_:Remove()
		L_1160_:Remove()
		L_1166_:Remove()
		L_1163_:Remove()
		L_1165_:Remove()
		lll1l1ll:Remove()
		l11ll1lllll:Remove()
		if L_flags_ then L_flags_:Remove() end
		if iconLabel then iconLabel:Destroy() end
		for l1ll1l1, lll1111l111l in skeleton do
			lll1111l111l:Remove()
		end
		for _, seg in healthSegs do seg:Remove() end
		if healthNum then healthNum:Remove() end
	end;
	local L_1169_ = {
		text = L_1160_,
		weapon = L_1161_,
		flags = L_flags_,
		tracer = L_1162_,
		box = L_1164_,
		boxfill = L_1164_fill,
		boxoutline = L_1163_,
		healthb = L_1166_,
		healthbo = L_1165_,
		armorb = l11ll1lllll,
		armorbo = lll1l1ll,
		skeleton = skeleton,
		skelLine = skelLine,
		skelCount = 0,
		healthSegs = healthSegs,
		healthSegCount = HEALTH_SEGMENTS,
		healthNum = healthNum,
		hpSmooth = 0,
		invis = invis,
		remove = remove,
		type = ll1111l11l,
		object = llllll1l11l,
		icon = iconLabel
	}
	L_56_[L_1167_] = L_1169_;
	return L_1169_
end;
L_77_ = {}
function ApplyValue(ll11l1, l1l1lll11l, lll1ll1l1l, l111ll)
	if ll11l1 then
		for l1l1ll1ll, l111lll1111 in game.ReplicatedStorage.Weapons:GetDescendants() do
			if l111lll1111.Name == l1l1lll11l then
				lll1ll1l1l[l111lll1111] = {
					value = l111lll1111.Value
				}
				l111lll1111.Value = l111ll;
				for ll111111l, lll1l1ll1l in l111lll1111:GetChildren() do
					lll1ll1l1l[lll1l1ll1l] = {
						value = lll1l1ll1l.Value
					}
					lll1l1ll1l.Value = l111ll
				end
			end
		end
	else
		for l1l1l1111l1, l1l1ll111l11 in game.ReplicatedStorage.Weapons:GetDescendants() do
			if l1l1ll111l11.Name == l1l1lll11l and lll1ll1l1l[l1l1ll111l11] then
				l1l1ll111l11.Value = lll1ll1l1l[l1l1ll111l11].value;
				for lll1l1l11, l1l11lll in l1l1ll111l11:GetChildren() do
					l1l11lll.Value = lll1ll1l1l[l1l11lll].value
				end
			end
		end
	end
end;
L_43_.Name = "bt"
function createPlr(l111llll)
	if not l111llll.Character then
		return
	end;
	local L_1183_ = Instance.new("Model", L_43_)
	L_1183_.Name = l111llll.Name;
	if L_47_[l111llll.Name] then
		L_47_[l111llll.Name]:Destroy()
		L_47_[l111llll.Name] = nil
	end;
	for l111lll11, llll1ll11l1l in next, l111llll.Character:GetChildren() do
		if not llll1ll11l1l:IsA"BasePart" or llll1ll11l1l.Name == "Gun" then
			continue;
		end;
		if llll1ll11l1l.Name ~= "HeadHB" and llll1ll11l1l.Transparency == 1 then
			continue;
		end;
		local L_1186_ = llll1ll11l1l:Clone()
		L_1186_.Transparency = 0;
		L_1186_.Anchored = true;
		L_1186_.CanCollide = false;
		L_1186_.Color = Color3.new(1, 1, 1)
		L_1186_.Size = L_1186_.Size - Vector3.new(0.035, 0.035, 0.035)
		L_1186_.Transparency = 1;
		L_1186_.Name = llll1ll11l1l.Name;
		L_1186_.Parent = L_1183_;
		for l11ll11ll1, lllll1 in next, L_1186_:GetChildren() do
			if not lllll1:IsA"BasePart" and not lllll1:IsA"DataModelMesh" then
				lllll1:Destroy()
			end
		end
	end;
	if # L_1183_:GetChildren() > 0 then
		L_47_[l111llll.Name] = L_1183_
	end
end;
L_78_ = false;
function selfChams()
	if library_flags["Self Chams"] and L_32_.Character then
		local mat = library_flags["selfChamsMaterial"] or "SmoothPlastic"
		for _, part in next, L_32_.Character:GetDescendants() do
			if part.Name == "HumanoidRootPart" or part.Name == "Head" or part.Name == "HeadHB" or part.Name == "Gun" or (string.find(part.Name, "C4") and part.Name ~= "BackC4") then
				continue
			end
			if part:IsA("BasePart") then
				part.Color = library_flags["selfChamsColor"]
				part.Transparency = 1 - L_5_.options["selfChamsColor"].trans
				part.Material = mat
				if hasProperty(part, "Reflectance") then part.Reflectance = 0 end
			end
			if part:IsA("SpecialMesh") then
				local c = library_flags["selfChamsColor"]
				part.VertexColor = Vector3.new(c.R, c.G, c.B)
			end
			if part.Name == "Shirt" then
				part.ShirtTemplate = "rbxassetid://0"
			elseif part.Name == "Pants" then
				part.PantsTemplate = "rbxassetid://0"
			elseif part.Name == "Face" then
				part.Texture = "rbxassetid://0"
			end
			if hasProperty(part, "TextureID") then part.TextureID = L_60_[mat] end
			if hasProperty(part, "TextureId") then part.TextureId = L_60_[mat] end
		end
	end
end;
function updateSkybox()
	if L_29_:FindFirstChild("SunRays") then
		L_29_.SunRays.Enabled = false
	end;
	local L_1189_ = library_flags["skyboxValue"]
	if library_flags["Skybox Changer"] and Skyboxes[L_1189_] then
		local L_1190_ = Instance.new("Sky", L_29_)
		L_1190_.Name = "customsky"
		L_1190_.SunTextureId = "rbxassetid://"
		L_1190_.CelestialBodiesShown = "rbxassetid://"
		L_78_ = true;
		for ll111l, ll1111ll1l in next, Skyboxes[L_1189_] do
			L_1190_[ll111l] = ll1111ll1l
		end
	elseif not library_flags["Skybox Changer"] and L_78_ then
		if L_29_:FindFirstChild("customsky") then
			L_29_.customsky:Destroy()
		end;
		local L_1193_ = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
		if L_1193_ then
			L_78_ = false;
			L_1193_.Parent = workspace;
			wait()
			L_1193_.Parent = L_29_
		end
	end
end;
L_79_ = {
	"HumanoidRootPart",
	"FakeHead",
	"C4",
	"Gun"
}
L_80_ = false;
function hitChams(l1l1lll, l1ll1l1, ll11111, ll1l1l)
	if l1l1lll.Character and not L_80_ then
		L_80_ = true;
		CreateThread(function()
			wait(0.05)
			L_80_ = false
		end)
		for lll1ll1l111l, lll1llll in next, l1l1lll.Character:GetChildren() do
			if lll1llll:IsA"MeshPart" and lll1llll.Transparency ~= 1 or lll1llll.Name == "Head" then
				if not L_79_[lll1llll.Name] then
					local L_1200_ = lll1llll:Clone()
					L_1200_:ClearAllChildren()
					L_1200_.Material = l1ll1l1 and "SmoothPlastic" or "ForceField"
					L_1200_.CFrame = lll1llll.CFrame;
					L_1200_.Size = lll1llll.Name == "Head" and Vector3.new(1.18, 1.18, 1.18) or L_1200_.Size;
					L_1200_.CanCollide = false;
					L_1200_.Color = l1ll1l1 or library_flags["hitchamsColor"]
					L_1200_.Anchored = true;
					L_1200_.Transparency = ll11111 or 0;
					L_1200_.Parent = workspace.Debris;
					if hasProperty(L_1200_, "TextureID") then
						L_1200_.TextureID = ""
					end;
					if hasProperty(L_1200_, "UsePartColor") then
						L_1200_.UsePartColor = true
					end;
					L_31_:AddItem(L_1200_, ll1l1l or 1.5)
					if not l1ll1l1 then
						local L_1201_ = L_27_:Create(L_1200_, TweenInfo.new(1.5), {
							Transparency = 1
						})
						L_1201_:Play()
					end
				end
			end
		end
	end
end;
env.hitChams = hitChams;
L_81_ = {
	"Head",
	"UpperTorso",
	"LowerTorso",
	"LeftUpperArm",
	"LeftLowerArm",
	"LeftHand",
	"RightUpperArm",
	"RightLowerArm",
	"RightHand",
	"LeftUpperLeg",
	"LeftLowerLeg",
	"LeftFoot",
	"RightUpperLeg",
	"RightLowerLeg",
	"RightFoot",
	"Torso",
	"Left Arm",
	"Right Arm",
	"Left Leg",
	"Right Leg"
}
function reverseChamsPlr(lllll11ll)
	if lllll11ll.Character then
		for _, oldH in lllll11ll.Character:GetChildren() do
			if oldH:IsA("Highlight") and (oldH.Name == "DefaultChams" or oldH.Name == "WallChams" or oldH.Name == "VisibleChams") then
				oldH:Destroy()
			end
		end
		local h = lllll11ll.Character:FindFirstChildOfClass("Highlight")
		if h then h:Destroy() end
		local g = lllll11ll.Character:FindFirstChild("GlobalAssets")
		if g then
			for _, child in next, g:GetChildren() do
				if child:IsA("Decal") then child.Parent = lllll11ll.Character:FindFirstChild("Head") or lllll11ll.Character else child.Parent = lllll11ll.Character end
			end
			g:Destroy()
		end
		for _, child in next, lllll11ll.Character:GetDescendants() do
			if child:IsA("BasePart") then
				if child:GetAttribute("OrigMat") then
					pcall(function()
						local mat = child:GetAttribute("OrigMat")
						if type(mat) == "string" and mat:match("Enum%.Material%.") then
							mat = mat:gsub("Enum%.Material%.", "")
						end
						child.Material = Enum.Material[mat]
						child.Color = child:GetAttribute("OrigColor")
					end)
					child:SetAttribute("OrigMat", nil)
					child:SetAttribute("OrigColor", nil)
				end
				local f = child:FindFirstChild("HiddenAssets")
				if f then
					for _, sa in next, f:GetChildren() do
						sa.Parent = child
					end
					f:Destroy()
				end
			end
			if child:IsA("MeshPart") or child:IsA("SpecialMesh") then
				if child:GetAttribute("OrigTex") then
					pcall(function()
						if child:IsA("MeshPart") then child.TextureID = child:GetAttribute("OrigTex") else child.TextureId = child:GetAttribute("OrigTex") end
					end)
					child:SetAttribute("OrigTex", nil)
				end
			end
			if child.Name == "inner" or child.Name == "outer" then
				child:Destroy()
			end
		end
	end
end
CHAMS_BODYPARTS = {
	"Head", "UpperTorso", "LowerTorso",
	"LeftUpperArm", "LeftLowerArm", "LeftHand",
	"RightUpperArm", "RightLowerArm", "RightHand",
	"LeftUpperLeg", "LeftLowerLeg", "LeftFoot",
	"RightUpperLeg", "RightLowerLeg", "RightFoot",
	"Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"
}
function chamsPlr(lllll11ll)
	if lllll11ll.Character and teamCheck(lllll11ll, L_39_) and lllll11ll.Character:FindFirstChild("HumanoidRootPart") then
		reverseChamsPlr(lllll11ll)
		pcall(function()
			local char = lllll11ll.Character
			local style = library_flags["chamsStyle"] or "Fill"
			local visColor = library_flags["chamsVisibleColor"] or library_flags["chamsColor"] or Color3.fromRGB(255, 255, 255)
			local wallColor = library_flags["chamsWallColor"] or library_flags["chamsColor2"] or Color3.fromRGB(255, 80, 80)
			local function optTrans(flag, default)
				local o = L_5_.options[flag]
				if o and type(o.trans) == "number" then return 1 - o.trans end
				return default
			end
			local visTrans = optTrans("chamsVisibleColor", 0.25)
			local wallTrans = optTrans("chamsWallColor", 0.25)
			local visibleOnly = library_flags["Visible Only ESP"]

			local materialStyles = { Neon = "Neon", ForceField = "ForceField", Glass = "Glass", Plastic = "SmoothPlastic" }
			local isMaterial = materialStyles[style] ~= nil

			if isMaterial then
				local mat = materialStyles[style]
				for _, part in next, char:GetDescendants() do
					if part:IsA("Accoutrement") then part:Destroy() end
				end
				for _, part in next, char:GetDescendants() do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						if part:GetAttribute("OrigMat") == nil then
							part:SetAttribute("OrigMat", part.Material.Name)
							part:SetAttribute("OrigColor", part.Color)
						end
						part.Material = Enum.Material[mat]
						part.Color = visibleOnly and visColor or wallColor
					end
				end
				return
			end

			local function fillT(base)
				if style == "Outline Only" then return 1
				elseif style == "Flat" then return 0
				elseif style == "Glow" then return math.max(base, 0.45)
				else return base end
			end
			local wallFill = fillT(wallTrans)
			local visFill = fillT(visTrans)

			for _, part in next, char:GetChildren() do
				if part:IsA("Accoutrement") then part:Destroy() end
			end
			for _, part in next, char:GetDescendants() do
				if part:IsA("BasePart") and table.find(CHAMS_BODYPARTS, part.Name) then
					if not (part:FindFirstChild("inner") or part:FindFirstChild("outer")) then
						local inner, outer
						if part.Name == "Head" then
							inner = Instance.new("CylinderHandleAdornment", part)
							outer = Instance.new("CylinderHandleAdornment", part)
							inner.CFrame = inner.CFrame * CFrame.Angles(math.rad(90), 0, 0)
							outer.CFrame = outer.CFrame * CFrame.Angles(math.rad(90), 0, 0)
							inner.Radius = 0.6; outer.Radius = 0.6
							inner.Height = 1.2; outer.Height = 1.2
						else
							inner = Instance.new("BoxHandleAdornment", part)
							outer = Instance.new("BoxHandleAdornment", part)
							inner.Size = part.Size + Vector3.new(0.05, 0.05, 0.05)
							outer.Size = part.Size + Vector3.new(0.05, 0.05, 0.05)
						end
						inner.Name = "inner"
						outer.Name = "outer"
						inner.Adornee = part
						outer.Adornee = part
						inner.Color3 = wallColor
						outer.Color3 = visColor
						inner.Transparency = wallFill
						outer.Transparency = visFill
						inner.AlwaysOnTop = true
						outer.AlwaysOnTop = true
						inner.ZIndex = 5
						outer.ZIndex = 6
						inner.Visible = not visibleOnly
						outer.Visible = false
					end
				end
			end
		end)
	end
end
;
local L_83_
local NoSpecLabel
do
	local L_82_ = Instance.new("ScreenGui")
	L_83_ = Instance.new("Frame")
	L_83_.Name = "SpectatorList"
	env.SpectatorList = L_83_
	local L_84_ = Instance.new("TextLabel")
	local L_85_ = Instance.new("Frame")
	local L_86_ = Instance.new("UIListLayout")
	L_82_.Enabled = true;
	L_82_.Parent = L_32_.PlayerGui;
	L_83_.Visible = false;
	L_83_.Parent = L_82_;
	L_83_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	L_83_.BackgroundTransparency = 0
	L_83_.BorderSizePixel = 0
	L_83_.Position = UDim2.new(0, 15, 0.45, 0)
	L_83_.Size = UDim2.new(0, 200, 0, 50)
	L_83_.ClipsDescendants = true
	local L_83_Corner = Instance.new("UICorner")
	L_83_Corner.CornerRadius = UDim.new(0, 3)
	L_83_Corner.Parent = L_83_
	local L_83_Stroke = Instance.new("UIStroke")
	L_83_Stroke.Thickness = 1
	L_83_Stroke.Color = Color3.fromRGB(65, 65, 65)
	L_83_Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	L_83_Stroke.Parent = L_83_
	local L_83_Extras = Instance.new("Folder")
	L_83_Extras.Name = "Extras"
	L_83_Extras.Parent = L_83_
	local L_83_OuterOutline = Instance.new("Frame")
	L_83_OuterOutline.Name = "Outline"
	L_83_OuterOutline.Size = UDim2.new(1, 2, 1, 2)
	L_83_OuterOutline.Position = UDim2.new(0, -1, 0, -1)
	L_83_OuterOutline.BackgroundTransparency = 1
	L_83_OuterOutline.ZIndex = L_83_.ZIndex - 1
	L_83_OuterOutline.Parent = L_83_Extras
	local L_83_OuterCorner = Instance.new("UICorner")
	L_83_OuterCorner.CornerRadius = UDim.new(0, 4)
	L_83_OuterCorner.Parent = L_83_OuterOutline
	local L_83_OuterStroke = Instance.new("UIStroke")
	L_83_OuterStroke.Thickness = 1
	L_83_OuterStroke.Color = Color3.new(0, 0, 0)
	L_83_OuterStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	L_83_OuterStroke.Parent = L_83_OuterOutline
	L_86_.Parent = L_83_
	L_86_.SortOrder = Enum.SortOrder.LayoutOrder
	L_86_.HorizontalAlignment = Enum.HorizontalAlignment.Left
	L_86_.Padding = UDim.new(0, 4)
	local SpecPadding = Instance.new("UIPadding")
	SpecPadding.PaddingTop = UDim.new(0, 8)
	SpecPadding.PaddingBottom = UDim.new(0, 8)
	SpecPadding.PaddingLeft = UDim.new(0, 11)
	SpecPadding.PaddingRight = UDim.new(0, 11)
	SpecPadding.Parent = L_83_
	L_84_.Parent = L_83_
	L_84_.BackgroundTransparency = 1
	L_84_.BorderSizePixel = 0
	L_84_.Size = UDim2.new(1, 0, 0, 13)
	L_84_.Font = Enum.Font.GothamBold
	L_84_.Text = "spectators"
	L_84_.TextColor3 = Color3.new(1, 1, 1)
	L_84_.TextSize = 13
	L_84_.TextXAlignment = Enum.TextXAlignment.Center
	L_84_.LayoutOrder = 1
	NoSpecLabel = Instance.new("TextLabel")
	NoSpecLabel.Name = "NoSpecLabel"
	NoSpecLabel.BackgroundTransparency = 1
	NoSpecLabel.Size = UDim2.new(1, 0, 0, 13)
	NoSpecLabel.Font = Enum.Font.GothamSemibold
	NoSpecLabel.Text = "no spectators"
	NoSpecLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
	NoSpecLabel.TextSize = 13
	NoSpecLabel.TextXAlignment = Enum.TextXAlignment.Left
	NoSpecLabel.LayoutOrder = 2
	NoSpecLabel.Parent = L_83_
	pcall(function() L_85_:Destroy() end)
end
function addSpectator(name)
	NoSpecLabel.Visible = false
	local container = Instance.new("Frame")
	container.Name = "SpecLabel"
	container.BackgroundTransparency = 1
	container.Size = UDim2.new(1, 0, 0, 14)
	container.LayoutOrder = 3
	container.Parent = L_83_
	local icon = Instance.new("ImageLabel")
	icon.BackgroundTransparency = 1
	icon.Size = UDim2.new(0, 14, 0, 14)
	icon.Position = UDim2.new(0, 0, 0.5, -7)
	icon.Image = ""
	icon.Parent = container
	task.spawn(function()
		local p = game:GetService("Players"):FindFirstChild(name)
		if p then
			pcall(function()
				local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
				if isReady then
					icon.Image = content
				end
			end)
		end
	end)
	local lbl = Instance.new("TextLabel")
	lbl.BackgroundTransparency = 1
	lbl.Size = UDim2.new(1, -20, 1, 0)
	lbl.Position = UDim2.new(0, 20, 0, 0)
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextColor3 = Color3.fromRGB(200, 200, 200)
	lbl.Text = name
	lbl.TextSize = 13
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = container
	local specCount = 0
	for _, child in L_83_:GetChildren() do
		if child.Name == "SpecLabel" then specCount = specCount + 1 end
	end
	L_83_.Size = UDim2.new(0, 200, 0, 30 + 18 * specCount)
end;
function removeSpectators()
	for _, child in next, L_83_:GetChildren() do
		if child.Name == "SpecLabel" then
			child:Destroy()
		end
	end
	NoSpecLabel.Visible = true
	L_83_.Size = UDim2.new(0, 200, 0, 50)
end;
L_87_ = Instance.new("Frame")
L_87_.Name = "KeybindsList"
env.KeybindsList = L_87_
L_88_ = Instance.new("TextLabel")
L_89_ = Instance.new("Frame")
L_90_ = Instance.new("UIListLayout")
L_87_.Visible = false;
function addBindtext() end;
L_91_ = {}
L_92_ = {}
L_93_ = {}
L_94_ = {
	{
		"TKnife_Stock"
	},
	{
		"CTKnife_Stock"
	}
}
L_95_ = {
	{
		"TGlove_Stock"
	},
	{
		"CTGlove_Stock"
	}
}
L_96_ = {}
pcall(function()
	for llll1ll, ll111l1l1ll in game.Players.LocalPlayer.PlayerGui.Client.Rarities:GetChildren() do
		table.insert(L_93_, {
			ll111l1l1ll.Name
		})
	end
end)
env.unlockInventory = false;
env.silentAimEnabled = false;
env.lastKnife = ""
env.lastGlove = ""
env.lastGloveSkin = ""
env.predictionValue = Vector3.new()
spawn(function()
	wait(3)
	local L_1217_ = game:GetService("Players")
	local L_1218_ = L_1217_.LocalPlayer;
	local L_1219_ = game:GetService("ReplicatedStorage")
	local L_1220_ = workspace.CurrentCamera;
	local L_1221_ = game:GetService("RunService")
	local L_1222_ = game:GetService("Debris")
	pingIntance = game.Stats.PerformanceStats.Ping;
	local L_1223_ = false;
	local L_1224_ = false;
	local L_1225_ = nil;
	local L_1226_ = {}
	local L_1227_ = env.library.flags;
	local L_1228_ = env.hitChams;
	local L_1229_ = env.decodePos;
	local L_1230_ = env.encodePos;
	local L_1231_ = env.hitlog;
	local L_1232_ = env.tracers;
	local L_1233_ = env.predictionValue;
	local L_1234_ = 1;
	local L_1235_ = 0;
	local L_1236_ = 0;
	local L_1237_ = false;
	local L_1238_ = nil;
	local L_1239_ = false;
	L_1221_.RenderStepped:Connect(function(lll1ll1ll1)
		L_1235_ = lll1ll1ll1;
		L_1236_ = pingIntance:GetValue()
		L_1234_ = env.damagemod;
		L_1226_ = env.oldPositions;
		L_1233_ = env.predictionValue;
		L_1237_ = env.holdE;
		L_1238_ = env.hookJP;
		L_1239_ = env.hookWS
	end)
	oldNewindex = hookmetamethod(game, "__newindex", function(l1111l1ll11, ll1111ll1l1l, l11l11)
		if l1111l1ll11.Name == "Crosshair" and ll1111ll1l1l == "Visible" and L_1227_["Force Crosshair"] then
			l11l11 = true
		end;
		if not checkcaller() and ll1111ll1l1l == "JumpPower" and l1111l1ll11:IsA("Humanoid") and L_1238_ ~= nil then
			l11l11 = L_1238_
		end;
        if not checkcaller() and (ll1111ll1l1l == "Text" or ll1111ll1l1l == "text") and (l1111l1ll11:IsA("TextLabel") or l1111l1ll11:IsA("TextBox")) then
            if library_flags["spoofName"] then
                local spoofName = library_flags["spoofedNameValue"]
                if spoofName and spoofName ~= "" then
                    if type(l11l11) == "string" then
                        if l11l11:find(L_1218_.Name) then
                            l11l11 = l11l11:gsub(L_1218_.Name, spoofName)
                        end
                        if L_1218_.DisplayName and l11l11:find(L_1218_.DisplayName) then
                            l11l11 = l11l11:gsub(L_1218_.DisplayName, spoofName)
                        end
                    end
                end
            end
        end
		return oldNewindex(l1111l1ll11, ll1111ll1l1l, l11l11)
	end)
	oldNamecall = hookmetamethod(game, "__namecall", function(llllll11ll1, ...)
		local L_1245_ = {
			...
		}
		local L_1246_ = getnamecallmethod()
		local L_1247_ = llllll11ll1.Name;
		
		if L_1247_ == "Hallooooooooooooo" or L_1247_ == "Boogers" then
			if L_1246_ == "FireServer" or L_1246_ == "FireUnreliable" or L_1246_ == "InvokeServer" then
				return nil
			end
		end
		if L_1247_ == "ParticleRemote" then
			if type(L_1245_[1]) == "table" and L_1245_[1][1] == "kick" then
				return
			end
		end
		if L_1246_ == "FireServer" and L_1247_ == "ApplyGun" then
			if library_flags["Inf Ammo"] then
				local ammoTable
				for _, obj in getgc(true) do
					if typeof(obj) == "table" and rawget(obj, "ammocount") ~= nil and rawget(obj, "ammocount2") ~= nil and rawget(obj, "ammocount3") ~= nil and rawget(obj, "ammocount4") ~= nil then
						ammoTable = obj
						break
					end
				end
				if ammoTable then
					ammoTable.ammocount = 9e99999
					ammoTable.ammocount2 = 9e99999
					ammoTable.ammocount3 = 9e99999
					ammoTable.ammocount4 = 9e99999
				end
			end
		end
		if L_1247_ == "ApplyGun" and type(L_1245_[1]) == "table" and L_1245_[1].Name then
			if string.find(L_1245_[1].Name, "Banana") or string.find(L_1245_[1].Name, "Flip") then
				local _replacement2 = L_1219_.Weapons[L_1218_.Status.Team.Value .. " Knife"]
				return oldNamecall(llllll11ll1, _replacement2, select(2, ...))
			end
		end
		if L_1246_ == "GetService" and L_1245_[1] == "clarity.tk" then
			local L_1248_ = {
				HitEvent = onHit,
				KillEvent = onKill,
				Chat = chat,
			}
function L_1248_:GetTabs()
				local L_1249_ = {
					Legit = L_5_.tabs[1],
					Visuals = L_5_.tabs[2],
					Misc = L_5_.tabs[3],
					Exploits = L_5_.tabs[4],
					Scripts = L_5_.tabs[5],
					Settings = L_5_.tabs[100]
				}
				return L_1249_
			end;
			return L_1248_
		end;
		if L_1246_ == "Kick" and llllll11ll1 == L_1218_ then
			return
		end;
		if env.CB_SilentDebug and L_25_:IsMouseButtonPressed(0) then
			if string.find(L_1246_, "FindPartOnRay") or L_1246_ == "Raycast" then
				warn("[clarity SilentDbg] " .. L_1246_ .. " @ " .. tostring(llllll11ll1))
			elseif L_1246_ == "FireServer" and (L_1247_ == "HitParl" or L_1247_ == "Whizz" or L_1247_ == "Trail" or L_1247_ == "ReplicateShot") then
				warn("[clarity SilentDbg] " .. L_1247_ .. " fired")
			end
		end
		if env.silentAimEnabled and env.target then
			if string.find(L_1246_, "FindPartOnRay") then
				local L_1252_, _, L_1250_ = buildSilentRay(env.target)
				if env.CB_SilentDebug then
					warn("[clarity Silent] redirect FindPartOnRay -> " .. env.target.Name)
				end
				CreateThread(function()
					L_1225_ = L_1250_;
					wait(0.3)
					L_1225_ = nil
				end)
				return oldNamecall(llllll11ll1, L_1252_, select(2, ...))
			end
			if L_1246_ == "Raycast" and llllll11ll1 == workspace then
				local origin, direction = L_1245_[1], L_1245_[2]
				if typeof(origin) == "Vector3" and typeof(direction) == "Vector3" then
					local _, rayOrigin, predicted = buildSilentRay(env.target)
					local mag = direction.Magnitude
					if mag < 0.001 then mag = 500 end
					if env.CB_SilentDebug then
						warn("[clarity Silent] redirect Raycast -> " .. env.target.Name)
					end
					return oldNamecall(llllll11ll1, rayOrigin, (predicted - rayOrigin).Unit * mag, select(3, ...))
				end
			end
		end;
		if L_1246_ == "FireServer" then
			if L_1247_ == "Updat1ePing" and L_1227_["Ping Spoof"] then
				return oldNamecall(llllll11ll1, math.random(100, 600) / 1000, select(2, ...))
			end;

			if L_1247_ == "RemoteEvent" and typeof(L_1245_[1]) == "table" then
				local block = L_1245_[1][1]
				if type(block) == "string" then
					local b = string.lower(block)
					if b == "kick" or b == "error" or b == "report" or b == "ban" or b == "detect" or b == "detected" or b == "flag" or b == "cheat" or b == "exploit" or b == "anticheat" or b == "ac" then
						return
					end
				end

			end
			if L_1247_ == "RemoteE65vent" and typeof(L_1245_[1]) == "table" and L_1245_[1][1] == "ki8ck" then
				return
			end;
			if L_1247_ == "FallDamage" and L_1227_["No Fall Damage"] then
				return
			end;
			if L_1247_ == "ohnoflames" and L_1227_["No Fire Damage"] then
				return
			end;
			if L_1247_ == "Trail" and L_1227_["Bullet Tracers"] then
				CreateThread(function()
					pcall(function()
						local startPos = L_1245_[1].Position
						local endPos = L_1245_[2]
						local color = L_1227_["tracerColor"] or Color3.fromRGB(150, 20, 60)
						local mode = L_1227_["Tracer Mode"] or "Beam"
						local texture = "446111271"
						local faceCamera = L_1227_["Beams Face Camera"] or false
						if mode == "Beam" then
							local att0 = Instance.new("Attachment")
							local att1 = Instance.new("Attachment")
							att0.WorldPosition = startPos
							att1.WorldPosition = endPos
							att0.Parent = workspace.Terrain
							att1.Parent = workspace.Terrain
							local beam = Instance.new("Beam")
							beam.Attachment0 = att0
							beam.Attachment1 = att1
							beam.Width0 = 0.15
							beam.Width1 = 0.15
							beam.Color = ColorSequence.new(color)
							beam.FaceCamera = faceCamera
							if texture and texture ~= "" then
								beam.Texture = "rbxassetid://" .. texture
							end
							beam.Parent = workspace.Terrain
							game:GetService("Debris"):AddItem(beam, 1)
							game:GetService("Debris"):AddItem(att0, 1)
							game:GetService("Debris"):AddItem(att1, 1)
						else
							local dist = (startPos - endPos).Magnitude
							local part = Instance.new("Part")
							part.Anchored = true
							part.CanCollide = false
							part.Size = Vector3.new(0.1, 0.1, dist)
							part.CFrame = CFrame.lookAt(startPos, endPos) * CFrame.new(0, 0, -dist / 2)
							part.Color = color
							part.Material = Enum.Material.Neon
							part.Parent = workspace.CurrentCamera
							game:GetService("Debris"):AddItem(part, 1)
						end
					end)
				end)
			end;
			if L_1247_ == "HitParl" and L_1227_["Hit Chams"] then
				CreateThread(function()
					pcall(function()
						local hitPart = L_1245_[1]
						local targetChar = nil
						if hitPart and hitPart.Parent and hitPart.Parent:FindFirstChildOfClass("Humanoid") then
							targetChar = hitPart.Parent
						elseif env.target then
							local tgt = env.target
							if typeof(tgt) == "Instance" then
								if tgt.Parent and tgt.Parent:FindFirstChildOfClass("Humanoid") then
									targetChar = tgt.Parent
								elseif tgt:FindFirstChildOfClass("Humanoid") then
									targetChar = tgt
								end
							end
						end
						if targetChar then
							local color = L_1227_["hitchamsColor"] or Color3.fromRGB(200, 30, 80)
							local container = Instance.new("Model")
							container.Name = "HitCham"
							local parts = {}
							for _, v in next, targetChar:GetChildren() do
								if v:IsA("BasePart") and v.Transparency ~= 1 then
									local p = Instance.new("Part")
									p.Size = v.Size
									p.CFrame = v.CFrame
									p.Color = color
									p.Material = Enum.Material.ForceField
									p.Transparency = 0.3
									p.Anchored = true
									p.CanCollide = false
									p.Parent = container
									parts[#parts + 1] = p
								end
							end
							container.Parent = workspace.CurrentCamera
							for _, p in next, parts do
								L_27_:Create(p, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}):Play()
							end
							L_31_:AddItem(container, 1.3)
						end
					end)
				end)
			end;
			if L_1245_[1] == L_1218_.UserId or string.find(tostring(L_1245_[1]), '{') then
				return
			end;
			if env.unlockInventory then
				if string.len(tostring(llllll11ll1)) == 38 then
					if not L_1223_ then
						L_1223_ = true;
						for ll11lllll1l, l1111l11l1ll in next, L_93_ do
							local L_1256_;
							for l111llll, ll1l1lll1 in next, L_1245_[1] do
								if l1111l11l1ll[1] == ll1l1lll1[1] then
									L_1256_ = true
								end
							end;
							if not L_1256_ then
								table.insert(L_1245_[1], l1111l11l1ll)
							end
						end
					end;
					return
				end;
				if L_1247_ == "DataEvent" and L_1245_[1][4] then
					local L_1259_ = string.split(L_1245_[1][4][1], "_")[2]
					local L_1260_ = L_1245_[1][3]
					if L_1245_[1][2] == "Both" then
						L_1218_["SkinFolder"]["CTFolder"][L_1260_].Value = L_1259_;
						L_1218_["SkinFolder"]["TFolder"][L_1260_].Value = L_1259_
					else
						L_1218_["SkinFolder"][L_1245_[1][2] .. "Folder"][L_1260_].Value = L_1259_
					end;
					spawn(function()
						if L_1245_[1][4] and L_1245_[1][5] and L_1245_[1][5][2] then
							if L_1245_[1][3] == "Knife" then
								env.lastKnife = L_1245_[1][4][1]
							elseif L_1245_[1][3] == "Glove" then
								env.lastGlove = L_1245_[1][4][1]
							end
						end
					end)
				end
			end;
			if L_1247_ == "HitParl" then
				local args = table.pack(...)
				local hitPart = args[1]
				if env.silentAimEnabled and env.target then
					args = applySilentHitParl(args)
					hitPart = args[1]
					if env.CB_SilentDebug then
						warn("[clarity Silent] redirect HitParl -> " .. tostring(env.target.Name))
					end
				end
				if library_flags["KillAllAuto"] then
					args[2] = {X = 0/0, Y = 0/0, Z = 0/0} 
				end
				if not hitPart or not hitPart.Parent then 
					return oldNamecall(llllll11ll1, unpack(args, 1, args.n)) 
				end
				spawn(function()
					pcall(function()
						local hp = L_1217_:FindFirstChild(hitPart.Parent.Name)
						if hp then
							local hitPlayer = L_1217_[hitPart.Parent.Name]
							pcall(function() onHit:Fire(hitPlayer, hitPart) end)
							if library_flags["Hitsound"] and teamCheck(hitPlayer, false) then
								local snd = Instance.new('Sound', workspace)
								local sndKey = library_flags["hitsoundValue"]
								local sndId = hitSounds[sndKey]
								if type(sndId) == "table" then
									sndId = sndId[math.random(1, #sndId)]
								end
								snd.SoundId = sndId or "rbxassetid://3124331820"
								snd.PlayOnRemove = true
								snd.Volume = library_flags["Hitsound Volume"] or 5
								snd:Destroy()
							end
						end
					end)
				end)
				return oldNamecall(llllll11ll1, unpack(args, 1, args.n))
			end
		end;
		if L_1246_ == "LoadAnimation" then
			if L_1227_["Slide Walk"] and (L_1245_[1].Name == "RunAnim" or L_1245_[1].Name == "JumpAnim") then
				return wait(387420489)
			end
		end;
		if L_1246_ == "SetPrimaryPartCFrame" or L_1246_ == "PivotTo" or L_1246_ == "pivotTo" then
			if L_1247_ ~= L_1218_.Name and env._tpActive then
				return oldNamecall(llllll11ll1, CFrame.new(0, 0, 0), select(2, ...))
			end
			if L_1247_ ~= L_1218_.Name and L_1227_["viewmodelEnabled"] then
				local L_1296_ = L_1245_[1]
				L_1296_ = L_1296_ * CFrame.new(L_1227_["viewmodelX"] / 10, L_1227_["viewmodelY"] / 10, - L_1227_["viewmodelZ"] / 10) * CFrame.Angles(0, 0, math.rad(L_1227_["viewmodelRoll"]))
				if L_1225_ and L_1227_["Visualize Silent Angles"] then
					L_1296_ = CFrame.new(L_1296_.p, L_1225_)
				end;
				return oldNamecall(llllll11ll1, L_1296_, select(2, ...))
			end
		end;
		if L_1247_ == "Filter" and L_1227_["Uncensor Chat"] then
			return L_1245_[1]
		end;
		return oldNamecall(llllll11ll1, ...)
	end)
end)
L_97_ = L_5_:AddTab"Legit"
L_98_ = L_97_:AddColumn()
L_99_ = L_97_:AddColumn()
L_100_ = false;
masterSec = L_98_:AddSection("master")
masterSec:AddToggle({
	text = "enable aimbot",
	flag = "aimbotEnabled"
}):AddBind({
	key = "MouseButton1",
	mode = "hold",
	flag = "assistBind",
	callback = function()
		if library_flags["aimbotEnabled"] and not L_5_.open then
			L_100_ = true;
			if L_57_.alive then
				local L_1289_ = L_32_.Character.Humanoid:GetState()
				if L_1289_ == Enum.HumanoidStateType.Freefall and library_flags["legitFilterAir"] then
					return
				end;
				if L_32_.PlayerGui.Blnd.Blind.Transparency <= 0.6 then
					return
				end;
				local L_1290_, L_1291_ = getNearest(L_57_.FOV or 0, L_38_, library_flags["legitVisOnly"])
				if L_1290_ and L_1291_ > (L_57_.deadzone or 0) * 2.3 then
					local L_1292_, L_1293_ = L_34_:WorldToScreenPoint(L_57_.baim and L_1290_.Character.PrimaryPart.Position or L_1290_.Character.Head.Position)
					if L_1293_ then
						local sm = L_57_.smoothness or 1
						if sm < 1 then sm = 1 end
						local L_1294_, L_1295_ = - ((L_33_.X - L_1292_.X) / sm), - ((L_33_.Y - L_1292_.Y) / sm)
						mousemoverel(L_1294_, L_1295_)
					end
				end
			end
		end
	end
})
masterSec:AddList({
	text = "weapon",
	values = {
		"Rifles",
		"Scout",
		"AWP",
		"Heavy Pistols",
		"Pistols",
		"SMG",
		"Other"
	},
	max = 10,
	callback = function(L_1298_arg0)
		rifles2.main.Visible = L_1298_arg0 == "Rifles"
		scout2.main.Visible = L_1298_arg0 == "Scout"
		awp2.main.Visible = L_1298_arg0 == "AWP"
		heavyp2.main.Visible = L_1298_arg0 == "Heavy Pistols"
		pistols2.main.Visible = L_1298_arg0 == "Pistols"
		smg.main.Visible = L_1298_arg0 == "SMG"
		other2.main.Visible = L_1298_arg0 == "Other"
	end
})
checksSec = L_98_:AddSection("checks & filters")
checksSec:AddToggle({
	text = "Visible Only",
	flag = "legitVisOnly"
})
checksSec:AddToggle({
	text = "Jump Check",
    flag = "Jump Check"
})
checksSec:AddToggle({
	text = "Flash Check",
    flag = "Flash Check"
})
L_102_ = false;
checksSec:AddBind({
	text = "Triggerbot Keybind",
	key = Enum.KeyCode.LeftAlt,
	mode = "hold",
	callback = function(L_1297_arg0)
		L_102_ = not L_1297_arg0
	end
})
generalSec = L_98_:AddSection("other")
generalSec:AddToggle({
	text = "friendly fire",
	flag = "legitteam",
	callback = function(v)
		L_38_ = v
	end
})
generalSec:AddToggle({
	text = "Magnet Triggerbot"
})
generalSec:AddToggle({
	text = "Auto Pistol",
	callback = function()
		for _, wep in next, L_24_.Weapons:GetChildren() do
			if wep:FindFirstChild("Secondary") and wep.Name ~= "CZ" then
				wep.Auto.Value = library_flags["Auto Pistol"]
			end
		end
	end
})
rifles2 = L_99_:AddSection"Rifles"
scout2 = L_99_:AddSection"Scout"
awp2 = L_99_:AddSection"AWP"
heavyp2 = L_99_:AddSection"Heavy Pistols"
pistols2 = L_99_:AddSection"Pistols"
smg = L_99_:AddSection"SMG"
other2 = L_99_:AddSection"Other"
rifles2:AddToggle({ text = "Triggerbot", flag = "riflesTrigger" })
rifles2:AddToggle({ text = "Body Aim", flag = "riflesBaim" })
rifles2:AddToggle({ text = "Silent Aim", flag = "riflesSilentAim" })
rifles2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "riflesFOV" })
rifles2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "riflesSilentFOV" })
rifles2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "riflesDeadzone" })
rifles2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "riflesSmoothness" })
rifles2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "riflesTriggerDelay" })
rifles2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "riflesHitchance" })
rifles2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "riflesClosestHitbox" })
scout2:AddToggle({ text = "Triggerbot", flag = "scoutTrigger" })
scout2:AddToggle({ text = "Body Aim", flag = "scoutBaim" })
scout2:AddToggle({ text = "Silent Aim", flag = "scoutSilentAim" })
scout2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "scoutFOV" })
scout2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "scoutSilentFOV" })
scout2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "scoutDeadzone" })
scout2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "scoutSmoothness" })
scout2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "scoutTriggerDelay" })
scout2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "scoutHitchance" })
scout2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "scoutClosestHitbox" })
awp2:AddToggle({ text = "Triggerbot", flag = "awpTrigger" })
awp2:AddToggle({ text = "Body Aim", flag = "awpBaim" })
awp2:AddToggle({ text = "Silent Aim", flag = "awpSilentAim" })
awp2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "awpFOV" })
awp2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "awpSilentFOV" })
awp2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "awpDeadzone" })
awp2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "awpSmoothness" })
awp2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "awpTriggerDelay" })
awp2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "awpHitchance" })
awp2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "awpClosestHitbox" })
heavyp2:AddToggle({ text = "Triggerbot", flag = "heavypTrigger" })
heavyp2:AddToggle({ text = "Body Aim", flag = "heavypBaim" })
heavyp2:AddToggle({ text = "Silent Aim", flag = "heavypSilentAim" })
heavyp2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "heavypFOV" })
heavyp2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "heavypSilentFOV" })
heavyp2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "heavypDeadzone" })
heavyp2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "heavypSmoothness" })
heavyp2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "heavypTriggerDelay" })
heavyp2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "heavypHitchance" })
heavyp2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "heavypClosestHitbox" })
pistols2:AddToggle({ text = "Triggerbot", flag = "pistolTrigger" })
pistols2:AddToggle({ text = "Body Aim", flag = "pistolBaim" })
pistols2:AddToggle({ text = "Silent Aim", flag = "pistolSilentAim" })
pistols2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "pistolFOV" })
pistols2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "pistolSilentFOV" })
pistols2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "pistolDeadzone" })
pistols2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "pistolSmoothness" })
pistols2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "pistolTriggerDelay" })
pistols2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "pistolHitchance" })
pistols2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "pistolClosestHitbox" })
smg:AddToggle({ text = "Triggerbot", flag = "smgTrigger" })
smg:AddToggle({ text = "Body Aim", flag = "smgBaim" })
smg:AddToggle({ text = "Silent Aim", flag = "smgSilentAim" })
smg:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "smgFOV" })
smg:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "smgSilentFOV" })
smg:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "smgDeadzone" })
smg:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "smgSmoothness" })
smg:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "smgTriggerDelay" })
smg:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "smgHitchance" })
smg:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "smgClosestHitbox" })
other2:AddToggle({ text = "Triggerbot", flag = "otherTrigger" })
other2:AddToggle({ text = "Body Aim", flag = "otherBaim" })
other2:AddToggle({ text = "Silent Aim", flag = "otherSilentAim" })
other2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "otherFOV" })
other2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "otherSilentFOV" })
other2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "otherDeadzone" })
other2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "otherSmoothness" })
other2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "otherTriggerDelay" })
other2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "otherHitchance" })
other2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "otherClosestHitbox" })
visualsTab = L_5_:AddTab"Visuals"
visualsEntities = visualsTab:AddSubTab("Entities")
visualsGame = visualsTab:AddSubTab("Game")
visualsScreen = visualsTab:AddSubTab("Screen")
visualsColumn = visualsEntities:AddColumn()
visualsColumn2 = visualsEntities:AddColumn()
visualsMaster = visualsColumn:AddSection"Master"
visualsMaster:AddToggle({
	text = "Enabled",
	flag = "espEnabled"
})
visualsMaster:AddToggle({
	text = "Teammates",
	flag = "visualsteam",
	callback = function(l1l111l1lll)
		L_39_ = l1l111l1lll;
		if cbCHAMS then cbCHAMS() end
	end
})
visualsMaster:AddToggle({
	text = "Visible Only",
	flag = "Visible Only ESP",
	callback = function() if cbCHAMS then cbCHAMS() end end
})
visualsChams = visualsColumn:AddSection"Chams"
env.__chamsRefresh = function()
	if library_flags["espEnabled"] and library_flags["Chams"] then
		for _, plr in next, L_30_:GetPlayers() do
			if plr.Character then chamsPlr(plr) end
		end
	else
		for _, plr in next, L_30_:GetPlayers() do
			if plr.Character then reverseChamsPlr(plr) end
		end
	end
end
--yo i catch you because u want search up vibecode!!!!
game:GetService("RunService").RenderStepped:Connect(function()
	if not (library_flags["espEnabled"] and library_flags["Chams"]) then return end
	local visibleOnly = library_flags["Visible Only ESP"]
	local cam = workspace.CurrentCamera
	if not cam then return end
	local camPos = cam.CFrame.Position
	for _, plr in next, L_30_:GetPlayers() do
		local char = plr ~= L_32_ and plr.Character
		if char then
			local hum = char:FindFirstChild("Humanoid")
			if hum and hum.Health <= 0 then
				reverseChamsPlr(plr)
				continue
			end
			local hrp = char:FindFirstChild("HumanoidRootPart")
			local head = char:FindFirstChild("Head")
			local params = RaycastParams.new()
			params.FilterType = Enum.RaycastFilterType.Exclude
			params.FilterDescendantsInstances = {L_32_.Character, char, cam}
			
			local seen = false
			if hrp then
				local dir = (hrp.Position - camPos)
				local hit = workspace:Raycast(camPos, dir, params)
				if hit == nil or hit.Instance:IsDescendantOf(char) then seen = true end
			end
			if not seen and head then
				local dir = (head.Position - camPos)
				local hit = workspace:Raycast(camPos, dir, params)
				if hit == nil or hit.Instance:IsDescendantOf(char) then seen = true end
			end

			for _, part in next, char:GetDescendants() do
				if part.Name == "inner" and part:IsA("HandleAdornment") then
					part.Visible = (not seen) and (not visibleOnly)
				elseif part.Name == "outer" and part:IsA("HandleAdornment") then
					part.Visible = seen
				end
			end
		end
	end
end)
visualsChams:AddToggle({
	text = "Chams",
	flag = "Chams",
	callback = env.__chamsRefresh
}):AddColor({
	color = Color3.fromRGB(255, 255, 255),
	flag = "chamsVisibleColor",
	trans = 0.6,
	callback = env.__chamsRefresh,
	calltrans = env.__chamsRefresh
})
L_5_.options["Chams"]:AddColor({
	color = Color3.fromRGB(255, 80, 80),
	flag = "chamsWallColor",
	trans = 0.6,
	callback = env.__chamsRefresh,
	calltrans = env.__chamsRefresh
})
L_5_.options["Chams"]:AddList({
	text = "Chams Style",
	flag = "chamsStyle",
	values = {
		"Fill",
		"Outline Only",
		"Glow",
		"Flat",
		"Neon",
		"ForceField",
		"Glass",
		"Plastic"
	},
	value = "Fill",
	callback = env.__chamsRefresh
})
visualsChams:AddToggle({
	text = "Chams Outline",
	flag = "Chams Outline",
	callback = env.__chamsRefresh
}):AddColor({
	color = Color3.fromRGB(255, 255, 255),
	flag = "chamsVisibleOutlineColor",
	trans = 1,
	callback = env.__chamsRefresh,
	calltrans = env.__chamsRefresh
})
L_5_.options["Chams Outline"]:AddColor({
	color = Color3.fromRGB(255, 80, 80),
	flag = "chamsWallOutlineColor",
	trans = 1,
	callback = env.__chamsRefresh,
	calltrans = env.__chamsRefresh
})
cbCHAMS = env.__chamsRefresh;
L_5_.options["espEnabled"].callback = cbCHAMS;
visualsChams:AddToggle({
	text = "Hit Chams",
	flag = "Hit Chams"
}):AddColor({
	color = Color3.fromRGB(200, 30, 80),
	flag = "hitchamsColor"
})
visualsGlow = visualsColumn:AddSection"Glow"
visualsGlow:AddToggle({
	text = "Outline"
})
visualsGameCol2 = visualsGame:AddColumn()
visualsMisc = visualsGameCol2:AddSection"Bullet Tracers"
visualsMisc:AddToggle({
	text = "Beams Face Camera"
})
visualsMisc:AddToggle({
	text = "Bullet Tracers"
}):AddColor({
	color = Color3.fromRGB(150, 20, 60),
	trans = 1,
	flag = "tracerColor"
})
visualsMisc:AddList({
	text = "Tracer Mode",
	values = {
		"Part",
		"Beam"
	},
	value = "Beam"
})
visualsMisc:AddList({
	text = "Tracer Texture",
	flag = "tracerTexture",
	values = {
		"Solid",
		"Lightning",
		"Laser",
		"Twisted Energy",
		"Anime Lazer",
		"Arrow",
		"Minecraft",
		"Alien Energy Ray",
		"Energy Ray",
		"Matrix",
		"Cartoony Eletric"
	},
	value = "Solid"
})
miscColorsSection = visualsGameCol2:AddSection"Misc Colors"
miscColorsSection:AddToggle({
	text = "Molotov Color Changer",
	flag = "molotovColorChanger"
}):AddColor({
	color = Color3.fromRGB(0, 200, 255),
	flag = "molotovColor"
})
miscColorsSection:AddToggle({
	text = "Smoke Color Changer",
	flag = "smokeColorChanger"
}):AddColor({
	color = Color3.fromRGB(0, 255, 100),
	flag = "smokeColor"
})
miscColorsSection:AddToggle({
	text = "Blood Color Changer",
	flag = "bloodColorChanger"
}):AddColor({
	color = Color3.fromRGB(255, 0, 0),
	flag = "bloodColor"
})
do
	local fireKeywords = {"fire", "flame", "burn", "inferno", "molotov", "incendiary"}
	local function isFireParticle(inst)
		local name = inst.Name:lower()
		for _, kw in fireKeywords do
			if name:find(kw) then return true end
		end
		if inst.Parent then
			local pname = inst.Parent.Name:lower()
			for _, kw in fireKeywords do
				if pname:find(kw) then return true end
			end
		end
		return false
	end
	local function recolorFire(inst)
		if not library_flags["molotovColorChanger"] then return end
		local col = library_flags["molotovColor"]
		if not col then return end
		if inst:IsA("ParticleEmitter") and isFireParticle(inst) then
			pcall(function() inst.Color = ColorSequence.new(col) end)
		elseif inst:IsA("PointLight") and isFireParticle(inst) then
			pcall(function() inst.Color = col end)
		elseif inst:IsA("Fire") then
			pcall(function() inst.Color = col; inst.SecondaryColor = col end)
		end
	end
	local function isSmokeParticle(inst)
		local cur = inst
		while cur and cur ~= workspace do
			local name = cur.Name:lower()
			if name == "smokes" or name:find("smoke") then return true end
			cur = cur.Parent
		end
		return false
	end
	local function recolorSmoke(inst)
		if not library_flags["smokeColorChanger"] then return end
		local col = library_flags["smokeColor"]
		if not col then return end
		if isSmokeParticle(inst) then
			if inst:IsA("ParticleEmitter") then
				pcall(function() inst.Color = ColorSequence.new(col) end)
			elseif inst:IsA("BasePart") then
				pcall(function() inst.Color = col end)
			end
		end
	end
	local function isBlood(inst)
		local name = inst.Name:lower()
		return name:find("blood") ~= nil
	end
	local function recolorBlood(inst)
		if not library_flags["bloodColorChanger"] then return end
		local col = library_flags["bloodColor"]
		if not col then return end
		if isBlood(inst) then
			if inst:IsA("ParticleEmitter") then
				pcall(function() inst.Color = ColorSequence.new(col) end)
			elseif inst:IsA("Decal") then
				pcall(function() inst.Color3 = col end)
			elseif inst:IsA("BasePart") then
				pcall(function() inst.Color = col end)
			end
		end
	end
	workspace.DescendantAdded:Connect(function(inst)
		task.defer(function()
			if library_flags["molotovColorChanger"] then recolorFire(inst) end
			if library_flags["smokeColorChanger"] then recolorSmoke(inst) end
			if library_flags["bloodColorChanger"] then recolorBlood(inst) end
		end)
	end)
	task.spawn(function()
		while task.wait(3) do
			pcall(function()
				local debris = workspace:FindFirstChild("Debris")
				local rayIgnore = workspace:FindFirstChild("Ray_Ignore")
				local function scanContainer(container)
					if not container then return end
					for _, desc in next, container:GetDescendants() do
						if library_flags["molotovColorChanger"] and (desc:IsA("ParticleEmitter") or desc:IsA("Fire") or desc:IsA("PointLight")) then
							recolorFire(desc)
						end
						if library_flags["smokeColorChanger"] and (desc:IsA("ParticleEmitter") or desc:IsA("BasePart")) then
							recolorSmoke(desc)
						end
						if library_flags["bloodColorChanger"] and (desc:IsA("ParticleEmitter") or desc:IsA("BasePart") or desc:IsA("Decal")) then
							recolorBlood(desc)
						end
					end
				end
				scanContainer(debris)
				scanContainer(rayIgnore)
			end)
		end
	end)
end
visualsESP = visualsColumn2:AddSection"ESP"
visualsESP:AddToggle({
	text = "Box ESP"
}):AddColor({
	color = Color3.fromRGB(255, 255, 255),
	flag = "boxESPcolor"
})
visualsESP:AddToggle({
	text = "Box Fill",
	flag = "Box Fill"
}):AddColor({
	color = Color3.fromRGB(255, 255, 255),
	trans = 0.5,
	flag = "boxFillColor"
})
visualsESP:AddToggle({
	text = "Skeleton ESP"
}):AddColor({
	color = Color3.fromRGB(255, 255, 255),
	flag = "skeletonColor"
})
visualsESP:AddToggle({
	text = "Name ESP"
}):AddColor({
	color = Color3.fromRGB(255, 255, 255),
	flag = "nameESPcolor"
})
visualsESP:AddToggle({
	text = "Weapon ESP"
}):AddColor({
	color = Color3.fromRGB(255, 255, 255),
	flag = "weaponESPcolor"
})
visualsESP:AddToggle({
	text = "Flags ESP",
	flag = "Flags ESP",
	tip = "shows readable enemy states on the right side of the player"
}):AddColor({
	color = Color3.fromRGB(255, 255, 255),
	flag = "flagsESPcolor"
})
L_5_.options["Flags ESP"]:AddList({
	text = "Flags",
	flag = "flagsList",
	multiselect = true,
	value = {
		["Armored"] = true,
		["Unarmored"] = true,
		["Helmet"] = true,
		["Defuser"] = true,
		["Bomb"] = true,
		["Scoped"] = true,
		["Planting"] = true,
		["Slowed"] = true
	},
	values = {
		"Armored",
		"Unarmored",
		"Helmet",
		"Defuser",
		"Bomb",
		"Scoped",
		"Planting",
		"Slowed"
	}
})
visualsESP:AddToggle({
	text = "Armor ESP",
	flag = "Armor ESP"
})
visualsESP:AddToggle({
	text = "Health Bar"
}):AddColor({
	color = Color3.fromRGB(0, 255, 0),
	flag = "healthBar"
})
visualsESP:AddToggle({
	text = "Gradient Health Bar",
	flag = "Gradient Health Bar",
	tip = "fades the health bar from full color to low-health color"
}):AddColor({
	color = Color3.fromRGB(255, 0, 0),
	flag = "healthBarLow"
})
visualsESP:AddToggle({
	text = "Health Number",
	flag = "Health Number",
	tip = "shows numeric HP next to the health bar"
})
visualsESP:AddToggle({
	text = "Armor Bar"
}):AddColor({
	color = Color3.fromRGB(0, 100, 255),
	flag = "armorBarColor"
})
visualsESP:AddToggle({
	text = "Tracers"
}):AddColor({
	color = Color3.fromRGB(0, 0, 0),
	flag = "tracersColor"
})
visualsESP:AddList({
	text = "Font",
	values = {
		"UI",
		"System",
		"Plex",
		"Monospace"
	}
})
visualsESP:AddList({
	text = "Text Mode",
	values = {
		"Normal",
		"Upper",
		"Lower"
	}
})
visualsLocal = visualsColumn2:AddSection"Local"
removeUIElementsCallback = function(l111ll1l1l1)
		local TARGET_GUIS = {
			"Game", "GUI", "HUDShading", "CBScoreboard", 
			"SmokeGUI", "Performance", "Objective", "Crates", 
			"NewItem", "BanBoi", "Blnd", "Winner", "RoundWin", 
			"WinGui", "RoundEnd", "Win"
		}
local function clearOriginalState()
			local conns = env.HUD_Connections
			if conns then
				for i, data in conns do
					if data.Connection then data.Connection:Disconnect() end
					if data.PropConns then
						for _, pConn in data.PropConns do pConn:Disconnect() end
					end
				end
			end
			env.HUD_Connections = nil
			env.HUD_OriginalState = nil
		end
local function hideObject(instance)
			if not instance or (not instance:IsA("GuiObject") and not instance:IsA("UIStroke")) then return end
			if instance:IsA("ScreenGui") then return end
			local whitelist = {"BuyMenu", "Crosshair", "Crosshairs", "SuitZoom", "Scope", "Cursor", "Reticle"}
			for _, name in whitelist do
				if instance.Name == name or instance:FindFirstAncestor(name) then return end
			end
			local cache = env.HUD_OriginalState or {}
			env.HUD_OriginalState = cache
			if not cache[instance] then
				local state = {
					Visible = instance:IsA("GuiObject") and instance.Visible or nil,
					BackgroundTransparency = instance:IsA("GuiObject") and instance.BackgroundTransparency or nil,
					BorderSizePixel = instance:IsA("GuiObject") and instance.BorderSizePixel or nil,
				}
				if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
					state.ImageTransparency = instance.ImageTransparency
				elseif instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
					state.TextTransparency = instance.TextTransparency
				elseif instance:IsA("UIStroke") then
					state.Transparency = instance.Transparency
					state.Enabled = instance.Enabled
				end
				cache[instance] = state
			end
			local propConns = {}
local function applyHidden()
				if instance:IsA("GuiObject") then
					instance.Visible = false
					instance.BackgroundTransparency = 1
					instance.BorderSizePixel = 0
					if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
						instance.ImageTransparency = 1
					elseif instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
						instance.TextTransparency = 1
					end
				elseif instance:IsA("UIStroke") then
					instance.Enabled = false
					instance.Transparency = 1
				end
			end
			applyHidden()
			if instance:IsA("GuiObject") then
				table.insert(propConns, instance:GetPropertyChangedSignal("Visible"):Connect(applyHidden))
				table.insert(propConns, instance:GetPropertyChangedSignal("BackgroundTransparency"):Connect(applyHidden))
				if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
					table.insert(propConns, instance:GetPropertyChangedSignal("ImageTransparency"):Connect(applyHidden))
				elseif instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
					table.insert(propConns, instance:GetPropertyChangedSignal("TextTransparency"):Connect(applyHidden))
				end
			elseif instance:IsA("UIStroke") then
				table.insert(propConns, instance:GetPropertyChangedSignal("Enabled"):Connect(applyHidden))
				table.insert(propConns, instance:GetPropertyChangedSignal("Transparency"):Connect(applyHidden))
			end
			local conns = env.HUD_Connections or {}
			env.HUD_Connections = conns
			conns[instance] = {PropConns = propConns}
		end
local function recursiveHide(parent)
			hideObject(parent)
			for _, child in parent:GetChildren() do
				if child.Name == "BuyMenu" then continue end
				recursiveHide(child)
			end
		end
		if l111ll1l1l1 then
			clearOriginalState()
			env.HUD_OriginalState = {}
			env.HUD_Connections = {}
local function processGui(gui)
				recursiveHide(gui)
				local conn = gui.DescendantAdded:Connect(function(child)
					hideObject(child)
				end)
				env.HUD_Connections[gui] = env.HUD_Connections[gui] or {}
				env.HUD_Connections[gui].Connection = conn
			end
			for _, name in TARGET_GUIS do
				local g = L_32_.PlayerGui:FindFirstChild(name)
				if g and g:IsA("ScreenGui") then
					processGui(g)
				end
			end
			local mainConn = L_32_.PlayerGui.ChildAdded:Connect(function(child)
				for _, name in TARGET_GUIS do
					if child.Name == name and child:IsA("ScreenGui") then
						processGui(child)
					end
				end
			end)
			env.HUD_Connections["Main"] = {Connection = mainConn}
		else
			local cache = env.HUD_OriginalState
			if cache then
				for inst, state in cache do
					if inst and inst.Parent then
						if inst:IsA("GuiObject") then
							inst.Visible = state.Visible
							inst.BackgroundTransparency = state.BackgroundTransparency
							inst.BorderSizePixel = state.BorderSizePixel
							if state.ImageTransparency then inst.ImageTransparency = state.ImageTransparency end
							if state.TextTransparency then inst.TextTransparency = state.TextTransparency end
						elseif inst:IsA("UIStroke") then
							inst.Enabled = state.Enabled
							inst.Transparency = state.Transparency
						end
					end
				end
			end
			clearOriginalState()
		end
	end
removeFlashCallback = function(l11l1l)
	pcall(function()
		L_32_.PlayerGui.Blnd.Blind.Visible = not l11l1l
	end)
end
L_113_ = Drawing.new("Circle")
L_114_ = Drawing.new("Circle")
L_113_.Color = Color3.new(1, 1, 1)
L_113_.Thickness = 0.05;
L_113_.NumSides = 100;
L_113_.Radius = 100;
L_113_.Visible = false;
L_113_.Filled = false;
L_114_.Color = Color3.new(1, 1, 1)
L_114_.Thickness = 0.05;
L_114_.NumSides = 100;
L_114_.Radius = 100;
L_114_.Visible = false;
L_114_.Filled = false;
visualsGlow:AddToggle({
	text = "Self Chams",
	callback = selfChams
}):AddColor({
	flag = "selfChamsColor",
	trans = 1,
	color = Color3.new(1, 1, 1),
	callback = selfChams,
	calltrans = selfChams
})
L_5_.options["Self Chams"]:AddList({
	flag = "selfChamsMaterial",
	callback = selfChams,
	values = {
		"SmoothPlastic",
		"ForceField"
	}
})
visualsGlow:AddToggle({
	text = "Weapon Chams",
	callback = updateViewModelVisuals
}):AddColor({
	flag = "weaponColor",
	trans = 1,
	color = Color3.new(1, 1, 1),
	callback = updateViewModelVisuals,
	calltrans = updateViewModelVisuals
})
L_5_.options["Weapon Chams"]:AddList({
	flag = "weaponMaterial",
	values = {
		"SmoothPlastic",
		"ForceField",
		"Neon",
		"Glass"
	},
	callback = updateViewModelVisuals
})
visualsGlow:AddToggle({
	text = "Arm Chams",
	callback = updateViewModelVisuals
}):AddColor({
	flag = "armColor",
	trans = 1,
	color = Color3.new(1, 1, 1),
	callback = updateViewModelVisuals,
	calltrans = updateViewModelVisuals
})
L_5_.options["Arm Chams"]:AddList({
	flag = "armMaterial",
	values = {
		"SmoothPlastic",
		"ForceField",
		"Glass"
	},
	callback = updateViewModelVisuals
})
visualsGlow:AddSlider({
	text = "Weapon Reflectance",
	flag = "weaponReflectance",
	max = 100,
	callback = updateViewModelVisuals
})
visualsLocal:AddToggle({
	text = "Grenade Predictor",
	flag = "grenadePredictor"
}):AddColor({
	color = Color3.fromRGB(255, 50, 50),
	flag = "grenadeColor"
})
visualsLocal:AddToggle({
	text = "Custom Crosshair",
	flag = "customCrosshair"
}):AddColor({
	color = Color3.fromRGB(0, 255, 0),
	flag = "crosshairColor"
})
visualsLocal:AddSlider({
	text = "Crosshair Size", flag = "crSize", value = 8, min = 2, max = 20
})
visualsLocal:AddSlider({
	text = "Crosshair Gap", flag = "crGap", value = 4, min = 0, max = 20
})
visualsLocal:AddSlider({
	text = "Crosshair Thickness", flag = "crThickness", value = 1, min = 1, max = 5
})
visualsLocal:AddToggle({
	text = "Crosshair Spin", flag = "crSpin"
})
crosshairLines = {}
for i = 1, 4 do
	local l = Drawing.new("Line")
	l.Visible = false
	l.Color = Color3.new(0, 1, 0)
	l.Thickness = 1
	l.Transparency = 1
	table.insert(crosshairLines, l)
end
crAngle = 0
game:GetService("RunService").RenderStepped:Connect(function()
	local enabled = library_flags["customCrosshair"]
	if not enabled then
		for _, l in crosshairLines do l.Visible = false end
		return
	end
	local center = workspace.CurrentCamera.ViewportSize / 2
	local size = library_flags["crSize"] or 8
	local gap = library_flags["crGap"] or 4
	local thick = library_flags["crThickness"] or 1
	local col = library_flags["crosshairColor"] or Color3.new(0,1,0)
	local isSpin = library_flags["crSpin"]
	if isSpin then
		crAngle = crAngle + 2
		if crAngle > 360 then crAngle = 0 end
	else
		crAngle = 0
	end
	local rad = math.rad(crAngle)
	local cosA, sinA = math.cos(rad), math.sin(rad)
	local function rotate(x, y) return Vector2.new(x * cosA - y * sinA, x * sinA + y * cosA) end
	local dirs = {Vector2.new(0, -1), Vector2.new(0, 1), Vector2.new(-1, 0), Vector2.new(1, 0)}
	for i = 1, 4 do
		local l = crosshairLines[i]
		l.Visible = true
		l.Color = col
		l.Thickness = thick
		local dir = rotate(dirs[i].X, dirs[i].Y)
		l.From = center + (dir * gap)
		l.To = center + (dir * (gap + size))
	end
end)
L_24_.Particles.Light.Range = 0;
local function GetLightingEffect(classname)
	local expectedParent = workspace.CurrentCamera
	if classname == "Atmosphere" or classname == "Sky" or classname == "Clouds" then
		expectedParent = game:GetService("Lighting")
	end
	local eff = expectedParent:FindFirstChildOfClass(classname)
	if not eff then
		eff = Instance.new(classname, expectedParent)
		pcall(function() eff.Enabled = false end)
		if classname == "Atmosphere" then
			pcall(function() eff.Density = 0 end)
		end
	end
	return eff
end
worldCol1 = visualsGame:AddColumn()
worldCol2 = visualsGame:AddColumn()
lightingSection = worldCol1:AddSection"Lighting"
fogSection = worldCol1:AddSection"Fog"
skySection = worldCol1:AddSection"Sky"
bloomSection = worldCol1:AddSection"Bloom"
atmosphereSection = worldCol2:AddSection"Atmosphere"
terrainSection = worldCol2:AddSection"Terrain"
dofSection = worldCol2:AddSection"Depth of Field"
sunRaysSection = worldCol2:AddSection"Sun Rays"
uiLoaded = false
task.spawn(function()
	task.wait(1.5)
	uiLoaded = true
end)
lightingSection:AddToggle({
	text = "Better Shadows",
	callback = function()
		if not uiLoaded then return end
		sethiddenproperty(game:GetService("Lighting"), "Technology", library_flags["Better Shadows"] and Enum.Technology.Future or Enum.Technology.Compatibility)
	end
})
lightingSection:AddToggle({
	text = "Enabled Ambient",
	callback = function(v)
		if not uiLoaded then return end
		game:GetService("Lighting").Ambient = v and library_flags["ambientColor"] or Color3.fromRGB(0, 0, 0)
	end
}):AddColor({
	flag = "ambientColor",
	color = Color3.fromRGB(128, 128, 128),
	callback = function(c) if not uiLoaded then return end if library_flags["Enabled Ambient"] then game:GetService("Lighting").Ambient = c end end
})
lightingSection:AddSlider({
	text = "Brightness",
	min = 0,
	max = 10,
	float = 0.1,
	value = 2.5,
	callback = function(v) if not uiLoaded then return end game:GetService("Lighting").Brightness = v end
})
lightingSection:AddToggle({
	text = "Gradient"
}):AddColor({
	flag = "gradientColor",
	color = Color3.fromRGB(90, 90, 90)
})
L_5_.options["Gradient"]:AddColor({
	flag = "gradientColor2",
	color = Color3.fromRGB(150, 150, 150)
})
lightingSection:AddToggle({
	text = "Grenade Area"
}):AddColor({
	flag = "areaColor",
	color = Color3.fromRGB(150, 20, 75)
})
lightingSection:AddToggle({
	text = "Saturation"
}):AddSlider({
	min = 0,
	max = 100,
	value = 10,
	flag = "saturationValue"
})
fogSection:AddToggle({
	text = "Fog Changer",
	callback = function(v)
		if not uiLoaded then return end
		pcall(function()
			if v then
				game:GetService("Lighting").FogStart = library_flags["fogStart"]
				game:GetService("Lighting").FogEnd = library_flags["fogEnd"]
				game:GetService("Lighting").FogColor = library_flags["fogColor"]
			else
				game:GetService("Lighting").FogStart = 0
				game:GetService("Lighting").FogEnd = 100000
			end
		end)
	end
}):AddColor({
	flag = "fogColor",
	color = Color3.fromRGB(220, 220, 220),
	callback = function(c) if not uiLoaded then return end if library_flags["Fog Changer"] then pcall(function() game:GetService("Lighting").FogColor = c; GetLightingEffect("Atmosphere").Color = c end) end end
})
fogSection:AddSlider({
	text = "Fog Start",
	min = 0, max = 1000, float = 1, value = 0, flag = "fogStart",
	callback = function(v) if not uiLoaded then return end if library_flags["Fog Changer"] then pcall(function() game:GetService("Lighting").FogStart = v end) end end
})
fogSection:AddSlider({
	text = "Fog End",
	min = 45, max = 1000, float = 1, value = 45, flag = "fogEnd",
	callback = function(v) if not uiLoaded then return end if library_flags["Fog Changer"] then pcall(function() game:GetService("Lighting").FogEnd = v end) end end
})
game:GetService("RunService"):BindToRenderStep("ClarityFogForce", 2005, function()
	pcall(function()
		if library_flags["Fog Changer"] then
			local l = game:GetService("Lighting")
			if l.FogStart ~= library_flags["fogStart"] then l.FogStart = library_flags["fogStart"] end
			if l.FogEnd ~= library_flags["fogEnd"] then l.FogEnd = library_flags["fogEnd"] end
			if l.FogColor ~= library_flags["fogColor"] then l.FogColor = library_flags["fogColor"] end
			if not library_flags["atmosphereEnabled"] then
				for _, atmos in l:GetChildren() do
					if atmos:IsA("Atmosphere") then 
						atmos:Destroy()
					end
				end
				if workspace.CurrentCamera then
					for _, atmos in workspace.CurrentCamera:GetChildren() do
						if atmos:IsA("Atmosphere") then 
							atmos:Destroy()
						end
					end
				end
			end
		end
	end)
end)
skySection:AddToggle({
	text = "Time Changer",
	callback = function(v)
		if not uiLoaded then return end
		game:GetService("Lighting").ClockTime = v and library_flags["time"] or 14
	end
}):AddSlider({
	min = 0,
	max = 24,
	float = 0.1,
	flag = "time",
	value = 14,
	callback = function(v) if not uiLoaded then return end if library_flags["Time Changer"] then game:GetService("Lighting").ClockTime = v end end
})
skySection:AddToggle({
	text = "Skybox Changer",
	callback = function() updateSkybox() end
}):AddList({
	max = 6,
	values = { "Game's Sky", "Purple Nebula", "Night Sky", "Pink Daylight", "Morning Glow", "Setting Sun", "Fade Blue", "Elegant Morning", "Neptune", "Redshift", "Aesthetic Night", "Gloomy Gray", "Light Within Dark", "Green Space", "The Winter", "Oblivion", "Final Bloodmoon", "Clouds", "Twilight", "Red Mountain", "Cloudy Skies", "Dark Blue", "Minecraft", "Vaporwave", "Space", "Pink Vision", "Anime Sky", "Alien Red", "CS City", "Dark City", "Earth", "Mountains", "Old Skybox", "Red Sky", "Stormy Sky", "Wasteland", "Blue Sky", "Green Sky" },
	flag = "skyboxValue",
	callback = function() updateSkybox() end
})
bloomSection:AddToggle({
	text = "Enabled",
	flag = "bloomEnabled",
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("BloomEffect").Enabled = v end) end
})
bloomSection:AddSlider({
	text = "Intensity",
	min = 0, max = 10, float = 0.1, value = 1,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("BloomEffect").Intensity = v end) end
})
bloomSection:AddSlider({
	text = "Size",
	min = 0, max = 56, float = 1, value = 10,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("BloomEffect").Size = v end) end
})
atmosphereSection:AddToggle({
	text = "Enabled",
	flag = "atmoEnabled",
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Density = v and library_flags["atmoDensity"] or 0 end) end
})
atmosphereSection:AddSlider({
	text = "Density",
	min = 0, max = 2, float = 0.01, value = 0.3, flag = "atmoDensity",
	callback = function(v) if not uiLoaded then return end pcall(function() if library_flags["atmoEnabled"] then GetLightingEffect("Atmosphere").Density = v end end) end
})
atmosphereSection:AddSlider({
	text = "Haze",
	min = 0, max = 10, float = 0.1, value = 0,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Haze = v end) end
})
atmosphereSection:AddSlider({
	text = "Glare",
	min = 0, max = 10, float = 0.1, value = 0,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Glare = v end) end
})
atmosphereSection:AddToggle({
	text = "Atmosphere Color"
}):AddColor({
	flag = "atmoColor",
	color = Color3.fromRGB(199, 175, 166),
	callback = function(c) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Color = c end) end
})
atmosphereSection:AddToggle({
	text = "Decay Color"
}):AddColor({
	flag = "atmoDecay",
	color = Color3.fromRGB(92, 60, 13),
	callback = function(c) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Decay = c end) end
})
dofSection:AddToggle({
	text = "Enabled",
	flag = "dofEnabled",
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("DepthOfFieldEffect").Enabled = v end) end
})
dofSection:AddSlider({
	text = "Focus Distance",
	min = 0, max = 1000, float = 1, value = 0,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("DepthOfFieldEffect").FocusDistance = v end) end
})
sunRaysSection:AddToggle({
	text = "Enabled",
	flag = "sunraysEnabled",
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("SunRaysEffect").Enabled = v end) end
})
sunRaysSection:AddSlider({
	text = "Intensity",
	min = 0, max = 1, float = 0.01, value = 0.2,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("SunRaysEffect").Intensity = v end) end
})
do
weatherSection = worldCol1:AddSection"Weather"
WEATHER_PRESETS = {
	["Snow"] = {
		Count = 120, Color = Color3.fromRGB(255,255,255), Size = Vector3.new(0.14,0.14,0.14),
		Speed = 18, Drift = 8, Transparency = 0.15, Material = Enum.Material.Neon,
	},
	["Light Rain"] = {
		Count = 90, Color = Color3.fromRGB(150,190,255), Size = Vector3.new(0.035,2.8,0.035),
		Speed = 95, Drift = 3, Transparency = 0.25, Material = Enum.Material.Neon,
	},
	["Heavy Rain"] = {
		Count = 170, Color = Color3.fromRGB(130,180,255), Size = Vector3.new(0.045,4.2,0.045),
		Speed = 145, Drift = 7, Transparency = 0.15, Material = Enum.Material.Neon,
	},
	["Ash"] = {
		Count = 130, Color = Color3.fromRGB(255,120,45), Size = Vector3.new(0.22,0.22,0.22),
		Speed = 9, Drift = 20, Transparency = 0.2, Material = Enum.Material.Neon,
	},
}
weatherFolder = Instance.new("Folder")
weatherFolder.Name = "Weather"
weatherFolder.Parent = workspace
weatherParts = {}
rng = Random.new()
local function clearWeather()
	for _, p in weatherParts do
		if p then p:Destroy() end
	end
	table.clear(weatherParts)
end
local function randomWeatherPosition(cam)
	local cf = cam.CFrame
	local x = rng:NextNumber(-95, 95)
	local z = rng:NextNumber(-95, 95)
	return cf.Position + (cf.RightVector * x) + (Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z).Unit * z) + Vector3.new(0, rng:NextNumber(35, 95), 0)
end
local function makeWeatherPart(preset)
	local part = Instance.new("Part")
	part.Name = "WeatherDrop"
	part.Anchored = true
	part.CanCollide = false
	part.CanQuery = false
	part.CanTouch = false
	part.CastShadow = false
	part.Material = preset.Material
	part.Color = preset.Color
	part.Size = preset.Size
	part.Transparency = preset.Transparency
	part.Parent = weatherFolder
	if library_flags["weatherType"] == "Snow" or library_flags["weatherType"] == "Ash" then
		part.Shape = Enum.PartType.Ball
	end
	return part
end
local function applyWeather()
	clearWeather()
	if not library_flags["weatherEnabled"] then return end
	local preset = WEATHER_PRESETS[library_flags["weatherType"] or "Snow"] or WEATHER_PRESETS["Snow"]
	local intensity = library_flags["weatherIntensity"] or 100
	local count = math.clamp(math.floor(preset.Count * (intensity / 100)), 20, 260)
	local cam = workspace.CurrentCamera
	for i = 1, count do
		weatherParts[i] = makeWeatherPart(preset)
		if cam then
			weatherParts[i].CFrame = CFrame.new(randomWeatherPosition(cam))
		end
	end
	warn("[WEATHER] spawned visible " .. tostring(library_flags["weatherType"]) .. " parts=" .. tostring(count))
end
weatherSection:AddToggle({
	text = "Enabled",
	flag = "weatherEnabled",
	callback = function(v)
		applyWeather()
	end
})
weatherSection:AddList({
	text = "Type",
	flag = "weatherType",
	values = {"Snow", "Light Rain", "Heavy Rain", "Ash"},
	value = "Snow",
	callback = function() applyWeather() end
})
weatherSection:AddSlider({
	text = "Intensity",
	flag = "weatherIntensity",
	min = 25, max = 200, float = 1, value = 100,
	callback = function() applyWeather() end
})
game:GetService("RunService").RenderStepped:Connect(function()
	if library_flags["weatherEnabled"] and #weatherParts > 0 then
		local cam = workspace.CurrentCamera
		local preset = WEATHER_PRESETS[library_flags["weatherType"] or "Snow"] or WEATHER_PRESETS["Snow"]
		if cam then
			for i, p in weatherParts do
				if p and p.Parent then
					local phase = i * 0.37
					local drift = Vector3.new(math.sin(tick() + phase) * preset.Drift, 0, math.cos(tick() * 0.8 + phase) * preset.Drift)
					p.CFrame = p.CFrame + ((Vector3.new(0, -preset.Speed, 0) + drift) * (1 / 60))
					if p.Position.Y < cam.CFrame.Position.Y - 18 or (p.Position - cam.CFrame.Position).Magnitude > 170 then
						p.CFrame = CFrame.new(randomWeatherPosition(cam))
					end
				end
			end
		end
	end
end)
end
terrainSection:AddToggle({
	text = "Enabled Grass",
	callback = function(v) pcall(function() workspace.Terrain.Decoration = v end) end
})
terrainSection:AddSlider({
	text = "Water Transparency",
	min = 0, max = 1, float = 0.05, value = 1,
	callback = function(v) pcall(function() workspace.Terrain.WaterTransparency = v end) end
})
terrainSection:AddSlider({
	text = "Water Wave Size",
	min = 0, max = 1, float = 0.05, value = 0.15,
	callback = function(v) pcall(function() workspace.Terrain.WaterWaveSize = v end) end
})
terrainSection:AddSlider({
	text = "Water Wave Speed",
	min = 0, max = 100, float = 1, value = 10,
	callback = function(v) pcall(function() workspace.Terrain.WaterWaveSpeed = v end) end
})
visualsScreenCol = visualsScreen:AddColumn()
miscMain = visualsScreenCol:AddSection"General"
movementTab = L_5_:AddTab"Movement"
movementGeneral = movementTab:AddSubTab("General")
miscColumn = movementGeneral:AddColumn()
miscColumn2 = movementGeneral:AddColumn()
fakeLagDebounce = false;
jumpbugging = false;
noclipping = false;
surfing = false;
edgebugCooldown = false;
edgebugDebounce = false;
edgeBox = nil;
lastKnownDirection = Vector3.new(1, 0, 0);
edgeDetectionFrames = 0;
env.newEdgebugActive = false;
env.oldEbActive = false; 
miscMain:AddToggle({
	text = "Hitlogs"
})
miscMain:AddToggle({
	text = "Log Damage",
	flag = "hitlogDamage"
})
do
	local notifGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	notifGui.Name = "CuteWare_HitLogs"
	notifGui.ResetOnSpawn = false
	notifGui.IgnoreGuiInset = true
	local notifContainer = Instance.new("Frame", notifGui)
	notifContainer.Name = "Container"
	notifContainer.AnchorPoint = Vector2.new(0.5, 1)
	notifContainer.Position = UDim2.new(0.5, 0, 1, -60)
	notifContainer.Size = UDim2.new(0, 340, 0, 300)
	notifContainer.BackgroundTransparency = 1
	local notifLayout = Instance.new("UIListLayout", notifContainer)
	notifLayout.Padding = UDim.new(0, 4)
	notifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	notifLayout.SortOrder = Enum.SortOrder.LayoutOrder
	notifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	local notifOrder = 0
	local TweenService = game:GetService("TweenService")
	env.pushNotification = function(text, color, duration)
		if not library_flags["Hitlogs"] then return end
		duration = duration or 4
		color = color or Color3.fromRGB(76, 175, 80)
		notifOrder = notifOrder + 1
		local bar = Instance.new("Frame", notifContainer)
		bar.Name = "Notif_" .. notifOrder
		bar.LayoutOrder = notifOrder
		bar.Size = UDim2.new(1, 0, 0, 0)
		bar.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
		bar.BorderSizePixel = 0
		bar.ClipsDescendants = true
		Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 4)
		local stroke = Instance.new("UIStroke", bar)
		stroke.Color = Color3.fromRGB(40, 40, 40)
		stroke.Thickness = 1
		local progress = Instance.new("Frame", bar)
		progress.Name = "Progress"
		progress.Size = UDim2.new(1, 0, 0, 2)
		progress.Position = UDim2.new(0, 0, 0, 0)
		progress.BackgroundColor3 = color
		progress.BackgroundTransparency = 0
		progress.BorderSizePixel = 0
		progress.ZIndex = 2
		local label = Instance.new("TextLabel", bar)
		label.Size = UDim2.new(1, -12, 1, 0)
		label.Position = UDim2.new(0, 6, 0, 0)
		label.BackgroundTransparency = 1
		label.Text = text
		label.TextSize = 13
		label.Font = Enum.Font.Code
		label.TextColor3 = Color3.fromRGB(220, 220, 220)
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.TextTruncate = Enum.TextTruncate.AtEnd
		label.ZIndex = 4
		TweenService:Create(bar, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = UDim2.new(1, 0, 0, 24)
		}):Play()
		TweenService:Create(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
			Size = UDim2.new(0, 0, 0, 2)
		}):Play()
		spawn(function()
			wait(duration)
			local fadeOut = TweenService:Create(bar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1
			})
			TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
			TweenService:Create(progress, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
			fadeOut:Play()
			fadeOut.Completed:Wait()
			bar:Destroy()
		end)
	end
	pcall(function()
		onHit.Event:Connect(function(hitPlayer, hitPart)
			if library_flags["Hitlogs"] and library_flags["hitlogDamage"] then
				local partName = hitPart and hitPart.Name or "?"
				local name = hitPlayer and hitPlayer.Name or "?"
				pushNotification("Hit " .. name .. " in " .. partName, Color3.fromRGB(76, 175, 80))
			end
		end)
	end)
end
miscMain:AddToggle({
	text = "Spectator List",
	callback = function()
		L_83_.Visible = library_flags["Spectator List"]
		local currentSpectators = {}
		while library_flags["Spectator List"] do
			wait(0.5)
			if not library_flags["Spectator List"] then break end
			local newSpectators = {}
			if L_32_:FindFirstChild("CameraCF") then
				local L_1395_ = L_32_.CameraCF.Value.p;
				for llll1lll1l, llll1l11 in next, L_30_:GetPlayers() do
					if not llll1l11.Character or llll1l11.Character and not llll1l11.Character:FindFirstChild("HumanoidRootPart") then
						if llll1l11:FindFirstChild("CameraCF") and llll1l11 ~= L_32_ and L_32_.Character and L_32_.Character.PrimaryPart then
							local L_1398_ = llll1l11.CameraCF.Value.p;
							if (L_1398_ - L_1395_).magnitude < 20 then
								table.insert(newSpectators, llll1l11.Name)
							end
						end
					end
				end
			end;
			local changed = false
			if #newSpectators ~= #currentSpectators then
				changed = true
			else
				for i=1, #newSpectators do
					if newSpectators[i] ~= currentSpectators[i] then
						changed = true
						break
					end
				end
			end
			if changed then
				currentSpectators = newSpectators
				removeSpectators()
				for _, name in newSpectators do
					addSpectator(name)
				end
			end
		end
	end
})
miscMain:AddToggle({
	text = "Detect Moderators (Auto-Leave)",
	flag = "modDetect"
})
CB_STAFF_GROUPS = { 13733926, 3098471 }
CB_STAFF_ROLES = {
	["tester"] = true,
	["content creator"] = true,
	["game moderator"] = true,
	["contractors"] = true,
	["contractor"] = true,
	["main developers"] = true,
	["main developer"] = true,
	["developer"] = true,
	["developers"] = true,
	["owners"] = true,
	["owner"] = true,
	["group holder"] = true,
	["admin"] = true,
	["administrator"] = true,
	["moderator"] = true,
	["staff"] = true,
}
spawn(function()
	while task.wait(3) do
		if not library_flags["modDetect"] then continue end
		for _, plr in game:GetService("Players"):GetPlayers() do
			if plr == L_32_ then continue end
			local kickReason = nil
			pcall(function()
				if plr:IsInGroup(1200769) then kickReason = "Roblox Admin" end
				for _, gid in CB_STAFF_GROUPS do
					if plr:IsInGroup(gid) then
						local roleName = plr:GetRoleInGroup(gid)
						local lowered = tostring(roleName):lower()
						if CB_STAFF_ROLES[lowered] then
							kickReason = "CB Staff (" .. roleName .. ") in group " .. gid
							break
						end
					end
				end
				if not kickReason and game.CreatorType == Enum.CreatorType.Group then
					if plr:GetRankInGroup(game.CreatorId) >= 200 then
						kickReason = "Game Staff/Developer"
					end
				elseif not kickReason and game.CreatorType == Enum.CreatorType.User then
					if plr.UserId == game.CreatorId then
						kickReason = "Game Creator"
					end
				end
			end)
			if kickReason then
				L_32_:Kick("Clarity Protection: Auto-Leave triggered.\nReason: " .. kickReason .. " detected (" .. plr.Name .. ").")
				break
			end
		end
	end
end)
miscOK = L_5_:AddWarning({
	type = "ok"
})
miscMovement = miscColumn:AddSection"Movement"
miscMovement:AddToggle({
	text = "No Crouch Cooldown"
})
miscMovement:AddToggle({
	text = "Auto Strafe"
})
last = Vector3.new()
miscMovement:AddToggle({
	text = "Maintain Velocity"
})
miscMovement:AddToggle({
	text = "Bunny Hop",
	callback = function()
	end
})
miscMovement:AddList({
	text = "Bunny Hop Method",
	flag = "Bunny Hop Method",
	values = {"Directional", "A/D"},
	value = "A/D"
})
miscMovement:AddSlider({
	text = "Bunny Hop Speed",
	min = 18,
	max = 100,
	flag = "Speed Value"
})
miscIndicators = miscColumn2:AddSection"Indicators"
miscIndicators:AddToggle({ text = "Pixel Surf Indicator", flag = "showPSInd" })
miscIndicators:AddToggle({ text = "Long Jump Indicator", flag = "showLJInd" })
miscIndicators:AddToggle({ text = "Edgebug Indicator", flag = "showEBInd" })
miscIndicators:AddToggle({ text = "Jumpbug Indicator", flag = "showJBInd" })
miscIndicators:AddToggle({ text = "Airstuck Indicator", flag = "showASInd" })
miscIndicators:AddToggle({ text = "Texturebug Indicator", flag = "showTBInd" })
miscIndicators:AddToggle({ text = "Minijump Indicator", flag = "showMJInd" })
miscIndicators:AddToggle({ text = "Fireman Indicator", flag = "showFMInd" })
miscIndicators:AddToggle({ text = "Jetpack Indicator", flag = "showJPInd" })
miscIndicators:AddList({
	text = "Indicator Font",
	flag = "indFont",
	values = { "UI", "System", "Plex", "Monospace" }
})
miscIndicators:AddSlider({
	text = "Indicator Size",
	flag = "indSize",
	min = 12,
	max = 30,
	value = 18
})
motionSettings = miscColumn2:AddSection"Movement Settings"
motionSettings:AddSlider({
	text = "Jetpack Speed",
	flag = "jetpackSpeed",
	min = 10,
	max = 100,
	value = 35
})
motionSettings:AddSlider({
	text = "Jumpbug Height",
	min = 1,
	max = 10,
	float = 0.5,
	flag = "jbheight",
	value = 1
})
motionSettings:AddSlider({
	text = "Minijump Mult",
	min = 0.3,
	max = 0.8,
	float = 0.1,
	flag = "mjMult",
	value = 0.5
})
motionSettings:AddSlider({
	text = "Pixel Surf Speed",
	min = 18,
	max = 200,
	value = 25,
	flag = "pspeed"
})
motionSettings:AddSlider({
	text = "Long Jump Studs",
	min = 1,
	max = 10,
	value = 1,
	suffix = "st",
	flag = "longJumpStuds"
})
motionSettings:AddToggle({
	text = "Auto Edge Bug"
})
motionSettings:AddList({
	text = "Edgebug Mode",
	flag = "Edgebug Mode",
	values = {"mimic", "redirectional", "helltracing"},
	value = "redirectional"
})
motionSettings:AddToggle({ text = "Edgebug Visualizer", flag = "showEBVis" })
motionSettings:AddToggle({ text = "Edgebug Logs", flag = "showEBLogs" })
motionSettings:AddToggle({ text = "Edgebug Badge", flag = "Edgebug Badge" })
blindParts = {
	"FakeHead",
	"Gun",
	"UpperTorso",
	"LowerTorso",
	"LeftUpperArm",
	"RightUpperArm"
}
miscMeme = miscColumn:AddSection"Movement Features"
L_120_ = L_34_.ViewportSize.Y - 50;
L_123_ = Drawing.new("Text")
L_123_.Center = true;
L_123_.Outline = true;
L_123_.Color = Color3.new(1, 1, 1)
L_123_.Font = 3;
L_123_.Size = 20;
L_123_.Visible = false;
oldWalk = L_36_.walkupdate;
oldSpeedUpdate = L_36_.speedupdate;
miscMeme:AddToggle({
	text = "Drawing Enabled",
	callback = function()
		local vTrans = 0
		while library_flags["Drawing Enabled"] do
			wait()
			L_123_.Position = Vector2.new(L_34_.ViewportSize.X / 2, L_34_.ViewportSize.Y - 40)
			L_120_ = L_34_.ViewportSize.Y - 50;
			local L_1456_ = 0;
			if L_57_.alive and L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart") then
				L_1456_ = math.floor(math.clamp((L_32_.Character.HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)).magnitude * 14.85, 0, 400))
			end;
			local vTarget = library_flags["Velocity Indicator"] and 1 or 0
			vTrans = vTrans + (vTarget - vTrans) * 0.15
			if math.abs(vTrans - vTarget) < 0.001 then vTrans = vTarget end
			L_123_.Transparency = vTrans
			L_123_.Visible = vTrans > 0
			if L_123_.Visible then
				L_123_.Text = tostring(L_1456_)
			end;
		end;
		L_123_.Visible = false;
	end
})
CreateThread(function()
	while true do
		wait()
		if not env.psIndicator then
			env.psIndicator = Drawing.new("Text")
			env.psIndicator.Center = true
			env.psIndicator.Outline = true
			env.psIndicator.Font = 3
			env.psIndicator.Size = 18
			env.psIndicator.Text = "PS"
			env.psIndicator.Visible = false
		end
		if not env.jpIndicator then
			env.jpIndicator = Drawing.new("Text")
			env.jpIndicator.Center = true
			env.jpIndicator.Outline = true
			env.jpIndicator.Font = 3
			env.jpIndicator.Size = 18
			env.jpIndicator.Text = "JP"
			env.jpIndicator.Visible = false
		end
		if not env.ljIndicator then
			env.ljIndicator = Drawing.new("Text")
			env.ljIndicator.Center = true
			env.ljIndicator.Outline = true
			env.ljIndicator.Font = 3
			env.ljIndicator.Size = 18
			env.ljIndicator.Text = "LJ"
			env.ljIndicator.Visible = false
		end
		if not env.ebIndicator then
			env.ebIndicator = Drawing.new("Text")
			env.ebIndicator.Center = true
			env.ebIndicator.Outline = true
			env.ebIndicator.Font = 3
			env.ebIndicator.Size = 18
			env.ebIndicator.Text = "EB"
			env.ebIndicator.Visible = false
		end
		if not env.jbIndicator then
			env.jbIndicator = Drawing.new("Text")
			env.jbIndicator.Center = true
			env.jbIndicator.Outline = true
			env.jbIndicator.Font = 3
			env.jbIndicator.Size = 18
			env.jbIndicator.Text = "JB"
			env.jbIndicator.Visible = false
		end
		if not env.asIndicator then
			env.asIndicator = Drawing.new("Text")
			env.asIndicator.Center = true
			env.asIndicator.Outline = true
			env.asIndicator.Font = 3
			env.asIndicator.Size = 18
			env.asIndicator.Text = "AS"
			env.asIndicator.Visible = false
		end
		if not env.tbIndicator then
			env.tbIndicator = Drawing.new("Text")
			env.tbIndicator.Center = true
			env.tbIndicator.Outline = true
			env.tbIndicator.Font = 3
			env.tbIndicator.Size = 18
			env.tbIndicator.Text = "TB"
			env.tbIndicator.Visible = false
		end
		if not env.mjIndicator then
			env.mjIndicator = Drawing.new("Text")
			env.mjIndicator.Center = true
			env.mjIndicator.Outline = true
			env.mjIndicator.Font = 3
			env.mjIndicator.Size = 18
			env.mjIndicator.Text = "MJ"
			env.mjIndicator.Visible = false
		end
		if not env.fmIndicator then
			env.fmIndicator = Drawing.new("Text")
			env.fmIndicator.Center = true
			env.fmIndicator.Outline = true
			env.fmIndicator.Font = 3
			env.fmIndicator.Size = 18
			env.fmIndicator.Text = "FM"
			env.fmIndicator.Visible = false
		end
		local indFontMap = { ["UI"] = 0, ["System"] = 1, ["Plex"] = 2, ["Monospace"] = 3 }
		local indFont = indFontMap[library_flags["indFont"]] or 3
		local indSize = library_flags["indSize"] or 18
		local L_psText = env.psIndicator
		local L_ljText = env.ljIndicator
		local L_ebText = env.ebIndicator
		local L_jbText = env.jbIndicator
		local L_asText = env.asIndicator
		local L_tbText = env.tbIndicator
				local L_mjText = env.mjIndicator
		local L_fmText = env.fmIndicator
		local L_jpText = env.jpIndicator
		L_psText.Font = indFont; L_psText.Size = indSize
		L_ljText.Font = indFont; L_ljText.Size = indSize
		L_ebText.Font = indFont; L_ebText.Size = indSize
		L_jbText.Font = indFont; L_jbText.Size = indSize
		L_asText.Font = indFont; L_asText.Size = indSize
		L_tbText.Font = indFont; L_tbText.Size = indSize
				L_mjText.Font = indFont; L_mjText.Size = indSize
		L_fmText.Font = indFont; L_fmText.Size = indSize
		L_jpText.Font = indFont; L_jpText.Size = indSize
		if not L_34_ or not L_34_.ViewportSize then continue end
		local centerX = L_34_.ViewportSize.X / 2
		local baseY = L_34_.ViewportSize.Y - 100
		local lerpSpeed = 0.15
		if not env.indTrans then
			env.indTrans = { ps = 0, lj = 0, eb = 0, jb = 0, as = 0, mj = 0, fm = 0, jp = 0 }
		end
		local trans = env.indTrans
		local psActive = library_flags["showPSInd"] and (env.pixelSurfTouching or (surfing and true or false))
		local psTarget = psActive and 1 or 0
		trans.ps = trans.ps + (psTarget - trans.ps) * lerpSpeed
		if math.abs(trans.ps - psTarget) < 0.001 then trans.ps = psTarget end
		L_psText.Transparency = trans.ps
		L_psText.Visible = trans.ps > 0
		local ljActive = library_flags["showLJInd"] and env.longJumpHold
		local ljTarget = ljActive and 1 or 0
		trans.lj = trans.lj + (ljTarget - trans.lj) * lerpSpeed
		if math.abs(trans.lj - ljTarget) < 0.001 then trans.lj = ljTarget end
		L_ljText.Transparency = trans.lj
		L_ljText.Visible = trans.lj > 0
		local ebActive = library_flags["showEBInd"] and (L_50_ or env.mimicWasFalling or env.helltracingEdgeDetected)
		local ebTarget = ebActive and 1 or 0
		trans.eb = trans.eb + (ebTarget - trans.eb) * lerpSpeed
		if math.abs(trans.eb - ebTarget) < 0.001 then trans.eb = ebTarget end
		L_ebText.Transparency = trans.eb
		L_ebText.Visible = trans.eb > 0
		local jbActive = library_flags["showJBInd"] and (env.jbBindHeld or (tick() - (env.jbTriggerTime or 0) < 0.4))
		local jbTarget = jbActive and 1 or 0
		trans.jb = trans.jb + (jbTarget - trans.jb) * lerpSpeed
		if math.abs(trans.jb - jbTarget) < 0.001 then trans.jb = jbTarget end
		L_jbText.Transparency = trans.jb
		L_jbText.Visible = trans.jb > 0
		L_jbText.Color = env.hasBoosted and Color3.new(0, 1, 0.5) or Color3.new(1, 1, 1)
		local asAnchored = L_57_.alive and L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart") and L_32_.Character.HumanoidRootPart.Anchored
		local asActive = library_flags["showASInd"] and asAnchored
		local asTarget = asActive and 1 or 0
		trans.as = trans.as + (asTarget - trans.as) * lerpSpeed
		
		local tbActive = library_flags["showTBInd"] and env.tbSurfing and library_flags["Texturebug"]
		local tbTarget = tbActive and 1 or 0
		trans.tb = (trans.tb or 0) + (tbTarget - (trans.tb or 0)) * lerpSpeed
		if math.abs(trans.as - asTarget) < 0.001 then trans.as = asTarget end
		L_asText.Transparency = trans.as
		L_tbText.Transparency = trans.tb or 0
					L_tbText.Transparency = trans.tb or 0
		L_asText.Visible = trans.as > 0
		L_tbText.Visible = (trans.tb or 0) > 0
				local mjActive = library_flags["showMJInd"] and (env.minijumpActive or (tick() - (env.minijumpSuccessTime or 0) < 0.3))
		local mjTarget = mjActive and 1 or 0
		trans.mj = trans.mj + (mjTarget - trans.mj) * lerpSpeed
		if math.abs(trans.mj - mjTarget) < 0.001 then trans.mj = mjTarget end
		L_mjText.Transparency = trans.mj
		L_mjText.Visible = trans.mj > 0
		local fmActiveStatus = library_flags["showFMInd"] and env.fmTriggered
		local fmTarget = fmActiveStatus and 1 or 0
		trans.fm = trans.fm + (fmTarget - trans.fm) * lerpSpeed
		if math.abs(trans.fm - fmTarget) < 0.001 then trans.fm = fmTarget end
		L_fmText.Transparency = trans.fm
		L_fmText.Visible = trans.fm > 0
		local jpActive = library_flags["showJPInd"] and library_flags["Jetpack"] and env.jetpackBindHeld
		local jpTarget = jpActive and 1 or 0
		trans.jp = (trans.jp or 0) + (jpTarget - (trans.jp or 0)) * lerpSpeed
		if math.abs((trans.jp or 0) - jpTarget) < 0.001 then trans.jp = jpTarget end
		L_jpText.Transparency = trans.jp
		L_jpText.Visible = trans.jp > 0

		local slot = 0
		local spacing = 20
		if L_jpText.Visible then
			L_jpText.Position = Vector2.new(centerX, baseY + slot * spacing)
			local hrp = L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart")
			local isFlying = hrp and (L_32_.Character and L_32_.Character:FindFirstChild("Humanoid") and (L_32_.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall or L_32_.Character.Humanoid.FloorMaterial == Enum.Material.Air))
			L_jpText.Color = isFlying and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.jp > 0.5 then slot = slot + 1 end
		end
		if L_psText.Visible then
			L_psText.Position = Vector2.new(centerX, baseY + slot * spacing)
			L_psText.Color = env.pixelSurfTouching and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.ps > 0.5 then slot = slot + 1 end
		end
		if L_ljText.Visible then
			L_ljText.Position = Vector2.new(centerX, baseY + slot * spacing)
			L_ljText.Color = (tick() - (env.lastLongJumpTime or 0) <= 0.5) and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.lj > 0.5 then slot = slot + 1 end
		end
		if L_ebText.Visible then
			L_ebText.Position = Vector2.new(centerX, baseY + slot * spacing)
			L_ebText.Color = (tick() - (env.lastEdgebugTime or 0) <= 0.5) and Color3.new(0, 1, 0.5) or Color3.new(1, 1, 1)
			if trans.eb > 0.5 then slot = slot + 1 end
		end
		if L_jbText.Visible then
			L_jbText.Position = Vector2.new(centerX, baseY + slot * spacing)
			L_jbText.Color = (tick() - (env.lastJumpbugTime or 0) <= 0.5) and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.jb > 0.5 then slot = slot + 1 end
		end
		if L_asText.Visible then
			L_asText.Position = Vector2.new(centerX, baseY + slot * spacing)
			L_asText.Color = asAnchored and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.as > 0.5 then slot = slot + 1 end
		end
		if L_tbText.Visible then
			L_tbText.Position = Vector2.new(centerX, baseY + slot * spacing)
			L_tbText.Color = (library_flags["Texturebug"] and env.tbSurfing) and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if (trans.tb or 0) > 0.5 then slot = slot + 1 end
		end
		if L_mjText.Visible then
			L_mjText.Position = Vector2.new(centerX, baseY + slot * spacing)
			local successRecently = tick() - (env.minijumpSuccessTime or 0) < 0.3
			L_mjText.Color = successRecently and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.mj > 0.5 then slot = slot + 1 end
		end
		if L_fmText.Visible then
			L_fmText.Position = Vector2.new(centerX, baseY + slot * spacing)
			L_fmText.Color = env.fmTriggered and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.fm > 0.5 then slot = slot + 1 end
		end
	end
end)
miscMeme:AddToggle({
	text = "Velocity Indicator"
})
strafedir = Vector3.new()

cachedMovementIcon = nil
local function getMovementIcon()
	if cachedMovementIcon then return cachedMovementIcon end
	pcall(function()
		if not isfolder("clarity.tk") then makefolder("clarity.tk") end
		local path = "clarity.tk/movement.png"
		if not isfile(path) then
			local data = game:HttpGet("https://raw.githubusercontent.com/Freezewo/clarity.tk/main/movement.png")
			writefile(path, data)
		end
		cachedMovementIcon = getcustomasset(path)
	end)
	return cachedMovementIcon or ""
end

badgeScreenGui = Instance.new("ScreenGui")
badgeScreenGui.Name = "ClarityEdgebugBadge"
badgeScreenGui.Parent = game:GetService("CoreGui")
env.activeBadgesList = env.activeBadgesList or {}

env.updateBadgePositions = function()
    local ts = game:GetService("TweenService")
    for i, badge in env.activeBadgesList do
        local targetY = -((i - 1) * 46)
        ts:Create(badge.frame, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -170, 0.8, targetY)}):Play()
    end
end

env.showEdgebugBadge = function()
	if not library_flags["Edgebug Badge"] then return end
	
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 160, 0, 42)
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	frame.BackgroundTransparency = 0.2
	frame.BorderSizePixel = 0
	frame.Parent = badgeScreenGui
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 4)
	corner.Parent = frame
	
	local img = Instance.new("ImageLabel")
	img.Size = UDim2.new(0, 24, 0, 24)
	img.Position = UDim2.new(0, 10, 0.5, -12)
	img.BackgroundTransparency = 1
	img.Image = getMovementIcon()
	img.Parent = frame
	
	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, -44, 0.5, 0)
	title.Position = UDim2.new(0, 44, 0, 4)
	title.BackgroundTransparency = 1
	title.Text = "clarity.tk"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.Font = Enum.Font.GothamBold
	title.TextSize = 13
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.Parent = frame
	
	local sub = Instance.new("TextLabel")
	sub.Size = UDim2.new(1, -44, 0.5, 0)
	sub.Position = UDim2.new(0, 44, 0.5, -4)
	sub.BackgroundTransparency = 1
	sub.Text = "edgebugged!"
	sub.TextColor3 = Color3.fromRGB(180, 180, 180)
	sub.Font = Enum.Font.Gotham
	sub.TextSize = 12
	sub.TextXAlignment = Enum.TextXAlignment.Left
	sub.Parent = frame
	
    local badgeData = {frame = frame}
    table.insert(env.activeBadgesList, badgeData)
    
    local targetYOffset = -((#env.activeBadgesList - 1) * 46)
    frame.Position = UDim2.new(1, 10, 0.8, targetYOffset)
    
    env.updateBadgePositions()
	
	local ts = game:GetService("TweenService")
	task.delay(2.5, function()
        local currentIdx = table.find(env.activeBadgesList, badgeData)
        if currentIdx then
            table.remove(env.activeBadgesList, currentIdx)
            env.updateBadgePositions()
        end
		local tweenOut = ts:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1, 10, frame.Position.Y.Scale, frame.Position.Y.Offset)})
		tweenOut:Play()
		tweenOut.Completed:Connect(function()
			frame:Destroy()
		end)
	end)
end



miscMeme:AddToggle({
	text = "Edgebug"
}):AddBind({
	key = Enum.KeyCode.E,
	mode = "hold",
	callback = function(bool)
		env.ebHolding = not bool
		if not bool then
			L_50_ = true
		else
			L_50_ = false
			env.hookJP = nil
		end
	end
})
L_124_ = {
	CFrame.new(1, 0, 0),
	CFrame.new(-1, 0, 0),
	CFrame.new(0, 0, 1),
	CFrame.new(0, 0, -1),
	CFrame.new(0.7, 0, 0.7),
	CFrame.new(-0.7, 0, 0.7),
	CFrame.new(0.7, 0, -0.7),
	CFrame.new(-0.7, 0, -0.7),
	CFrame.new(1, -0.6, 0),
	CFrame.new(-1, -0.6, 0),
	CFrame.new(0, -0.6, 1),
	CFrame.new(0, -0.6, -1),
	CFrame.new(0.7, -0.6, 0.7),
	CFrame.new(-0.7, -0.6, 0.7),
	CFrame.new(0.7, -0.6, -0.7),
	CFrame.new(-0.7, -0.6, -0.7)
}
L_125_ = Instance.new("BodyVelocity")
lastWallNormal = nil
function findWallHit()
	local hrp = L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return nil, nil, nil end
	local Map = workspace:FindFirstChild("Map")
	local ignoreList = {
		L_34_,
		L_32_.Character,
		workspace.Ray_Ignore,
		Map and Map:FindFirstChild("SpawnPoints")
	}
	local closestDist = math.huge
	local closestPart, closestNormal, closestPos = nil, nil, nil
	
	local partsToCheck = {hrp}

	for _, partToCheck in next, partsToCheck do
		for _, dir in next, L_124_ do
			local worldDir = (partToCheck.CFrame * dir).p - partToCheck.CFrame.p
			local ray = Ray.new(partToCheck.CFrame.p, worldDir.unit * 2.0)
			local hitPart, hitPos, hitNormal = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
			if hitPart then
				local dist = (hitPos - partToCheck.CFrame.p).Magnitude
				if dist < closestDist then
					local allow = true
					if lastWallNormal then
						local angle = math.acos(math.clamp(hitNormal:Dot(lastWallNormal), -1, 1))
						if math.deg(angle) > 35 then
							allow = false
						end
					end
					if allow then
						closestDist = dist
						closestPart = hitPart
						closestNormal = hitNormal
						closestPos = hitPos
					end
				end
			end
		end
	end
	return closestPart, closestNormal, closestPos
end
function isTouchingWall()
	local part = findWallHit()
	return part ~= nil
end;
miscMeme:AddToggle({
	text = "Jetpack"
}):AddBind({
	key = Enum.KeyCode.V,
	mode = "hold",
	callback = function(l11l1l)
		env.jetpackBindHeld = not l11l1l
	end
})
miscMeme:AddToggle({
	text = "Pixelsurf"
}):AddBind({
	key = Enum.KeyCode.T,
	mode = "hold",
	callback = function(l11l1l)
		env.surfingBindHeld = not l11l1l
	end
})
miscMeme:AddToggle({
	text = "Long Jump"
}):AddBind({
	key = Enum.KeyCode.Z,
	mode = "hold",
	callback = function() end
})
game:GetService("RunService").RenderStepped:Connect(function()
	local uis = game:GetService("UserInputService")
	if not uis:GetFocusedTextBox() then
		local opt = L_5_.options and L_5_.options["Long Jump"]
		if opt and opt.key then
			local st, k = pcall(function()
				if type(opt.key) == "string" then
					return Enum.KeyCode[opt.key]
				elseif typeof(opt.key) == "EnumItem" then
					return opt.key
				end
			end)
			if st and k then 
				env.longJumpHold = uis:IsKeyDown(k)
				return
			end
		end
		env.longJumpHold = uis:IsKeyDown(Enum.KeyCode.Z)
	else
		env.longJumpHold = false
	end
end)
miscMeme:AddToggle({
	text = "Jumpbug"
}):AddBind({
	key = Enum.UserInputType.MouseButton3,
	mode = "hold",
	callback = function(bool)
		env.jbBindHeld = not bool
	end
})
miscMeme:AddToggle({
	text = "Minijump",
	flag = "Minijump"
}):AddBind({
	key = Enum.KeyCode.X,
	mode = "hold",
	callback = function(bool)
		if not bool and library_flags["Minijump"] then
			local lastTime = env.lastMinijumpTime or 0
			if tick() - lastTime > 0.15 then
				env.lastMinijumpTime = tick()
				env.minijumpActive = true
				env.mjArmedTime = tick()
			end
		end
	end
})
miscMeme:AddToggle({
	text = "Fireman",
	flag = "Fireman"
}):AddBind({
	key = Enum.KeyCode.V,
	mode = "hold",
	callback = function(bool)
		env.fmActiveHold = bool
	end
})
miscMeme:AddToggle({
	text = "Head Boost",
	flag = "Head Boost"
}):AddBind({
	key = Enum.KeyCode.H,
	mode = "hold",
	callback = function(bool)
		if library_flags["Head Boost"] then
			env.headboundActive = not bool
		end
	end
})
miscMeme:AddToggle({
	text = "Noclip"
}):AddBind({
	key = Enum.KeyCode.V,
	mode = "hold",
	callback = function(l1111lll111)
		if not L_57_.alive or not library_flags["Noclip"] then
			noclipping = false;
			return
		end;
		noclipping = not l1111lll111
	end
})
miscMeme:AddToggle({
	text = "Airstuck",
	callback = function()
		if L_32_.Character then
			local hrp = L_32_.Character:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.Anchored = false end
		end
	end
}):AddBind({
	key = Enum.KeyCode.C,
	mode = "hold",
	callback = function(bool)
		if library_flags["Airstuck"] then
			local char = L_32_.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			local torso = char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"))
			if char and hrp then
				hrp.Anchored = not bool
				if not bool then
					hrp.AssemblyLinearVelocity = Vector3.new()
					if torso then torso.AssemblyLinearVelocity = Vector3.new() end
				end
			end
		end
	end
})
miscMeme:AddToggle({
	text = "Texturebug",
	callback = function()
		env.tbActive = false
		if L_32_.Character then
			local hrp = L_32_.Character:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.Anchored = false end
		end
	end
}):AddBind({
	key = Enum.KeyCode.Y,
	mode = "hold",
	callback = function(bool)
		if library_flags["Texturebug"] then
			local char = L_32_.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			local torso = char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"))
			if char and hrp then
				if not bool then
					if env.tbActive or env.tbCooldown then return end
					env.tbActive = true
					local surfStartTime = 0
					spawn(function()
						while env.tbActive and char.Parent do
							local pos = hrp.Position
							local params = RaycastParams.new()
							params.FilterDescendantsInstances = {char, workspace.CurrentCamera}
							params.FilterType = Enum.RaycastFilterType.Exclude
							local dirs = {hrp.CFrame.LookVector, -hrp.CFrame.LookVector, hrp.CFrame.RightVector, -hrp.CFrame.RightVector}
							local nearWall = false
							for _, dir in dirs do
								if workspace:Raycast(pos, dir * 4.5, params) then nearWall = true break end
							end
							
							if nearWall then
								if surfStartTime == 0 then surfStartTime = tick() end
								if tick() - surfStartTime > 2 then
									local vel = hrp.AssemblyLinearVelocity
									hrp.AssemblyLinearVelocity = Vector3.new(vel.X * 0.5, vel.Y, vel.Z * 0.5)
									env.tbActive = false
									env.tbCooldown = true
									break
								end
							else
								surfStartTime = 0
							end
							env.tbSurfing = nearWall
							if nearWall then
								local vel = hrp.AssemblyLinearVelocity
								if tick() % 0.35 < 0.2 then
									hrp.AssemblyLinearVelocity = Vector3.new(vel.X, 2, vel.Z)
									if torso then torso.AssemblyLinearVelocity = Vector3.new(vel.X, 2, vel.Z) end
								else
									hrp.AssemblyLinearVelocity = Vector3.new(vel.X, -20, vel.Z)
									if torso then torso.AssemblyLinearVelocity = Vector3.new(vel.X, -20, vel.Z) end
								end
							end
							game:GetService("RunService").Heartbeat:Wait()
						end
						env.tbSurfing = false
					end)
				else
					env.tbCooldown = false
					env.tbActive = false
					env.tbSurfing = false
					hrp.Anchored = false
				end
			end
		end
	end
})
miscTab = L_5_:AddTab"Misc"
generalMiscSubTab = miscTab:AddSubTab("General")
generalCol1 = generalMiscSubTab:AddColumn()
generalCol2 = generalMiscSubTab:AddColumn()
exploitSubTab = miscTab:AddSubTab("Exploits")
exploitColumn = exploitSubTab:AddColumn()
exploitMain = exploitColumn:AddSection"Main"
exploitMain:AddToggle({
	text = "Kill All",
	flag = "KillAllAuto",
	callback = function(enabled)
		if enabled then
			warn("disistofff")
		else
			warn("disistofff")
		end
	end
})
nameSpoofSec = generalCol1:AddSection("Name Spoofer")
nameSpoofSec:AddToggle({text = "Enabled", flag = "spoofName"})
nameSpoofSec:AddBox({text = "Spoofed Name", flag = "spoofedNameValue"})


visualsViewmodel = generalCol2:AddSection"Viewmodel"
visualsViewmodel:AddToggle({
	text = "Enabled",
	flag = "viewmodelEnabled"
})
visualsViewmodel:AddToggle({
	text = "Visualize Silent Angles"
})
visualsViewmodel:AddToggle({
	text = "Disable Arm Animation",
	flag = "Disable Arm Animation",
	tip = "Stops the arm/viewmodel bob & sway while walking and jumping"
})

game:GetService("RunService").RenderStepped:Connect(function()
	if library_flags["Disable Arm Animation"] then
		pcall(function() 
			L_36_.mgn = 0 
			L_36_.sway = 0
			L_36_.tme = 0
			L_36_.breath = 0
		end)
		pcall(function()
			for _, v in next, workspace.Camera:GetChildren() do
				if v:IsA("Model") and (v.Name:match("Arms") or v:FindFirstChild("AnimationController")) then
					local anim = v:FindFirstChildOfClass("AnimationController")
					if anim then
						for _, track in next, anim:GetPlayingAnimationTracks() do
							if track.Priority == Enum.AnimationPriority.Idle or track.Priority == Enum.AnimationPriority.Core then
								track:Stop()
							elseif track.Name:lower():match("idle") then
								track:Stop()
							end
						end
					end
				end
			end
		end)
	end
end)
visualsViewmodel:AddSlider({
	text = "X",
	min = -25,
	max = 25,
	flag = "viewmodelX"
})
visualsViewmodel:AddSlider({
	text = "Y",
	min = -25,
	max = 25,
	flag = "viewmodelY"
})
visualsViewmodel:AddSlider({
	text = "Z",
	min = -25,
	max = 25,
	flag = "viewmodelZ"
})
visualsViewmodel:AddSlider({
	text = "Roll",
	min = 0,
	max = 360,
	flag = "viewmodelRoll"
})
EB_LogGui = Instance.new("ScreenGui")
EB_LogGui.Name = "EBLog"
EB_LogGui.ResetOnSpawn = false
EB_LogGui.IgnoreGuiInset = true
pcall(function() EB_LogGui.Parent = game:GetService("CoreGui") end)
if not EB_LogGui.Parent then
	pcall(function() EB_LogGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") end)
end
ebLogContainer = Instance.new("Frame", EB_LogGui)
ebLogContainer.Name = "HitlogContainer"
ebLogContainer.BackgroundTransparency = 1
ebLogContainer.Size = UDim2.new(0, 300, 0, 400)
ebLogContainer.Position = UDim2.new(0, 15, 0, 70)  
ebList = Instance.new("UIListLayout", ebLogContainer)
ebList.VerticalAlignment = Enum.VerticalAlignment.Top
ebList.HorizontalAlignment = Enum.HorizontalAlignment.Left
ebList.Padding = UDim.new(0, 3)
ebList.SortOrder = Enum.SortOrder.LayoutOrder
ebLogOrder = 0
local function EBlog(text, duration)
    task.spawn(function()
        if not ebLogContainer then return end
        if not library_flags["showEBLogs"] then return end
        duration = duration or 2.5
        ebLogOrder = ebLogOrder - 1
        local logFrame = Instance.new("Frame", ebLogContainer)
        logFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        logFrame.BackgroundTransparency = 0
        logFrame.Size = UDim2.new(0, 280, 0, 22)
        logFrame.LayoutOrder = ebLogOrder
        local corner = Instance.new("UICorner", logFrame)
        corner.CornerRadius = UDim.new(0, 4)
        local stroke = Instance.new("UIStroke", logFrame)
        stroke.Thickness = 1
        stroke.Color = Color3.fromRGB(65, 65, 65)
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local label = Instance.new("TextLabel", logFrame)
        label.Text = " " .. text
        label.Font = Enum.Font.GothamSemibold 
        label.TextSize = 13
        label.TextColor3 = Color3.new(1, 1, 1)
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, -5, 1, -2)
        label.Position = UDim2.new(0, 5, 0, 1)
        label.TextXAlignment = Enum.TextXAlignment.Left
        task.wait(duration)
        if logFrame then
            local ts = game:GetService("TweenService")
            local it = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            ts:Create(logFrame, it, {BackgroundTransparency = 1}):Play()
            ts:Create(label, it, {TextTransparency = 1}):Play()
            ts:Create(stroke, it, {Transparency = 1}):Play()
            task.wait(0.5)
            logFrame:Destroy()
        end
    end)
end
do
	local ebDebounce = false
	local ebWasFalling = false
	local ebEdgePos = nil
	local ebLastSound = 0
	local ebChainCount = 0
	local ebLoggedSeek = false
	local ebLastEdgeLog = 0
	local ebCooldown = 0
	for _, v in workspace:GetChildren() do
		if v.Name == "EB_LockVis" then v:Destroy() end
	end
	if env._ebHeartbeat then
		env._ebHeartbeat:Disconnect()
		env._ebHeartbeat = nil
	end
	local lockPart = Instance.new("Part")
	lockPart.Name = "EB_LockVis"
	lockPart.Anchored = true
	lockPart.CanCollide = false
	lockPart.Size = Vector3.new(2, 2, 2)
	lockPart.Color = Color3.fromRGB(0, 0, 0)
	lockPart.Transparency = 1
	lockPart.Parent = workspace
	local lockBox = Instance.new("SelectionBox")
	lockBox.Adornee = lockPart
	lockBox.Color3 = Color3.fromRGB(0, 0, 0)
	lockBox.LineThickness = 0.15
	lockBox.SurfaceTransparency = 1
	lockBox.Transparency = 1
	lockBox.Parent = lockPart
	local edgePlat = Instance.new("Part")
	edgePlat.Name = "EBEdgePlat"
	edgePlat.Anchored = true
	edgePlat.CanCollide = false
	edgePlat.CanQuery = false
	edgePlat.CanTouch = false
	edgePlat.Size = Vector3.new(2.5, 0.4, 2.5)
	edgePlat.Transparency = 1
	edgePlat.Material = Enum.Material.SmoothPlastic
	edgePlat.Color = Color3.fromRGB(255, 0, 0)
	edgePlat.CFrame = CFrame.new(0, -10000, 0)
	edgePlat.Parent = workspace
	local function hideEdgePlat()
		edgePlat.CanCollide = false
		edgePlat.CFrame = CFrame.new(0, -10000, 0)
	end
	local scanDirs = {
		Vector3.new(1, 0, 0),
		Vector3.new(-1, 0, 0),
		Vector3.new(0, 0, 1),
		Vector3.new(0, 0, -1),
		Vector3.new(0.707, 0, 0.707),
		Vector3.new(-0.707, 0, 0.707),
		Vector3.new(0.707, 0, -0.707),
		Vector3.new(-0.707, 0, -0.707),
		Vector3.new(0.924, 0, 0.383),
		Vector3.new(-0.924, 0, 0.383),
		Vector3.new(0.924, 0, -0.383),
		Vector3.new(-0.924, 0, -0.383),
		Vector3.new(0.383, 0, 0.924),
		Vector3.new(-0.383, 0, 0.924),
		Vector3.new(0.383, 0, -0.924),
		Vector3.new(-0.383, 0, -0.924),
	}
	if not library_flags["Edgebug Mode"] then
		library_flags["Edgebug Mode"] = "redirectional"
	elseif library_flags["Edgebug Mode"] == "cuteware" then
		library_flags["Edgebug Mode"] = "mimic"
	end
	pcall(function()
		if L_5_ and L_5_.options then
			L_5_.options["Edgebug Mode"] = {
				hasInit = true,
				type = "list",
				flag = "Edgebug Mode",
				value = library_flags["Edgebug Mode"],
				values = {"cuteware", "redirectional", "helltracing"},
				SetValue = function(self, val)
					if not val or val == "" then return end
					self.value = val
					library_flags["Edgebug Mode"] = val
					if library_flags["showEBLogs"] then
						warn("[EB] Mode changed to: " .. val)
					end
				end
			}
		end
	end)
	env._ebHeartbeat = game:GetService("RunService").Heartbeat:Connect(function()
		local _ebOk, _ebErr = pcall(function()
		local ebMode = library_flags["Edgebug Mode"] or "redirectional"
		if not library_flags["Edgebug"] or (not env.ebHolding and not library_flags["Auto Edge Bug"]) or ebMode ~= "redirectional" then
			ebWasFalling = false
			ebEdgePos = nil
			ebChainCount = 0
			ebLoggedSeek = false
			lockPart.Transparency = 1
			lockBox.Transparency = 1
			hideEdgePlat()
			return
		end
		local char = L_32_ and L_32_.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local hum = char and char:FindFirstChild("Humanoid")
		if not hrp or not hum then return end
		local state = hum:GetState()
		local vel = hrp.AssemblyLinearVelocity
		local showVis = library_flags["showEBVis"]
		local isAuto = library_flags["Auto Edge Bug"] and not env.ebHolding
		local fallThreshold = isAuto and -25 or -8
		local cooldownNeeded = (ebChainCount > 0) and 0.25 or 1.5
		if state == Enum.HumanoidStateType.Freefall and vel.Y < fallThreshold and (tick() - ebCooldown) > cooldownNeeded then
			ebWasFalling = true
			if not ebLoggedSeek then
				EBlog("Edge Bug: Starting sequence, phase: seeking")
				if library_flags["showEBLogs"] then warn(string.format("[EB DEBUG] Seek started | pos=(%.1f,%.1f,%.1f) velY=%.1f flatSpeed=%.1f", hrp.Position.X, hrp.Position.Y, hrp.Position.Z, vel.Y, Vector3.new(vel.X,0,vel.Z).Magnitude)) end
				ebLoggedSeek = true
			end
			if not ebEdgePos then
				local rp = RaycastParams.new()
				rp.FilterDescendantsInstances = {char, lockPart}
				rp.FilterType = Enum.RaycastFilterType.Exclude
				local startPos = hrp.Position
				local bestEdgePoint = nil
				local bestEdgeDir = nil
				local bestScore = math.huge
				local allDirs = {}
				local flatVel = Vector3.new(vel.X, 0, vel.Z)
				local camLook = workspace.CurrentCamera.CFrame.LookVector
				local flatCam = Vector3.new(camLook.X, 0, camLook.Z)
				local hasCam = flatCam.Magnitude > 0.1
				local hasVel = flatVel.Magnitude > 1
				local velDir = hasVel and flatVel.Unit or nil
				local camDir = hasCam and flatCam.Unit or nil
				local moveDir
				if velDir and camDir then
					local blend = (velDir * 0.6 + camDir * 0.4)
					moveDir = blend.Magnitude > 0.05 and blend.Unit or velDir
				else
					moveDir = velDir or camDir or Vector3.new(0, 0, 1)
				end
				local primaries = {}
				if velDir then table.insert(primaries, velDir) end
				if camDir then table.insert(primaries, camDir) end
				table.insert(primaries, moveDir)
				local seen = {}
				for _, dir in primaries do
					local key = string.format("%.2f_%.2f", dir.X, dir.Z)
					if not seen[key] then
						seen[key] = true
						table.insert(allDirs, dir)
						for deg = 10, 60, 10 do
							table.insert(allDirs, (CFrame.lookAt(Vector3.zero, dir) * CFrame.Angles(0, math.rad(deg), 0)).LookVector)
							table.insert(allDirs, (CFrame.lookAt(Vector3.zero, dir) * CFrame.Angles(0, math.rad(-deg), 0)).LookVector)
						end
					end
				end
				local MIN_DIST = 1.2
				local MAX_DIST = (ebChainCount > 0) and 6.0 or 8.0
				local STEP = 0.35
				local feetY = startPos.Y - 3
				for _, scanDir in allDirs do
					for dist = MIN_DIST, MAX_DIST, STEP do
						local pPos = startPos + (scanDir * dist)
						local pRay = workspace:Raycast(pPos, Vector3.new(0, -40, 0), rp)
						local fPos = startPos + (scanDir * (dist + STEP))
						local fRay = workspace:Raycast(fPos, Vector3.new(0, -40, 0), rp)
						local function isEdgeCandidate()
							if not pRay or pRay.Normal.Y <= 0.4 then return false end
							if pRay.Position.Y > feetY + 1.5 then return false end
							if pRay.Position.Y < feetY - 60 then return false end
							if not fRay then return true end
							if math.abs(pRay.Position.Y - fRay.Position.Y) > 0.5 then return true end
							return false
						end
						if isEdgeCandidate() then
							local pt = Vector3.new(pPos.X, pRay.Position.Y, pPos.Z) + Vector3.new(scanDir.X, 0, scanDir.Z) * (STEP * 0.5)
							if ebChainCount > 0 and ebLastEdgeY and pt.Y > ebLastEdgeY - 1.0 then
							else
							local toEdge = pt - startPos
							local horizDir = Vector3.new(toEdge.X, 0, toEdge.Z)
							if horizDir.Magnitude >= MIN_DIST then
								local obstruct = workspace:Raycast(startPos, horizDir, rp)
								local blocked = false
								if obstruct then
									local distToHit = (obstruct.Position - startPos).Magnitude
									local distToEdge = horizDir.Magnitude
									if distToHit < distToEdge - 0.6 and obstruct.Position.Y > pt.Y - 1.5 then
										blocked = true
									end
								end
								local edgeWallCheck = workspace:Raycast(pt + Vector3.new(0, 0.5, 0), Vector3.new(0, 2, 0), rp)
								if edgeWallCheck then blocked = true end
								if not blocked then
									local probeY = pt + Vector3.new(0, 1.5, 0)
									local perp = Vector3.new(-scanDir.Z, 0, scanDir.X) * 0.8
									local sc1 = workspace:Raycast(probeY, perp, rp)
									local sc2 = workspace:Raycast(probeY, -perp, rp)
									if sc1 and sc2 then blocked = true end
								end
								if not blocked then
									local upCheck = workspace:Raycast(pt + Vector3.new(0, 0.6, 0), Vector3.new(0, 0.5, 0), rp)
									if not upCheck then
										local bodyA = workspace:Raycast(pt + Vector3.new(0, 0.8, 0), scanDir * 2.2, rp)
										local bodyB = workspace:Raycast(pt + Vector3.new(0, 2.2, 0), scanDir * 2.2, rp)
										local bodyC = workspace:Raycast(pt + Vector3.new(0, 3.6, 0), scanDir * 2.2, rp)
										local lipWall = (bodyA and bodyA.Normal.Y < 0.25) or (bodyB and bodyB.Normal.Y < 0.25) or (bodyC and bodyC.Normal.Y < 0.25)
										local sideDir = Vector3.new(-scanDir.Z, 0, scanDir.X)
										if sideDir.Magnitude < 0.05 then sideDir = Vector3.new(1, 0, 0) end
										sideDir = sideDir.Unit
										local cornerLeft = workspace:Raycast(pt + (scanDir * 0.45) + Vector3.new(0, 1.4, 0), sideDir * 1.2, rp)
										local cornerRight = workspace:Raycast(pt + (scanDir * 0.45) + Vector3.new(0, 1.4, 0), -sideDir * 1.2, rp)
										local doorwayLike = cornerLeft and cornerRight and cornerLeft.Normal.Y < 0.25 and cornerRight.Normal.Y < 0.25
										local dropRay = workspace:Raycast(pt + (scanDir * 1.05) + Vector3.new(0, 0.2, 0), Vector3.new(0, -120, 0), rp)
										local dropDepth = dropRay and (pt.Y - dropRay.Position.Y) or 120
										local minDrop = (ebChainCount > 0) and 1.5 or 0.35
										if not lipWall and not doorwayLike and dropDepth >= minDrop then
											local edgeDir = horizDir.Unit
											local camAlign = camDir and math.max(0, edgeDir:Dot(camDir)) or 0
											local velAlign = velDir and math.max(0, edgeDir:Dot(velDir)) or 0
											local alignment
											if camDir and velDir then
												alignment = camAlign * 0.55 + velAlign * 0.45
											else
												alignment = camAlign + velAlign
											end
											local d = horizDir.Magnitude
											local score = d - (alignment * 4.0) - math.min(dropDepth, 30) * 0.05
											if score < bestScore then
												bestScore = score
												bestEdgePoint = pt
												bestEdgeDir = scanDir
											end
											if dropDepth >= 1.5 then
												break
											end
										end
									end
								end
							end
							end
						end
					end
				end
				if bestEdgePoint then
					local edgeDist = (Vector3.new(bestEdgePoint.X, 0, bestEdgePoint.Z) - Vector3.new(startPos.X, 0, startPos.Z)).Magnitude
					local finalDirRaw = Vector3.new(bestEdgePoint.X - startPos.X, 0, bestEdgePoint.Z - startPos.Z)
					local finalDir = finalDirRaw.Magnitude > 0.1 and finalDirRaw.Unit or (bestEdgeDir or Vector3.new(0,0,1))
					local finalWallLow = workspace:Raycast(bestEdgePoint + Vector3.new(0, 0.9, 0), finalDir * 1.8, rp)
					local finalWallMid = workspace:Raycast(bestEdgePoint + Vector3.new(0, 2.4, 0), finalDir * 1.8, rp)
					if (finalWallLow and finalWallLow.Normal.Y < 0.25) or (finalWallMid and finalWallMid.Normal.Y < 0.25) then
						if library_flags["showEBLogs"] then warn("[EB DEBUG] Reject edge: wall/doorway in front") end
						ebEdgePos = nil
						hideEdgePlat()
						return
					end
					local pathStart = Vector3.new(startPos.X, bestEdgePoint.Y, startPos.Z)
					local pathVec = (bestEdgePoint - pathStart)
					local pathLen = Vector3.new(pathVec.X, 0, pathVec.Z).Magnitude
					if pathLen > 0.2 then
						local pathDir = Vector3.new(pathVec.X, 0, pathVec.Z).Unit
						local railHeights = {0.4, 1.1, 1.9, 2.7}
						for _, h in next, railHeights do
							local origin = pathStart + Vector3.new(0, h, 0)
							local hit = workspace:Raycast(origin, pathDir * (pathLen + 0.4), rp)
							if hit and hit.Instance and hit.Instance.CanCollide then
								local n = string.lower(hit.Instance.Name)
								local pn = hit.Instance.Parent and string.lower(hit.Instance.Parent.Name) or ""
								local namedRail = string.find(n, "rail") or string.find(n, "fence") or string.find(n, "bar") or string.find(n, "grill") or string.find(pn, "rail") or string.find(pn, "fence")
								local thin = hit.Instance.Size and (math.min(hit.Instance.Size.X, hit.Instance.Size.Z) < 0.8)
								if namedRail or thin or hit.Normal.Y < 0.35 then
									if library_flags["showEBLogs"] then warn("[EB DEBUG] Reject edge: railing/fence in path (" .. hit.Instance.Name .. ")") end
									ebEdgePos = nil
									hideEdgePlat()
									return
								end
							end
						end
					end
					for _, h in next, {0.5, 1.3, 2.1} do
						local railHit = workspace:Raycast(bestEdgePoint + Vector3.new(0, h, 0) - finalDir * 0.6, finalDir * 1.2, rp)
						if railHit and railHit.Instance and railHit.Instance.CanCollide and railHit.Normal.Y < 0.35 then
							local sz = railHit.Instance.Size
							if sz and math.min(sz.X, sz.Z) < 0.9 then
								if library_flags["showEBLogs"] then warn("[EB DEBUG] Reject edge: railing on edge") end
								ebEdgePos = nil
								hideEdgePlat()
								return
							end
						end
					end
					ebEdgePos = bestEdgePoint
					lockPart.CFrame = CFrame.new(bestEdgePoint + Vector3.new(0, 3.5, 0))
					local allowEdgePlat = ebChainCount == 0 or (ebLastEdgeY and bestEdgePoint.Y < ebLastEdgeY - 0.7)
					if allowEdgePlat then
						local rawPlatDir = flatVel.Magnitude > 2 and flatVel.Unit or (camDir or bestEdgeDir or Vector3.new(0,0,1))
						local toEdgeDir = Vector3.new(bestEdgePoint.X - startPos.X, 0, bestEdgePoint.Z - startPos.Z)
						if toEdgeDir.Magnitude > 0.1 then
							local edgeUnit = toEdgeDir.Unit
							if rawPlatDir:Dot(edgeUnit) < 0.25 then
								rawPlatDir = edgeUnit
							end
						end
						local platDir = rawPlatDir
						local platCenter = bestEdgePoint + (platDir * 0.85) + Vector3.new(0, -edgePlat.Size.Y * 0.5, 0)
						local probe = platCenter + Vector3.new(0, 0.35, 0)
						local frontBlock = workspace:Raycast(bestEdgePoint + Vector3.new(0, 0.6, 0), platDir * 1.4, rp)
						local topBlock = workspace:Raycast(probe, Vector3.new(0, 2.5, 0), rp)
						local backGround = workspace:Raycast(bestEdgePoint - platDir * 0.35 + Vector3.new(0, 0.25, 0), Vector3.new(0, -2, 0), rp)
						local frontGround = workspace:Raycast(bestEdgePoint + platDir * 1.15 + Vector3.new(0, 0.25, 0), Vector3.new(0, -3, 0), rp)
						if not frontBlock and not topBlock and backGround and (not frontGround or frontGround.Position.Y < bestEdgePoint.Y - 0.45) then
							edgePlat.Size = ebChainCount > 0 and Vector3.new(1.15, 0.22, 1.15) or Vector3.new(1.8, 0.28, 1.8)
							edgePlat.CFrame = CFrame.new(platCenter)
							edgePlat.CanCollide = true
						else
							hideEdgePlat()
						end
					else
						hideEdgePlat()
					end
					if tick() - ebLastEdgeLog > 0.5 then
						EBlog(string.format("Edge Bug: Found edge at distance %.1f studs", edgeDist))
						if library_flags["showEBLogs"] then warn(string.format("[EB DEBUG] LOCKED edge | dist=%.1f score=%.2f edgeY=%.1f feetY=%.1f", edgeDist, bestScore, bestEdgePoint.Y, hrp.Position.Y - 3)) end
						ebLastEdgeLog = tick()
					end
				else
					if library_flags["showEBLogs"] then warn("[EB DEBUG] No edge found in scan") end
				end
			end
			if ebEdgePos then
				local pullVec = (Vector3.new(ebEdgePos.X, 0, ebEdgePos.Z) - Vector3.new(hrp.Position.X, 0, hrp.Position.Z))
				local pullDist = pullVec.Magnitude
				local feetY = hrp.Position.Y - 3
				local altitude = feetY - ebEdgePos.Y
				local ENGAGE_ALT = 22
				local engaged = altitude <= ENGAGE_ALT and altitude > -5.0
				if showVis and engaged then lockBox.Transparency = 0 else lockBox.Transparency = 1 end
				if pullDist > 12.0 or altitude < -5.0 then
					if library_flags["showEBLogs"] then warn(string.format("[EB DEBUG] UNLOCK | pullDist=%.1f feetY=%.1f edgeY=%.1f reason=%s", pullDist, feetY, ebEdgePos.Y, pullDist > 12 and "too_far" or "below_edge")) end
					ebEdgePos = nil
					lockBox.Transparency = 1
					hideEdgePlat()
				elseif engaged then
					local flatHRP = Vector3.new(vel.X, 0, vel.Z)
					if pullDist > 0.1 and flatHRP.Magnitude > 5.0 then
						local altProx = math.clamp(1 - (altitude / ENGAGE_ALT), 0, 1)
						local distProx = math.clamp(1 - (pullDist / 12.0), 0, 1)
						local proximity = altProx * 0.6 + distProx * 0.4
						local cfLerp = 0.03 + 0.07 * proximity
						local velLerp = 0.025 + 0.065 * proximity
						local targetPos = Vector3.new(ebEdgePos.X, hrp.Position.Y, ebEdgePos.Z)
						hrp.CFrame = hrp.CFrame:Lerp(CFrame.new(targetPos) * (hrp.CFrame - hrp.CFrame.Position), cfLerp)
						local curDir = flatHRP.Unit
						local newDir = curDir:Lerp(pullVec.Unit, velLerp).Unit
						hrp.AssemblyLinearVelocity = Vector3.new(newDir.X * flatHRP.Magnitude, vel.Y, newDir.Z * flatHRP.Magnitude)
					end
				end
				if ebEdgePos then
					lockPart.CFrame = CFrame.new(ebEdgePos + Vector3.new(0, 3.5, 0))
				end
			else
				lockBox.Transparency = 1
			end
		elseif state == Enum.HumanoidStateType.Running or state == Enum.HumanoidStateType.Climbing then
			ebWasFalling = false
			ebEdgePos = nil
			ebChainCount = 0
			ebLastEdgeY = nil
			ebLoggedSeek = false
			lockBox.Transparency = 1
			hideEdgePlat()
		end
		if ebWasFalling and ebEdgePos and state == Enum.HumanoidStateType.Landed then
			local landDist = (Vector3.new(hrp.Position.X, 0, hrp.Position.Z) - Vector3.new(ebEdgePos.X, 0, ebEdgePos.Z)).Magnitude
			local feetY = hrp.Position.Y - 3
			local edgeDelta = math.abs(feetY - ebEdgePos.Y)
			if library_flags["showEBLogs"] then warn(string.format("[EB DEBUG] LANDED | landDist=%.2f velY=%.1f flatSpeed=%.1f edgeDelta=%.2f", landDist, vel.Y, Vector3.new(vel.X,0,vel.Z).Magnitude, edgeDelta)) end
			local landRay = workspace:Raycast(hrp.Position, Vector3.new(0, -6, 0), rp)
			local onEdgeSurface = landRay and math.abs(landRay.Position.Y - ebEdgePos.Y) < 0.4
			if landDist < 3.5 and (onEdgeSurface or edgeDelta < 1.1) and vel.Y > -80 then
				EBlog("Edge Bug: Sliding on edge")
				ebLastEdgeY = ebEdgePos.Y
				ebEdgePos = nil
				lockBox.Transparency = 1
				hideEdgePlat()
				if ebDebounce then return end
				ebDebounce = true
				ebChainCount = ebChainCount + 1
				if ebChainCount > 1 then
					if ebChainCount == 2 then
						EBlog("Edge Bug: Double Edgebug!")
					elseif ebChainCount == 3 then
						EBlog("Edge Bug: Triple Edgebug!")
					else
						EBlog("Edge Bug: Combo x" .. tostring(ebChainCount) .. "!")
					end
				end
				env.hookJP = 0
				hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
				task.wait()
				if not (hrp and hrp.Parent) then
					ebDebounce = false
					hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
					return
				end
				local vX, vZ = vel.X, vel.Z
				local flatSpeed = Vector3.new(vX, 0, vZ).Magnitude
				local boostMult = flatSpeed > 5 and 1.0 or 1.15
				local flatDir = Vector3.new(vX, 0, vZ)
				local moveDir = flatDir.Magnitude > 0.5 and flatDir.Unit or hrp.CFrame.LookVector
				if library_flags["showEBLogs"] then warn(string.format("[EB DEBUG] SLIDE | flatSpeed=%.1f boost=%.2f landDist=%.2f chain=%d edgeDelta=%.2f", flatSpeed, boostMult, landDist, ebChainCount, edgeDelta)) end
				hum:ChangeState(Enum.HumanoidStateType.Freefall)
				hrp.AssemblyLinearVelocity = Vector3.new(
					vX * boostMult + moveDir.X * 2.5,
					0,
					vZ * boostMult + moveDir.Z * 2.5
				)
				hrp.CFrame = hrp.CFrame + (moveDir * 0.5)
				env.hookJP = nil
				hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
				env.lastEdgebugTime = tick()
				if env.showEdgebugBadge then env.showEdgebugBadge() end
				ebCooldown = tick()
				task.delay(0.15, function()
					ebDebounce = false
				end)
			else
				ebEdgePos = nil
				lockBox.Transparency = 1
				hideEdgePlat()
			end
		end
		end)
		if not _ebOk then
			ebEdgePos = nil
			ebChainCount = 0
			ebDebounce = false
			pcall(function() lockBox.Transparency = 1 end)
			pcall(function() lockPart.Transparency = 1 end)
			pcall(hideEdgePlat)
			pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true) end)
			env.hookJP = nil
		end
	end)
end
miscExtra = generalCol1:AddSection("Extra")
miscExtra:AddToggle({
	text = "Remove Radio Commands"
})
miscExtra:AddToggle({
	text = "Remove UI Elements",
	callback = removeUIElementsCallback
})
miscExtra:AddToggle({
	text = "Remove Sleeves",
	callback = updateViewModelVisuals
})
miscGeneralFeatures = generalCol2:AddSection("More Features")
miscGeneralFeatures:AddToggle({
	text = "Old Gun Sounds"
})
miscGeneralFeatures:AddToggle({
	text = "Hitsound"
}):AddList({
	flag = "hitsoundValue",
	max = 8,
	values = {
		"Bameware",
		"Bell",
		"Bubble",
		"Pick",
		"Pop",
		"Rust",
		"Sans",
		"Fart",
		"Big",
		"Vine",
		"Bruh",
		"Skeet",
		"Neverlose",
		"Fatality",
		"Bonk",
		"Moan",
		"Minecraft"
	}
})
miscGeneralFeatures:AddSlider({
	text = "Hitsound Volume",
	min = 1,
	max = 10,
	float = 0.5
})
miscGeneralFeatures:AddToggle({
	text = "FOV Changer",
	callback = function(l11l111)
		if l11l111 then
			L_28_:BindToRenderStep("fovchanger", 10, function()
				if not L_32_.PlayerGui.GUI.Crosshairs.Scope.Visible then
					L_34_.FieldOfView = library_flags["fovValue"]
				end
			end)
		else
			L_28_:UnbindFromRenderStep("fovchanger")
		end;
		L_34_.FieldOfView = 80
	end
}):AddSlider({
	flag = "fovValue",
	min = 50,
	max = 120,
	value = 80
})
miscGeneralFeatures:AddToggle({
	text = "FOV Circle",
	callback = function()
		L_113_.Position = Vector2.new(L_34_.ViewportSize.X / 2, L_34_.ViewportSize.Y / 2)
		L_114_.Position = Vector2.new(L_34_.ViewportSize.X / 2, L_34_.ViewportSize.Y / 2)
		L_113_.Visible = library_flags["FOV Circle"]
		L_114_.Visible = library_flags["FOV Circle"]
	end
}):AddColor({
	color = Color3.new(1, 1, 1),
	trans = 0.5,
	flag = "circleColor",
	callback = function()
		L_113_.Color = library_flags["circleColor"]
		L_114_.Color = library_flags["circleColor"]
	end,
	calltrans = function()
		L_113_.Transparency = 1 - L_5_.options["circleColor"].trans;
		L_114_.Transparency = 1 - L_5_.options["circleColor"].trans
	end
})
cba, cbb = L_5_.options["FOV Circle"].callback, L_5_.options["FOV Circle"].calltrans;
L_5_.options["FOV Circle"]:AddColor({
	flag = "silentCircleColor",
	color = Color3.new(1, 1, 0),
	trans = 0.5,
	callback = cba,
	calltrans = cbb
})
oldcash = L_32_.Cash.Value;
loadingCFG = false;
exploitMain:AddToggle({
	text = "Double Tap",
	callback = function(state)
		if env.applyDoubleTap then
			env.applyDoubleTap(state)
		end
	end
})
exploitMain:AddToggle({
	text = "No Fall Damage"
})
exploitMain:AddToggle({
	text = "Remove Flash",
	callback = removeFlashCallback
})
exploitMain:AddToggle({
	text = "No Fire Damage"
})
exploitMain:AddToggle({
    text = "Rapid Fire",
    flag = "rapid_fire",
    callback = function(val)
        env.RapidFire = val
    end
})
exploitMain:AddToggle({
	text = "Remove Recoil"
})
exploitMain:AddToggle({
	text = "Inf Ammo"
})
exploitMain:AddToggle({
	text = "Remove Spread",
	callback = function()
		if library_flags["Remove Spread"] then
			ApplyValue(true, "Spread", L_77_, 0.1)
		else
			ApplyValue(false, "Spread", L_77_, 0.1)
		end
	end
})
spawn(function()
    while task.wait(1) do
        if env.RapidFire then
            local function modifyWeapon(weapon)
                if env.RapidFire then
                    local fr = weapon:FindFirstChild("FireRate")
                    if fr and fr.Value ~= 0 then fr.Value = 0 end
                end
            end
            for _, weapon in game:GetService("ReplicatedStorage"):WaitForChild("Weapons"):GetChildren() do
                if weapon:IsA("Folder") then
                    modifyWeapon(weapon)
                end
            end
            local char = game.Players.LocalPlayer.Character
            if char then
                for _, weapon in char:GetChildren() do
                    if weapon:IsA("Model") or weapon:IsA("Tool") then
                        modifyWeapon(weapon)
                    end
                end
            end
        end
    end
end)

spawn(function()
    while task.wait() do
        local success, err = pcall(function()
            if not L_5_.open and L_57_.alive and L_57_.trigger and L_102_ then
                local mouse = game.Players.LocalPlayer:GetMouse()
                local target = mouse.Target
                if target and target.Parent then
                    local character = target.Parent:FindFirstChild("Humanoid") and target.Parent or (target.Parent.Parent and target.Parent.Parent:FindFirstChild("Humanoid") and target.Parent.Parent)
                    if character then
                        local plr = game.Players:GetPlayerFromCharacter(character)
                        if plr and teamCheck(plr, L_38_) and character.Humanoid.Health > 0 then
                            if L_36_ and L_36_.firebullet then
                                L_36_.firebullet(game.Players.LocalPlayer.Character.EquippedTool.Value)
                                task.wait(0.1)
                            end
                        end
                    end
                end
            end
        end)
    end
end)
MovementSimulator = {}
MovementSimulator.TICK_RATE = 1 / 64
MovementSimulator.GRAVITY = 800
MovementSimulator.JUMP_POWER = 300
MovementSimulator.MAX_SPEED = 250
MovementSimulator.MAX_AIR_SPEED = 30
MovementSimulator.ACCELERATION = 10
MovementSimulator.AIR_ACCELERATION = 100
MovementSimulator.FRICTION = 4
MovementSimulator.STOP_SPEED = 100
export type SimulationState = {
    pos: Vector3,
    vel: Vector3,
    isGrounded: boolean,
    isCrouching: boolean,
    tick: number
}
export type UserInput = {
    wishdir: Vector3,
    jump: boolean,
    duck: boolean
}
local function PM_Accelerate(vel: Vector3, wishdir: Vector3, wishspeed: number, accel: number, dt: number): Vector3
    local currentspeed = vel:Dot(wishdir)
    local addspeed = wishspeed - currentspeed
    if addspeed <= 0 then 
        return vel 
    end
    local accelspeed = accel * dt * wishspeed
    if accelspeed > addspeed then 
        accelspeed = addspeed 
    end
    return vel + (wishdir * accelspeed)
end
local function ApplyFriction(vel: Vector3, dt: number): Vector3
    local speed = vel.Magnitude
    if speed < 0.1 then
        return Vector3.zero
    end
    local drop = 0
    local control = (speed < MovementSimulator.STOP_SPEED) and MovementSimulator.STOP_SPEED or speed
    drop = control * MovementSimulator.FRICTION * dt
    local newspeed = math.max(speed - drop, 0)
    if newspeed ~= speed then
        newspeed = newspeed / speed
        return vel * newspeed
    end
    return vel
end
function MovementSimulator.ClipVelocity(vel: Vector3, normal: Vector3, overbounce: number): Vector3
    local backoff = vel:Dot(normal) * overbounce
    local newVel = vel - (normal * backoff)
    if math.abs(newVel.X) < 0.1 then newVel = Vector3.new(0, newVel.Y, newVel.Z) end
    if math.abs(newVel.Y) < 0.1 then newVel = Vector3.new(newVel.X, 0, newVel.Z) end
    if math.abs(newVel.Z) < 0.1 then newVel = Vector3.new(newVel.X, newVel.Y, 0) end
    return newVel
end
function MovementSimulator:Step(state: SimulationState, input: UserInput, collisionFunc: any): SimulationState
    local dt = self.TICK_RATE
    local newVel = state.vel
    if state.isGrounded then
        newVel = ApplyFriction(newVel, dt)
        if input.jump then
            newVel = Vector3.new(newVel.X, self.JUMP_POWER, newVel.Z)
            state.isGrounded = false
        else
            local groundWishdir = Vector3.new(input.wishdir.X, 0, input.wishdir.Z)
            if groundWishdir.Magnitude > 0 then groundWishdir = groundWishdir.Unit end
            newVel = PM_Accelerate(newVel, groundWishdir, self.MAX_SPEED, self.ACCELERATION, dt)
            newVel = Vector3.new(newVel.X, 0, newVel.Z)
        end
    else
        local airWishdir = Vector3.new(input.wishdir.X, 0, input.wishdir.Z)
        if airWishdir.Magnitude > 0 then airWishdir = airWishdir.Unit end
        newVel = PM_Accelerate(newVel, airWishdir, self.MAX_AIR_SPEED, self.AIR_ACCELERATION, dt)
        newVel -= Vector3.new(0, self.GRAVITY * dt, 0)
    end
    local hitboxSize = input.duck and Vector3.new(2, 3, 2) or Vector3.new(2, 5, 2)
    state.isCrouching = input.duck
    local targetPos = state.pos + (newVel * dt)
    local collision = collisionFunc(state.pos, targetPos, hitboxSize)
    if collision.hit then
        state.pos = collision.hitPos
        newVel = self.ClipVelocity(newVel, collision.normal, 1.0)
        if collision.normal.Y > 0.7 then 
            state.isGrounded = true
        elseif collision.normal.Y < -0.7 then
            state.isGrounded = false
            newVel = Vector3.new(newVel.X, math.min(newVel.Y, 0), newVel.Z)
        else
            state.isGrounded = false
        end
    else
        state.pos = targetPos
        if state.isGrounded then
            local groundCheck = collisionFunc(state.pos, state.pos - Vector3.new(0, 0.2, 0), hitboxSize)
            if not groundCheck.hit or groundCheck.normal.Y <= 0.7 then
                state.isGrounded = false
            end
        end
    end
    return {
        pos = state.pos,
        vel = newVel,
        isGrounded = state.isGrounded,
        isCrouching = state.isCrouching,
        tick = state.tick + 1
    }
end
MapAnalyzer = {}
MapAnalyzer.GridSize = 20
MapAnalyzer.Cells = {}
export type AABB = {
    min: Vector3,
    max: Vector3,
    part: BasePart | nil
}
export type CollisionResult = {
    hit: boolean,
    hitPos: Vector3,
    normal: Vector3,
    part: BasePart | nil
}
local function HashCoords(x: number, y: number, z: number): string
    local gx = math.floor(x / MapAnalyzer.GridSize)
    local gy = math.floor(y / MapAnalyzer.GridSize)
    local gz = math.floor(z / MapAnalyzer.GridSize)
    return gx .. "_" .. gy .. "_" .. gz
end
function MapAnalyzer:InsertAABB(box: AABB)
    local minX, minY, minZ = box.min.X, box.min.Y, box.min.Z
    local maxX, maxY, maxZ = box.max.X, box.max.Y, box.max.Z
    local minGx = math.floor(minX / self.GridSize)
    local minGy = math.floor(minY / self.GridSize)
    local minGz = math.floor(minZ / self.GridSize)
    local maxGx = math.floor(maxX / self.GridSize)
    local maxGy = math.floor(maxY / self.GridSize)
    local maxGz = math.floor(maxZ / self.GridSize)
    for x = minGx, maxGx do
        for y = minGy, maxGy do
            for z = minGz, maxGz do
                local hash = x .. "_" .. y .. "_" .. z
                if not self.Cells[hash] then
                    self.Cells[hash] = {}
                end
                table.insert(self.Cells[hash], box)
            end
        end
    end
end
function MapAnalyzer:InitMap(rootFolder: Instance)
    self.Cells = {}
    local count = 0
    for _, obj in rootFolder:GetDescendants() do
        if obj:IsA("BasePart") and obj.CanCollide then
            local cf = obj.CFrame
            local size = obj.Size / 2
            local rx, ry, rz = cf:ToEulerAnglesXYZ()
            local isRotated = math.abs(rx)>0.01 or math.abs(ry)>0.01 or math.abs(rz)>0.01
            local min, max
            if isRotated then
                local corners = {
                    cf * Vector3.new(size.X, size.Y, size.Z),
                    cf * Vector3.new(-size.X, size.Y, size.Z),
                    cf * Vector3.new(size.X, -size.Y, size.Z),
                    cf * Vector3.new(-size.X, -size.Y, size.Z),
                    cf * Vector3.new(size.X, size.Y, -size.Z),
                    cf * Vector3.new(-size.X, size.Y, -size.Z),
                    cf * Vector3.new(size.X, -size.Y, -size.Z),
                    cf * Vector3.new(-size.X, -size.Y, -size.Z),
                }
                min = corners[1]
                max = corners[1]
                for i=2, 8 do
                    min = Vector3.new(math.min(min.X, corners[i].X), math.min(min.Y, corners[i].Y), math.min(min.Z, corners[i].Z))
                    max = Vector3.new(math.max(max.X, corners[i].X), math.max(max.Y, corners[i].Y), math.max(max.Z, corners[i].Z))
                end
            else
                min = obj.Position - size
                max = obj.Position + size
            end
            self:InsertAABB({
                min = min,
                max = max,
                part = obj
            })
            count += 1
        end
    end
    print("NEVERGIVEUPPPPPPPPP", count, "parts.")
end
local function TestAABB(boxA: AABB, boxB: AABB): boolean
    return (boxA.min.X <= boxB.max.X and boxA.max.X >= boxB.min.X) and
           (boxA.min.Y <= boxB.max.Y and boxA.max.Y >= boxB.min.Y) and
           (boxA.min.Z <= boxB.max.Z and boxA.max.Z >= boxB.min.Z)
end
function MapAnalyzer:SweepAABB(startPos: Vector3, endPos: Vector3, hitboxSize: Vector3): CollisionResult
    local halfExtents = hitboxSize / 2
    local dir = endPos - startPos
    local dist = dir.Magnitude
    if dist == 0 then return {hit = false, hitPos = endPos, normal = Vector3.zero, part = nil} end
    local normalDir = dir.Unit
    local steps = math.ceil(dist / 0.5)
    local stepVec = dir / steps
    local currPos = startPos
    for step = 1, steps do
        local testPos = currPos + stepVec
        local playerBox = {
            min = testPos - halfExtents,
            max = testPos + halfExtents
        }
        local hash = HashCoords(testPos.X, testPos.Y, testPos.Z)
        local candidates = self.Cells[hash]
        if candidates then
            for _, box in candidates do
                if TestAABB(playerBox, box) then
                    local overlapX1 = playerBox.max.X - box.min.X
                    local overlapX2 = box.max.X - playerBox.min.X
                    local overlapY1 = playerBox.max.Y - box.min.Y
                    local overlapY2 = box.max.Y - playerBox.min.Y
                    local overlapZ1 = playerBox.max.Z - box.min.Z
                    local overlapZ2 = box.max.Z - playerBox.min.Z
                    local minOverlap = math.min(overlapX1, overlapX2, overlapY1, overlapY2, overlapZ1, overlapZ2)
                    local normal = Vector3.zero
                    if minOverlap == overlapY2 then normal = Vector3.new(0, 1, 0)
                    elseif minOverlap == overlapY1 then normal = Vector3.new(0, -1, 0)
                    elseif minOverlap == overlapX2 then normal = Vector3.new(1, 0, 0)
                    elseif minOverlap == overlapX1 then normal = Vector3.new(-1, 0, 0)
                    elseif minOverlap == overlapZ2 then normal = Vector3.new(0, 0, 1)
                    elseif minOverlap == overlapZ1 then normal = Vector3.new(0, 0, -1)
                    end
                    local safePos = currPos
                    return {
                        hit = true,
                        hitPos = safePos,
                        normal = normal,
                        part = box.part
                    }
                end
            end
        end
        currPos = testPos
    end
    return {
        hit = false,
        hitPos = endPos,
        normal = Vector3.zero,
        part = nil
    }
end
RouteGenerator = {}
RouteGenerator.BEAM_WIDTH = 250
RouteGenerator.MAX_TICKS = 64 * 8
local function RoundVec(v: Vector3, decimals: number)
    local mult = 10 ^ decimals
    return string.format("%.1f_%.1f_%.1f", 
        math.floor(v.X * mult + 0.5) / mult,
        math.floor(v.Y * mult + 0.5) / mult,
        math.floor(v.Z * mult + 0.5) / mult
    )
end
local function GetActionSpace(pos: Vector3, targetPos: Vector3): table
    local dirToTarget = (targetPos - pos)
    local flatDir = Vector3.new(dirToTarget.X, 0, dirToTarget.Z)
    if flatDir.Magnitude > 0 then flatDir = flatDir.Unit else flatDir = Vector3.new(1,0,0) end
    local lookCFrame = CFrame.lookAt(Vector3.zero, flatDir)
    local strafeRight = (lookCFrame * CFrame.Angles(0, math.rad(-70), 0)).LookVector
    local strafeLeft = (lookCFrame * CFrame.Angles(0, math.rad(70), 0)).LookVector
    return {
        {wishdir = flatDir, jump = false, duck = false, name = "Forward"},
        {wishdir = strafeRight, jump = false, duck = false, name = "StrafeRight"},
        {wishdir = strafeLeft, jump = false, duck = false, name = "StrafeLeft"},
        {wishdir = flatDir, jump = true, duck = false, name = "Jump"},
        {wishdir = flatDir, jump = true, duck = true, name = "DuckJump"}
    }
end
function RouteGenerator:GenerateRoute(startPos: Vector3, targetPos: Vector3, targetNormal: Vector3, targetType: string)
    targetNormal = targetNormal or Vector3.new(0, 1, 0)
    local dist = (startPos - targetPos).Magnitude
    local heightDiff = targetPos.Y - startPos.Y
    local horizontalDist = (Vector3.new(targetPos.X, 0, targetPos.Z) - Vector3.new(startPos.X, 0, startPos.Z)).Magnitude
    local combo = {}
    
    if targetType and targetType ~= "ground" then

        table.insert(combo, targetType)
    else
        local isWallTarget = math.abs(targetNormal.Y) < 0.3
        if isWallTarget then
            if math.random() > 0.4 then
                table.insert(combo, "pixelsurf (stand)")
            else
                table.insert(combo, "pixelsurf (duck)")
            end
        elseif heightDiff < -15 then
            table.insert(combo, "edgebug")
        elseif heightDiff < -0.5 then
            table.insert(combo, "jumpbug")
        elseif heightDiff > 2 then
            table.insert(combo, "duckjump")
        else
            if horizontalDist > 15 then
                table.insert(combo, "longjump")
            elseif horizontalDist > 8 then
                table.insert(combo, "jump")
            elseif horizontalDist > 4 then
                table.insert(combo, "minijump")
            else
                table.insert(combo, "walk")
            end
        end
    end
    
    local dummyHistory = {
        {pos = startPos}, {pos = targetPos}
    }
    return dummyHistory, table.concat(combo, " -> ")
end
function RouteGenerator:CompressHistory(history: table): string
    local compressed = {}
    local currAction = history[1]
    local count = 0
    for i=1, #history do
        if history[i] == currAction then
            count += 1
        else
            table.insert(compressed, currAction .. "(" .. count .. ")")
            currAction = history[i]
            count = 1
        end
    end
    table.insert(compressed, currAction .. "(" .. count .. ")")
    return table.concat(compressed, " -> ")
end
PointManager = {}
PointManager.Points = {}
function PointManager:Initialize(workspaceRoot)
    print("WHOODMMYLEGSS")
    MapAnalyzer:InitMap(workspaceRoot)
end
function PointManager:AddRoutePoint(position: Vector3, normal: Vector3)
    normal = normal or Vector3.new(0, 1, 0)
    local pType = "jump"
    
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    if game.Players.LocalPlayer and game.Players.LocalPlayer.Character then
        params.FilterDescendantsInstances = {game.Players.LocalPlayer.Character, workspace.CurrentCamera}
    end
    
    local ray = workspace:Raycast(position + Vector3.new(0, 0.1, 0), Vector3.new(0, -3, 0), params)
    if ray then
        pType = "ground"
    elseif math.abs(normal.Y) < 0.3 then
        pType = "pixelsurf"
    end
    
    table.insert(self.Points, {pos = position, normal = normal, type = pType})
    if RouteUI and RouteUI.RefreshPointsList then
        RouteUI:RefreshPointsList()
    end
    print("BROKALLY", position, "| Total:", #self.Points)
end
function PointManager:ClearPoints()
    table.clear(self.Points)
    local markersFolder = game.Workspace:FindFirstChild("RouteMarkers")
    if markersFolder then
        markersFolder:ClearAllChildren()
    end
    print("browhyuopenconsole")
end
function PointManager:GenerateFullRoute()
    local Players = game:GetService("Players")
    local routeNodes = {}
    local char = Players.LocalPlayer and Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local footPos = char.HumanoidRootPart.Position - Vector3.new(0, 2.5, 0)
        table.insert(routeNodes, {pos = footPos, normal = Vector3.new(0, 1, 0)})
    end
    for _, p in self.Points do
        table.insert(routeNodes, p)
    end
    if #routeNodes < 2 then
        return nil
    end
    local fullRouteCombo = {}
    local fullTickHistory = {}
    for i = 1, #routeNodes - 1 do
        local startNode = routeNodes[i]
        local endNode = routeNodes[i+1]
        local history, comboStr = RouteGenerator:GenerateRoute(startNode.pos, endNode.pos, endNode.normal, endNode.type)
        if not history then
            return nil
        end
        table.insert(fullRouteCombo, comboStr)
        for _, rawTick in history do
            table.insert(fullTickHistory, rawTick)
        end
    end
    local finalComboString = table.concat(fullRouteCombo, " -> ")
    return fullTickHistory, finalComboString
end
function PointManager:VisualizePath(tickHistory)
end
UserInputService = game:GetService("UserInputService")
Players = game:GetService("Players")
RunService = game:GetService("RunService")
RouteUI = {}
RouteUI.Enabled = false
RouteUI.Gui = nil
RouteUI.MarkersFolder = nil
THEME = {
    BGColor = Color3.fromRGB(17, 17, 17),
    Transparency = 0,
    TextColor = Color3.fromRGB(180, 180, 180),
    Font = Enum.Font.Arial,
    AccentColor = Color3.fromRGB(147, 208, 23),
}
function RouteUI:CreateGui()
    if self.Gui then self.Gui:Destroy() end
    local gui = Instance.new("ScreenGui")
    gui.Name = "RouteCalculatorUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    local hitlogContainer = Instance.new("Frame", gui)
    hitlogContainer.Name = "HitlogContainer"
    hitlogContainer.BackgroundTransparency = 1
    hitlogContainer.AnchorPoint = Vector2.new(0.5, 1)
    hitlogContainer.Size = UDim2.new(1, 0, 0, 400)
    hitlogContainer.Position = UDim2.new(0.5, 0, 0.85, 0)
    self.HitlogContainer = hitlogContainer
    local rcPanel = Instance.new("Frame")
    rcPanel.Name = "RouteCalc"
    env.RouteCalc = rcPanel
    rcPanel.Active = true
    rcPanel.Draggable = true
    rcPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    rcPanel.BackgroundTransparency = 0
    rcPanel.BorderSizePixel = 0
    rcPanel.Size = UDim2.new(0, 160, 0, 89)
    rcPanel.Position = UDim2.new(1, -180, 0, 20)
    rcPanel.ClipsDescendants = true
    rcPanel:GetPropertyChangedSignal("Position"):Connect(function()
        library_flags["ui_pos_RouteCalc"] = tostring(rcPanel.Position.X.Scale)..","..tostring(rcPanel.Position.X.Offset)..","..tostring(rcPanel.Position.Y.Scale)..","..tostring(rcPanel.Position.Y.Offset)
    end)
    rcPanel.Parent = gui
    local rcPanel_Corner = Instance.new("UICorner")
    rcPanel_Corner.CornerRadius = UDim.new(0, 4)
    rcPanel_Corner.Parent = rcPanel
    local rcPanel_Stroke = Instance.new("UIStroke")
    rcPanel_Stroke.Thickness = 1
    rcPanel_Stroke.Color = Color3.fromRGB(65, 65, 65)
    rcPanel_Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    rcPanel_Stroke.Parent = rcPanel
    local rcPanel_Extras = Instance.new("Folder")
    rcPanel_Extras.Name = "Extras"
    rcPanel_Extras.Parent = rcPanel
    local rcPanel_OuterOutline = Instance.new("Frame")
    rcPanel_OuterOutline.Name = "Outline"
    rcPanel_OuterOutline.Size = UDim2.new(1, 2, 1, 2)
    rcPanel_OuterOutline.Position = UDim2.new(0, -1, 0, -1)
    rcPanel_OuterOutline.BackgroundTransparency = 1
    rcPanel_OuterOutline.ZIndex = rcPanel.ZIndex - 1
    rcPanel_OuterOutline.Parent = rcPanel_Extras
    local rcPanel_OuterCorner = Instance.new("UICorner")
    rcPanel_OuterCorner.CornerRadius = UDim.new(0, 5)
    rcPanel_OuterCorner.Parent = rcPanel_OuterOutline
    local rcPanel_OuterStroke = Instance.new("UIStroke")
    rcPanel_OuterStroke.Thickness = 1
    rcPanel_OuterStroke.Color = Color3.new(0, 0, 0)
    rcPanel_OuterStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    rcPanel_OuterStroke.Parent = rcPanel_OuterOutline
    local paddingRC = Instance.new("UIPadding", rcPanel)
    paddingRC.PaddingLeft = UDim.new(0, 11)
    paddingRC.PaddingRight = UDim.new(0, 11)
    paddingRC.PaddingTop = UDim.new(0, 8)
    paddingRC.PaddingBottom = UDim.new(0, 8)
    local titleRC = Instance.new("TextLabel", rcPanel)
    titleRC.Text = "route calculator"
    titleRC.Font = Enum.Font.GothamBold
    titleRC.TextSize = 13
    titleRC.TextColor3 = Color3.new(1, 1, 1)
    titleRC.BackgroundTransparency = 1
    titleRC.Size = UDim2.new(1, 0, 0, 13)
    titleRC.Position = UDim2.new(0, 0, 0, 0)
    local textLeft = Instance.new("TextLabel", rcPanel)
    textLeft.Text = "add point\ncalculate combos\ndelete point\nclear all points"
    textLeft.Font = Enum.Font.GothamSemibold
    textLeft.TextSize = 13
    textLeft.TextColor3 = Color3.fromRGB(155, 155, 155)
    textLeft.BackgroundTransparency = 1
    textLeft.Size = UDim2.new(1, 0, 1, -17)
    textLeft.Position = UDim2.new(0, 0, 0, 17)
    textLeft.TextXAlignment = Enum.TextXAlignment.Left
    textLeft.TextYAlignment = Enum.TextYAlignment.Top
    local textRight = Instance.new("TextLabel", rcPanel)
    textRight.Text = "F1\nF2\nF3\nF4"
    textRight.Font = Enum.Font.GothamSemibold
    textRight.TextSize = 13
    textRight.TextColor3 = Color3.fromRGB(155, 155, 155)
    textRight.BackgroundTransparency = 1
    textRight.Size = UDim2.new(1, 0, 1, -17)
    textRight.Position = UDim2.new(0, 0, 0, 17)
    textRight.TextXAlignment = Enum.TextXAlignment.Right
    textRight.TextYAlignment = Enum.TextYAlignment.Top
    self.Gui = gui
    local coreGui = game:GetService("CoreGui")
    pcall(function() self.Gui.Parent = coreGui end)
    if not self.Gui.Parent then
        self.Gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end
end
function RouteUI:Hitlog(text, duration)
    if not self.HitlogContainer then return end
    duration = duration or 5
    local logFrame = Instance.new("Frame", self.HitlogContainer)
    logFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    logFrame.BackgroundTransparency = 0.1
    logFrame.AnchorPoint = Vector2.new(0.5, 1)
    logFrame.Size = UDim2.new(0, 0, 0, 0)
    logFrame.AutomaticSize = Enum.AutomaticSize.XY
    logFrame.Position = UDim2.new(0.5, 0, 1, 0)
    local sizeConstraint = Instance.new("UISizeConstraint", logFrame)
    local viewportX = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.X or 1920
    sizeConstraint.MaxSize = Vector2.new(viewportX - 40, math.huge)
    local corner = Instance.new("UICorner", logFrame)
    corner.CornerRadius = UDim.new(0, 4)
    local topBorder = Instance.new("Frame", logFrame)
    topBorder.BackgroundColor3 = THEME.AccentColor
    topBorder.Size = UDim2.new(1, 0, 0, 2)
    topBorder.BorderSizePixel = 0
    local label = Instance.new("TextLabel", logFrame)
    label.Text = "  " .. text .. "  "
    label.Font = Enum.Font.Code
    label.TextSize = 13
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextStrokeTransparency = 1
    label.BackgroundTransparency = 1
    label.TextWrapped = true
    label.AutomaticSize = Enum.AutomaticSize.XY
    label.Size = UDim2.new(0, 0, 0, 0)
    label.Position = UDim2.new(0, 0, 0, 4)
    label.TextXAlignment = Enum.TextXAlignment.Center
    local padding = Instance.new("UIPadding", logFrame)
    padding.PaddingBottom = UDim.new(0, 6)
    local currentLogs = self.HitlogContainer:GetChildren()
    for _, child in currentLogs do
        if child ~= logFrame and child:IsA("Frame") then
            child.Position = child.Position - UDim2.new(0, 0, 0, 28)
        end
    end
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
    local tween = game:GetService("TweenService"):Create(topBorder, tweenInfo, {Size = UDim2.new(0, 0, 0, 2)})
    tween:Play()
    task.delay(duration, function()
        if logFrame then logFrame:Destroy() end
    end)
end
function RouteUI:UpdateMarkers()
    if not self.MarkersFolder then
        self.MarkersFolder = Instance.new("Folder", game.Workspace)
        self.MarkersFolder.Name = "RouteMarkers"
    end
    self.MarkersFolder:ClearAllChildren()
    for i, data in PointManager.Points do
        local part = Instance.new("Part", self.MarkersFolder)
        part.Anchored = true
        part.CanCollide = false
        part.Transparency = 1
        part.Position = data.pos
        part.Size = Vector3.new(1,1,1)
        local bb = Instance.new("BillboardGui", part)
        bb.Size = UDim2.new(0, 25, 0, 25)
        bb.AlwaysOnTop = true
        local bg = Instance.new("Frame", bb)
        bg.Size = UDim2.new(1,0,1,0)
        bg.BackgroundColor3 = THEME.BGColor
        bg.BackgroundTransparency = 0.2
        local corner = Instance.new("UICorner", bg)
        corner.CornerRadius = UDim.new(1, 0)
        if i == #PointManager.Points then
            local stroke = Instance.new("UIStroke", bg)
            stroke.Color = THEME.AccentColor
            stroke.Thickness = 2
            local label = Instance.new("TextLabel", bb)
            label.Text = "point " .. i
            label.Position = UDim2.new(0, 0, 0, -20)
            label.Size = UDim2.new(1, 0, 0, 20)
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(1,1,1)
            label.Font = Enum.Font.GothamMedium
            label.TextSize = 10
        end
        local num = Instance.new("TextLabel", bg)
        num.Text = tostring(i)
        num.Size = UDim2.new(1,0,1,0)
        num.BackgroundTransparency = 1
        num.TextColor3 = Color3.new(1,1,1)
        num.Font = Enum.Font.GothamBold
        num.TextSize = 12
    end
end
function RouteUI:GetAimPosition()
    local cam = game.Workspace.CurrentCamera
    local mouse = game.Players.LocalPlayer:GetMouse()
    local unitRay = cam:ScreenPointToRay(mouse.X, mouse.Y)
    
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    
    local filters = {self.MarkersFolder, cam}
    local char = game.Players.LocalPlayer.Character
    if char then table.insert(filters, char) end
    
    local hitboxes = game.Workspace:FindFirstChild("Hitboxes")
    if hitboxes then table.insert(filters, hitboxes) end
    

    local ignoreFolders = {"Viewmodels", "Ignore", "Debris"}
    for _, name in ignoreFolders do
        local f = game.Workspace:FindFirstChild(name)
        if f then table.insert(filters, f) end
    end
    
    params.FilterDescendantsInstances = filters
    
    local origin = unitRay.Origin
    local direction = unitRay.Direction * 2000
    local res = game.Workspace:Raycast(origin, direction, params)
    

    local safety = 0
    while res and safety < 10 and (res.Instance.Name == "Hitbox" or res.Instance.Name == "FakeHead" or res.Instance.Name == "HeadHB" or res.Instance:FindFirstAncestor("Hitboxes")) do
        table.insert(filters, res.Instance)
        params.FilterDescendantsInstances = filters
        res = game.Workspace:Raycast(origin, direction, params)
        safety = safety + 1
    end
    
    if res then
        return res.Position, res.Normal
    end
    return nil, nil
end
function RouteUI:SetupInput()
    if self._inputConnection then
        self._inputConnection:Disconnect()
        self._inputConnection = nil
    end
    self._inputConnection = UserInputService.InputBegan:Connect(function(input, processed)
        if processed or not self.Enabled then return end
        if not alive() then return end
        if input.KeyCode == Enum.KeyCode.F1 then
            local pos, normal = self:GetAimPosition()
            if pos then
                PointManager:AddRoutePoint(pos, normal)
                self:UpdateMarkers()
            end
        elseif input.KeyCode == Enum.KeyCode.F2 then
            if #PointManager.Points < 1 then return end
            task.spawn(function()
                local history, combo = PointManager:GenerateFullRoute()
                if combo then
                    self:Hitlog(combo, 15)
                end
            end)
        elseif input.KeyCode == Enum.KeyCode.F3 then
            local cam = game.Workspace.CurrentCamera
            local camPos = cam.CFrame.Position
            local lookDir = cam.CFrame.LookVector
            local closestIdx = -1
            local maxDot = 0.98
            for i, data in PointManager.Points do
                local dirToPoint = (data.pos - camPos).Unit
                local dot = lookDir:Dot(dirToPoint)
                if dot > maxDot then
                    maxDot = dot
                    closestIdx = i
                end
            end
            if closestIdx ~= -1 then
                table.remove(PointManager.Points, closestIdx)
                self:UpdateMarkers()
            end
        elseif input.KeyCode == Enum.KeyCode.F4 then
            PointManager:ClearPoints()
            self:UpdateMarkers()
        end
    end)
end
function RouteUI:Start()
    self.Enabled = true
    PointManager:ClearPoints()
    PointManager:Initialize(game.Workspace)
    self:CreateGui()
    self:SetupInput()
end
(function()
	calcSubTab = movementTab:AddSubTab("Calculator")
	local calcCol1 = calcSubTab:AddColumn()
	local calcCol2 = calcSubTab:AddColumn()
	
	local masterSec = calcCol1:AddSection("master")
	masterSec:AddToggle({text = "enable route calculator", flag = "calcEnable", callback = function(val)
		if val then
			RouteUI:Start()
		else
			RouteUI.Enabled = false
			if RouteUI.Gui then RouteUI.Gui:Destroy(); RouteUI.Gui = nil end
			if RouteUI.MarkersFolder then RouteUI.MarkersFolder:ClearAllChildren() end
		end
	end})
	
	local prefSec = calcCol1:AddSection("preferences")
	prefSec:AddToggle({text = "use current pos for start jump", flag = "calcUseCurrentPos"})
	prefSec:AddToggle({text = "stop calculating at max displayed", flag = "calcStopAtMax"})
	prefSec:AddToggle({text = "calculation timeout", flag = "calcTimeout"})
	prefSec:AddToggle({text = "allow selecting invalid pixels", flag = "calcInvalid"})
	prefSec:AddSlider({text = "max displayed combos", flag = "calcMaxCombos", min = 1, max = 20, value = 6, float = 1})
	prefSec:AddSlider({text = "delayed hop amount", flag = "calcDelayedHop", min = 1, max = 10, value = 2, float = 1})
	
	local pointsSec = calcCol2:AddSection("added points")
	

	local listBox = Instance.new("Frame")
	listBox.Size = UDim2.new(1, -10, 0, 150)
	listBox.Position = UDim2.new(0, 5, 0, 0)
	listBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	listBox.BorderColor3 = Color3.fromRGB(40, 40, 40)
	listBox.Parent = pointsSec.content
	
	local scrollFrame = Instance.new("ScrollingFrame")
	scrollFrame.Size = UDim2.new(1, 0, 1, 0)
	scrollFrame.BackgroundTransparency = 1
	scrollFrame.ScrollBarThickness = 2
	scrollFrame.Parent = listBox
	
	local scrollLayout = Instance.new("UIListLayout", scrollFrame)
	scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
	scrollLayout.Padding = UDim.new(0, 2)
	
	local scrollPad = Instance.new("UIPadding", scrollFrame)
	scrollPad.PaddingTop = UDim.new(0, 4)
	scrollPad.PaddingLeft = UDim.new(0, 4)
	scrollPad.PaddingRight = UDim.new(0, 4)
	
	RouteUI.CustomListContainer = scrollFrame
	RouteUI.CustomListLayout = scrollLayout

	pointsSec:AddButton({text = "clear all points", callback = function()
		PointManager:ClearPoints()
		library_flags.calcSelectedPoint = nil
		if RouteUI.UpdateMarkers then RouteUI:UpdateMarkers() end
		if RouteUI.RefreshPointsList then RouteUI:RefreshPointsList() end
	end})
	
	local ptTypeSec = calcCol2:AddSection("point type")
	local ptTypeOpt = ptTypeSec:AddList({text = "point type", flag = "calcEditPointType", values = {"ground", "pixelsurf", "jump", "duckjump", "longjump", "walk", "jumpbug", "edgebug"}, value = "ground", callback = function(val)
		local selIdx = library_flags.calcSelectedPoint
		if selIdx and PointManager.Points[selIdx] then
			PointManager.Points[selIdx].type = val
			if RouteUI.RefreshPointsList then RouteUI:RefreshPointsList() end
		end
	end})
	
	local typeSec = calcCol2:AddSection("types to calculate")
	typeSec:AddList({text = "start type", flag = "calcType", values = {"jump (stand)", "longjump", "walk off (stand)", "jump"}, multiselect = true})
	typeSec:AddToggle({text = "allow delayed jump", flag = "calcAllowDelayedJump"})
	
	function RouteUI:RefreshPointsList()
		if not RouteUI.CustomListContainer then return end
		

		for _, v in RouteUI.CustomListContainer:GetChildren() do
			if v:IsA("TextButton") or v:IsA("TextLabel") then
				v:Destroy()
			end
		end
		
		local startLabel = Instance.new("TextLabel")
		startLabel.Size = UDim2.new(1, 0, 0, 16)
		startLabel.BackgroundTransparency = 1
		startLabel.Text = "starting jump (current position)"
		startLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		startLabel.Font = Enum.Font.Gotham
		startLabel.TextSize = 12
		startLabel.TextXAlignment = Enum.TextXAlignment.Left
		startLabel.Parent = RouteUI.CustomListContainer
		
		for i, pt in PointManager.Points do
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, 0, 0, 16)
			btn.BackgroundTransparency = 1
			btn.Text = "point " .. i .. ": " .. (pt.type or "ground")
			btn.TextColor3 = (library_flags.calcSelectedPoint == i) and Color3.fromRGB(0, 200, 50) or Color3.fromRGB(200, 200, 200)
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 12
			btn.TextXAlignment = Enum.TextXAlignment.Left
			btn.Parent = RouteUI.CustomListContainer
			
			btn.MouseButton1Click:Connect(function()
				library_flags.calcSelectedPoint = i
				if ptTypeOpt and ptTypeOpt.SetValue then
					ptTypeOpt:SetValue(pt.type or "ground")
				end
				RouteUI:RefreshPointsList()
			end)
			
			if library_flags.calcSelectedPoint == i then
				local trash = Instance.new("TextButton")
				trash.Size = UDim2.new(0, 16, 0, 16)
				trash.Position = UDim2.new(1, -16, 0, 0)
				trash.BackgroundTransparency = 1
				trash.Text = "🗑"
				trash.TextColor3 = Color3.fromRGB(200, 200, 200)
				trash.Font = Enum.Font.Gotham
				trash.TextSize = 12
				trash.Parent = btn
				trash.MouseButton1Click:Connect(function()
					table.remove(PointManager.Points, i)
					library_flags.calcSelectedPoint = nil
					RouteUI:RefreshPointsList()
					RouteUI:UpdateMarkers()
				end)
				
				local moveDown = Instance.new("TextButton")
				moveDown.Size = UDim2.new(0, 16, 0, 16)
				moveDown.Position = UDim2.new(1, -32, 0, 0)
				moveDown.BackgroundTransparency = 1
				moveDown.Text = "v"
				moveDown.TextColor3 = Color3.fromRGB(200, 200, 200)
				moveDown.Font = Enum.Font.Gotham
				moveDown.TextSize = 12
				moveDown.Parent = btn
				moveDown.MouseButton1Click:Connect(function()
					if i < #PointManager.Points then
						local temp = PointManager.Points[i]
						PointManager.Points[i] = PointManager.Points[i+1]
						PointManager.Points[i+1] = temp
						library_flags.calcSelectedPoint = i+1
						RouteUI:RefreshPointsList()
						RouteUI:UpdateMarkers()
					end
				end)
				
				local moveUp = Instance.new("TextButton")
				moveUp.Size = UDim2.new(0, 16, 0, 16)
				moveUp.Position = UDim2.new(1, -48, 0, 0)
				moveUp.BackgroundTransparency = 1
				moveUp.Text = "^"
				moveUp.TextColor3 = Color3.fromRGB(200, 200, 200)
				moveUp.Font = Enum.Font.Gotham
				moveUp.TextSize = 12
				moveUp.Parent = btn
				moveUp.MouseButton1Click:Connect(function()
					if i > 1 then
						local temp = PointManager.Points[i]
						PointManager.Points[i] = PointManager.Points[i-1]
						PointManager.Points[i-1] = temp
						library_flags.calcSelectedPoint = i-1
						RouteUI:RefreshPointsList()
						RouteUI:UpdateMarkers()
					end
				end)
			end
		end
		
		RouteUI.CustomListContainer.CanvasSize = UDim2.new(0, 0, 0, RouteUI.CustomListLayout.AbsoluteContentSize.Y + 10)
	end
end)();
(function()
	local skinTab = L_5_:AddTab("Skins")
	local skinCol1 = skinTab:AddColumn()
	env.SkinCol1 = skinCol1
	local skinCol2 = skinTab:AddColumn()
	local knifeSection = skinCol1:AddSection("Knife Changer")
	local knifeSkinSection = skinCol1:AddSection("Knife Skins")
	local gloveSection = skinCol2:AddSection("Glove Changer")
	local sleeveSection = generalCol2:AddSection("Sleeve Position Changer")
	local weaponSection = skinCol2:AddSection("Weapon Skin Changer")
	local RS = game:GetService("ReplicatedStorage")
	local Camera = workspace.CurrentCamera
	local Skins = RS:FindFirstChild("Skins") or RS:WaitForChild("Skins", 10)
	local Viewmodels = RS:FindFirstChild("Viewmodels") or RS:WaitForChild("Viewmodels", 10)
	local Gloves = RS:FindFirstChild("Gloves") or RS:WaitForChild("Gloves", 10)
	local GloveModels = Gloves and Gloves:FindFirstChild("Models")
	local Models = nil
	pcall(function() Models = game:GetObjects("rbxassetid://7285197035")[1] end)
	if Models then repeat wait() until Models ~= nil end
	local OriginalCTKnife = Viewmodels and Viewmodels:FindFirstChild("v_CT Knife") and Viewmodels:FindFirstChild("v_CT Knife"):Clone()
	local OriginalTKnife = Viewmodels and Viewmodels:FindFirstChild("v_T Knife") and Viewmodels:FindFirstChild("v_T Knife"):Clone()
	local customSkins = {
		{["Weapon"] = "AWP", ["SkinName"] = "Bot", ["Skin"] = {["Scope"] = "6572594838", ["Handle"] = "6572594077"}}
	}
	if Skins then
		for _, skin in customSkins do
			pcall(function()
				if Skins:FindFirstChild(skin["Weapon"]) then
					local Folder = Instance.new("Folder")
					Folder.Name = skin["SkinName"]
					Folder.Parent = Skins[skin["Weapon"]]
					for partName, texId in skin["Skin"] do
						local val = Instance.new("StringValue")
						val.Name = partName
						val.Value = "rbxassetid://" .. texId
						val.Parent = Folder
					end
				end
			end)
		end
	end
	local AllKnives = {
		"CT Knife",
		"T Knife",
		"Banana",
		"Bayonet",
		"Bearded Axe",
		"Butterfly Knife",
		"Cleaver",
		"Crowbar",
		"Falchion Knife",
		"Flip Knife",
		"Gut Knife",
		"Huntsman Knife",
		"Karambit",
		"M9 Bayonet",
		"Sickle",
	}
	if Models and Models:FindFirstChild("Knives") then
		for _, v in Models.Knives:GetChildren() do
			table.insert(AllKnives, v.Name)
		end
	end
	local AllWeapons = {}
	local AllSkins = {}
	if Skins then
		for _, v in Skins:GetChildren() do
			local isKnife = false
			for _, knife in AllKnives do
				local cleanKnife = knife:gsub(" Knife", ""):gsub(" Classic", "")
				local cleanLower = cleanKnife:lower()
				if v.Name:lower() == cleanLower or v.Name:lower():sub(1, #cleanLower + 1) == cleanLower .. " " then
					isKnife = true
					break
				end
			end
			if not isKnife then
				table.insert(AllWeapons, v.Name)
			end
		end
		table.sort(AllWeapons, function(a, b) return a < b end)
		for _, v in AllWeapons do
			AllSkins[v] = {"Inventory"}
			for _, v2 in Skins[v]:GetChildren() do
				table.insert(AllSkins[v], v2.Name)
			end
		end
	end
	local ActiveAnimations = {}
	local AllGloveNamesList = {}
	local AllGloves = {}
	if Gloves then
		for _, fldr in Gloves:GetChildren() do
			if fldr ~= GloveModels and fldr.Name ~= "Racer" and fldr.Name ~= "Models" then
				table.insert(AllGloveNamesList, fldr.Name)
			end
		end
		table.sort(AllGloveNamesList, function(a, b) return a < b end)
		for _, gName in AllGloveNamesList do
			AllGloves[gName] = {"Default"}
			for _, modl in Gloves[gName]:GetChildren() do
				table.insert(AllGloves[gName], modl.Name)
			end
		end
	end
	local AllSleeves = {"Default", "None"}
	local SleeveTemplates = {}
	local function findArmSleeve(arm)
		if not arm then return nil end
		for _, d in arm:GetDescendants() do
			if string.find(string.lower(d.Name), "sleeve") and (d:IsA("BasePart") or d:IsA("MeshPart")) then
				return d
			end
		end
		return nil
	end
	local function modelHasSleeve(model)
		if not model then return false end
		for _, d in model:GetDescendants() do
			if string.find(string.lower(d.Name), "sleeve") and (d:IsA("BasePart") or d:IsA("MeshPart")) then
				return true
			end
		end
		return false
	end
	local function getSideFromSleeve(part)
		local path = string.lower(part.Name)
		local parent = part.Parent
		while parent do
			path = path .. " " .. string.lower(parent.Name)
			parent = parent.Parent
		end
		if string.find(path, "right") or string.find(path, "rarm") or string.find(path, "r_") then
			return "R"
		end
		if string.find(path, "left") or string.find(path, "larm") or string.find(path, "l_") then
			return "L"
		end
		return nil
	end
	local function sleeveTemplateName(name, model)
		name = tostring(name or "Sleeve"):gsub("^v_", ""):gsub("Arms$", "")
		if not SleeveTemplates[name] then return name end
		local parentName = model and model.Parent and model.Parent.Name or "Model"
		local altName = parentName .. " " .. name
		if not SleeveTemplates[altName] then return altName end
		local i = 2
		while SleeveTemplates[altName .. " " .. tostring(i)] do
			i = i + 1
		end
		return altName .. " " .. tostring(i)
	end
	local function registerSleeveTemplate(name, model)
		if not name or not model then return end
		local rArm = model and model:FindFirstChild("Right Arm", true)
		local lArm = model and model:FindFirstChild("Left Arm", true)
		local rSleeve = findArmSleeve(rArm)
		local lSleeve = findArmSleeve(lArm)
		if not rSleeve or not lSleeve then
			for _, d in model:GetDescendants() do
				if string.find(string.lower(d.Name), "sleeve") and (d:IsA("BasePart") or d:IsA("MeshPart")) then
					local side = getSideFromSleeve(d)
					if side == "R" and not rSleeve then
						rSleeve = d
					elseif side == "L" and not lSleeve then
						lSleeve = d
					elseif not rSleeve then
						rSleeve = d
					elseif not lSleeve then
						lSleeve = d
					end
				end
			end
		end
		if rSleeve or lSleeve then
			name = tostring(name or "Sleeve"):gsub("^v_", ""):gsub("Arms$", ""):gsub("^%s+", ""):gsub("%s+$", "")
			if name:lower():find("old") or name:lower():find("viewmodel") then return end
			if SleeveTemplates[name] then return name end
			local rOffset = (rSleeve and rArm) and rArm.CFrame:ToObjectSpace(rSleeve.CFrame) or nil
			local lOffset = (lSleeve and lArm) and lArm.CFrame:ToObjectSpace(lSleeve.CFrame) or nil
			SleeveTemplates[name] = {
				R = rSleeve and rSleeve:Clone() or nil,
				L = lSleeve and lSleeve:Clone() or nil,
				RO = rOffset,
				LO = lOffset,
			}
			table.insert(AllSleeves, name)
			return name
		end
	end
	local scannedSleeveModels = {}
	local function isInsideViewmodels(inst)
		local p = inst
		while p do
			if p == Viewmodels then return true end
			p = p.Parent
		end
		return false
	end
	local function scanSleeveRoot(root)
		if not root then return end
		pcall(function()
			local rn = string.lower(root.Name)
			if root:IsA("Model") and not scannedSleeveModels[root] and not isInsideViewmodels(root) and modelHasSleeve(root) and not rn:find("old") and not rn:find("viewmodel") then
				scannedSleeveModels[root] = true
				registerSleeveTemplate(root.Name, root)
			end
			for _, model in root:GetDescendants() do
				local mn = string.lower(model.Name)
				if model:IsA("Model") and not scannedSleeveModels[model] and not isInsideViewmodels(model) and modelHasSleeve(model) and not mn:find("old") and not mn:find("viewmodel") then
					scannedSleeveModels[model] = true
					registerSleeveTemplate(model.Name, model)
				end
			end
		end)
	end
	if Viewmodels then
		for _, vm in Viewmodels:GetChildren() do
			if vm:IsA("Model") and (vm:FindFirstChild("Right Arm", true) or vm:FindFirstChild("Left Arm", true)) then
				local cleanName = vm.Name:gsub("^v_", "")
				registerSleeveTemplate(cleanName, vm)
			end
			for _, model in vm:GetChildren() do
				if model:IsA("Model") and (model:FindFirstChild("Right Arm", true) or model:FindFirstChild("Left Arm", true)) then
					local cleanName = model.Name:gsub("Arms$", ""):gsub("^v_", "")
					registerSleeveTemplate(cleanName, model)
				end
			end
		end
	end
	for _, rootName in {"Characters", "CharacterModels", "Agents", "PlayerModels", "Models", "CeeT", "Tee"} do
		scanSleeveRoot(RS:FindFirstChild(rootName))
	end
	scanSleeveRoot(RS)
	table.sort(AllSleeves, function(a, b)
		if a == "Default" then return true end
		if b == "Default" then return false end
		if a == "None" then return true end
		if b == "None" then return false end
		return a < b
	end)
	env.AllSleeves = AllSleeves
	env.SleeveTemplates = SleeveTemplates
	local function applySleeveChanger(model)
		if not model then return end
		local team = "T"
		pcall(function()
			if L_32_:FindFirstChild("Status") and L_32_.Status:FindFirstChild("Team") then
				team = L_32_.Status.Team.Value
			end
		end)
		if not library_flags["skinSleeveChanger"] then return end
		local selected = team == "CT" and library_flags["skinSleeveCT"] or library_flags["skinSleeveT"]
		selected = selected or "Default"
		if not selected or selected == "" then return end
		local rArm = model:FindFirstChild("Right Arm") or model:FindFirstChild("Right Arm", true)
		local lArm = model:FindFirstChild("Left Arm") or model:FindFirstChild("Left Arm", true)
		if not rArm and not lArm then return end
		local function isAppliedOk(arm)
			if not arm then return true end
			local s = arm:FindFirstChild("Sleeve")
			if not s then return false end
			return s:GetAttribute("Applied") == selected
		end
		if isAppliedOk(rArm) and isAppliedOk(lArm) then return end
		local originals = model:FindFirstChild("OriginalSleeves")
		local originalR = findArmSleeve(rArm)
		local originalL = findArmSleeve(lArm)
		if not originals then
			if (not originalR and not originalL) and selected == "Default" then return end
			originals = Instance.new("Folder")
			originals.Name = "OriginalSleeves"
			originals.Parent = model
			local function stash(src, name)
				local c = src:Clone()
				c.Name = name
				for _, j in c:GetDescendants() do
					if j:IsA("Weld") or j:IsA("WeldConstraint") or j:IsA("Motor6D") or j:IsA("JointInstance") then
						j:Destroy()
					end
				end
				if c:IsA("BasePart") or c:IsA("MeshPart") then
					c.Anchored = true
					c.CanCollide = false
					c.Transparency = 1
				end
				c.Parent = originals
				return c
			end
			if originalR and rArm then
				stash(originalR, "R")
				local off = Instance.new("CFrameValue", originals)
				off.Name = "RO"
				off.Value = rArm.CFrame:ToObjectSpace(originalR.CFrame)
			end
			if originalL and lArm then
				stash(originalL, "L")
				local off = Instance.new("CFrameValue", originals)
				off.Name = "LO"
				off.Value = lArm.CFrame:ToObjectSpace(originalL.CFrame)
			end
		end
		for _, d in model:GetDescendants() do
			if (d:IsA("BasePart") or d:IsA("MeshPart")) and string.find(string.lower(d.Name), "sleeve") then
				if not (d.Parent == originals) then
					d:Destroy()
				end
			end
		end
		local function isGloveDesc(p)
			local x = p
			while x and x ~= model do
				if x.Name == "Glove" or string.find(string.lower(x.Name), "glove") then return true end
				x = x.Parent
			end
			return false
		end
		for _, arm in {rArm, lArm} do
			if arm and (arm:IsA("BasePart") or arm:IsA("MeshPart")) then
				if arm:GetAttribute("OrigTrans") ~= nil then
					arm.Transparency = arm:GetAttribute("OrigTrans")
					arm:SetAttribute("OrigTrans", nil)
				end
			end
		end
		local function attachSleeve(src, arm, offset)
			if not src or not arm then return end
			local sleeve = src:Clone()
			sleeve.Name = "Sleeve"
			sleeve.Anchored = false
			sleeve.CanCollide = false
			sleeve.Massless = true
			sleeve.Transparency = 0
			for _, j in sleeve:GetDescendants() do
				if j:IsA("Weld") or j:IsA("WeldConstraint") or j:IsA("Motor6D") or j:IsA("JointInstance") then
					j:Destroy()
				end
			end
			sleeve.Parent = arm
			
			local motor = Instance.new("Motor6D")
			motor.Name = "SleeveMotor"
			motor.Part0 = arm
			motor.Part1 = sleeve
			motor.C0 = offset or CFrame.new()
			motor.C1 = CFrame.new()
			motor.Parent = sleeve
			
			sleeve:SetAttribute("Applied", selected)
		end
		if selected == "Default" then
			local rOff = originals:FindFirstChild("RO")
			local lOff = originals:FindFirstChild("LO")
			attachSleeve(originals:FindFirstChild("R"), rArm, rOff and rOff.Value or nil)
			attachSleeve(originals:FindFirstChild("L"), lArm, lOff and lOff.Value or nil)
			return
		end
		if selected == "None" then return end
		local template = SleeveTemplates[selected]
		if not template then return end
		attachSleeve(template.R, rArm, template.RO)
		attachSleeve(template.L, lArm, template.LO)
	end
	local function applySleeveChangerToCurrent()
		local arms = Camera and Camera:FindFirstChild("Arms")
		if not arms then return end
		local sx = (library_flags["skinSleeveX"] or 0) / 10
		local sy = (library_flags["skinSleeveY"] or 0) / 10
		local sz = (library_flags["skinSleeveZ"] or 0) / 10
		for _, d in arms:GetDescendants() do
			if string.find(string.lower(d.Name), "sleeve") and (d:IsA("BasePart") or d:IsA("MeshPart")) then
				local motor = d:FindFirstChild("SleeveMotor") or d:FindFirstChildWhichIsA("Motor6D")
				if motor then
					local origC1 = motor:GetAttribute("OrigC1")
					if not origC1 then
						origC1 = motor.C1
						motor:SetAttribute("OrigC1", origC1)
					end
					motor.C1 = origC1 * CFrame.new(sx, sy, -sz):Inverse()
				end
			end
		end
	end
	env.ApplySleeveChangerToCurrent = applySleeveChangerToCurrent
	game:GetService("RunService").RenderStepped:Connect(function()
		pcall(applySleeveChangerToCurrent)
	end)
	env.CaptureCurrentSleeves = function(templateName)
		return nil
	end
	local currentKnife = nil
	local swapping = false
local function SwapKnifeModel(knifeName)
		if swapping then return end
		if currentKnife == knifeName then return end
		swapping = true
		if Viewmodels:FindFirstChild("v_CT Knife") then
			Viewmodels:FindFirstChild("v_CT Knife"):Destroy()
		end
		if Viewmodels:FindFirstChild("v_T Knife") then
			Viewmodels:FindFirstChild("v_T Knife"):Destroy()
		end
		wait()
		if knifeName == "CT Knife" or knifeName == "T Knife" then
			if OriginalCTKnife then
				local clone = OriginalCTKnife:Clone()
				clone.Parent = Viewmodels
			end
			if OriginalTKnife then
				local clone = OriginalTKnife:Clone()
				clone.Parent = Viewmodels
			end
		else
			local sourceVM = nil
			if Viewmodels:FindFirstChild("v_" .. knifeName) then
				sourceVM = Viewmodels:FindFirstChild("v_" .. knifeName)
			elseif Models and Models:FindFirstChild("Knives") then
				local knifeModel = Models.Knives:FindFirstChild(knifeName)
				if knifeModel then
					sourceVM = knifeModel
				end
			end
			if sourceVM then
				local ctClone = sourceVM:Clone()
				ctClone.Name = "v_CT Knife"
				ctClone.Parent = Viewmodels
				local tClone = sourceVM:Clone()
				tClone.Name = "v_T Knife"
				tClone.Parent = Viewmodels
			else
				if OriginalCTKnife then
					local clone = OriginalCTKnife:Clone()
					clone.Parent = Viewmodels
				end
				if OriginalTKnife then
					local clone = OriginalTKnife:Clone()
					clone.Parent = Viewmodels
				end
			end
		end
		currentKnife = knifeName
		swapping = false
	end
	local selectedSkins = {}
	for _, wName in AllWeapons do
		selectedSkins[wName] = "Inventory"
	end
	for _, kName in AllKnives do
		selectedSkins[kName] = "Inventory"
	end
	knifeSection:AddToggle({text = "Enabled", flag = "skinKnifeChanger", callback = function(val)
		if not val then
			pcall(function()
				if Viewmodels:FindFirstChild("v_CT Knife") then
					Viewmodels:FindFirstChild("v_CT Knife"):Destroy()
				end
				if Viewmodels:FindFirstChild("v_T Knife") then
					Viewmodels:FindFirstChild("v_T Knife"):Destroy()
				end
				wait()
				if OriginalCTKnife then
					OriginalCTKnife:Clone().Parent = Viewmodels
				end
				if OriginalTKnife then
					OriginalTKnife:Clone().Parent = Viewmodels
				end
				currentKnife = nil
			end)
		end
	end})
	knifeSection:AddList({text = "Model", flag = "skinKnifeModel", values = AllKnives, max = 15, callback = function(val)
		if library_flags["skinKnifeChanger"] then
			SwapKnifeModel(val)
		end
	end})
function L_5_:RefreshList(dropdown, newValues)
		if not dropdown or not dropdown.labels then return end
		if dropdown.open and dropdown.Close then
			pcall(function() dropdown:Close() end)
		end
		local oldCallback = dropdown.callback
		dropdown.callback = function() end
		local current = {}
		for val, _ in dropdown.labels do
			table.insert(current, val)
		end
		for _, val in current do
			pcall(function() dropdown:RemoveValue(val) end)
		end
		dropdown.values = {}
		task.wait()
		for _, val in newValues do
			dropdown:AddValue(val)
		end
		dropdown.callback = oldCallback
		if #newValues > 0 then
			dropdown:SetValue(newValues[1])
			if dropdown.flag then
				library_flags[dropdown.flag] = newValues[1]
			end
		end
	end
	gloveSection:AddToggle({text = "Enabled", flag = "skinGloveChanger"})
	if #AllGloveNamesList > 0 then
		local selectedGloveSkins = {}
		for _, gName in AllGloveNamesList do
			selectedGloveSkins[gName] = "Default"
		end
		gloveSection:AddList({text = "Model", flag = "skinGloveModel", values = AllGloveNamesList, max = 15, callback = function(val)
			if AllGloves[val] and L_5_.options["skinGloveSkin"] then
				pcall(function()
					L_5_:RefreshList(L_5_.options["skinGloveSkin"], AllGloves[val])
				end)
				pcall(function()
					local skinToSet = selectedGloveSkins[val] or AllGloves[val][1]
					L_5_.options["skinGloveSkin"]:SetValue(skinToSet)
					env.lastGloveSkin = skinToSet
				end)
			end;
			if library_flags["skinGloveChanger"] and val then
			end
		end})
		local firstGlove = AllGloveNamesList[1]
		gloveSection:AddList({text = "Skin", flag = "skinGloveSkin", values = AllGloves[firstGlove] or {"Default"}, max = 15, callback = function(val)
			local currentGloveModel = library_flags["skinGloveModel"]
			if currentGloveModel and val then
				selectedGloveSkins[currentGloveModel] = val
			end
		end})
	end
	local function updateSleeves()
		if env.ApplySleeveChangerToCurrent then
			pcall(env.ApplySleeveChangerToCurrent)
		end
	end
	sleeveSection:AddToggle({text = "Enable Sleeve Changer", flag = "skinSleeveChangerToggle", callback = updateSleeves})
	sleeveSection:AddSlider({text = "Forward/Backward", flag = "skinSleeveZ", min = -3, max = 3, float = 0.05, value = 0, callback = updateSleeves})
	weaponSection:AddToggle({text = "Enabled", flag = "skinSkinChanger"})
	if #AllWeapons > 0 then
		for _, weaponName in AllWeapons do
			local weaponSkins = AllSkins[weaponName] or {"Inventory"}
			local skinFlag = "skin_" .. weaponName:gsub(" ", "_"):gsub("-", "_")
			weaponSection:AddList({
				text = weaponName,
				flag = skinFlag,
				values = weaponSkins,
				max = 15,
				value = "Inventory"
			})
		end
	end
	local KnifeSkins = {}
	local KnivesWithSkins = {}
	if Skins then
		for _, knifeName in AllKnives do
			local hasSkins = false
			KnifeSkins[knifeName] = {"Inventory"}
			if Skins:FindFirstChild(knifeName) then
				for _, skin in Skins[knifeName]:GetChildren() do
					table.insert(KnifeSkins[knifeName], skin.Name)
					hasSkins = true
				end
			end
			if hasSkins then
				table.insert(KnivesWithSkins, knifeName)
			end
		end
	end
	if #KnivesWithSkins > 0 then
		for _, knifeName in KnivesWithSkins do
			local knifeSkinList = KnifeSkins[knifeName] or {"Inventory"}
			local skinFlag = "skin_knife_" .. knifeName:gsub(" ", "_"):gsub("-", "_")
			knifeSkinSection:AddList({
				text = knifeName,
				flag = skinFlag,
				values = knifeSkinList,
				max = 15,
				value = "Inventory"
			})
		end
	end
	local Client = nil
	pcall(function() Client = getsenv(L_32_.PlayerGui.Client) end)
	Camera.ChildAdded:Connect(function(obj)
		game:GetService("RunService").RenderStepped:Wait()
		if obj.Name ~= "Arms" then return end
		pcall(function()
			if not Client or Client.gun == "none" then return end
			local Model
			for _, v in obj:GetChildren() do
				if v:IsA("Model") and (v:FindFirstChild("Right Arm") or v:FindFirstChild("Left Arm")) then
					Model = v
				end
			end
			if Model == nil then return end
			local isMelee = Client.gun:FindFirstChild("Melee")
			local gunname = Client.gun ~= "none" and library_flags["skinKnifeChanger"] and isMelee and library_flags["skinKnifeModel"] or Client.gun ~= "none" and Client.gun.Name
			if library_flags["skinKnifeChanger"] and isMelee then
				local wantedKnife = library_flags["skinKnifeModel"]
				if currentKnife ~= wantedKnife then
					pcall(function()
						SwapKnifeModel(wantedKnife)
					end)
					wait()
					pcall(function() obj:Destroy() end)
					return
				end
			end
			spawn(function()
				pcall(function()
					local masterToggle = isMelee and library_flags["skinKnifeChanger"] or library_flags["skinSkinChanger"]
					if masterToggle and Client and Client.gun ~= "none" then
						local Skins = game:GetService("ReplicatedStorage"):FindFirstChild("Skins")
						if (gunname == "CT Knife" or gunname == "T Knife") and Skins and not Skins:FindFirstChild(gunname) then
							gunname = "M9 Bayonet"
						end
						if Skins and Skins:FindFirstChild(gunname) then
							local skinFlag = (isMelee and "skin_knife_" or "skin_") .. gunname:gsub(" ", "_"):gsub("-", "_")
							local selectedSkin = library_flags[skinFlag] or "Inventory"
							if selectedSkin and selectedSkin ~= "Inventory" then
								local SkinData = Skins[gunname]:FindFirstChild(selectedSkin)
								if SkinData and not SkinData:FindFirstChild("Animated") then
									local function applySkinToPart(targetPart)
										if targetPart:IsA("BasePart") or targetPart:IsA("MeshPart") then
											local tex = nil
											local wm = SkinData:FindFirstChild("WorldModel")
											for _, Data in next, SkinData:GetDescendants() do
												if wm and Data:IsDescendantOf(wm) then continue end
												local cleanDataName = Data.Name:gsub("^#%s*", "")
												if cleanDataName == targetPart.Name or string.match(cleanDataName, "^" .. targetPart.Name .. "%d*$") or (targetPart.Name == "Main" and (cleanDataName == "Part1" or cleanDataName == "Part")) then
													if Data:IsA("StringValue") then tex = Data.Value
													elseif Data:IsA("MeshPart") then tex = Data.TextureID
													elseif Data:IsA("Decal") or Data:IsA("Texture") then tex = Data.Texture
													elseif Data:IsA("SurfaceAppearance") then tex = Data end
													if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
												end
											end
											if not tex or tex == "" then
												for _, Data in next, SkinData:GetDescendants() do
													if wm and Data:IsDescendantOf(wm) then continue end
													local cleanDataName = Data.Name:gsub("^#%s*", "")
													if cleanDataName == "Handle" and (targetPart.Name == "Blade" or targetPart.Name == "Main") then
														if Data:IsA("StringValue") then tex = Data.Value
														elseif Data:IsA("MeshPart") then tex = Data.TextureID
														elseif Data:IsA("Decal") or Data:IsA("Texture") then tex = Data.Texture
														elseif Data:IsA("SurfaceAppearance") then tex = Data end
														if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
													end
												end
											end
											if not tex or tex == "" then
												if wm then
													for _, Data in next, wm:GetDescendants() do
														local cleanDataName = Data.Name:gsub("^#%s*", "")
														if cleanDataName == targetPart.Name or string.match(cleanDataName, "^" .. targetPart.Name .. "%d*$") or (targetPart.Name == "Main" and (cleanDataName == "Part1" or cleanDataName == "Part")) then
															if Data:IsA("StringValue") then tex = Data.Value
															elseif Data:IsA("MeshPart") then tex = Data.TextureID
															elseif Data:IsA("Decal") or Data:IsA("Texture") then tex = Data.Texture
															elseif Data:IsA("SurfaceAppearance") then tex = Data end
															if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
														end
													end
												end
											end
											if not tex or tex == "" then
												if wm then
													for _, Data in next, wm:GetDescendants() do
														local cleanDataName = Data.Name:gsub("^#%s*", "")
														if cleanDataName == "Handle" and (targetPart.Name == "Blade" or targetPart.Name == "Main") then
															if Data:IsA("StringValue") then tex = Data.Value
															elseif Data:IsA("MeshPart") then tex = Data.TextureID
															elseif Data:IsA("Decal") or Data:IsA("Texture") then tex = Data.Texture
															elseif Data:IsA("SurfaceAppearance") then tex = Data end
															if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
														end
													end
												end
											end
											if tex and targetPart.Transparency ~= 1 then
												if typeof(tex) == "Instance" and tex:IsA("SurfaceAppearance") then
													if targetPart:FindFirstChildWhichIsA("SurfaceAppearance") then
														targetPart:FindFirstChildWhichIsA("SurfaceAppearance"):Destroy()
													end
													local clone = tex:Clone()
													clone.Parent = targetPart
												elseif targetPart:IsA("MeshPart") then
													targetPart.TextureID = tex
												elseif targetPart:FindFirstChild("Mesh") then
													targetPart.Mesh.TextureId = tex
												else
													pcall(function() targetPart.TextureID = tex end)
												end
											end
										end
									end
									for _, targetPart in next, obj:GetDescendants() do
										applySkinToPart(targetPart)
									end
									local skinConn
									skinConn = obj.DescendantAdded:Connect(applySkinToPart)
									obj.AncestryChanged:Connect(function(_, newParent)
										if not newParent and skinConn then
											skinConn:Disconnect()
											skinConn = nil
										end
									end)
								end
							end
						end
					end
				end)
			end)
			local RArm = Model:FindFirstChild("Right Arm")
			local LArm = Model:FindFirstChild("Left Arm")
			if library_flags["skinGloveChanger"] and GloveModels and Client.gun ~= "none" then
				local gloveName = env.lastGlove
				local gloveSkin = env.lastGloveSkin
				if gloveName and gloveName ~= "None" and gloveSkin and GloveModels:FindFirstChild(gloveName) then
					local gloveTexData = Gloves:FindFirstChild(gloveName) and Gloves[gloveName]:FindFirstChild(gloveSkin)
					local _gloveTex = ""
					if gloveTexData and gloveTexData:FindFirstChild("Textures") then
						_gloveTex = gloveTexData.Textures.TextureId or ""
					end
					if RArm and GloveModels:FindFirstChild(gloveName) then
						local RGlove = RArm:FindFirstChild("Glove") or RArm:FindFirstChild("RGlove")
						if RGlove then RGlove:Destroy() end
						local newRG = GloveModels[gloveName].RGlove:Clone()
						if newRG:FindFirstChild("Mesh") then 
							newRG.Mesh.TextureId = _gloveTex 
						else 
							pcall(function() newRG.TextureID = _gloveTex end) 
						end
						newRG.Parent = RArm
						newRG.Transparency = 0
						pcall(function() newRG.Welded.Part0 = RArm end)
					end
					if LArm and GloveModels:FindFirstChild(gloveName) then
						local LGlove = LArm:FindFirstChild("Glove") or LArm:FindFirstChild("LGlove")
						if LGlove then LGlove:Destroy() end
						local newLG = GloveModels[gloveName].LGlove:Clone()
						if newLG:FindFirstChild("Mesh") then 
							newLG.Mesh.TextureId = _gloveTex 
						else 
							pcall(function() newLG.TextureID = _gloveTex end) 
						end
						newLG.Transparency = 0
						newLG.Parent = LArm
						pcall(function() newLG.Welded.Part0 = LArm end)
					end
				end
			end
			applySleeveChanger(Model)
		end)
	end)
end)()
L_126_ = L_5_:AddTab("Configs")
do
L_127_ = L_126_:AddColumn()
L_128_ = L_126_:AddColumn()
L_132_ = L_127_:AddSection"configurations"
L_133_ = L_5_:AddWarning({
	type = "confirm"
})
local function refreshConfigList()
	if L_5_.RefreshList and L_5_.options["Config List"] then
		L_5_:RefreshList(L_5_.options["Config List"], L_5_:GetConfigs())
	end
end
L_132_:AddBox({
	text = "create a config",
	flag = "Config Name",
	value = "",
	skipflag = true
})
L_132_:AddButton({
	text = "+",
	callback = function()
		local cfgName = library_flags["Config Name"]
		if not cfgName or cfgName == "" or cfgName == "..." then
			L_133_.text = "Please enter a config name first!"
			L_133_:Show()
			return
		end
		local path = L_5_.foldername .. "/" .. cfgName .. L_5_.fileext
		if isfile(path) then
			L_133_.text = "A config with name <font color='rgb(200, 50, 0)'>" .. cfgName .. "</font> already exists. Overwrite?"
			if not L_133_:Show() then return end
		end
		L_5_:SaveConfig(cfgName)
		refreshConfigList()
	end
})
L_132_:AddList({
	text = "configs",
	skipflag = true,
	value = "",
	flag = "Config List",
	values = L_5_:GetConfigs()
})
L_132_:AddButton({
	text = "load",
	callback = function()
		local cfgName = library_flags["Config List"]
		if not cfgName or cfgName == "" then
			L_133_.text = "Please select a config from the list first!"
			L_133_:Show()
			return
		end
		L_5_:LoadConfig(cfgName)
	end
})
L_132_:AddButton({
	text = "save",
	callback = function()
		local cfgName = library_flags["Config List"]
		if not cfgName or cfgName == "" then
			L_133_.text = "Please select a config from the list to save to!"
			L_133_:Show()
			return
		end
		L_5_:SaveConfig(cfgName)
	end
})
L_132_:AddButton({
	text = "edit",
	callback = function()
		local cfgName = library_flags["Config List"]
		if not cfgName or cfgName == "" then
			L_133_.text = "Please select a config from the list to edit!"
			L_133_:Show()
			return
		end
		local path = L_5_.foldername .. "/" .. cfgName .. L_5_.fileext
		if isfile(path) then
			setclipboard(readfile(path))
			L_133_.text = "Config copied to clipboard. Paste edited data into import / export box and press import."
			L_133_:Show()
		end
	end
})
L_132_:AddBox({
	text = "import / export",
	flag = "Config Import Export",
	value = "",
	skipflag = true
})
L_132_:AddButton({
	text = "import / export",
	callback = function()
		local cfgName = library_flags["Config List"]
		local data = library_flags["Config Import Export"]
		if data and data ~= "" and data ~= "..." then
			local name = cfgName
			if not name or name == "" then name = library_flags["Config Name"] end
			if not name or name == "" or name == "..." then
				L_133_.text = "Select a config or enter a config name before importing!"
				L_133_:Show()
				return
			end
			writefile(L_5_.foldername .. "/" .. name .. L_5_.fileext, data)
			refreshConfigList()
			L_5_:LoadConfig(name)
			return
		end
		if not cfgName or cfgName == "" then
			L_133_.text = "Select a config to export or paste data to import!"
			L_133_:Show()
			return
		end
		L_5_:SaveConfig(cfgName, true)
	end
})
L_132_:AddButton({
	text = "refresh",
	callback = function()
		refreshConfigList()
	end
})
L_menuSec_ = L_128_:AddSection"options"
L_menuSec_:AddBind({
	text = "menu key",
	key = "Delete",
	flag = "Menu Bind",
	callback = function()
		if env.ToggleCuteWare then env.ToggleCuteWare() end
	end
})
L_menuSec_:AddColor({
	text = "menu accent color",
	flag = "Menu Accent Color",
	color = Color3.fromRGB(0, 200, 80),
	callback = function(llll111)
		L_83_.BorderColor3 = llll111;
		L_116_.BorderColor3 = llll111;
		L_87_.BorderColor3 = llll111;
		if L_5_.currentTab then
			L_5_.currentTab.button.TextColor3 = llll111
		end;
		for ll1l1l1111, l11ll1l in next, L_5_.theme do
			l11ll1l[l11ll1l.ClassName == "TextLabel" and "TextColor3" or l11ll1l.ClassName == "ImageLabel" and "ImageColor3" or "BackgroundColor3"] = llll111
		end
	end
})
L_menuSec_:AddToggle({
	text = "watermark",
	flag = "configWatermark",
	state = false,
	callback = function(enabled)
		local cg = game:GetService("CoreGui"):FindFirstChild("NativeWatermark")
		if cg then cg.Enabled = enabled end
		local main = L_5_.options["configWatermark"]
		if main and main.SetState and main.state ~= enabled then
			pcall(function() main:SetState(enabled) end)
		end
	end
})
local _menuScale
L_menuSec_:AddList({
	text = "dpi scaling",
	flag = "dpiScaling",
	value = "100%",
	values = {"75%", "100%", "125%", "150%", "175%", "200%"},
	callback = function(val)
		local mf = L_5_.mainFrame or (L_4_ and L_4_.mainFrame)
		if not mf then return end
		if not _menuScale then
			_menuScale = mf:FindFirstChild("DPIScale") or Instance.new("UIScale")
			_menuScale.Name = "DPIScale"
			_menuScale.Parent = mf
		end
		local map = {["75%"]=0.75, ["100%"]=1, ["125%"]=1.25, ["150%"]=1.5, ["175%"]=1.75, ["200%"]=2}
		_menuScale.Scale = map[val] or 1
	end
})
L_safetySec_ = L_128_:AddSection"safety"
L_safetySec_:AddToggle({text = "aim step", flag = "safetyAimStep"})
L_safetySec_:AddToggle({
	text = "anti untrusted",
	flag = "antiUntrusted",
	state = true,
	callback = function(enabled)
		if enabled then
			local risky = {"KillAllAuto", "Loop Kill", "Target ESP"}
			for _, flag in next, risky do
				local opt = L_5_.options[flag]
				if opt and opt.SetState then
					pcall(function() opt:SetState(false) end)
				end
			end
		end
	end
})
L_safetySec_:AddToggle({text = "anti smac", flag = "antiSmac", state = false})
L_safetySec_:AddToggle({
	text = "anti kick",
	flag = "antiKick",
	state = false,
	tip = "instantly hops to a NEW server when a votekick targets you, escaping the vote"
})
do
	local TS = game:GetService("TeleportService")
	local RS = game:GetService("ReplicatedStorage")
	local HS = game:GetService("HttpService")
	local LP = game:GetService("Players").LocalPlayer
	local function isMe(name)
		if not name or name == "" then return false end
		name = tostring(name):lower()
		return name == tostring(LP.Name):lower() or name == tostring(LP.DisplayName):lower()
	end
	local hopping = false
	local function tryHop(reason)
		if hopping then return end
		hopping = true
		local ok = pcall(function()
			local res = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
			local data = HS:JSONDecode(res)
			local servers = {}
			for _, s in next, data.data do
				if type(s) == "table" and s.id and s.id ~= game.JobId and s.playing and s.maxPlayers and s.playing < s.maxPlayers then
					table.insert(servers, s.id)
				end
			end
			if #servers > 0 then
				local pick = servers[math.random(1, #servers)]
				TS:TeleportToPlaceInstance(game.PlaceId, pick, LP)
			else
				TS:Teleport(game.PlaceId, LP)
			end
		end)
		if not ok then
			hopping = false 
		end
	end
	local function watchTarget()
		local target = RS:FindFirstChild("Target")
		if not target then return end
		L_5_:AddConnection(target:GetPropertyChangedSignal("Value"), function()
			if library_flags["antiKick"] and isMe(target.Value) then
				tryHop("votekick")
			end
		end)
		if library_flags["antiKick"] and isMe(target.Value) then
			tryHop("votekick")
		end
	end
	watchTarget()
end
L_joinSec_ = L_128_:AddSection"servers"
L_joinSec_:AddBox({
	text = "server id",
	flag = "Join Server Id",
	value = "",
	skipflag = true
})
L_joinSec_:AddButton({
	text = "join server",
	callback = function()
		local id = library_flags["Join Server Id"]
		if not id or id == "" or id == "..." then
			L_133_.text = "Enter a server id first!"
			L_133_:Show()
			return
		end
		id = tostring(id):gsub("%s+", "")
		local ok, err = pcall(function()
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, id, game:GetService("Players").LocalPlayer)
		end)
		if not ok then
			L_133_.text = "Failed to join: " .. tostring(err)
			L_133_:Show()
		end
	end
})
L_joinSec_:AddButton({
	text = "copy current server id",
	callback = function()
		pcall(function() setclipboard(tostring(game.JobId)) end)
		L_133_.text = "Current server id copied to clipboard."
		L_133_:Show()
	end
})
L_joinSec_:AddButton({
	text = "server hop (random)",
	callback = function()
		local ok, err = pcall(function()
			local res = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
			local data = game:GetService("HttpService"):JSONDecode(res)
			local servers = {}
			for _, s in next, data.data do
				if type(s) == "table" and s.playing and s.maxPlayers and s.playing < s.maxPlayers and s.id ~= game.JobId then
					table.insert(servers, s.id)
				end
			end
			if #servers == 0 then error("no available servers found") end
			local pick = servers[math.random(1, #servers)]
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, pick, game:GetService("Players").LocalPlayer)
		end)
		if not ok then
			L_133_.text = "Server hop failed: " .. tostring(err)
			L_133_:Show()
		end
	end
})
end
for ll1111l1ll11, l11ll1111l1 in next, L_24_.Viewmodels:GetDescendants() do
	if l11ll1111l1.Name == "HumanoidRootPart" and l11ll1111l1:IsA("BasePart") then
		l11ll1111l1.Transparency = 1
	end
end;
L_135_ = L_24_.Viewmodels:Clone()
L_135_.Name = "Viewmodel_Save"
L_135_.Parent = L_24_;
local L_136_, L_137_ = {}, {}
L_CUSTOM_MODELS_DEFAULT = [[
[
{"modelid":"rbxassetid://6482139276","weaponname":"AK47","modelname":"AK47"},
{"modelid":"rbxassetid://7161345483","weaponname":"AK47","modelname":"Dragon AK-47"},
{"modelid":"rbxassetid://6695013713","weaponname":"AK47","modelname":"Old AK47 TEST!!!"},
{"modelid":"rbxassetid://6685334889","weaponname":"AK47","modelname":"Old AK47 | Asiimov"},
{"modelid":"rbxassetid://6657382536","weaponname":"AK47","modelname":"Old AK47 | Eve"},
{"modelid":"rbxassetid://6657379343","weaponname":"AK47","modelname":"Old AK47 | Hallows"},
{"modelid":"rbxassetid://6657377436","weaponname":"AK47","modelname":"Old AK47 | Hypersonic"},
{"modelid":"rbxassetid://6657374606","weaponname":"AK47","modelname":"Old AK47 | Mean Green"},
{"modelid":"rbxassetid://6657370212","weaponname":"AK47","modelname":"Old AK47 | VAV"},
{"modelid":"rbxassetid://6594157951","weaponname":"AWP","modelname":"AWP But with comically large barrel"},
{"modelid":"rbxassetid://6578171344","weaponname":"AWP","modelname":"AWP No Scope"},
{"modelid":"rbxassetid://6605596017","weaponname":"AWP","modelname":"AWP | No Scope"},
{"modelid":"rbxassetid://6477535517","weaponname":"AWP","modelname":"Arsenal AWP"},
{"modelid":"rbxassetid://6477308219","weaponname":"AWP","modelname":"Barett"},
{"modelid":"rbxassetid://7161319343","weaponname":"AWP","modelname":"CSGO AWP"},
{"modelid":"rbxassetid://7161371614","weaponname":"AWP","modelname":"Codol"},
{"modelid":"rbxassetid://6482147359","weaponname":"AWP","modelname":"Mosin"},
{"modelid":"rbxassetid://6566015453","weaponname":"AWP","modelname":"Old AWP"},
{"modelid":"rbxassetid://6647769269","weaponname":"AWP","modelname":"Old AWP 02"},
{"modelid":"rbxassetid://6603299079","weaponname":"AWP","modelname":"Old AWP Doge Lore"},
{"modelid":"rbxassetid://6655720351","weaponname":"AWP","modelname":"Old AWP Weeb"},
{"modelid":"rbxassetid://6688342167","weaponname":"AWP","modelname":"Old AWP | Asiimov"},
{"modelid":"rbxassetid://6688424468","weaponname":"AWP","modelname":"Old AWP | Capillary"},
{"modelid":"rbxassetid://6688324627","weaponname":"AWP","modelname":"Old AWP | Dragon Lore"},
{"modelid":"rbxassetid://6688402770","weaponname":"AWP","modelname":"Old AWP | Exoskeleton"},
{"modelid":"rbxassetid://6688381209","weaponname":"AWP","modelname":"Old AWP | Fever Dream"},
{"modelid":"rbxassetid://6655883134","weaponname":"AWP","modelname":"Old AWP | Grepkin"},
{"modelid":"rbxassetid://6685386801","weaponname":"AWP","modelname":"Old AWP | Hyper Beast"},
{"modelid":"rbxassetid://6655879015","weaponname":"AWP","modelname":"Old AWP | JTF2"},
{"modelid":"rbxassetid://6685391063","weaponname":"AWP","modelname":"Old AWP | Medusa"},
{"modelid":"rbxassetid://6688373364","weaponname":"AWP","modelname":"Old AWP | Mortis"},
{"modelid":"rbxassetid://6685382109","weaponname":"AWP","modelname":"Old AWP | Neo Noir"},
{"modelid":"rbxassetid://6657360618","weaponname":"AWP","modelname":"Old AWP | Nerf"},
{"modelid":"rbxassetid://6605587179","weaponname":"AWP","modelname":"Old AWP | No Scope"},
{"modelid":"rbxassetid://6688410239","weaponname":"AWP","modelname":"Old AWP | Phobos"},
{"modelid":"rbxassetid://6688395944","weaponname":"AWP","modelname":"Old AWP | Redine"},
{"modelid":"rbxassetid://6476965169","weaponname":"AWP","modelname":"Pulse Musket"},
{"modelid":"rbxassetid://6477284418","weaponname":"AWP","modelname":"Railgun"},
{"modelid":"rbxassetid://6500832596","weaponname":"Bayonet","modelname":"Old Bayonet"},
{"modelid":"rbxassetid://6570678542","weaponname":"Bayonet","modelname":"Old Bayonet | Twitch"},
{"modelid":"rbxassetid://6570650309","weaponname":"Bayonet","modelname":"Old Bayonet, but with new bayonet animations"},
{"modelid":"rbxassetid://7010083169","weaponname":"Bearded Axe","modelname":"Prime Axe valorant"},
{"modelid":"rbxassetid://6415988886","weaponname":"Butterfly Knife","modelname":"Arsenal Butterfly Knife"},
{"modelid":"rbxassetid://6422093888","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife"},
{"modelid":"rbxassetid://7055208812","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife V2"},
{"modelid":"rbxassetid://6500829342","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife v2"},
{"modelid":"rbxassetid://7055149338","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Bloodwidow"},
{"modelid":"rbxassetid://6559364836","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Bloodwidow v2"},
{"modelid":"rbxassetid://7055159032","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Crippled Fade"},
{"modelid":"rbxassetid://7055161937","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Frozen Dream"},
{"modelid":"rbxassetid://7055165378","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Hallows"},
{"modelid":"rbxassetid://7055168852","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Jade Dream"},
{"modelid":"rbxassetid://6566215977","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Jade Dream v2"},
{"modelid":"rbxassetid://7055171877","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Marbleized"},
{"modelid":"rbxassetid://7055176584","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Naval"},
{"modelid":"rbxassetid://6559368966","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Ruby"},
{"modelid":"rbxassetid://7055180908","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Ruby V2"},
{"modelid":"rbxassetid://6568018757","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Sapphire"},
{"modelid":"rbxassetid://6557295747","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Twitch"},
{"modelid":"rbxassetid://7055189620","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Twitch V2"},
{"modelid":"rbxassetid://7055193166","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | White Boss"},
{"modelid":"rbxassetid://6500095467","weaponname":"DesertEagle","modelname":"Pathbringer"},
{"modelid":"rbxassetid://6477313539","weaponname":"Glock","modelname":"Soul Pistol"},
{"modelid":"rbxassetid://6477596645","weaponname":"Gut Knife","modelname":"Old Gut Knife"},
{"modelid":"rbxassetid://6570236804","weaponname":"HE Grenade","modelname":"Heywe nade"},
{"modelid":"rbxassetid://6565837869","weaponname":"Huntsman Knife","modelname":"Old Huntsman Knife"},
{"modelid":"rbxassetid://6553852233","weaponname":"Huntsman Knife","modelname":"Old Huntsman Knife | Ruby"},
{"modelid":"rbxassetid://6476897690","weaponname":"Karambit","modelname":"Old Karambit"},
{"modelid":"rbxassetid://6566125740","weaponname":"Karambit","modelname":"Old Karambit | Gold"},
{"modelid":"rbxassetid://6569305303","weaponname":"Karambit","modelname":"Old Karambit | Twitch"},
{"modelid":"rbxassetid://6669716399","weaponname":"Karambit","modelname":"Talon Knife"},
{"modelid":"rbxassetid://6566770855","weaponname":"M4A1","modelname":"Old M4A1"},
{"modelid":"rbxassetid://6657401969","weaponname":"M4A4","modelname":"Old M4A4 | BOT [S]"},
{"modelid":"rbxassetid://7161407697","weaponname":"Scout","modelname":"CSGO Scout"},
{"modelid":"rbxassetid://6477587469","weaponname":"Scout","modelname":"M1 Garand"},
{"modelid":"rbxassetid://6482207385","weaponname":"Scout","modelname":"Mosin-Nagant Optical"},
{"modelid":"rbxassetid://7161433164","weaponname":"Scout","modelname":"Newan Scout"},
{"modelid":"rbxassetid://7161365495","weaponname":"USP","modelname":"Newan USP"},
{"modelid":"rbxassetid://6657391998","weaponname":"USP","modelname":"Old USP-S | Yellowbelly"},
{"modelid":"rbxassetid://6481976224","weaponname":"USP","modelname":"Silenced Pistol"},
{"modelid":"rbxassetid://6571605917","weaponname":"defaultknife","modelname":"$19 Fortnite Card"},
{"modelid":"rbxassetid://7161226974","weaponname":"defaultknife","modelname":"Atlast Knife"},
{"modelid":"rbxassetid://7160993313","weaponname":"defaultknife","modelname":"Banana Obama"},
{"modelid":"rbxassetid://6557196365","weaponname":"defaultknife","modelname":"Bloxy"},
{"modelid":"rbxassetid://7161240289","weaponname":"defaultknife","modelname":"Bowie Knife"},
{"modelid":"rbxassetid://6562607282","weaponname":"defaultknife","modelname":"Boxfun"},
{"modelid":"rbxassetid://6557148153","weaponname":"defaultknife","modelname":"Burger"},
{"modelid":"rbxassetid://6590565396","weaponname":"defaultknife","modelname":"CSGO M9 Autotronic"},
{"modelid":"rbxassetid://6597109573","weaponname":"defaultknife","modelname":"CSGO M9 Nebula"},
{"modelid":"rbxassetid://7161142540","weaponname":"defaultknife","modelname":"Classic Knife"},
{"modelid":"rbxassetid://6557167291","weaponname":"defaultknife","modelname":"Crucible"},
{"modelid":"rbxassetid://9480614267","weaponname":"defaultknife","modelname":"Cube Bomb"},
{"modelid":"rbxassetid://6558482294","weaponname":"defaultknife","modelname":"Da Melee"},
{"modelid":"rbxassetid://6551589894","weaponname":"defaultknife","modelname":"Darkheart"},
{"modelid":"rbxassetid://7161134543","weaponname":"defaultknife","modelname":"Dirt Block"},
{"modelid":"rbxassetid://6477297801","weaponname":"defaultknife","modelname":"Energy Blade"},
{"modelid":"rbxassetid://6421375318","weaponname":"defaultknife","modelname":"Flip Knife"},
{"modelid":"rbxassetid://9480170879","weaponname":"defaultknife","modelname":"Frame Picture"},
{"modelid":"rbxassetid://7161100828","weaponname":"defaultknife","modelname":"Gold Ring"},
{"modelid":"rbxassetid://6768617400","weaponname":"defaultknife","modelname":"Gordons Kitchen Knifes"},
{"modelid":"rbxassetid://6565691328","weaponname":"defaultknife","modelname":"Ham"},
{"modelid":"rbxassetid://6562139237","weaponname":"defaultknife","modelname":"Heywe Cube"},
{"modelid":"rbxassetid://6914977860","weaponname":"defaultknife","modelname":"Icicle"},
{"modelid":"rbxassetid://6500791405","weaponname":"defaultknife","modelname":"Imposter"},
{"modelid":"rbxassetid://7161172680","weaponname":"defaultknife","modelname":"Katana"},
{"modelid":"rbxassetid://7374148548","weaponname":"defaultknife","modelname":"Kruk"},
{"modelid":"rbxassetid://7161024042","weaponname":"defaultknife","modelname":"Megu"},
{"modelid":"rbxassetid://7917769386","weaponname":"defaultknife","modelname":"Netherite Sword"},
{"modelid":"rbxassetid://7161049979","weaponname":"defaultknife","modelname":"NoMadFix"},
{"modelid":"rbxassetid://6478215819","weaponname":"defaultknife","modelname":"Pickaxe"},
{"modelid":"rbxassetid://7161018687","weaponname":"defaultknife","modelname":"Pillow"},
{"modelid":"rbxassetid://7161045678","weaponname":"defaultknife","modelname":"Sausage"},
{"modelid":"rbxassetid://6487384650","weaponname":"defaultknife","modelname":"Shadow Daggers"},
{"modelid":"rbxassetid://7161149241","weaponname":"defaultknife","modelname":"Skeleton Knife"},
{"modelid":"rbxassetid://7259218667","weaponname":"defaultknife","modelname":"Staff"},
{"modelid":"rbxassetid://7161029620","weaponname":"defaultknife","modelname":"Stillet"},
{"modelid":"rbxassetid://7161120469","weaponname":"defaultknife","modelname":"Stillet Stocked"},
{"modelid":"rbxassetid://6476945399","weaponname":"defaultknife","modelname":"Sword"},
{"modelid":"rbxassetid://7161230940","weaponname":"defaultknife","modelname":"Valor Knife"},
{"modelid":"rbxassetid://9471029205","weaponname":"defaultknife","modelname":"Valor Knife V2"},
{"modelid":"rbxassetid://6557159354","weaponname":"defaultknife","modelname":"Very Long Bat"},
{"modelid":"rbxassetid://9473358237","weaponname":"defaultknife","modelname":"cirno knife"}
]
]]
if not isfile("clarity.tk/custommodels.txt") then
	writefile("clarity.tk/custommodels.txt", L_CUSTOM_MODELS_DEFAULT)
end;
local L_138_, L_139_ = pcall(function()
	local L_1507_ = readfile("clarity.tk/custommodels.txt")
	L_136_ = game:service("HttpService"):JSONDecode(L_1507_)
	local L_1508_ = game:service("HttpService"):JSONDecode(L_CUSTOM_MODELS_DEFAULT)
	local L_1509_ = {}
	local L_1510_ = {}
	for _, m in next, L_136_ do
		if type(m) == "table" and m.modelid then
			L_1509_[m.modelid] = m
		end
		if type(m) == "table" and m.modelname then
			L_1510_[m.modelname] = m
		end
	end
	local L_1511_ = false
	for _, m in next, L_1508_ do
		local have = m.modelid and L_1509_[m.modelid]
		if not have and m.modelname then
			have = L_1510_[m.modelname]
		end
		if not have then
			table.insert(L_136_, m)
			if m.modelid then
				L_1509_[m.modelid] = m
			end
			if m.modelname then
				L_1510_[m.modelname] = m
			end
			L_1511_ = true
		else
			if (have.weaponname == nil or have.weaponname == "") and m.weaponname then
				have.weaponname = m.weaponname
				L_1511_ = true
			end
		end
	end
	if L_1511_ then
		pcall(function()
			writefile("clarity.tk/custommodels.txt", game:service("HttpService"):JSONEncode(L_136_))
		end)
	end

	L_137_ = {}
	for l1l11lll1, lll111ll11ll in next, L_136_ do
		if type(lll111ll11ll) == "table" and type(lll111ll11ll.modelname) == "string" then
			table.insert(L_137_, lll111ll11ll.modelname)
		end
	end
end)
if not L_138_ then
	warn("[clarity.tk] could not load custom models! reason: " .. L_139_)
end;
CUSTOM_MODELS_SAVE_PATH = "clarity.tk/custom_models_save.json"
local function ensureClarityFolder()
	if not isfolder("clarity.tk") then
		makefolder("clarity.tk")
	end
end
local function customModelListHas(list, name)
	for _, v in list do
		if v == name then
			return true
		end
	end
	return false
end
local function getCustomModelsToSave()
	local applied = {}
	local function addName(name)
		if type(name) ~= "string" then
			return
		end
		name = name:gsub("^%s+", ""):gsub("%s+$", "")
		if name == "" or name == "---" or customModelListHas(applied, name) then
			return
		end
		table.insert(applied, name)
	end
	for _, name in L_92_ do
		addName(name)
	end
	addName(library_flags["Custom Models"])
	return applied
end
local function restoreViewmodelsBackup()
	if not L_135_ then
		return false
	end
	local ok = pcall(function()
		local existing = L_24_:FindFirstChild("Viewmodels")
		if existing then
			existing:Destroy()
		end
		local clone = L_135_:Clone()
		clone.Name = "Viewmodels"
		clone.Parent = L_24_
	end)
	if ok then
		L_91_ = {}
		L_92_ = {}
	end
	return ok
end
function equipCustomModel(l1l11111ll1)
	if type(l1l11111ll1) ~= "string" or l1l11111ll1 == "" then
		return false
	end
	for lllllll1, ll11l1l11ll1 in next, L_136_ do
		if ll11l1l11ll1.modelname == l1l11111ll1 then
			if ll11l1l11ll1.weaponname == "defaultknife" then
				for ll1l111ll1ll = 1, 2 do
					local L_1514_ = ll1l111ll1ll == 1 and "T" or "CT"
					local L_1515_ = game:GetObjects(ll11l1l11ll1.modelid)[1]
					if not L_1515_ then
						error("failed to load model asset")
					end
					L_1515_.Name = "v_" .. L_1514_ .. " Knife"
					local oldVm = L_24_.Viewmodels:FindFirstChild("v_" .. L_1514_ .. " Knife")
					if oldVm then
						oldVm:Destroy()
					end
					L_1515_.Parent = L_24_.Viewmodels;
					if L_1515_:FindFirstChild("HumanoidRootPart") then
						L_1515_.HumanoidRootPart.Transparency = 1;
					end
					if not L_1515_:FindFirstChild("stab") and L_1515_:FindFirstChild("fire") then
						local L_1516_ = L_1515_.fire:Clone()
						L_1516_.Parent = L_1515_;
						L_1516_.Name = "stab"
					end;
					if L_1515_:FindFirstChild("AIM") then
						L_1515_.AIM:Destroy()
					end;
					if ll11l1l11ll1.modelname == "Netherite Sword" and L_1515_:FindFirstChild("Handle") then
						L_1515_.Handle.TextureID = "rbxassetid://7375049028"
					end
					if not customModelListHas(L_91_, L_1514_ .. " Knife") then
						table.insert(L_91_, L_1514_ .. " Knife")
					end
				end
			else
				local L_1517_ = game:GetObjects(ll11l1l11ll1.modelid)[1]
				if not L_1517_ then
					error("failed to load model asset")
				end
				L_1517_.Name = "v_" .. ll11l1l11ll1.weaponname;
				local oldVm = L_24_.Viewmodels:FindFirstChild("v_" .. ll11l1l11ll1.weaponname)
				if oldVm then
					oldVm:Destroy()
				end
				L_1517_.Parent = L_24_.Viewmodels;
				if L_1517_:FindFirstChild("HumanoidRootPart") then
					L_1517_.HumanoidRootPart.Transparency = 1;
				end
				if not customModelListHas(L_91_, ll11l1l11ll1.weaponname) then
					table.insert(L_91_, ll11l1l11ll1.weaponname)
				end
			end;
			if not customModelListHas(L_92_, l1l11111ll1) then
				table.insert(L_92_, l1l11111ll1)
			end
			return true
		end
	end
	return false
end;
local function applySavedCustomModels(modelNames, silent)
	if type(modelNames) ~= "table" or #modelNames == 0 then
		return false, "nothing to load"
	end
	if not restoreViewmodelsBackup() then
		return false, "viewmodel backup missing"
	end
	local applied = 0
	local errors = {}
	for _, modelName in modelNames do
		local ok, err = pcall(function()
			if not equipCustomModel(modelName) then
				error("unknown model: " .. tostring(modelName))
			end
		end)
		if ok then
			applied = applied + 1
		else
			table.insert(errors, tostring(modelName) .. ": " .. tostring(err))
		end
	end
	if applied > 0 then
		pcall(function()
			local arms = workspace.CurrentCamera:FindFirstChild("Arms")
			if arms then
				arms:Destroy()
			end
		end)
	end
	if #errors > 0 and not silent then
		warn("[clarity.tk] custom model load errors: " .. table.concat(errors, "; "))
	end
	if applied > 0 then
		return true, "loaded " .. applied .. " model(s)"
	end
	return false, errors[1] or "failed to apply models"
end
favoriteCustomModels = {}
local function saveCustomModelsToFile()
	ensureClarityFolder()
	local models = getCustomModelsToSave()
	if #models == 0 then
		return false, "select or apply a custom model first"
	end
	local data = {
		applied = models,
		selected = library_flags["Custom Models"] or models[1] or "",
		favorites = favoriteCustomModels
	}
	writefile(CUSTOM_MODELS_SAVE_PATH, game:GetService"HttpService":JSONEncode(data))
	return true, "saved " .. #models .. " model(s)"
end
local function loadCustomModelsFromFile(opts)
	opts = opts or {}
	if not isfile(CUSTOM_MODELS_SAVE_PATH) then
		return false, "no custom model save found"
	end
	local ok, data = pcall(function()
		return game:GetService"HttpService":JSONDecode(readfile(CUSTOM_MODELS_SAVE_PATH))
	end)
	if not ok or type(data) ~= "table" then
		return false, "invalid custom model save"
	end
	if type(data.favorites) == "table" then
		favoriteCustomModels = data.favorites
		pcall(function() library_flags["Custom Models Favorites"] = game:GetService("HttpService"):JSONEncode(favoriteCustomModels) end)
	end
	local models = {}
	if type(data.applied) == "table" then
		for _, name in data.applied do
			if type(name) == "string" and name ~= "" then
				table.insert(models, name)
			end
		end
	end
	if #models == 0 and type(data.selected) == "string" and data.selected ~= "" then
		table.insert(models, data.selected)
	end
	if #models == 0 then
		return false, "save file is empty"
	end
	local success, msg = applySavedCustomModels(models, opts.silent)
	if success and type(data.selected) == "string" and data.selected ~= "" and opts.setSelection then
		pcall(function()
			opts.setSelection(data.selected)
		end)
	end
	return success, msg
end
env.SaveCustomModels = saveCustomModelsToFile
env.LoadCustomModels = loadCustomModelsFromFile
env.GetCustomModelsToSave = getCustomModelsToSave
custommodeltextthingy = nil;
task.spawn(function()
	repeat task.wait(0.1) until env.SkinsPageFrame
	local pf = env.SkinsPageFrame
	local bgCol = Color3.fromRGB(16, 17, 16)
	local borderCol = Color3.fromRGB(38, 38, 38)
	local textCol = Color3.fromRGB(200, 200, 200)
	local btnCol = Color3.fromRGB(22, 22, 22)
	local cmFrame = Instance.new("Frame", pf)
	cmFrame.Name = "CustomModelsSection"
	cmFrame.Size = UDim2.new(0.95, 0, 0, 0)
	cmFrame.AutomaticSize = Enum.AutomaticSize.Y
	cmFrame.BackgroundColor3 = bgCol
	cmFrame.BorderSizePixel = 0
	cmFrame.LayoutOrder = 100
	local cmCorner = Instance.new("UICorner", cmFrame)
	cmCorner.CornerRadius = UDim.new(0, 3)
	local cmStroke = Instance.new("UIStroke", cmFrame)
	cmStroke.Color = borderCol
	cmStroke.Thickness = 1
	local cmLayout = Instance.new("UIListLayout", cmFrame)
	cmLayout.Padding = UDim.new(0, 4)
	cmLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	cmLayout.SortOrder = Enum.SortOrder.LayoutOrder
	local cmPad = Instance.new("UIPadding", cmFrame)
	cmPad.PaddingTop = UDim.new(0, 6)
	cmPad.PaddingBottom = UDim.new(0, 8)
	cmPad.PaddingLeft = UDim.new(0, 8)
	cmPad.PaddingRight = UDim.new(0, 8)
	local title = Instance.new("TextLabel", cmFrame)
	title.Size = UDim2.new(1, 0, 0, 20)
	title.BackgroundTransparency = 1
	title.Text = "custom models"
	title.Font = Enum.Font.GothamBold
	title.TextSize = 13
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.LayoutOrder = 0
	local dropRow = Instance.new("Frame", cmFrame)
	dropRow.Size = UDim2.new(1, 0, 0, 22)
	dropRow.BackgroundTransparency = 1
	dropRow.LayoutOrder = 1
	local dropLabel = Instance.new("TextLabel", dropRow)
	dropLabel.Size = UDim2.new(0.4, 0, 1, 0)
	dropLabel.BackgroundTransparency = 1
	dropLabel.Text = "model"
	dropLabel.Font = Enum.Font.Gotham
	dropLabel.TextSize = 12
	dropLabel.TextColor3 = textCol
	dropLabel.TextXAlignment = Enum.TextXAlignment.Left
	local dropBtn = Instance.new("TextButton", dropRow)
	dropBtn.Size = UDim2.new(0.58, 0, 1, 0)
	dropBtn.Position = UDim2.new(0.42, 0, 0, 0)
	dropBtn.BackgroundColor3 = btnCol
	dropBtn.Text = L_137_[1] or "---"
	dropBtn.Font = Enum.Font.Gotham
	dropBtn.TextSize = 11
	dropBtn.TextColor3 = textCol
	Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 3)
	Instance.new("UIStroke", dropBtn).Color = borderCol
	library_flags["Custom Models"] = L_137_[1] or ""
	local searchBox = Instance.new("TextBox", cmFrame)
	searchBox.Size = UDim2.new(1, 0, 0, 20)
	searchBox.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	searchBox.PlaceholderText = "search models..."
	searchBox.Text = ""
	searchBox.Font = Enum.Font.Gotham
	searchBox.TextSize = 11
	searchBox.TextColor3 = textCol
	searchBox.Visible = false
	searchBox.LayoutOrder = 2
	Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 3)
	Instance.new("UIStroke", searchBox).Color = borderCol
	local dropList = Instance.new("ScrollingFrame", cmFrame)
	dropList.Size = UDim2.new(1, 0, 0, 0)
	dropList.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	dropList.BorderSizePixel = 0
	dropList.Visible = false
	dropList.LayoutOrder = 3
	dropList.ScrollBarThickness = 2
	dropList.AutomaticCanvasSize = Enum.AutomaticSize.Y
	Instance.new("UICorner", dropList).CornerRadius = UDim.new(0, 3)
	local dlLayout = Instance.new("UIListLayout", dropList)
	dlLayout.Padding = UDim.new(0, 1)
	local setCustomModelDropdownSelection
	local function rebuildDropList()
		if env._FavoriteCustomModels then
			favoriteCustomModels = env._FavoriteCustomModels
			env._FavoriteCustomModels = nil
		end
		for _, c in dropList:GetChildren() do
			if c:IsA("Frame") or c:IsA("TextButton") then c:Destroy() end
		end
		local function isFav(n)
			for _, v in favoriteCustomModels do if v == n then return true end end
			return false
		end
		local q = searchBox.Text:lower()
		local filtered = {}
		for _, name in L_137_ do
			if q == "" or name:lower():find(q, 1, true) then
				table.insert(filtered, name)
			end
		end
		table.sort(filtered, function(a, b)
			local fa = isFav(a)
			local fb = isFav(b)
			if fa == fb then return a:lower() < b:lower() end
			return fa
		end)
		local count = #filtered
		dropList.Size = UDim2.new(1, 0, 0, math.min(count * 20, 150))
		for i, name in filtered do
			local item = Instance.new("Frame", dropList)
			item.Size = UDim2.new(1, 0, 0, 20)
			item.BackgroundColor3 = i % 2 == 0 and Color3.fromRGB(18, 18, 18) or Color3.fromRGB(14, 14, 14)
			item.BorderSizePixel = 0
			local favBtn = Instance.new("TextButton", item)
			favBtn.Size = UDim2.new(0, 20, 1, 0)
			favBtn.BackgroundTransparency = 1
			favBtn.Text = isFav(name) and "★" or "☆"
			favBtn.TextColor3 = isFav(name) and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(120, 120, 120)
			favBtn.Font = Enum.Font.Gotham
			favBtn.TextSize = 14
			local btn = Instance.new("TextButton", item)
			btn.Size = UDim2.new(1, -24, 1, 0)
			btn.Position = UDim2.new(0, 24, 0, 0)
			btn.BackgroundTransparency = 1
			btn.Text = name
			btn.Font = Enum.Font.Gotham
			btn.TextSize = 11
			btn.TextColor3 = textCol
			btn.TextXAlignment = Enum.TextXAlignment.Left
			favBtn.MouseButton1Click:Connect(function()
				local f = isFav(name)
				if f then
					for k, v in favoriteCustomModels do if v == name then table.remove(favoriteCustomModels, k) break end end
				else
					table.insert(favoriteCustomModels, name)
				end
				pcall(function() library_flags["Custom Models Favorites"] = game:GetService("HttpService"):JSONEncode(favoriteCustomModels) end)
				if saveCustomModelsToFile then saveCustomModelsToFile() end
				rebuildDropList()
			end)
			btn.MouseButton1Click:Connect(function()
				dropList.Visible = false
				searchBox.Visible = false
				dropList.Size = UDim2.new(1, 0, 0, 0)
				cmFrame.Size = UDim2.new(0.95, 0, 0, 0)
				if setCustomModelDropdownSelection then
					setCustomModelDropdownSelection(name)
				else
					dropBtn.Text = name
					library_flags["Custom Models"] = name
				end
			end)
		end
	end
	env._RebuildCustomModelsList = rebuildDropList
	searchBox:GetPropertyChangedSignal("Text"):Connect(rebuildDropList)
	local cmInfoLabel = Instance.new("TextLabel", cmFrame)
	cmInfoLabel.Size = UDim2.new(1, 0, 0, 16)
	cmInfoLabel.BackgroundTransparency = 1
	cmInfoLabel.Text = "for: ---"
	cmInfoLabel.Font = Enum.Font.Gotham
	cmInfoLabel.TextSize = 11
	cmInfoLabel.TextColor3 = Color3.fromRGB(130, 130, 130)
	cmInfoLabel.LayoutOrder = 3


	local weaponByModelName = {}
	local function indexModels(list)
		if type(list) ~= "table" then
			return
		end
		for _, m in next, list do
			if type(m) == "table" and type(m.modelname) == "string" and type(m.weaponname) == "string" and m.weaponname ~= "" then
				if weaponByModelName[m.modelname] == nil then
					weaponByModelName[m.modelname] = m.weaponname
				end
			end
		end
	end
	indexModels(L_136_)
	pcall(function()
		indexModels(game:service("HttpService"):JSONDecode(L_CUSTOM_MODELS_DEFAULT))
	end)
	local function weaponForModel(name)
		if type(name) ~= "string" then
			return nil
		end
		if weaponByModelName[name] then
			return weaponByModelName[name]
		end
		for _, mdl in next, L_136_ do
			if type(mdl) == "table" and mdl.modelname == name and type(mdl.weaponname) == "string" and mdl.weaponname ~= "" then
				return mdl.weaponname
			end
		end
		return nil
	end

	dropBtn.MouseButton1Click:Connect(function()
		dropList.Visible = not dropList.Visible
		searchBox.Visible = dropList.Visible
		if dropList.Visible then
			searchBox.Text = ""
			rebuildDropList()
		else
			dropList.Size = UDim2.new(1, 0, 0, 0)
		end
	end)
	setCustomModelDropdownSelection = function(name)
		if type(name) ~= "string" or name == "" or name == "---" then
			return
		end
		library_flags["Custom Models"] = name
		dropBtn.Text = name
		local wn = weaponForModel(name)
		cmInfoLabel.Text = "for: " .. (wn or "---")
	end
	if type(L_137_[1]) == "string" and L_137_[1] ~= "" then
		cmInfoLabel.Text = "for: " .. (weaponForModel(L_137_[1]) or "---")
	end
	env._SetCustomModelDropdownSelection = setCustomModelDropdownSelection
	rebuildDropList()
	local function makeBtn(text, order, callback)
		local btn = Instance.new("TextButton", cmFrame)
		btn.Size = UDim2.new(1, 0, 0, 24)
		btn.BackgroundColor3 = btnCol
		btn.Text = text
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 12
		btn.TextColor3 = textCol
		btn.LayoutOrder = order
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3)
		Instance.new("UIStroke", btn).Color = borderCol
		btn.MouseButton1Click:Connect(callback)
		return btn
	end
	makeBtn("apply custom model", 4, function()
		local modelName = library_flags["Custom Models"]
		local ok, err = pcall(function()
			if not equipCustomModel(modelName) then
				error("unknown model")
			end
		end)
		if not ok then
			warn("[clarity.tk] failed to apply custom model: " .. tostring(err))
		end
	end)
	makeBtn("revert all custom models", 5, function()
		restoreViewmodelsBackup()
	end)
	makeBtn("refresh custom models", 6, function()
		local raw = readfile("clarity.tk/custommodels.txt")
		local success, result = pcall(function()
			return game:service("HttpService"):JSONDecode(raw)
		end)
		if not success then
			warn("[clarity.tk] could not parse custom models JSON! reason: " .. tostring(result))
			return
		end
		L_136_ = result
		L_137_ = {}
		for _, m in next, L_136_ do
			if type(m) == "table" and type(m.modelname) == "string" then
				table.insert(L_137_, m.modelname)
				if type(m.weaponname) == "string" and m.weaponname ~= "" then
					weaponByModelName[m.modelname] = m.weaponname
				end
			end
		end
		rebuildDropList()
	end)
	makeBtn("save custom models", 7, function()
		local ok, msg = saveCustomModelsToFile()
		if ok then
			warn("[clarity.tk] " .. msg)
		else
			warn("[clarity.tk] " .. tostring(msg))
		end
	end)
	makeBtn("load custom models", 8, function()
		local ok, msg = loadCustomModelsFromFile({
			setSelection = setCustomModelDropdownSelection
		})
		if ok then
			warn("[clarity.tk] " .. msg)
		else
			warn("[clarity.tk] " .. tostring(msg))
		end
	end)
	makeBtn("Unlock Inventory", 9, function()
		if env.InventoryUnlocked then
			warn("[clarity.tk] inventory already unlocked")
			return
		end
		local ok, err = pcall(function()
			local LocalPlayer = game:GetService("Players").LocalPlayer
			local Client = getsenv(LocalPlayer.PlayerGui.Client)
			local HttpService = game:GetService("HttpService")
			local Data = require(game:GetService("ReplicatedFirst").Data)
			local ReplicatedStorage = game:GetService("ReplicatedStorage")

			local SkinsTable = (function()
				local Skins = {}
				local SeenSkins = {}
				local function AddSkinEntry(entry)
					local weapon = entry.weaponname
					local skin = entry.skinname
					if type(weapon) ~= "string" or type(skin) ~= "string" or weapon == "" or skin == "" then
						return
					end
					local key = weapon .. "_" .. skin
					if SeenSkins[key] then
						return
					end
					SeenSkins[key] = true
					Skins[HttpService:GenerateGUID(false)] = {
						key,
						weaponname = weapon,
						skinname = skin,
						skins = entry.skins,
						image = entry.image,
						rarity = entry.rarity
					}
				end

				local CutewareSkinPack = {
					{image = "1541381200", skins = {Main = "1541381200"}, weaponname = "USP", skinname = "Example Skin", rarity = "Red"},
					{image = "1541381200", skins = {Main = "6488789251"}, weaponname = "Butterfly Knife", skinname = "Drop Out", rarity = "Knife"},
					{image = "6515650373", skins = {Main = "6515650373"}, weaponname = "Fingerless Glove", skinname = "Troll", rarity = "Glove"},
					{image = "6504360603", skins = {Main = "6504360603"}, weaponname = "Fingerless Glove", skinname = "Pastel Galaxy", rarity = "Glove"},
					{image = "1541381200", skins = {Scope = "1541381200", Main = "1541381200"}, weaponname = "AWP", skinname = "Example Skin", rarity = "Red"},
					{image = "1541381200", skins = {Main = "1541381200", Mag = "1541381200", Part1 = "1541381200"}, weaponname = "AK47", skinname = "Example Skin", rarity = "Red"},
					{image = "7165073157", skins = {Main = "7165073157"}, weaponname = "Bayonet", skinname = "Midnight Howl", rarity = "Knife"},
					{image = "https://imgur.com/WsAH201", skins = {Main = "7162996819"}, weaponname = "DesertEagle", skinname = "Zero Two Deagle", rarity = "Knife"},
					{image = "https://i.imgur.com/dlquciK.png", skins = {Main = "https://i.imgur.com/0xjNuwC.png", Mag = "https://i.imgur.com/NMaMK6z.png", Part1 = "https://i.imgur.com/ot3Bsny.png"}, weaponname = "AK47", skinname = "Troll Supreme", rarity = "Contraband"},
					{image = "https://i.imgur.com/WMMMEfh.png", skins = {Main = "https://i.imgur.com/4oi5sTs.png"}, weaponname = "DesertEagle", skinname = "Troll Supreme", rarity = "Contraband"},
					{image = "https://i.imgur.com/W2wylW8.png", skins = {Main = "https://i.imgur.com/g8DRt3g.png", Sight = "https://i.imgur.com/Kdehu62.png"}, weaponname = "M4A4", skinname = "Troll Supreme", rarity = "Contraband"},
					{image = "https://i.imgur.com/OfTnafR.png", skins = {Main = "https://i.imgur.com/OfTnafR.png"}, weaponname = "DesertEagle", skinname = "Black Ice", rarity = "Red"},
					{image = "6992205817", skins = {Main = "6992205812"}, weaponname = "DesertEagle", skinname = "TRash Man", rarity = "Red"},
					{image = "https://i.imgur.com/e5Xg9cG.png", skins = {Main = "https://i.imgur.com/e5Xg9cG.png"}, weaponname = "DesertEagle", skinname = "Calamity", rarity = "Knife"},
					{image = "6697665145", skins = {Main = "6697665145"}, weaponname = "Bayonet", skinname = "VacTaps", rarity = "Knife"},
					{image = "6571506373", skins = {Scope = "6571505858", Main = "6571505371"}, weaponname = "AWP", skinname = "Cloud", rarity = "Red"},
					{image = "6580814644", skins = {Scope = "6580815666", Main = "6580824704"}, weaponname = "AWP", skinname = "Dragon Lore", rarity = "Red"},
					{image = "6580844725", skins = {Scope = "6580845315", Main = "6580844725"}, weaponname = "AWP", skinname = "Atheris", rarity = "Purple"},
					{image = "6578204774", skins = {Main = "6581161324", Mag = "6578078189", Part1 = "6578078879"}, weaponname = "AK47", skinname = "Redline", rarity = "Red"},
					{image = "6581061584", skins = {Main = "6581061584", Mag = "6581062624", Part1 = "6581063722"}, weaponname = "AK47", skinname = "Case Hardened", rarity = "Red"},
					{image = "6648807543", skins = {Scope = "https://i.imgur.com/qYNoBO1.png", Main = "https://i.imgur.com/rEYALTt.png"}, weaponname = "AWP", skinname = "Fade", rarity = "Red"},
					{image = "https://i.imgur.com/nH3WVjE.png", skins = {Main = "https://i.imgur.com/hghoGvh.png"}, weaponname = "Butterfly Knife", skinname = "Pinkeye", rarity = "Knife"},
					{image = "6639052624", skins = {Main = "6639045378"}, weaponname = "DesertEagle", skinname = "Case Hardened", rarity = "Red"},
					{image = "https://imgur.com/UD1OGgH.png", skins = {Main = "https://imgur.com/Q5qfpbW.png"}, weaponname = "DesertEagle", skinname = "Crimson Web", rarity = "Red"},
					{image = "6635213383", skins = {Main = "https://i.imgur.com/2rGxD42.png"}, weaponname = "DesertEagle", skinname = "02", rarity = "Knife"},
					{image = "6605336253", skins = {Main = "6605339738"}, weaponname = "Falchion Knife", skinname = "Purple Ice", rarity = "Knife"},
					{image = "6603493164", skins = {Main = "6603454010"}, weaponname = "DesertEagle", skinname = "Nova", rarity = "Red"},
					{image = "5645176510", skins = {Mag = "5645176510", Handle = "5645176510", Bolt = "5645176510"}, weaponname = "AK47", skinname = "Weeb", rarity = "Red"},
					{image = "6561839300", skins = {Mag = "6561812697", Handle = "6561812697", Bolt = "6561812697"}, weaponname = "AK47", skinname = "Mean Blue", rarity = "Red"},
					{image = "24650385", skins = {Handle = "661123557"}, weaponname = "Banana", skinname = "Kielbasa", rarity = "Contraband"},
					{image = "6585549388", skins = {Handle = "6585549388", Mag = "6585549388", Part = "6585549388", Scope = "6585549687", Slide = "6585549388", ["Slide 2"] = "6585549388"}, weaponname = "AWP", skinname = "Dragon Lore", rarity = "Red"},
					{image = "6593682454", skins = {Handle = "6593682454", Mag = "6593682454", Part = "6593682454", Scope = "6593682919", Slide = "6593682454", ["Slide 2"] = "6593682454"}, weaponname = "AWP", skinname = "Mean Green", rarity = "Red"},
					{image = "6585612923", skins = {Handle = "6585612923", Mag = "6585612923", Part = "6585612923", Scope = "6585613284", Slide = "6585612923", ["Slide 2"] = "6585612923"}, weaponname = "AWP", skinname = "Neo-Noir", rarity = "Contraband"},
					{image = "6585630605", skins = {Handle = "6585630605", Mag = "6585630605", Part = "6585630605", Scope = "6585630875", Slide = "6585630605", ["Slide 2"] = "6585630605"}, weaponname = "AWP", skinname = "Hyper Beast", rarity = "Red"},
					{image = "2667880777", skins = {Bolt = "2667880777", Part3 = "2667880777", Bolt2 = "2667880777", Grip2 = "2667880777", Handle = "2667880777", Handle2 = "2667880777", Mag = "2667880777", Mag2 = "2667880777", Part = "2667880777", Part2 = "2667880777"}, weaponname = "UMP", skinname = "Mistic", rarity = "Red"},
					{image = "540109079", skins = {Blade = "540165364", Bite = "540165364", Handle = "540165364"}, weaponname = "Butterfly Knife", skinname = "Old Jade Dream", rarity = "Red"}
				}

				for _, entry in CutewareSkinPack do
					AddSkinEntry(entry)
				end

				for Index, Value in ReplicatedStorage.Skins:GetChildren() do
					if Value:IsA("Folder") then
						local GunName = Value.Name
						for _, Skin in Value:GetChildren() do
							local SkinName = Skin.Name
							if SkinName ~= "Stock" then
								AddSkinEntry({ weaponname = GunName, skinname = SkinName })
							end
						end
					end
				end

				for Index, Value in ReplicatedStorage.Gloves:GetChildren() do
					if Value:IsA("Folder") and Value.Name ~= "Model" then
						local GloveName = Value.Name
						for _, Skin in Value:GetChildren() do
							AddSkinEntry({ weaponname = GloveName, skinname = Skin.Name })
						end
					end
				end

				local TWeapons = {
					"Glock", "DualBerettas", "P250", "Tec9", "CZ", "DesertEagle", "R8",
					"Nova", "XM", "SawedOff", "M249", "Negev",
					"MAC10", "MP7", "MP7-SD", "UMP", "P90", "Bizon",
					"Galil", "AK47", "Scout", "SG", "AWP", "G3SG1",
					"Kevlar Vest", "Kevlar + Helmet",
					"Molotov", "Decoy Grenade", "Flashbang", "HE Grenade", "Smoke Grenade"
				}
				local CTWeapons = {
					"P2000", "USP", "DualBerettas", "P250", "FiveSeven", "CZ", "DesertEagle", "R8",
					"Nova", "XM", "MAG7", "M249", "Negev",
					"MP9", "MP7", "MP7-SD", "UMP", "P90", "Bizon",
					"Famas", "M4A4", "M4A1", "Scout", "AUG", "AWP", "G3SG1",
					"Kevlar Vest", "Kevlar + Helmet", "Defuse Kit",
					"Incendiary Grenade", "Decoy Grenade", "Flashbang", "HE Grenade", "Smoke Grenade"
				}
				local IsWeaponFundedInThisTeam = function(Team, Gun)
					if Team == "T" then
						if table.find(TWeapons, Gun) then return true end
					elseif Team == "CT" then
						if table.find(CTWeapons, Gun) then return true end
					end
				end

				for Index, Value in Skins do
					local Weapon = table.unpack(string.split(Value[1], "_"))[1]
					if IsWeaponFundedInThisTeam("CT", Weapon) then
						Client.CTLoadout[Index] = Value
					end
					if IsWeaponFundedInThisTeam("T", Weapon) then
						Client.TLoadout[Index] = Value
					end
				end

				return Skins
			end)()

			local Old; Old = hookfunction(Data.GetData, function(Type, ...)
				if Type ~= nil then
					local ToReturn = Old(Type, ...)
					for Index, Value in SkinsTable do
						ToReturn[tostring(Index)] = Value
					end
					return ToReturn
				end
				return Old(Type, ...)
			end)

			for Index, Value in getconnections(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent) do
				local Function = Value.Function
				if Function then
					local Old2; Old2 = hookfunction(Function, function(Type, Skins, ...)
						if Type == "CTLoadout" then
							Skins = Client.CTLoadout
						elseif Type == "TLoadout" then
							Skins = Client.TLoadout
						elseif Type == "Inventory" then
							Skins = SkinsTable
						end
						return Old2(Type, Skins, ...)
					end)
				end
			end

			local OldNC; OldNC = hookmetamethod(game, "__namecall", function(self, ...)
				local Method = getnamecallmethod()
				local Args = {...}
				if Method == "FireServer" then
					if self and self.Name == "DataEvent" then
						local Table = Args[1]
						if Table[1] == "EquipItem" then
							if Table[2] ~= "Both" then
								local SkinFolder = LocalPlayer.SkinFolder[Table[2] .. "Folder"]
								local Weapon, Skin = table.unpack(string.split(Table[4][1], "_"))
								if Table[3] == "Knife" or Table[3] == "Glove" then
									SkinFolder[Table[3]].Value = Skin
									local Loadout = Client[Table[2] .. "Loadout"]
									if Loadout then
										Loadout[Table[3] .. "Over"] = true
										Loadout[Table[3]] = { tostring(Weapon .. "_" .. Skin) }
									end
								else
									SkinFolder[Weapon].Value = Skin
								end
							else
								for _, Value in {"CT", "T"} do
									local SkinFolder = LocalPlayer.SkinFolder[Value .. "Folder"]
									local Weapon, Skin = table.unpack(string.split(Table[4][1], "_"))
									if Table[3] == "Knife" or Table[3] == "Glove" then
										SkinFolder[Table[3]].Value = Skin
										local Loadout = Client[Value .. "Loadout"]
										if Loadout then
											Loadout[Table[3] .. "Over"] = true
											Loadout[Table[3]] = { tostring(Weapon .. "_" .. Skin) }
										end
									else
										SkinFolder[Weapon].Value = Skin
									end
								end
							end
						end
					end
				end
				return OldNC(self, ...)
			end)

			firesignal(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent, "Inventory", SkinsTable)
			firesignal(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent, "CTLoadout", Client.CTLoadout)
			firesignal(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent, "TLoadout", Client.TLoadout)
		end)
		if ok then
			env.InventoryUnlocked = true
			warn("[clarity.tk] inventory unlocked - all skins loaded")
		else
			warn("[clarity.tk] failed to unlock inventory: " .. tostring(err))
		end
	end)
end)
if false then
ConfigSectionOther = L_128_:AddSection"Other"
ConfigSectionOther:AddButton({
	text = "Copy To Clipboard",
	callback = function()
		L_5_:SaveConfig("", true)
	end
})
ConfigSectionOther:AddButton({
	text = "Load From Clipboard",
	callback = function()
		L_133_.text = "Are you sure you want to load config from clipboard?"
		if L_133_:Show() then
			local L_1553_ = Instance.new("ScreenGui", game.CoreGui)
			local L_1554_ = Instance.new("TextBox", L_1553_)
			L_1554_.Size = UDim2.new(1, 0, 1, 0)
			L_1554_.Text = ""
			L_1554_.BackgroundTransparency = 0.99;
			L_1554_.TextTransparency = 1;
			wait()
			mouse1click()
			wait()
			keypress(17)
			keypress(86)
			wait()
			keyrelease(17)
			keyrelease(86)
			wait()
			local L_1555_ = L_1554_.Text;
			L_1553_:Destroy()
			do local _opt = L_5_.options["Loop Kill"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
			do local _opt = L_5_.options["Target ESP"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
			local L_1556_ = L_5_:LoadConfig("", L_1555_)
			if L_1556_ then
				local L_1557_ = Drawing.new("Text")
				L_1557_.Size = 45;
				L_1557_.Center = false;
				L_1557_.Position = Vector2.new(20, 20)
				L_1557_.Visible = true;
				L_1557_.Color = Color3.fromRGB(255, 100, 100)
				L_1557_.Outline = true;
				L_1557_.Text = "Invalid config!"
				CreateThread(function()
					wait(2)
					L_1557_:Remove()
				end)
			end
		end
	end
})
end
luaTab = L_5_:AddTab("LUA")
playersTab = L_5_:AddTab("Players")
	demoTab = L_5_:AddTab("Demos")
	demoCol1 = demoTab:AddColumn()
	demoSecRecorder = demoCol1:AddSection("Recorder")
	
	if not isfolder("clarity.tk") then makefolder("clarity.tk") end
	if not isfolder("clarity.tk/demos") then makefolder("clarity.tk/demos") end
	currentDemoFolder = ""
	isRecordingDemos = false
	
	demoSecRecorder:AddBox({
		text = "Demo Name",
		flag = "demoNameInput"
	})
	
	demoStatusLabel = demoSecRecorder:AddLabel("Status: Not recording")

	demoStatusMode = "idle"   
	demoStatusAnimT = 0

	function startDemoRecording()
		if isRecordingDemos then return end
		L_1563_ = {}
		isRecordingDemos = true

		local demoName = library_flags["demoNameInput"]
		if not demoName or demoName == "" then
			demoName = "Demo_" .. tostring(os.time())
		end

		currentDemoFolder = "clarity.tk/demos/" .. demoName
		if not isfolder(currentDemoFolder) then makefolder(currentDemoFolder) end
		print("Started recording to " .. currentDemoFolder)

		demoStatusMode = "recording"
		demoStatusAnimT = 0
	end

	function stopDemoRecording()
		if not isRecordingDemos then return end
		isRecordingDemos = false
		demoStatusMode = "saving"
		demoStatusAnimT = 0
		print("Saving " .. tostring(#L_1563_) .. " ticks to disk...")

		for i, frameData in L_1563_ do
			local success, json = pcall(function() return game:GetService("HttpService"):JSONEncode(frameData) end)
			if success then
				writefile(currentDemoFolder .. "/" .. tostring(i) .. ".tick", json)
			end
			if i % 15 == 0 then wait() end
		end
		if workspace:FindFirstChild("Map") then
			local mapName = workspace.Map:FindFirstChild("Origin") and workspace.Map.Origin.Value or workspace.Map:GetChildren()[1].Name
			local clips = workspace.Map:FindFirstChild("Clips", true)
			local mapAnchor = nil
			if clips then
				local sum = Vector3.zero
				local count = 0
				for _, part in clips:GetDescendants() do
					if part:IsA("BasePart") then
						sum = sum + part.Position
						count = count + 1
					end
				end
				if count > 0 then
					local avg = sum / count
					mapAnchor = string.format("%.3f %.3f %.3f", avg.X, avg.Y, avg.Z)
				end
			end
			writefile(currentDemoFolder .. "/map.tick", game:GetService("HttpService"):JSONEncode({mapName = mapName, mapAnchor = mapAnchor}))
		end
		local demoVer = workspace:FindFirstChild("version") and workspace.version.Value or ""
		writefile(currentDemoFolder .. "/ver.tick", tostring(demoVer))
		print("[Demo Recorder] Successfully saved demo to: " .. currentDemoFolder)
		L_1563_ = {}
		demoStatusMode = "idle"
		demoStatusAnimT = 0
	end

	function toggleDemoRecording()
		if isRecordingDemos then stopDemoRecording() else startDemoRecording() end
	end

	demoSecRecorder:AddButton({
		text = "Start Recording",
		callback = startDemoRecording
	})

	demoSecRecorder:AddButton({
		text = "Stop Recording",
		callback = stopDemoRecording
	})

	demoSecRecorder:AddButton({
		text = "Copy Demo Viewer Link",
		callback = function()
			pcall(function()
				setclipboard("https://www.roblox.com/games/101013872711019/Untitled-Experience")
			end)
			print("[Demo Recorder] Copied demo viewer game link to clipboard")
			if demoStatusLabel and demoStatusLabel.main and demoStatusMode == "idle" then
				demoLinkCopiedUntil = os.clock() + 2
				demoStatusLabel.main.Text = "Status: Link copied!"
				demoStatusLabel.main.TextColor3 = Color3.fromRGB(120, 200, 255)
			end
		end
	})


	local DEMO_TICK_INTERVAL = 1 / 32
	task.spawn(function()
		local nextTick = os.clock()
		while true do
			if isRecordingDemos then
				pcall(addTick)
				nextTick = nextTick + DEMO_TICK_INTERVAL
				local now = os.clock()

				if nextTick < now then nextTick = now + DEMO_TICK_INTERVAL end
				local waitFor = nextTick - now
				if waitFor > 0 then task.wait(waitFor) else task.wait() end
			else
				nextTick = os.clock()
				task.wait(0.1)
			end
		end
	end)

	game:GetService("RunService").RenderStepped:Connect(function(dt)
		if demoStatusLabel and demoStatusLabel.main then
			demoStatusAnimT = demoStatusAnimT + (dt or 0.016)
			local dots = string.rep(".", (math.floor(demoStatusAnimT * 2) % 4))
			if demoStatusMode == "recording" then

				local pulse = 0.5 + 0.5 * math.sin(demoStatusAnimT * 5)
				demoStatusLabel.main.TextColor3 = Color3.fromRGB(255, math.floor(60 + pulse * 60), math.floor(60 + pulse * 60))
				demoStatusLabel.main.Text = "Status: Recording" .. dots .. " (" .. tostring(#(L_1563_ or {})) .. " ticks)"
			elseif demoStatusMode == "saving" then
				local pulse = 0.5 + 0.5 * math.sin(demoStatusAnimT * 8)
				demoStatusLabel.main.TextColor3 = Color3.fromRGB(math.floor(200 + pulse * 55), math.floor(180 + pulse * 55), 60)
				demoStatusLabel.main.Text = "Status: Saving demo" .. dots
			elseif demoStatusMode == "idle" and not (demoLinkCopiedUntil and os.clock() < demoLinkCopiedUntil) then
				demoStatusLabel.main.TextColor3 = Color3.fromRGB(160, 160, 160)
				demoStatusLabel.main.Text = "Status: Not recording"
			end
		end
	end)

playersCol1 = playersTab:AddColumn()
playersSec1 = playersCol1:AddSection("Player List")
playersSec1:AddPlayerList({
	flag = "Player List"
})
luaCol1 = luaTab:AddColumn()
luaScripts = {}
pcall(function()
    if not isfolder("clarity.tk/lua") then
        makefolder("clarity.tk/lua")
    end
    for _, file in next, listfiles("clarity.tk/lua") do
        if file:match("%.lua$") or file:match("%.txt$") then
            local name = file:match("([^/\\]+)%.%w+$")
            if name then
                table.insert(luaScripts, name)
            end
        end
    end
end)
if #luaScripts == 0 then table.insert(luaScripts, "none") end
luaSection = luaCol1:AddSection("Lua")
luaList = luaSection:AddList({
	text = "Luas",
	flag = "scriptlist",
	values = luaScripts,
	value = luaScripts[1]
})
luaSection:AddButton({
	text = "Run Lua",
	callback = function()
        local selected = library_flags["scriptlist"]
        if selected and selected ~= "none" then
            local success, err = pcall(function()
                local pathLua = "clarity.tk/lua/" .. selected .. ".lua"
                local pathTxt = "clarity.tk/lua/" .. selected .. ".txt"
                if isfile(pathLua) then
                    loadstring(readfile(pathLua))()
                elseif isfile(pathTxt) then
                    loadstring(readfile(pathTxt))()
                end
            end)
            if not success then
                warn("Failed to load script: " .. selected, err)
            end
        end
	end
})
luaSection:AddButton({
	text = "Refresh Luas",
	callback = function()
        local freshScripts = {}
        pcall(function()
            if not isfolder("clarity.tk/lua") then
                makefolder("clarity.tk/lua")
            end
            for _, file in next, listfiles("clarity.tk/lua") do
                if file:match("%.lua$") or file:match("%.txt$") then
                    local name = file:match("([^/\\]+)%.%w+$")
                    if name then
                        table.insert(freshScripts, name)
                    end
                end
            end
        end)
        if #freshScripts == 0 then table.insert(freshScripts, "none") end
        luaList:UpdateList(freshScripts)
	end
})
function roundNumber(ll1llllllll1, ll111lll)
	return tonumber(string.format("%." .. (ll111lll or 0) .. "f", ll1llllllll1))
end;
L_140_ = {
	"Bayonet",
	"Huntsman Knife",
	"Falchion Knife",
	"Karambit",
	"Gut Knife",
	"Butterfly Knife",
	"M9 Bayonet",
	"Banana",
	"Flip Knife",
	"Sickle",
	"Bearded Axe",
	"Cleaver"
}
if L_1_ then
	L_1560_ = game:GetService("Players")
	L_1561_ = L_1560_.LocalPlayer;
	L_1562_ = {}
	pcall(function()
		local events = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
		local addKill = events and events:FindFirstChild("AddToKillfeed")
		if addKill then
			addKill.OnClientEvent:Connect(function(kill)
				if type(kill) == "table" then
					table.insert(L_1562_, kill)
				end
			end)
		end
	end)
	L_1563_ = {}
	local L_1564_ = Instance.new("IntValue")
	L_1564_.Name = "jig"
	local L_1565_ = {
		"FakeHead",
		"UpperTorso",
		"LowerTorso",
		"LeftFoot",
		"LeftHand",
		"LeftLowerArm",
		"LeftLowerLeg",
		"LeftUpperArm",
		"LeftUpperLeg",
		"RightFoot",
		"RightHand",
		"RightLowerArm",
		"RightLowerLeg",
		"RightUpperArm",
		"RightUpperLeg"
	}
	local L_1566_ = {
		["HE Grenade"] = "rbxassetid://2473861397",
		["Smoke Grenade"] = "rbxassetid://2465359739",
		["Incendiary Grenade"] = "rbxassetid://2465356425",
		["Molotov"] = "rbxassetid://2465357373",
		["Flashbang"] = "rbxassetid://2472169712",
		["Decoy Grenade"] = "rbxassetid://454821354"
	}
function addTick()
		if not workspace:FindFirstChild("Map") then
			return
		end;
		local L_1573_ = tick()
		local L_1574_ = {}
		for ll111lll1lll, lll11ll in next, L_1560_:GetPlayers() do
			local L_1577_ = {
				name = lll11ll.Name,
				alive = false,
				gunState = "None"
			}
			pcall(function()
				L_1577_.alive = alive(lll11ll)
			end)
			
			xpcall(function()
				if L_1577_.alive then
					L_1577_.armsModel = (L_1561_.Status.Team.Value == "CT" and workspace.Map.CeeT.Value or workspace.Map.Tee.Value) .. "Arms"
					L_1577_.gunName = lll11ll.Character.EquippedTool.Value;
					L_1577_.health = lll11ll.Character.Humanoid.Health;
					L_1577_.localplayer = lll11ll == L_1561_;
					L_1577_.userid = lll11ll.UserId;
					L_1577_.kevlar = lll11ll:FindFirstChild("Kevlar") and lll11ll.Kevlar.Value or 0;
					L_1577_.plrModel = lll11ll.Ragdoll.Appearance.Value;
					L_1577_.scoped = lll11ll.Character:FindFirstChild("AIMING") and true or false;
				L_1577_.team = tostring(lll11ll.Team)
				L_1577_.skinName = "Stock"
				L_1577_.partCF = {}
				L_1577_.gunCF = {}
				L_1577_.hatCF = {}
				L_1577_.camCF = "0 0 0 0 0 0"
				L_1577_.forcefield = lll11ll.Character:FindFirstChild("ForceField") and true or false;
				local L_1578_ = lll11ll.Character.UpperTorso.Velocity;
				L_1577_.velocity = {
					L_1578_.X,
					L_1578_.Y,
					L_1578_.Z
				}
				if L_1577_.localplayer then
					local _ag = L_1561_.PlayerGui:FindFirstChild("Game")
					local _ammo = _ag and _ag:FindFirstChild("Right") and _ag.Right:FindFirstChild("Bottom") and _ag.Right.Bottom:FindFirstChild("Ammo")
					L_1577_.ammo = (_ammo and _ammo:FindFirstChild("Ammo")) and tonumber(_ammo.Ammo.Text) or 0
					L_1577_.ammoreserve = (_ammo and _ammo:FindFirstChild("AmmoLeft")) and tonumber(_ammo.AmmoLeft.Text) or 0
				end;
				if lll11ll:FindFirstChild("CameraCF") then
					local L_1579_, L_1580_;
					if lll11ll == L_1561_ then
						L_1579_ = L_34_.CFrame.p;
						L_1580_ = L_1579_ + L_34_.CFrame.LookVector
					else
						L_1579_ = lll11ll.CameraCF.Value.p;
						L_1580_ = L_1579_ + lll11ll.CameraCF.Value.LookVector
					end;
					L_1577_.camCF = roundNumber(L_1579_.X, 3) .. " " .. roundNumber(L_1579_.Y, 3) .. " " .. roundNumber(L_1579_.Z, 3) .. " " .. roundNumber(L_1580_.X, 3) .. " " .. roundNumber(L_1580_.Y, 3) .. " " .. roundNumber(L_1580_.Z, 3)
				end;
				for l1lll1l1l, l1l1ll in next, lll11ll.Character:GetChildren() do
					if table.find(L_1565_, l1l1ll.Name) then
						local L_1583_ = tostring(l1l1ll.CFrame):split(", ")
						L_1577_.partCF[l1l1ll.Name] = roundNumber(L_1583_[1], 3) .. " " .. roundNumber(L_1583_[2], 3) .. " " .. roundNumber(L_1583_[3], 3) .. " " .. roundNumber(L_1583_[4], 3) .. " " .. roundNumber(L_1583_[5], 3) .. " " .. roundNumber(L_1583_[6], 3) .. " " .. roundNumber(L_1583_[7], 3) .. " " .. roundNumber(L_1583_[8], 3) .. " " .. roundNumber(L_1583_[9], 3) .. " " .. roundNumber(L_1583_[10], 3) .. " " .. roundNumber(L_1583_[11], 3) .. " " .. roundNumber(L_1583_[12], 3)
					elseif l1l1ll.Name == "Gun" then
						if l1l1ll:FindFirstChild("AnimateValue") then
							local L_1584_ = l1l1ll.AnimateValue:GetChildren()
							if # L_1584_ > 0 then
								local L_1585_ = L_1584_[# L_1584_]
								if not L_1585_:FindFirstChild("jig") then
									local L_1586_ = L_1564_:Clone()
									L_1586_.Parent = L_1585_;
									L_1577_.gunState = L_1585_.Name
								end
							end
						end;
						for l1lllll11, l1lll11 in next, l1l1ll:GetChildren() do
							local isMesh = l1lll11:IsA("MeshPart") or (l1lll11:IsA("BasePart") and l1lll11:FindFirstChildWhichIsA("SpecialMesh"))
							if isMesh then
								local L_1589_ = tostring(l1lll11.CFrame):split(", ")
								L_1577_.gunCF[l1lll11.Name] = roundNumber(L_1589_[1], 3) .. " " .. roundNumber(L_1589_[2], 3) .. " " .. roundNumber(L_1589_[3], 3) .. " " .. roundNumber(L_1589_[4], 3) .. " " .. roundNumber(L_1589_[5], 3) .. " " .. roundNumber(L_1589_[6], 3) .. " " .. roundNumber(L_1589_[7], 3) .. " " .. roundNumber(L_1589_[8], 3) .. " " .. roundNumber(L_1589_[9], 3) .. " " .. roundNumber(L_1589_[10], 3) .. " " .. roundNumber(L_1589_[11], 3) .. " " .. roundNumber(L_1589_[12], 3)
								if L_1577_.localplayer then
									local L_1590_ = L_1577_.team == "Terrorists" and L_1561_.SkinFolder.TFolder or L_1561_.SkinFolder.CTFolder;
									if L_1590_:FindFirstChild(L_1577_.gunName) then
										L_1577_.skinName = L_1590_[L_1577_.gunName].Value
									elseif table.find(L_140_, L_1577_.gunName) then
										L_1577_.skinName = L_1590_.Knife.Value
									end
								else
									if L_24_.Skins:FindFirstChild(L_1577_.gunName) then
										if l1lll11.Name == "Handle" or l1lll11.Name == "Handle2" then
											for lllll1l, l1111l1lll1l in next, L_24_.Skins[L_1577_.gunName]:GetChildren() do
												local L_1593_ = l1111l1lll1l:FindFirstChild("Handle") or l1111l1lll1l:FindFirstChild("Handle2")
												if L_1593_ and L_1593_.Value == l1l1ll[l1lll11.Name].TextureID then
													L_1577_.skinName = l1111l1lll1l.Name
												end
											end
										end
									end
								end
							end
						end
					end;
					if l1l1ll.ClassName == "Accessory" and l1l1ll:FindFirstChild("Handle") and (l1l1ll.Handle:FindFirstChild("Mesh") or l1l1ll.Handle.ClassName == "MeshPart") then
						if l1l1ll.Handle.ClassName == "UnionOperation" then
							continue;
						end;
						local L_1594_ = l1l1ll.Handle.ClassName == "Part" and l1l1ll.Handle.Mesh.MeshId or l1l1ll.Handle.ClassName == "MeshPart" and l1l1ll.Handle.MeshId or ""
						local L_1595_ = tostring(l1l1ll.Handle.CFrame):split(", ")
						L_1577_.hatCF[L_1594_] = roundNumber(L_1595_[1], 3) .. " " .. roundNumber(L_1595_[2], 3) .. " " .. roundNumber(L_1595_[3], 3) .. " " .. roundNumber(L_1595_[4], 3) .. " " .. roundNumber(L_1595_[5], 3) .. " " .. roundNumber(L_1595_[6], 3) .. " " .. roundNumber(L_1595_[7], 3) .. " " .. roundNumber(L_1595_[8], 3) .. " " .. roundNumber(L_1595_[9], 3) .. " " .. roundNumber(L_1595_[10], 3) .. " " .. roundNumber(L_1595_[11], 3) .. " " .. roundNumber(L_1595_[12], 3)
					end
				end
			else
				L_1577_.ragdoll = {
					found = false,
					positions = {},
					hatPos = {}
				}
				if workspace.Debris:FindFirstChild(L_1577_.name) then
					L_1577_.ragdoll.found = true;
					for l1ll11, ll1l1ll1l in next, workspace.Debris[L_1577_.name]:GetChildren() do
						if ll1l1ll1l:IsA("BasePart") then
							local L_1598_ = tostring(ll1l1ll1l.CFrame):split(", ")
							L_1577_.ragdoll.positions[ll1l1ll1l.Name] = roundNumber(L_1598_[1], 3) .. " " .. roundNumber(L_1598_[2], 3) .. " " .. roundNumber(L_1598_[3], 3) .. " " .. roundNumber(L_1598_[4], 3) .. " " .. roundNumber(L_1598_[5], 3) .. " " .. roundNumber(L_1598_[6], 3) .. " " .. roundNumber(L_1598_[7], 3) .. " " .. roundNumber(L_1598_[8], 3) .. " " .. roundNumber(L_1598_[9], 3) .. " " .. roundNumber(L_1598_[10], 3) .. " " .. roundNumber(L_1598_[11], 3) .. " " .. roundNumber(L_1598_[12], 3)
						end;
						if ll1l1ll1l.ClassName == "Accessory" then
							local L_1599_ = ll1l1ll1l.Handle.ClassName == "Part" and ll1l1ll1l.Handle.Mesh.MeshId or ll1l1ll1l.Handle.ClassName == "MeshPart" and ll1l1ll1l.Handle.MeshId or ""
							local L_1600_ = tostring(ll1l1ll1l.Handle.CFrame):split(", ")
							L_1577_.ragdoll.hatPos[L_1599_] = roundNumber(L_1600_[1], 3) .. " " .. roundNumber(L_1600_[2], 3) .. " " .. roundNumber(L_1600_[3], 3) .. " " .. roundNumber(L_1600_[4], 3) .. " " .. roundNumber(L_1600_[5], 3) .. " " .. roundNumber(L_1600_[6], 3) .. " " .. roundNumber(L_1600_[7], 3) .. " " .. roundNumber(L_1600_[8], 3) .. " " .. roundNumber(L_1600_[9], 3) .. " " .. roundNumber(L_1600_[10], 3) .. " " .. roundNumber(L_1600_[11], 3) .. " " .. roundNumber(L_1600_[12], 3)
						end
					end
				end
				end
				L_1574_[lll11ll.Name] = L_1577_
			end, function(err2)
				warn("[Demo Recorder] Error recording player " .. tostring(lll11ll.Name) .. ": " .. tostring(err2))
			end)
		end;
		L_1574_.nades = {}
		L_1574_.nadePos = {}
		L_1574_.droppedWeapons = {}
		L_1574_.bombPlanted = workspace:FindFirstChild("C4") and true or false;
		L_1574_.roundInfo = {
			round = 0, T = 0, CT = 0, time = "0:00",
			TWin = { vis = false, mvpimage = "", mvptext = "", infotext = "" },
			CTWin = { vis = false, mvpimage = "", mvptext = "", infotext = "" }
		}
		pcall(function()
			L_1574_.roundInfo.round = workspace.Status.Rounds.Value
			L_1574_.roundInfo.T = workspace.Status.TWins.Value
			L_1574_.roundInfo.CT = workspace.Status.CTWins.Value
		end)
		pcall(function()
			L_1574_.roundInfo.time = L_1561_.PlayerGui.Game.UpperInfo.Scoreboard.TimeLeft.Timer.Text
		end)
		pcall(function()
			local tw = L_1561_.PlayerGui.Game.TWin
			L_1574_.roundInfo.TWin.vis = tw.Visible
			L_1574_.roundInfo.TWin.mvpimage = tw.Top.Icon.PlayerIcon.Image
			L_1574_.roundInfo.TWin.mvptext = tw.Top.PlayerInfo.Username.Text
			L_1574_.roundInfo.TWin.infotext = tw.Top.PlayerInfo.Reason.Text
		end)
		pcall(function()
			local ctw = L_1561_.PlayerGui.Game.CTWin
			L_1574_.roundInfo.CTWin.vis = ctw.Visible
			L_1574_.roundInfo.CTWin.mvpimage = ctw.Top.Icon.PlayerIcon.Image
			L_1574_.roundInfo.CTWin.mvptext = ctw.Top.PlayerInfo.Username.Text
			L_1574_.roundInfo.CTWin.infotext = ctw.Top.PlayerInfo.Reason.Text
		end)
		L_1574_.regen = {
			props = {},
			glasses = {},
			doors = {}
		}
		L_1574_.bombPos = "0 -100 0"
		pcall(function()
			if L_1574_.bombPlanted then
				local L_1601_ = workspace.C4:GetModelCFrame()
				L_1574_.bombPos = roundNumber(L_1601_.X, 3) .. " " .. roundNumber(L_1601_.Y, 3) .. " " .. roundNumber(L_1601_.Z, 3)
			end
		end)
		pcall(function()
		if workspace.Map.Regen:FindFirstChild("Props") then
			for ll111l, ll1111lll in next, workspace.Map.Regen.Props:GetChildren() do
				local L_1604_ = ll1111lll.Position;
				table.insert(L_1574_.regen.props, roundNumber(L_1604_.X, 3) .. " " .. roundNumber(L_1604_.Y, 3) .. " " .. roundNumber(L_1604_.Z, 3))
			end
		end;
		if workspace.Map.Regen:FindFirstChild("Glasses") then
			for ll1111, lll11l11l1ll in next, workspace.Map.Regen.Glasses:GetChildren() do
				local L_1607_ = lll11l11l1ll.Position;
				table.insert(L_1574_.regen.glasses, roundNumber(L_1607_.X, 3) .. " " .. roundNumber(L_1607_.Y, 3) .. " " .. roundNumber(L_1607_.Z, 3))
			end
		end;
		if workspace.Map.Regen:FindFirstChild("Doors") then
			for ll1ll1l1l, l1l1ll in workspace.Map.Regen.Doors:GetChildren() do
				local L_1610_ = l1l1ll.HumanoidRootPart.Position;
				local L_1611_ = l1l1ll.HumanoidRootPart.Orientation;
				table.insert(L_1574_.regen.doors, roundNumber(L_1610_.X, 3) .. " " .. roundNumber(L_1610_.Y, 3) .. " " .. roundNumber(L_1610_.Z, 3) .. " " .. roundNumber(L_1611_.X, 3) .. " " .. roundNumber(L_1611_.Y, 3) .. " " .. roundNumber(L_1611_.Z, 3))
			end
		end
		end)
		pcall(function()
		for ll11l1l1ll11, l1lllll1ll1l in next, workspace.Debris:GetChildren() do
			pcall(function()
				if l1lllll1ll1l.ClassName == "MeshPart" then
					for l1l1lll11l11, l1lll1l1lll in next, L_1566_ do
						if l1lll1l1lll == l1lllll1ll1l.TextureID and l1lllll1ll1l.Model.Handle2.Transparency ~= 1 then
							local L_1616_ = l1lllll1ll1l.Position;
							local L_1617_ = l1lllll1ll1l.Orientation;
							table.insert(L_1574_.nades, {
								nade = l1l1lll11l11,
								pos = roundNumber(L_1616_.X, 3) .. " " .. roundNumber(L_1616_.Y, 3) .. " " .. roundNumber(L_1616_.Z, 3) .. " " .. roundNumber(L_1617_.X, 3) .. " " .. roundNumber(L_1617_.Y, 3) .. " " .. roundNumber(L_1617_.Z, 3)
							})
						else
							continue;
						end
					end
				end
			end)
			if L_24_.Viewmodels:FindFirstChild("v_" .. l1lllll1ll1l.Name) then
				local L_1618_ = {}
				for l1lllll1ll1l, lll1l11l1 in next, l1lllll1ll1l:GetChildren() do
					if lll1l11l1.ClassName == "MeshPart" then
						local L_1621_ = lll1l11l1.Position;
						local L_1622_ = lll1l11l1.Orientation;
						L_1618_[lll1l11l1.Name] = roundNumber(L_1621_.X, 3) .. " " .. roundNumber(L_1621_.Y, 3) .. " " .. roundNumber(L_1621_.Z, 3) .. " " .. roundNumber(L_1622_.X, 3) .. " " .. roundNumber(L_1622_.Y, 3) .. " " .. roundNumber(L_1622_.Z, 3)
					else
						continue;
					end
				end;
				table.insert(L_1574_.droppedWeapons, {
					name = l1lllll1ll1l.Name,
					positions = L_1618_
				})
			end
		end;
		end)
		pcall(function()
		for l111l1, lll1l1l111l in next, workspace["Ray_Ignore"]:GetDescendants() do
			if lll1l1l111l:IsA("BasePart") and (lll1l1l111l.Parent.Name == "Fires" or lll1l1l111l.Parent.Name == "Smokes") then
				local L_1625_ = lll1l1l111l.Position;
				local L_1626_ = lll1l1l111l.Orientation;
				table.insert(L_1574_.nadePos, {
					type = lll1l1l111l.Name,
					pos = roundNumber(L_1625_.X, 3) .. " " .. roundNumber(L_1625_.Y, 3) .. " " .. roundNumber(L_1625_.Z, 3) .. " " .. roundNumber(L_1626_.X, 3) .. " " .. roundNumber(L_1626_.Y, 3) .. " " .. roundNumber(L_1626_.Z, 3)
				})
			else
				continue;
			end
		end;
		end)
		L_1574_.killfeed = {}
		pcall(function()
			local now = workspace:GetServerTimeNow()
			for i = #L_1562_, 1, -1 do
				local kill = L_1562_[i]
				if not kill or (tonumber(kill.time) and kill.time + 10 < now) then
					table.remove(L_1562_, i)
				end
			end
			for _, kill in L_1562_ do
				local killerColor = typeof(kill.killerColor) == "Color3" and kill.killerColor or Color3.new(1, 1, 1)
				local victimColor = typeof(kill.victimColor) == "Color3" and kill.victimColor or Color3.new(1, 1, 1)
				local assistColor = typeof(kill.assistColor) == "Color3" and kill.assistColor or Color3.new(1, 1, 1)
				local weaponIcon = ""
				pcall(function()
					weaponIcon = kill.weapon and GetIcon.getWeaponOfKiller(kill.weapon) or ""
				end)
				table.insert(L_1574_.killfeed, {
					weapon = weaponIcon,
					killer = kill.killer or "",
					killercolor = {killerColor.R, killerColor.G, killerColor.B},
					victim = kill.victim or "",
					victimcolor = {victimColor.R, victimColor.G, victimColor.B},
					assist = kill.assist or "",
					assistcolor = {assistColor.R, assistColor.G, assistColor.B},
					headshot = kill.isHeadshot == true,
					wallbang = kill.isWallbang == true
				})
			end
		end)
		L_1574_["delay"] = tick() - L_1573_;
		table.insert(L_1563_, L_1574_)
	end;
	L_1567_ = nil;
	L_1568_ = false;
end;
L_4_.mainFrame.topname.TextButton.MouseButton1Click:connect(function()
	L_4_.mainFrame.Visible = false
end)
function _loadIcon(name)
	local path = "clarity.tk/assets/" .. name .. ".png"
	if not isfile(path) then
		pcall(function()
			if not isfolder("clarity.tk") then makefolder("clarity.tk") end
			if not isfolder("clarity.tk/assets") then makefolder("clarity.tk/assets") end
			local githubUrl = "https://raw.githubusercontent.com/Freezewo/clarity.tk/main/"
			local imgData = game:HttpGet(githubUrl .. name .. ".png")
			if imgData and imgData ~= "" then
				writefile(path, imgData)
			end
		end)
	end
	local ok, r = pcall(getcustomasset, path)
	return ok and r or ""
end
TabIcons = {
	["Demos"] = _loadIcon("demos"),
	["demos"] = _loadIcon("demos"),
	["Legit"] = _loadIcon("legit"),
	["legit"] = _loadIcon("legit"),
	["Visuals"] = _loadIcon("visuals"),
	["visuals"] = _loadIcon("visuals"),
	["Misc"] = _loadIcon("misc"),
	["misc"] = _loadIcon("misc"),
	["Movement"] = _loadIcon("movement"),
	["movement"] = _loadIcon("movement"),
	["Movement Features"] = _loadIcon("movement"),
	["Skins"] = _loadIcon("skins"),
	["skins"] = _loadIcon("skins"),
	["Config"] = _loadIcon("configs"),
	["configs"] = _loadIcon("configs"),
	["Configs"] = _loadIcon("configs"),
	["Exploits"] = _loadIcon("movement"),
	["exploits"] = _loadIcon("movement"),
	["World"] = _loadIcon("visuals"),
	["world"] = _loadIcon("visuals"),
	["Calculator"] = _loadIcon("misc"),
	["calculator"] = _loadIcon("misc"),
	["Lua"] = _loadIcon("lua"),
	["lua"] = _loadIcon("lua"),
	["Players"] = _loadIcon("players"),
	["players"] = _loadIcon("players")
}
L_5_.Init = function(self)
	if self.hasInit then return end
	self.hasInit = true
	local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
	sg.ResetOnSpawn = false
	sg.Name = "CuteWare_Custom"
	sg.IgnoreGuiInset = true
	self.base = sg
	self.open = true
	local openColorPicker = nil
	local main = Instance.new("ImageButton", sg)
	self.mainFrame = main
	main.AutoButtonColor = false
	main.Size = UDim2.new(0, 720, 0, 530)
	main.Position = UDim2.new(0.5, -360, 0.5, -265)
	main.BackgroundColor3 = Color3.fromRGB(16, 17, 16)
	main.BorderSizePixel = 0
	main.ClipsDescendants = false
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 3)
	local mainStroke = Instance.new("UIStroke", main)
	mainStroke.Color = Color3.fromRGB(55, 55, 55)
	mainStroke.Thickness = 1
	mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	self.mainFrame = main
	local sidebar = Instance.new("Frame", main)
	sidebar.Size = UDim2.new(0, 135, 1, 0)
	sidebar.BackgroundColor3 = Color3.fromRGB(12, 13, 12)
	sidebar.BorderSizePixel = 0
	Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 3)
	local logoHeader = Instance.new("Frame", sidebar)
	logoHeader.Size = UDim2.new(1, 0, 0, 70)
	logoHeader.BackgroundTransparency = 1
	local logo = Instance.new("ImageLabel", logoHeader)
	logo.Size = UDim2.new(0, 48, 0, 48)
	logo.Position = UDim2.new(0.5, -24, 0.5, -24)
	logo.BackgroundTransparency = 1
	logo.Image = "rbxassetid://133384875688188"
	logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
	local logoSep = Instance.new("Frame", sidebar)
	logoSep.Size = UDim2.new(0.8, 0, 0, 1)
	logoSep.Position = UDim2.new(0.1, 0, 0, 70)
	logoSep.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	logoSep.BorderSizePixel = 0
	local sidebarDiv = Instance.new("Frame", main)
	sidebarDiv.Size = UDim2.new(0, 1, 1, -16)
	sidebarDiv.Position = UDim2.new(0, 135, 0, 8)
	sidebarDiv.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	sidebarDiv.BorderSizePixel = 0
	local tabContainer = Instance.new("ScrollingFrame", sidebar)
	tabContainer.Size = UDim2.new(1, 0, 1, -70)
	tabContainer.Position = UDim2.new(0, 0, 0, 70)
	tabContainer.BackgroundTransparency = 1
	tabContainer.BorderSizePixel = 0
	tabContainer.ScrollBarThickness = 1
	tabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
	tabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
	local list = Instance.new("UIListLayout", tabContainer)
	list.Padding = UDim.new(0, 3)
	list.HorizontalAlignment = Enum.HorizontalAlignment.Center
	list.SortOrder = Enum.SortOrder.LayoutOrder
	local floatingDropdowns = {}
	local content = Instance.new("Frame", main)
	content.Size = UDim2.new(1, -145, 1, -20)
	content.Position = UDim2.new(0, 140, 0, 10)
	content.BackgroundTransparency = 1
	content.BorderSizePixel = 0
	local activePage = nil
	local activeBtn = nil
	local previewWin = Instance.new("Frame", main)
	previewWin.Size = UDim2.new(0, 240, 0, 360)
	previewWin.Position = UDim2.new(1, 35, 0, 0)
	previewWin.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	previewWin.Visible = false
	Instance.new("UICorner", previewWin).CornerRadius = UDim.new(0, 3)
	local previewStroke = Instance.new("UIStroke", previewWin)
	previewStroke.Color = Color3.fromRGB(25, 25, 25)
	local previewHeader = Instance.new("TextLabel", previewWin)
	previewHeader.Size = UDim2.new(1, 0, 0, 25)
	previewHeader.BackgroundTransparency = 1
	previewHeader.Text = "esp preview"
	previewHeader.TextColor3 = Color3.fromRGB(140, 140, 140)
	previewHeader.Font = Enum.Font.SourceSansBold
	previewHeader.TextSize = 13
	local viewport = Instance.new("ViewportFrame", previewWin)
	viewport.Size = UDim2.new(0.9, 0, 0.75, 0)
	viewport.Position = UDim2.new(0.05, 0, 0.08, 0)
	viewport.BackgroundTransparency = 1
	viewport.Ambient = Color3.fromRGB(200, 200, 200)
	local cam = Instance.new("Camera")
	cam.FieldOfView = 50
	viewport.CurrentCamera = cam
	cam.Parent = viewport
	local light = Instance.new("PointLight", cam)
	light.Color = Color3.fromRGB(255, 255, 255)
	light.Brightness = 2
	light.Range = 15
	local previewModel = Instance.new("Model", viewport)
	local previewReady = false
	local previewDragging = false
	local previewLastX = 0
	local previewRotY = 0
	local function rebuildDummy()
		previewModel:ClearAllChildren()
		local ok = false
		local src = nil
		pcall(function()
			for _, plr in game:GetService("Players"):GetPlayers() do
				if plr ~= L_32_ and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					src = plr.Character
					break
				end
			end
			if not src then
				for _, v in workspace:GetChildren() do
					if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
						src = v
						break
					end
				end
			end
		end)
		if src then
			pcall(function()
				src.Archivable = true
				for _, d in src:GetDescendants() do
					pcall(function() d.Archivable = true end)
				end
				local clone = src:Clone()
				if clone then
					for _, d in clone:GetDescendants() do
						if d:IsA("BaseScript") or d:IsA("Script") or d:IsA("LocalScript") then d:Destroy() end
						if d:IsA("BillboardGui") or d:IsA("ForceField") then d:Destroy() end
						if d:IsA("BasePart") then
							d.Anchored = true; d.CanCollide = false
						end
					end
					for _, d in clone:GetChildren() do
						if d:IsA("Tool") or d:IsA("BackpackItem") or d:IsA("Folder") then
							d:Destroy()
						elseif d:IsA("Model") then
							d:Destroy()
						elseif d:IsA("BasePart") and not (
							d.Name:match("Torso") or d.Name:match("Leg") or d.Name:match("Arm") or d.Name:match("Hand")
							or d.Name:match("Foot") or d.Name == "Head" or d.Name == "HumanoidRootPart"
							or d.Name == "FakeHead" or d.Name == "Hitbox" or d:FindFirstAncestorWhichIsA("Accessory") or d:FindFirstAncestorWhichIsA("Accoutrement")
						) then
							d:Destroy()
						end
					end
					local hrp = clone:FindFirstChild("HumanoidRootPart")
					if hrp then
						local hrpCF = hrp.CFrame
						local resolvedCFrames = {}
						resolvedCFrames[hrp] = CFrame.new(0, 1, 0)
						local function resolveJoints()
							local added = false
							for _, d in clone:GetDescendants() do
								if d:IsA("JointInstance") or d:IsA("WeldConstraint") then
									local p0 = d.Part0
									local p1 = d.Part1
									if p0 and p1 then
										local c0, c1
										pcall(function() c0 = d.C0; c1 = d.C1 end)
										if c0 and c1 then
											local transform = CFrame.new()
											if d:IsA("Motor6D") then
												transform = CFrame.new()
											end
											if not resolvedCFrames[p1] and resolvedCFrames[p0] then
												resolvedCFrames[p1] = resolvedCFrames[p0] * c0 * transform * c1:Inverse()
												added = true
											elseif not resolvedCFrames[p0] and resolvedCFrames[p1] then
												resolvedCFrames[p0] = resolvedCFrames[p1] * c1 * transform:Inverse() * c0:Inverse()
												added = true
											end
										else
											local rel = p0.CFrame:Inverse() * p1.CFrame
											if not resolvedCFrames[p1] and resolvedCFrames[p0] then
												resolvedCFrames[p1] = resolvedCFrames[p0] * rel
												added = true
											elseif not resolvedCFrames[p0] and resolvedCFrames[p1] then
												resolvedCFrames[p0] = resolvedCFrames[p1] * rel:Inverse()
												added = true
											end
										end
									end
								end
							end
							return added
						end
						for i = 1, 30 do
							if not resolveJoints() then break end
						end
						for _, d in clone:GetDescendants() do
							if d:IsA("BasePart") then
								if resolvedCFrames[d] then
									d.CFrame = resolvedCFrames[d]
								else
									d.CFrame = hrpCF:Inverse() * d.CFrame
								end
							end
						end
					end
					local hum = clone:FindFirstChildWhichIsA("Humanoid")
					if hum then 
						hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None 
					end
					local children = clone:GetChildren()
					for _, child in children do
						child.Parent = previewModel
					end
					clone:Destroy()
					if #previewModel:GetChildren() > 5 then ok = true end
				end
			end)
		end
		if not ok then
			pcall(function()
				local desc = Instance.new("HumanoidDescription")
				local model = game:GetService("Players"):CreateHumanoidModelFromDescription(desc, Enum.HumanoidRigType.R15)
				if model then
					for _, d in model:GetDescendants() do
						if d:IsA("BaseScript") or d:IsA("Script") then d:Destroy() end
						if d:IsA("BasePart") then d.Anchored = true; d.CanCollide = false end
					end
					local hrp = model:FindFirstChild("HumanoidRootPart")
					if hrp then
						local off = hrp.CFrame
						for _, d in model:GetDescendants() do
							if d:IsA("BasePart") then d.CFrame = off:Inverse() * d.CFrame end
						end
					end
					local hum = model:FindFirstChildWhichIsA("Humanoid")
					if hum then hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None end
					for _, d in model:GetChildren() do
						if d:IsA("Tool") or d:IsA("BackpackItem") then d:Destroy() end
					end
					local children = model:GetChildren()
					for _, child in children do
						child.Parent = previewModel
					end
					model:Destroy()
					if #previewModel:GetChildren() > 3 then ok = true end
				end
			end)
		end
		if not ok then
			local parts = {
				{"Head", Vector3.new(1.2, 1.2, 1.2), CFrame.new(0, 3.1, 0)},
				{"UpperTorso", Vector3.new(2, 0.8, 1), CFrame.new(0, 1.9, 0)},
				{"LowerTorso", Vector3.new(2, 1, 1), CFrame.new(0, 1.0, 0)},
				{"LeftUpperArm", Vector3.new(1, 1.2, 1), CFrame.new(-1.6, 1.9, 0)},
				{"LeftLowerArm", Vector3.new(1, 1.2, 1), CFrame.new(-1.6, 0.6, 0)},
				{"LeftHand", Vector3.new(1, 0.5, 1), CFrame.new(-1.6, -0.2, 0)},
				{"RightUpperArm", Vector3.new(1, 1.2, 1), CFrame.new(1.6, 1.9, 0)},
				{"RightLowerArm", Vector3.new(1, 1.2, 1), CFrame.new(1.6, 0.6, 0)},
				{"RightHand", Vector3.new(1, 0.5, 1), CFrame.new(1.6, -0.2, 0)},
				{"LeftUpperLeg", Vector3.new(1, 1.2, 1), CFrame.new(-0.5, -0.1, 0)},
				{"LeftLowerLeg", Vector3.new(1, 1.2, 1), CFrame.new(-0.5, -1.4, 0)},
				{"LeftFoot", Vector3.new(1, 0.4, 1), CFrame.new(-0.5, -2.1, 0)},
				{"RightUpperLeg", Vector3.new(1, 1.2, 1), CFrame.new(0.5, -0.1, 0)},
				{"RightLowerLeg", Vector3.new(1, 1.2, 1), CFrame.new(0.5, -1.4, 0)},
				{"RightFoot", Vector3.new(1, 0.4, 1), CFrame.new(0.5, -2.1, 0)},
				{"HumanoidRootPart", Vector3.new(2, 2, 1), CFrame.new(0, 1, 0), true}
			}
			for _, info in parts do
				local p = Instance.new("Part")
				p.Name = info[1]; p.Size = info[2]; p.CFrame = info[3]
				p.Transparency = info[4] and 1 or 0
				p.Color = Color3.fromRGB(180, 180, 180)
				p.Material = Enum.Material.SmoothPlastic
				p.Anchored = true; p.CanCollide = false
				p.Parent = previewModel
			end
		end
		previewRotY = 0
		previewReady = true
		cam.CFrame = CFrame.new(Vector3.new(0, 2.5, -9.5), Vector3.new(0, 0, 0))
	end
	rebuildDummy()
	spawn(function()
		while not previewReady do
			task.wait(5)
			rebuildDummy()
		end
	end)
	local boxOverlay = Instance.new("Frame", previewWin)
	boxOverlay.BackgroundTransparency = 1
	boxOverlay.ZIndex = 10
	boxOverlay.Visible = false
	local stroke = Instance.new("UIStroke", boxOverlay)
	stroke.Thickness = 1
	stroke.Color = Color3.fromRGB(255, 255, 255)
	local boxFill = Instance.new("Frame", boxOverlay)
	boxFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	boxFill.BackgroundTransparency = 0.5
	boxFill.BorderSizePixel = 0
	boxFill.Size = UDim2.new(1, 0, 1, 0)
	boxFill.ZIndex = 9
	boxFill.Visible = false
	local nameLabel = Instance.new("TextLabel", boxOverlay)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Size = UDim2.new(1, 0, 0, 15)
	nameLabel.Position = UDim2.new(0, 0, 0, -17)
	nameLabel.Text = "Enemy"
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.Font = Enum.Font.Code
	nameLabel.TextSize = 13
	local nameStroke = Instance.new("UIStroke", nameLabel)
	local healthBarBg = Instance.new("Frame", boxOverlay)
	healthBarBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	healthBarBg.BorderSizePixel = 0
	healthBarBg.Size = UDim2.new(0, 2, 1, 0)
	healthBarBg.Position = UDim2.new(0, -6, 0, 0)
	local healthBarFill = Instance.new("Frame", healthBarBg)
	healthBarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	healthBarFill.BorderSizePixel = 0
	healthBarFill.Size = UDim2.new(1, 0, 0.8, 0)
	healthBarFill.Position = UDim2.new(0, 0, 0.2, 0)
	local healthText = Instance.new("TextLabel", healthBarFill)
	healthText.BackgroundTransparency = 1
	healthText.Size = UDim2.new(0, 20, 0, 10)
	healthText.Position = UDim2.new(0, -22, 0, -5)
	healthText.Text = "80%"
	healthText.TextColor3 = Color3.fromRGB(255, 255, 255)
	healthText.Font = Enum.Font.Code
	healthText.TextSize = 10
	Instance.new("UIStroke", healthText)
	local armorBarBg = Instance.new("Frame", boxOverlay)
	armorBarBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	armorBarBg.BorderSizePixel = 0
	armorBarBg.Size = UDim2.new(0, 2, 1, 0)
	armorBarBg.Position = UDim2.new(0, -10, 0, 0)
	local armorBarFill = Instance.new("Frame", armorBarBg)
	armorBarFill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
	armorBarFill.BorderSizePixel = 0
	armorBarFill.Size = UDim2.new(1, 0, 1, 0)
	armorBarFill.Position = UDim2.new(0, 0, 0, 0)
	local distLabel = Instance.new("TextLabel", boxOverlay)
	distLabel.BackgroundTransparency = 1
	distLabel.Size = UDim2.new(1, 0, 0, 15)
	distLabel.Position = UDim2.new(0, 0, 1, 2)
	distLabel.Text = "12m"
	distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	distLabel.Font = Enum.Font.Code
	distLabel.TextSize = 12
	Instance.new("UIStroke", distLabel)
	local wepLabel = Instance.new("TextLabel", boxOverlay)
	wepLabel.BackgroundTransparency = 1
	wepLabel.Size = UDim2.new(1, 0, 0, 15)
	wepLabel.Position = UDim2.new(0, 0, 1, 15)
	wepLabel.Text = "AK-47"
	wepLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
	wepLabel.Font = Enum.Font.Code
	wepLabel.TextSize = 12
	Instance.new("UIStroke", wepLabel)
	local infoLabel = Instance.new("TextLabel", boxOverlay)
	infoLabel.BackgroundTransparency = 1
	infoLabel.Size = UDim2.new(0, 40, 0, 15)
	infoLabel.Position = UDim2.new(1, 4, 0, 0)
	infoLabel.Text = "Standing"
	infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	infoLabel.Font = Enum.Font.Code
	infoLabel.TextSize = 12
	infoLabel.TextXAlignment = Enum.TextXAlignment.Left
	Instance.new("UIStroke", infoLabel)
	local flagsLabel = Instance.new("TextLabel", boxOverlay)
	flagsLabel.BackgroundTransparency = 1
	flagsLabel.Size = UDim2.new(0, 40, 0, 15)
	flagsLabel.Position = UDim2.new(1, 4, 0, 15)
	flagsLabel.Text = "Armored\nScoped"
	flagsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	flagsLabel.Font = Enum.Font.Code
	flagsLabel.TextSize = 12
	flagsLabel.TextXAlignment = Enum.TextXAlignment.Left
	flagsLabel.TextYAlignment = Enum.TextYAlignment.Top
	Instance.new("UIStroke", flagsLabel)
	local chamsToggleBtn = Instance.new("TextButton", previewWin)
	chamsToggleBtn.Size = UDim2.new(1, -20, 0, 25)
	chamsToggleBtn.Position = UDim2.new(0, 10, 1, -35)
	chamsToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	chamsToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	chamsToggleBtn.Font = Enum.Font.Code
	chamsToggleBtn.TextSize = 13
	chamsToggleBtn.Text = "Chams: Behind Wall"
	library_flags["previewChamsVisible"] = false
	chamsToggleBtn.MouseButton1Click:Connect(function()
		library_flags["previewChamsVisible"] = not library_flags["previewChamsVisible"]
		chamsToggleBtn.Text = library_flags["previewChamsVisible"] and "Chams: Visible" or "Chams: Behind Wall"
	end)
	Instance.new("UICorner", chamsToggleBtn).CornerRadius = UDim.new(0, 3)
	local tracerLine = Instance.new("Frame", previewWin)
	tracerLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tracerLine.BorderSizePixel = 0
	tracerLine.AnchorPoint = Vector2.new(0.5, 1)
	tracerLine.ZIndex = 5
    local skelLines = {}
    local function createLine()
        local f = Instance.new("Frame", previewWin)
        f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        f.BorderSizePixel = 0
        f.AnchorPoint = Vector2.new(0.5, 0.5)
        f.ZIndex = 6
        f.Visible = false
        table.insert(skelLines, f)
        return f
    end
    for i=1,15 do createLine() end
	local vpButton = Instance.new("TextButton", viewport)
	vpButton.Size = UDim2.new(1, 0, 1, 0)
	vpButton.BackgroundTransparency = 1
	vpButton.Text = ""
	vpButton.ZIndex = 2
	vpButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			previewDragging = true
			previewLastX = input.Position.X
		end
	end)
	vpButton.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			previewDragging = false
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if previewDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local deltaX = input.Position.X - previewLastX
			previewLastX = input.Position.X
			local angle = deltaX * 0.01
			previewRotY = previewRotY + angle
			local rotCF = CFrame.Angles(0, angle, 0)
			for _, d in previewModel:GetDescendants() do
				if d:IsA("BasePart") then
					d.CFrame = rotCF * d.CFrame
				end
			end
		end
	end)
	game:GetService("UserInputService").InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			previewDragging = false
		end
	end)
	game:GetService("RunService").RenderStepped:Connect(function(dt)
		if not previewWin.Visible then return end
		local hrp = previewModel:FindFirstChild("HumanoidRootPart", true)
		if hrp then
			local function get2D(p)
				local op = cam.CFrame:PointToObjectSpace(p)
				if op.Z > 0 then return Vector2.new(-9999, -9999) end
				local h = math.tan(math.rad(cam.FieldOfView)/2)
				local r = viewport.AbsoluteSize.X / viewport.AbsoluteSize.Y
				if r ~= r or r == 0 then r = 1 end
				local ndcX = (op.X / -op.Z) / (h * r)
				local ndcY = (op.Y / -op.Z) / h
				return Vector2.new(viewport.AbsoluteSize.X/2 * (1 + ndcX), viewport.AbsoluteSize.Y/2 * (1 - ndcY))
			end
			local pos = get2D(hrp.Position)
			local top = get2D((hrp.CFrame * CFrame.new(0, 3.4, 0)).Position)
			local bot = get2D((hrp.CFrame * CFrame.new(0, -3.2, 0)).Position)
			local height = math.abs(bot.Y - top.Y)
			local width = height * 0.65
			local offset_X = viewport.AbsolutePosition.X - previewWin.AbsolutePosition.X
			local offset_Y = viewport.AbsolutePosition.Y - previewWin.AbsolutePosition.Y
			boxOverlay.Size = UDim2.new(0, width, 0, height)
			boxOverlay.Position = UDim2.new(0, pos.X - width/2 + offset_X, 0, top.Y + offset_Y)
			local isEsp = library_flags["espEnabled"]
			local hasArmor = library_flags["Armor Bar"] or library_flags["Armor ESP"] or library_flags["Armor"]
			if isEsp and library_flags["Box ESP"] then
				stroke.Enabled = true
				stroke.Color = library_flags["boxESPcolor"] or Color3.fromRGB(255,255,255)
			else
				stroke.Enabled = false
			end
			if isEsp and library_flags["Box Fill"] then
				boxFill.Visible = true
				boxFill.BackgroundColor3 = library_flags["boxFillColor"] or Color3.fromRGB(255,255,255)
				local fillTrans = (L_5_ and L_5_.options and L_5_.options["Box Fill"] and L_5_.options["Box Fill"].trans) or 0.5
				boxFill.BackgroundTransparency = math.clamp(1 - fillTrans, 0, 1)
			else
				boxFill.Visible = false
			end
			boxOverlay.Visible = isEsp and (library_flags["Box ESP"] or library_flags["Box Fill"] or library_flags["Name ESP"] or library_flags["Health Bar"] or hasArmor or library_flags["Weapon ESP"] or library_flags["Distance ESP"] or library_flags["Info ESP"])
			nameLabel.Visible = isEsp and library_flags["Name ESP"]
			nameLabel.TextColor3 = library_flags["nameESPcolor"] or Color3.fromRGB(255,255,255)
			healthBarBg.Visible = isEsp and library_flags["Health Bar"]
			healthBarFill.BackgroundColor3 = library_flags["healthBar"] or Color3.fromRGB(0, 255, 0)
			armorBarBg.Visible = isEsp and hasArmor
			armorBarFill.BackgroundColor3 = library_flags["armorBarColor"] or Color3.fromRGB(0, 100, 255)
			if library_flags["Health Bar"] and not hasArmor then
				healthBarBg.Position = UDim2.new(0, -6, 0, 0)
			elseif library_flags["Health Bar"] and hasArmor then
				healthBarBg.Position = UDim2.new(0, -5, 0, 0)
				armorBarBg.Position = UDim2.new(0, -9, 0, 0)
			end
			wepLabel.Visible = isEsp and library_flags["Weapon ESP"]
			distLabel.Visible = isEsp and library_flags["Distance ESP"]
			wepLabel.TextColor3 = library_flags["weaponESPcolor"] or Color3.fromRGB(200, 200, 200)
			distLabel.TextColor3 = library_flags["distanceESPcolor"] or Color3.fromRGB(255, 255, 255)
			if not library_flags["Distance ESP"] and library_flags["Weapon ESP"] then
				wepLabel.Position = UDim2.new(0, 0, 1, 2)
			else
				wepLabel.Position = UDim2.new(0, 0, 1, 15)
			end
			infoLabel.Visible = isEsp and library_flags["Info ESP"]
			flagsLabel.Visible = isEsp and library_flags["Flags ESP"]
			flagsLabel.TextColor3 = library_flags["flagsESPcolor"] or Color3.fromRGB(255, 255, 255)
			
			local prFlags = {}
			local _sel = library_flags["flagsList"]
			local function _on(n) return (type(_sel) ~= "table") or _sel[n] end
			if _on("Armored") then prFlags[#prFlags+1] = "Armored" end
			if _on("Unarmored") then prFlags[#prFlags+1] = "Unarmored" end
			if _on("Helmet") then prFlags[#prFlags+1] = "Helmet" end
			if _on("Defuser") then prFlags[#prFlags+1] = "Defuser" end
			if _on("Bomb") then prFlags[#prFlags+1] = "Bomb" end
			if _on("Scoped") then prFlags[#prFlags+1] = "Scoped" end
			if _on("Planting") then prFlags[#prFlags+1] = "Planting" end
			if _on("Slowed") then prFlags[#prFlags+1] = "Slowed" end
			flagsLabel.Text = #prFlags > 0 and table.concat(prFlags, "\n") or "Flags"
			
			if library_flags["Info ESP"] then
				flagsLabel.Position = UDim2.new(1, 4, 0, 15)
			else
				flagsLabel.Position = UDim2.new(1, 4, 0, 0)
			end
			if isEsp and library_flags["Tracers"] then
				tracerLine.Visible = true
				tracerLine.BackgroundColor3 = library_flags["tracersColor"] or Color3.fromRGB(255,255,255)
				local startX, startY = previewWin.AbsoluteSize.X / 2, previewWin.AbsoluteSize.Y
				local endX, endY = boxOverlay.Position.X.Offset + (width/2), boxOverlay.Position.Y.Offset + height
				local distance = math.sqrt((endX - startX)^2 + (endY - startY)^2)
				tracerLine.Size = UDim2.new(0, 1, 0, distance)
				tracerLine.Position = UDim2.new(0, startX, 0, startY)
				local angle = math.deg(math.atan2(endY - startY, endX - startX))
				tracerLine.Rotation = angle + 90
			else
				tracerLine.Visible = false
			end
			if isEsp and library_flags["Chams"] then
				local clr = library_flags["chamsVisibleColor"] or library_flags["chamsColor"] or Color3.fromRGB(0, 255, 0)
				local wallClr = library_flags["chamsWallColor"] or library_flags["chamsColor2"] or Color3.fromRGB(255, 0, 0)
				local trans = 1 - (L_5_ and L_5_.options and L_5_.options["chamsVisibleColor"] and L_5_.options["chamsVisibleColor"].trans or 0.2)
				local wallTrans = 1 - (L_5_ and L_5_.options and L_5_.options["chamsWallColor"] and L_5_.options["chamsWallColor"].trans or 0.2)
				local isVisible = library_flags["previewChamsVisible"]
				
				local hidden = previewModel:FindFirstChild("HiddenAssets") or Instance.new("Folder", previewModel)
				hidden.Name = "HiddenAssets"
				
				local hl = previewModel:FindFirstChild("PreviewHighlight")
				if library_flags["Chams Outline"] then
					if not hl then
						hl = Instance.new("Highlight")
						hl.Name = "PreviewHighlight"
						hl.Parent = previewModel
						hl.Adornee = previewModel
						hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					end
					local outClr = library_flags["chamsVisibleOutlineColor"] or Color3.fromRGB(0, 0, 0)
					local outWallClr = library_flags["chamsWallOutlineColor"] or Color3.fromRGB(0, 0, 0)
					local outTrans = 1 - (L_5_ and L_5_.options and L_5_.options["chamsVisibleOutlineColor"] and L_5_.options["chamsVisibleOutlineColor"].trans or 0)
					local outWallTrans = 1 - (L_5_ and L_5_.options and L_5_.options["chamsWallOutlineColor"] and L_5_.options["chamsWallOutlineColor"].trans or 0)
					hl.FillTransparency = 1
					hl.OutlineColor = isVisible and outClr or outWallClr
					hl.OutlineTransparency = isVisible and outTrans or outWallTrans
				else
					if hl then hl:Destroy() end
				end
				
				
				for _, part in previewModel:GetDescendants() do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						if not part:GetAttribute("OrigColor") then part:SetAttribute("OrigColor", part.Color) end
						if not part:GetAttribute("OrigMat") then part:SetAttribute("OrigMat", part.Material.Name) end
						if not part:GetAttribute("OrigTrans") then part:SetAttribute("OrigTrans", part.Transparency) end
						
						local c = isVisible and clr or wallClr
						local t = isVisible and trans or wallTrans
						part.Color = c
						part.Material = Enum.Material.Neon
						part.Transparency = t
					end
					if part:IsA("MeshPart") then
						if not part:GetAttribute("OrigTex") then part:SetAttribute("OrigTex", part.TextureID) end
						part.TextureID = ""
					end
					if part:IsA("SurfaceAppearance") or part:IsA("Shirt") or part:IsA("Pants") or part:IsA("Decal") or part:IsA("Texture") then
						if part.Parent ~= hidden then
							local ov = part:FindFirstChild("OrigParent") or Instance.new("ObjectValue", part)
							ov.Name = "OrigParent"
							ov.Value = part.Parent
							part.Parent = hidden
						end
					end
					local adorn = part:FindFirstChild("PreviewAdorn")
					if adorn then adorn:Destroy() end
				end
			else
				local hl = previewModel:FindFirstChild("PreviewHighlight")
				if hl then hl:Destroy() end
				for _, part in previewModel:GetDescendants() do
					local adorn = part:FindFirstChild("PreviewAdorn")
					if adorn then adorn:Destroy() end
				end
				local hidden = previewModel:FindFirstChild("HiddenAssets")
				if hidden then
					for _, child in hidden:GetChildren() do
						local p = child:FindFirstChild("OrigParent")
						if p and p.Value then child.Parent = p.Value end
					end
				end
				for _, part in previewModel:GetDescendants() do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						if part:GetAttribute("OrigColor") then part.Color = part:GetAttribute("OrigColor") end
						if part:GetAttribute("OrigMat") then pcall(function() part.Material = Enum.Material[part:GetAttribute("OrigMat")] end) end
						if part:GetAttribute("OrigTrans") then part.Transparency = part:GetAttribute("OrigTrans") end
					end
					if part:IsA("MeshPart") then
						if part:GetAttribute("OrigTex") then part.TextureID = part:GetAttribute("OrigTex") end
					end
				end
			end
			if isEsp and library_flags["Outline ESP"] then
				stroke.Thickness = 2
				nameStroke.Enabled = true
			else
				stroke.Thickness = 1
				nameStroke.Enabled = false
			end
            if isEsp and library_flags["Skeleton ESP"] then
				local skelClr = library_flags["skeletonColor"] or Color3.fromRGB(255, 255, 255)
                local joints = {
                    {"Head", "UpperTorso"},
                    {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"},
                    {"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"},
                    {"UpperTorso", "LowerTorso"},
                    {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"},
                    {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"}
                }
                for i, v in joints do
                    local j1 = previewModel:FindFirstChild(v[1], true)
                    local j2 = previewModel:FindFirstChild(v[2], true)
                    local line = skelLines[i]
                    if line and j1 and j2 then
                        local p1 = get2D(j1.Position)
                        local p2 = get2D(j2.Position)
                        p1 = Vector2.new(p1.X + offset_X, p1.Y + offset_Y)
                        p2 = Vector2.new(p2.X + offset_X, p2.Y + offset_Y)
                        local dist = (p2 - p1).Magnitude
                        line.Size = UDim2.new(0, dist, 0, 1)
                        line.Position = UDim2.new(0, (p1.X + p2.X)/2, 0, (p1.Y + p2.Y)/2)
                        line.Rotation = math.deg(math.atan2(p2.Y - p1.Y, p2.X - p1.X))
						line.BackgroundColor3 = skelClr
                        line.Visible = true
                    end
                end
            else
                for _, line in skelLines do
                    line.Visible = false
                end
            end
		end
	end)
	for index, tab in self.tabs do
		local tabBtn = Instance.new("TextButton", tabContainer)
		tabBtn.LayoutOrder = index * 10
		tabBtn.Size = UDim2.new(0, 130, 0, 32)
		tabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		tabBtn.BackgroundTransparency = 1
		tabBtn.Text = ""
		Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 3)
		local tabIcon = Instance.new("ImageLabel", tabBtn)
		local icTitle = tostring(tab.title or ""):lower():gsub("(%a)(%w*)", function(a, b) return a:upper() .. b end)
		if icTitle == "Demos" then
			tabIcon.Size = UDim2.new(0, 48, 0, 48)
			tabIcon.Position = UDim2.new(0, -4, 0.5, -24)
		else
			tabIcon.Size = UDim2.new(0, 24, 0, 24)
			tabIcon.Position = UDim2.new(0, 8, 0.5, -12)
		end
		tabIcon.BackgroundTransparency = 1
		tabIcon.ScaleType = Enum.ScaleType.Fit
		tabIcon.Image = TabIcons[icTitle] or TabIcons[icTitle:lower()] or ""
		tabIcon.ImageColor3 = Color3.fromRGB(0, 255, 0)
		local tabLabel = Instance.new("TextLabel", tabBtn)
		tabLabel.Size = UDim2.new(1, -36, 1, 0)
		tabLabel.Position = UDim2.new(0, 36, 0, 0)
		tabLabel.BackgroundTransparency = 1
		tabLabel.Text = tostring(tab.title or "unnamed"):lower()
		tabLabel.Font = Enum.Font.Gotham
		tabLabel.TextSize = 14
		tabLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
		tabLabel.TextXAlignment = Enum.TextXAlignment.Left
		local secFramesToToggle = {}
		tab.sidebarSubBtns = {}
		tab.subContainer = Instance.new("Frame", tabContainer)
		tab.subContainer.Name = "SubContainer"
		tab.subContainer.LayoutOrder = index * 10 + 1
		tab.subContainer.Size = UDim2.new(1, 0, 0, 0)
		tab.subContainer.BackgroundTransparency = 1
		tab.subContainer.ClipsDescendants = true
		local subList = Instance.new("UIListLayout", tab.subContainer)
		subList.SortOrder = Enum.SortOrder.LayoutOrder
		if #tab.subtabs > 0 then
			tab.subContainer.Visible = true
			for _, sub in tab.subtabs do
				local sBtn = Instance.new("TextButton", tab.subContainer)
				sBtn.Size = UDim2.new(1, 0, 0, 22)
				sBtn.BackgroundTransparency = 1
				sBtn.Text = ""
				local sLabel = Instance.new("TextLabel", sBtn)
				sLabel.Size = UDim2.new(1, -46, 1, 0)
				sLabel.Position = UDim2.new(0, 46, 0, 0)
				sLabel.BackgroundTransparency = 1
				sLabel.Text = sub.title:lower()
				sLabel.Font = Enum.Font.Gotham
				sLabel.TextSize = 13
				sLabel.TextColor3 = Color3.fromRGB(120, 120, 120)
				sLabel.TextXAlignment = Enum.TextXAlignment.Left
				table.insert(tab.sidebarSubBtns, {btn = sBtn, label = sLabel, sub = sub})
			end
		end
		local pageFrame = Instance.new("ScrollingFrame", content)
		pageFrame.Size = UDim2.new(1, 0, 1, 0)
		pageFrame.BackgroundTransparency = 1
		pageFrame.BorderSizePixel = 0
		pageFrame.ScrollBarThickness = 1
		pageFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		pageFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		pageFrame.Visible = false
		if tostring(tab.title):lower() == "skins" then
			local skinLayout = Instance.new("UIListLayout", pageFrame)
			skinLayout.Padding = UDim.new(0, 8)
			skinLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			skinLayout.SortOrder = Enum.SortOrder.LayoutOrder
			Instance.new("UIPadding", pageFrame).PaddingTop = UDim.new(0, 5)
			local RS = game:GetService("ReplicatedStorage")
			local Skins = RS:FindFirstChild("Skins")
			local Viewmodels = RS:FindFirstChild("Viewmodels")
			local AllWeapons = {}
			local AllSkins = {}
			local AllKnives = {
				"CT Knife", "T Knife", "Banana", "Bayonet", "Bearded Axe", "Butterfly Knife",
				"Cleaver", "Crowbar", "Falchion Knife", "Flip Knife", "Gut Knife", "Huntsman Knife",
				"Karambit", "M9 Bayonet", "Sickle"
			}
			local extModels = nil
			pcall(function() extModels = game:GetObjects("rbxassetid://7285197035")[1] end)
			if extModels and extModels:FindFirstChild("Knives") then
				for _, v in extModels.Knives:GetChildren() do
					local exists = false
					for _, existing in AllKnives do
						if existing == v.Name then exists = true break end
					end
					if not exists then table.insert(AllKnives, v.Name) end
				end
			end
			if Skins then
				for _, v in Skins:GetChildren() do
					if v:IsA("Folder") then
						table.insert(AllWeapons, v.Name)
						AllSkins[v.Name] = {"Inventory"}
						for _, v2 in v:GetChildren() do
							if v2:IsA("Folder") or v2:IsA("Model") then
								table.insert(AllSkins[v.Name], v2.Name)
							end
						end
					end
				end
			end
			table.sort(AllWeapons)
			local currentWeapon = AllWeapons[1] or "none"
			local currentSkin = "Inventory"
			local scHeader = Instance.new("Frame", pageFrame)
			scHeader.Size = UDim2.new(0.95, 0, 0, 30)
			scHeader.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
			scHeader.BorderSizePixel = 0
			scHeader.LayoutOrder = 1
			Instance.new("UICorner", scHeader).CornerRadius = UDim.new(0, 5)
			Instance.new("UIStroke", scHeader).Color = Color3.fromRGB(25, 25, 25)
			local scTitle = Instance.new("TextLabel", scHeader)
			scTitle.Size = UDim2.new(1, 0, 1, 0)
			scTitle.BackgroundTransparency = 1
			scTitle.Text = "skin changer"
			scTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
			scTitle.Font = Enum.Font.GothamBold
			scTitle.TextSize = 13
			local topContainer = Instance.new("Frame", pageFrame)
			topContainer.Size = UDim2.new(0.95, 0, 0, 76)
			topContainer.BackgroundTransparency = 1
			topContainer.LayoutOrder = 2
			local leftCol = Instance.new("Frame", topContainer)
			leftCol.Size = UDim2.new(0.31, 0, 1, 0)
			leftCol.BackgroundTransparency = 1
			local leftList = Instance.new("UIListLayout", leftCol)
			leftList.Padding = UDim.new(0, 4)
			leftList.SortOrder = Enum.SortOrder.LayoutOrder
			local rightCol = Instance.new("Frame", topContainer)
			rightCol.Size = UDim2.new(0.31, 0, 1, 0)
			rightCol.Position = UDim2.new(0.345, 0, 0, 0)
			rightCol.BackgroundTransparency = 1
			local rightList = Instance.new("UIListLayout", rightCol)
			rightList.Padding = UDim.new(0, 4)
			rightList.SortOrder = Enum.SortOrder.LayoutOrder
			local sleeveCol = Instance.new("Frame", topContainer)
			sleeveCol.Size = UDim2.new(0.31, 0, 1, 0)
			sleeveCol.Position = UDim2.new(0.69, 0, 0, 0)
			sleeveCol.BackgroundTransparency = 1
			local sleeveList = Instance.new("UIListLayout", sleeveCol)
			sleeveList.Padding = UDim.new(0, 4)
			sleeveList.SortOrder = Enum.SortOrder.LayoutOrder
			local wepFrame = Instance.new("Frame", leftCol)
			wepFrame.Size = UDim2.new(1, 0, 0, 22)
			wepFrame.BackgroundTransparency = 1
			wepFrame.LayoutOrder = 1
			local wepLabel = Instance.new("TextLabel", wepFrame)
			wepLabel.Size = UDim2.new(0.3, 0, 1, 0)
			wepLabel.BackgroundTransparency = 1
			wepLabel.Text = "weapon"
			wepLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
			wepLabel.Font = Enum.Font.SourceSans
			wepLabel.TextSize = 13
			wepLabel.TextXAlignment = Enum.TextXAlignment.Left
			local wepBtn = Instance.new("TextButton", wepFrame)
			wepBtn.Size = UDim2.new(0.65, 0, 0, 18)
			wepBtn.Position = UDim2.new(0.35, 0, 0.5, -9)
			wepBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			wepBtn.Text = currentWeapon
			wepBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
			wepBtn.Font = Enum.Font.SourceSans
			wepBtn.TextSize = 11
			wepBtn.TextXAlignment = Enum.TextXAlignment.Left
			Instance.new("UICorner", wepBtn).CornerRadius = UDim.new(0, 3)
			Instance.new("UIStroke", wepBtn).Color = Color3.fromRGB(35, 35, 35)
			Instance.new("UIPadding", wepBtn).PaddingLeft = UDim.new(0, 6)
			local wepDrop = Instance.new("ScrollingFrame", sg)
			wepDrop.Size = UDim2.new(0, 200, 0, math.min(#AllWeapons * 18, 250))
			wepDrop.CanvasSize = UDim2.new(0, 0, 0, #AllWeapons * 18)
			wepDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			wepDrop.BorderSizePixel = 0
			wepDrop.ScrollBarThickness = 2
			wepDrop.Visible = false
			wepDrop.ZIndex = 9999
			wepDrop.ClipsDescendants = true
			Instance.new("UIListLayout", wepDrop).SortOrder = Enum.SortOrder.LayoutOrder
			table.insert(floatingDropdowns, wepDrop)
			local rebuildSkinDrop
			local skinBtn
			local skinDrop
			local loadWeaponPreview
			local loadGlovePreview
			local loadSleevePreview
			local function getFlagName(wName)
				local isKnife = false
				for _, k in AllKnives do
					if k == wName then isKnife = true break end
				end
				local formatted = wName:gsub(" ", "_"):gsub("-", "_")
				return (isKnife and "skin_knife_" or "skin_") .. formatted
			end
			for _, wName in AllWeapons do
				local item = Instance.new("TextButton", wepDrop)
				item.Size = UDim2.new(1, 0, 0, 18)
				item.BackgroundTransparency = 1
				item.Text = " " .. wName
				item.TextColor3 = Color3.fromRGB(180, 180, 180)
				item.Font = Enum.Font.SourceSans
				item.TextSize = 11
				item.TextXAlignment = Enum.TextXAlignment.Left
				item.ZIndex = 10000
				item.MouseButton1Click:Connect(function()
					currentWeapon = wName
					wepBtn.Text = wName
					library_flags["skinWeapon"] = wName
					if L_5_.options and L_5_.options["skinWeapon"] then L_5_.options["skinWeapon"].value = wName end
					wepDrop.Visible = false
					local flagName = getFlagName(wName)
					local savedSkin = library_flags[flagName] or "Inventory"
					currentSkin = savedSkin
					skinBtn.Text = savedSkin
					library_flags["skinSkin"] = savedSkin
					if L_5_.options and L_5_.options["skinSkin"] then L_5_.options["skinSkin"].value = savedSkin end
					if rebuildSkinDrop then rebuildSkinDrop() end
					loadWeaponPreview()
				end)
			end
			wepBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do if dl ~= wepDrop then dl.Visible = false end end
				wepDrop.Visible = not wepDrop.Visible
				if wepDrop.Visible then
					local relPos = wepBtn.AbsolutePosition - (L_5_.mainFrame and L_5_.mainFrame.AbsolutePosition or Vector2.new())
					wepDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20)
					wepDrop.Size = UDim2.new(0, wepBtn.AbsoluteSize.X, 0, math.min(#AllWeapons * 18, 250))
					wepDrop.Parent = L_5_.mainFrame or sg
				end
			end)
			local skinFrame = Instance.new("Frame", leftCol)
			skinFrame.Size = UDim2.new(1, 0, 0, 22)
			skinFrame.BackgroundTransparency = 1
			skinFrame.LayoutOrder = 2
			local skinLabel = Instance.new("TextLabel", skinFrame)
			skinLabel.Size = UDim2.new(0.3, 0, 1, 0)
			skinLabel.BackgroundTransparency = 1
			skinLabel.Text = "skin"
			skinLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
			skinLabel.Font = Enum.Font.SourceSans
			skinLabel.TextSize = 13
			skinLabel.TextXAlignment = Enum.TextXAlignment.Left
			skinBtn = Instance.new("TextButton", skinFrame)
			skinBtn.Size = UDim2.new(0.65, 0, 0, 18)
			skinBtn.Position = UDim2.new(0.35, 0, 0.5, -9)
			skinBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			skinBtn.Text = currentSkin
			skinBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
			skinBtn.Font = Enum.Font.SourceSans
			skinBtn.TextSize = 11
			skinBtn.TextXAlignment = Enum.TextXAlignment.Left
			Instance.new("UICorner", skinBtn).CornerRadius = UDim.new(0, 3)
			Instance.new("UIStroke", skinBtn).Color = Color3.fromRGB(35, 35, 35)
			Instance.new("UIPadding", skinBtn).PaddingLeft = UDim.new(0, 6)
			skinDrop = Instance.new("ScrollingFrame", sg)
			skinDrop.Size = UDim2.new(0, 200, 0, 100)
			skinDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
			skinDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			skinDrop.BorderSizePixel = 0
			skinDrop.ScrollBarThickness = 2
			skinDrop.Visible = false
			skinDrop.ZIndex = 9999
			skinDrop.ClipsDescendants = true
			Instance.new("UIListLayout", skinDrop).SortOrder = Enum.SortOrder.LayoutOrder
			table.insert(floatingDropdowns, skinDrop)
			rebuildSkinDrop = function()
				for _, ch in skinDrop:GetChildren() do
					if ch:IsA("TextButton") then ch:Destroy() end
				end
				local skins = AllSkins[currentWeapon] or {"Inventory"}
				for _, sName in skins do
					local item = Instance.new("TextButton", skinDrop)
					item.Size = UDim2.new(1, 0, 0, 18)
					item.BackgroundTransparency = 1
					item.Text = " " .. sName
					item.TextColor3 = Color3.fromRGB(180, 180, 180)
					item.Font = Enum.Font.SourceSans
					item.TextSize = 11
					item.TextXAlignment = Enum.TextXAlignment.Left
					item.ZIndex = 10000
					item.MouseButton1Click:Connect(function()
						currentSkin = sName
						skinBtn.Text = sName
						library_flags["skinSkin"] = sName
						if L_5_.options and L_5_.options["skinSkin"] then L_5_.options["skinSkin"].value = sName end
						skinDrop.Visible = false
						loadWeaponPreview()
					end)
				end
				skinDrop.CanvasSize = UDim2.new(0, 0, 0, #skins * 18)
				skinDrop.Size = UDim2.new(0, skinBtn.AbsoluteSize.X, 0, math.min(#skins * 18, 250))
			end
			skinBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do if dl ~= skinDrop then dl.Visible = false end end
				skinDrop.Visible = not skinDrop.Visible
				if skinDrop.Visible then
					if rebuildSkinDrop then rebuildSkinDrop() end
					local relPos = skinBtn.AbsolutePosition - (L_5_.mainFrame and L_5_.mainFrame.AbsolutePosition or Vector2.new())
					skinDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20)
					skinDrop.Parent = L_5_.mainFrame or sg
				end
			end)
			local gloveTypeFrame = Instance.new("Frame", rightCol)
			gloveTypeFrame.Size = UDim2.new(1, 0, 0, 22)
			gloveTypeFrame.BackgroundTransparency = 1
			gloveTypeFrame.LayoutOrder = 1
			local gloveTypeLabel = Instance.new("TextLabel", gloveTypeFrame)
			gloveTypeLabel.Size = UDim2.new(0.3, 0, 1, 0)
			gloveTypeLabel.BackgroundTransparency = 1
			gloveTypeLabel.Text = "type"
			gloveTypeLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
			gloveTypeLabel.Font = Enum.Font.SourceSans
			gloveTypeLabel.TextSize = 13
			gloveTypeLabel.TextXAlignment = Enum.TextXAlignment.Left
			local GloveTypes = {"None"}
			local Gloves = game:GetService("ReplicatedStorage"):FindFirstChild("Gloves")
			local GloveModels = Gloves and Gloves:FindFirstChild("Models")
			if Gloves then
				for _, fldr in Gloves:GetChildren() do
					if fldr:IsA("Folder") and fldr.Name ~= "Models" and fldr.Name ~= "Racer" then
						table.insert(GloveTypes, fldr.Name)
					end
				end
			end
			table.sort(GloveTypes, function(a,b) if a == "None" then return true end if b == "None" then return false end return a < b end)
			local currentGloveType = library_flags["skinGloveModel"] or "None"
			local gloveTypeBtn = Instance.new("TextButton", gloveTypeFrame)
			gloveTypeBtn.Size = UDim2.new(0.65, 0, 0, 18)
			gloveTypeBtn.Position = UDim2.new(0.35, 0, 0.5, -9)
			gloveTypeBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			gloveTypeBtn.Text = currentGloveType
			gloveTypeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
			gloveTypeBtn.Font = Enum.Font.SourceSans
			gloveTypeBtn.TextSize = 11
			gloveTypeBtn.TextXAlignment = Enum.TextXAlignment.Left
			Instance.new("UICorner", gloveTypeBtn).CornerRadius = UDim.new(0, 3)
			Instance.new("UIStroke", gloveTypeBtn).Color = Color3.fromRGB(35, 35, 35)
			Instance.new("UIPadding", gloveTypeBtn).PaddingLeft = UDim.new(0, 6)
			local gtDrop = Instance.new("ScrollingFrame", sg)
			gtDrop.Size = UDim2.new(0, 200, 0, math.min(#GloveTypes * 18, 250))
			gtDrop.CanvasSize = UDim2.new(0, 0, 0, #GloveTypes * 18)
			gtDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			gtDrop.BorderSizePixel = 0
			gtDrop.ScrollBarThickness = 2
			gtDrop.Visible = false
			gtDrop.ZIndex = 9999
			Instance.new("UIListLayout", gtDrop).SortOrder = Enum.SortOrder.LayoutOrder
			table.insert(floatingDropdowns, gtDrop)
			local function getGloveSkins(modelName)
				local res = {"Default"}
				if modelName == "None" or not Gloves then return res end
				local gFolder = Gloves:FindFirstChild(modelName)
				if gFolder then
					for _, sk in gFolder:GetChildren() do
						table.insert(res, sk.Name)
					end
				end
				return res
			end
			local currentGloveSkin = library_flags["skinGloveSkin"] or "Default"
			local gloveBtn
			local function rebuildGloveSkinDrop(gDrop, gBtn)
				for _, ch in gDrop:GetChildren() do
					if ch:IsA("TextButton") then ch:Destroy() end
				end
				local gSkins = getGloveSkins(currentGloveType)
				for _, skName in gSkins do
					local item = Instance.new("TextButton", gDrop)
					item.Size = UDim2.new(1, 0, 0, 18)
					item.BackgroundTransparency = 1
					item.Text = " " .. skName
					item.TextColor3 = Color3.fromRGB(180, 180, 180)
					item.Font = Enum.Font.SourceSans
					item.TextSize = 11
					item.TextXAlignment = Enum.TextXAlignment.Left
					item.ZIndex = 10000
					item.MouseButton1Click:Connect(function()
						currentGloveSkin = skName
						library_flags["skinGloveSkin"] = skName
						if gBtn then gBtn.Text = skName end
						if L_5_.options and L_5_.options["skinGloveSkin"] then L_5_.options["skinGloveSkin"].value = skName end
						gDrop.Visible = false
						loadGlovePreview()
					end)
				end
				gDrop.CanvasSize = UDim2.new(0, 0, 0, #gSkins * 18)
				if gBtn then gDrop.Size = UDim2.new(0, gBtn.AbsoluteSize.X, 0, math.min(#gSkins * 18, 250)) end
			end
			for _, gtName in GloveTypes do
				local item = Instance.new("TextButton", gtDrop)
				item.Size = UDim2.new(1, 0, 0, 18)
				item.BackgroundTransparency = 1
				item.Text = " " .. gtName
				item.TextColor3 = Color3.fromRGB(180, 180, 180)
				item.Font = Enum.Font.SourceSans
				item.TextSize = 11
				item.TextXAlignment = Enum.TextXAlignment.Left
				item.ZIndex = 10000
				item.MouseButton1Click:Connect(function()
					currentGloveType = gtName
					gloveTypeBtn.Text = gtName
					library_flags["skinGloveModel"] = gtName
					if L_5_.options and L_5_.options["skinGloveModel"] then L_5_.options["skinGloveModel"].value = gtName end
					gtDrop.Visible = false
					currentGloveSkin = "Default"
					library_flags["skinGloveSkin"] = "Default"
					if gloveBtn then gloveBtn.Text = "Default" end
					if L_5_.options and L_5_.options["skinGloveSkin"] then L_5_.options["skinGloveSkin"].value = "Default" end
					rebuildGloveSkinDrop(floatingDropdowns[#floatingDropdowns], gloveBtn)
					loadGlovePreview()
				end)
			end
			gloveTypeBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do if dl ~= gtDrop then dl.Visible = false end end
				gtDrop.Visible = not gtDrop.Visible
				if gtDrop.Visible then
					local relPos = gloveTypeBtn.AbsolutePosition - (L_5_.mainFrame and L_5_.mainFrame.AbsolutePosition or Vector2.new())
					gtDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20)
					gtDrop.Size = UDim2.new(0, gloveTypeBtn.AbsoluteSize.X, 0, math.min(#GloveTypes * 18, 250))
					gtDrop.Parent = L_5_.mainFrame or sg
				end
			end)
			local gloveRow = Instance.new("Frame", rightCol)
			gloveRow.Size = UDim2.new(1, 0, 0, 22)
			gloveRow.BackgroundTransparency = 1
			gloveRow.LayoutOrder = 2
			local gloveLabel = Instance.new("TextLabel", gloveRow)
			gloveLabel.Size = UDim2.new(0.3, 0, 1, 0)
			gloveLabel.BackgroundTransparency = 1
			gloveLabel.Text = "skin"
			gloveLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
			gloveLabel.Font = Enum.Font.SourceSans
			gloveLabel.TextSize = 13
			gloveLabel.TextXAlignment = Enum.TextXAlignment.Left
			gloveBtn = Instance.new("TextButton", gloveRow)
			gloveBtn.Size = UDim2.new(0.65, 0, 0, 18)
			gloveBtn.Position = UDim2.new(0.35, 0, 0.5, -9)
			gloveBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			gloveBtn.Text = currentGloveSkin
			gloveBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
			gloveBtn.Font = Enum.Font.SourceSans
			gloveBtn.TextSize = 11
			gloveBtn.TextXAlignment = Enum.TextXAlignment.Left
			Instance.new("UICorner", gloveBtn).CornerRadius = UDim.new(0, 3)
			Instance.new("UIStroke", gloveBtn).Color = Color3.fromRGB(35, 35, 35)
			Instance.new("UIPadding", gloveBtn).PaddingLeft = UDim.new(0, 6)
			local gDrop = Instance.new("ScrollingFrame", sg)
			gDrop.Size = UDim2.new(0, 200, 0, 100)
			gDrop.CanvasSize = UDim2.new(0, 0, 0, 0)
			gDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			gDrop.BorderSizePixel = 0
			gDrop.ScrollBarThickness = 2
			gDrop.Visible = false
			gDrop.ZIndex = 9999
			Instance.new("UIListLayout", gDrop).SortOrder = Enum.SortOrder.LayoutOrder
			table.insert(floatingDropdowns, gDrop)
			rebuildGloveSkinDrop(gDrop, gloveBtn)
			gloveBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do
					if dl ~= gDrop then dl.Visible = false end
				end
				gDrop.Visible = not gDrop.Visible
				if gDrop.Visible then
					rebuildGloveSkinDrop(gDrop, gloveBtn)
					local relPos = gloveBtn.AbsolutePosition - (L_5_.mainFrame and L_5_.mainFrame.AbsolutePosition or Vector2.new())
					gDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20)
					gDrop.Parent = L_5_.mainFrame or sg
				end
			end)
			local SleeveChoices = getgenv().CW_AllSleeves or env.AllSleeves or {"Default", "None"}
			if #SleeveChoices == 0 then SleeveChoices = {"Default", "None"} end
			local currentCTSleeve = library_flags["skinSleeveCT"] or SleeveChoices[1] or "Default"
			local currentTSleeve = library_flags["skinSleeveT"] or SleeveChoices[1] or "Default"
			local function makeSleeveSelector(labelText, flagName, currentValue, layoutOrder)
				local row = Instance.new("Frame", sleeveCol)
				row.Size = UDim2.new(1, 0, 0, 22)
				row.BackgroundTransparency = 1
				row.LayoutOrder = layoutOrder
				local label = Instance.new("TextLabel", row)
				label.Size = UDim2.new(0.34, 0, 1, 0)
				label.BackgroundTransparency = 1
				label.Text = labelText
				label.TextColor3 = Color3.fromRGB(180, 180, 180)
				label.Font = Enum.Font.SourceSans
				label.TextSize = 13
				label.TextXAlignment = Enum.TextXAlignment.Left
				local btn = Instance.new("TextButton", row)
				btn.Size = UDim2.new(0.62, 0, 0, 18)
				btn.Position = UDim2.new(0.38, 0, 0.5, -9)
				btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
				btn.Text = currentValue
				btn.TextColor3 = Color3.fromRGB(180, 180, 180)
				btn.Font = Enum.Font.SourceSans
				btn.TextSize = 11
				btn.TextXAlignment = Enum.TextXAlignment.Left
				Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3)
				Instance.new("UIStroke", btn).Color = Color3.fromRGB(35, 35, 35)
				Instance.new("UIPadding", btn).PaddingLeft = UDim.new(0, 6)
				local drop = Instance.new("ScrollingFrame", sg)
				drop.Size = UDim2.new(0, 200, 0, math.min(#SleeveChoices * 18, 250))
				drop.CanvasSize = UDim2.new(0, 0, 0, #SleeveChoices * 18)
				drop.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
				drop.BorderSizePixel = 0
				drop.ScrollBarThickness = 2
				drop.Visible = false
				drop.ZIndex = 9999
				drop.ClipsDescendants = true
				Instance.new("UIListLayout", drop).SortOrder = Enum.SortOrder.LayoutOrder
				table.insert(floatingDropdowns, drop)
				local function rebuild()
					for _, ch in drop:GetChildren() do
						if ch:IsA("TextButton") then ch:Destroy() end
					end
					SleeveChoices = getgenv().CW_AllSleeves or env.AllSleeves or SleeveChoices
					if #SleeveChoices == 0 then SleeveChoices = {"Default", "None"} end
					for _, sleeveName in SleeveChoices do
						local item = Instance.new("TextButton", drop)
						item.Size = UDim2.new(1, 0, 0, 18)
						item.BackgroundTransparency = 1
						item.Text = " " .. sleeveName
						item.TextColor3 = Color3.fromRGB(180, 180, 180)
						item.Font = Enum.Font.SourceSans
						item.TextSize = 11
						item.TextXAlignment = Enum.TextXAlignment.Left
						item.ZIndex = 10000
						item.MouseButton1Click:Connect(function()
							btn.Text = sleeveName
							library_flags[flagName] = sleeveName
							if L_5_ and L_5_.options then
								pcall(function()
									if L_5_.options[flagName] then L_5_.options[flagName]:SetValue(sleeveName) end
								end)
							end
							drop.Visible = false
							pcall(function()
								if getgenv().UpdateSkinUI then getgenv().UpdateSkinUI() end
							end)
						end)
					end
					drop.CanvasSize = UDim2.new(0, 0, 0, #SleeveChoices * 18)
					drop.Size = UDim2.new(0, btn.AbsoluteSize.X, 0, math.min(#SleeveChoices * 18, 250))
				end
				btn.MouseButton1Click:Connect(function()
					for _, dl in floatingDropdowns do if dl ~= drop then dl.Visible = false end end
					drop.Visible = not drop.Visible
					if drop.Visible then
						rebuild()
						local relPos = btn.AbsolutePosition - (L_5_.mainFrame and L_5_.mainFrame.AbsolutePosition or Vector2.new())
						drop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20)
						drop.Parent = L_5_.mainFrame or sg
					end
				end)
				rebuild()
				return btn
			end
			local ctSleeveBtn = makeSleeveSelector("ct sleeve", "skinSleeveCT", currentCTSleeve, 1)
			local tSleeveBtn = makeSleeveSelector("t sleeve", "skinSleeveT", currentTSleeve, 2)
			local prevContainer = Instance.new("Frame", pageFrame)
			prevContainer.Size = UDim2.new(0.95, 0, 0, 220)
			prevContainer.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
			prevContainer.BorderSizePixel = 0
			prevContainer.LayoutOrder = 4
			prevContainer.Active = true
			Instance.new("UICorner", prevContainer).CornerRadius = UDim.new(0, 5)
			Instance.new("UIStroke", prevContainer).Color = Color3.fromRGB(25, 25, 25)
			local prevLabelWep = Instance.new("TextLabel", prevContainer)
			prevLabelWep.Size = UDim2.new(0.333, 0, 0, 18)
			prevLabelWep.BackgroundTransparency = 1
			prevLabelWep.Text = "weapon"
			prevLabelWep.TextColor3 = Color3.fromRGB(100, 100, 100)
			prevLabelWep.Font = Enum.Font.SourceSans
			prevLabelWep.TextSize = 12
			local prevLabelGlove = Instance.new("TextLabel", prevContainer)
			prevLabelGlove.Size = UDim2.new(0.333, 0, 0, 18)
			prevLabelGlove.Position = UDim2.new(0.333, 0, 0, 0)
			prevLabelGlove.BackgroundTransparency = 1
			prevLabelGlove.Text = "gloves"
			prevLabelGlove.TextColor3 = Color3.fromRGB(100, 100, 100)
			prevLabelGlove.Font = Enum.Font.SourceSans
			prevLabelGlove.TextSize = 12
			local prevLabelSleeve = Instance.new("TextLabel", prevContainer)
			prevLabelSleeve.Size = UDim2.new(0.333, 0, 0, 18)
			prevLabelSleeve.Position = UDim2.new(0.666, 0, 0, 0)
			prevLabelSleeve.BackgroundTransparency = 1
			prevLabelSleeve.Text = "sleeves"
			prevLabelSleeve.TextColor3 = Color3.fromRGB(100, 100, 100)
			prevLabelSleeve.Font = Enum.Font.SourceSans
			prevLabelSleeve.TextSize = 12
			local splitContainer = Instance.new("Frame", prevContainer)
			splitContainer.Size = UDim2.new(0.95, 0, 0, 168)
			splitContainer.Position = UDim2.new(0.025, 0, 0, 20)
			splitContainer.BackgroundTransparency = 1
			local skinViewport = Instance.new("ViewportFrame", splitContainer)
			skinViewport.Size = UDim2.new(0.31, 0, 1, 0)
			skinViewport.Position = UDim2.new(0, 0, 0, 0)
			skinViewport.BackgroundTransparency = 1
			skinViewport.Ambient = Color3.fromRGB(200, 200, 200)
			skinViewport.Active = true
			getgenv().skinViewportRef = skinViewport
			local gloveViewport = Instance.new("ViewportFrame", splitContainer)
			gloveViewport.Size = UDim2.new(0.31, 0, 1, 0)
			gloveViewport.Position = UDim2.new(0.345, 0, 0, 0)
			gloveViewport.BackgroundTransparency = 1
			gloveViewport.Ambient = Color3.fromRGB(200, 200, 200)
			gloveViewport.Active = true
			getgenv().gloveViewportRef = gloveViewport
			local sleeveViewport = Instance.new("ViewportFrame", splitContainer)
			sleeveViewport.Size = UDim2.new(0.31, 0, 1, 0)
			sleeveViewport.Position = UDim2.new(0.69, 0, 0, 0)
			sleeveViewport.BackgroundTransparency = 1
			sleeveViewport.Ambient = Color3.fromRGB(200, 200, 200)
			sleeveViewport.Active = true
			getgenv().sleeveViewportRef = sleeveViewport
			local splitLine = Instance.new("Frame", splitContainer)
			splitLine.Size = UDim2.new(0, 2, 1, -10)
			splitLine.Position = UDim2.new(0.327, -1, 0, 5)
			splitLine.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			splitLine.BorderSizePixel = 0
			local splitLine2 = Instance.new("Frame", splitContainer)
			splitLine2.Size = UDim2.new(0, 2, 1, -10)
			splitLine2.Position = UDim2.new(0.672, -1, 0, 5)
			splitLine2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			splitLine2.BorderSizePixel = 0
			local skinCam = Instance.new("Camera")
			skinCam.FieldOfView = 50
			skinViewport.CurrentCamera = skinCam
			skinCam.Parent = skinViewport
			local skinLight = Instance.new("PointLight", skinCam)
			skinLight.Color = Color3.fromRGB(255, 255, 255)
			skinLight.Brightness = 2
			skinLight.Range = 20
			local skinModel = Instance.new("Model", skinViewport)
			local gloveCam = Instance.new("Camera")
			gloveCam.FieldOfView = 50
			gloveViewport.CurrentCamera = gloveCam
			gloveCam.Parent = gloveViewport
			local gloveLight = Instance.new("PointLight", gloveCam)
			gloveLight.Color = Color3.fromRGB(255, 255, 255)
			gloveLight.Brightness = 2
			gloveLight.Range = 20
			local gloveModel = Instance.new("Model", gloveViewport)
			local sleeveCam = Instance.new("Camera")
			sleeveCam.FieldOfView = 50
			sleeveViewport.CurrentCamera = sleeveCam
			sleeveCam.Parent = sleeveViewport
			local sleeveLight = Instance.new("PointLight", sleeveCam)
			sleeveLight.Color = Color3.fromRGB(255, 255, 255)
			sleeveLight.Brightness = 2
			sleeveLight.Range = 20
			local sleeveModel = Instance.new("Model", sleeveViewport)
			local hintLabel = Instance.new("TextLabel", prevContainer)
			hintLabel.Size = UDim2.new(1, 0, 0, 15)
			hintLabel.Position = UDim2.new(0, 0, 1, -18)
			hintLabel.BackgroundTransparency = 1
			hintLabel.Text = "drag \xE2\x80\xA2 scroll  (independently)"
			hintLabel.TextColor3 = Color3.fromRGB(60, 60, 60)
			hintLabel.Font = Enum.Font.SourceSans
			hintLabel.TextSize = 11
			local skinRotY = -90
			local skinRotX = 0
			local skinDist = 5
			local skinDragging = false
			local skinDragStart = Vector2.new()
			local gloveRotY = 0
			local gloveRotX = 0
			local gloveDist = 5
			local gloveDragging = false
			local gloveDragStart = Vector2.new()
			local sleeveRotY = 0
			local sleeveRotX = 0
			local sleeveDist = 5
			local sleeveDragging = false
			local sleeveDragStart = Vector2.new()
			local function updateSkinCam()
				local radY = math.rad(skinRotY)
				local radX = math.rad(skinRotX)
				local offset = CFrame.Angles(radX, radY, 0) * Vector3.new(0, 0, skinDist)
				skinCam.CFrame = CFrame.new(offset, Vector3.new(0, 0, 0))
			end
			updateSkinCam()
			local function updateGloveCam()
				local radY = math.rad(gloveRotY)
				local radX = math.rad(gloveRotX)
				local offset = CFrame.Angles(radX, radY, 0) * Vector3.new(0, 0, gloveDist)
				gloveCam.CFrame = CFrame.new(offset, Vector3.new(0, 0, 0))
			end
			updateGloveCam()
			local function updateSleeveCam()
				local radY = math.rad(sleeveRotY)
				local radX = math.rad(sleeveRotX)
				local offset = CFrame.Angles(radX, radY, 0) * Vector3.new(0, 0, sleeveDist)
				sleeveCam.CFrame = CFrame.new(offset, Vector3.new(0, 0, 0))
			end
			updateSleeveCam()
			skinViewport.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					skinDragging = true
					skinDragStart = Vector2.new(input.Position.X, input.Position.Y)
				end
			end)
			skinViewport.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					skinDragging = false
				end
			end)
			skinViewport.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and skinDragging then
					local deltaX = input.Position.X - skinDragStart.X
					local deltaY = input.Position.Y - skinDragStart.Y
					skinRotY = skinRotY - deltaX * 0.5
					skinRotX = math.clamp(skinRotX - deltaY * 0.5, -89, 89)
					skinDragStart = Vector2.new(input.Position.X, input.Position.Y)
					updateSkinCam()
				end
				if input.UserInputType == Enum.UserInputType.MouseWheel then
					skinDist = math.clamp(skinDist - input.Position.Z * 0.2, 1, 20)
					updateSkinCam()
				end
			end)
			gloveViewport.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					gloveDragging = true
					gloveDragStart = Vector2.new(input.Position.X, input.Position.Y)
				end
			end)
			gloveViewport.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					gloveDragging = false
				end
			end)
			gloveViewport.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and gloveDragging then
					local deltaX = input.Position.X - gloveDragStart.X
					local deltaY = input.Position.Y - gloveDragStart.Y
					gloveRotY = gloveRotY - deltaX * 0.5
					gloveRotX = math.clamp(gloveRotX - deltaY * 0.5, -89, 89)
					gloveDragStart = Vector2.new(input.Position.X, input.Position.Y)
					updateGloveCam()
				end
				if input.UserInputType == Enum.UserInputType.MouseWheel then
					gloveDist = math.clamp(gloveDist - input.Position.Z * 0.2, 1, 20)
					updateGloveCam()
				end
			end)
			sleeveViewport.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sleeveDragging = true
					sleeveDragStart = Vector2.new(input.Position.X, input.Position.Y)
				end
			end)
			sleeveViewport.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sleeveDragging = false
				end
			end)
			sleeveViewport.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and sleeveDragging then
					local deltaX = input.Position.X - sleeveDragStart.X
					local deltaY = input.Position.Y - sleeveDragStart.Y
					sleeveRotY = sleeveRotY - deltaX * 0.5
					sleeveRotX = math.clamp(sleeveRotX - deltaY * 0.5, -89, 89)
					sleeveDragStart = Vector2.new(input.Position.X, input.Position.Y)
					updateSleeveCam()
				end
				if input.UserInputType == Enum.UserInputType.MouseWheel then
					sleeveDist = math.clamp(sleeveDist - input.Position.Z * 0.2, 1, 20)
					updateSleeveCam()
				end
			end)
			loadWeaponPreview = function()
				skinModel:ClearAllChildren()
				if not Viewmodels then return end
				local vmName = "v_" .. currentWeapon
				local srcVM = Viewmodels and Viewmodels:FindFirstChild(vmName)
				local isExtModel = false
				if not srcVM then
					local extModels
					pcall(function() extModels = game:GetObjects("rbxassetid://7285197035")[1] end)
					if extModels and extModels:FindFirstChild("Knives") then
						srcVM = extModels.Knives:FindFirstChild(currentWeapon)
						isExtModel = true
					end
				end
				if not srcVM then return end
				pcall(function()
					srcVM.Archivable = true
					for _, d in srcVM:GetDescendants() do
						pcall(function() d.Archivable = true end)
					end
					local clone = srcVM:Clone()
					if not clone then return end
					for _, d in clone:GetDescendants() do
						if d:IsA("BaseScript") or d:IsA("Script") or d:IsA("LocalScript") then
							d:Destroy()
						end
					end
					for _, d in clone:GetDescendants() do
						if d:IsA("BasePart") then
							local n = d.Name:lower()
							if n == "left arm" or n == "right arm" or n == "rglove" or n == "lglove" or n == "glove" or n:find("fake") then
								d.Transparency = 1
							end
							d.Anchored = true
							d.CanCollide = false
						end
					end
					if currentSkin ~= "Inventory" and Skins then
						local wepForSkin = currentWeapon
						if (wepForSkin == "CT Knife" or wepForSkin == "T Knife") and not Skins:FindFirstChild(wepForSkin) then
							wepForSkin = "M9 Bayonet"
						end
						local skinData = Skins:FindFirstChild(wepForSkin) and Skins[wepForSkin]:FindFirstChild(currentSkin)
						if skinData then
							for _, targetPart in next, clone:GetDescendants() do
								if targetPart:IsA("BasePart") or targetPart:IsA("MeshPart") then
									local tex = nil
									local wm = skinData:FindFirstChild("WorldModel")
									for _, Data in next, skinData:GetDescendants() do
										if wm and Data:IsDescendantOf(wm) then continue end
										local cleanDataName = Data.Name:gsub("^#%s*", "")
										if cleanDataName == targetPart.Name or string.match(cleanDataName, "^" .. targetPart.Name .. "%d*$") or (targetPart.Name == "Main" and (cleanDataName == "Part1" or cleanDataName == "Part")) then
											if Data:IsA("StringValue") then tex = Data.Value
											elseif Data:IsA("MeshPart") then tex = Data.TextureID
											elseif Data:IsA("Decal") or Data:IsA("Texture") then tex = Data.Texture
											elseif Data:IsA("SurfaceAppearance") then tex = Data end
											if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
										end
									end
									if not tex or tex == "" then
										for _, Data in next, skinData:GetDescendants() do
											if wm and Data:IsDescendantOf(wm) then continue end
											local cleanDataName = Data.Name:gsub("^#%s*", "")
											if cleanDataName == "Handle" and (targetPart.Name == "Blade" or targetPart.Name == "Main") then
												if Data:IsA("StringValue") then tex = Data.Value
												elseif Data:IsA("MeshPart") then tex = Data.TextureID
												elseif Data:IsA("Decal") or Data:IsA("Texture") then tex = Data.Texture
												elseif Data:IsA("SurfaceAppearance") then tex = Data end
												if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
											end
										end
									end
									if not tex or tex == "" then
										if wm then
											for _, Data in next, wm:GetDescendants() do
												local cleanDataName = Data.Name:gsub("^#%s*", "")
												if cleanDataName == targetPart.Name or string.match(cleanDataName, "^" .. targetPart.Name .. "%d*$") or (targetPart.Name == "Main" and (cleanDataName == "Part1" or cleanDataName == "Part")) then
													if Data:IsA("StringValue") then tex = Data.Value
													elseif Data:IsA("MeshPart") then tex = Data.TextureID
													elseif Data:IsA("Decal") or Data:IsA("Texture") then tex = Data.Texture
													elseif Data:IsA("SurfaceAppearance") then tex = Data end
													if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
												end
											end
										end
									end
									if not tex or tex == "" then
										if wm then
											for _, Data in next, wm:GetDescendants() do
												local cleanDataName = Data.Name:gsub("^#%s*", "")
												if cleanDataName == "Handle" and (targetPart.Name == "Blade" or targetPart.Name == "Main") then
													if Data:IsA("StringValue") then tex = Data.Value
													elseif Data:IsA("MeshPart") then tex = Data.TextureID
													elseif Data:IsA("Decal") or Data:IsA("Texture") then tex = Data.Texture
													elseif Data:IsA("SurfaceAppearance") then tex = Data end
													if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
												end
											end
										end
									end
									if tex and targetPart.Transparency ~= 1 then
										if typeof(tex) == "Instance" and tex:IsA("SurfaceAppearance") then
											if targetPart:FindFirstChildWhichIsA("SurfaceAppearance") then
												targetPart:FindFirstChildWhichIsA("SurfaceAppearance"):Destroy()
											end
											local saClone = tex:Clone()
											saClone.Parent = targetPart
										elseif targetPart:IsA("MeshPart") then
											targetPart.TextureID = tex
										elseif targetPart:FindFirstChild("Mesh") then
											targetPart.Mesh.TextureId = tex
										else
											pcall(function() targetPart.TextureID = tex end)
										end
									end
								end
							end
						end
					end
					local minV = Vector3.new(math.huge, math.huge, math.huge)
					local maxV = Vector3.new(-math.huge, -math.huge, -math.huge)
					local hasVisible = false
					for _, d in clone:GetDescendants() do
						if d:IsA("BasePart") and d.Transparency < 1 then
							hasVisible = true
							local p = d.Position
							local s = d.Size / 2
							minV = Vector3.new(math.min(minV.X, p.X - s.X), math.min(minV.Y, p.Y - s.Y), math.min(minV.Z, p.Z - s.Z))
							maxV = Vector3.new(math.max(maxV.X, p.X + s.X), math.max(maxV.Y, p.Y + s.Y), math.max(maxV.Z, p.Z + s.Z))
						end
					end
					if not hasVisible then minV = Vector3.new(); maxV = Vector3.new(1,1,1) end
					local center = (minV + maxV) / 2
					local size = (maxV - minV).Magnitude
					local preRot = CFrame.new()
					local isKnife = false
					for _, k in AllKnives do
						if k == currentWeapon then isKnife = true break end
					end
					if isKnife or isExtModel then
						local corePart = nil
						for _, d in clone:GetDescendants() do
							if d:IsA("BasePart") and d.Transparency < 1 then
								if d.Name:lower() == "handle" or d.Name:lower() == "main" or d.Name:lower() == "blade" then
									corePart = d
									break
								end
							end
						end
						if not corePart then
							for _, d in clone:GetDescendants() do
								if d:IsA("BasePart") and d.Transparency < 1 then
									corePart = d
									break
								end
							end
						end
						if corePart then
							local coreRotInv = (corePart.CFrame - corePart.Position):Inverse()
							local bMin = Vector3.new(math.huge, math.huge, math.huge)
							local bMax = Vector3.new(-math.huge, -math.huge, -math.huge)
							for _, d in clone:GetDescendants() do
								if d:IsA("BasePart") and d.Transparency < 1 then
									local relCFrame = coreRotInv * (d.CFrame - corePart.Position)
									for x = -1, 1, 2 do
										for y = -1, 1, 2 do
											for z = -1, 1, 2 do
												local corner = relCFrame * (d.Size * Vector3.new(x, y, z) / 2)
												bMin = Vector3.new(math.min(bMin.X, corner.X), math.min(bMin.Y, corner.Y), math.min(bMin.Z, corner.Z))
												bMax = Vector3.new(math.max(bMax.X, corner.X), math.max(bMax.Y, corner.Y), math.max(bMax.Z, corner.Z))
											end
										end
									end
								end
							end
							local sz = bMax - bMin
							local localCenter = (bMin + bMax) / 2
							local addedRot = CFrame.new()
							if sz.Y > sz.X and sz.Y > sz.Z then
								addedRot = CFrame.Angles(0, 0, math.rad(90))
							elseif sz.Z > sz.X and sz.Z > sz.Y then
								addedRot = CFrame.Angles(0, math.rad(90), 0)
							end
							preRot = addedRot * coreRotInv
							center = corePart.Position + (corePart.CFrame - corePart.Position) * localCenter
							size = sz.Magnitude
						end
					end
					for _, d in clone:GetDescendants() do
						if d:IsA("BasePart") then
							local offset = d.Position - center
							d.CFrame = CFrame.new(preRot * offset) * (preRot * (d.CFrame - d.CFrame.Position))
						end
					end
					skinDist = isKnife and math.clamp(size * 1.1, 1, 15) or math.clamp(size * 0.8, 1, 15)
					clone.Parent = skinModel
					skinRotY = -90
					skinRotX = 0
					updateSkinCam()
				end)
			end
			loadGlovePreview = function()
				gloveModel:ClearAllChildren()
				local gloveType = library_flags["skinGloveModel"] or "None"
				local gloveSkin = library_flags["skinGloveSkin"] or "Default"
				local Gloves = game:GetService("ReplicatedStorage"):FindFirstChild("Gloves")
				local GloveModels = Gloves and Gloves:FindFirstChild("Models")
				if gloveType == "None" or not GloveModels or not GloveModels:FindFirstChild(gloveType) then
					gloveDist = 5
					updateGloveCam()
					return
				end
				local gloveTexData = nil
				local _gloveTex = ""
				if gloveSkin ~= "Default" then
					gloveTexData = Gloves:FindFirstChild(gloveType) and Gloves[gloveType]:FindFirstChild(gloveSkin)
				end
				if gloveTexData and gloveTexData:FindFirstChild("Textures") then
					_gloveTex = gloveTexData.Textures.TextureId or ""
				elseif gloveTexData then
					for _, texData in gloveTexData:GetChildren() do
						if texData:IsA("StringValue") then _gloveTex = texData.Value break
						elseif texData:IsA("MeshPart") then _gloveTex = texData.TextureID break end
					end
				end
				local newLG = GloveModels[gloveType]:FindFirstChild("LGlove")
				if newLG then
					newLG = newLG:Clone()
					if newLG:FindFirstChild("Mesh") then 
						newLG.Mesh.TextureId = _gloveTex 
					else 
						pcall(function() newLG.TextureID = _gloveTex end) 
					end
					newLG.CFrame = CFrame.new(-0.8, 0, 0)
					newLG.Anchored = true
					newLG.CanCollide = false
					newLG.Transparency = 0
					newLG.Parent = gloveModel
				end
				local newRG = GloveModels[gloveType]:FindFirstChild("RGlove")
				if newRG then
					newRG = newRG:Clone()
					if newRG:FindFirstChild("Mesh") then 
						newRG.Mesh.TextureId = _gloveTex 
					else 
						pcall(function() newRG.TextureID = _gloveTex end) 
					end
					newRG.CFrame = CFrame.new(0.8, 0, 0)
					newRG.Anchored = true
					newRG.CanCollide = false
					newRG.Transparency = 0
					newRG.Parent = gloveModel
				end
				gloveDist = 4.5
				updateGloveCam()
			end
			loadSleevePreview = function()
				sleeveModel:ClearAllChildren()
				local found = false
				local function placeSleeveClone(src, sideHint)
					local clone = src:Clone()
					for _, d in clone:GetDescendants() do
						if d:IsA("BaseScript") or d:IsA("Script") or d:IsA("LocalScript") then
							d:Destroy()
						elseif d:IsA("Weld") or d:IsA("WeldConstraint") or d:IsA("Motor6D") or d:IsA("JointInstance") then
							d:Destroy()
						end
					end
					clone.Anchored = true
					clone.CanCollide = false
					clone.Transparency = 0
					local sidePath = sideHint or string.lower((src.Parent and src.Parent.Name or "") .. " " .. src.Name)
					if string.find(sidePath, "left") or string.find(sidePath, "larm") or string.find(sidePath, "l_") or sidePath == "l" then
						clone.CFrame = CFrame.new(-0.75, 0, 0)
					else
						clone.CFrame = CFrame.new(0.75, 0, 0)
					end
					clone.Parent = sleeveModel
					return clone
				end
				local team = "T"
				pcall(function()
					if L_32_ and L_32_:FindFirstChild("Status") and L_32_.Status:FindFirstChild("Team") then
						team = L_32_.Status.Team.Value
					end
				end)
				local selected = (team == "CT") and library_flags["skinSleeveCT"] or library_flags["skinSleeveT"]
				local templates = getgenv().CW_SleeveTemplates
				if selected and templates and templates[selected] then
					local tmpl = templates[selected]
					if tmpl.R then placeSleeveClone(tmpl.R, "r"); found = true end
					if tmpl.L then placeSleeveClone(tmpl.L, "l"); found = true end
				end
				if not found then
					local arms = workspace.CurrentCamera and workspace.CurrentCamera:FindFirstChild("Arms")
					if arms then
						pcall(function()
							for _, src in arms:GetDescendants() do
								if string.find(string.lower(src.Name), "sleeve") and src:IsA("BasePart") then
									placeSleeveClone(src)
									found = true
								end
							end
						end)
					end
				end
				if not found then
					for _, data in {{"LPreviewSleeve", -0.75}, {"RPreviewSleeve", 0.75}} do
						local p = Instance.new("Part")
						p.Name = data[1]
						p.Size = Vector3.new(0.45, 1.4, 0.45)
						p.CFrame = CFrame.new(data[2], 0, 0)
						p.Color = Color3.fromRGB(35, 35, 35)
						p.Material = Enum.Material.SmoothPlastic
						p.Anchored = true
						p.CanCollide = false
						p.Parent = sleeveModel
					end
				end
				sleeveDist = 4.5
				updateSleeveCam()
			end
			local applyFrame = Instance.new("Frame", pageFrame)
			applyFrame.Size = UDim2.new(0.95, 0, 0, 26)
			applyFrame.BackgroundTransparency = 1
			applyFrame.LayoutOrder = 5
			local applyWepBtn = Instance.new("TextButton", applyFrame)
			applyWepBtn.Size = UDim2.new(0.31, 0, 1, 0)
			applyWepBtn.Position = UDim2.new(0, 0, 0, 0)
			applyWepBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			applyWepBtn.Text = "apply weapon"
			applyWepBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
			applyWepBtn.Font = Enum.Font.GothamBold
			applyWepBtn.TextSize = 11
			Instance.new("UICorner", applyWepBtn).CornerRadius = UDim.new(0, 4)
			Instance.new("UIStroke", applyWepBtn).Color = Color3.fromRGB(35, 35, 35)
			local applyGlvBtn = Instance.new("TextButton", applyFrame)
			applyGlvBtn.Size = UDim2.new(0.31, 0, 1, 0)
			applyGlvBtn.Position = UDim2.new(0.345, 0, 0, 0)
			applyGlvBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			applyGlvBtn.Text = "apply gloves"
			applyGlvBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
			applyGlvBtn.Font = Enum.Font.GothamBold
			applyGlvBtn.TextSize = 11
			Instance.new("UICorner", applyGlvBtn).CornerRadius = UDim.new(0, 4)
			Instance.new("UIStroke", applyGlvBtn).Color = Color3.fromRGB(35, 35, 35)
			local applySleeveBtn = Instance.new("TextButton", applyFrame)
			applySleeveBtn.Size = UDim2.new(0.31, 0, 1, 0)
			applySleeveBtn.Position = UDim2.new(0.69, 0, 0, 0)
			applySleeveBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			applySleeveBtn.Text = "apply sleeves"
			applySleeveBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
			applySleeveBtn.Font = Enum.Font.GothamBold
			applySleeveBtn.TextSize = 11
			Instance.new("UICorner", applySleeveBtn).CornerRadius = UDim.new(0, 4)
			Instance.new("UIStroke", applySleeveBtn).Color = Color3.fromRGB(35, 35, 35)
			applyWepBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do dl.Visible = false end
				local flagName = getFlagName(currentWeapon)
				library_flags[flagName] = currentSkin
				if L_5_ and L_5_.options and L_5_.options[flagName] then
					pcall(function() L_5_.options[flagName]:SetValue(currentSkin) end)
				end
				library_flags["skinSkinChanger"] = true
				library_flags["skinKnifeChanger"] = true
				if L_5_ and L_5_.options then
					pcall(function() L_5_.options["skinSkinChanger"]:SetValue(true) end)
					pcall(function() L_5_.options["skinKnifeChanger"]:SetValue(true) end)
				end
				local isKnife = false
				for _, k in AllKnives do
					if k == currentWeapon then isKnife = true break end
				end
				if isKnife then
					library_flags["skinKnifeModel"] = currentWeapon
					if L_5_ and L_5_.options and L_5_.options["skinKnifeModel"] then
						pcall(function() L_5_.options["skinKnifeModel"]:SetValue(currentWeapon) end)
					end
				end
				pcall(function()
					local arms = workspace.CurrentCamera:FindFirstChild("Arms")
					if arms then arms:Destroy() end
				end)
				applyWepBtn.Text = "applied!"
				task.delay(1, function() applyWepBtn.Text = "apply weapon" end)
			end)
			applyGlvBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do dl.Visible = false end
				local gType = library_flags["skinGloveModel"] or "None"
				local gSkin = library_flags["skinGloveSkin"] or "Default"
				library_flags["skinGloveChanger"] = true
				if L_5_ and L_5_.options then
					pcall(function() L_5_.options["skinGloveChanger"]:SetValue(true) end)
				end
				getgenv().lastGlove = gType
				getgenv().lastGloveSkin = gSkin
				applyGlvBtn.Text = "applied!"
				task.delay(1, function() applyGlvBtn.Text = "apply gloves" end)
			end)
			applySleeveBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do dl.Visible = false end
				library_flags["skinSleeveChanger"] = true
				library_flags["__skinSleeveAppliedCT"] = library_flags["skinSleeveCT"] or "Default"
				library_flags["__skinSleeveAppliedT"] = library_flags["skinSleeveT"] or "Default"
				if L_5_ and L_5_.options then
					pcall(function()
						if L_5_.options["skinSleeveChanger"] then L_5_.options["skinSleeveChanger"]:SetValue(true) end
					end)
				end
				pcall(function()
					local arms = workspace.CurrentCamera and workspace.CurrentCamera:FindFirstChild("Arms")
					if arms then
						for _, m in arms:GetDescendants() do
							if m.Name == "CW_OriginalSleeves" then m:Destroy() end
						end
					end
				end)
				local applied = false
				pcall(function()
					if getgenv().CW_ApplySleeveChangerToCurrent then
						getgenv().CW_ApplySleeveChangerToCurrent()
						applied = true
					end
				end)
				loadSleevePreview()
				applySleeveBtn.Text = applied and "applied!" or "no arms"
				task.delay(1, function() applySleeveBtn.Text = "apply sleeves" end)
			end)
			local padder = Instance.new("Frame", pageFrame)
			padder.Size = UDim2.new(0.95, 0, 0, 15)
			padder.BackgroundTransparency = 1
			padder.LayoutOrder = 99
			library_flags["skinWeapon"] = currentWeapon
			library_flags["skinSkin"] = currentSkin
			pcall(function()
				if L_5_ and L_5_.options then
					L_5_.options["skinWeapon"] = {
						hasInit = true, type = "string", flag = "skinWeapon", value = library_flags["skinWeapon"],
						SetValue = function(self, val)
							if not val or val == "" then return end
							self.value = val; library_flags["skinWeapon"] = val; currentWeapon = val; wepBtn.Text = val
							if not loadingCFG then task.defer(loadWeaponPreview) end
						end
					}
					L_5_.options["skinSkin"] = {
						hasInit = true, type = "string", flag = "skinSkin", value = library_flags["skinSkin"],
						SetValue = function(self, val)
							if not val or val == "" then return end
							self.value = val; library_flags["skinSkin"] = val; currentSkin = val; skinBtn.Text = val;
							rebuildSkinDrop()
							if not loadingCFG then task.defer(loadWeaponPreview) end
						end
					}
					L_5_.options["skinGloveModel"] = {
						hasInit = true, type = "string", flag = "skinGloveModel", value = library_flags["skinGloveModel"],
						SetValue = function(self, val)
							if not val or val == "" then return end
							self.value = val; library_flags["skinGloveModel"] = val; 
							if gloveTypeBtn then gloveTypeBtn.Text = val end
							if not loadingCFG then task.defer(loadGlovePreview) end
						end
					}
					L_5_.options["skinGloveSkin"] = {
						hasInit = true, type = "string", flag = "skinGloveSkin", value = library_flags["skinGloveSkin"],
						SetValue = function(self, val)
							if not val or val == "" then return end
							self.value = val; library_flags["skinGloveSkin"] = val; 
							if gloveBtn then gloveBtn.Text = val end
							if not loadingCFG then task.defer(loadGlovePreview) end
						end
					}
					L_5_.options["skinSleeveCT"] = {
						hasInit = true, type = "string", flag = "skinSleeveCT", value = library_flags["skinSleeveCT"],
						SetValue = function(self, val)
							if not val or val == "" then return end
							self.value = val; library_flags["skinSleeveCT"] = val
							if ctSleeveBtn then ctSleeveBtn.Text = val end
							if not loadingCFG then task.defer(loadSleevePreview) end
						end
					}
					L_5_.options["skinSleeveT"] = {
						hasInit = true, type = "string", flag = "skinSleeveT", value = library_flags["skinSleeveT"],
						SetValue = function(self, val)
							if not val or val == "" then return end
							self.value = val; library_flags["skinSleeveT"] = val
							if tSleeveBtn then tSleeveBtn.Text = val end
							if not loadingCFG then task.defer(loadSleevePreview) end
						end
					}
				end
			end)
			rebuildSkinDrop()
			task.defer(function()
				loadWeaponPreview()
				loadGlovePreview()
				loadSleevePreview()
			end)
			getgenv().UpdateSkinUI = function()
				loadWeaponPreview()
				loadGlovePreview()
				loadSleevePreview()
			end
			getgenv().CW_SkinsPageFrame = pageFrame
			env.UpdateSkinUI = function()
				loadWeaponPreview()
				loadGlovePreview()
				loadSleevePreview()
			end
			env.SkinsPageFrame = pageFrame
		else

		local isWide = (tostring(tab.title):lower() == "players" or tostring(tab.title):lower() == "lua")
		local leftCol = Instance.new("Frame", pageFrame)
		leftCol.Size = isWide and UDim2.new(0.98, 0, 0, 0) or UDim2.new(0.49, 0, 0, 0)
		leftCol.AutomaticSize = Enum.AutomaticSize.Y
		leftCol.BackgroundTransparency = 1
		local leftList = Instance.new("UIListLayout", leftCol)
		leftList.Padding = UDim.new(0, 10)
		local rightCol = Instance.new("Frame", pageFrame)
		rightCol.Size = UDim2.new(0.49, 0, 0, 0)
		rightCol.Position = UDim2.new(0.51, 0, 0, 0)
		rightCol.AutomaticSize = Enum.AutomaticSize.Y
		rightCol.BackgroundTransparency = 1
		rightCol.Visible = not isWide
		local rightList = Instance.new("UIListLayout", rightCol)
		rightList.Padding = UDim.new(0, 10)
		local function updateCanvas()
			local leftH = leftList.AbsoluteContentSize.Y
			local rightH = rightList.AbsoluteContentSize.Y
			pageFrame.CanvasSize = UDim2.new(0, 0, 0, math.max(leftH, rightH) + 30)
		end
		leftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
		rightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)
		local allColumns = {}
		if #tab.subtabs > 0 then
			for _, sub in tab.subtabs do
				for _, col in sub.columns or {} do
					table.insert(allColumns, {col = col, sub = sub})
				end
			end
		else
			for _, col in tab.columns or {} do
				table.insert(allColumns, {col = col, sub = nil})
			end
		end
		for _, data in allColumns do
			local col = data.col
			local sub = data.sub
			local targetCol = (col.position == 1 or col.position == "1") and rightCol or leftCol
			for _, sec in col.sections or {} do
				local secFrame = Instance.new("Frame", targetCol)
				secFrame.Size = UDim2.new(1, 0, 0, 0)
				secFrame.AutomaticSize = Enum.AutomaticSize.Y
				secFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
				secFrame.BorderSizePixel = 0
				Instance.new("UICorner", secFrame).CornerRadius = UDim.new(0, 3)
				sec.main = secFrame
				if #tab.subtabs > 0 then
					table.insert(secFramesToToggle, {frame = secFrame, sub = sub})
					secFrame.Visible = (sub == tab.subtabs[1])
				end
				if tab.title == "Legit" and (sec.title == "Scout" or sec.title == "AWP" or sec.title == "Heavy Pistols" or sec.title == "Pistols" or sec.title == "SMG" or sec.title == "Other") then
					secFrame.Visible = false
				end
				local stroke = Instance.new("UIStroke", secFrame)
				stroke.Color = Color3.fromRGB(38, 38, 38)
				stroke.Thickness = 1
				stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				local secList = Instance.new("UIListLayout", secFrame)
				secList.Padding = UDim.new(0, 4)
				secList.HorizontalAlignment = Enum.HorizontalAlignment.Center
				secList.SortOrder = Enum.SortOrder.LayoutOrder
				local secPad = Instance.new("UIPadding", secFrame)
				secPad.PaddingTop = UDim.new(0, 0)
				secPad.PaddingBottom = UDim.new(0, 8)
				local secHeaderBar = Instance.new("Frame", secFrame)
				secHeaderBar.Size = UDim2.new(1, 0, 0, 26)
				secHeaderBar.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
				secHeaderBar.BorderSizePixel = 0
				secHeaderBar.LayoutOrder = 0
				Instance.new("UICorner", secHeaderBar).CornerRadius = UDim.new(0, 3)
				local headerMask = Instance.new("Frame", secHeaderBar)
				headerMask.Size = UDim2.new(1, 0, 0.5, 0)
				headerMask.Position = UDim2.new(0, 0, 0.5, 0)
				headerMask.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
				headerMask.BorderSizePixel = 0
				headerMask.ZIndex = secHeaderBar.ZIndex
				local secHeader = Instance.new("TextLabel", secHeaderBar)
				secHeader.Size = UDim2.new(1, -20, 1, 0)
				secHeader.Position = UDim2.new(0, 12, 0, 0)
				secHeader.BackgroundTransparency = 1
				secHeader.Text = tostring(sec.title or "unnamed"):lower()
				secHeader.TextColor3 = Color3.fromRGB(235, 235, 235)
				secHeader.Font = Enum.Font.GothamBold
				secHeader.TextSize = 13
				secHeader.TextXAlignment = Enum.TextXAlignment.Left
				secHeader.ZIndex = secHeaderBar.ZIndex + 1
				local headerLine = Instance.new("Frame", secFrame)
				headerLine.Size = UDim2.new(1, 0, 0, 1)
				headerLine.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				headerLine.BorderSizePixel = 0
				headerLine.LayoutOrder = 0
				local totalHeight = 27
				local boundBinds = {}
				for _, opt in sec.options or {} do
					local optFrame = Instance.new("Frame", secFrame)
					optFrame.Size = UDim2.new(0.9, 0, 0, 22)
					optFrame.BackgroundTransparency = 1
					optFrame.LayoutOrder = _ + 1
					local rawText = opt.text or opt.flag or "unnamed"
					if rawText == "nil" and opt.flag then rawText = opt.flag end
					local optText = tostring(rawText):lower()
					if optText:find("material") then optText = "material" end
					local associatedBind = nil
					local associatedColor = nil
					local associatedColor2 = nil
					if opt.type == "toggle" then
						for b_index = _ + 1, #sec.options do
							local b = sec.options[b_index]
							if b and b.sub then
								if b.type == "bind" or b.type == "keybind" then
									associatedBind = b
								elseif b.type == "color" then
									if not associatedColor then
										associatedColor = b
									else
										associatedColor2 = b
									end
								end
							else
								break
							end
						end
					end
					if opt.type == "toggle" then
						local accent = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 200, 50)
						local check = Instance.new("TextButton", optFrame)
						check.Size = UDim2.new(0, 16, 0, 16)
						check.Position = UDim2.new(0, 0, 0.5, -8)
						check.BackgroundColor3 = opt.state and accent or Color3.fromRGB(20, 20, 20)
						check.Text = opt.state and "✓" or ""
						check.TextColor3 = Color3.fromRGB(255, 255, 255)
						check.TextSize = 13
						check.Font = Enum.Font.GothamBold
						check.AutoButtonColor = false
						Instance.new("UICorner", check).CornerRadius = UDim.new(0, 3)
						local checkStroke = Instance.new("UIStroke", check)
						checkStroke.Color = opt.state and accent or Color3.fromRGB(55, 55, 55)
						checkStroke.Thickness = 1
						checkStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
						local label = Instance.new("TextLabel", optFrame)
						label.Position = UDim2.new(0, 24, 0, 0)
						label.Size = UDim2.new(1, -24, 1, 0)
						label.BackgroundTransparency = 1
						label.Text = optText
						label.TextColor3 = opt.state and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(160, 160, 160)
						label.Font = Enum.Font.Gotham
						label.TextSize = 13
						label.TextXAlignment = Enum.TextXAlignment.Left
						check.MouseButton1Click:Connect(function()
							opt.state = not opt.state
							check.BackgroundColor3 = opt.state and accent or Color3.fromRGB(20, 20, 20)
							check.Text = opt.state and "✓" or ""
							checkStroke.Color = opt.state and accent or Color3.fromRGB(55, 55, 55)
							label.TextColor3 = opt.state and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(160, 160, 160)
							library_flags[opt.flag] = opt.state
							pcall(opt.callback, opt.state)
						end)
						function opt:SetState(val)
							opt.state = val
							library_flags[opt.flag] = val
							if check then
								check.BackgroundColor3 = val and accent or Color3.fromRGB(20, 20, 20)
								check.Text = val and "✓" or ""
								checkStroke.Color = val and accent or Color3.fromRGB(55, 55, 55)
								label.TextColor3 = val and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(160, 160, 160)
							end
							pcall(opt.callback, val)
						end
						opt.hasInit = true
						if associatedBind then
							local bindBtn = Instance.new("TextButton", optFrame)
							bindBtn.Size = UDim2.new(0, 45, 0, 16)
							bindBtn.Position = UDim2.new(1, -50, 0.5, -8)
							bindBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
							bindBtn.Text = shortenBindName(associatedBind.key or "none")
							bindBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
							bindBtn.Font = Enum.Font.SourceSans
							bindBtn.TextSize = 11
							Instance.new("UICorner", bindBtn).CornerRadius = UDim.new(0, 3)
							local listening = false
							bindBtn.MouseButton1Click:Connect(function()
								listening = not listening
								bindBtn.Text = listening and "..." or shortenBindName(associatedBind.key or "none")
							end)
							function associatedBind:SetKey(val)
								associatedBind.key = shortenBindName(val or associatedBind.key or "none")
								library_flags[associatedBind.flag] = associatedBind.key
								if bindBtn then bindBtn.Text = shortenBindName(associatedBind.key) end
							end
							game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
								if listening and not processed then
									local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
									if kName then
										associatedBind.key = kName
										bindBtn.Text = kName
										listening = false
									end
								end
							end)
							local runConnection = nil
							game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
								if processed or associatedBind.key == "none" then return end
								local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
								if kName == associatedBind.key then
									if associatedBind.mode == "toggle" then
										library_flags[associatedBind.flag] = not library_flags[associatedBind.flag]
										pcall(associatedBind.callback, library_flags[associatedBind.flag], 0)
									else
										library_flags[associatedBind.flag] = true
										if runConnection then runConnection:Disconnect() end
										pcall(associatedBind.callback, true, 0)
										runConnection = game:GetService("RunService").RenderStepped:Connect(function(dt)
											pcall(associatedBind.callback, nil, dt)
										end)
									end
								end
							end)
							game:GetService("UserInputService").InputEnded:Connect(function(input)
								if associatedBind.key == "none" then return end
								local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
								if kName == associatedBind.key then
									if associatedBind.mode == "hold" then
										if runConnection then runConnection:Disconnect(); runConnection = nil end
										pcall(associatedBind.callback, true, 0)
									end
								end
							end)
						end
						if associatedColor then
							local offset1 = associatedBind and -72 or -18
							local colorBtn1 = Instance.new("TextButton", optFrame)
							colorBtn1.Size = UDim2.new(0, 14, 0, 14)
							colorBtn1.Position = UDim2.new(1, offset1, 0.5, -7)
							colorBtn1.BackgroundColor3 = associatedColor.color or Color3.fromRGB(255, 255, 255)
							colorBtn1.Text = ""
							Instance.new("UICorner", colorBtn1).CornerRadius = UDim.new(0, 3)
							colorBtn1.MouseButton1Click:Connect(function()
								if openColorPicker then
									openColorPicker(associatedColor, colorBtn1)
								end
							end)
							function associatedColor:SetColor(clr)
								if typeof(clr) == "table" and clr[1] then
									clr = Color3.new(clr[1], clr[2], clr[3])
								end
								associatedColor.color = clr
								colorBtn1.BackgroundColor3 = clr
								library_flags[associatedColor.flag] = clr
								pcall(associatedColor.callback, clr)
							end
						end
						if associatedColor2 then
							local offset2 = associatedBind and -90 or -36
							local colorBtn2 = Instance.new("TextButton", optFrame)
							colorBtn2.Size = UDim2.new(0, 14, 0, 14)
							colorBtn2.Position = UDim2.new(1, offset2, 0.5, -7)
							colorBtn2.BackgroundColor3 = associatedColor2.color or Color3.fromRGB(255, 255, 255)
							colorBtn2.Text = ""
							Instance.new("UICorner", colorBtn2).CornerRadius = UDim.new(0, 3)
							colorBtn2.MouseButton1Click:Connect(function()
								if openColorPicker then
									openColorPicker(associatedColor2, colorBtn2)
								end
							end)
							function associatedColor2:SetColor(clr)
								if typeof(clr) == "table" and clr[1] then
									clr = Color3.new(clr[1], clr[2], clr[3])
								end
								associatedColor2.color = clr
								colorBtn2.BackgroundColor3 = clr
								library_flags[associatedColor2.flag] = clr
								pcall(associatedColor2.callback, clr)
							end
						end
					elseif opt.type == "slider" then
						local accent = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 200, 50)
						local label = Instance.new("TextLabel", optFrame)
						label.Size = UDim2.new(0.55, 0, 1, 0)
						label.BackgroundTransparency = 1
						label.Text = optText
						label.TextColor3 = Color3.fromRGB(170, 170, 170)
						label.Font = Enum.Font.Gotham
						label.TextSize = 12
						label.TextXAlignment = Enum.TextXAlignment.Left
						local valLabel = Instance.new("TextLabel", optFrame)
						valLabel.Size = UDim2.new(0, 26, 1, 0)
						valLabel.Position = UDim2.new(0.55, 0, 0, 0)
						valLabel.BackgroundTransparency = 1
						valLabel.Text = tostring(opt.value or opt.state or 0)
						valLabel.TextColor3 = accent
						valLabel.Font = Enum.Font.GothamBold
						valLabel.TextSize = 12
						valLabel.TextXAlignment = Enum.TextXAlignment.Left
						local bar = Instance.new("TextButton", optFrame)
						bar.Size = UDim2.new(0.35, 0, 0, 4)
						bar.Position = UDim2.new(0.65, 0, 0.5, -2)
						bar.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
						bar.BorderSizePixel = 0
						bar.Text = ""
						bar.Active = true
						bar.AutoButtonColor = false
						Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
						local fill = Instance.new("Frame", bar)
						local fillPercent = math.clamp((tonumber(opt.value or opt.state or 0) - (opt.min or 0)) / ((opt.max or 100) - (opt.min or 0)), 0, 1)
						fill.Size = UDim2.new(fillPercent, 0, 1, 0)
						fill.BackgroundColor3 = accent
						fill.BorderSizePixel = 0
						Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)
						local dragging = false
						local function updateSlider(input)
							local percent = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
							local min = opt.min or 0
							local max = opt.max or 100
							local val = math.floor(min + (max - min) * percent)
							opt.value = val
							valLabel.Text = tostring(val)
							fill.Size = UDim2.new(percent, 0, 1, 0)
							library_flags[opt.flag] = val
							pcall(opt.callback, val)
						end
						function opt:SetValue(val)
							if val == nil then return end
							opt.value = val
							library_flags[opt.flag] = val
							if valLabel then valLabel.Text = tostring(val) end
							local percent = math.clamp((val - (opt.min or 0)) / ((opt.max or 100) - (opt.min or 0)), 0, 1)
							if fill then fill.Size = UDim2.new(percent, 0, 1, 0) end
							pcall(opt.callback, val)
						end
						opt.SetState = opt.SetValue
						opt.hasInit = true
						bar.InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then
								dragging = true; updateSlider(input)
							end
						end)
						game:GetService("UserInputService").InputChanged:Connect(function(input)
							if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
								updateSlider(input)
							end
						end)
						game:GetService("UserInputService").InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
						end)
					elseif opt.type == "dropdown" or opt.type == "list" then
						optFrame.Size = UDim2.new(0.9, 0, 0, 42)
						local label = Instance.new("TextLabel", optFrame)
						label.Size = UDim2.new(1, 0, 0, 16)
						label.Position = UDim2.new(0, 0, 0, 0)
						label.BackgroundTransparency = 1
						label.Text = optText
						label.TextColor3 = Color3.fromRGB(170, 170, 170)
						label.Font = Enum.Font.Gotham
						label.TextSize = 12
						label.TextXAlignment = Enum.TextXAlignment.Left
						local dropBtn = Instance.new("TextButton", optFrame)
						dropBtn.Size = UDim2.new(1, 0, 0, 22)
						dropBtn.Position = UDim2.new(0, 0, 0, 18)
						dropBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
						local _initText
						if opt.multiselect or type(opt.value) == "table" then
							local _names = {}
							if type(opt.value) == "table" then
								for k, v in opt.value do if v then _names[#_names+1] = k end end
							end
							_initText = #_names > 0 and table.concat(_names, ", ") or "none"
						else
							_initText = tostring(opt.value or opt.state or "none")
						end
						dropBtn.Text = "  " .. _initText
						dropBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
						dropBtn.Font = Enum.Font.Gotham
						dropBtn.TextSize = 12
						dropBtn.TextXAlignment = Enum.TextXAlignment.Left
						dropBtn.AutoButtonColor = false
						Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 3)
						local stroke = Instance.new("UIStroke", dropBtn)
						stroke.Color = Color3.fromRGB(45, 45, 45)
						stroke.Thickness = 1
						local dropArrow = Instance.new("TextLabel", dropBtn)
						dropArrow.Size = UDim2.new(0, 16, 1, 0)
						dropArrow.Position = UDim2.new(1, -18, 0, 0)
						dropArrow.BackgroundTransparency = 1
						dropArrow.Text = "▾"
						dropArrow.TextColor3 = Color3.fromRGB(160, 160, 160)
						dropArrow.Font = Enum.Font.GothamBold
						dropArrow.TextSize = 12
						local dropList = Instance.new("ScrollingFrame")
						dropList.Size = UDim2.new(0, 120, 0, 0)
						dropList.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
						dropList.BorderSizePixel = 0
						dropList.ZIndex = 100
						dropList.Visible = false
						dropList.ScrollBarThickness = 1
						Instance.new("UICorner", dropList).CornerRadius = UDim.new(0, 4)
						local listLayout = Instance.new("UIListLayout", dropList)
						dropList.Parent = self.base
						table.insert(floatingDropdowns, dropList)
						opt.labels = opt.labels or {}
						opt.open = false
						opt.dropList = dropList
						opt.dropBtn = dropBtn
						opt.listLayout = listLayout
						function opt:SetValue(val)
							if val == nil then return end
							if opt.multiselect then
								if type(val) == "table" then
									opt.value = val
								else
									if type(opt.value) ~= "table" then opt.value = {} end
									opt.value[val] = not opt.value[val]
								end
								library_flags[opt.flag] = opt.value
								local names = {}
								for k, v in opt.value do if v then names[#names+1] = k end end
								if dropBtn then dropBtn.Text = "  " .. (#names > 0 and table.concat(names, ", ") or "none") end
								for lv, litem in opt.labels do
									litem.TextColor3 = (opt.value[lv]) and Color3.fromRGB(255,255,255) or Color3.fromRGB(190,190,190)
								end
								pcall(opt.callback, opt.value)
								return
							end
							opt.value = val
							library_flags[opt.flag] = val
							if dropBtn then dropBtn.Text = "  " .. tostring(val) end
							pcall(opt.callback, val)
						end
						opt.SetState = opt.SetValue
						opt.hasInit = true
						local function createDropItem(val)
							local item = Instance.new("TextButton", dropList)
							item.Size = UDim2.new(1, 0, 0, 18)
							item.BackgroundTransparency = 1
							item.Text = "  " .. tostring(val)
							item.TextColor3 = Color3.fromRGB(190, 190, 190)
							item.Font = Enum.Font.Gotham
							item.TextSize = 12
							item.TextXAlignment = Enum.TextXAlignment.Left
							item.ZIndex = 101
							item.Name = "item_" .. tostring(val)
							opt.labels[val] = item
							if opt.multiselect and type(opt.value) == "table" and opt.value[val] then
								item.TextColor3 = Color3.fromRGB(255,255,255)
							end
							item.MouseButton1Click:Connect(function()
								if opt.multiselect then
									opt:SetValue(val)
									return
								end
								opt.value = val
								dropBtn.Text = "  " .. tostring(val)
								library_flags[opt.flag] = val
								pcall(opt.callback, val)
								dropList.Visible = false
								opt.open = false
							end)
							return item
						end
						function opt:AddValue(val, _)
							if val == nil or val == "" then return end
							if opt.labels[val] then return end
							if not table.find(opt.values, val) then
								table.insert(opt.values, val)
							end
							createDropItem(val)
						end
						function opt:RemoveValue(val)
							if opt.labels[val] then
								opt.labels[val]:Destroy()
								opt.labels[val] = nil
							end
							local idx = table.find(opt.values, val)
							if idx then table.remove(opt.values, idx) end
							if opt.value == val then
								opt:SetValue(opt.values[1] or "")
							end
						end
						function opt:Close()
							dropList.Visible = false
							opt.open = false
						end
						for _, val in opt.values or {} do
							createDropItem(val)
						end
						local dropPosTrack = nil
						local function updateDropSize()
							local count = #(opt.values or {})
							dropList.Size = UDim2.new(0, dropBtn.AbsoluteSize.X, 0, math.min(count * 18, 250))
							dropList.CanvasSize = UDim2.new(0, 0, 0, count * 18)
						end
						dropBtn.MouseButton1Click:Connect(function()
							if not dropList.Visible then
								for _, dl in floatingDropdowns do dl.Visible = false end
							end
							dropList.Visible = not dropList.Visible
							opt.open = dropList.Visible
							if dropList.Visible then
								dropList.Position = UDim2.new(0, dropBtn.AbsolutePosition.X, 0, dropBtn.AbsolutePosition.Y + 20)
								updateDropSize()
								if dropPosTrack then dropPosTrack:Disconnect() end
								dropPosTrack = game:GetService("RunService").RenderStepped:Connect(function()
									if dropList.Visible then
										dropList.Position = UDim2.new(0, dropBtn.AbsolutePosition.X, 0, dropBtn.AbsolutePosition.Y + 20)
									else
										if dropPosTrack then dropPosTrack:Disconnect() dropPosTrack = nil end
									end
								end)
							else
								if dropPosTrack then dropPosTrack:Disconnect() dropPosTrack = nil end
							end
						end)
					elseif opt.type == "box" then
						local label = Instance.new("TextLabel", optFrame)
						label.Size = UDim2.new(0.4, 0, 1, 0)
						label.BackgroundTransparency = 1
						label.Text = optText
						label.TextColor3 = Color3.fromRGB(180,180,180)
						label.Font = Enum.Font.SourceSans
						label.TextSize = 13
						label.TextXAlignment = Enum.TextXAlignment.Left
						local box = Instance.new("TextBox", optFrame)
						box.Size = UDim2.new(0.5, 0, 0, 18)
						box.Position = UDim2.new(0.5, 0, 0.5, -9)
						box.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
						box.Text = tostring(opt.value or "")
						box.TextColor3 = Color3.fromRGB(200, 200, 200)
						box.PlaceholderText = "..."
						box.Font = Enum.Font.SourceSans
						box.TextSize = 12
						box.ClearTextOnFocus = false
						Instance.new("UICorner", box).CornerRadius = UDim.new(0, 3)
						local stroke = Instance.new("UIStroke", box)
						stroke.Color = Color3.fromRGB(35,35,35)
						box.FocusLost:Connect(function(enterPressed)
							opt.value = box.Text
							library_flags[opt.flag] = box.Text
							pcall(opt.callback, box.Text)
						end)
						function opt:SetValue(val)
							opt.value = val
							library_flags[opt.flag] = val
							if box then box.Text = tostring(val or "") end
						end
						if opt.flag and library_flags[opt.flag] and library_flags[opt.flag] ~= "" then
							box.Text = tostring(library_flags[opt.flag])
							opt.value = library_flags[opt.flag]
						end
					elseif opt.type == "button" then
						local btn = Instance.new("TextButton", optFrame)
						btn.Size = UDim2.new(0.9, 0, 0, 20)
						btn.Position = UDim2.new(0.05, 0, 0.5, -10)
						btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
						btn.Text = optText
						btn.TextColor3 = Color3.fromRGB(220, 220, 220)
						btn.Font = Enum.Font.SourceSansBold
						btn.TextSize = 12
						Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)
						local stroke = Instance.new("UIStroke", btn)
						stroke.Color = Color3.fromRGB(35,35,35)
						btn.MouseButton1Click:Connect(function()
							pcall(opt.callback)
						end)
					elseif opt.type == "keybind" or opt.type == "bind" then
						local isChained = false
						if _ > 1 and sec.options[_ - 1] and sec.options[_ - 1].type == "toggle" then
							isChained = true
						end
						if isChained then
							optFrame.Size = UDim2.new(0, 0, 0, 0)
							optFrame.Visible = false
							totalHeight = totalHeight - 26
						else
							local label = Instance.new("TextLabel", optFrame)
							label.Size = UDim2.new(0.6, 0, 1, 0)
							label.BackgroundTransparency = 1
							label.Text = optText
							label.TextColor3 = Color3.fromRGB(180,180,180)
							label.Font = Enum.Font.SourceSans
							label.TextSize = 13
							label.TextXAlignment = Enum.TextXAlignment.Left
							local bindBtn = Instance.new("TextButton", optFrame)
							bindBtn.Size = UDim2.new(0, 55, 0, 18)
							bindBtn.Position = UDim2.new(1, -60, 0.5, -9)
							bindBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
							bindBtn.Text = shortenBindName(opt.key or opt.state or "none")
							bindBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
							bindBtn.Font = Enum.Font.SourceSans
							bindBtn.TextSize = 12
							Instance.new("UICorner", bindBtn).CornerRadius = UDim.new(0, 3)
							local bSt = Instance.new("UIStroke", bindBtn) bSt.Color = Color3.fromRGB(35,35,35)
							local listening = false
							bindBtn.MouseButton1Click:Connect(function()
								listening = not listening
								bindBtn.Text = listening and "..." or shortenBindName(opt.key or opt.state or "none")
							end)
							game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
								if listening and not processed then
									local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
									if kName then
										opt.key = kName
										opt.state = kName
										bindBtn.Text = kName
										listening = false
										library_flags[opt.flag] = kName
									end
								end
							end)
							local runConnection = nil
							game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
								if processed or opt.key == "none" then return end
								local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
								if kName == opt.key then
									if opt.mode == "toggle" then
										library_flags[opt.flag] = not library_flags[opt.flag]
										pcall(opt.callback, library_flags[opt.flag], 0)
									else
										library_flags[opt.flag] = true
										if runConnection then runConnection:Disconnect() end
										pcall(opt.callback, true, 0)
										runConnection = game:GetService("RunService").RenderStepped:Connect(function(dt)
											pcall(opt.callback, nil, dt)
										end)
									end
								end
							end)
							game:GetService("UserInputService").InputEnded:Connect(function(input)
								if opt.key == "none" then return end
								local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
								if kName == opt.key then
									if opt.mode == "hold" then
										if runConnection then runConnection:Disconnect(); runConnection = nil end
										pcall(opt.callback, true, 0)
									end
								end
							end)
							function opt:SetKey(val)
								val = val or opt.key or "none"
								opt.key = val
								opt.state = val
								library_flags[opt.flag] = val
								if bindBtn then bindBtn.Text = shortenBindName(val) end
							end
							opt.hasInit = true
						end
					elseif opt.type == "color" then
						optFrame.Size = UDim2.new(0, 0, 0, 0)
						optFrame.Visible = false
					elseif opt.type == "player_list" then
						optFrame.Size = UDim2.new(0.98, 0, 0, 290)
						totalHeight = totalHeight + 268
						local listFrame = Instance.new("ScrollingFrame", optFrame)
						listFrame.Size = UDim2.new(1, 0, 0, 160)
						listFrame.Position = UDim2.new(0, 0, 0, 10)
						listFrame.BackgroundTransparency = 1
						listFrame.BorderSizePixel = 0
						listFrame.ScrollBarThickness = 2
						listFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
						local listLayout = Instance.new("UIListLayout", listFrame)
						listLayout.SortOrder = Enum.SortOrder.Name
						local headers = Instance.new("Frame", optFrame)
						headers.Size = UDim2.new(1, 0, 0, 15)
						headers.Position = UDim2.new(0, 0, 0, -8)
						headers.BackgroundTransparency = 1
						local function createH(t, x, s)
							local l = Instance.new("TextLabel", headers)
							l.Size = s; l.Position = x; l.BackgroundTransparency = 1
							l.Text = t; l.TextColor3 = Color3.fromRGB(150, 150, 150)
							l.Font = Enum.Font.SourceSansBold; l.TextSize = 11; l.TextXAlignment = Enum.TextXAlignment.Left
						end
						createH("name", UDim2.new(0, 5, 0, 0), UDim2.new(0.3, 0, 1, 0))
						createH("team", UDim2.new(0.3, 5, 0, 0), UDim2.new(0.45, 0, 1, 0))
						createH("status", UDim2.new(0.75, 5, 0, 0), UDim2.new(0.25, 0, 1, 0))
						local detail = Instance.new("Frame", optFrame)
						detail.Size = UDim2.new(1, 0, 0, 115)
						detail.Position = UDim2.new(0, 0, 0, 175)
						detail.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
						detail.BorderSizePixel = 0
						Instance.new("UICorner", detail).CornerRadius = UDim.new(0, 4)
						local dSt = Instance.new("UIStroke", detail) dSt.Color = Color3.fromRGB(35, 35, 35)
						local avatar = Instance.new("ImageLabel", detail)
						avatar.Size = UDim2.new(0, 65, 0, 65)
						avatar.Position = UDim2.new(0, 10, 0.5, -32)
						avatar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
						avatar.BorderSizePixel = 0
						Instance.new("UIStroke", avatar).Color = Color3.fromRGB(30, 30, 30)
						local selLabel = Instance.new("TextLabel", detail)
						selLabel.Size = UDim2.new(0, 160, 0, 18)
						selLabel.Position = UDim2.new(0, 85, 0, 6)
						selLabel.BackgroundTransparency = 1
						selLabel.Text = "no player selected"
						selLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
						selLabel.Font = Enum.Font.SourceSansBold
						selLabel.TextSize = 14; selLabel.TextXAlignment = Enum.TextXAlignment.Left
						local selInfo = Instance.new("TextLabel", detail)
						selInfo.Size = UDim2.new(0, 200, 0, 60)
						selInfo.Position = UDim2.new(0, 85, 0, 24)
						selInfo.BackgroundTransparency = 1
						selInfo.Text = ""
						selInfo.TextColor3 = Color3.fromRGB(170, 170, 170)
						selInfo.Font = Enum.Font.Code
						selInfo.TextSize = 12
						selInfo.TextXAlignment = Enum.TextXAlignment.Left
						selInfo.TextYAlignment = Enum.TextYAlignment.Top
						local selectedPlayer = nil
						local function updateAvatar()
							if selectedPlayer and selectedPlayer:IsA("Player") then
								local plr = selectedPlayer
								spawn(function()
									if not (plr and plr.Parent and plr:IsA("Player")) then return end
									local thumbType = Enum.ThumbnailType.HeadShot
									local thumbSize = Enum.ThumbnailSize.Size100x100
									local ok, content, isReady = pcall(function()
										return game:GetService("Players"):GetUserThumbnailAsync(plr.UserId, thumbType, thumbSize)
									end)
									if ok and isReady and plr == selectedPlayer then
										avatar.Image = content
									end
								end)
							else
								avatar.Image = ""
							end
						end
						local function updateSelInfo()
							if not (selectedPlayer and selectedPlayer:IsA("Player")) then selInfo.Text = "" return end
							local plr = selectedPlayer
							local L = {}
							L[#L+1] = "display: " .. tostring(plr.DisplayName)
							L[#L+1] = "@" .. tostring(plr.Name)
							local wep = "-"
							local char = plr.Character
							if char then local et = char:FindFirstChild("EquippedTool") if et then wep = tostring(et.Value) end end
							L[#L+1] = "weapon: " .. wep
							local team = "-"
							if plr:FindFirstChild("Status") and plr.Status:FindFirstChild("Team") then team = tostring(plr.Status.Team.Value) end
							local hp = "-"
							if char and char:FindFirstChild("Humanoid") then hp = tostring(math.floor(char.Humanoid.Health)) .. "/" .. tostring(math.floor(char.Humanoid.MaxHealth)) end
							L[#L+1] = "hp: " .. hp .. "  team: " .. team
							local dist = "-"
							local myChar = game.Players.LocalPlayer.Character
							local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
							local thHrp = char and char:FindFirstChild("HumanoidRootPart")
							if myHrp and thHrp then dist = tostring(math.floor((myHrp.Position - thHrp.Position).Magnitude)) .. "m" end
							L[#L+1] = "dist: " .. dist
							local money = nil
							pcall(function()
								if plr:FindFirstChild("Cash") then money = plr.Cash.Value end
							end)
							if money ~= nil then L[#L+1] = "money: $" .. tostring(money) end
							local fl = {}
							if plr:FindFirstChild("Kevlar") and plr.Kevlar.Value > 0 then
								fl[#fl+1] = plr:FindFirstChild("Helmet") and "Helmet" or "Armored"
							else fl[#fl+1] = "Unarmored" end
							if plr:FindFirstChild("DefuseKit") then fl[#fl+1] = "Defuser" end
							if char and char:FindFirstChild("BackC4") then fl[#fl+1] = "Bomb" end
							if char then
								local g = char:FindFirstChild("Gun")
								if g and g:FindFirstChild("Scoped") then fl[#fl+1] = "Scoped" end
							end
							if #fl > 0 then L[#L+1] = "flags: " .. table.concat(fl, ", ") end
							selInfo.Text = table.concat(L, "\n")
						end
						local function createB(t, y)
							local b = Instance.new("TextButton", detail)
							b.Size = UDim2.new(0, 85, 0, 28)
							b.Position = UDim2.new(1, -95, 0, y)
							b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
							b.Text = t; b.TextColor3 = Color3.fromRGB(180, 180, 180)
							b.Font = Enum.Font.SourceSansBold; b.TextSize = 12
							Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
							local s = Instance.new("UIStroke", b) s.Color = Color3.fromRGB(40, 40, 40)
							return b
						end
						local priBtn = createB("prioritize", 12)
						local frnBtn = createB("friendly", 45)
						local lkBtn = createB("loop kill", 78)
						library_flags["PlayerPriorities"] = library_flags["PlayerPriorities"] or {}
						library_flags["PlayerFriendlies"] = library_flags["PlayerFriendlies"] or {}
						library_flags["PlayerLoopKills"] = library_flags["PlayerLoopKills"] or {}
						local function updateBtns()
							if not selectedPlayer then return end
							local isPri = library_flags["PlayerPriorities"][selectedPlayer.Name]
							local isFrn = library_flags["PlayerFriendlies"][selectedPlayer.Name]
							local isLk = library_flags["PlayerLoopKills"][selectedPlayer.Name]
							priBtn.TextColor3 = isPri and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(180, 180, 180)
							frnBtn.TextColor3 = isFrn and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(180, 180, 180)
							lkBtn.TextColor3 = isLk and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(180, 180, 180)
						end
						priBtn.MouseButton1Click:Connect(function()
							if not selectedPlayer then return end
							library_flags["PlayerPriorities"][selectedPlayer.Name] = not library_flags["PlayerPriorities"][selectedPlayer.Name]
							updateBtns()
						end)
						frnBtn.MouseButton1Click:Connect(function()
							if not selectedPlayer then return end
							library_flags["PlayerFriendlies"][selectedPlayer.Name] = not library_flags["PlayerFriendlies"][selectedPlayer.Name]
							updateBtns()
						end)
						lkBtn.MouseButton1Click:Connect(function()
							if not selectedPlayer then return end
							library_flags["PlayerLoopKills"][selectedPlayer.Name] = not library_flags["PlayerLoopKills"][selectedPlayer.Name]
							updateBtns()
						end)
						local rows = {}
						local function addPlayer(p)
							local row = Instance.new("TextButton", listFrame)
							row.Size = UDim2.new(1, 0, 0, 22)
							row.BackgroundTransparency = 1; row.Text = ""
							local nameL = Instance.new("TextLabel", row)
							nameL.Size = UDim2.new(0.3, -5, 1, 0); nameL.Position = UDim2.new(0, 5, 0, 0)
							nameL.BackgroundTransparency = 1; nameL.Text = p.Name:lower()
							nameL.TextColor3 = Color3.fromRGB(220, 220, 220); nameL.Font = Enum.Font.SourceSans
							nameL.TextSize = 12; nameL.TextXAlignment = Enum.TextXAlignment.Left
							local teamL = Instance.new("TextLabel", row)
							teamL.Size = UDim2.new(0.45, -5, 1, 0); teamL.Position = UDim2.new(0.3, 5, 0, 0)
							teamL.BackgroundTransparency = 1; teamL.Text = "none"
							teamL.TextColor3 = Color3.fromRGB(140, 140, 140); teamL.Font = Enum.Font.SourceSans
							teamL.TextSize = 11; teamL.TextXAlignment = Enum.TextXAlignment.Left
							local statusL = Instance.new("TextLabel", row)
							statusL.Size = UDim2.new(0.25, -5, 1, 0); statusL.Position = UDim2.new(0.75, 5, 0, 0)
							statusL.BackgroundTransparency = 1; statusL.Text = "none"
							statusL.TextColor3 = Color3.fromRGB(180, 180, 180); statusL.Font = Enum.Font.SourceSans
							statusL.TextSize = 11; statusL.TextXAlignment = Enum.TextXAlignment.Left
							local function updateInfo()
								pcall(function()
									local team = "none"
									if p:FindFirstChild("Status") and p.Status:FindFirstChild("Team") then
										team = p.Status.Team.Value
									end
									teamL.Text = team == "CT" and "counter-terrorists" or team == "T" and "terrorists" or team:lower()
									
									local teamPrefix = "3_"
									if team == "CT" then
										teamL.TextColor3 = Color3.fromRGB(70, 120, 180)
										teamPrefix = "1_"
									elseif team == "T" then
										teamL.TextColor3 = Color3.fromRGB(180, 150, 60)
										teamPrefix = "2_"
									else
										teamL.TextColor3 = Color3.fromRGB(140, 140, 140)
									end
									row.Name = teamPrefix .. p.Name:lower()
									
									local sText = "none"
									if library_flags["PlayerPriorities"][p.Name] then
										sText = "prioritize"
									elseif library_flags["PlayerLoopKills"][p.Name] then
										sText = "loop kill"
									elseif library_flags["PlayerFriendlies"][p.Name] then
										sText = "friendly"
									end
									statusL.Text = sText
									if sText == "loop kill" then
										statusL.TextColor3 = Color3.fromRGB(255, 0, 0)
									elseif sText ~= "none" then
										statusL.TextColor3 = Color3.fromRGB(0, 255, 0)
									else
										statusL.TextColor3 = Color3.fromRGB(180, 180, 180)
									end
									local alive = true
									if p.Character and p.Character:FindFirstChild("Humanoid") then
										alive = p.Character.Humanoid.Health > 0
									else
										alive = false
									end
								end)
							end
							task.spawn(function()
								while row and row.Parent do
									updateInfo()
									if selectedPlayer == p then updateSelInfo() end
									task.wait(1)
								end
							end)
							row.MouseButton1Click:Connect(function()
								for _, r in rows do r.BackgroundTransparency = 1 end
								row.BackgroundTransparency = 0.9; row.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
								selectedPlayer = p
								selLabel.Text = "selected: " .. p.Name:lower()
								updateBtns()
								updateAvatar()
								updateSelInfo()
							end)
							rows[p.UserId] = row
							listFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
						end
						game.Players.PlayerAdded:Connect(addPlayer)
						game.Players.PlayerRemoving:Connect(function(p)
							if rows[p.UserId] then rows[p.UserId]:Destroy(); rows[p.UserId] = nil end
							if selectedPlayer == p then
								selectedPlayer = nil
								selLabel.Text = "no player selected"
								updateBtns()
							end
							listFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
						end)
						for _, p in game.Players:GetPlayers() do
							if p ~= game.Players.LocalPlayer then addPlayer(p) end
						end
					end
					sec.main = secFrame
				end
			end
		end
		task.defer(updateCanvas)
		end
		local function updateSidebarVisuals(selTab, selSub)
			if L_5_.lastTabBtn then 
				L_5_.lastTabBtn:FindFirstChild("TextLabel").TextColor3 = Color3.fromRGB(160, 160, 160)
				L_5_.lastTabBtn.BackgroundTransparency = 1
			end
			if L_5_.lastSubBtn then
				L_5_.lastSubBtn.TextColor3 = Color3.fromRGB(120, 120, 120)
			end
			tabLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
			tabBtn.BackgroundTransparency = 0.8
			L_5_.lastTabBtn = tabBtn
			if selSub then
				for _, item in tab.sidebarSubBtns do
					if item.sub == selSub then
						item.label.TextColor3 = Color3.fromRGB(0, 255, 0)
						L_5_.lastSubBtn = item.label
						break
					end
				end
			end
		end
		local function activateTab(targetSub)
			for _, dl in floatingDropdowns do dl.Visible = false end
			if activePage then activePage.Visible = false end
			activePage = pageFrame
			activeBtn = tabBtn
			pageFrame.Visible = true
			previewWin.Visible = (tab.title == "Visuals")
			local TS = game:GetService("TweenService")
			local ti = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
			for _, t in self.tabs do
				if t.subContainer then
					local targetHeight = (t == tab and #t.subtabs > 0) and (#t.subtabs * 22) or 0
					TS:Create(t.subContainer, ti, {Size = UDim2.new(1, 0, 0, targetHeight)}):Play()
				end
			end
			if #tab.subtabs > 0 then
				local subToUse = targetSub or tab.subtabs[1]
				for _, item in secFramesToToggle do
					item.frame.Visible = (item.sub == subToUse)
				end
				updateSidebarVisuals(tab, subToUse)
			else
				updateSidebarVisuals(tab, nil)
			end
		end
		tabBtn.MouseButton1Click:Connect(function()
			activateTab()
		end)
		for _, item in tab.sidebarSubBtns do
			item.btn.MouseButton1Click:Connect(function()
				activateTab(item.sub)
			end)
		end
		if not activePage then
			activateTab()
		end
	end
	local colorPop = Instance.new("Frame", sg)
	colorPop.Size = UDim2.new(0, 150, 0, 160)
	colorPop.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	colorPop.BorderColor3 = Color3.fromRGB(0, 0, 0)
	colorPop.BorderSizePixel = 1
	colorPop.Visible = false
	colorPop.Active = true
	local dragging, dragInput, dragStart, startPos
	main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if colorPop.Visible then
				local x, y = input.Position.X, input.Position.Y
				if not (x and y) then
					local mLoc = game:GetService("UserInputService"):GetMouseLocation()
					x, y = mLoc.X, mLoc.Y - 36
				end
				local pX, pY = colorPop.AbsolutePosition.X, colorPop.AbsolutePosition.Y
				if x >= pX and x <= pX + colorPop.AbsoluteSize.X and y >= pY and y <= pY + colorPop.AbsoluteSize.Y then
					return
				end
			end
			local sv = env.skinViewportRef
			if sv and sv.Visible and sv:IsDescendantOf(game) and sv.AbsoluteSize.X > 0 and sv.Parent.Parent.Visible then
				local x, y = input.Position.X, input.Position.Y
				local pX, pY = sv.AbsolutePosition.X, sv.AbsolutePosition.Y
				if x >= pX and x <= pX + sv.AbsoluteSize.X and y >= pY and y <= pY + sv.AbsoluteSize.Y then
					return
				end
			end
			local gv = env.gloveViewportRef
			if gv and gv.Visible and gv:IsDescendantOf(game) and gv.AbsoluteSize.X > 0 then
				local x, y = input.Position.X, input.Position.Y
				local pX, pY = gv.AbsolutePosition.X, gv.AbsolutePosition.Y
				if x >= pX and x <= pX + gv.AbsoluteSize.X and y >= pY and y <= pY + gv.AbsoluteSize.Y then
					return
				end
			end
			local slv = env.sleeveViewportRef
			if slv and slv.Visible and slv:IsDescendantOf(game) and slv.AbsoluteSize.X > 0 then
				local x, y = input.Position.X, input.Position.Y
				local pX, pY = slv.AbsolutePosition.X, slv.AbsolutePosition.Y
				if x >= pX and x <= pX + slv.AbsoluteSize.X and y >= pY and y <= pY + slv.AbsoluteSize.Y then
					return
				end
			end
			dragging = true; dragStart = input.Position; startPos = main.Position
			input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
		end
	end)
	main.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	local currentTargetColor = nil
	local currentTargetBtn = nil
	local hue, sat, val = 1, 1, 1
	local hueSlider = Instance.new("Frame", colorPop)
	hueSlider.Size = UDim2.new(1, -20, 0, 10)
	hueSlider.Position = UDim2.new(0, 10, 1, -20)
	hueSlider.BackgroundColor3 = Color3.new(1,1,1)
	hueSlider.BorderColor3 = Color3.fromRGB(0,0,0)
	hueSlider.BorderSizePixel = 1
	hueSlider.Active = true
	local hueGrad = Instance.new("UIGradient", hueSlider)
	hueGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
		ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),
		ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
		ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),
		ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
	})
	local hueCursor = Instance.new("Frame", hueSlider)
	hueCursor.Size = UDim2.new(0, 2, 1, 0)
	hueCursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	hueCursor.BorderColor3 = Color3.fromRGB(0, 0, 0)
	hueCursor.BorderSizePixel = 1
	local satValBox = Instance.new("ImageLabel", colorPop)
	satValBox.Size = UDim2.new(1, -20, 1, -40)
	satValBox.Position = UDim2.new(0, 10, 0, 10)
	satValBox.Image = "rbxassetid://4155801252"
	satValBox.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
	satValBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	satValBox.BorderSizePixel = 1
	satValBox.ClipsDescendants = true
	satValBox.Active = true
	local satValCursor = Instance.new("Frame", satValBox)
	satValCursor.Size = UDim2.new(0, 4, 0, 4)
	satValCursor.AnchorPoint = Vector2.new(0.5, 0.5)
	satValCursor.Rotation = 45
	satValCursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	satValCursor.BorderColor3 = Color3.fromRGB(0, 0, 0)
	satValCursor.BorderSizePixel = 1
	local function updateColor()
		satValBox.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
		hueCursor.Position = UDim2.new(1 - hue, 0, 0, 0)
		satValCursor.Position = UDim2.new(sat, 0, 1 - val, 0)
		local finalColor = Color3.fromHSV(hue, sat, val)
		if currentTargetColor and currentTargetBtn then
			if typeof(currentTargetColor.SetColor) == "function" then
				currentTargetColor:SetColor(finalColor)
			else
				currentTargetColor.color = finalColor
			end
			currentTargetBtn.BackgroundColor3 = finalColor
		end
	end
	local uis = game:GetService("UserInputService")
	local draggingHue = false
	local draggingSatVal = false
	hueSlider.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingHue = true
			hue = 1 - math.clamp((input.Position.X - hueSlider.AbsolutePosition.X) / hueSlider.AbsoluteSize.X, 0, 1)
			updateColor()
		end
	end)
	satValBox.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingSatVal = true
			sat = math.clamp((input.Position.X - satValBox.AbsolutePosition.X) / satValBox.AbsoluteSize.X, 0.005, 1)
			val = 1 - math.clamp((input.Position.Y - satValBox.AbsolutePosition.Y) / satValBox.AbsoluteSize.Y, 0, 1)
			updateColor()
		end
	end)
	uis.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			if draggingHue then
				hue = 1 - math.clamp((input.Position.X - hueSlider.AbsolutePosition.X) / hueSlider.AbsoluteSize.X, 0, 1)
				updateColor()
			elseif draggingSatVal then
				sat = math.clamp((input.Position.X - satValBox.AbsolutePosition.X) / satValBox.AbsoluteSize.X, 0.005, 1)
				val = 1 - math.clamp((input.Position.Y - satValBox.AbsolutePosition.Y) / satValBox.AbsoluteSize.Y, 0, 1)
				updateColor()
			end
		end
	end)
	uis.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingHue = false
			draggingSatVal = false
		end
	end)
	openColorPicker = function(opt, btn)
		currentTargetColor = opt
		currentTargetBtn = btn
		colorPop.Position = UDim2.new(0, btn.AbsolutePosition.X - 160, 0, btn.AbsolutePosition.Y)
		colorPop.Visible = true
		local clr = opt.color or Color3.fromRGB(255, 255, 255)
		hue, sat, val = Color3.toHSV(clr)
		hue = hue == 0 and 1 or hue
		satValBox.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
		hueCursor.Position = UDim2.new(1 - hue, 0, 0, 0)
		satValCursor.Position = UDim2.new(sat, 0, 1 - val, 0)
	end
	game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and colorPop.Visible then
			local mousePos = input.Position
			local pos = colorPop.AbsolutePosition
			local size = colorPop.AbsoluteSize
			if mousePos.X < pos.X or mousePos.X > pos.X + size.X or mousePos.Y < pos.Y or mousePos.Y > pos.Y + size.Y then
				if currentTargetBtn then
					local bPos = currentTargetBtn.AbsolutePosition
					local bSize = currentTargetBtn.AbsoluteSize
					if mousePos.X >= bPos.X and mousePos.X <= bPos.X + bSize.X and mousePos.Y >= bPos.Y and mousePos.Y <= bPos.Y + bSize.Y then
						return
					end
				end
				colorPop.Visible = false
			end
		end
	end)
	game:GetService("RunService").RenderStepped:Connect(function()
		if self.open then
			game:GetService("UserInputService").MouseIconEnabled = false
			game:GetService("UserInputService").MouseBehavior = Enum.MouseBehavior.Default
			local mPos = game:GetService("UserInputService"):GetMouseLocation()
			local p = Vector2.new(mPos.X, mPos.Y)
			env._cursor_outer.Position = p
			env._cursor_inner.Position = p
			env._cursor_outer.Visible = true
			env._cursor_inner.Visible = true
		end
	end)
	game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
			local currentBind = (L_179_ and L_179_.flags and L_179_.flags["Menu Bind"]) or (library_flags and library_flags["Menu Bind"]) or "Delete"
			local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
			if kName == currentBind then
				if self.toggling then return end
				self.toggling = true
				local isVisible = false
				if self.base and self.mainFrame then
					isVisible = self.base.Enabled and self.mainFrame.Visible
				elseif self.mainFrame then
					isVisible = self.mainFrame.Visible
				elseif self.base then
					isVisible = self.base.Enabled
				end
				self.open = isVisible
				self.open = not self.open
				if self.mainFrame then self.mainFrame.Visible = self.open end
				if self.base then self.base.Enabled = self.open end
				env._cursor_outer.Visible = self.open
				env._cursor_inner.Visible = self.open
				game:GetService("UserInputService").MouseIconEnabled = not self.open
				game:GetService("UserInputService").MouseBehavior = self.open and Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter
				task.delay(0.2, function() self.toggling = false end)
			end
	end)
	env.ToggleCuteWare = function()
		if self.toggling then return end
		self.toggling = true
		local isVisible = false
		if self.base and self.mainFrame then
			isVisible = self.base.Enabled and self.mainFrame.Visible
		elseif self.mainFrame then
			isVisible = self.mainFrame.Visible
		elseif self.base then
			isVisible = self.base.Enabled
		end
		self.open = isVisible
		self.open = not self.open
		if self.mainFrame then self.mainFrame.Visible = self.open end
		if self.base then self.base.Enabled = self.open end
		env._cursor_outer.Visible = self.open
		env._cursor_inner.Visible = self.open
		game:GetService("UserInputService").MouseIconEnabled = not self.open
		game:GetService("UserInputService").MouseBehavior = self.open and Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter
		task.delay(0.2, function() self.toggling = false end)
	end
end
L_5_:Init()
corehusband = Instance.new("ScreenGui", game:service("CoreGui"))
logholder = game:GetObjects("rbxassetid://6502006065")[1]
logholder.log.main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
logholder.log.main.text.TextColor3 = Color3.new(0.8, 0.8, 0.8)
logholder.Parent = corehusband;
logcount = 0;
logDebounce = false;
function hitlog(l11l1l111l, ll11l1, l111l11lll11)
	ll11l1 = string.find(ll11l1, "Head") and "Head" or ll11l1;
	if logDebounce then
		return
	end;
	logDebounce = true;
	spawn(function()
		wait()
		logDebounce = false
	end)
	logcount = logcount + 1;
	if logcount >= 7 then
		for l11ll111111, ll111111ll in next, logholder:GetChildren() do
			if ll111111ll.Name == "logged" then
				ll111111ll:Destroy()
				logcount = logcount - 1;
				break
			end
		end
	end;
	local L_1648_ = logholder.log:Clone()
	L_1648_.Parent = logholder;
	L_1648_.Visible = true;
	L_1648_.Name = "logged"
	L_1648_.BackgroundColor3 = library_flags["Menu Accent Color"]
	L_1648_.main.text.Text = "Hit " .. l11l1l111l.Name .. " in the " .. tostring(ll11l1) .. " with a " .. tostring(l111l11lll11)
	local L_1649_ = game:service("TweenService"):Create(L_1648_.main, TweenInfo.new(0.75), {
		Size = UDim2.new(0, L_1648_.main.text.TextBounds.X + 7, 0, 25)
	})
	L_1649_:Play()
	L_1649_.Completed:Wait()
	wait(2)
	local L_1650_ = game:service("TweenService"):Create(L_1648_.main, TweenInfo.new(1), {
		Size = UDim2.new(0, 0, 0, 25)
	})
	L_1650_:Play()
	L_1650_.Completed:Wait()
	L_1648_:Destroy()
	logcount = logcount - 1
end;
env.hitlog = hitlog;
if L_5_.mainFrame then L_5_.mainFrame.Modal = true end
for lll111, llll11l in next, L_30_:GetPlayers() do
	L_5_:AddConnection(llll11l.CharacterAdded, function(l11l11l1lll1)
		wait(0.25)
		if llll11l == L_32_ then
			if library_flags["autoBuyEnabled"] then
				wait(0.5)
				local L_1656_, L_1657_, L_1658_, L_1659_, L_1660_, L_1661_ = false, false, false, false, false, false;
				if not L_32_.PlayerGui.GUI.Inventory.Item1.Visible then
					buyWeapon(library_flags["Primary Weapon"])
					L_1661_ = true
				end;
				if string.find(string.lower(L_32_.PlayerGui.GUI.Inventory.Item2.ToolName.Text), "glock") or string.find(string.lower(L_32_.PlayerGui.GUI.Inventory.Item2.ToolName.Text), "usp") or string.find(string.lower(L_32_.PlayerGui.GUI.Inventory.Item2.ToolName.Text), "px") then
					buyWeapon(library_flags["Secondary Weapon"])
					L_1661_ = true
				end;
				if L_32_:FindFirstChild("Kevlar") and llll11l.Kevlar.Value < 100 then
					buyWeapon(library_flags["Armor"])
					L_1661_ = true
				end;
				local L_1662_ = 0;
				for ll1l111l11 = 4, 6 do
					local L_1664_ = L_32_.PlayerGui.GUI.Inventory["Item" .. tostring(ll1l111l11)]
					local L_1665_ = L_1664_.ToolName.Text;
					if L_1664_.Visible and L_1665_ == "Molotov" or L_1664_.Visible and L_1665_ == "Incendiary Grenade" then
						L_1658_ = true;
						L_1662_ = L_1662_ + 1
					elseif L_1664_.Visible and L_1665_ == "HE Grenade" then
						L_1657_ = true;
						L_1662_ = L_1662_ + 1
					elseif L_1664_.Visible and L_1665_ == "Decoy Grenade" then
						L_1660_ = true;
						L_1662_ = L_1662_ + 1
					elseif L_1664_.Visible and L_1665_ == "Smoke Grenade" then
						L_1659_ = true;
						L_1662_ = L_1662_ + 1
					elseif L_1664_.Visible and L_1665_ == "Flashbang" then
						L_1656_ = true;
						L_1662_ = L_1662_ + 1
					end
				end;
				for l11111l, l1lll111 in next, library_flags["Grenades"] do
					if l1lll111 and L_1662_ < 3 then
						if l11111l == "Fire Grenade" and not L_1658_ or l11111l == "HE Grenade" and not L_1657_ or l11111l == "Decoy Grenade" and not L_1660_ or l11111l == "Smoke Grenade" and not L_1659_ or l11111l == "Flashbang" and not L_1656_ then
							buyWeapon(l11111l)
							L_1662_ = L_1662_ + 1;
							L_1661_ = true
						end
					end
				end;
				wait()
				if L_1661_ then
					L_36_.Back()
				end
			end
		end;
		wait(0.75)
		L_49_ = true;
		if not L_5_ then return end
		do local _opt = L_5_.options["Self Chams"]; if _opt and type(_opt.callback) == "function" then _opt.callback() end end
		if library_flags["Backtrack"] and llll11l ~= L_32_ then
			createPlr(llll11l)
		end;
		if library_flags["Chams"] and llll11l ~= L_32_ then
			chamsPlr(llll11l)
			cbCHAMS()
		end
	end)
end;
L_5_:AddConnection(L_30_.PlayerAdded, function(l11ll11l1ll)
	L_5_:AddConnection(l11ll11l1ll.CharacterAdded, function(lllll11l)
		wait(1)
		L_49_ = true;
		if library_flags["Backtrack"] and l11ll11l1ll ~= L_32_ then
			createPlr(l11ll11l1ll)
		end;
		if library_flags["Chams"] and l11ll11l1ll ~= L_32_ then
			chamsPlr(l11ll11l1ll)
			cbCHAMS()
		end
	end)
end)
local L_142_, L_143_ = 0, 90;

env.L_144_ = L_36_.firebullet;
L_36_.firebullet = function(l11ll11, ...)
	if not L_5_ or not L_5_.open or env.target then

		local L_1671_ = false;
		if env.target and not L_57_.melee then
			if env.L_144_ then env.L_144_(l11ll11, ...) end
			L_1671_ = true
		elseif not env.target and not L_1671_ then
			if env.L_144_ then env.L_144_(l11ll11, ...) end
			L_1671_ = true
		end;
	end
end;
L_5_:AddConnection(L_34_.ChildAdded, function(l11111l1)
	updateViewModelVisuals()
	selfChams()
end)
L_5_:AddConnection(workspace.Debris.ChildAdded, function(l1l11l1l)
	local L_1674_ = false;
	if L_24_.Weapons:FindFirstChild(l1l11l1l.Name) and not l1l11l1l:FindFirstChild("Folder") then
		f = Instance.new("Folder", l1l11l1l)
		createEsp("weapon", l1l11l1l)
	end;
	for l111111lll = 1, 10 do
		wait()
		if l1l11l1l:FindFirstChild("ball") then
			L_1674_ = true
		end
	end;
	if L_1674_ and library_flags["Grenade Area"] then
		local L_1676_ = Instance.new("Part", l1l11l1l)
		L_1676_.Color = library_flags["areaColor"]
		L_1676_.Size = Vector3.new(12, 12, 12)
		L_1676_.Shape = "Ball"
		L_1676_.Material = "ForceField"
		L_1676_.CanCollide = false;
		L_1676_.Anchored = true;
		repeat
			L_28_.RenderStepped:Wait()
			if L_1676_ and l1l11l1l and l1l11l1l:FindFirstChild("Handle2") then
				L_1676_.Position = l1l11l1l.Handle2.Position
			else
				break
			end
		until l1l11l1l:FindFirstChild("Explode1Playing")
		L_1676_:Destroy()
	end
end)
for llll11ll1ll, l11lll1l in next, game.Teams:GetChildren() do
	l11lll1l.PlayerAdded:connect(function(llll1lll1111)
		if llll1lll1111 == L_32_ then
			wait(0.5)
			for lll111l1111l, ll111l in next, L_30_:GetPlayers() do
				if ll111l.Character then
					for ll11l1l11l1, l11ll1 in next, ll111l.Character:GetDescendants() do
						if l11ll1:IsA"CylinderHandleAdornment" or l11ll1:IsA"BoxHandleAdornment" then
							l11ll1:Destroy()
						end
					end
				end
			end;
			wait(1)
			for ll11l1lllll1, inputBeganEvent in next, L_30_:GetPlayers() do
				if inputBeganEvent.Character then
					if library_flags["Chams"] then chamsPlr(inputBeganEvent) end
				end
			end
		end
	end)
end;
L_32_.Status.Kills.Changed:Connect(function(ll1ll1)
	if ll1ll1 ~= 0 then
		onKill:Fire()
	end
end)
env.MenuFrame = L_4_.mainFrame
draggable(L_83_)
draggable(L_87_)
draggable(L_4_.mainFrame)
spawn(function()
	while wait(3.5) do
		updateSkybox()
	end
end)
if isfile("clarity.tk/temp.tmp") then
	task.delay(1, function()
		L_5_:LoadConfig(readfile("clarity.tk/temp.tmp"))
		delfile("clarity.tk/temp.tmp")
	end)
end;
L_32_.OnTeleport:Connect(function(l11l1ll)
end)
knifeDebounce = false;
invissed = false;
chatspamDebounce = 0;
textbounded = false;
tpdebounce = false;
reloading = false;
reloaddebounce = false;
strafing = false;
oldLook = Vector3.new()
oldAmbient = L_29_.Ambient;
oldOutdoorAmbient = L_29_.OutdoorAmbient;
testpart = Instance.new("Part", workspace)
testpart.Anchored = true;
testpart.Size = Vector3.new(1, 1, 1)
testpart.CanCollide = false;
L_25_.InputChanged:Connect(function(lll11ll1)
	if not library_flags["Override Game Movement"] then
		return
	end;
	if not L_57_.alive then
		return
	end;
	if lll11ll1.UserInputType == Enum.UserInputType.MouseMovement then
		local L_1692_ = L_32_.Character.Humanoid:GetState()
		if L_1692_ == Enum.HumanoidStateType.Freefall or L_1692_ == Enum.HumanoidStateType.Jumping then
		else
			return
		end;
		strafing = true;
		if not L_25_:IsKeyDown(Enum.KeyCode.W) and not L_25_:IsKeyDown(Enum.KeyCode.S) then
			if lll11ll1.Delta.X < 0 then
				if lll11ll1.Delta.X > -11 and L_25_:IsKeyDown(Enum.KeyCode.A) then
					local L_1693_ = math.abs(lll11ll1.Delta.X) / 25 * library_flags["Air Acceleration"]
					L_32_.Character.Humanoid.WalkSpeed = L_32_.Character.Humanoid.WalkSpeed + L_1693_
				elseif L_25_:IsKeyDown(Enum.KeyCode.A) then
					local L_1694_ = - (math.abs(lll11ll1.Delta.X) / 7.5)
					L_32_.Character.Humanoid.WalkSpeed = L_32_.Character.Humanoid.WalkSpeed + L_1694_
				end
			elseif lll11ll1.Delta.X > 0 then
				if lll11ll1.Delta.X < 11 and L_25_:IsKeyDown(Enum.KeyCode.D) then
					local L_1695_ = math.abs(lll11ll1.Delta.X) / 25 * library_flags["Air Acceleration"]
					L_32_.Character.Humanoid.WalkSpeed = L_32_.Character.Humanoid.WalkSpeed + L_1695_
				elseif L_25_:IsKeyDown(Enum.KeyCode.D) then
					local L_1696_ = - (math.abs(lll11ll1.Delta.X) / 7.5)
					L_32_.Character.Humanoid.WalkSpeed = L_32_.Character.Humanoid.WalkSpeed + L_1696_
				end
			end
		end;
		L_32_.Character.Humanoid.WalkSpeed = math.clamp(L_32_.Character.Humanoid.WalkSpeed, 0, 120)
		spawn(function()
			strafing = false
		end)
	end
end)
L_28_.Stepped:Connect(function()
	if alive() then
		local L_1697_, L_1698_ = L_32_.Character, not noclipping;
		L_1697_.Head.CanCollide = L_1698_;
		L_1697_.UpperTorso.CanCollide = L_1698_;
		L_1697_.LowerTorso.CanCollide = L_1698_;
		L_1697_.HumanoidRootPart.CanCollide = L_1698_
	end
end)
pcall(function()
	L_5_.base.TextLabel.Visible = false
end)
pingIntance = game.Stats.PerformanceStats.Ping;
noscroll = false;
oldmovedown = L_36_.moveDown;
oldmoveup = L_36_.moveUp;
oldmakevisible = L_36_.makeVisible;
env._espFrameCount = 0
L_28_.RenderStepped:Connect(function(l1lllll1ll)
    LastStep = l1lllll1ll
	env._espFrameCount = (env._espFrameCount or 0) + 1
	if env._espFrameCount % 30 == 0 then
		env._espIgnoreList = nil
	end
	if not workspace:FindFirstChild("Map") then
		return
	end;
	L_59_ = l1lllll1ll;
	L_58_ = pingIntance:GetValue()
	pcall(function()
		if library_flags["Gradient"] then
			L_29_.Ambient = typeof(library_flags["gradientColor"]) == "Color3" and library_flags["gradientColor"] or L_29_.Ambient
			L_29_.OutdoorAmbient = typeof(library_flags["gradientColor2"]) == "Color3" and library_flags["gradientColor2"] or L_29_.OutdoorAmbient
		else
			L_29_.Ambient = typeof(oldAmbient) == "Color3" and oldAmbient or Color3.fromRGB(128, 128, 128)
			L_29_.OutdoorAmbient = typeof(oldOutdoorAmbient) == "Color3" and oldOutdoorAmbient or Color3.fromRGB(128, 128, 128)
		end
		if library_flags["Enabled Ambient"] then
			L_29_.Ambient = library_flags["ambientColor"]
		end
		if library_flags["Brightness"] ~= nil then
			L_29_.Brightness = library_flags["Brightness"]
		end
	end)
	pcall(function()
		if not L_44_ or not L_44_.Parent then
			L_44_ = Instance.new("ColorCorrectionEffect", L_29_)
		end
		L_44_.Saturation = library_flags["Saturation"] and library_flags["saturationValue"] / 50 or 0
		L_29_.ClockTime = library_flags["Time Changer"] and library_flags["time"] / 2 or 14
		if library_flags["Skybox Changer"] and not L_29_:FindFirstChild("customsky") then
			task.spawn(updateSkybox)
		end
	end)
local function updateEdgeBox(pos, active, color)
		if not edgeBox then
			edgeBox = Instance.new("Part")
			edgeBox.Name = "EB_Visual"
			edgeBox.Shape = Enum.PartType.Block
			edgeBox.CastShadow = false
			edgeBox.CanCollide = false
			edgeBox.Anchored = true
			edgeBox.Material = Enum.Material.SmoothPlastic
			edgeBox.Size = Vector3.new(1.3, 1.3, 1.3)
			edgeBox.Parent = workspace:FindFirstChild("Ray_Ignore") or workspace
			local outline = Instance.new("SelectionBox")
			outline.Name = "EB_Outline"
			outline.Adornee = edgeBox
			outline.LineThickness = 0.05
			outline.Color3 = Color3.new(0, 0, 0)
			outline.Parent = edgeBox
		end
		edgeBox.Position = pos
		edgeBox.Color = Color3.new(0, 0, 0)
		edgeBox.Transparency = 1 
		local isViz = library_flags["Eb_Visualize"] ~= false
		if edgeBox:FindFirstChild("EB_Outline") then
			edgeBox.EB_Outline.Visible = active and isViz
		end
	end
	pcall(function()
		local hrp = L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart")
		local hum = L_32_.Character and L_32_.Character:FindFirstChild("Humanoid")
		if not hrp or not hum or not L_57_.alive then 
			if edgeBox then edgeBox.Transparency = 1 end
			return 
		end
		if env.currentHum ~= hum then
			env.currentHum = hum
			if env.jumpConn then env.jumpConn:Disconnect() end
			env.jumpConn = hum:GetPropertyChangedSignal("Jump"):Connect(function()
				if hum.Jump then
					env.lastJumpTriggerTime = tick()
				end
			end)
		end
		local ebEnabled = library_flags["Edgebug"]
		local autoStatus = library_flags["Auto Edge Bug"]
		local ebMode = library_flags["Edgebug Mode"] or "redirectional"
		if ebMode == "mimic" and ebEnabled and (autoStatus or env.ebHolding) then
			if env.mimicHum ~= hum then
				env.mimicHum = hum
				if env.mimicStateConn then
					env.mimicStateConn:Disconnect()
					env.mimicStateConn = nil
				end
				env.mimicStateConn = hum.StateChanged:Connect(function(old, new)
					if not (library_flags["Edgebug"] and (library_flags["Auto Edge Bug"] or env.ebHolding)) then return end
					if library_flags["Edgebug Mode"] ~= "mimic" then return end
					if new == Enum.HumanoidStateType.Freefall then
						env.mimicWasFalling = true
					end
					if env.mimicWasFalling and new == Enum.HumanoidStateType.Landed and not edgebugDebounce then
						env.mimicWasFalling = false
						edgebugDebounce = true
						env.hookJP = 0
						local currentHrp = L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart")
						local currentHum = L_32_.Character and L_32_.Character:FindFirstChild("Humanoid")
						if not currentHrp or not currentHum then
							edgebugDebounce = false
							return
						end
						spawn(function()
							wait()
							if not currentHrp then return end
							local vel = currentHrp.AssemblyLinearVelocity
							currentHrp.AssemblyLinearVelocity = Vector3.new(vel.X * 1.8, -7, vel.Z * 1.8)
							local vel2 = currentHrp.AssemblyLinearVelocity
							for i = 1, 4 do
								wait()
								if not currentHrp then return end
								currentHrp.AssemblyLinearVelocity = vel2 - Vector3.new(0, 2, 0)
							end
							wait()
							if not currentHrp then return end
							currentHrp.AssemblyLinearVelocity = currentHrp.AssemblyLinearVelocity * Vector3.new(1.8, 1, 1.8)
							env.hookJP = nil
							delay(0.3, function()
								edgebugDebounce = false
							end)
						end)
					end
				end)
			end
		else
			if env.mimicStateConn and ebMode ~= "mimic" then
				env.mimicStateConn:Disconnect()
				env.mimicStateConn = nil
				env.mimicHum = nil
			end
		end
		if (not L_50_) and edgeBox then edgeBox.Transparency = 1 end
		if ebEnabled and (autoStatus or env.ebHolding) and ebMode == "helltracing" then
			local state = hum:GetState()
			local velocity = hrp.AssemblyLinearVelocity
			local rayParams = RaycastParams.new()
			rayParams.FilterType = Enum.RaycastFilterType.Exclude
			rayParams.FilterDescendantsInstances = {L_32_.Character, workspace:FindFirstChild("Ray_Ignore")}
			if state == Enum.HumanoidStateType.Freefall and velocity.Y < -8 then
				local moveDir = Vector3.new(velocity.X, 0, velocity.Z)
				if moveDir.Magnitude < 0.5 then
					moveDir = hrp.CFrame.LookVector
				else
					moveDir = moveDir.Unit
				end
				local underRay = workspace:Raycast(hrp.Position, Vector3.new(0, -6, 0), rayParams)
				local forwardOrigin = hrp.Position + moveDir * 2.0
				local forwardRay = workspace:Raycast(forwardOrigin, Vector3.new(0, -6, 0), rayParams)
				local isEdge = (underRay and not forwardRay) or 
					(underRay and forwardRay and (underRay.Position.Y - forwardRay.Position.Y) > 1.0)
				if isEdge then
					env.helltracingEdgeDetected = true
					env.helltracingEdgeTime = tick()
					if library_flags["showEBLogs"] then
						warn("[EB DEBUG] helltracing edge detected | velY=" .. string.format("%.1f", velocity.Y) .. " flatSpeed=" .. string.format("%.1f", Vector3.new(velocity.X, 0, velocity.Z).Magnitude))
					end
				end
			end

			if env.helltracingEdgeDetected and not env.helltracingFallSpeed then
				local ff = Vector3.new(velocity.X, 0, velocity.Z)
				if ff.Magnitude > 0.5 then
					env.helltracingFallSpeed = ff.Magnitude
					env.helltracingFallDir = ff.Unit
				end
			end
			if env.helltracingEdgeDetected and state == Enum.HumanoidStateType.Landed and not edgebugDebounce then
				if (tick() - (env.helltracingEdgeTime or 0)) < 0.5 then
					edgebugDebounce = true
					env.hookJP = 0

					local liveFlat = Vector3.new(velocity.X, 0, velocity.Z)
					local flatSpeed = math.max(env.helltracingFallSpeed or 0, liveFlat.Magnitude)
					local moveDir = env.helltracingFallDir or (liveFlat.Magnitude > 0.5 and liveFlat.Unit) or hrp.CFrame.LookVector
					
					hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
					hum:ChangeState(Enum.HumanoidStateType.Freefall)
					hrp.AssemblyLinearVelocity = Vector3.new(
						moveDir.X * flatSpeed,
						0,
						moveDir.Z * flatSpeed
					)
					hrp.CFrame = hrp.CFrame + moveDir * 0.5
					env.lastEdgebugTime = tick()
					if env.showEdgebugBadge then env.showEdgebugBadge() end
					if library_flags["showEBLogs"] then
						warn(string.format("[EB DEBUG] helltracing slide | speed=%.1f boost=%.2f", flatSpeed, boostMult))
					end
					task.delay(0.15, function()
						env.hookJP = nil
						pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true) end)
						edgebugDebounce = false
					end)
				end
				env.helltracingEdgeDetected = false
				env.helltracingFallSpeed = nil
				env.helltracingFallDir = nil
			end
			if env.helltracingEdgeDetected and (tick() - (env.helltracingEdgeTime or 0)) > 0.8 then
				env.helltracingEdgeDetected = false
				env.helltracingFallSpeed = nil
				env.helltracingFallDir = nil
			end
		elseif env.helltracingEdgeDetected then

			env.helltracingEdgeDetected = false
			env.helltracingFallSpeed = nil
			env.helltracingFallDir = nil
		end
		local velocity = hrp.AssemblyLinearVelocity
		if env.minijumpActive then
			if tick() - (env.mjArmedTime or 0) > 1.5 then
				env.minijumpActive = nil
			elseif velocity.Y > 2 then
				local mult = library_flags["mjMult"] or 0.5
				hrp.AssemblyLinearVelocity = Vector3.new(velocity.X, velocity.Y * mult, velocity.Z)
				env.minijumpActive = nil 
				env.minijumpSuccessTime = tick()
			end
		end
		local isGrounded = hum.FloorMaterial ~= Enum.Material.Air
		if isGrounded then
			env.jbWasGrounded = true
			env.hasBoosted = nil 
		end
		if library_flags["Jumpbug"] and env.jbBindHeld then
			if velocity.Y > 1 and env.jbWasGrounded and not env.hasBoosted then

				local boostVal = library_flags["jbheight"] or 3.5
				local multiplier = 0.8
				
				hrp.AssemblyLinearVelocity = Vector3.new(velocity.X, velocity.Y + (boostVal * multiplier), velocity.Z)
				env.hasBoosted = true
				env.jbWasGrounded = false
				env.jbTriggerTime = tick()
				env.lastJumpbugTime = tick()
			end
		end
	end)
	if #L_30_:GetPlayers() ~= #L_56_ then
		for l1l1l1l1, l11l1111ll1 in next, L_30_:GetPlayers() do
			if not L_56_[l11l1111ll1.Name] then
				createEsp("plr", l11l1111ll1)
			end
		end
	end;
	if L_5_ and L_5_.open and not noscroll then
		noscroll = true;
		L_36_.moveDown = function()
		end;
		L_36_.moveUp = function()
		end
	elseif L_5_ and not L_5_.open and noscroll then
		noscroll = false;
		L_36_.moveDown = oldmovedown;
		L_36_.moveUp = oldmoveup
	end;
	if not env.espBoundingBox then

		env.espBoundingBox = function(rootCf, headCf, rootSize, headSize, hipHeight, cam)
			local th = (headCf * Vector3.new(0, headSize.Y * 0.5 + 0.5, 0))
			local bf = (rootCf * Vector3.new(0, -(rootSize.Y * 0.5 + hipHeight + 0.5), 0))
			local td = (th - rootCf.Position).Magnitude
			local bd = (rootCf.Position - bf).Magnitude
			local up = rootCf.UpVector
			local tp = rootCf.Position + up * td
			local bp = rootCf.Position - up * bd
			local top, tv = cam:WorldToViewportPoint(tp)
			local bottom, bv = cam:WorldToViewportPoint(bp)
			local width = math.abs(top.X - bottom.X)
			local height = math.max(math.abs(top.Y - bottom.Y), width / 1.75)
			local sizeX = math.floor(math.max(height / 1.7, width * 2.5))
			local sizeY = math.floor(height)
			local posX = math.floor((bottom.X - sizeX + top.X) / 2)
			local posY = math.floor(math.min(top.Y, bottom.Y))
			return Vector2.new(posX, posY), Vector2.new(sizeX, sizeY), (tv or bv)
		end
	end
	if not env.drawLineFast then
		env.drawLineFast = function(p1, p2, line, offset1, offset2, cam, color)
			if p1 and p2 and line then
				local pos1 = offset1 and (p1.CFrame * offset1).Position or p1.Position
				local pos2 = offset2 and (p2.CFrame * offset2).Position or p2.Position
				local s1, v1 = cam:WorldToViewportPoint(pos1)
				local s2, v2 = cam:WorldToViewportPoint(pos2)
				if v1 and v2 then
					line.From = Vector2.new(s1.X, s1.Y)
					line.To = Vector2.new(s2.X, s2.Y)
					line.Visible = true
					line.Color = color
				else
					line.Visible = false
				end
			else
				if line then line.Visible = false end
			end
		end
	end
	if library_flags["espEnabled"] then
		invissed = false;
		for l1ll11, lll11ll1lll in next, L_56_ do
			local L_1704_ = lll11ll1lll.type == "plr"
			if L_1704_ and not L_30_:FindFirstChild(l1ll11) or not L_1704_ and lll11ll1lll.object == nil then
				lll11ll1lll.invis()
				lll11ll1lll.remove()
				L_56_[l1ll11] = nil;
				continue;
			end;
			if lll11ll1lll.type == "weapon" and not library_flags["Dropped Weapon ESP"] then
				lll11ll1lll.text.Visible = false;
				continue;
			end;
			if L_1704_ and teamCheck(L_30_[l1ll11], L_39_) and L_30_[l1ll11].Character and L_30_[l1ll11].Character:FindFirstChild("Humanoid") and L_30_[l1ll11].Character:FindFirstChild("HumanoidRootPart") and L_30_[l1ll11].Character:FindFirstChild("Head") or not L_1704_ and lll11ll1lll.object then
				if not alive() then
					lll11ll1lll.invis()
					continue;
				end;
				local L_1705_;
				local L_1706_ = L_48_;
				local L_1707_ = L_48_;
				local L_1708_;
				if L_1704_ then
					L_1705_ = L_30_[l1ll11]
					local L_1720_ = L_1705_.Character.HumanoidRootPart.Position;
					L_1706_ = Vector3.new(L_1720_.x, L_1720_.y + 2.45, L_1720_.z)
					L_1707_ = Vector3.new(L_1720_.x, L_1720_.y - 3.1, L_1720_.z)
					L_1708_ = math.clamp(L_1705_.Character.Humanoid.Health, 0, 100)
				elseif lll11ll1lll.type == "weapon" and lll11ll1lll.object and lll11ll1lll.object then
					L_1706_ = lll11ll1lll.object.Position;
					L_1707_ = lll11ll1lll.object.Position
				end;
				local L_1709_, L_1710_ = L_34_:WorldToViewportPoint(L_1706_)
				local L_1711_, L_1712_ = L_34_:WorldToViewportPoint(L_1707_)
				if L_1710_ or L_1712_ then
				else
					lll11ll1lll.invis()
					continue;
				end;
				local L_1713_ = (L_1711_.y - L_1709_.y) / 2;
				local L_1714_ = true;
				if library_flags["Visible Only ESP"] and L_32_.Character or not L_1704_ and lll11ll1lll.object then
					L_1714_ = false;
					local L_1721_ = L_1704_ and L_1705_.Character.Head.Position or lll11ll1lll.object.Position;
					local L_1722_ = Ray.new(L_34_.CFrame.p, (L_1721_ - L_34_.CFrame.p).unit * 500)
					if not env._espIgnoreList or env._espIgnoreListFrame ~= (env._espFrameCount or 0) then
						local mapClips = workspace.Map and workspace.Map:FindFirstChild("Clips") or nil
						local spawnPts = workspace.Map and workspace.Map:FindFirstChild("SpawnPoints") or nil
						local il = {L_34_, L_32_.Character, workspace:FindFirstChild("Ray_Ignore")}
						if mapClips then il[#il+1] = mapClips end
						if spawnPts then il[#il+1] = spawnPts end
						env._espIgnoreList = il
						env._espIgnoreListFrame = env._espFrameCount or 0
					end
					local L_1723_, L_1724_ = workspace:FindPartOnRayWithIgnoreList(L_1722_, env._espIgnoreList)
					if L_1704_ and L_1705_.Character then
						L_1714_ = L_1723_:IsDescendantOf(L_1705_.Character)
					elseif L_1723_ then
						L_1714_ = L_1723_ == lll11ll1lll.object
					end
				end;
				if not L_1714_ then
					lll11ll1lll.invis()
					continue;
				end;
				local L_1715_ = library_flags["Font"]
				local L_1716_ = ""
				if lll11ll1lll then lll11ll1lll._isInvis = false end
				if L_1704_ then
					if L_1705_.Character:FindFirstChild("EquippedTool") then
						L_1716_ = tostring(L_1705_.Character.EquippedTool.Value)
					end;
					local L_1725_ = library_flags["Box ESP"]
					local L_1726_ = library_flags["Health Bar"]

					local rectMin, rectSize
					do
						local char = L_1705_ and L_1705_.Character
						local hrp = char and char:FindFirstChild("HumanoidRootPart")
						local head = char and char:FindFirstChild("Head")
						local hum = char and char:FindFirstChild("Humanoid")
						if hrp and head and hum then
							local bpos, bsize = env.espBoundingBox(hrp.CFrame, head.CFrame, hrp.Size, head.Size, hum.HipHeight, L_34_)
							rectMin, rectSize = bpos, bsize
						end
					end
					if not rectMin then
						rectMin = Vector2.new(L_1709_.X - L_1713_ / 2, L_1709_.Y)
						rectSize = Vector2.new(L_1713_, L_1711_.y - L_1709_.Y)
					end
					local rectHeight = rectSize.Y
					local isGradientHp = library_flags["Gradient Health Bar"] and true or false
					lll11ll1lll.text.Visible = library_flags["Name ESP"]
					lll11ll1lll.weapon.Text = L_1716_;
					lll11ll1lll.weapon.Visible = library_flags["Weapon ESP"]
					lll11ll1lll.tracer.Visible = library_flags["Tracers"]
					lll11ll1lll.boxoutline.Visible = L_1725_ and library_flags["Outline"] and true or false;
					lll11ll1lll.box.Visible = L_1725_;
					lll11ll1lll.healthb.Visible = L_1726_ and not isGradientHp;
					lll11ll1lll.healthbo.Visible = L_1726_;
					if not L_1726_ then
						for i = 1, lll11ll1lll.healthSegCount do
							lll11ll1lll.healthSegs[i].Visible = false
						end
						lll11ll1lll.healthNum.Visible = false
					end
					lll11ll1lll.tracer.To = L_5_.round(Vector2.new(L_1711_.X, L_1711_.Y))
					local L_1727_ = library_flags["Armor Bar"]
					lll11ll1lll.armorb.Visible = L_1727_ and true or false;
					lll11ll1lll.armorbo.Visible = L_1727_ and true or false;
					if L_1726_ or L_1727_ then
						local hasKevlar = L_1705_ and L_1705_:FindFirstChild("Kevlar") and true or false
						if L_1726_ then

							local pct = math.clamp(L_1708_ / 100, 0, 1)
							local a = math.clamp((l1lllll1ll or 0.016) * 16, 0, 1)
							lll11ll1lll.hpSmooth = lll11ll1lll.hpSmooth + (pct - lll11ll1lll.hpSmooth) * a
							local sp = lll11ll1lll.hpSmooth
							local chunk = rectHeight * sp

							local hpMax = library_flags["healthBar"] or Color3.fromRGB(0, 255, 0)
							local hpLow = library_flags["healthBarLow"] or Color3.fromRGB(255, 0, 0)


							lll11ll1lll.healthbo.Position = L_5_.round(rectMin + Vector2.new(-6, -1))
							lll11ll1lll.healthbo.Size = L_5_.round(Vector2.new(4, rectHeight + 2))
							lll11ll1lll.healthb.Position = L_5_.round(rectMin + Vector2.new(-5, rectHeight - chunk))
							lll11ll1lll.healthb.Size = L_5_.round(Vector2.new(2, chunk))
							lll11ll1lll.healthb.Color = hpLow:Lerp(hpMax, sp)

							if isGradientHp then
								local segCount = lll11ll1lll.healthSegCount
								local sizePerSegment = math.ceil(rectHeight / segCount)
								local maxSegments = rectHeight / sizePerSegment + 1
								local healthPos = lll11ll1lll.healthb.Position
								for i = 1, segCount do
									local seg = lll11ll1lll.healthSegs[i]
									local projMinY = (i - 1) * sizePerSegment
									local projMaxY = projMinY + sizePerSegment
									if projMinY > chunk then
										seg.Visible = false
									else
										seg.Visible = true
										seg.Position = healthPos + Vector2.new(0, projMinY)
										seg.Size = Vector2.new(2, projMaxY - chunk > 0 and sizePerSegment - (projMaxY - chunk) or sizePerSegment)
										seg.Color = hpMax:Lerp(hpLow, i / maxSegments)
									end
								end
							else
								for i = 1, lll11ll1lll.healthSegCount do
									lll11ll1lll.healthSegs[i].Visible = false
								end
							end


							if library_flags["Health Number"] then
								local hn = lll11ll1lll.healthNum
								hn.Text = tostring(math.floor(sp * 100 + 0.5))
								hn.Position = Vector2.new(lll11ll1lll.healthbo.Position.X - hn.TextBounds.X / 2 - 2, lll11ll1lll.healthb.Position.Y - hn.TextBounds.Y / 2)
								hn.Color = Color3.new(1, 1, 1)
								hn.Visible = true
							else
								lll11ll1lll.healthNum.Visible = false
							end
						else
							for i = 1, lll11ll1lll.healthSegCount do
								lll11ll1lll.healthSegs[i].Visible = false
							end
							lll11ll1lll.healthNum.Visible = false
						end
						if L_1727_ then
							local barOffset = L_1726_ and 9 or 5
							lll11ll1lll.armorb.Position = L_5_.round(rectMin + Vector2.new(-barOffset, rectHeight * (hasKevlar and 0 or 1) - 1))
							lll11ll1lll.armorb.Size = L_5_.round(Vector2.new(2, hasKevlar and rectHeight + 2 or 0))
							lll11ll1lll.armorbo.Position = L_5_.round(rectMin + Vector2.new(-barOffset, -1))
							lll11ll1lll.armorbo.Size = L_5_.round(Vector2.new(2, rectHeight + 2))
							lll11ll1lll.armorb.Color = library_flags["armorBarColor"]
						end
					end;
					if L_1725_ then
						lll11ll1lll.boxoutline.Position = L_5_.round(rectMin)
						lll11ll1lll.boxoutline.Size = L_5_.round(rectSize)
						lll11ll1lll.box.Position = L_5_.round(rectMin)
						lll11ll1lll.box.Size = L_5_.round(rectSize)
						lll11ll1lll.boxfill.Visible = library_flags["Box Fill"] and true or false
						if lll11ll1lll.boxfill.Visible then

							local t = math.floor(lll11ll1lll.box.Thickness / 2) + 1
							lll11ll1lll.boxfill.Position = lll11ll1lll.box.Position + Vector2.new(t, t)
							lll11ll1lll.boxfill.Size = lll11ll1lll.box.Size - Vector2.new(t * 2, t * 2)
							lll11ll1lll.boxfill.Color = library_flags["boxFillColor"] or Color3.fromRGB(255,255,255)
							local fillTrans = L_5_.options["Box Fill"] and L_5_.options["Box Fill"].trans or 0.5
							lll11ll1lll.boxfill.Transparency = math.clamp(1 - fillTrans, 0, 1)
						end
					else
						lll11ll1lll.boxfill.Visible = false
					end;
					local _targetData = L_52_[L_1705_.Name]
					if _targetData and _targetData.TargetESP then
						lll11ll1lll.box.Color = library_flags["Target Box Color"]
						lll11ll1lll.text.Color = library_flags["Target Name Color"]
						lll11ll1lll.weapon.Color = library_flags["Target Weapon Color"]
						lll11ll1lll.tracer.Color = library_flags["Target Tracer Color"]
						lll11ll1lll.healthb.Color = library_flags["Target Health Bar Color"]
					else
						lll11ll1lll.box.Color = library_flags["boxESPcolor"]
						lll11ll1lll.text.Color = library_flags["nameESPcolor"]
						lll11ll1lll.weapon.Color = library_flags["weaponESPcolor"]
						lll11ll1lll.tracer.Color = library_flags["tracersColor"]
						lll11ll1lll.healthb.Color = library_flags["healthBar"]
					end;
					if library_flags["Skeleton ESP"] and L_1705_ and L_1705_.Character then
						local char = L_1705_.Character
						local skelColor = library_flags["skeletonColor"] or lll11ll1lll.box.Color

						local idx = 0
						for _, part in char:GetChildren() do
							if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart"
								and part.Name ~= "Gun" and part.Name ~= "BackC4" and part.Name ~= "HeadHB" then
								local weld = part:FindFirstChildOfClass("Motor6D")
								if weld and weld.Part0 and weld.Part1 then
									idx = idx + 1
									local ln = lll11ll1lll.skelLine(idx)
									local p0, v0 = L_34_:WorldToViewportPoint(weld.Part0.Position)
									local p1, v1 = L_34_:WorldToViewportPoint(weld.Part1.Position)
									if v0 and v1 then
										ln.From = Vector2.new(math.floor(p0.X), math.floor(p0.Y))
										ln.To = Vector2.new(math.floor(p1.X), math.floor(p1.Y))
										ln.Color = skelColor
										ln.Visible = true
									else
										ln.Visible = false
									end
								end
							end
						end
						lll11ll1lll.skelCount = idx

						for i = idx + 1, #lll11ll1lll.skeleton do
							lll11ll1lll.skeleton[i].Visible = false
						end
					else
						if lll11ll1lll.skeleton then
							for l111lll1, l1l1ll1ll1 in lll11ll1lll.skeleton do
								l1l1ll1ll1.Visible = false
							end
						end
					end
				else
					lll11ll1lll.text.Visible = library_flags["Dropped Weapon ESP"]
					lll11ll1lll.text.Color = library_flags["dropESPcolor"]
				end;
				local L_1717_ = L_1704_ and l1ll11 or lll11ll1lll.object.Name;
				local L_1718_ = library_flags["Outline"]
				lll11ll1lll.text.Position = Vector2.new(L_1709_.X, L_1709_.Y - 15)
				lll11ll1lll.text.Font = fonts[L_1715_]
				lll11ll1lll.text.Outline = L_1718_;
				lll11ll1lll.weapon.Position = L_5_.round(Vector2.new(L_1709_.X, L_1711_.Y + 3))
				lll11ll1lll.weapon.Outline = L_1718_;
				lll11ll1lll.weapon.Font = fonts[L_1715_]
				if L_1704_ and lll11ll1lll.icon then
					local showIcon = library_flags["Weapon Icon ESP"] and true or false
					lll11ll1lll.icon.Visible = showIcon
					if showIcon then
						lll11ll1lll.icon.Image = GetIcon.getWeaponOfKiller(L_1716_)
						local iconScale = library_flags["espIconScale"] or 40
						local boxHeight = math.abs(L_1711_.Y - L_1709_.Y)
						local scaleFactor = math.clamp(boxHeight / 110, 0.4, 1.0)
						local w = (iconScale * 2.4) * scaleFactor
						local h = iconScale * scaleFactor
						lll11ll1lll.icon.Size = UDim2.new(0, w, 0, h)
						lll11ll1lll.icon.AnchorPoint = Vector2.new(0.5, 1.0)
						lll11ll1lll.icon.Position = UDim2.new(0, L_1709_.X, 0, L_1709_.Y - 6)
						lll11ll1lll.weapon.Position = L_5_.round(Vector2.new(L_1709_.X, L_1711_.Y + 3))
						lll11ll1lll.icon.Visible = false
					end
				end
				local armorText = ""
				if L_1704_ and L_1705_ and L_1705_:FindFirstChild("Kevlar") then
					local hasHelmet = L_1705_:FindFirstChild("Helmet") and true or false
					armorText = hasHelmet and " [HK]" or " [K]"
				end
				local L_1719_ = library_flags["Text Mode"]
				local _armorSuffix = library_flags["Armor ESP"] and armorText or ""
				local _nameText = L_1717_ .. _armorSuffix
				if L_1719_ == "Upper" then
					lll11ll1lll.text.Text = string.upper(_nameText)
					lll11ll1lll.weapon.Text = string.upper(L_1716_)
				elseif L_1719_ == "Lower" then
					lll11ll1lll.text.Text = string.lower(_nameText)
					lll11ll1lll.weapon.Text = string.lower(L_1716_)
				else
					lll11ll1lll.text.Text = _nameText
					lll11ll1lll.weapon.Text = L_1716_
				end

				if lll11ll1lll.flags then
					if library_flags["Flags ESP"] and L_1705_ then
						local fl = {}
						local ch = L_1705_.Character
						local _sel = library_flags["flagsList"]
						local function _on(n) return (type(_sel) ~= "table") or _sel[n] end
						local hasKev = L_1705_:FindFirstChild("Kevlar") and L_1705_.Kevlar.Value > 0
						if hasKev then
							if L_1705_:FindFirstChild("Helmet") then if _on("Helmet") then fl[#fl+1] = "Helmet" end elseif _on("Armored") then fl[#fl+1] = "Armored" end
						elseif _on("Unarmored") then
							fl[#fl+1] = "Unarmored"
						end
						if _on("Defuser") and L_1705_:FindFirstChild("DefuseKit") then fl[#fl+1] = "Defuser" end
						if _on("Bomb") and ((workspace:FindFirstChild("Status") and workspace.Status:FindFirstChild("HasBomb") and workspace.Status.HasBomb.Value == L_1705_.Name) or (ch and ch:FindFirstChild("BackC4") and ch.BackC4.Transparency < 1)) then
							fl[#fl+1] = "Bomb"
						end
						if ch then
							local g = ch:FindFirstChild("Gun")
							if _on("Scoped") and g and g:FindFirstChild("Scoped") and g:FindFirstChild("RifleThing") == nil then fl[#fl+1] = "Scoped" end
							if _on("Planting") and g and g:FindFirstChild("Planting") then fl[#fl+1] = "Planting" end
							local hum = ch:FindFirstChild("Humanoid")
							if _on("Slowed") and hum and hum.WalkSpeed and hum.WalkSpeed < 12 and hum.WalkSpeed > 0 then fl[#fl+1] = "Slowed" end
						end
						if #fl > 0 then
							lll11ll1lll.flags.Text = table.concat(fl, "\n")
							lll11ll1lll.flags.Font = fonts[L_1715_]
							lll11ll1lll.flags.Outline = L_1718_
							lll11ll1lll.flags.Color = library_flags["flagsESPcolor"] or Color3.fromRGB(255, 255, 255)
							lll11ll1lll.flags.Position = Vector2.new(L_1709_.X + L_1713_ / 2 + 6, L_1709_.Y)
							lll11ll1lll.flags.Visible = true
						else
							lll11ll1lll.flags.Visible = false
						end
					else
						lll11ll1lll.flags.Visible = false
					end
				end
			else
				lll11ll1lll.invis()
			end
		end
	else
		if not invissed then
			invissed = true;
			for l1111l1, l11111llll1 in next, L_56_ do
				l11111llll1.invis()
			end
		end
	end;
	for l1111ll1l1, l1l11l11111l in next, L_30_:GetPlayers() do
		if alive(l1l11l11111l) then
			env.oldPositions[l1l11l11111l.Name] = l1l11l11111l.Character.HumanoidRootPart.Position
		end;
		if library_flags["Resolve Angles"] then
			if teamCheck(l1l11l11111l, L_37_) and l1l11l11111l.Character and l1l11l11111l.Character:FindFirstChild("UpperTorso") and l1l11l11111l.Character.UpperTorso:FindFirstChild("Waist") then
				l1l11l11111l.Character.UpperTorso.Waist.C0 = CFrame.Angles(0, 0, 0)
			end
		end
	end;
	if library_flags["Grenade Area"] and workspace["Ray_Ignore"]:FindFirstChild("Fires") then
		for ll111l111, llll11 in next, workspace["Ray_Ignore"].Fires:GetChildren() do
			pcall(function()
				if not llll11:FindFirstChild("Part") then
					local L_1736_ = library_flags["areaColor"]
					local L_1737_ = Instance.new("Part", llll11)
					local firePos = (llll11:IsA("BasePart") and llll11.Position) or (llll11:IsA("Model") and llll11:GetPivot().Position) or Vector3.new(0, 0, 0)
					L_1737_.Position = firePos;
					L_1737_.Color = Color3.fromRGB(L_1736_.R / 4, L_1736_.G / 4, L_1736_.B / 4)
					L_1737_.Size = Vector3.new(0.15, 1, 1)
					L_1737_.Shape = "Cylinder"
					L_1737_.Material = "Neon"
					L_1737_.Transparency = 0.5;
					L_1737_.Orientation = Vector3.new(0, 0, 90)
					L_1737_.CanCollide = false;
					L_1737_.Anchored = true;
					local L_1738_ = L_27_:Create(L_1737_, TweenInfo.new(1.5), {
						Size = Vector3.new(0.15, 24, 24),
						Color = L_1736_
					})
					L_1738_:Play()
				end
			end)
		end
	end;
	L_57_ = getWeaponInfo()
	if library_flags["Bunny Hop"] and L_57_.alive and not L_54_ then
		local L_1739_ = L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart")
		local L_1740_ = L_48_;
		local L_1741_;
		local L_1742_;
		if L_1739_ then
			L_1741_ = L_32_.Character.HumanoidRootPart.CFrame.LookVector;
			L_1742_ = L_1739_.Position
		end;
		if library_flags["Override Game Movement"] and not edgebugDebounce then
			return
		end;
		local hum = L_32_.Character:FindFirstChild("Humanoid")
		if not L_25_:GetFocusedTextBox() and L_1739_ and L_25_:IsKeyDown(Enum.KeyCode.Space) and hum and hum:GetState() ~= Enum.HumanoidStateType.Climbing then
			L_53_ = true;
			local baseSpeed = library_flags["Speed Value"] or 50
			if not env.bhopSpeed then env.bhopSpeed = baseSpeed end
			if env.bhopSpeed < baseSpeed then env.bhopSpeed = baseSpeed end
			local isAutoHop = (library_flags["Bunny Hop Method"] == "Auto Hop")
			local strafing = false
			if library_flags["Auto Strafe"] and isAutoHop then
				local hum = L_32_.Character.Humanoid
				local state = hum:GetState()
				if state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Jumping then
					local mouseDelta = L_25_:GetMouseDelta()
					if math.abs(mouseDelta.X) > 0.5 then
						strafing = true
						if isAutoHop then
							local rawGain = math.abs(mouseDelta.X) * 0.005
							local clampedGain = math.min(rawGain, 0.15)
							env.bhopSpeed = math.min(env.bhopSpeed + clampedGain, baseSpeed + 25)
							local camLook = L_34_.CFrame.LookVector
							local rightVec = Vector3.new(-camLook.Z, 0, camLook.X)
							local strafeDir = mouseDelta.X > 0 and rightVec or -rightVec
							local currentVel = L_1739_.AssemblyLinearVelocity
							local currentVelXZ = Vector3.new(currentVel.X, 0, currentVel.Z)
							local newVelXZ = currentVelXZ + (strafeDir * 1.5)
							if newVelXZ.Magnitude > 0 then
								newVelXZ = newVelXZ.Unit * env.bhopSpeed
							end
							L_1739_.AssemblyLinearVelocity = Vector3.new(newVelXZ.X, currentVel.Y, newVelXZ.Z)
						else
							local camLook = L_34_.CFrame.LookVector
							local rightVec = Vector3.new(-camLook.Z, 0, camLook.X)
							local strafeDir = mouseDelta.X > 0 and rightVec or -rightVec
							local currentVel = L_1739_.AssemblyLinearVelocity
							L_1739_.AssemblyLinearVelocity = Vector3.new(
								currentVel.X + strafeDir.X * 0.7,
								currentVel.Y,
								currentVel.Z + strafeDir.Z * 0.7
							)
						end
					end
				end
			end
			if isAutoHop and not strafing and env.bhopSpeed > baseSpeed then
				env.bhopSpeed = math.max(env.bhopSpeed - 0.5, baseSpeed)
			elseif not isAutoHop then
				env.bhopSpeed = baseSpeed
			end
			local L_1743_ = isAutoHop and env.bhopSpeed or baseSpeed
			if library_flags["Bunny Hop Method"] == "CFrame" or library_flags["Bunny Hop Method"] == "Velocity" then
				L_1740_ = L_25_:IsKeyDown(Enum.KeyCode.W) and L_1740_ + L_1741_ or L_1740_;
				L_1740_ = L_25_:IsKeyDown(Enum.KeyCode.S) and L_1740_ - L_1741_ or L_1740_;
				L_1740_ = L_25_:IsKeyDown(Enum.KeyCode.D) and L_1740_ + Vector3.new(- L_1741_.Z, 0, L_1741_.X) or L_1740_;
				L_1740_ = L_25_:IsKeyDown(Enum.KeyCode.A) and L_1740_ + Vector3.new(L_1741_.Z, 0, - L_1741_.X) or L_1740_;
				if library_flags["Bunny Hop Method"] == "CFrame" and L_1740_ ~= L_48_ then
					local cfSpeed = L_1743_ / 300;
					L_1740_ = L_1740_.Unit;
					L_32_.Character.HumanoidRootPart.CFrame = L_32_.Character.HumanoidRootPart.CFrame + Vector3.new(L_1740_.X * cfSpeed, 0, L_1740_.Z * cfSpeed)
					L_32_.Character.Humanoid.Jump = true;
					return
				end;
				if not strafing then
					local L_1744_ = L_25_:IsKeyDown(Enum.KeyCode.S) or L_25_:IsKeyDown(Enum.KeyCode.D) or L_25_:IsKeyDown(Enum.KeyCode.A)
					if L_1740_.Unit.X == L_1740_.Unit.X and not library_flags["Auto Strafe"] or L_1740_.Unit.X == L_1740_.Unit.X and library_flags["Auto Strafe"] and L_1744_ then
						L_1740_ = L_1740_.Unit;
						L_1739_.AssemblyLinearVelocity = Vector3.new(L_1740_.X * L_1743_, L_1739_.AssemblyLinearVelocity.Y, L_1740_.Z * L_1743_)
					elseif library_flags["Auto Strafe"] and not L_25_:IsKeyDown(Enum.KeyCode.S) and not L_25_:IsKeyDown(Enum.KeyCode.D) and not L_25_:IsKeyDown(Enum.KeyCode.A) then
						L_1740_ = L_1740_ + L_1741_;
						L_1740_ = L_1740_.Unit;
						L_1739_.AssemblyLinearVelocity = Vector3.new(L_1740_.X * L_1743_, L_1739_.AssemblyLinearVelocity.Y, L_1740_.Z * L_1743_)
						L_32_.Character.Humanoid:MoveTo(L_1742_ + L_1741_)
					end;
				end
				last = L_1739_.AssemblyLinearVelocity
			elseif library_flags["Bunny Hop Method"] == "A/D" then
				local currentVel = L_1739_.AssemblyLinearVelocity
				local flatVel = Vector3.new(currentVel.X, 0, currentVel.Z)
				
				local camCF = L_34_.CFrame
				local look = camCF.LookVector
				local right = camCF.RightVector
				local flatLook = Vector3.new(look.X, 0, look.Z).Unit
				local flatRight = Vector3.new(right.X, 0, right.Z).Unit
				
				local baseSpeed = library_flags["Speed Value"] or 50
				local speed = math.max(flatVel.Magnitude, baseSpeed)
				
				local moveDir = flatLook
				if L_25_:IsKeyDown(Enum.KeyCode.W) then moveDir = flatLook end
				if L_25_:IsKeyDown(Enum.KeyCode.S) then moveDir = -flatLook end
				
				local currentDir = flatVel.Magnitude > 1 and flatVel.Unit or moveDir
				
				local turnRate = 0.08
				if L_25_:IsKeyDown(Enum.KeyCode.A) then
					currentDir = (currentDir - flatRight * turnRate).Unit
					speed = speed + 0.5
				end
				if L_25_:IsKeyDown(Enum.KeyCode.D) then
					currentDir = (currentDir + flatRight * turnRate).Unit
					speed = speed + 0.5
				end
				
				if speed > (baseSpeed * 2) then speed = baseSpeed * 2 end
				
				local newVel = currentDir * speed
				L_1739_.AssemblyLinearVelocity = Vector3.new(newVel.X, currentVel.Y, newVel.Z)
				L_32_.Character.Humanoid.Jump = true
				last = L_1739_.AssemblyLinearVelocity
			elseif library_flags["Bunny Hop Method"] == "Directional" or library_flags["Bunny Hop Method"] == "Directional 2" or library_flags["Bunny Hop Method"] == "Gyro" then
				local add = 0
				local keyHeld = false
				if library_flags["Bunny Hop Method"] == "Directional" or library_flags["Bunny Hop Method"] == "Directional 2" then
					if L_25_:IsKeyDown(Enum.KeyCode.W) or L_25_:IsKeyDown(Enum.KeyCode.A) or L_25_:IsKeyDown(Enum.KeyCode.S) or L_25_:IsKeyDown(Enum.KeyCode.D) then keyHeld = true end
					if L_25_:IsKeyDown(Enum.KeyCode.A) then add = 90 end
					if L_25_:IsKeyDown(Enum.KeyCode.S) then add = 180 end
					if L_25_:IsKeyDown(Enum.KeyCode.D) then add = 270 end
					if L_25_:IsKeyDown(Enum.KeyCode.A) and L_25_:IsKeyDown(Enum.KeyCode.W) then add = 45 end
					if L_25_:IsKeyDown(Enum.KeyCode.D) and L_25_:IsKeyDown(Enum.KeyCode.W) then add = 315 end
					if L_25_:IsKeyDown(Enum.KeyCode.D) and L_25_:IsKeyDown(Enum.KeyCode.S) then add = 225 end
					if L_25_:IsKeyDown(Enum.KeyCode.A) and L_25_:IsKeyDown(Enum.KeyCode.S) then add = 145 end
				end
				L_32_.Character.Humanoid.Jump = true
				if not strafing and (not keyHeld and library_flags["Bunny Hop Method"] == "Directional_OLD") then
				elseif not strafing then
					local camCF = L_34_.CFrame
					local _, camY, _ = camCF:ToOrientation()
					local rot = CFrame.new(camCF.Position) * CFrame.Angles(0, camY, 0) * CFrame.Angles(0, math.rad(add), 0)
					local currentFlatSpeed = Vector3.new(L_1739_.AssemblyLinearVelocity.X, 0, L_1739_.AssemblyLinearVelocity.Z).Magnitude
					local appliedSpeed = math.max(currentFlatSpeed, L_1743_)
					if not surfing and not env.pixelSurfTouching then
						if library_flags["Bunny Hop Method"] == "Gyro" or (library_flags["Bunny Hop Method"] == "Directional" and keyHeld) then
							if not env.bhopGyro or not pcall(function() return env.bhopGyro.Parent end) then
								env.bhopGyro = Instance.new("BodyVelocity")
								env.bhopGyro.Parent = L_32_.Character:FindFirstChild("UpperTorso") or L_1739_
							end
							local bv = env.bhopGyro
							bv.MaxForce = Vector3.new(500000, 0, 500000)
							bv.Velocity = Vector3.new(rot.LookVector.X, 0, rot.LookVector.Z) * appliedSpeed
							
							if env.bhopCleanTimer then task.cancel(env.bhopCleanTimer) end
							env.bhopCleanTimer = task.delay(0.1, function()
								if env.bhopGyro then
									pcall(function() env.bhopGyro:Destroy() end)
									env.bhopGyro = nil
								end
							end)
						else
							if env.bhopGyro and library_flags["Bunny Hop Method"] == "Directional" then
								pcall(function() env.bhopGyro:Destroy() end)
								env.bhopGyro = nil
							end
							L_1739_.AssemblyLinearVelocity = Vector3.new(rot.LookVector.X * appliedSpeed, L_1739_.AssemblyLinearVelocity.Y, rot.LookVector.Z * appliedSpeed)
						end
					else
					    if env.bhopGyro then
					        pcall(function() env.bhopGyro:Destroy() end)
					        env.bhopGyro = nil
					    end
					end
				end 
				last = L_1739_.AssemblyLinearVelocity
			end;
			L_32_.Character.Humanoid.Jump = true
		else
			if L_53_ and library_flags["Maintain Velocity"] then
				local L_1745_ = 0;
				L_54_ = true;
				repeat
					wait()
					L_1745_ = L_1745_ + 1;
					local L_1746_ = L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart")
					if L_1746_ then
						L_1746_.AssemblyLinearVelocity = Vector3.new(last.X, L_1746_.AssemblyLinearVelocity.Y, last.Z)
					end
				until not L_57_.alive or L_25_:IsKeyDown(Enum.KeyCode.Space) or L_32_.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall or L_32_.Character.Humanoid:GetState() == Enum.HumanoidStateType.Landed or L_1745_ == 15;
				last = Vector3.new()
				L_54_ = false
				env.longJumpDebounce = false
			end;
			L_53_ = false
		end
	end;
	pcall(function()
		local uis = game:GetService("UserInputService")
		if library_flags["Jetpack"] and env.jetpackBindHeld then
			local hrp = L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local speedLimit = library_flags["jetpackSpeed"] or 35
				local currentY = hrp.AssemblyLinearVelocity.Y
				if currentY < 0 then currentY = 0 end
				hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, math.min(currentY + 1.2, speedLimit), hrp.AssemblyLinearVelocity.Z)
			end
		end

		local isMoveHeld = uis:IsKeyDown(Enum.KeyCode.W) or uis:IsKeyDown(Enum.KeyCode.S) or (library_flags["Auto Pixel Surf"] and (uis:IsKeyDown(Enum.KeyCode.A) or uis:IsKeyDown(Enum.KeyCode.D)))
		local isBindHeld = env.surfingBindHeld
		local hum = L_32_.Character and L_32_.Character:FindFirstChild("Humanoid")
		local hrp = L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart")
		local isInAir = hum and (hum:GetState() == Enum.HumanoidStateType.Freefall or hum:GetState() == Enum.HumanoidStateType.Jumping or hum.FloorMaterial == Enum.Material.Air)
		local autoSurfAllowed = library_flags["Auto Pixel Surf"] and isInAir
		local bv = hrp and hrp:FindFirstChild("PixelSurfVelocity")
		if hrp and not bv then
			bv = Instance.new("BodyVelocity")
			bv.Name = "PixelSurfVelocity"
			bv.MaxForce = Vector3.new(0, 0, 0)
			bv.Parent = hrp
		end
		if library_flags["Pixelsurf"] and (isBindHeld or autoSurfAllowed) and isMoveHeld and isInAir and L_57_.alive and hrp and bv then
			local wallPart, wallNormal, wallPos = findWallHit()
			env.pixelSurfTouching = wallPart ~= nil
			if wallPart and wallNormal then
			    surfing = true;
				if lastWallNormal and wallNormal:Dot(lastWallNormal) < 0.9 then
					surfing = false
					bv.MaxForce = Vector3.new(0, 0, 0)
					lastWallNormal = nil
					env.pixelSurfTouching = false
					return
				end
				lastWallNormal = wallNormal
				local pspeed = library_flags["pspeed"] or 18
				local moveDir = hum.MoveDirection
				local horizNormal = Vector3.new(wallNormal.X, 0, wallNormal.Z).Unit
				local vel = hrp.AssemblyLinearVelocity
				local horizVel = Vector3.new(vel.X, 0, vel.Z)
				local glideDir = Vector3.new(0,0,0)
				if moveDir.Magnitude > 0.1 then
					local horizMove = Vector3.new(moveDir.X, 0, moveDir.Z).Unit
					local projected = horizMove - horizNormal * horizMove:Dot(horizNormal)
					if projected.Magnitude > 0.01 then
						glideDir = projected.Unit
					end
				else
					if horizVel.Magnitude > 1 then
						local projected = horizVel.Unit - horizNormal * horizVel.Unit:Dot(horizNormal)
						if projected.Magnitude > 0.01 then
							glideDir = projected.Unit
						end
					end
				end
				bv.Velocity = Vector3.new(glideDir.X * pspeed, 0, glideDir.Z * pspeed)
				bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			else
				bv.MaxForce = Vector3.new(0, 0, 0)
				lastWallNormal = nil
				env.pixelSurfTouching = false
			end
		else
			surfing = false;
			if bv then
				bv.MaxForce = Vector3.new(0, 0, 0)
			end
			lastWallNormal = nil
			env.pixelSurfTouching = false
		end
	end)
	if library_flags["Long Jump"] and L_57_.alive then
		local hrp = L_32_.Character and L_32_.Character:FindFirstChild("HumanoidRootPart")
		local hum = L_32_.Character and L_32_.Character:FindFirstChild("Humanoid")
		if hrp and hum then
			local state = hum:GetState()
			local params = RaycastParams.new()
			params.FilterDescendantsInstances = {L_32_.Character}
			params.FilterType = Enum.RaycastFilterType.Exclude
			local hit = workspace:Raycast(hrp.Position, Vector3.new(0, -3.2, 0), params)
			local inAir = (not hit) or state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Jumping
			
			if env.longJumpHold and inAir then
				local ljStuds = library_flags["longJumpStuds"] or 5
				local dir = hum.MoveDirection
				if dir.Magnitude == 0 then
					local flatVel = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
					if flatVel.Magnitude > 0.1 then
						dir = flatVel.Unit
					end
				end
				if dir.Magnitude > 0 then
					local ljSpeed = ljStuds * 3
					
					local now = tick()
					local dt = (env.lastLJTick and (now - env.lastLJTick) < 0.1) and (now - env.lastLJTick) or (1/60)
					env.lastLJTick = now
					hrp.CFrame = hrp.CFrame + Vector3.new(dir.X * ljSpeed, 0, dir.Z * ljSpeed) * dt
					
					env.lastLongJumpTime = tick()
				end
			end
			
			local bv = hrp:FindFirstChild("LJ_BodyVelocity")
			if bv then bv:Destroy() end
		end
	end;
	if L_57_.alive and library_flags["Old Gun Sounds"] then
		replaceAudio(L_57_.name)
	end;
	env.silentAimEnabled = L_57_.alive and not L_57_.melee and L_57_.silentAim;
	if L_25_:IsMouseButtonPressed(0) and env.silentAimEnabled then
		if not env.silentMouseDown then
			env.silentMouseDown = true
			local chance = L_57_.hitchance or 100
			env.silentRollPassed = (chance >= 100) or (math.random(1, 100) <= chance)
		end
		local L_1751_, L_1752_ = getNearest(L_57_.silentFOV or 0, L_38_, library_flags["legitVisOnly"])
		local dz = (L_57_.deadzone or 0) * 2.3
		local fovPx = (L_57_.silentFOV or 0) * 3
		if L_1751_ and L_1752_ > dz and L_1752_ <= fovPx and env.silentRollPassed then
			env.target = getSilentTargetPart(L_1751_.Character)
		else
			env.target = nil
		end
	else
		env.silentMouseDown = false
		env.target = nil
	end;
	if L_57_.alive and L_24_.Weapons:FindFirstChild(L_32_.Character.EquippedTool.Value) then
		local L_1753_ = L_24_.Weapons:FindFirstChild(L_32_.Character.EquippedTool.Value)
		if L_1753_:FindFirstChild("Melee") then
			L_104_ = true
		elseif L_104_ and not knifeDebounce then
			knifeDebounce = true;
			CreateThread(function()
				wait(0.05)
				L_104_ = false;
				knifeDebounce = false
			end)
		end
	end;
	env.holdE = not L_25_:GetFocusedTextBox() and L_25_:IsKeyDown(Enum.KeyCode.E)
	if library_flags["No Crouch Cooldown"] then
		L_36_.crouchcooldown = 0
	end;
	if library_flags["Remove Radio Commands"] then
		L_32_.PlayerGui.GUI.SuitZoom.Visible = false
	end;
	if library_flags["Remove Recoil"] then
		L_36_.RecoilX = 0.1;
		L_36_.RecoilY = 0.1
	end;
	if L_57_.alive then
		L_32_.Character.Humanoid.AutoRotate = true;
	end;
	if L_57_.alive then
		local L_1768_ = not L_57_.melee and library_flags["FOV Circle"] and library_flags["aimbotEnabled"]
		L_113_.Radius = (L_57_.FOV or 0) * 3;
		L_113_.Position = L_1768_ and library_flags["aimbotEnabled"] and Vector2.new(L_34_.ViewportSize.X / 2, L_34_.ViewportSize.Y / 2) or Vector2.new(-2000, -2000)
		L_114_.Radius = (L_57_.silentFOV or 0) * 3;
		L_114_.Position = L_1768_ and L_57_.silentAim and Vector2.new(L_34_.ViewportSize.X / 2, L_34_.ViewportSize.Y / 2) or Vector2.new(-2000, -2000)
	end
end)
;(function()
FiremanConfig = {
    boostForce = 15,
    upwardBoost = 3,
    cooldown = 0.2
}
isOnLadder = false
wasOnLadder = false
lastCooldown = 0
canBoost = false
local function detectLadder(pos)
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    if not char then return false end
    local hum = char:FindFirstChild("Humanoid")
    if not hum then return false end
    return hum:GetState() == Enum.HumanoidStateType.Climbing
end
spaceJustPressed = false
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Space then
        spaceJustPressed = true
        task.delay(0.2, function() spaceJustPressed = false end)
    end
end)
local function getClosestEnemy()
    local localPlr = game.Players.LocalPlayer
    local localChar = localPlr.Character
    if not localChar then return nil end
    local localHrp = localChar:FindFirstChild("HumanoidRootPart")
    if not localHrp then return nil end
    local closest = nil
    local minDist = math.huge
    local currentTeam = localPlr.Team
    for _, plr in game.Players:GetPlayers() do
        if plr ~= localPlr and plr.Character then
            local isE = false
            if currentTeam then
                isE = plr.Team ~= currentTeam
            else
                isE = true 
            end
            pcall(function()
                if plr.Team and currentTeam and plr.Team.Name == currentTeam.Name then
                    isE = false
                end
            end)
            if isE then
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                local hum = plr.Character:FindFirstChild("Humanoid")
                if hrp and hum and hum.Health > 0 then
                    local dist = (localHrp.Position - hrp.Position).Magnitude
                    if dist < minDist then
                        minDist = dist
                        closest = plr
                    end
                end
            end
        end
    end
    return closest, minDist
end
wasRiding = false
game:GetService("RunService").Heartbeat:Connect(function(dt)
    if env.headboundActive then
        local enemy, dist = getClosestEnemy()
        if enemy and dist < 4.5 then
            local char = game.Players.LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hitboxes = enemy.Character:FindFirstChild("Hitboxes")
            local targetHead = (hitboxes and hitboxes:FindFirstChild("HeadHB")) or enemy.Character:FindFirstChild("HeadHB") or enemy.Character:FindFirstChild("Head") or enemy.Character:FindFirstChild("HumanoidRootPart")
            if hrp and targetHead then
                wasRiding = true
                hrp.CFrame = CFrame.new(targetHead.Position + Vector3.new(0, 2.6, 0)) * (hrp.CFrame - hrp.CFrame.Position)
                hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        else
            wasRiding = false
        end
    else
        if wasRiding then
            wasRiding = false
            local char = game.Players.LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChild("Humanoid")
            if hrp and hum then
                local dir = hum.MoveDirection
                if dir.Magnitude < 0.1 then dir = hrp.CFrame.LookVector * Vector3.new(1,0,1) end
                if dir.Magnitude > 0 then dir = dir.Unit end
                hrp.AssemblyLinearVelocity = dir * 45 + Vector3.new(0, 22, 0)
            end
        end
    end
    if not env.fmActiveHold then
        canBoost = false
        env.fmTriggered = false
        wasOnLadder = false
        return
    end
    local plr = game.Players.LocalPlayer
    local char = plr.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    if not hrp or not hum then return end
    wasOnLadder = isOnLadder
    isOnLadder = detectLadder()
    local vel = hrp.AssemblyLinearVelocity
    if isOnLadder and library_flags["Fireman"] then
        local dir = hum.MoveDirection
        if dir.Magnitude > 0.1 then
            dir = dir.Unit
            local horizontalVel = Vector3.new(vel.X, 0, vel.Z)
            local horizontalSpeed = horizontalVel.Magnitude
            local boostedHorizontal = dir * math.max(horizontalSpeed, 16)
            local verticalBoost = vel.Y * 2.5
            hrp.AssemblyLinearVelocity = Vector3.new(boostedHorizontal.X, verticalBoost, boostedHorizontal.Z)
        end
        env.fmTriggered = false
        canBoost = true
    elseif wasOnLadder and not isOnLadder and canBoost and library_flags["Fireman"] then
        if (tick() - lastCooldown) > FiremanConfig.cooldown then
            lastCooldown = tick()
            canBoost = false
            local dir = hum.MoveDirection
            if dir.Magnitude < 0.1 then
                dir = hrp.CFrame.LookVector * Vector3.new(1,0,1)
            end
            if dir.Magnitude > 0 then dir = dir.Unit end
            local speed = (vel * Vector3.new(1, 0, 1)).Magnitude
            local boostVel = dir * (speed + FiremanConfig.boostForce)
            local verticalBoost = vel.Y < 0 and FiremanConfig.upwardBoost or 15
            hrp.AssemblyLinearVelocity = Vector3.new(boostVel.X, verticalBoost, boostVel.Z)
            env.fmTriggered = true
            task.delay(0.5, function() 
                env.fmTriggered = false
                canBoost = false
            end)
        end
    else
        if not isOnLadder then
            canBoost = false
        end
        if not wasOnLadder then
            env.fmTriggered = false
        end
    end
end)
end)();
(function()
	local RS = game:GetService("RunService")
	local hitRemote = L_40_
	local localPlr = L_32_
	local players = L_30_
	local cam = L_34_
	RS.Heartbeat:Connect(function()
		local loopKills = library_flags["PlayerLoopKills"]
		local hasLoopKill = false
		if loopKills then
			for k, v in loopKills do
				if v then hasLoopKill = true; break end
			end
		end
		if not library_flags["KillAllAuto"] and not hasLoopKill then return end
		local char = localPlr.Character
		if not char then return end
		local hum = char:FindFirstChild("Humanoid")
		if not hum or hum.Health <= 0 then return end
		local gun = char:FindFirstChild("Gun")
		local eqTool = char:FindFirstChild("EquippedTool")
		if not gun or not eqTool then return end
		local gunName = "AWP"
		local gunRef = gun
		local rsWeapons = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons")
		local awpFolder = rsWeapons and rsWeapons:FindFirstChild("AWP")
		if awpFolder then gunRef = awpFolder end
		local camPos = cam.CFrame.p
		local srvTime = workspace:GetServerTimeNow()
		local burstCount = 3
		local nanBypass = true
		for _, plr in players:GetPlayers() do
			if plr == localPlr then continue end
			local isLk = loopKills and loopKills[plr.Name]
			if not isLk then
				if not library_flags["KillAllAuto"] then continue end
				if not teamCheck(plr, L_39_) then continue end
			end
			local pChar = plr.Character
			if not pChar then continue end
			local hitboxes = pChar:FindFirstChild("Hitboxes")
			local head = (hitboxes and hitboxes:FindFirstChild("HeadHB")) or pChar:FindFirstChild("HeadHB") or pChar:FindFirstChild("Head")
			local pHum = pChar:FindFirstChild("Humanoid")
			if not head or not pHum or pHum.Health <= 0 then continue end
			for burst = 1, burstCount do
				pcall(function()
					local posArg = nanBypass and {X = 0/0, Y = 0/0, Z = 0/0} or encodePos(head.Position)
					hitRemote:FireServer(
						head,
						posArg,
						gunName,
						4096,
						gunRef,
						nil,
						1,
						false,
						true,
						camPos,
						srvTime,
						Vector3.new(0, 1, 0),
						true,
						true,
						true,
						true,
						true,
						nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
					)
				end)
			end
		end
	end)
end)();
(function()
WatermarkGui = Instance.new("ScreenGui")
WatermarkGui.Name = "NativeWatermark"
WatermarkGui.ResetOnSpawn = false
WatermarkGui.IgnoreGuiInset = true
WatermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function()
	if syn and syn.protect_gui then
		syn.protect_gui(WatermarkGui)
	end
end)
WatermarkGui.Parent = game:GetService("CoreGui")
WatermarkGui.Enabled = library_flags and library_flags["configWatermark"] or false
if WatermarkGui.Enabled then
	pcall(function()
		local perf = L_32_.PlayerGui:FindFirstChild("Performance")
		if perf and perf:IsA("ScreenGui") then
			perf.Enabled = false
		end
	end)
	pcall(function()
		game:GetService("GuiService"):SetStatsItemEnabled("FPS", false)
		game:GetService("GuiService"):SetStatsItemEnabled("Ping", false)
	end)
end
task.spawn(function()
	local Container = Instance.new("Frame")
	Container.Name = "Container"
	Container.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Container.BackgroundTransparency = 0.05
	Container.AnchorPoint = Vector2.new(1, 0)
	Container.Position = UDim2.new(1, -15, 0, 30)
	Container.AutomaticSize = Enum.AutomaticSize.X
	Container.Size = UDim2.new(0, 0, 0, 26)
	Container.ClipsDescendants = true
	Container.Parent = WatermarkGui
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 4)
	Corner.Parent = Container
	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color3.fromRGB(45, 45, 45)
	Stroke.Thickness = 1
	Stroke.Parent = Container
	local LogoBG = Instance.new("ImageLabel")
	LogoBG.Name = "LogoBG"
	LogoBG.BackgroundTransparency = 1
	LogoBG.Size = UDim2.new(0, 46, 0, 46)
	LogoBG.Position = UDim2.new(0, 0, 0.5, 0)
	LogoBG.AnchorPoint = Vector2.new(0, 0.5)
	LogoBG.Image = "rbxassetid://133384875688188"
	LogoBG.ImageColor3 = Color3.fromRGB(30, 160, 30)
	LogoBG.ImageTransparency = 0.75
	LogoBG.ZIndex = 0
	LogoBG.Parent = Container
	local Content = Instance.new("Frame")
	Content.Name = "Content"
	Content.BackgroundTransparency = 1
	Content.Size = UDim2.new(0, 0, 1, 0)
	Content.AutomaticSize = Enum.AutomaticSize.X
	Content.Parent = Container
	local Padding = Instance.new("UIPadding")
	Padding.PaddingLeft = UDim.new(0, 8)
	Padding.PaddingRight = UDim.new(0, 8)
	Padding.Parent = Content
	local Layout = Instance.new("UIListLayout")
	Layout.FillDirection = Enum.FillDirection.Horizontal
	Layout.SortOrder = Enum.SortOrder.LayoutOrder
	Layout.VerticalAlignment = Enum.VerticalAlignment.Center
	Layout.Padding = UDim.new(0, 6)
	Layout.Parent = Content
	local T_Clarity = Instance.new("TextLabel")
	T_Clarity.Name = "clarity"
	T_Clarity.BackgroundTransparency = 1
	T_Clarity.AutomaticSize = Enum.AutomaticSize.XY
	T_Clarity.Text = "clarity"
	T_Clarity.TextColor3 = Color3.fromRGB(30, 255, 30)
	T_Clarity.Font = Enum.Font.GothamBold
	T_Clarity.TextSize = 13
	T_Clarity.LayoutOrder = 1
	T_Clarity.ZIndex = 2
	T_Clarity.Parent = Content
	local Sep1 = Instance.new("Frame")
	Sep1.Name = "Sep1"
	Sep1.Size = UDim2.new(0, 1, 0, 12)
	Sep1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Sep1.BorderSizePixel = 0
	Sep1.LayoutOrder = 2
	Sep1.Parent = Content
	local pName = "dev"
	local T_User = Instance.new("TextLabel")
	T_User.Name = "dev"
	T_User.BackgroundTransparency = 1
	T_User.AutomaticSize = Enum.AutomaticSize.XY
	T_User.Text = pName
	T_User.TextColor3 = Color3.fromRGB(180, 180, 180)
	T_User.Font = Enum.Font.GothamSemibold
	T_User.TextSize = 13
	T_User.LayoutOrder = 3
	T_User.Parent = Content
	local Sep2 = Instance.new("Frame")
	Sep2.Name = "Sep2"
	Sep2.Size = UDim2.new(0, 1, 0, 12)
	Sep2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	Sep2.BorderSizePixel = 0
	Sep2.LayoutOrder = 4
	Sep2.Parent = Content
	local T_FPS = Instance.new("TextLabel")
	T_FPS.Name = "FPS"
	T_FPS.BackgroundTransparency = 1
	T_FPS.AutomaticSize = Enum.AutomaticSize.XY
	T_FPS.RichText = true
	T_FPS.Text = "<b>0</b> <font color=\"#AAAAAA\">fps</font>"
	T_FPS.TextColor3 = Color3.fromRGB(255, 255, 255)
	T_FPS.Font = Enum.Font.Gotham
	T_FPS.TextSize = 13
	T_FPS.LayoutOrder = 5
	T_FPS.Parent = Content
	local dragging, dragInput, dragStart, startPos
	local UserInputService = game:GetService("UserInputService")
	Container.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = Container.Position
		end
	end)
	Container.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			Container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	Container.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
			library_flags["ui_pos_Watermark"] = tostring(Container.Position.X.Scale)..","..tostring(Container.Position.X.Offset)..","..tostring(Container.Position.Y.Scale)..","..tostring(Container.Position.Y.Offset)
		end
	end)
	local RunService = game:GetService("RunService")
	local lastUpdate = tick()
	local frames = 0
	RunService.RenderStepped:Connect(function()
		frames = frames + 1
		local now = tick()
		if now - lastUpdate >= 1 then
			T_FPS.Text = string.format("<b>%d</b> <font color=\"#AAAAAA\">fps</font>", math.floor(frames / (now - lastUpdate)))
			frames = 0
			lastUpdate = now
		end
	end)
end)
end)();
task.spawn(function()
    local cachedObjects = {}
    local lastCacheTime = 0
    local CACHE_INTERVAL = 10 
    while task.wait(1) do
        if not library_flags["spoofName"] then 
            continue 
        end
        local spoofName = library_flags["spoofedNameValue"]
        if not spoofName or spoofName == "" then 
            continue 
        end
        if not L_1218_ then continue end
        local playerName = L_1218_.Name
        local displayName = L_1218_.DisplayName
        local now = tick()
        if now - lastCacheTime > CACHE_INTERVAL then
            lastCacheTime = now
            cachedObjects = {}
            pcall(function()
                for _, v in next, game:GetService("CoreGui"):GetDescendants() do
                    if (v:IsA("TextLabel") or v:IsA("TextBox")) and v.Visible then
                        table.insert(cachedObjects, v)
                    end
                end
                local pg = L_1218_:FindFirstChild("PlayerGui")
                if pg then
                    for _, v in next, pg:GetDescendants() do
                        if (v:IsA("TextLabel") or v:IsA("TextBox")) and v.Visible then
                            table.insert(cachedObjects, v)
                        end
                    end
                end
            end)
        end
        for i = #cachedObjects, 1, -1 do
            local v = cachedObjects[i]
            if not v or not v.Parent then
                table.remove(cachedObjects, i)
            else
                pcall(function()
                    if v.Text:find(playerName) then
                        v.Text = v.Text:gsub(playerName, spoofName)
                    end
                    if displayName and v.Text:find(displayName) then
                        v.Text = v.Text:gsub(displayName, spoofName)
                    end
                end)
            end
        end
    end
end)
task.spawn(function()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local PredictionFolder = Instance.new("Folder")
    PredictionFolder.Name = "GrenadePredictor"
    pcall(function() PredictionFolder.Parent = workspace.Terrain end)
    local gAtts = {}
    local gBeams = {}
    for i = 1, 40 do
        local att = Instance.new("Attachment", PredictionFolder)
        gAtts[i] = att
        if i > 1 then
            local beam = Instance.new("Beam", PredictionFolder)
            beam.Attachment0 = gAtts[i-1]
            beam.Attachment1 = att
            beam.Width0 = 0.2
            beam.Width1 = 0.2
            beam.FaceCamera = true
            beam.Segments = 1
            beam.LightEmission = 1
            beam.LightInfluence = 0
            beam.Transparency = NumberSequence.new(0.2)
            beam.Enabled = false
            gBeams[i-1] = beam
        end
    end
    local gSphere = Instance.new("Part")
    gSphere.Shape = Enum.PartType.Ball
    gSphere.Size = Vector3.new(1.2, 1.2, 1.2)
    gSphere.Material = Enum.Material.Neon
    gSphere.Anchored = true
    gSphere.CanCollide = false
    gSphere.Parent = PredictionFolder
    gSphere.CastShadow = false
    gSphere.Transparency = 1
    local pulseDir = 1
    local pulseVal = 1.0
    local function isHoldingNade()
        local lp = Players.LocalPlayer
        if not lp or not lp.Character then return false end
        local gun = lp.Character:FindFirstChild("Gun")
        if gun and gun:FindFirstChild("Grenade") then return true end
        local eqVal = lp.Character:FindFirstChild("EquippedTool")
        if eqVal and type(eqVal.Value) == "string" then
            local weaponDef = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons")
            if weaponDef then
                local w = weaponDef:FindFirstChild(eqVal.Value)
                if w and w:FindFirstChild("Grenade") then return true end
            end
            local n = eqVal.Value:lower()
            if n:find("flash") or n:find("hegren") or n:find("smoke") or n:find("molotov") or n:find("incen") or n:find("decoy") or n:find("grenade") or n:find("nade") then
                return true
            end
        end
        return false
    end
    local function getNadePosition()
        local cam = workspace.CurrentCamera
        return (cam.CFrame * CFrame.new(0.5, -0.4, -2.5)).Position
    end
    local function getNadeType()
        local lp = Players.LocalPlayer
        if not lp or not lp.Character then return "default" end
        local eqVal = lp.Character:FindFirstChild("EquippedTool")
        if not eqVal or type(eqVal.Value) ~= "string" then return "default" end
        local v = eqVal.Value
        if v == "Molotov" or v == "Incendiary Grenade" then return "molotov" end
        if v == "HE Grenade" then return "he" end
        if v == "Smoke Grenade" then return "smoke" end
        if v == "Flashbang" then return "flash" end
        if v == "Decoy Grenade" then return "decoy" end
        local lv = v:lower()
        if lv:find("molotov") or lv:find("incen") then return "molotov" end
        if lv:find("hegren") or lv == "he grenade" then return "he" end
        if lv:find("smoke") then return "smoke" end
        if lv:find("flash") then return "flash" end
        if lv:find("decoy") then return "decoy" end
        return "default"
    end
    local lmbDown, rmbDown = false, false
    local UIS = game:GetService("UserInputService")
    UIS.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then lmbDown = true end
        if input.UserInputType == Enum.UserInputType.MouseButton2 then rmbDown = true end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then lmbDown = false end
        if input.UserInputType == Enum.UserInputType.MouseButton2 then rmbDown = false end
    end)
    RunService.RenderStepped:Connect(function(dt)
        if not library_flags["grenadePredictor"] or not isHoldingNade() or not (lmbDown or rmbDown) then 
            for _, b in gBeams do b.Enabled = false end
            gSphere.Transparency = 1
            return 
        end
        local lp = Players.LocalPlayer
        local rgb = library_flags["grenadeColor"] or Color3.fromRGB(255, 50, 50)
        local c3 = typeof(rgb) == "Color3" and rgb or Color3.new(rgb[1] or 1, rgb[2] or 0.2, rgb[3] or 0.2)
        for _, b in gBeams do 
            b.Color = ColorSequence.new(c3) 
            b.Enabled = true 
        end
        gSphere.Color = c3
        pulseVal = pulseVal + (pulseDir * dt * 2.5)
        if pulseVal >= 1.6 then pulseDir = -1 end
        if pulseVal <= 0.7 then pulseDir = 1 end
        gSphere.Size = Vector3.new(pulseVal, pulseVal, pulseVal)
        local cam = workspace.CurrentCamera
        local lp = Players.LocalPlayer
        local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        local plrVel = hrp and hrp.AssemblyLinearVelocity or Vector3.new()
        local nadeType = getNadeType()
        local LOOK_SPEED = 100
        local PLR_FACTOR = 1.0
        local UP_BIAS = 12
        local maxBounces, bounceDamping = 3, 0.42
        if nadeType == "molotov" then
            maxBounces, bounceDamping = 5, 0.4
        elseif nadeType == "he" then
            maxBounces, bounceDamping = 4, 0.55
        elseif nadeType == "smoke" then
            maxBounces, bounceDamping = 3, 0.38
        elseif nadeType == "flash" then
            maxBounces, bounceDamping = 4, 0.55
        elseif nadeType == "decoy" then
            maxBounces, bounceDamping = 3, 0.42
        end
        local velocity = cam.CFrame.LookVector * LOOK_SPEED + plrVel * PLR_FACTOR + Vector3.new(0, UP_BIAS, 0)
        local startPos = getNadePosition()
        local grav = Vector3.new(0, -workspace.Gravity, 0)
        local tStep = 1/60
        local maxSteps = 240
        local currentPos = startPos
        local rp = RaycastParams.new()
        local filterList = {lp.Character, workspace:FindFirstChild("Ray_Ignore"), PredictionFolder}
        local mapObj = workspace:FindFirstChild("Map")
        if mapObj then
            local clips = mapObj:FindFirstChild("Clips")
            if clips then table.insert(filterList, clips) end
        end
        rp.FilterDescendantsInstances = filterList
        rp.FilterType = Enum.RaycastFilterType.Exclude
        local bounces = 0
        local pointCount = 1
        gAtts[1].WorldPosition = startPos
        local samplePeriod = 3
        local stepIdx = 0
        for s = 1, maxSteps do
            local nextVel = velocity + (grav * tStep)
            local moveDelta = (velocity + nextVel) * 0.5 * tStep
            local nextPos = currentPos + moveDelta
            local ray = workspace:Raycast(currentPos, nextPos - currentPos, rp)
            if ray then
                bounces = bounces + 1
                nextPos = ray.Position + ray.Normal * 0.05
                local normal = ray.Normal
                local reflected = nextVel - (2 * nextVel:Dot(normal) * normal)
                velocity = reflected * bounceDamping
                local isFloor = normal.Y > 0.6
                if (nadeType == "molotov" and isFloor) or bounces >= maxBounces or velocity.Magnitude < 5 then
                    pointCount = pointCount + 1
                    if pointCount <= 40 then
                        gAtts[pointCount].WorldPosition = nextPos
                        gBeams[pointCount-1].Transparency = NumberSequence.new(0.15 + (pointCount/40)*0.85)
                    end
                    currentPos = nextPos
                    break
                end
            else
                velocity = nextVel
            end
            currentPos = nextPos
            stepIdx = stepIdx + 1
            if stepIdx % samplePeriod == 0 or ray then
                pointCount = pointCount + 1
                if pointCount > 40 then break end
                gAtts[pointCount].WorldPosition = nextPos
                gBeams[pointCount-1].Transparency = NumberSequence.new(0.15 + (pointCount/40)*0.85)
            end
        end
        for j = pointCount, 39 do
            if gBeams[j] then gBeams[j].Enabled = false end
        end
        gSphere.CFrame = CFrame.new(currentPos)
        gSphere.Transparency = 0.3
    end)
end)

warn("Script made by freezewo thanks for using report if find bugs in discord server")




task.spawn(function()
L_177_ = setmetatable({ options = setmetatable({}, { __index = function() return {values = {}} end }) }, { __index = function() return function() return L_177_ end end })
env.DemoFlags = env.DemoFlags or {}
LPH_NO_VIRTUALIZE = function(a) return a end
LPH_NO_UPVALUES = function(a) return a end

if game.PlaceId == 101013872711019 then
	repeat
		wait()
	until game:IsLoaded()
	setfpscap(144)
	local L_144_ = game:GetService("ReplicatedStorage")
	local L_145_ = game:GetService("HttpService")
	local L_146_ = game:GetService("UserInputService")
	local L_147_ = game:GetService("Lighting")
	local L_148_ = game:GetService("TweenService")
	local L_149_ = game:GetService("Players")
	local L_150_ = workspace.settings;
	local L_151_ = L_149_.LocalPlayer;
	local L_152_ = workspace.CurrentCamera;
	local L_153_ = L_151_:GetMouse()
	local L_154_ = {}
	local L_155_ = {
		4,
		2,
		1,
		20,
		40
	}
	local L_156_ = {
		0.25,
		0.5,
		1,
		2,
		4
	}
	local L_157_ = {
		4,
		2,
		1,
		0.5,
		0.25
	}
	local L_158_ = {
		"1/4",
		"1/2",
		"1",
		"2",
		"4"
	}
	local L_159_ = false;
	local L_160_ = false;
	local L_161_ = false;
	local L_162_ = ""
	local L_163_ = "freecam"
	local L_164_ = nil;
	local L_165_ = 3;
	local L_166_ = 0;
	local L_167_ = 0;
	local L_168_;
	local L_169_ = game:GetService("RunService")
	local L_170_ = L_151_:GetMouse()
	local L_171_ = L_147_.Ambient;
	local L_172_ = L_147_.OutdoorAmbient;
	local L_173_ = Instance.new("ColorCorrectionEffect", L_147_)
	repeat
		wait()
	until L_151_.PlayerGui:FindFirstChild("main")
	local L_174_ = L_151_.PlayerGui.main;
	local L_175_ = L_174_;
	local L_176_ = L_175_.settings.outline.main.group;
	L_175_.settings.Position = UDim2.new(0.5, - L_175_.settings.Size.X.Offset / 2, 0.5, - L_175_.settings.Size.Y.Offset / 2)
	function tickToSec(L_220_arg0)
		local L_221_ = tostring(math.floor(math.floor(L_220_arg0 / 32) / 60))
		local L_222_ = tostring(math.floor(L_220_arg0 / 32) - L_221_ * 60)
		L_222_ = # tostring(L_222_) == 1 and "0" .. L_222_ or L_222_;
		return L_221_ .. ":" .. L_222_
	end;
	function extractNumber(L_223_arg0)
		if not L_223_arg0 then
			return 0
		end;
		local L_224_ = ""
		for L_225_forvar0 = 1, string.len(L_223_arg0) do
			local L_226_ = string.sub(L_223_arg0, L_225_forvar0, L_225_forvar0)
			if tonumber(L_226_) then
				L_224_ = L_224_ .. L_226_
			end
		end;
		return tonumber(L_224_)
	end;
	function playAudio(L_227_arg0, L_228_arg1)
		if env.DemoFlags["hide_character_models"] then
			return
		end;
		if ignoreSound then
			return
		end;
		local L_229_ = L_227_arg0:Clone()
		L_229_.Volume = 0.15;
		L_229_.PlaybackSpeed = L_156_[L_165_]
		L_229_.Parent = L_228_arg1;
		L_229_:Play()
		L_229_.Ended:Connect(function()
			if L_229_ then
				L_229_:Destroy()
			end
		end)
	end;
	function hasProperty(L_230_arg0, L_231_arg1)
		return pcall(function()
			_ = L_230_arg0[L_231_arg1]
		end)
	end;
	local L_180_ = {}
	local L_181_ = {}
	local L_182_ = {}
	local L_183_ = {}
	local L_184_ = {}
	local L_185_ = {}
	local L_186_ = 0;
	local L_187_ = false;
	local L_188_ = {
		AWP = {
			magout = 1.5
		}
	}
	local L_189_ = {}
	local L_190_ = require(workspace.Bezier)
	local L_191_ = false;
	local L_192_ = false;
	function count(L_232_arg0)
		a = 0;
		for L_233_forvar0, L_234_forvar1 in next, L_232_arg0 do
			a = a + 1
		end;
		return a
	end;
	function updateKeyframes()
		workspace.camParts:ClearAllChildren()
		if count(L_189_) < 1 or not L_150_.showkeyframes.Value then
			return
		end;
		for L_235_forvar0, L_236_forvar1 in L_189_ do
			if L_235_forvar0 ~= count(L_189_) then
				local L_237_ = L_236_forvar1.cf.p;
				local L_238_ = L_189_[L_235_forvar0 + 1].cf;
				local L_239_ = L_237_.X > L_238_.p.X and L_237_.X or L_238_.p.X;
				local L_240_ = (L_237_.Y + L_238_.p.Y) / 2;
				local L_241_ = L_237_.Z > L_238_.p.Z and L_237_.Z or L_238_.p.Z;
				local L_242_ = L_190_.new(L_237_, Vector3.new(L_239_, L_240_, L_241_), L_238_.p):GetPath(0.15)
				for L_243_forvar0, L_244_forvar1 in L_242_ do
					local L_245_ = Instance.new("Part")
					L_245_.Anchored = true;
					L_245_.Size = Vector3.new(0.3, 0.3, 0.3)
					L_245_.Material = "SmoothPlastic"
					L_245_.Color = Color3.new(0.5, 0.2, 0.7)
					L_245_.CFrame = CFrame.new(L_244_forvar1, L_244_forvar1 + L_238_.LookVector)
					L_245_.Transparency = 0.65;
					L_245_.Parent = workspace.camParts;
					local L_246_ = Instance.new("Part")
					L_246_.Shape = "Cylinder"
					L_246_.Anchored = true;
					L_246_.Size = Vector3.new(0.1, 0.2, 0.1)
					L_246_.Material = "SmoothPlastic"
					L_246_.Color = Color3.new(1, 1, 1)
					L_246_.Position = L_245_.Position + L_245_.CFrame.LookVector / 3.5;
					L_246_.Transparency = 0.75;
					L_246_.Orientation = L_245_.Orientation + Vector3.new(0, 90, 0)
					L_246_.Parent = L_245_
				end
			end;
			wait()
		end
	end;
	local L_193_ = tick()
	local L_194_ = CFrame.new(0, 0, 0)
	local L_195_ = CFrame.Angles(0, 0, 0)
	mgn = 0;
	local L_196_ = {
		0,
		0
	}
	local L_197_ = 0;
	local L_198_ = 0;
	waveScale = 0;
	local L_199_ = {
		aim_amp = 0.5,
		aim_max_change = 4,
		aim_retract = 15,
		aim_max_deg = 20
	}
	local L_200_ = Vector3.new()
	Camera = workspace.CurrentCamera;
	local L_201_ = Drawing.new("Text")
	L_201_.Visible = true;
	L_201_.Position = Vector2.new(100, 100)
	L_201_.Size = 30;
	L_201_.Font = 2;
	L_201_.Text = "tps:"
	L_201_.Color = Color3.new(1, 1, 1)
	L_201_.Visible = false;
	local L_202_ = 0;
	spawn(function()
		while wait(1) do
			L_201_.Text = "tps: " .. tostring(L_202_)
			L_202_ = 0
		end
	end)
	function playTick(L_247_arg0)
		if not L_247_arg0 then
			L_247_arg0 = L_167_
		end;
		if L_150_.keyframing.Value and L_163_ == "freecam" and L_150_.playing.Value then
			if count(L_189_) > 1 then
				if not L_191_ then
					local L_249_, L_250_ = 387420489, nil;
					for L_251_forvar0, L_252_forvar1 in next, L_189_ do
						if L_252_forvar1.tick > L_247_arg0 and L_252_forvar1.tick < L_249_ then
							L_249_, L_250_ = L_252_forvar1.tick, L_252_forvar1.cf
						end
					end;
					if L_250_ then
						L_191_ = true;
						local L_253_ = math.abs(L_247_arg0 - L_249_)
						local L_254_ = L_152_.CFrame.p;
						local L_255_ = L_254_.X > L_250_.p.X and L_254_.X or L_250_.p.X;
						local L_256_ = (L_254_.Y + L_250_.p.Y) / 2;
						local L_257_ = L_254_.Z > L_250_.p.Z and L_254_.Z or L_250_.p.Z;
						local L_258_ = L_190_.new(L_254_, Vector3.new(L_255_, L_256_, L_257_), L_250_.p):GetPath(0.15)
						local L_259_ = 30 * L_156_[L_165_]
						spawn(function()
							warn(L_247_arg0, L_249_)
							warn(L_253_, L_253_ / L_259_, L_253_ / L_259_ / (# L_258_ - 1))
							for L_260_forvar0, L_261_forvar1 in L_258_ do
								if L_260_forvar0 > 1 then
									local L_262_ = TweenInfo.new(L_253_ / L_259_ / (# L_258_ - 1), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
									local L_263_ = L_148_:Create(L_152_, L_262_, {
										CFrame = CFrame.new(L_261_forvar1, L_261_forvar1 + L_250_.LookVector * 10000)
									})
									L_263_:Play()
									if L_260_forvar0 ~= # L_258_ - 1 then
										wait(L_253_ / L_259_ / (# L_258_ - 1))
									end
								end
							end;
							L_191_ = false
						end)
					end
				end
			end
		end;
		workspace.demoModels.nades:ClearAllChildren()
		local L_248_ = L_154_[L_247_arg0]
		if type(L_248_) == "table" then
			for L_265_forvar0, L_266_forvar1 in next, L_248_ do
				if type(L_266_forvar1) ~= "table" or not L_266_forvar1.name then
					continue;
				end;
				if L_266_forvar1.alive then
					local L_267_ = workspace.demoModels:FindFirstChild(L_265_forvar0)
					local L_268_ = workspace.demoModels.weapons:FindFirstChild(L_265_forvar0 .. "_" .. L_266_forvar1.gunName)
					local L_269_ = false;
					local L_270_ = false;
					if not L_267_ then
						L_267_ = L_144_.CharacterModels[L_266_forvar1.plrModel]:Clone()
						L_267_.Name = L_265_forvar0;
						L_267_.Parent = workspace.demoModels;
						L_180_[L_266_forvar1.name] = L_266_forvar1.plrModel;
						L_270_ = true
					end;
					if not L_268_ then
						for L_273_forvar0, L_274_forvar1 in next, workspace.demoModels.weapons:GetChildren() do
							if L_274_forvar1.Name:find(L_265_forvar0) then
								L_274_forvar1:Destroy()
								break
							end
						end;
						if L_144_.Weapons:FindFirstChild(L_266_forvar1.gunName) then
							L_268_ = L_144_.Weapons[L_266_forvar1.gunName].Model:Clone()
							L_268_.Name = L_265_forvar0 .. "_" .. L_266_forvar1.gunName;
							L_268_.Parent = workspace.demoModels.weapons;
							for L_275_forvar0, L_276_forvar1 in next, L_268_:GetDescendants() do
								if L_276_forvar1:IsA("BasePart") then
									L_276_forvar1.Anchored = true;
									if L_144_.Weapons[L_266_forvar1.gunName]:FindFirstChild("Grenade") then
										L_276_forvar1.Transparency = 0
									end
								end
							end
						end;
						L_269_ = true
					end;
					local L_271_ = L_265_forvar0 == L_162_ and L_163_ == "follow" and L_159_ or env.DemoFlags["hide_character_models"]
					if (not L_185_[L_265_forvar0] and L_266_forvar1.scoped or L_185_[L_265_forvar0] and not L_266_forvar1.scoped) and L_268_:FindFirstChild("Zoom") then
						playAudio(L_268_.Zoom, L_164_ and L_271_ and workspace or L_268_:FindFirstChild("Handle") or L_268_:FindFirstChild("Handle2") or nil)
					end;
					L_174_.Scope.Visible = L_266_forvar1.scoped and (L_265_forvar0 == L_162_ and L_159_)
					L_152_.FieldOfView = L_174_.Scope.Visible and 35 or 80;
					if L_163_ == "follow" then
						if L_265_forvar0 == L_162_ then
							if L_266_forvar1.alive then
								L_174_.crosshair.Visible = L_266_forvar1.gunName ~= "AWP" and L_266_forvar1.gunName ~= "Scout" and L_266_forvar1.gunName ~= "G3SG1" and (L_159_ and L_163_ == "follow") and not L_266_forvar1.scoped;
								if L_266_forvar1.localplayer and L_159_ then
									L_174_.hud.Vitals.Visible = true;
									L_174_.hud.AmmoGUI.Visible = true;
									L_174_.hud.Spectate.Visible = false;
									L_174_.hud.Vitals.Health.Text = math.floor(tonumber(L_266_forvar1.health))
									L_174_.hud.Vitals.Armor.Text = math.floor(tonumber(L_266_forvar1.kevlar))
									L_174_.hud.Vitals.HealthB.Fill.Size = UDim2.new(L_266_forvar1.health / 100, 0, 1, 0)
									L_174_.hud.Vitals.ArmorB.Fill.Size = UDim2.new(L_266_forvar1.kevlar / 100, 0, 1, 0)
									L_174_.hud.AmmoGUI.AmmoClip.Text = L_266_forvar1.ammo;
									L_174_.hud.AmmoGUI.AmmoReserve.Text = L_266_forvar1.ammoreserve
								else
									L_174_.hud.Vitals.Visible = false;
									L_174_.hud.AmmoGUI.Visible = false;
									L_174_.hud.Spectate.Visible = true;
									L_174_.hud.Spectate.PlayerBox.BackgroundColor3 = L_266_forvar1.team == "Terrorists" and Color3.fromRGB(245, 205, 48) or Color3.fromRGB(13, 105, 172)
									L_174_.hud.Spectate.PlayerBox.PlayerName.TextColor3 = L_266_forvar1.team == "Terrorists" and Color3.fromRGB(245, 205, 48) or Color3.fromRGB(13, 105, 172)
									L_174_.hud.Spectate.PlayerBox.PlayerName.Text = L_266_forvar1.name;
									L_174_.hud.Spectate.PlayerBox.PlayerIcon.Plr.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(L_266_forvar1.userid) .. "&width=420&height=420&format=png"
									L_174_.hud.Spectate.PlayerBox.GreyPart.PHealth.Text = math.floor(tonumber(L_266_forvar1.health))
									L_174_.hud.Spectate.PlayerBox.GreyPart.WeaponName.Text = L_266_forvar1.gunName
								end
							else
								L_174_.hud.Spectate.Visible = false;
								L_174_.hud.Vitals.Visible = false;
								L_174_.hud.AmmoGUI.Visible = false;
								L_174_.crosshair.Visible = false
							end
						end
					else
						L_174_.hud.Spectate.Visible = false;
						L_174_.hud.Vitals.Visible = false;
						L_174_.hud.AmmoGUI.Visible = false;
						L_174_.crosshair.Visible = false
					end;
					if not env.DemoFlags["show_hud"] then
						L_174_.hud.Spectate.Visible = false;
						L_174_.hud.Vitals.Visible = false;
						L_174_.hud.AmmoGUI.Visible = false
					end;
					if env.DemoFlags["hide_crosshair"] then
						L_174_.crosshair.Visible = false
					end;
					L_187_ = L_174_.Scope.Visible or env.DemoFlags["hide_viewmodel"]
					for L_277_forvar0, L_278_forvar1 in next, L_267_:GetChildren() do
						local L_279_ = nil;
						local L_280_ = nil;
						local L_281_ = nil;
						local L_282_ = nil;
						for L_283_forvar0, L_284_forvar1 in next, L_266_forvar1.partCF do
							L_279_ = L_283_forvar0 == L_278_forvar1.Name and L_278_forvar1 or nil;
							L_280_ = L_279_ and L_284_forvar1 or nil;
							if L_279_ then
								break
							end
						end;
						if L_278_forvar1.ClassName == "Accessory" then
							for L_285_forvar0, L_286_forvar1 in next, L_266_forvar1.hatCF do
								local L_287_ = L_278_forvar1.Handle.ClassName == "Part" and L_278_forvar1.Handle.Mesh.MeshId or L_278_forvar1.Handle.ClassName == "MeshPart" and L_278_forvar1.Handle.MeshId or ""
								L_281_ = L_285_forvar0 == L_287_ and L_278_forvar1 or nil;
								L_282_ = L_281_ and L_286_forvar1 or nil;
								if L_281_ then
									break
								end
							end
						end;
						if L_279_ then
							local L_288_ = L_271_ and "0 0 0 0 0 0 0 0 0 0 0 0" or L_280_:split(" ")
							local L_289_ = TweenInfo.new(L_270_ and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
							local L_290_ = L_148_:Create(L_279_, L_289_, {
								CFrame = CFrame.new(L_288_[1], L_288_[2], L_288_[3], L_288_[4], L_288_[5], L_288_[6], L_288_[7], L_288_[8], L_288_[9], L_288_[10], L_288_[11], L_288_[12])
							})
							L_290_:Play()
							L_279_.Anchored = true
						end;
						if L_281_ then
							local L_291_ = L_271_ and "0 0 0 0 0 0 0 0 0 0 0 0" or L_282_:split(" ")
							local L_292_ = TweenInfo.new(L_270_ and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
							local L_293_ = L_148_:Create(L_281_.Handle, L_292_, {
								CFrame = CFrame.new(L_291_[1], L_291_[2], L_291_[3], L_291_[4], L_291_[5], L_291_[6], L_291_[7], L_291_[8], L_291_[9], L_291_[10], L_291_[11], L_291_[12])
							})
							L_293_:Play()
							L_281_.Handle.Anchored = true
						end
					end;
					if L_268_ and L_144_.Skins:FindFirstChild(L_266_forvar1.gunName) then
						for L_294_forvar0, L_295_forvar1 in next, L_266_forvar1.gunCF do
							local L_296_ = L_268_:FindFirstChild(L_294_forvar0)
							local L_297_ = L_144_.Skins[L_266_forvar1.gunName]:FindFirstChild(L_266_forvar1.skinName) and L_144_.Skins[L_266_forvar1.gunName][L_266_forvar1.skinName]:FindFirstChild(L_294_forvar0, true) or nil;
							if L_296_ then
								local L_298_ = L_271_ and "0 0 0 0 0 0 0 0 0 0 0 0" or L_295_forvar1:split(" ")
								local L_299_ = TweenInfo.new(L_269_ and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
								local L_300_ = L_148_:Create(L_296_, L_299_, {
									CFrame = CFrame.new(L_298_[1], L_298_[2], L_298_[3], L_298_[4], L_298_[5], L_298_[6], L_298_[7], L_298_[8], L_298_[9], L_298_[10], L_298_[11], L_298_[12])
								})
								L_300_:Play()
								if L_297_ then
									L_296_.TextureID = L_297_.Value
								end
							end
						end
					end;
					local L_272_ = L_266_forvar1.gunState;
					if L_272_ ~= "None" then
						local L_301_, L_302_;
						L_302_ = L_164_ and (L_265_forvar0 == L_162_ and L_163_ == "follow" and L_159_) and workspace or L_268_:FindFirstChild("Handle") or L_268_:FindFirstChild("Handle2") or nil;
						if string.find(L_272_, "Fire") or L_272_ == "Stab" then
							L_301_ = L_268_:FindFirstChild("Shoot") or L_268_:FindFirstChild("Shoot1")
							if L_162_ == L_265_forvar0 and L_164_ then
								if L_272_ ~= "Stab" then
									L_200_ = Vector3.new(0, 0.5, 0)
								end;
								local L_303_ = L_164_.Guy:LoadAnimation(L_164_[L_272_:lower()])
								L_303_:Play()
								L_303_:AdjustSpeed(L_156_[L_165_])
							end
						elseif L_272_ == "Reload" then
							if L_162_ == L_265_forvar0 and L_164_ then
								local L_306_ = L_164_.Guy:LoadAnimation(L_164_.reload)
								L_306_:Play()
								L_306_:AdjustSpeed(L_156_[L_165_])
							end;
							local L_304_ = L_268_;
							local L_305_ = L_268_.Name:split("_")[2]
							spawn(function()
								if L_144_.Weapons:FindFirstChild(L_305_) then
									local L_307_ = L_144_.Weapons[L_305_].Model:FindFirstChild("magout")
									local L_308_ = L_144_.Weapons[L_305_].Model:FindFirstChild("magin")
									local L_309_ = L_144_.Weapons[L_305_].Model:FindFirstChild("bolt") or L_144_.Weapons[L_305_].Model:FindFirstChild("slide")
									local L_310_ = L_144_.Weapons[L_305_].Model:FindFirstChild("boltin") or L_144_.Weapons[L_305_].Model:FindFirstChild("slidein")
									if L_307_ and L_308_ and L_309_ and L_310_ then
										playAudio(L_307_, L_302_)
										wait((L_188_[L_305_] and L_188_[L_305_].magout or L_307_.TimeLength * 0.85) * L_157_[L_165_])
										if not L_304_ then
											return
										end;
										playAudio(L_308_, L_302_)
										wait(L_308_.TimeLength * 0.95 * L_157_[L_165_])
										if not L_304_ then
											return
										end;
										playAudio(L_309_, L_302_)
										wait(L_309_.TimeLength * 0.75 * L_157_[L_165_])
										if not L_304_ then
											return
										end;
										playAudio(L_310_, L_302_)
									else
										warn(L_266_forvar1.gunName, "does not have all needed sounds!")
									end
								else
									warn(L_305_, "does not exist [?]", L_268_.Name)
								end
							end)
						elseif L_272_ == "Inspect" then
							if L_162_ == L_265_forvar0 and L_164_ then
								local L_311_ = L_164_.Guy:LoadAnimation(L_164_.inspect)
								L_311_:Play()
								L_311_:AdjustSpeed(L_156_[L_165_])
							end
						end;
						if L_301_ and L_302_ then
							playAudio(L_301_, L_302_)
						end
					end;
					L_200_ = Vector3.new(0, L_200_.Y - 0.075 < 0 and 0 or L_200_.Y - 0.075, 0)
					if L_269_ and L_144_.Weapons:FindFirstChild(L_266_forvar1.gunName) then
						if L_144_.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("Equip") then
							local L_312_ = L_164_ and (L_265_forvar0 == L_162_ and L_163_ == "follow" and L_159_) and L_164_.HumanoidRootPart or L_268_:FindFirstChild("Handle") or L_268_:FindFirstChild("Handle2")
							playAudio(L_144_.Weapons[L_266_forvar1.gunName].Model.Equip, L_312_)
						else
							local L_313_ = L_164_ and (L_265_forvar0 == L_162_ and L_163_ == "follow" and L_159_) and L_164_.HumanoidRootPart or L_268_:FindFirstChild("Handle") or L_268_:FindFirstChild("Handle2")
							local L_314_ = L_144_.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("bolt") or L_144_.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("slide")
							local L_315_ = L_144_.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("boltin") or L_144_.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("slidein")
							if L_314_ and L_315_ then
								spawn(function()
									wait(0.1)
									playAudio(L_314_, L_313_)
									wait(L_314_.TimeLength * 0.75 * L_157_[L_165_])
									playAudio(L_315_, L_313_)
								end)
							end
						end
					end;
					if workspace.demoModels.ragdoll:FindFirstChild(L_265_forvar0) then
						workspace.demoModels.ragdoll[L_265_forvar0]:Destroy()
					end;
					if L_266_forvar1.forcefield and not L_267_:FindFirstChild("ForceField") then
						local L_316_ = Instance.new("ForceField", L_267_)
					elseif L_267_:FindFirstChild("ForceField") and not L_266_forvar1.forcefield then
						L_267_.ForceField:Destroy()
					end;
					if L_266_forvar1.velocity and L_159_ and L_265_forvar0 == L_162_ then
						local L_317_ = tick() - L_193_ > 0.12 and 0.12 or tick() - L_193_;
						L_193_ = tick()
						local L_318_ = L_152_.CFrame.LookVector.magnitude == 0 and 1.0E-4 or L_152_.CFrame.lookVector.magnitude;
						local L_319_ = L_152_.CFrame.LookVector.y;
						local L_320_;
						if L_319_ ~= 0 then
							L_320_ = math.deg(math.asin(math.abs(L_319_) / L_318_)) * math.abs(L_319_) / L_319_
						else
							L_320_ = 0
						end;
						local L_321_ = L_152_.CFrame;
						local L_322_ = L_321_ * CFrame.new(0, 0, -100)
						local L_323_ = math.deg(math.atan2(L_321_.p.x - L_322_.p.x, L_321_.p.z - L_322_.p.z)) + 180;
						local L_324_, L_325_;
						local L_326_, L_327_ = 0, 0;
						L_324_ = math.abs(L_320_ - L_197_)
						if L_324_ ~= 0 then
							L_326_ = (L_320_ - L_197_) / L_324_
						end;
						local L_328_ = {
							math.abs(L_323_ - L_198_),
							360 - math.abs(L_323_ - L_198_)
						}
						if L_323_ == L_198_ then
							L_327_ = 0;
							L_325_ = 0
						elseif L_328_[1] < L_328_[2] then
							L_325_ = L_328_[1]
							L_327_ = (L_323_ - L_198_) / L_328_[1]
						else
							L_325_ = L_328_[2]
							if L_323_ < L_198_ then
								L_327_ = 1
							else
								L_327_ = -1
							end
						end;
						L_197_ = L_320_;
						L_198_ = L_323_;
						L_196_[1] = L_196_[1] / (1 + L_317_ * 15)
						L_196_[2] = L_196_[2] / (1 + L_317_ * 15)
						local L_329_ = L_324_ * L_326_ * 0.5;
						if L_329_ ~= 0 then
							L_196_[1] = L_196_[1] + math.min(4, math.abs(L_329_)) * L_329_ / math.abs(L_329_)
						end;
						local L_330_ = L_325_ * L_327_ * 0.5;
						if L_330_ ~= 0 then
							L_196_[2] = L_196_[2] + math.min(4, math.abs(L_330_)) * L_330_ / math.abs(L_330_)
						end;
						if L_196_[1] ~= 0 then
							L_196_[1] = math.min(20, math.abs(L_196_[1])) * math.abs(L_196_[1]) / L_196_[1]
						end;
						if L_196_[2] ~= 0 then
							L_196_[2] = math.min(20, math.abs(L_196_[2])) * math.abs(L_196_[2]) / L_196_[2]
						end;
						local L_331_ = math.cos(tick() * math.pi * 2.5)
						local L_332_ = 0.05;
						local L_333_ = Vector3.new(L_266_forvar1.velocity[1], L_266_forvar1.velocity[2], L_266_forvar1.velocity[3]).magnitude;
						waveScale = 0.75 * 0.5;
						if mgn < L_333_ then
							mgn = math.min(L_333_, mgn + 1)
						end;
						if mgn > L_333_ then
							mgn = math.max(L_333_, mgn - 1.5)
						end;
						local L_334_ = mgn / 18.35;
						L_194_ = env.fart and CFrame.new() or CFrame.new((0.25 * L_334_ + L_331_ / 10 * L_334_) * waveScale, (0.25 * L_334_ + math.abs(L_331_ / 10) * L_334_) * - waveScale, math.abs(0.25 * L_334_) * waveScale)
						L_195_ = CFrame.Angles(- L_196_[1] / 150, - L_196_[2] / 150, 0)
					end;
					L_181_[L_265_forvar0] = L_266_forvar1.camCF;
					L_183_[L_265_forvar0] = L_266_forvar1.gunName;
					L_182_[L_265_forvar0] = L_266_forvar1.armsModel;
					L_184_[L_265_forvar0] = L_266_forvar1.skinName;
					L_185_[L_265_forvar0] = L_266_forvar1.scoped
				else
					if L_163_ == "follow" and L_265_forvar0 == L_162_ then
						L_174_.hud.Spectate.Visible = false;
						L_174_.hud.Vitals.Visible = false;
						L_174_.hud.AmmoGUI.Visible = false;
						L_174_.crosshair.Visible = false
					end;
					if L_266_forvar1.ragdoll.found and L_180_[L_265_forvar0] then
						local L_335_ = workspace.demoModels.ragdoll:FindFirstChild(L_265_forvar0)
						local L_336_ = false;
						if not L_335_ then
							L_335_ = L_144_.CharacterModels[L_180_[L_265_forvar0]]:Clone()
							L_335_.Name = L_266_forvar1.name;
							L_335_.Parent = workspace.demoModels.ragdoll;
							for L_337_forvar0, L_338_forvar1 in next, L_335_:GetDescendants() do
								if L_338_forvar1:IsA("BasePart") then
									L_338_forvar1.Anchored = true
								end
							end;
							L_336_ = true
						end;
						for L_339_forvar0, L_340_forvar1 in next, L_335_:GetChildren() do
							local L_341_ = L_266_forvar1.ragdoll.positions[L_340_forvar1.Name == "FakeHead" and "Head" or L_340_forvar1.Name]
							if L_341_ then
								L_341_ = env.DemoFlags["hide_ragdolls"] and "0 0 0 0 0 0 0 0 0 0 0 0" or L_341_;
								local L_342_ = L_341_:split(" ")
								local L_343_ = TweenInfo.new(L_336_ and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
								local L_344_ = L_148_:Create(L_340_forvar1, L_343_, {
									CFrame = CFrame.new(L_342_[1], L_342_[2], L_342_[3], L_342_[4], L_342_[5], L_342_[6], L_342_[7], L_342_[8], L_342_[9], L_342_[10], L_342_[11], L_342_[12])
								})
								L_344_:Play()
							end;
							if L_340_forvar1.ClassName == "Accessory" then
								for L_345_forvar0, L_346_forvar1 in next, L_266_forvar1.ragdoll.hatPos do
									local L_347_ = L_340_forvar1.Handle.ClassName == "Part" and L_340_forvar1.Handle.Mesh.MeshId or L_340_forvar1.Handle.ClassName == "MeshPart" and L_340_forvar1.Handle.MeshId or ""
									if L_347_ == L_345_forvar0 then
										L_346_forvar1 = env.DemoFlags["hide_ragdolls"] and "0 0 0 0 0 0 0 0 0 0 0 0" or L_346_forvar1;
										local L_348_ = L_346_forvar1:split(" ")
										local L_349_ = TweenInfo.new(L_336_ and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
										local L_350_ = L_148_:Create(L_340_forvar1.Handle, L_349_, {
											CFrame = CFrame.new(L_348_[1], L_348_[2], L_348_[3], L_348_[4], L_348_[5], L_348_[6], L_348_[7], L_348_[8], L_348_[9], L_348_[10], L_348_[11], L_348_[12])
										})
										L_350_:Play()
									end
								end
							end
						end
					elseif workspace.demoModels.ragdoll:FindFirstChild(L_265_forvar0) then
						workspace.demoModels.ragdoll[L_265_forvar0]:Destroy()
					end;
					for L_351_forvar0, L_352_forvar1 in next, workspace.demoModels.weapons:GetChildren() do
						if L_352_forvar1.Name:find(L_265_forvar0) then
							L_352_forvar1:Destroy()
							break
						end
					end;
					if workspace.demoModels:FindFirstChild(L_265_forvar0) then
						workspace.demoModels[L_265_forvar0]:Destroy()
					end;
					L_181_[L_265_forvar0] = nil;
					L_183_[L_265_forvar0] = nil;
					L_182_[L_265_forvar0] = nil;
					L_184_[L_265_forvar0] = nil;
					L_185_[L_265_forvar0] = nil
				end
			end;
			for L_353_forvar0, L_354_forvar1 in next, L_248_.nades do
				local L_355_ = L_144_.Weapons[L_354_forvar1.nade].Model:Clone()
				L_355_.Parent = workspace.demoModels.nades;
				L_355_.Anchored = true;
				L_355_.Transparency = 0;
				local L_356_ = L_354_forvar1.pos:split(" ")
				L_355_.Position = Vector3.new(L_356_[1], L_356_[2], L_356_[3])
				L_355_.Orientation = Vector3.new(L_356_[4], L_356_[5], L_356_[6])
			end;
			if L_166_ ~= L_248_.roundInfo.round then
				for L_357_forvar0, L_358_forvar1 in next, L_168_.Regen.Props:GetChildren() do
					L_358_forvar1.Transparency = 0
				end;
				if L_168_.Regen:FindFirstChild("Glasses") then
					for L_359_forvar0, L_360_forvar1 in next, L_168_.Regen.Glasses:GetChildren() do
						L_360_forvar1.Transparency = 0.5
					end
				end
			end;
			for L_361_forvar0, L_362_forvar1 in next, L_168_.Regen.Props:GetChildren() do
				local L_363_ = false;
				for L_364_forvar0, L_365_forvar1 in next, L_248_.regen.props do
					local L_366_ = L_365_forvar1:split(" ")
					L_363_ = (Vector3.new(L_366_[1], L_366_[2], L_366_[3]) - L_362_forvar1.Position).magnitude < 3 and true or L_363_
				end;
				L_362_forvar1.Transparency = L_363_ and 0 or 1
			end;
			if L_168_.Regen:FindFirstChild("Glasses") then
				for L_367_forvar0, L_368_forvar1 in next, L_168_.Regen.Glasses:GetChildren() do
					local L_369_ = false;
					for L_370_forvar0, L_371_forvar1 in next, L_248_.regen.glasses do
						local L_372_ = L_371_forvar1:split(" ")
						L_369_ = (Vector3.new(L_372_[1], L_372_[2], L_372_[3]) - L_368_forvar1.Position).magnitude < 1 and true or L_369_
					end;
					L_368_forvar1.Transparency = L_369_ and 0.5 or 1
				end
			end;
			for L_373_forvar0, L_374_forvar1 in L_168_.Regen.Doors:GetChildren() do
				pcall(function()
					local L_375_ = L_248_.regen.doors[L_373_forvar0]:split(" ")
					L_374_forvar1.HumanoidRootPart.Anchored = true;
					L_374_forvar1.HumanoidRootPart.Position = Vector3.new(L_375_[1], L_375_[2], L_375_[3])
					L_374_forvar1.HumanoidRootPart.Orientation = Vector3.new(L_375_[4], L_375_[5], L_375_[6])
				end)
			end;
			for L_376_forvar0, L_377_forvar1 in next, L_248_.nadePos do
				local L_378_ = L_377_forvar1.pos:split(" ")
				local L_379_ = Vector3.new(L_378_[1], L_378_[2], L_378_[3])
				local L_380_ = false;
				for L_381_forvar0, L_382_forvar1 in next, workspace.demoModels.nadePos:GetChildren() do
					local L_383_ = (L_382_forvar1.Position - L_379_).magnitude;
					if L_383_ <= 0.25 then
						L_380_ = true
					end
				end;
				if not L_380_ then
					local L_384_ = L_144_[L_377_forvar1.type]:Clone()
					L_384_.Parent = workspace.demoModels.nadePos;
					L_384_.Position = L_379_
				end
			end;
			for L_385_forvar0, L_386_forvar1 in next, workspace.demoModels.nadePos:GetChildren() do
				local L_387_ = false;
				for L_388_forvar0, L_389_forvar1 in next, L_248_.nadePos do
					local L_390_ = L_389_forvar1.pos:split(" ")
					local L_391_ = (L_386_forvar1.Position - Vector3.new(L_390_[1], L_390_[2], L_390_[3])).magnitude;
					if L_391_ <= 1 then
						L_387_ = true
					end
				end;
				if not L_387_ then
					L_386_forvar1:Destroy()
				end
			end;
			workspace.demoModels.droppedWeapons:ClearAllChildren()
			for L_392_forvar0, L_393_forvar1 in next, L_248_.droppedWeapons do
				local L_394_ = L_144_.Weapons[L_393_forvar1.name].Model:Clone()
				L_394_.Parent = workspace.demoModels.droppedWeapons;
				for L_395_forvar0, L_396_forvar1 in next, L_393_forvar1.positions do
					L_396_forvar1 = env.DemoFlags["hide_dropped_weapons"] and "0 0 0 0 0 0" or L_396_forvar1;
					local L_397_ = L_396_forvar1:split(" ")
					L_394_[L_395_forvar0].Position = Vector3.new(L_397_[1], L_397_[2], L_397_[3])
					L_394_[L_395_forvar0].Orientation = Vector3.new(L_397_[4], L_397_[5], L_397_[6])
				end
			end;
			L_174_.hud.TWin.Visible = L_248_.roundInfo.TWin.vis;
			L_174_.hud.TWin.MVPPlayer.Image = L_248_.roundInfo.TWin.mvpimage;
			L_174_.hud.TWin.TextLabel.Text = L_248_.roundInfo.TWin.mvptext;
			L_174_.hud.TWin.Info.TextLabel.Text = L_248_.roundInfo.TWin.infotext;
			L_174_.hud.CTWin.Visible = L_248_.roundInfo.CTWin.vis;
			L_174_.hud.CTWin.MVPPlayer.Image = L_248_.roundInfo.CTWin.mvpimage;
			L_174_.hud.CTWin.TextLabel.Text = L_248_.roundInfo.CTWin.mvptext;
			L_174_.hud.CTWin.Info.TextLabel.Text = L_248_.roundInfo.CTWin.infotext;
			local L_264_ = L_248_.bombPos:split(" ")
			workspace.C4Normal:SetPrimaryPartCFrame(CFrame.new(L_264_[1], L_264_[2] - 1, L_264_[3]) * CFrame.Angles(math.rad(90), 0, 0))
			L_166_ = L_248_.roundInfo.round;
			for L_398_forvar0, L_399_forvar1 in next, L_174_.killfeed:GetChildren() do
				if L_399_forvar1.Name ~= "example" and L_399_forvar1.Name ~= "UIListLayout" then
					L_399_forvar1:Destroy()
				end
			end;
			if L_248_.killfeed then
				for L_400_forvar0, L_401_forvar1 in L_248_.killfeed do
					local L_402_ = L_174_.killfeed.example:Clone()
					x = 0;
					L_402_.Killer.Text = L_401_forvar1.killer;
					L_402_.Killer.TextColor3 = Color3.new(L_401_forvar1.killercolor[1], L_401_forvar1.killercolor[2], L_401_forvar1.killercolor[3])
					L_402_.Victim.Text = L_401_forvar1.victim;
					L_402_.Victim.TextColor3 = Color3.new(L_401_forvar1.victimcolor[1], L_401_forvar1.victimcolor[2], L_401_forvar1.victimcolor[3])
					L_402_.Outline.Visible = L_163_ == "follow" and (L_401_forvar1.killer == L_162_ or L_401_forvar1.victim == L_162_)
					L_402_.Pic.Image = L_401_forvar1.weapon;
					if L_401_forvar1.headshot and L_401_forvar1.wallbang then
						L_402_.Pic.Wallbang.Visible = true;
						L_402_.Pic.Wallbang.Headshot.Visible = true
					elseif L_401_forvar1.headshot then
						L_402_.Pic.Headshot.Visible = true
					end;
					L_402_.Pic.Headshot.Position = L_401_forvar1.headshot and L_401_forvar1.wallbang and UDim2.new(0, 102, 0, 2) or L_402_.Pic.Headshot.Position;
					L_402_.Name = tostring(L_400_forvar0)
					L_402_.Visible = env.DemoFlags["show_killfeed"]
					L_402_.Parent = L_174_.killfeed;
					L_402_.Pic.Position = UDim2.new(0, L_402_.Killer.TextBounds.X + 3, 0, 0)
					L_402_.Size = UDim2.new(0, L_402_.Killer.TextBounds.X + L_402_.Victim.TextBounds.X + L_402_.Pic.Size.Width.Offset + (L_401_forvar1.headshot and 30 or 0) + (L_401_forvar1.wallbang and 30 or 0) + 28, 0, 25)
				end
			end;
			L_174_.hud.UpperInfo.Visible = env.DemoFlags["show_hud"]
			if env.DemoFlags["show_hud"] then
				L_174_.hud.UpperInfo.Timer.Text = L_248_.roundInfo.time;
				L_174_.hud.UpperInfo.TScore.Text = L_248_.roundInfo.T;
				L_174_.hud.UpperInfo.CTScore.Text = L_248_.roundInfo.CT
			end;
			L_174_.player.pauseresume.Image = L_150_.playing.Value and "rbxassetid://4458862490" or "rbxassetid://4458863290"
			L_174_.player.tickcount.Text = tickToSec(L_247_arg0) .. " / " .. tickToSec(L_186_)
			L_174_.player.tickslider.volumesize.Size = UDim2.new(100 / L_186_ * L_247_arg0 / 100, 0, 1, 0)
			ignoreSound = false
		end;
		L_202_ = L_202_ + 1
	end;
	local L_203_ = ""
	local L_204_ = false;
	function createMap(L_403_arg0)
		workspace.Terrain:Clear()
		if workspace:FindFirstChild("Map") then
			workspace.Map:Destroy()
		end;
		workspace.createmap.mapevent:FireServer(L_403_arg0)
	end;
	local L_205_ = {
		newKills = {},
		newRounds = {},
		newBombPlants = {}
	}
	function checkDifferences(L_404_arg0, L_405_arg1)
		local L_406_ = L_405_arg1[L_404_arg0 - 1]
		local L_407_ = L_405_arg1[L_404_arg0]
		for L_408_forvar0, L_409_forvar1 in next, L_407_.killfeed do
			local L_410_ = false;
			for L_411_forvar0, L_412_forvar1 in next, L_406_.killfeed do
				if L_412_forvar1.victim == L_409_forvar1.victim and L_409_forvar1.killer == L_412_forvar1.killer then
					L_410_ = true;
					break
				end
			end;
			if not L_410_ then
				table.insert(L_205_.newKills, {
					victim = L_409_forvar1.victim,
					killer = L_409_forvar1.killer,
					killercolor = L_409_forvar1.killercolor,
					victimcolor = L_409_forvar1.victimcolor,
					tickNumber = L_404_arg0
				})
			end
		end;
		if L_407_.roundInfo.round > L_406_.roundInfo.round then
			table.insert(L_205_.newRounds, {
				round = L_407_.roundInfo.round,
				tickNumber = L_404_arg0
			})
		end;
		if L_407_.bombPlanted and not L_406_.bombPlanted then
			table.insert(L_205_.newBombPlants, {
				round = L_407_.roundInfo.round,
				tickNumber = L_404_arg0
			})
		end
	end;
	function CreateThread(L_413_arg0)
		local L_414_ = coroutine.create(L_413_arg0)
		coroutine.resume(L_414_)
		return L_414_
	end;
	function playDemo(L_415_arg0, L_416_arg1)
		L_174_.playing.Visible = true;
		if L_204_ then
			return
		end;
		if L_164_ then
			L_164_:Destroy()
			L_164_ = nil
		end;
		if env.DemoFlags["depth_of_field_map"] then
			L_177_.options["depth_of_field_map"].changeState(false)
		end;
		if env.DemoFlags["greenscreen_map"] then
			L_177_.options["greenscreen_map"].changeState(false)
		end;
		L_162_ = ""
		L_163_ = "freecam"
		L_159_ = false;
		L_203_ = L_415_arg0;
		L_174_.demolist.Visible = false;
		L_150_.playing.Value = false;
		local L_417_ = "clarity.tk/demos/" .. L_415_arg0
		if isfolder(L_417_) then
			local mapStr = isfile(L_417_ .. "/map.tick") and readfile(L_417_ .. "/map.tick") or "{}"
			local L_418_ = L_145_:JSONDecode(mapStr)
			if L_418_.sky then
				if not L_147_:FindFirstChild("Sky") then
					local L_420_ = Instance.new("Sky", L_147_)
					L_420_.Name = "Sky"
				end;
				L_147_.Sky.SkyboxBk = L_418_.sides["SkyboxBk"]
				L_147_.Sky.SkyboxDn = L_418_.sides["SkyboxDn"]
				L_147_.Sky.SkyboxFt = L_418_.sides["SkyboxFt"]
				L_147_.Sky.SkyboxLf = L_418_.sides["SkyboxLf"]
				L_147_.Sky.SkyboxRt = L_418_.sides["SkyboxRt"]
				L_147_.Sky.SkyboxUp = L_418_.sides["SkyboxUp"]
			end;
			local L_419_ = workspace:FindFirstChild("Map")
				if L_418_.mapName or L_419_ then
				if not L_419_ then
						createMap(L_416_arg1 or L_418_.mapName)
				end;
				repeat
					wait()
				until workspace:FindFirstChild("Map")
				L_168_ = workspace.Map:GetChildren()[1]
				repeat
					wait()
				until L_168_:FindFirstChild("TSpawns") and L_168_:FindFirstChild("Clips") and L_168_:FindFirstChild("Regen") and L_168_.Regen:FindFirstChild("Props") or L_419_;
				if not L_419_ then
					L_168_.Clips:Destroy()
					L_152_.CFrame = L_168_.TSpawns:GetChildren()[1].CFrame + Vector3.new(0, 5, 0)
				else
					L_150_.playing.Value = false
				end;
				L_160_ = true;
				L_205_ = {
					newKills = {},
					newRounds = {},
					newBombPlants = {}
				}
				L_154_ = {}
				local tickNum = 1
				while true do
					local tickPath = L_417_ .. "/" .. tostring(tickNum) .. ".tick"
					if isfile(tickPath) then
						local success, decoded = pcall(function() return L_145_:JSONDecode(readfile(tickPath)) end)
						if success and decoded then
							table.insert(L_154_, decoded)
						end
						tickNum = tickNum + 1
					else
						break
					end
				end;
				for L_426_forvar0, L_427_forvar1 in next, L_154_ do
					L_427_forvar1.delay = L_427_forvar1.delay + 0.01
				end;
				for L_428_forvar0 = 2, # L_154_, 1 do
					checkDifferences(L_428_forvar0, L_154_)
				end;
				for L_429_forvar0, L_430_forvar1 in next, L_178_:GetChildren() do
					if L_430_forvar1.Name == "kill" or L_430_forvar1.Name == "newRound" or L_430_forvar1.name == "bombPlant" then
						L_430_forvar1:Destroy()
					end
				end;
				warn("kills:")
				local L_421_ = 5;
				if # L_205_.newKills > 0 then
					for L_431_forvar0, L_432_forvar1 in next, L_205_.newKills do
						local L_433_ = L_144_.events.kill:Clone()
						L_433_.killer.Text = L_432_forvar1.killer;
						L_433_.killer.TextColor3 = Color3.new(L_432_forvar1.killercolor[1], L_432_forvar1.killercolor[2], L_432_forvar1.killercolor[3])
						L_433_.victim.Text = L_432_forvar1.victim;
						L_433_.victim.TextColor3 = Color3.new(L_432_forvar1.victimcolor[1], L_432_forvar1.victimcolor[2], L_432_forvar1.victimcolor[3])
						L_433_.time.Text = tickToSec(L_432_forvar1.tickNumber)
						L_433_.Parent = L_178_;
						L_433_.Position = UDim2.new(0, 30, 0, L_421_)
						L_433_.killtext.Position = L_433_.killer.Position + UDim2.new(0, L_433_.killer.TextBounds.X + 5, 0, 0)
						L_433_.victim.Position = L_433_.killtext.Position + UDim2.new(0, L_433_.killtext.TextBounds.X + 5, 0, 0)
						L_421_ = L_421_ + 35;
						L_433_.move.MouseButton1Click:Connect(function()
							L_167_ = math.clamp(L_432_forvar1.tickNumber - 15, 1, 387420489)
							playTick(L_167_)
						end)
						print(L_432_forvar1.killer, "killed", L_432_forvar1.victim, "tick:", L_432_forvar1.tickNumber)
					end
				else
					print("No kills found!")
				end;
				warn("rounds:")
				if # L_205_.newRounds > 0 then
					for L_434_forvar0, L_435_forvar1 in next, L_205_.newRounds do
						local L_436_ = L_144_.events.newRound:Clone()
						L_436_.text.Text = "Round " .. tostring(L_435_forvar1.round) .. " start"
						L_436_.time.Text = tickToSec(L_435_forvar1.tickNumber)
						L_436_.Parent = L_178_;
						L_436_.Position = UDim2.new(0, 30, 0, L_421_)
						L_421_ = L_421_ + 35;
						L_436_.move.MouseButton1Click:Connect(function()
							L_167_ = L_435_forvar1.tickNumber;
							playTick(L_435_forvar1.tickNumber)
						end)
						print("Round", L_435_forvar1.round, "started tick:", L_435_forvar1.tickNumber)
					end
				else
					print("No new rounds found!")
				end;
				warn("bombplants:")
				if # L_205_.newBombPlants > 0 then
					for L_437_forvar0, L_438_forvar1 in next, L_205_.newBombPlants do
						local L_439_ = L_144_.events.bombPlant:Clone()
						L_439_.time.Text = tickToSec(L_438_forvar1.tickNumber)
						L_439_.Parent = L_178_;
						L_439_.Position = UDim2.new(0, 30, 0, L_421_)
						L_421_ = L_421_ + 35;
						L_439_.move.MouseButton1Click:Connect(function()
							L_167_ = L_438_forvar1.tickNumber;
							playTick(L_438_forvar1.tickNumber)
						end)
						print("Bomb planted on round", L_438_forvar1.round, "tick:", L_438_forvar1.tickNumber)
					end
				else
					print("No bomb plants found!")
				end;
				local L_422_ = L_178_.size.ScrollingFrame;
				L_422_.CanvasSize = UDim2.new(0, 0, 0, 5 + (# L_422_:GetChildren() - 1) * 35)
				L_166_ = 0;
				for L_440_forvar0, L_441_forvar1 in next, L_168_.Regen.Props:GetChildren() do
					L_441_forvar1.Transparency = 0
				end;
				if L_168_.Regen:FindFirstChild("Glasses") then
					for L_442_forvar0, L_443_forvar1 in next, L_168_.Regen.Glasses:GetChildren() do
						L_443_forvar1.Transparency = 0.5
					end
				end;
				L_167_ = 0;
				local L_423_ = 0;
				L_186_ = # L_154_;
				local L_424_ = game:GetService("RunService")
				while L_167_ < # L_154_ do
					L_204_ = true;
					local L_444_ = L_150_.reverse.Value and -1 or 1;
					L_167_ = math.clamp(L_167_ + L_444_, 1, # L_154_)
					local L_445_, L_446_ = 387420489, nil;
					if L_150_.keyframing.Value and L_163_ == "freecam" and L_150_.playing.Value then
						if # L_189_ > 1 then
							for L_447_forvar0, L_448_forvar1 in next, L_189_ do
								if L_448_forvar1.tick < L_445_ then
									L_445_, L_446_ = L_448_forvar1.tick, L_448_forvar1.cf
								end
							end;
							if L_445_ > L_167_ then
								L_167_ = L_445_;
								L_152_.CFrame = L_446_
							end
						end
					end;
					CreateThread(function()
						playTick(L_167_)
					end)
					if L_150_.speed.Value >= 1 and L_150_.speed.Value < 20 then
						for L_449_forvar0 = 1, L_150_.speed.Value do
							wait(0.03)
						end
					else
						L_423_ = L_423_ + 1;
						if L_423_ == L_150_.speed.Value / 10 then
							wait(0.03)
							L_423_ = 0
						end
					end;
					L_174_.playing.Visible = false;
					if not L_150_.playing.Value then
						L_174_.playing.Visible = true;
						repeat
							wait()
						until L_150_.playing.Value or L_150_.stop.Value
					end;
					if L_150_.stop.Value then
						break
					end
				end
			end
		end;
		L_204_ = false;
		L_174_.player.pauseresume.Image = "rbxassetid://4458863290"
		if L_150_.stop.Value then
			L_189_ = {}
			if env.DemoFlags["depth_of_field_map"] then
				L_177_.options["depth_of_field_map"].changeState(false)
			end;
			if env.DemoFlags["greenscreen_map"] then
				L_177_.options["greenscreen_map"].changeState(false)
			end;
			for L_450_forvar0, L_451_forvar1 in next, L_178_:GetChildren() do
				if L_451_forvar1.Name == "kill" or L_451_forvar1.Name == "newRound" or L_451_forvar1.name == "bombPlant" then
					L_451_forvar1:Destroy()
				end
			end;
			L_160_ = false;
			L_147_.Blur.Enabled = true;
			L_174_.demolist.Visible = true;
			L_174_.player.Visible = false;
			L_174_.settings.Visible = false;
			L_174_.playing.Visible = false;
			L_174_.hud.Spectate.Visible = false;
			L_174_.hud.Vitals.Visible = false;
			L_174_.hud.AmmoGUI.Visible = false;
			L_174_.crosshair.Visible = false;
			if L_147_:FindFirstChild("Sky") then
				L_147_.Sky:Destroy()
			end;
			updateKeyframes()
			if workspace:FindFirstChild("Map") then
				workspace.Map:Destroy()
			end;
			for L_452_forvar0, L_453_forvar1 in next, workspace.demoModels:GetDescendants() do
				if not L_453_forvar1:IsA("Folder") then
					L_453_forvar1:Destroy()
				end
			end
		end
	end;
	workspace.start.Event:Connect(playDemo)
	workspace.changeAmount.Event:Connect(function(L_454_arg0)
		L_167_ = L_167_ + L_454_arg0;
		if not L_150_.playing.Value then
			playTick(L_167_)
		end
	end)
	workspace.changeTick.Event:Connect(function(L_455_arg0)
		if L_204_ then
			L_167_ = math.clamp(math.floor(L_186_ / 100 * L_455_arg0), 1, L_186_) - 1;
			ignoreSound = true;
			playTick(L_167_)
		end
	end)
	L_174_.player.pauseresume.MouseButton1Click:Connect(function()
		if not L_204_ then
			for L_456_forvar0, L_457_forvar1 in next, workspace.demoModels:GetDescendants() do
				if not L_457_forvar1:IsA("Folder") then
					L_457_forvar1:Destroy()
				end
			end;
			playDemo(L_203_)
		end
	end)
	L_174_.player.stop.MouseButton1Click:Connect(function()
		if not L_204_ then
			if not L_150_.playing.Value then
				L_160_ = false;
				L_147_.Blur.Enabled = true;
				L_174_.demolist.Visible = true;
				L_174_.player.Visible = false;
				L_174_.settings.Visible = false;
				L_147_.Sky.SkyboxBk = ""
				L_147_.Sky.SkyboxDn = ""
				L_147_.Sky.SkyboxFt = ""
				L_147_.Sky.SkyboxLf = ""
				L_147_.Sky.SkyboxRt = ""
				L_147_.Sky.SkyboxUp = ""
				workspace.Map:Destroy()
				for L_458_forvar0, L_459_forvar1 in next, workspace.demoModels:GetDescendants() do
					if not L_459_forvar1:IsA("Folder") then
						L_459_forvar1:Destroy()
					end
				end
			end
		end
	end)
	L_174_.player.reverse.MouseButton1Click:Connect(function()
		L_150_.reverse.Value = not L_150_.reverse.Value;
		L_174_.player.reverse.Text = "Reverse: " .. tostring(L_150_.reverse.Value)
	end)
	local L_206_ = 5;
	local L_207_ = Vector2.new(0, math.rad(-60))
	local L_208_ = {
		math.rad(-81),
		math.rad(20)
	}
	game:GetService("RunService").RenderStepped:Connect(function()
		if L_163_ == "follow" then
			if workspace.demoModels:FindFirstChild(L_162_) then
				if L_159_ and L_181_[L_162_] and L_183_[L_162_] ~= "" then
					L_152_.CameraType = "Scriptable"
					L_152_.CameraSubject = nil;
					local L_460_ = L_181_[L_162_]:split(" ")
					local L_461_ = TweenInfo.new(workspace.settings.tween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
					local L_462_ = L_148_:Create(L_152_, L_461_, {
						CFrame = CFrame.new(Vector3.new(L_460_[1], L_460_[2], L_460_[3]), Vector3.new(L_460_[4], L_460_[5], L_460_[6])) + L_200_
					})
					L_462_:Play()
					if L_164_ and (L_183_[L_162_] ~= L_164_.Name or not L_159_) then
						L_164_:Destroy()
						L_164_ = nil
					end;
					if not L_164_ then
						L_164_ = L_144_.Viewmodels["v_" .. L_183_[L_162_]]:Clone()
						L_164_.Name = L_183_[L_162_]
						L_164_.Parent = workspace.demoModels;
						L_164_["Right Arm"].Transparency = 1;
						local L_463_ = L_144_.Viewmodels[L_182_[L_162_]]:Clone()
						local L_464_ = Instance.new("Weld", L_463_["Right Arm"])
						L_464_.C0 = CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90))
						L_464_.Part0 = L_463_["Right Arm"]
						L_464_.Part1 = L_164_["Right Arm"]
						if L_164_:FindFirstChild("Left Arm") then
							local L_467_ = Instance.new("Weld", L_463_["Left Arm"])
							L_467_.C0 = CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90))
							L_164_["Left Arm"].Transparency = 1;
							L_467_.Part0 = L_463_["Left Arm"]
							L_467_.Part1 = L_164_["Left Arm"]
						else
							L_463_["Left Arm"]:Destroy()
						end;
						L_463_.Name = "arms"
						L_463_.Parent = L_164_;
						local L_465_ = L_144_.Skins:FindFirstChild(L_183_[L_162_]) and L_144_.Skins[L_183_[L_162_]]:FindFirstChild(L_184_[L_162_]) or nil;
						if L_465_ then
							for L_468_forvar0, L_469_forvar1 in next, L_164_:GetChildren() do
								if L_469_forvar1.ClassName == "MeshPart" then
									local L_470_ = L_465_:FindFirstChild(L_469_forvar1.Name, true)
									if L_470_ then
										L_469_forvar1.TextureID = L_470_.Value
									end
								end
							end
						end;
						local L_466_ = L_164_.Guy:LoadAnimation(L_164_.equip)
						if L_144_.Weapons:FindFirstChild(L_183_[L_162_]) then
							if L_144_.Weapons[L_183_[L_162_]].Model:FindFirstChild("Equip") then
								playAudio(L_144_.Weapons[L_183_[L_162_]].Model.Equip, workspace)
							else
								local L_471_ = L_144_.Weapons[L_183_[L_162_]].Model:FindFirstChild("bolt") or L_144_.Weapons[L_183_[L_162_]].Model:FindFirstChild("slide")
								local L_472_ = L_144_.Weapons[L_183_[L_162_]].Model:FindFirstChild("boltin") or L_144_.Weapons[L_183_[L_162_]].Model:FindFirstChild("slidein")
								if L_471_ and L_472_ then
									spawn(function()
										wait(0.1)
										playAudio(L_471_, workspace)
										wait(L_471_.TimeLength * 0.75 * L_157_[L_165_])
										playAudio(L_472_, workspace)
									end)
								end
							end
						end;
						L_466_:Play()
						L_466_:AdjustSpeed(L_156_[L_165_])
					end;
					L_164_:SetPrimaryPartCFrame((L_187_ and CFrame.new() or L_152_.CFrame * L_194_ * L_195_) * CFrame.new((env.DemoFlags["viewmodel_x"] - 20) / 10, (env.DemoFlags["viewmodel_y"] - 20) / 10, (env.DemoFlags["viewmodel_z"] - 20) / 10))
				else
					L_152_.CameraType = "Follow"
					L_152_.CameraSubject = workspace.demoModels[L_162_].LowerTorso
				end
			end
		elseif L_163_ == "freecam" then
			L_152_.CameraType = "Scriptable"
			L_152_.CameraSubject = nil;
			if not (L_150_.keyframing.Value and L_150_.playing.Value) then
				local L_473_ = L_152_.CFrame.LookVector / 50 * env.DemoFlags["camera_speed"]
				local L_474_ = Vector3.new()
				L_474_ = L_146_:IsKeyDown(Enum.KeyCode.W) and L_474_ + L_473_ or L_474_;
				L_474_ = L_146_:IsKeyDown(Enum.KeyCode.S) and L_474_ - L_473_ or L_474_;
				L_474_ = L_146_:IsKeyDown(Enum.KeyCode.D) and L_474_ + Vector3.new(- L_473_.Z, 0, L_473_.X) or L_474_;
				L_474_ = L_146_:IsKeyDown(Enum.KeyCode.A) and L_474_ - Vector3.new(- L_473_.Z, 0, L_473_.X) or L_474_;
				L_474_ = L_146_:IsKeyDown(Enum.KeyCode.Q) and L_474_ + Vector3.new(0, L_473_.Y, 0) or L_474_;
				L_474_ = L_146_:IsKeyDown(Enum.KeyCode.E) and L_474_ - Vector3.new(0, L_473_.Y, 0) or L_474_;
				L_474_ = L_474_ * 1.25;
				local L_475_ = L_146_:GetMouseDelta() / 30;
				L_207_ = L_207_ + L_475_ * math.rad(15)
				local L_476_ = CFrame.Angles(0, - L_207_.X, 0) * CFrame.Angles(- L_207_.Y, 0, 0)
				L_152_.CFrame = L_476_ + L_152_.CFrame.p + L_474_ + L_476_ * Vector3.new(0, 0, 0)
			end;
			if L_164_ then
				L_164_:Destroy()
				L_164_ = nil
			end
		end;
		L_173_.Saturation = env.DemoFlags["world_saturation"] and env.DemoFlags["saturation_value"] / 50 or 0;
		if env.DemoFlags["world_gradient"] then
			L_147_.Ambient = env.DemoFlags["gradient_color"]
			L_147_.OutdoorAmbient = env.DemoFlags["outdoor_gradient_color"]
		else
			L_147_.Ambient = L_171_;
			L_147_.OutdoorAmbient = L_172_
		end;
		L_146_.MouseBehavior = L_160_ and not L_174_.player.Visible and Enum.MouseBehavior.LockCenter or Enum.MouseBehavior.Default;
		L_146_.MouseIconEnabled = L_174_.demolist.Visible or L_174_.player.Visible;
		game.StarterGui:SetCoreGuiEnabled("PlayerList", false)
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
		game.CoreGui.ThemeProvider.Enabled = false;
		game.CoreGui.TopBarApp.Enabled = false
	end)
	game:GetService("RunService").Stepped:Connect(function()
		for L_477_forvar0, L_478_forvar1 in next, workspace.demoModels:GetChildren() do
			if L_478_forvar1:IsA("Model") then
				for L_479_forvar0, L_480_forvar1 in next, L_478_forvar1:GetChildren() do
					if L_480_forvar1:IsA("BasePart") then
						L_480_forvar1.CanCollide = false
					end
				end
			end
		end
	end)
	game:GetService("UserInputService").InputBegan:Connect(function(L_481_arg0)
		if L_481_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
			if L_170_.Target and L_170_.Target.Parent.Parent == workspace.demoModels and L_170_.Target.Parent:FindFirstChild("FakeHead") then
				L_162_ = L_170_.Target.Parent.Name;
				L_163_ = "follow"
				if not L_150_.playing.Value then
					playTick(L_167_)
				end
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["toggle_ui"] and L_160_ then
			L_174_.player.Visible = not L_174_.player.Visible;
			L_174_.settings.Visible = L_174_.player.Visible;
			L_177_.scrolling = false;
			L_177_.colorpicking = false;
			for L_482_forvar0, L_483_forvar1 in next, L_177_.toInvis do
				L_483_forvar1.Visible = false
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["toggle_spec_mode"] then
			L_163_ = L_163_ == "follow" and "freecam" or L_163_;
			if not L_150_.playing.Value then
				playTick(L_167_)
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["pause_resume"] then
			if not L_204_ and L_160_ then
				for L_484_forvar0, L_485_forvar1 in next, workspace.demoModels:GetDescendants() do
					if not L_485_forvar1:IsA("Folder") then
						L_485_forvar1:Destroy()
					end
				end;
				playDemo(L_203_)
			elseif L_160_ then
				L_150_.playing.Value = not L_150_.playing.Value
			end
		elseif L_481_arg0.KeyCode == Enum.KeyCode.Left then
			L_167_ = L_167_ - 1;
			if not L_150_.playing.Value then
				playTick(L_167_)
			end
		elseif L_481_arg0.KeyCode == Enum.KeyCode.Right then
			L_167_ = L_167_ + 1;
			if not L_150_.playing.Value then
				playTick(L_167_)
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["toggle_firstperson"] then
			L_159_ = not L_159_;
			if not L_150_.playing.Value then
				playTick(L_167_)
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["increase_playback_speed"] then
			L_165_ = math.clamp(L_165_ + 1, 1, 5)
			workspace.settings.speed.Value = L_155_[L_165_]
		elseif L_481_arg0.KeyCode == env.DemoFlags["decrease_playback_speed"] then
			L_165_ = math.clamp(L_165_ - 1, 1, 5)
			workspace.settings.speed.Value = L_155_[L_165_]
		elseif L_481_arg0.KeyCode == Enum.KeyCode.Z then
		elseif L_481_arg0.KeyCode == Enum.KeyCode.F then
		end
	end)
	L_152_:GetPropertyChangedSignal("CFrame"):Connect(function()
		if L_164_ and L_159_ and L_164_.PrimaryPart then
			L_164_:SetPrimaryPartCFrame((L_187_ and CFrame.new() or L_152_.CFrame * L_194_ * L_195_) * CFrame.new((env.DemoFlags["viewmodel_x"] - 20) / 10, (env.DemoFlags["viewmodel_y"] - 20) / 10, (env.DemoFlags["viewmodel_z"] - 20) / 10))
		end
	end)
	function draggable(L_486_arg0)
		local L_487_ = L_146_;
		local L_488_;
		local L_489_;
		local L_490_;
		local L_491_;
		local function L_492_func(L_493_arg0)
			if not L_177_.colorpicking then
				local L_494_ = L_493_arg0.Position - L_490_;
				L_486_arg0.Position = UDim2.new(L_491_.X.Scale, L_491_.X.Offset + L_494_.X, L_491_.Y.Scale, L_491_.Y.Offset + L_494_.Y)
			end
		end;
		L_486_arg0.InputBegan:Connect(function(L_495_arg0)
			if L_495_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_495_arg0.UserInputType == Enum.UserInputType.Touch then
				L_488_ = true;
				L_490_ = L_495_arg0.Position;
				L_491_ = L_486_arg0.Position;
				L_495_arg0.Changed:Connect(function()
					if L_495_arg0.UserInputState == Enum.UserInputState.End then
						L_488_ = false
					end
				end)
			end
		end)
		L_486_arg0.InputChanged:Connect(function(L_496_arg0)
			if L_496_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_496_arg0.UserInputType == Enum.UserInputType.Touch then
				L_489_ = L_496_arg0
			end
		end)
		L_487_.InputChanged:Connect(function(L_497_arg0)
			if L_497_arg0 == L_489_ and L_488_ then
				L_492_func(L_497_arg0)
			end
		end)
	end;
	draggable(L_175_.settings)
	function L_177_:addTab(L_498_arg0)
		local L_499_ = L_176_.tab:Clone()
		local L_500_ = L_176_.tabbuttons.button:Clone()
		table.insert(L_177_.tabs, L_499_)
		L_499_.Parent = L_176_;
		L_499_.Visible = false;
		table.insert(L_177_.tabbuttons, L_500_)
		L_500_.Parent = L_176_.tabbuttons;
		L_500_.Modal = true;
		L_500_.Visible = true;
		L_500_.Text = L_498_arg0;
		L_500_.MouseButton1Click:Connect(function()
			for L_505_forvar0, L_506_forvar1 in next, L_177_.tabs do
				L_506_forvar1.Visible = L_506_forvar1 == L_499_
			end;
			for L_507_forvar0, L_508_forvar1 in next, L_177_.toInvis do
				L_508_forvar1.Visible = false
			end
		end)
		for L_509_forvar0, L_510_forvar1 in next, L_177_.tabbuttons do
			L_510_forvar1.Size = UDim2.new(1 / # L_177_.tabbuttons, 0, 1, 0)
		end;
		local L_501_ = {}
		local L_502_ = 0;
		local L_503_ = 0;
		local L_504_ = 2000;
		function L_501_:createGroup(L_511_arg0)
			local L_512_ = Instance.new("Frame")
			local L_513_ = Instance.new("Frame")
			local L_514_ = Instance.new("UIListLayout")
			L_502_ = L_502_ - 1;
			L_512_.Parent = L_499_[L_511_arg0 == 0 and "left" or "right"]
			L_512_.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			L_512_.BorderSizePixel = 0;
			L_512_.Size = UDim2.new(1, -5, 0, 10)
			L_512_.ZIndex = L_502_;
			L_512_.Parent.UIListLayout.Padding = UDim.new(0, 5)
			L_513_.Parent = L_512_;
			L_513_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			L_513_.BackgroundTransparency = 1;
			L_513_.Position = UDim2.new(0, 5, 0, 7)
			L_513_.Size = UDim2.new(1, 0, 1, 0)
			L_514_.Parent = L_513_;
			L_514_.Padding = UDim.new(0, 5)
			L_514_.SortOrder = "LayoutOrder"
			local L_515_ = {}
			function L_515_:addToggle(L_516_arg0)
				if not L_516_arg0.flag and L_516_arg0.text then
					L_516_arg0.flag = L_516_arg0.text
				end;
				if not L_516_arg0.flag then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end;
				L_512_.Size = L_512_.Size + UDim2.new(0, 0, 0, 23)
				local L_517_ = Instance.new("TextButton")
				local L_518_ = Instance.new("Frame")
				local L_519_ = Instance.new("TextLabel")
				L_503_ = L_503_ - 1;
				L_517_.Parent = L_513_;
				L_517_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				L_517_.BackgroundTransparency = 1;
				L_517_.Size = UDim2.new(1, 0, 0, 18)
				L_517_.Text = ""
				L_517_.TextColor3 = Color3.fromRGB(0, 0, 0)
				L_517_.TextSize = 14;
				L_517_.ZIndex = L_503_;
				L_518_.Parent = L_517_;
				L_518_.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				L_518_.BorderColor3 = Color3.fromRGB(50, 50, 50)
				L_518_.Size = UDim2.new(0, 18, 0, 18)
				L_519_.Parent = L_518_;
				L_519_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				L_519_.BorderSizePixel = 0;
				L_519_.Position = UDim2.new(1, 10, 0, 0)
				L_519_.Size = UDim2.new(0, 0, 1, 0)
				L_519_.Font = "SourceSans"
				L_519_.Text = L_516_arg0.text or L_516_arg0.flag;
				L_519_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_519_.TextSize = 16;
				L_519_.TextXAlignment = "Left"
				local L_520_ = false;
				local function L_521_func(L_522_arg0)
					L_520_ = L_522_arg0;
					L_518_.BackgroundColor3 = L_520_ and L_177_.libColor or Color3.fromRGB(20, 20, 20)
					env.DemoFlags[L_516_arg0.flag] = L_520_;
					if L_516_arg0.callback then
						L_516_arg0.callback(L_520_)
					end
				end;
				L_517_.MouseButton1Click:Connect(function()
					L_520_ = not L_520_;
					L_518_.BackgroundColor3 = L_520_ and L_177_.libColor or Color3.fromRGB(20, 20, 20)
					env.DemoFlags[L_516_arg0.flag] = L_520_;
					if L_516_arg0.callback then
						L_516_arg0.callback(L_520_)
					end
				end)
				env.DemoFlags[L_516_arg0.flag] = false;
				L_177_.options[L_516_arg0.flag] = {
					type = "toggle",
					changeState = L_521_func,
					skipflag = L_516_arg0.skipflag,
					oldargs = L_516_arg0
				}
				if L_516_arg0.state then
					L_521_func(L_516_arg0.state)
				end
			end;
			function L_515_:addButton(L_523_arg0)
				if not L_523_arg0.callback or not L_523_arg0.text then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end;
				L_512_.Size = L_512_.Size + UDim2.new(0, 0, 0, 23)
				local L_524_ = Instance.new("TextButton")
				L_524_.Parent = L_513_;
				L_524_.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				L_524_.BorderColor3 = Color3.fromRGB(50, 50, 50)
				L_524_.Size = UDim2.new(1, -10, 0, 18)
				L_524_.AutoButtonColor = false;
				L_524_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_524_.Font = "SourceSans"
				L_524_.TextSize = 16;
				L_524_.Text = L_523_arg0.text;
				L_524_.MouseButton1Click:Connect(function()
					if not L_177_.colorpicking then
						L_523_arg0.callback()
					end
				end)
			end;
			function L_515_:addSlider(L_525_arg0)
				if not L_525_arg0.flag or not L_525_arg0.max then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end;
				L_512_.Size = L_512_.Size + UDim2.new(0, 0, 0, 41)
				local L_526_ = Instance.new("Frame")
				local L_527_ = Instance.new("TextButton")
				local L_528_ = Instance.new("TextLabel")
				local L_529_ = Instance.new("Frame")
				local L_530_ = Instance.new("TextLabel")
				L_526_.Parent = L_513_;
				L_526_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				L_526_.BackgroundTransparency = 1;
				L_526_.Size = UDim2.new(1, 0, 0, 36)
				L_527_.Parent = L_526_;
				L_527_.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				L_527_.BorderColor3 = Color3.fromRGB(50, 50, 50)
				L_527_.Position = UDim2.new(0, 0, 0, 18)
				L_527_.Size = UDim2.new(1, -10, 0, 18)
				L_527_.AutoButtonColor = false;
				L_527_.Font = Enum.Font.SourceSans;
				L_527_.Text = ""
				L_527_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_527_.TextSize = 14;
				L_528_.Parent = L_527_;
				L_528_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				L_528_.BackgroundTransparency = 1;
				L_528_.BorderSizePixel = 0;
				L_528_.Position = UDim2.new(0, 0, -1, 0)
				L_528_.Size = UDim2.new(1, 0, 1, 0)
				L_528_.Font = Enum.Font.SourceSans;
				L_528_.Text = L_525_arg0.text or L_525_arg0.flag;
				L_528_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_528_.TextSize = 16;
				L_528_.TextXAlignment = "Left"
				L_528_.TextYAlignment = "Top"
				L_529_.Parent = L_527_;
				L_529_.BackgroundColor3 = L_177_.libColor;
				L_529_.BorderSizePixel = 0;
				L_529_.Size = UDim2.new(0, 0, 1, 0)
				L_529_.ZIndex = 0;
				L_530_.Parent = L_527_;
				L_530_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				L_530_.BackgroundTransparency = 1;
				L_530_.Size = UDim2.new(1, 0, 1, 0)
				L_530_.Font = Enum.Font.SourceSans;
				L_530_.Text = "0"
				L_530_.TextColor3 = Color3.fromRGB(150, 150, 150)
				L_530_.TextSize = 16;
				local L_531_ = false;
				local L_532_ = false;
				local L_533_ = 0;
				local function L_534_func(L_536_arg0)
					if L_536_arg0 ~= 0 then
						L_529_:TweenSize(UDim2.new(L_536_arg0 / L_525_arg0.max, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.01)
					else
						L_529_:TweenSize(UDim2.new(0, 1, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.01)
					end;
					L_530_.Text = L_536_arg0;
					env.DemoFlags[L_525_arg0.flag] = L_536_arg0;
					if L_525_arg0.callback then
						L_525_arg0.callback(L_536_arg0)
					end
				end;
				local function L_535_func()
					if L_532_ or L_177_.scrolling or not L_499_.Visible or L_177_.colorpicking then
						return
					end;
					while L_146_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and L_175_.Enabled do
						L_169_.RenderStepped:Wait()
						L_177_.scrolling = true;
						L_530_.TextColor3 = Color3.fromRGB(255, 255, 255)
						L_532_ = true;
						local L_537_ = L_525_arg0.min + (L_170_.X - L_527_.AbsolutePosition.X) / L_527_.AbsoluteSize.X * (L_525_arg0.max - L_525_arg0.min)
						if L_537_ < 0 then
							L_537_ = 0
						end;
						if L_537_ > L_525_arg0.max then
							L_537_ = L_525_arg0.max
						end;
						L_534_func(math.floor(L_537_))
					end;
					if L_532_ and not L_531_ then
						L_530_.TextColor3 = Color3.fromRGB(150, 150, 150)
					end;
					if not L_175_.Enabled then
						L_531_ = false
					end;
					L_532_ = false;
					L_177_.scrolling = false
				end;
				L_527_.MouseEnter:connect(function()
					if L_532_ or L_531_ then
						return
					end;
					L_531_ = true;
					L_530_.TextColor3 = Color3.fromRGB(255, 255, 255)
					while L_531_ do
						wait()
						L_535_func()
					end
				end)
				L_527_.MouseLeave:connect(function()
					L_531_ = false;
					L_530_.TextColor3 = Color3.fromRGB(150, 150, 150)
				end)
				if L_525_arg0.value then
					L_534_func(L_525_arg0.value)
				end;
				env.DemoFlags[L_525_arg0.flag] = 0;
				L_177_.options[L_525_arg0.flag] = {
					type = "slider",
					changeState = L_534_func,
					skipflag = L_525_arg0.skipflag,
					oldargs = L_525_arg0
				}
				L_534_func(L_525_arg0.value or 0)
			end;
			function L_515_:addDivider()
				L_512_.Size = L_512_.Size + UDim2.new(0, 0, 0, 3)
				local L_538_ = Instance.new("Frame")
				L_538_.Parent = L_513_;
				L_538_.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				L_538_.Size = UDim2.new(1, -10, 0, 1)
				L_538_.BorderSizePixel = 0;
				L_538_.Name = "dontchange"
			end;
			function L_515_:addTextbox(L_539_arg0)
				if not L_539_arg0.flag then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end;
				local L_540_ = Instance.new("TextBox")
				L_512_.Size = L_512_.Size + UDim2.new(0, 0, 0, 23)
				L_540_:GetPropertyChangedSignal('Text'):Connect(function(L_541_arg0)
					env.DemoFlags[L_539_arg0.flag] = L_540_.Text
				end)
				L_540_.Parent = L_513_;
				L_540_.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				L_540_.BorderColor3 = Color3.fromRGB(50, 50, 50)
				L_540_.Size = UDim2.new(1, -10, 0, 18)
				L_540_.ClearTextOnFocus = false;
				L_540_.Font = Enum.Font.SourceSans;
				L_540_.PlaceholderColor3 = Color3.fromRGB(130, 130, 130)
				L_540_.PlaceholderText = L_539_arg0.text or ""
				L_540_.Text = ""
				L_540_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_540_.TextSize = 16;
				env.DemoFlags[L_539_arg0.flag] = ""
				L_177_.options[L_539_arg0.flag] = {
					type = "textbox",
					changeState = function(L_542_arg0)
						L_540_.Text = L_542_arg0
					end,
					skipflag = L_539_arg0.skipflag,
					oldargs = L_539_arg0
				}
			end;
			function L_515_:addKeybind(L_543_arg0)
				if not L_543_arg0.flag then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end;
				L_512_.Size = L_512_.Size + UDim2.new(0, 0, 0, 23)
				local L_544_ = Instance.new("TextButton")
				local L_545_ = Instance.new("TextLabel")
				local L_546_ = Instance.new("TextLabel")
				local L_547_ = false;
				L_544_.Parent = L_513_;
				L_544_.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				L_544_.BorderColor3 = Color3.fromRGB(50, 50, 50)
				L_544_.Size = UDim2.new(0.55, 0, 0, 18)
				L_544_.AutoButtonColor = false;
				L_544_.TextColor3 = Color3.new(1, 1, 1)
				L_544_.Font = "SourceSans"
				L_544_.TextSize = 16;
				L_544_.Text = ""
				L_546_.Parent = L_544_;
				L_546_.BackgroundTransparency = 1;
				L_546_.Position = UDim2.new(0, 0, 0, 0)
				L_546_.Size = UDim2.new(1, 0, 1, 0)
				L_546_.Font = "SourceSans"
				L_546_.Text = ""
				L_546_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_546_.TextSize = 16;
				L_546_.TextXAlignment = "Left"
				L_546_.ClipsDescendants = true;
				L_546_.TextXAlignment = "Center"
				L_545_.Parent = L_544_;
				L_545_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				L_545_.BorderSizePixel = 0;
				L_545_.Position = UDim2.new(1, 10, 0, 0)
				L_545_.Size = UDim2.new(0, 0, 1, 0)
				L_545_.Font = "SourceSans"
				L_545_.Text = L_543_arg0.text or L_543_arg0.flag;
				L_545_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_545_.TextSize = 16;
				L_545_.TextXAlignment = "Left"
				function updateValue(L_548_arg0)
					env.DemoFlags[L_543_arg0.flag] = L_548_arg0;
					L_546_.Text = string.split(tostring(L_548_arg0), ".")[3]:gsub("MouseButton", "Mouse")
				end;
				L_146_.InputBegan:Connect(function(L_549_arg0)
					local L_550_ = L_549_arg0.KeyCode == Enum.KeyCode.Unknown and L_549_arg0.UserInputType or L_549_arg0.KeyCode;
					if L_547_ then
						if not table.find(L_177_.blacklisted, L_550_) then
							L_547_ = false;
							env.DemoFlags[L_543_arg0.flag] = L_550_;
							L_546_.Text = string.split(tostring(L_550_), ".")[3]:gsub("MouseButton", "Mouse")
						end
					end;
					if not L_547_ and L_550_ == env.DemoFlags[L_543_arg0.flag] and L_543_arg0.callback then
						L_543_arg0.callback()
					end
				end)
				L_544_.MouseButton1Click:Connect(function()
					env.DemoFlags[L_543_arg0.flag] = Enum.KeyCode.Unknown;
					L_546_.Text = "..."
					L_547_ = true
				end)
				env.DemoFlags[L_543_arg0.flag] = Enum.KeyCode.Unknown;
				L_177_.options[L_543_arg0.flag] = {
					type = "keybind",
					changeState = updateValue,
					skipflag = L_543_arg0.skipflag,
					oldargs = L_543_arg0
				}
				updateValue(L_543_arg0.key or Enum.KeyCode.Unknown)
			end;
			function L_515_:addList(L_551_arg0)
				if not L_551_arg0.flag or not L_551_arg0.values then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end;
				L_512_.Size = L_512_.Size + UDim2.new(0, 0, 0, 23)
				L_177_.multiZindex = L_177_.multiZindex - 1;
				local L_552_ = Instance.new("TextButton")
				local L_553_ = Instance.new("Frame")
				local L_554_ = Instance.new("UIListLayout")
				local L_555_ = Instance.new("TextLabel")
				local L_556_ = Instance.new("TextLabel")
				L_554_.Parent = L_553_;
				L_554_.Padding = UDim.new(0, 0)
				L_554_.SortOrder = "LayoutOrder"
				L_552_.Parent = L_513_;
				L_552_.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				L_552_.BorderColor3 = Color3.fromRGB(50, 50, 50)
				L_552_.Size = UDim2.new(0.65, 0, 0, 18)
				L_552_.AutoButtonColor = false;
				L_552_.TextColor3 = Color3.new(1, 1, 1)
				L_552_.Font = "SourceSans"
				L_552_.TextSize = 16;
				L_552_.Text = ""
				L_552_.ZIndex = L_177_.multiZindex;
				L_556_.Parent = L_552_;
				L_556_.BackgroundTransparency = 1;
				L_556_.Position = UDim2.new(0, 0, 0, 0)
				L_556_.Size = UDim2.new(1, 0, 1, 0)
				L_556_.Font = "SourceSans"
				L_556_.Text = L_551_arg0.multiselect and "..." or ""
				L_556_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_556_.TextSize = 16;
				L_556_.TextXAlignment = "Left"
				L_556_.ClipsDescendants = true;
				L_556_.TextXAlignment = "Center"
				L_553_.ZIndex = L_177_.multiZindex;
				L_553_.Visible = false;
				L_553_.Parent = L_552_;
				L_553_.Transparency = 0;
				L_553_.Size = UDim2.new(1, 0, 0, # L_551_arg0.values * 18)
				L_553_.BorderColor3 = Color3.fromRGB(50, 50, 50)
				L_553_.Position = UDim2.new(0, 0, 1, 0)
				L_555_.Parent = L_552_;
				L_555_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				L_555_.BorderSizePixel = 0;
				L_555_.Position = UDim2.new(1, 10, 0, 0)
				L_555_.Size = UDim2.new(0, 0, 1, 0)
				L_555_.Font = "SourceSans"
				L_555_.Text = L_551_arg0.text or L_551_arg0.flag;
				L_555_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_555_.TextSize = 16;
				L_555_.TextXAlignment = "Left"
				local function L_557_func(L_558_arg0)
					if L_558_arg0 == nil then
						L_556_.Text = ""
						return
					end;
					if L_551_arg0.multiselect then
						if type(L_558_arg0) == "string" then
							if not table.find(L_177_.options[L_551_arg0.flag].values, L_558_arg0) then
								return
							end;
							if table.find(env.DemoFlags[L_551_arg0.flag], L_558_arg0) then
								for L_560_forvar0, L_561_forvar1 in env.DemoFlags[L_551_arg0.flag] do
									if L_561_forvar1 == L_558_arg0 then
										table.remove(env.DemoFlags[L_551_arg0.flag], L_560_forvar0)
									end
								end
							else
								table.insert(env.DemoFlags[L_551_arg0.flag], L_558_arg0)
							end
						else
							env.DemoFlags[L_551_arg0.flag] = L_558_arg0
						end;
						local L_559_ = ""
						for L_562_forvar0, L_563_forvar1 in env.DemoFlags[L_551_arg0.flag] do
							local L_564_ = L_562_forvar0 ~= # env.DemoFlags[L_551_arg0.flag] and "," or ""
							L_559_ = L_559_ .. " " .. L_563_forvar1 .. L_564_
						end;
						if L_559_ == "" then
							L_559_ = "..."
						end;
						for L_565_forvar0, L_566_forvar1 in next, L_553_:GetChildren() do
							if L_566_forvar1.ClassName ~= "TextButton" then
								continue;
							end;
							L_566_forvar1.TextColor3 = Color3.new(0.65, 0.65, 0.65)
							for L_567_forvar0, L_568_forvar1 in next, env.DemoFlags[L_551_arg0.flag] do
								if L_566_forvar1.Name == L_568_forvar1 then
									L_566_forvar1.TextColor3 = Color3.new(1, 1, 1)
								end
							end
						end;
						L_556_.Text = L_559_;
						if L_551_arg0.callback then
							L_551_arg0.callback(env.DemoFlags[L_551_arg0.flag])
						end
					else
						if not table.find(L_177_.options[L_551_arg0.flag].values, L_558_arg0) then
							L_558_arg0 = L_177_.options[L_551_arg0.flag].values[1]
						end;
						env.DemoFlags[L_551_arg0.flag] = L_558_arg0;
						for L_569_forvar0, L_570_forvar1 in next, L_553_:GetChildren() do
							if L_570_forvar1.ClassName ~= "TextButton" then
								continue;
							end;
							L_570_forvar1.TextColor3 = Color3.new(0.65, 0.65, 0.65)
							if L_570_forvar1.Name == env.DemoFlags[L_551_arg0.flag] then
								L_570_forvar1.TextColor3 = Color3.new(1, 1, 1)
							end
						end;
						L_553_.Visible = false;
						if env.DemoFlags[L_551_arg0.flag] then
							L_556_.Text = env.DemoFlags[L_551_arg0.flag]
							if L_551_arg0.callback then
								L_551_arg0.callback(env.DemoFlags[L_551_arg0.flag])
							end
						end
					end
				end;
				function refresh(L_571_arg0)
					for L_572_forvar0, L_573_forvar1 in next, L_553_:GetChildren() do
						if L_573_forvar1.ClassName == "TextButton" then
							L_573_forvar1:Destroy()
						end
					end;
					for L_574_forvar0, L_575_forvar1 in L_571_arg0 do
						local L_576_ = Instance.new("TextButton")
						L_576_.ZIndex = 1000;
						L_576_.Visible = true;
						L_576_.Parent = L_553_;
						L_576_.Transparency = 0;
						L_576_.Size = UDim2.new(1, 0, 0, 18)
						L_576_.Position = UDim2.new(0, 0, 0, 0)
						L_576_.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
						L_576_.TextColor3 = L_551_arg0.multiselect and Color3.new(0.65, 0.65, 0.65) or Color3.new(1, 1, 1)
						L_576_.BorderSizePixel = 0;
						L_576_.AutoButtonColor = false;
						L_576_.TextSize = 16;
						L_576_.Font = "SourceSans"
						L_576_.Text = L_575_forvar1;
						L_576_.Name = L_575_forvar1;
						L_576_.MouseButton1Click:Connect(function()
							L_557_func(L_575_forvar1)
						end)
					end;
					L_177_.options[L_551_arg0.flag].values = L_571_arg0;
					L_557_func(table.find(L_177_.options[L_551_arg0.flag].values, env.DemoFlags[L_551_arg0.flag]) and env.DemoFlags[L_551_arg0.flag] or L_177_.options[L_551_arg0.flag].values[1])
				end;
				L_552_.MouseButton1Click:Connect(function()
					if not L_177_.colorpicking then
						L_553_.Visible = not L_553_.Visible
					end
				end)
				table.insert(L_177_.toInvis, L_553_)
				env.DemoFlags[L_551_arg0.flag] = L_551_arg0.multiselect and {} or ""
				L_177_.options[L_551_arg0.flag] = {
					type = "list",
					changeState = L_557_func,
					values = L_551_arg0.values,
					refresh = refresh,
					skipflag = L_551_arg0.skipflag,
					oldargs = L_551_arg0
				}
				refresh(L_551_arg0.values)
				L_557_func(L_551_arg0.value or not L_551_arg0.multiselect and L_551_arg0.values[1] or "abcdefghijklmnopqrstuwvxyz")
			end;
			function L_515_:addColorpicker(L_577_arg0)
				if not L_577_arg0.flag then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end;
				L_512_.Size = L_512_.Size + UDim2.new(0, 0, 0, 20)
				L_177_.multiZindex = L_177_.multiZindex - 1;
				L_503_ = L_503_ - 1;
				L_504_ = L_504_ - 1;
				local L_578_ = Instance.new("TextButton")
				local L_579_ = Instance.new("Frame")
				local L_580_ = Instance.new("TextLabel")
				local L_581_ = Instance.new("ImageLabel")
				local L_582_ = Instance.new("ImageLabel")
				L_579_.ZIndex = L_177_.multiZindex;
				L_579_.Visible = false;
				L_579_.Parent = L_578_;
				L_579_.Transparency = 0;
				L_579_.Size = UDim2.new(0, 120, 0, 100)
				L_579_.Position = UDim2.new(1, 0, 1, 0)
				L_581_.Parent = L_579_;
				L_581_.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
				L_581_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				L_581_.Size = UDim2.new(0, 100, 0, 100)
				L_581_.Image = "rbxassetid://2615689005"
				L_581_.Name = "dontchange"
				L_582_.Parent = L_579_;
				L_582_.AnchorPoint = Vector2.new(1, 0)
				L_582_.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
				L_582_.BorderColor3 = Color3.fromRGB(0, 0, 0)
				L_582_.Position = UDim2.new(1, 0, 0, 0)
				L_582_.Size = UDim2.new(0, 20, 0, 100)
				L_582_.Image = "rbxassetid://2615692420"
				L_578_.Parent = L_513_;
				L_578_.BackgroundColor3 = L_577_arg0.color or Color3.new(1, 1, 1)
				L_578_.BorderColor3 = Color3.fromRGB(50, 50, 50)
				L_578_.Size = UDim2.new(0, 35, 0, 15)
				L_578_.AutoButtonColor = false;
				L_578_.ZIndex = L_577_arg0.ontop and L_504_ or L_503_;
				L_578_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_578_.Font = "SourceSans"
				L_578_.TextSize = 16;
				L_578_.Text = ""
				L_578_.Name = "dontchange"
				L_580_.Parent = L_578_;
				L_580_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				L_580_.BorderSizePixel = 0;
				L_580_.Position = UDim2.new(1, 10, 0, 0)
				L_580_.Size = UDim2.new(0, 0, 1, 0)
				L_580_.Font = "SourceSans"
				L_580_.Text = L_577_arg0.text or L_577_arg0.flag;
				L_580_.TextColor3 = Color3.fromRGB(255, 255, 255)
				L_580_.TextSize = 16;
				L_580_.TextXAlignment = "Left"
				L_578_.MouseButton1Click:Connect(function()
					L_579_.Visible = not L_579_.Visible
				end)
				local function L_583_func(L_593_arg0, L_594_arg1)
					if typeof(L_593_arg0) == "table" then
						L_593_arg0 = L_594_arg1
					end;
					L_578_.BackgroundColor3 = L_593_arg0;
					env.DemoFlags[L_577_arg0.flag] = L_593_arg0;
					if L_577_arg0.callback then
						L_577_arg0.callback(L_593_arg0)
					end
				end;
				local L_584_, L_585_ = Color3.new(1, 1, 1), Color3.new(0, 0, 0)
				local L_586_ = {
					Color3.new(1, 0, 0),
					Color3.new(1, 1, 0),
					Color3.new(0, 1, 0),
					Color3.new(0, 1, 1),
					Color3.new(0, 0, 1),
					Color3.new(1, 0, 1),
					Color3.new(1, 0, 0)
				}
				local L_587_ = game:GetService("RunService").Heartbeat;
				local L_588_, L_589_, L_590_ = 0, 0, 0;
				local L_591_, L_592_ = 0, 0;
				L_582_.MouseEnter:Connect(function()
					local L_595_ = L_582_.InputBegan:connect(function(L_597_arg0)
						if L_597_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
							while L_587_:wait() and L_146_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								L_177_.colorpicking = true;
								local L_598_ = (L_590_ - L_582_.AbsolutePosition.Y - 36) / L_582_.AbsoluteSize.Y;
								local L_599_ = math.max(1, math.min(7, math.floor((L_598_ * 7 + 0.5) * 100) / 100))
								local L_600_ = L_586_[math.floor(L_599_)]
								local L_601_ = L_586_[math.ceil(L_599_)]
								local L_602_ = L_584_:lerp(L_581_.BackgroundColor3, L_591_):lerp(L_585_, L_592_)
								L_581_.BackgroundColor3 = L_600_:lerp(L_601_, L_599_ - math.floor(L_599_)) or Color3.new(0, 0, 0)
								L_583_func(L_602_)
							end;
							L_177_.colorpicking = false
						end
					end)
					local L_596_;
					L_596_ = L_582_.MouseLeave:connect(function()
						L_595_:disconnect()
						L_596_:disconnect()
					end)
				end)
				L_581_.MouseEnter:Connect(function()
					local L_603_ = L_581_.InputBegan:connect(function(L_605_arg0)
						if L_605_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
							while L_587_:wait() and L_146_:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								L_177_.colorpicking = true;
								local L_606_ = (L_588_ - L_581_.AbsolutePosition.X) / L_581_.AbsoluteSize.X;
								local L_607_ = (L_589_ - L_581_.AbsolutePosition.Y - 36) / L_581_.AbsoluteSize.Y;
								local L_608_ = L_584_:lerp(L_581_.BackgroundColor3, L_606_):lerp(L_585_, L_607_)
								L_583_func(L_608_)
								L_591_, L_592_ = L_606_, L_607_
							end;
							L_177_.colorpicking = false
						end
					end)
					local L_604_;
					L_604_ = L_581_.MouseLeave:connect(function()
						L_603_:disconnect()
						L_604_:disconnect()
					end)
				end)
				L_582_.MouseMoved:connect(function(L_609_arg0, L_610_arg1)
					L_590_ = L_610_arg1
				end)
				L_581_.MouseMoved:connect(function(L_611_arg0, L_612_arg1)
					L_588_, L_589_ = L_611_arg0, L_612_arg1
				end)
				table.insert(L_177_.toInvis, L_579_)
				env.DemoFlags[L_577_arg0.flag] = Color3.new(1, 1, 1)
				L_177_.options[L_577_arg0.flag] = {
					type = "colorpicker",
					changeState = L_583_func,
					skipflag = L_577_arg0.skipflag,
					oldargs = L_577_arg0
				}
				L_583_func(L_577_arg0.color or Color3.new(1, 1, 1))
			end;
			function L_515_:addEventList(L_613_arg0)
			end;
			return L_515_, L_512_
		end;
		return L_501_, L_499_
	end;
	if not isfolder("cipex_configs") then
		makefolder("cipex_configs")
	end;
	if not isfolder("cipex_configs/democfg") then
		makefolder("cipex_configs/democfg")
	end;
	function L_177_:saveConfig()
		local L_614_ = env.DemoFlags["config_name"]
		if L_614_ == "" then
			L_614_ = env.DemoFlags["selected_config"]
		end;
		local L_615_ = {}
		for L_616_forvar0, L_617_forvar1 in next, env.DemoFlags do
			if L_177_.options[L_616_forvar0].skipflag then
				continue;
			end;
			if typeof(L_617_forvar1) == "Color3" then
				L_615_[L_616_forvar0] = {
					L_617_forvar1.R,
					L_617_forvar1.G,
					L_617_forvar1.B
				}
			elseif typeof(L_617_forvar1) == "EnumItem" then
				L_615_[L_616_forvar0] = {
					string.split(tostring(L_617_forvar1), ".")[2],
					string.split(tostring(L_617_forvar1), ".")[3]
				}
			else
				L_615_[L_616_forvar0] = L_617_forvar1
			end
		end;
		writefile("cipex_configs/democfg/" .. L_614_ .. ".cfg", game:GetService("HttpService"):JSONEncode(L_615_))
		L_177_:refreshConfigs()
	end;
	function L_177_:loadConfig()
		local L_618_ = env.DemoFlags["selected_config"]
		if not isfile("cipex_configs/democfg/" .. L_618_ .. ".cfg") then
			return
		end;
		local L_619_ = game:GetService("HttpService"):JSONDecode(readfile("cipex_configs/democfg/" .. L_618_ .. ".cfg"))
		for L_620_forvar0, L_621_forvar1 in next, L_177_.options do
			spawn(function()
				pcall(function()
					if L_619_[L_620_forvar0] then
						if L_621_forvar1.type == "colorpicker" then
							L_621_forvar1.changeState(Color3.new(L_619_[L_620_forvar0][1], L_619_[L_620_forvar0][2], L_619_[L_620_forvar0][3]))
						elseif L_621_forvar1.type == "keybind" then
							L_621_forvar1.changeState(Enum[L_619_[L_620_forvar0][1]][L_619_[L_620_forvar0][2]])
						else
							if L_619_[L_620_forvar0] ~= env.DemoFlags[L_620_forvar0] then
								L_621_forvar1.changeState(L_619_[L_620_forvar0])
							end
						end
					else
						if L_621_forvar1.type == "toggle" then
							L_621_forvar1.changeState(false)
						elseif L_621_forvar1.type == "slider" then
							L_621_forvar1.changeState(L_621_forvar1.args.value or 0)
						elseif L_621_forvar1.type == "textbox" or L_621_forvar1.type == "list" then
							L_621_forvar1.changeState(L_621_forvar1.args.text or "")
						elseif L_621_forvar1.type == "colorpicker" then
							L_621_forvar1.changeState(L_621_forvar1.args.color or Color3.new(1, 1, 1))
						elseif option.type == "list" then
							L_621_forvar1.changeState("")
						elseif option.type == "keybind" then
							L_621_forvar1.changeState(L_621_forvar1.args.key or Enum.KeyCode.Unknown)
						end
					end
				end)
			end)
		end
	end;
	function L_177_:refreshConfigs()
		local L_622_ = {}
		for L_623_forvar0, L_624_forvar1 in next, listfiles("cipex_configs/democfg") do
			table.insert(L_622_, L_624_forvar1:split("\\")[2]:split(".")[1])
		end;
		L_177_.options["selected_config"].refresh(L_622_)
	end;
	function L_177_:deleteConfig()
		if isfile("cipex_configs/democfg/" .. env.DemoFlags["selected_config"] .. ".cfg") then
			delfile("cipex_configs/democfg/" .. env.DemoFlags["selected_config"] .. ".cfg")
			L_177_:refreshConfigs()
		end
	end;

spawn(function()
	local demoListFrame = L_174_:WaitForChild("demolist"):WaitForChild("ScrollingFrame")
	demoListFrame:WaitForChild("UIListLayout").SortOrder = Enum.SortOrder.Name
	
	for _, child in demoListFrame:GetChildren() do
		if child:IsA("TextButton") and child.Name ~= "example" then
			child:Destroy()
		end
	end
	
	if isfolder("clarity.tk/demos") then
		for _, demoPath in listfiles("clarity.tk/demos") do
			local demoName = demoPath:match("([^/\\]+)$")
			if isfolder(demoPath) then
				local newBtn = demoListFrame.example:Clone()
				newBtn.Text = demoName
				newBtn.Name = demoName
				newBtn.Visible = true
				newBtn.Parent = demoListFrame
				newBtn.MouseButton1Click:Connect(function()
					playDemo(demoName)
				end)
			end
		end
	end
end)

env.playTick = playTick
end
end)
 





