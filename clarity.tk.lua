local env = getgenv(); val_635 = true


	local __bypass_old
	__bypass_old = hookmetamethod(game, "__namecall", function(b, ...)
		local c = getnamecallmethod()
		local n = b.Name
		if n == "HaIIoooooooooooo" or n == "Hallooooooooooooo" or n == "Boogers" then
			if c == "FireServer" or c == "FireUnreliable" or c == "InvokeServer" then
				return nil
			end
		end
		return __bypass_old(b, ...)
	end)


if game.PlaceId == 101013872711019 and val_635 then
    local rs = game:GetService("ReplicatedStorage"); local demosFolder = rs:FindFirstChild("Demos")
    if not demosFolder then
        demosFolder = Instance.new("Folder"); demosFolder.Name = "Demos"; demosFolder.Parent = rs
    end
    if listfiles then
        for _, folderPath in listfiles("clarity.tk/demos/") do
            local folderName = tostring(folderPath):match("([^/\\]+)$") or tostring(folderPath); local folderObj = Instance.new("Folder", demosFolder); folderObj.Name = folderName
            for _, filePath in listfiles(folderPath) do
                local fileName = filePath:match("([^/\\]+)%.tick$") or filePath:match("([^/\\]+)%.txt$")
                if fileName then
                    local strVal = Instance.new("StringValue"); strVal.Name = fileName; strVal.Parent = folderObj; strVal.Value = readfile(filePath)
                end
            end
        end
    end
    return
end
val_700 = os.time(); local val_824; env.runService = game:GetService"RunService"; env.textService = game:GetService"TextService"; env.inputService = game:GetService"UserInputService"; env.tweenService = game:GetService"TweenService"
if env.library then
	env.library:Unload()
end
GAME_JUMP_HEIGHT = 2.225; GAME_JUMP_POWER = 19.5
CHAMS_MATERIALS = { "ForceField", "Ghost", "Neon", "SmoothPlastic", "Plastic", "Glass" }
GHOST_TEXTURE = "rbxassetid://8133639623"
function chamsMaterial(name) return name == "Ghost" and "ForceField" or name or "ForceField" end
env.runService.Stepped:Connect(function(_, dt)
	if not (library_flags and library_flags["Jumpbug"] and env.jbBindHeld) then
		env.jbHoldUntil = 0; return
	end
	local char = game:GetService("Players").LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart"); local hum = char and char:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum or hum.Health <= 0 then return end
	local gravity = workspace.Gravity; local now = tick(); local vel = hrp.AssemblyLinearVelocity
	local grounded = hum.FloorMaterial ~= Enum.Material.Air
	local uis = game:GetService("UserInputService")
	local spaceDown = not uis:GetFocusedTextBox() and uis:IsKeyDown(Enum.KeyCode.Space)
	local pressed = spaceDown and not env.jbSpacePrev; env.jbSpacePrev = spaceDown
	if grounded and pressed and now >= (env.jbHoldUntil or 0) and now - (env.jbFired or 0) > 0.35 then
		env.jbFired = now; env.jbExpectedY = math.sqrt(2 * gravity * GAME_JUMP_HEIGHT * (library_flags["jbHeight"] or 4))
		env.jbHoldUntil = now + 1; env.jbLastY = hrp.Position.Y; env.lastJumpbugTime = now
		hrp.AssemblyLinearVelocity = Vector3.new(vel.X, env.jbExpectedY, vel.Z)
	elseif now < (env.jbHoldUntil or 0) then
		env.jbExpectedY = (env.jbExpectedY or 0) - gravity * dt
		local rising = hrp.Position.Y > (env.jbLastY or 0) + 0.01; env.jbLastY = hrp.Position.Y
		if env.jbExpectedY <= 0 or (not rising and vel.Y <= 0) then
			env.jbHoldUntil = 0
		elseif vel.Y < env.jbExpectedY - 0.5 then
			hrp.AssemblyLinearVelocity = Vector3.new(vel.X, env.jbExpectedY, vel.Z)
		end
	end
end)
for _, conn in { "mimicStateConn", "jumpConn", "ebRedirConn", "thirdPersonConn" } do
	if env[conn] then pcall(function() env[conn]:Disconnect() end) end
	env[conn] = nil
end
env.mimicHum = nil; env.currentHum = nil; env.ebRedirHum = nil; env.mimicPeakY = nil; env.mimicLastPeak = nil; env.mimicWasFalling = false
env.fmOnLadder = false; env.fmTriggered = false; env.fmCarry = nil; env.fmApproachSpeed = nil
env.ladderBugActive = false; env.lbFrames = 0; env.lbApproach = nil; env.lbLastZ = nil
env.ejBindHeld = false; env.adBindHeld = false; env.autoDucking = false
env.bindListening = false; env.ebHolding = false; env.jbBindHeld = false; env.wcBindHeld = false; env.lbBindHeld = false; env.jetpackBindHeld = false; env.surfingBindHeld = false; env.fmActiveHold = false; env.headboundActive = false; env.hookJP = nil
UI_Library = { tabs = {}, draggable = true, flags = {}, title = "YE BRO U BRAINLESS IF U REALLY DUMP IT 3iq script is free", open = false, mousestate = inputService.MouseIconEnabled, popup = nil, instances = {}, connections = {}, options = {}, notifications = {}, tabSize = 0, theme = {}, foldername = "clarity.tk/configs", fileext = ".txt" }
library_flags = UI_Library.flags; env.library = UI_Library; env.library_flags = library_flags; env._cursor_outer = Drawing.new("Circle"); env._cursor_outer.Color = Color3.new(0, 0, 0); env._cursor_outer.Thickness = 2; env._cursor_outer.NumSides = 24; env._cursor_outer.Radius = 5; env._cursor_outer.Filled = false; env._cursor_outer.Visible = false; env._cursor_inner = Drawing.new("Circle"); env._cursor_inner.Color = Color3.new(1, 1, 1); env._cursor_inner.Thickness = 1; env._cursor_inner.NumSides = 24; env._cursor_inner.Radius = 3; env._cursor_inner.Filled = true; env._cursor_inner.Visible = false; local val_914, val_934, val_973, val_1015, val_357; val_409 = { Enum.KeyCode.Unknown, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D, Enum.KeyCode.Slash, Enum.KeyCode.Tab, Enum.KeyCode.Escape }; val_460 = {}
for _, _mbName in { "MouseButton1", "MouseButton2", "MouseButton3", "MouseButton4", "MouseButton5" } do
	local _ok, _enum = pcall(function() return Enum.UserInputType[_mbName] end)
	if _ok and _enum then
		table.insert(val_460, _enum)
	end
end
UI_Library.round = function(value, multiple)
	multiple = multiple or 1; local rounded 
	if typeof(value) == "Vector2" then
		rounded = Vector2.new(UI_Library.round(value.X), UI_Library.round(value.Y))
	elseif typeof(value) == "Color3" then
		return UI_Library.round(value.r * 255), UI_Library.round(value.g * 255), UI_Library.round(value.b * 255)
	else
		rounded = math.floor(value / multiple + math.sign(value) * 0.5) * multiple 
		if rounded < 0 then
			rounded = rounded + multiple
		end 
		return rounded
	end 
	return rounded
end 
function UI_Library:Create(var_16, var_2)
	var_2 = var_2 or {}
	if not var_16 then
		return
	end 
	local val_917 = var_16 == "Square" or var_16 == "Line" or var_16 == "Text" or var_16 == "Quad" or var_16 == "Circle" or var_16 == "Triangle"; local val_918 = val_917 and Drawing or Instance; local val_919 = val_918.new(var_16)
	for var_26, var_74 in var_2 do
		val_919[var_26] = var_74
	end 
	table.insert(self.instances, { object = val_919, method = val_917 })
	return val_919
end 
function UI_Library:AddConnection(var_44, var_11, var_205)
	var_205 = type(var_11) == "function" and var_11 or var_205 
	var_44 = var_44:connect(var_205)
	if var_11 ~= var_205 then
		self.connections[var_11] = var_44
	else
		table.insert(self.connections, var_44)
	end 
	return var_44
end 
function UI_Library:Unload()
	inputService.MouseIconEnabled = self.mousestate 
	for var_108, var_46 in self.connections do
		var_46:Disconnect()
	end 
	for var_190, var_119 in self.instances do
		if var_119.method then
			pcall(function()
				var_119.object:Remove()
			end)
		else
			var_119.object:Destroy()
		end
	end 
	for var_83, var_272 in self.options do
		if var_272.type == "toggle" then
			pcall(function()
				var_272:SetState()
			end)
		end
	end 
	UI_Library = nil; env.library = nil
end 
UI_Library.lastConfig = ""
function UI_Library:LoadConfig(L_732_arg0, L_733_arg1)
	UI_Library.lastConfig = L_732_arg0 or UI_Library.lastConfig; loadingCFG = true; changing = true; local val_921, val_922 = nil, {}; local fileData = nil
	if L_733_arg1 then
		val_921, fileData = pcall(function() return L_733_arg1 end)
	else
		val_921, fileData = pcall(function()
			return readfile(self.foldername .. "/" .. L_732_arg0 .. self.fileext)
		end)
	end
	if val_921 and fileData and fileData ~= "" then
		if string.sub(fileData, 1, 1) == "{" then
			pcall(function()
				val_922 = game:GetService"HttpService":JSONDecode(fileData)
			end)
		else
			for line in string.gmatch(fileData, "[^\r\n]+") do
				local eqPos = string.find(line, "=")
				if eqPos then
					local key = string.sub(line, 1, eqPos - 1); local data = string.sub(line, eqPos + 1); local colonPos = string.find(data, ":")
					if colonPos then
						local typeStr = string.sub(data, 1, colonPos - 1); local valStr = string.sub(data, colonPos + 1)
						if typeStr == "toggle" then
							val_922[key] = tonumber(valStr)
						elseif typeStr == "color" then
							local parts = string.split(valStr, ",")
							if #parts >= 3 then
								local r = tonumber(parts[1]) or tonumber((string.gsub(parts[1], ",", "."))) or tonumber((string.gsub(parts[1], "%.", ","))) or 1; local g = tonumber(parts[2]) or tonumber((string.gsub(parts[2], ",", "."))) or tonumber((string.gsub(parts[2], "%.", ","))) or 1; local b = tonumber(parts[3]) or tonumber((string.gsub(parts[3], ",", "."))) or tonumber((string.gsub(parts[3], "%.", ","))) or 1
								if r > 1 or g > 1 or b > 1 or (r == 0 and g == 0 and b == 0 and not string.find(valStr, "%.")) then
									r, g, b = r / 255, g / 255, b / 255
								end
								val_922[key] = {r, g, b}
							end
							if #parts == 4 then
								val_922[key .. " Transparency"] = tonumber(parts[4]) or tonumber((string.gsub(parts[4], "%.", ","))) or 0
							end
						elseif typeStr == "bind" then
							val_922[key] = valStr
						elseif typeStr == "list" then
							local tbl = {}
							for item in string.gmatch(valStr, "([^,]+)") do tbl[item] = true end
							val_922[key] = tbl
						elseif typeStr == "number" then
							val_922[key] = tonumber(valStr)
						else
							if typeStr == "string" and string.match(valStr, "^table: 0x") then
								val_922[key] = {}
							else
								val_922[key] = valStr
							end
						end
					end
				end
			end
		end
	end
	do local _opt = UI_Library.options["Loop Kill"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
	do local _opt = UI_Library.options["Target ESP"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
	if not val_921 and L_733_arg1 ~= nil then
		loadingCFG = false; changing = false 
		return true
	end 
	if table.find(self:GetConfigs(), L_732_arg0) or L_733_arg1 ~= nil then
		local colorCount = 0
		for L_736_forvar0, L_737_forvar1 in self.options do
			if type(L_737_forvar1) == "table" and L_737_forvar1.type ~= "button" and L_737_forvar1.flag and not L_737_forvar1.skipflag then
				if L_737_forvar1.type == "toggle" then
					if val_922[L_737_forvar1.flag] ~= nil then
						spawn(function()
							pcall(function() L_737_forvar1:SetState(val_922[L_737_forvar1.flag] == 1) end)
						end)
					end
				elseif L_737_forvar1.type == "color" then
					local colorData = val_922[L_737_forvar1.flag]
					if colorData then
						colorCount = colorCount + 1; local clr = Color3.new(colorData[1], colorData[2], colorData[3]); L_737_forvar1.color = clr; library_flags[L_737_forvar1.flag] = clr
						spawn(function()
							pcall(function() L_737_forvar1:SetColor(colorData) end)
						end)
						local transVal = val_922[L_737_forvar1.flag .. " Transparency"]
						if L_737_forvar1.trans and transVal then
							L_737_forvar1.trans = transVal; library_flags[L_737_forvar1.flag .. " Transparency"] = 1 - transVal
							spawn(function()
								pcall(function() L_737_forvar1:SetTrans(transVal) end)
							end)
						end
					end
				elseif L_737_forvar1.type == "bind" then
					if val_922[L_737_forvar1.flag] then
						spawn(function()
							pcall(function() L_737_forvar1:SetKey(val_922[L_737_forvar1.flag]) end)
						end)
					end
				elseif L_737_forvar1.type == "list" and L_737_forvar1.flag == "skinGloveModel" then
					spawn(function()
						wait(0.1)
						pcall(function() L_737_forvar1:SetValue(val_922[L_737_forvar1.flag]) end)
						wait(0.1); local skinOption = self.options["skinGloveSkin"]
						if skinOption and val_922["skinGloveSkin"] then
							pcall(function() skinOption:SetValue(val_922["skinGloveSkin"]) end)
						end
					end)
				elseif L_737_forvar1.flag == "skinGloveSkin" then
				else
					if val_922[L_737_forvar1.flag] ~= nil then
						spawn(function()
							pcall(function() L_737_forvar1:SetValue(val_922[L_737_forvar1.flag]) end)
						end)
					end
				end
			end
		end
		for key, val in val_922 do
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
			applyPos("ui_pos_SpectatorList", env.SpectatorList); applyPos("ui_pos_KeybindsList", env.KeybindsList); applyPos("ui_pos_mainFrame", env.MenuFrame); applyPos("ui_pos_RouteCalc", env.RouteCalc); applyPos("ui_pos_PracticePanel", env.PracticePanel)
		end)
		spawn(function()
			wait(0.5)
			if library_flags["skinKnifeModel"] then env.lastKnife = library_flags["skinKnifeModel"] end
			if library_flags["skinGloveModel"] then env.lastGlove = library_flags["skinGloveModel"] end
			if library_flags["skinGloveSkin"] then env.lastGloveSkin = library_flags["skinGloveSkin"] end
			pcall(function()
				if UI_Library.options["skinSleeveCT"] and library_flags["skinSleeveCT"] then UI_Library.options["skinSleeveCT"]:SetValue(library_flags["skinSleeveCT"]) end
				if UI_Library.options["skinSleeveT"] and library_flags["skinSleeveT"] then UI_Library.options["skinSleeveT"]:SetValue(library_flags["skinSleeveT"]) end
				if UI_Library.options["skinSleeveChanger"] and library_flags["skinSleeveChanger"] ~= nil then UI_Library.options["skinSleeveChanger"]:SetState(library_flags["skinSleeveChanger"] == true) end
			end)
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
	end 
	loadingCFG = false; changing = false 
	do local _opt = UI_Library.options["Loop Kill"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
	do local _opt = UI_Library.options["Target ESP"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
end 
function UI_Library:SaveConfig(L_738_arg0, L_739_arg1, L_740_arg2)
	local strData = ""
	pcall(function()
		local function sPos(name, obj)
			if obj then library_flags["ui_pos_"..name] = tostring(obj.Position.X.Scale)..","..tostring(obj.Position.X.Offset)..","..tostring(obj.Position.Y.Scale)..","..tostring(obj.Position.Y.Offset) end
		end
		local cg = game:GetService("CoreGui"):FindFirstChild("NativeWatermark")
		if cg then sPos("Watermark", cg:FindFirstChild("Container")) end
		sPos("SpectatorList", env.SpectatorList); sPos("KeybindsList", env.KeybindsList); sPos("mainFrame", env.MenuFrame); sPos("RouteCalc", env.RouteCalc); sPos("PracticePanel", env.PracticePanel)
	end)
	for _, opt in self.options do
		if opt.type ~= "button" and opt.flag and not opt.skipflag then
			local line = opt.flag .. "="
			if opt.type == "toggle" then
				line = line .. "toggle:" .. (opt.state and "1" or "0")
			elseif opt.type == "color" then
				local _r, _g, _b = math.floor((opt.color.R or opt.color.r or 1) * 255), math.floor((opt.color.G or opt.color.g or 1) * 255), math.floor((opt.color.B or opt.color.b or 1) * 255); line = line .. "color:" .. tostring(_r) .. "," .. tostring(_g) .. "," .. tostring(_b)
				if opt.trans then
					line = line .. "," .. string.gsub(tostring(opt.trans), ",", ".")
				end
			elseif opt.type == "bind" then
				line = line .. "bind:" .. tostring(opt.key)
			elseif opt.type == "list" and opt.multiselect and type(opt.value) == "table" then
				local str = ""
				for k, v in opt.value do if v then str = str .. tostring(k) .. "," end end
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
	for flag, value in library_flags do
		if type(flag) == "string" and (flag:sub(1, 5) == "skin_" or flag:sub(1, 7) == "ui_pos_" or flag:sub(1, 13) == "practiceBind_" or flag:match("Color$") or flag:match("ColorChanger$") or flag == "skinKnifeModel" or flag == "skinGloveModel" or flag == "skinGloveSkin" or flag == "skinSkinChanger" or flag == "skinKnifeChanger" or flag == "skinGloveChanger" or flag == "skinSleeveChanger" or flag == "skinSleeveCT" or flag == "skinSleeveT" or flag == "spoofedNameValue" or flag == "Custom Models" or flag == "Custom Models Favorites") then
			if type(value) == "boolean" then
				strData = strData .. flag .. "=toggle:" .. (value and "1" or "0") .. "\n"
			elseif type(value) == "string" then
				strData = strData .. flag .. "=string:" .. tostring(value) .. "\n"
			elseif type(value) == "number" then
				strData = strData .. flag .. "=number:" .. tostring(value) .. "\n"
			elseif typeof(value) == "Color3" then
				local _r, _g, _b = math.floor(value.R * 255), math.floor(value.G * 255), math.floor(value.B * 255); strData = strData .. flag .. "=color:" .. _r .. "," .. _g .. "," .. _b .. "\n"
			end
		end
	end
	if L_739_arg1 then
		setclipboard(strData)
	else
		writefile(self.foldername .. "/" .. L_738_arg0 .. self.fileext, strData)
	end
end 
function UI_Library:GetConfigs()
	if not isfolder(self.foldername) then
		makefolder(self.foldername)
	end 
	local val_924 = listfiles(self.foldername); local files = {}; local count = 0
	for _, filepath in val_924 do
		if filepath:sub(#filepath - #self.fileext + 1, #filepath) == self.fileext then
			count = count + 1; local name = filepath:gsub("^.*[/\\\\]", ""); name = name:gsub(self.fileext .. "$", ""); files[count] = name
		end
	end 
	return files
end 
local function var_250(var_200, var_206)
	var_200.main = UI_Library:Create("TextLabel", { LayoutOrder = var_200.position, Position = UDim2.new(0, 6, 0, 0), Size = UDim2.new(1, -12, 0, 24), BackgroundTransparency = 1, Text = var_200.text, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.new(1, 1, 1), TextXAlignment = Enum.TextXAlignment.Left, Parent = var_206 })
	setmetatable(var_200, {
		__newindex = function(var_208, var_189, var_67)
			if var_189 == "Text" then
				var_200.main.Text = tostring(var_67)
			end
		end
	})
end 
local function InitCheckbox(checkbox, parent)
	checkbox.hasInit = true; checkbox.main = UI_Library:Create("Frame", { LayoutOrder = checkbox.position, Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, Parent = parent }); local boxFrame; local checkImage 
	if checkbox.style then
		boxFrame = UI_Library:Create("ImageLabel", { Position = UDim2.new(0, 6, 0, 4), Size = UDim2.new(0, 12, 0, 12), BackgroundTransparency = 1, Image = "rbxassetid://3570695787", ImageColor3 = Color3.new(), Parent = checkbox.main })
		UI_Library:Create("ImageLabel", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(1, -2, 1, -2), BackgroundTransparency = 1, Image = "rbxassetid://3570695787", ImageColor3 = Color3.fromRGB(60, 60, 60), Parent = boxFrame })
		UI_Library:Create("ImageLabel", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(1, -6, 1, -6), BackgroundTransparency = 1, Image = "rbxassetid://3570695787", ImageColor3 = Color3.fromRGB(40, 40, 40), Parent = boxFrame })
		checkImage = UI_Library:Create("ImageLabel", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(1, -6, 1, -6), BackgroundTransparency = 1, Image = "rbxassetid://3570695787", ImageColor3 = library_flags["Menu Accent Color"], Visible = checkbox.state, Parent = boxFrame })
		UI_Library:Create("ImageLabel", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://5941353943", ImageTransparency = 0.6, Parent = boxFrame }); table.insert(UI_Library.theme, checkImage)
	else
		boxFrame = UI_Library:Create("Frame", { Position = UDim2.new(0, 6, 0, 4), Size = UDim2.new(0, 12, 0, 12), BackgroundColor3 = library_flags["Menu Accent Color"], BorderColor3 = Color3.new(), Parent = checkbox.main })
		checkImage = UI_Library:Create("ImageLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = checkbox.state and 1 or 0, BackgroundColor3 = Color3.fromRGB(50, 50, 50), BorderColor3 = Color3.new(), Image = "rbxassetid://4155801252", ImageTransparency = 0.6, ImageColor3 = Color3.new(), Parent = boxFrame })
		UI_Library:Create("ImageLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2592362371", ImageColor3 = Color3.fromRGB(60, 60, 60), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(2, 2, 62, 62), Parent = boxFrame }); table.insert(UI_Library.theme, boxFrame)
	end 
	checkbox.interest = UI_Library:Create("Frame", { Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, Parent = checkbox.main })
	checkbox.title = UI_Library:Create("TextLabel", { Position = UDim2.new(0, 24, 0, 0), Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = checkbox.text, TextColor3 = checkbox.state and Color3.fromRGB(210, 210, 210) or Color3.fromRGB(180, 180, 180), TextSize = 15, Font = Enum.Font.Code, TextXAlignment = Enum.TextXAlignment.Left, Parent = checkbox.interest })
	checkbox.interest.InputBegan:connect(function(inputBeganEvent)
		if inputBeganEvent.UserInputType.Name == "MouseButton1" then
			checkbox:SetState(not checkbox.state)
		end 
		if inputBeganEvent.UserInputType.Name == "MouseMovement" then
			if not UI_Library.popup and not UI_Library.warning and not UI_Library.slider then
				if checkbox.style then
					boxFrame.ImageColor3 = library_flags["Menu Accent Color"]; tweenService:Create(boxFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageColor3 = library_flags["Menu Accent Color"] }):Play()
				else
					boxFrame.BorderColor3 = library_flags["Menu Accent Color"]; checkImage.BorderColor3 = library_flags["Menu Accent Color"]
				end
			end 
			if checkbox.tip then
				UI_Library.tooltip.Text = checkbox.tip; UI_Library.tooltip.Size = UDim2.new(0, textService:GetTextSize(checkbox.tip, 15, Enum.Font.Legacy, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	checkbox.interest.InputChanged:connect(function(inputChangedEvent)
		if inputChangedEvent.UserInputType.Name == "MouseMovement" then
			if checkbox.tip then
				UI_Library.tooltip.Position = UDim2.new(0, inputChangedEvent.Position.X + 56, 0, inputChangedEvent.Position.Y - 10)
			end
		end
	end)
	checkbox.interest.InputEnded:connect(function(inputEndedEvent)
		if inputEndedEvent.UserInputType.Name == "MouseMovement" then
			if checkbox.style then
				boxFrame.ImageColor3 = Color3.new()
			else
				boxFrame.BorderColor3 = Color3.new(); checkImage.BorderColor3 = Color3.new()
			end 
			UI_Library.tooltip.Position = UDim2.new(2)
		end
	end)
function checkbox:SetState(var_102, var_217)
		var_102 = typeof(var_102) == "boolean" and var_102; var_102 = var_102 or false; library_flags[self.flag] = var_102; self.state = var_102; checkbox.title.TextColor3 = var_102 and Color3.fromRGB(210, 210, 210) or Color3.fromRGB(160, 160, 160)
		if checkbox.style then
			checkImage.Visible = var_102
		else
			checkImage.BackgroundTransparency = var_102 and 1 or 0
		end 
		if not var_217 and type(self.callback) == "function" then
			self.callback(var_102)
		end
	end 
	if checkbox.state then
		delay(1, function()
			if UI_Library then
				if type(checkbox.callback) == "function" then
					checkbox.callback(true)
				end
			end
		end)
	end 
	setmetatable(checkbox, {
		__newindex = function(var_259, var_110, var_102)
			if var_110 == "Text" then
				checkbox.title.Text = tostring(var_102)
			end
		end
	})
end 
local function var_28(var_170, var_112)
	var_170.hasInit = true; var_170.main = UI_Library:Create("Frame", { LayoutOrder = var_170.position, Size = UDim2.new(1, 0, 0, 26), BackgroundTransparency = 1, Parent = var_112 })
	var_170.title = UI_Library:Create("TextLabel", { AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.new(0.5, 0, 1, -5), Size = UDim2.new(1, -12, 0, 18), BackgroundColor3 = Color3.fromRGB(50, 50, 50), BorderColor3 = Color3.new(), Text = var_170.text, TextColor3 = Color3.new(1, 1, 1), TextSize = 15, Font = Enum.Font.Code, Parent = var_170.main })
	UI_Library:Create("ImageLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2592362371", ImageColor3 = Color3.fromRGB(60, 60, 60), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(2, 2, 62, 62), Parent = var_170.title })
	UI_Library:Create("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 180, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 253, 253)) }), Rotation = -90, Parent = var_170.title })
	var_170.title.InputBegan:connect(function(var_275)
		if var_275.UserInputType.Name == "MouseButton1" then
			if type(var_170.callback) == "function" then
				var_170.callback()
			end
			if UI_Library then
				library_flags[var_170.flag] = true
			end 
			if var_170.tip then
				UI_Library.tooltip.Text = var_170.tip; UI_Library.tooltip.Size = UDim2.new(0, textService:GetTextSize(var_170.tip, 15, Enum.Font.Legacy, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end 
		if var_275.UserInputType.Name == "MouseMovement" then
			if not UI_Library.popup and not UI_Library.warning and not UI_Library.slider then
				var_170.title.BorderColor3 = library_flags["Menu Accent Color"]
			end
		end
	end)
	var_170.title.InputChanged:connect(function(var_126)
		if var_126.UserInputType.Name == "MouseMovement" then
			if var_170.tip then
				UI_Library.tooltip.Position = UDim2.new(0, var_126.Position.X + 56, 0, var_126.Position.Y - 10)
			end
		end
	end)
	var_170.title.InputEnded:connect(function(var_234)
		if var_234.UserInputType.Name == "MouseMovement" then
			var_170.title.BorderColor3 = Color3.new(); UI_Library.tooltip.Position = UDim2.new(2)
		end
	end)
end 
local function shortenBindName(key)
    if not key or key == "none" then return "none" end
    local name = typeof(key) == "EnumItem" and key.Name or tostring(key); name = name:gsub("Enum.UserInputType.", ""):gsub("Enum.KeyCode.", "")
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
local function var_68(var_147, var_65)
	var_147.hasInit = true; local val_928; local val_930 
	if var_147.sub then
		var_147.main = var_147:getMain()
	else
		var_147.main = var_147.main or UI_Library:Create("Frame", { LayoutOrder = var_147.position, Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, Parent = var_65 })
		UI_Library:Create("TextLabel", { Position = UDim2.new(0, 6, 0, 0), Size = UDim2.new(1, -12, 1, 0), BackgroundTransparency = 1, Text = var_147.text, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(210, 210, 210), TextXAlignment = Enum.TextXAlignment.Left, Parent = var_147.main })
	end 
	local L_782_Icon = UI_Library:Create("ImageButton", { Name = "BindSettings", Position = UDim2.new(1, -26 - (var_147.subpos or 0), 0, 2), Size = UDim2.new(0, 16, 0, 16), BackgroundTransparency = 1, Image = "rbxassetid://7072714742", ImageColor3 = Color3.fromRGB(180, 180, 180), AutoButtonColor = false, Parent = var_147.main })
	local L_782_Popup = UI_Library:Create("Frame", { Name = "BindPopup", ZIndex = 20, Size = UDim2.new(0, 150, 0, 65), BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.new(), Visible = false, Parent = UI_Library.base }); local L_PopStroke = Instance.new("UIStroke", L_782_Popup); L_PopStroke.Color = Color3.fromRGB(45, 45, 45)
	local L_KeyLabel = UI_Library:Create("TextLabel", { Position = UDim2.new(0, 10, 0, 8), Size = UDim2.new(0, 60, 0, 20), BackgroundTransparency = 1, Text = "keybind", TextSize = 14, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(200, 200, 200), TextXAlignment = Enum.TextXAlignment.Left, Parent = L_782_Popup })
	local L_KeyBtn = UI_Library:Create("TextButton", { Position = UDim2.new(1, -70, 0, 8), Size = UDim2.new(0, 60, 0, 20), BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderSizePixel = 0, Text = shortenBindName(var_147.key), TextSize = 14, Font = Enum.Font.Code, TextColor3 = Color3.new(1, 1, 1), AutoButtonColor = false, Parent = L_782_Popup })
	local L_ModeLabel = UI_Library:Create("TextLabel", { Position = UDim2.new(0, 10, 0, 35), Size = UDim2.new(0, 60, 0, 20), BackgroundTransparency = 1, Text = "mode", TextSize = 14, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(200, 200, 200), TextXAlignment = Enum.TextXAlignment.Left, Parent = L_782_Popup })
	local L_ModeBtn = UI_Library:Create("TextButton", { Position = UDim2.new(1, -70, 0, 35), Size = UDim2.new(0, 60, 0, 20), BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderSizePixel = 0, Text = var_147.mode or "toggle", TextSize = 14, Font = Enum.Font.Code, TextColor3 = Color3.new(1, 1, 1), AutoButtonColor = false, Parent = L_782_Popup })
	L_782_Icon.MouseButton1Click:connect(function()
		if UI_Library.popup == var_147 then
			var_147:Close(); return
		end 
		if UI_Library.popup then UI_Library.popup:Close() end 
		UI_Library.popup = var_147; L_782_Popup.Visible = true; local absPos = L_782_Icon.AbsolutePosition; L_782_Popup.Position = UDim2.new(0, absPos.X - 160, 0, absPos.Y); L_782_Icon.ImageColor3 = library_flags["Menu Accent Color"]
	end)
	local L_RowKeyBtn = UI_Library:Create("TextButton", { Name = "RowKeyDisplay", Position = UDim2.new(1, -92 - (var_147.subpos or 0), 0, 2), Size = UDim2.new(0, 60, 0, 16), BackgroundColor3 = Color3.fromRGB(24, 24, 24), BorderSizePixel = 0, Text = shortenBindName(var_147.key or "none"), TextSize = 12, Font = Enum.Font.Code, TextColor3 = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 255, 0), AutoButtonColor = false, Parent = var_147.main })
	Instance.new("UICorner", L_RowKeyBtn).CornerRadius = UDim.new(0, 3); local L_RowKeyStroke = Instance.new("UIStroke", L_RowKeyBtn); L_RowKeyStroke.Color = Color3.fromRGB(45, 45, 45)
	L_RowKeyBtn.MouseButton1Click:connect(function()
		val_928 = true; L_RowKeyBtn.Text = "[...]"; L_KeyBtn.Text = "[...]"; L_KeyBtn.TextColor3 = library_flags["Menu Accent Color"]
	end)
	function var_147:Close()
		UI_Library.popup = nil; L_782_Popup.Visible = false; L_782_Icon.ImageColor3 = Color3.fromRGB(180, 180, 180); val_928 = false 
	end
	L_KeyBtn.MouseButton1Click:connect(function()
		val_928 = true; L_KeyBtn.Text = "[...]"; L_KeyBtn.TextColor3 = library_flags["Menu Accent Color"]
	end)
	L_ModeBtn.MouseButton1Click:connect(function()
		local modes = {"always on", "hold", "toggle"}; local curIdx = table.find(modes, var_147.mode) or 3; curIdx = curIdx + 1
		if curIdx > #modes then curIdx = 1 end
		var_147.mode = modes[curIdx]; L_ModeBtn.Text = var_147.mode
		if var_147.mode == "always on" then
			library_flags[var_147.flag] = true; var_147.callback(true)
		else
			library_flags[var_147.flag] = false; var_147.callback(false)
		end
	end)
	UI_Library:AddConnection(inputService.InputBegan, function(input)
		if inputService:GetFocusedTextBox() then return end 
		if val_928 then
			local key = table.find(val_460, input.UserInputType) and not var_147.nomouse and input.UserInputType; key = key or not table.find(val_409, input.KeyCode) and input.KeyCode 
			if key then
				var_147:SetKey(key)
			end
		else
			if var_147.mode == "always on" then
				library_flags[var_147.flag] = true; return
			end
			local isKey = (shortenBindName(input.KeyCode.Name) == var_147.key or shortenBindName(input.UserInputType.Name) == var_147.key)
			if isKey then
				if var_147.mode == "toggle" then
					library_flags[var_147.flag] = not library_flags[var_147.flag]; var_147.callback(library_flags[var_147.flag], 0)
				elseif var_147.mode == "hold" then
					library_flags[var_147.flag] = true 
					if val_930 then val_930:Disconnect() end 
					val_930 = UI_Library:AddConnection(runService.RenderStepped, function(dt)
						if not inputService:GetFocusedTextBox() then
							var_147.callback(true, dt)
						end
					end)
				end
			end
		end
	end)
	UI_Library:AddConnection(inputService.InputEnded, function(input)
		if var_147.key ~= "none" and var_147.mode == "hold" then
			if shortenBindName(input.KeyCode.Name) == var_147.key or shortenBindName(input.UserInputType.Name) == var_147.key then
				if val_930 then
					val_930:Disconnect(); val_930 = nil; library_flags[var_147.flag] = false; var_147.callback(false, 0)
				end
			end
		end
	end)
	function var_147:SetKey(key)
		val_928 = false; L_KeyBtn.TextColor3 = Color3.new(1, 1, 1)
		if val_930 then val_930:Disconnect() val_930 = nil end 
		self.key = shortenBindName(key and key.Name or key or self.key) 
		if self.key == "Backspace" then
			self.key = "none"
		end 
		L_KeyBtn.Text = shortenBindName(self.key):upper()
		if L_RowKeyBtn then
			L_RowKeyBtn.Text = shortenBindName(self.key):upper(); L_RowKeyBtn.TextColor3 = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 255, 0)
		end
	end 
	var_147:SetKey()
end 
local function var_225(var_113, var_64)
	var_113.hasInit = true 
	if var_113.sub then
		var_113.main = var_113:getMain(); var_113.main.Size = UDim2.new(1, 0, 0, 36)
	else
		var_113.main = UI_Library:Create("Frame", { LayoutOrder = var_113.position, BackgroundTransparency = 1, Parent = var_64 }); var_113.main.Size = UDim2.new(1, 0, 0, var_113.textpos and 20 or 36)
	end 
	var_113.title = UI_Library:Create("TextLabel", { Position = UDim2.new(0, 6, 0, 0), Size = UDim2.new(0.5, -6, 0, 14), BackgroundTransparency = 1, Text = string.lower(var_113.text == "nil" and "" or var_113.text), TextSize = 13, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(200, 200, 200), TextXAlignment = Enum.TextXAlignment.Left, Parent = var_113.main })
	var_113.valueLabel = UI_Library:Create("TextBox", { Position = UDim2.new(0.5, 0, 0, 0), Size = UDim2.new(0.5, -6, 0, 14), BackgroundTransparency = 1, Text = tostring(var_113.value) .. var_113.suffix, TextSize = 13, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(240, 240, 240), TextXAlignment = Enum.TextXAlignment.Right, ClearTextOnFocus = false, TextEditable = true, Parent = var_113.main })
	var_113.valueLabel.FocusLost:connect(function()
		local typed = tostring(var_113.valueLabel.Text):match("[-]?%d+%.?%d*"); local num = tonumber(typed)
		if num then
			var_113:SetValue(num)
		else
			var_113.valueLabel.Text = tostring(var_113.value) .. var_113.suffix
		end
	end)
	var_113.slider = UI_Library:Create("Frame", { Position = UDim2.new(0, 6, 0, 20), Size = UDim2.new(1, -12, 0, 2), BackgroundColor3 = Color3.fromRGB(35, 35, 35), BorderSizePixel = 0, Parent = var_113.main })
	var_113.fill = UI_Library:Create("Frame", { BackgroundColor3 = library_flags["Menu Accent Color"], BorderSizePixel = 0, Parent = var_113.slider })
	var_113.thumb = UI_Library:Create("Frame", { AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.new(0, 4, 0, 6), BackgroundColor3 = library_flags["Menu Accent Color"], BorderSizePixel = 0, Parent = var_113.fill }); table.insert(UI_Library.theme, var_113.fill); table.insert(UI_Library.theme, var_113.thumb)
	if var_113.min >= 0 then
		var_113.fill.Size = UDim2.new((var_113.value - var_113.min) / (var_113.max - var_113.min), 0, 1, 0)
	else
		var_113.fill.Position = UDim2.new((0 - var_113.min) / (var_113.max - var_113.min), 0, 0, 0); var_113.fill.Size = UDim2.new(var_113.value / (var_113.max - var_113.min), 0, 1, 0)
	end 
	local val_932 = var_113.main 
	val_932.InputBegan:connect(function(var_166)
		if var_166.UserInputType.Name == "MouseButton1" then
			local vb = var_113.valueLabel; local mp = inputService:GetMouseLocation()
			if vb and mp.X >= vb.AbsolutePosition.X and mp.X <= vb.AbsolutePosition.X + vb.AbsoluteSize.X
				and mp.Y >= vb.AbsolutePosition.Y and mp.Y <= vb.AbsolutePosition.Y + vb.AbsoluteSize.Y then
				return
			end
			UI_Library.slider = var_113; var_113.slider.BorderColor3 = library_flags["Menu Accent Color"]; local _mx = inputService:GetMouseLocation().X; var_113:SetValue(var_113.min + (_mx - var_113.slider.AbsolutePosition.X) / var_113.slider.AbsoluteSize.X * (var_113.max - var_113.min))
		end 
		if var_166.UserInputType.Name == "MouseMovement" then
			if not UI_Library.popup and not UI_Library.warning and not UI_Library.slider then
				var_113.slider.BorderColor3 = library_flags["Menu Accent Color"]
			end 
			if var_113.tip then
				UI_Library.tooltip.Text = var_113.tip; UI_Library.tooltip.Size = UDim2.new(0, textService:GetTextSize(var_113.tip, 15, Enum.Font.Legacy, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	val_932.InputChanged:connect(function(var_210)
		if var_210.UserInputType.Name == "MouseMovement" then
			if var_113.tip then
				UI_Library.tooltip.Position = UDim2.new(0, var_210.Position.X + 56, 0, var_210.Position.Y - 10)
			end
		end
		if var_210.UserInputType.Name == "MouseWheel" then
			if not UI_Library.popup and not UI_Library.warning then
				local _step = var_113.float ~= 0 and var_113.float or 1; var_113:SetValue(var_113.value + _step * math.sign(var_210.Position.Z))
			end
		end
	end)
	val_932.InputEnded:connect(function(var_6)
		if var_6.UserInputType.Name == "MouseMovement" then
			UI_Library.tooltip.Position = UDim2.new(2)
			if var_113 ~= UI_Library.slider then
				var_113.slider.BorderColor3 = Color3.new()
			end
		end
	end)
function var_113:SetValue(var_197, var_206)
		if typeof(var_197) ~= "number" then
			var_197 = 0
		end 
		var_197 = UI_Library.round(var_197, var_113.float); var_197 = math.clamp(var_197, self.min, self.max)
		if self.min >= 0 then
			var_113.fill:TweenSize(UDim2.new((var_197 - self.min) / (self.max - self.min), 0, 1, 0), "Out", "Quad", 0.05, true)
		else
			var_113.fill:TweenPosition(UDim2.new((0 - self.min) / (self.max - self.min), 0, 0, 0), "Out", "Quad", 0.05, true); var_113.fill:TweenSize(UDim2.new(var_197 / (self.max - self.min), 0, 1, 0), "Out", "Quad", 0.1, true)
		end 
		library_flags[self.flag] = var_197; self.value = var_197; var_113.valueLabel.Text = tostring(var_113.value) .. var_113.suffix 
		if not var_206 and type(self.callback) == "function" then
			self.callback(var_197)
		end
	end 
	delay(1, function()
		if UI_Library then
			var_113:SetValue(var_113.value)
		end
	end)
end 
local function var_189(var_206, var_9)
	var_206.hasInit = true 
	if var_206.sub then
		var_206.main = var_206:getMain(); var_206.main.Size = UDim2.new(1, 0, 0, 44)
	else
		var_206.main = UI_Library:Create("Frame", { LayoutOrder = var_206.position, Size = UDim2.new(1, 0, 0, var_206.text == " " and 26 or 44), BackgroundTransparency = 1, Parent = var_9 })
		if var_206.text ~= " " then
			UI_Library:Create("TextLabel", { Position = UDim2.new(0, 6, 0, 0), Size = UDim2.new(1, -12, 0, 18), BackgroundTransparency = 1, Text = var_206.text, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(210, 210, 210), TextXAlignment = Enum.TextXAlignment.Left, Parent = var_206.main })
		end
	end 
	local function var_224()
		local val_939 = ""
		if type(var_206.value) == "table" then
			for var_186, var_221 in var_206.values do
				if var_206.value[var_221] then
					val_939 = val_939 .. tostring(var_221) .. ", "
				end
			end
		end
		if val_939 == "" then return "None" end
		return string.sub(val_939, 1, #val_939 - 2)
	end 
	local txt = ""
	if var_206.multiselect then
		txt = var_224()
	else
		txt = (type(var_206.value) == "table" or tostring(var_206.value):match("table:")) and "None" or tostring(var_206.value)
	end
	if tostring(txt):find("table:") then txt = "None" end
	var_206.listvalue = UI_Library:Create("TextLabel", { Position = UDim2.new(0, 6, 0, var_206.text == " " and not var_206.sub and 4 or 22), Size = UDim2.new(1, -12, 0, 18), BackgroundColor3 = Color3.fromRGB(50, 50, 50), BorderColor3 = Color3.new(), Text = " " .. txt, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.new(1, 1, 1), TextXAlignment = Enum.TextXAlignment.Left, Parent = var_206.main })
	local listStroke = Instance.new("UIStroke"); listStroke.Color = Color3.fromRGB(60, 60, 60); listStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; listStroke.Parent = var_206.listvalue; var_206.arrow = UI_Library:Create("Frame", { Position = UDim2.new(1, -14, 0, 5), Size = UDim2.new(0, 8, 0, 8), Rotation = 90, BackgroundTransparency = 1, Visible = false, Parent = var_206.listvalue })
	var_206.holder = UI_Library:Create("TextButton", { ZIndex = 5, BackgroundColor3 = Color3.fromRGB(40, 40, 40), BorderColor3 = Color3.new(), Text = "", AutoButtonColor = false, Visible = false, Parent = UI_Library.mainFrame or UI_Library.base })
	var_206.closeBtn = UI_Library:Create("TextButton", { ZIndex = 4, Size = UDim2.new(1, 4000, 1, 4000), Position = UDim2.new(0, -2000, 0, -2000), BackgroundTransparency = 1, Text = "", Visible = false, Parent = UI_Library.mainFrame or UI_Library.base })
	var_206.closeBtn.MouseButton1Click:Connect(function()
		var_206:Close()
	end)
	var_206.content = UI_Library:Create("ScrollingFrame", { ZIndex = 4, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarImageColor3 = Color3.new(), ScrollBarThickness = 3, ScrollingDirection = Enum.ScrollingDirection.Y, VerticalScrollBarInset = Enum.ScrollBarInset.Always, TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png", BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png", Parent = var_206.holder })
	UI_Library:Create("ImageLabel", { ZIndex = 4, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2592362371", ImageColor3 = Color3.fromRGB(60, 60, 60), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(2, 2, 62, 62), Parent = var_206.holder })
	local val_935 = UI_Library:Create("UIListLayout", { Padding = UDim.new(0, 2), SortOrder = Enum.SortOrder.LayoutOrder, Parent = var_206.content }); UI_Library:Create("UIPadding", { PaddingTop = UDim.new(0, 3), PaddingLeft = UDim.new(0, 3), Parent = var_206.content }); local val_936 = 0
	val_935.Changed:connect(function()
		var_206.holder.Size = UDim2.new(0, var_206.listvalue.AbsoluteSize.X, 0, 6 + (val_936 > var_206.max and var_206.max * 22 or val_935.AbsoluteContentSize.Y)); var_206.content.CanvasSize = UDim2.new(0, 0, 0, 4 + val_935.AbsoluteContentSize.Y)
	end)
	local val_937 = var_206.sub and var_206.listvalue or var_206.main 
	var_206.listvalue.InputBegan:connect(function(var_138)
		if var_138.UserInputType.Name == "MouseButton1" then
			if UI_Library.popup == var_206 then
				UI_Library.popup:Close(); return
			end 
			if UI_Library.popup then
				UI_Library.popup:Close()
			end 
			var_206.arrow.Rotation = -90; var_206.open = true; var_206.holder.Visible = true; local val_941 = var_206.listvalue.AbsolutePosition - (UI_Library.mainFrame and UI_Library.mainFrame.AbsolutePosition or Vector2.new()); var_206.holder.Position = UDim2.new(0, val_941.X, 0, val_941.Y + var_206.listvalue.AbsoluteSize.Y + 2)
			if var_206.posTrack then var_206.posTrack:Disconnect() end
			var_206.posTrack = game:GetService("RunService").RenderStepped:Connect(function()
				if var_206.open and var_206.holder and var_206.holder.Visible then
					local curPos = var_206.listvalue.AbsolutePosition - (UI_Library.mainFrame and UI_Library.mainFrame.AbsolutePosition or Vector2.new()); var_206.holder.Position = UDim2.new(0, curPos.X, 0, curPos.Y + var_206.listvalue.AbsoluteSize.Y + 2)
				else
					if var_206.posTrack then var_206.posTrack:Disconnect() var_206.posTrack = nil end
				end
			end)
			UI_Library.popup = var_206; var_206.listvalue.BorderColor3 = library_flags["Menu Accent Color"]
			if var_206.closeBtn then var_206.closeBtn.Visible = true end
		end 
		if var_138.UserInputType.Name == "MouseMovement" then
			if not UI_Library.popup and not UI_Library.warning and not UI_Library.slider then
				var_206.listvalue.BorderColor3 = library_flags["Menu Accent Color"]
			end
		end
	end)
	var_206.listvalue.InputEnded:connect(function(var_63)
		if var_63.UserInputType.Name == "MouseMovement" then
			if not var_206.open then
				var_206.listvalue.BorderColor3 = Color3.new()
			end
		end
	end)
	val_937.InputBegan:connect(function(var_196)
		if var_196.UserInputType.Name == "MouseMovement" then
			if var_206.tip then
				UI_Library.tooltip.Text = var_206.tip; UI_Library.tooltip.Size = UDim2.new(0, textService:GetTextSize(var_206.tip, 15, Enum.Font.Legacy, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	val_937.InputChanged:connect(function(var_195)
		if var_195.UserInputType.Name == "MouseMovement" then
			if var_206.tip then
				UI_Library.tooltip.Position = UDim2.new(0, var_195.Position.X + 56, 0, var_195.Position.Y - 10)
			end
		end
	end)
	val_937.InputEnded:connect(function(var_181)
		if var_181.UserInputType.Name == "MouseMovement" then
			UI_Library.tooltip.Position = UDim2.new(2)
		end
	end)
	local val_938 
function var_206:AddValue(var_243, var_107)
		if self.labels[var_243] then
			return
		end 
		val_936 = val_936 + 1 
		if self.multiselect then
			self.values[var_243] = var_107
		else
			if not table.find(self.values, var_243) then
				table.insert(self.values, var_243)
			end
		end 
		local val_942 = UI_Library:Create("TextLabel", { ZIndex = 4, LayoutOrder = val_936, Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, Text = var_243, TextSize = 15, Font = Enum.Font.Code, TextTransparency = self.multiselect and (self.value[var_243] and 1 or 0) or self.value == var_243 and 1 or 0, TextColor3 = Color3.fromRGB(210, 210, 210), TextXAlignment = Enum.TextXAlignment.Left, Parent = var_206.content })
		self.labels[var_243] = val_942 
		local val_943 = UI_Library:Create("TextLabel", { ZIndex = 4, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 0.8, Text = " " .. var_243, TextSize = 15, Font = Enum.Font.Code, TextColor3 = library_flags["Menu Accent Color"], TextXAlignment = Enum.TextXAlignment.Left, Visible = self.multiselect and self.value[var_243] or self.value == var_243, Parent = val_942 })
		val_938 = val_938 or self.value == var_243 and val_943; table.insert(UI_Library.theme, val_943)
		val_942.InputBegan:connect(function(var_190)
			if var_190.UserInputType.Name == "MouseButton1" then
				if self.multiselect then
					self.value[var_243] = not self.value[var_243]; self:SetValue(self.value)
				else
					self:SetValue(var_243); self:Close()
				end
			end
		end)
	end 
	for var_19, var_169 in var_206.values do
		var_206:AddValue(tostring(typeof(var_19) == "number" and var_169 or var_19))
	end 
function var_206:RemoveValue(var_227)
		local val_945 = self.labels[var_227]
		if val_945 then
			val_945:Destroy(); self.labels[var_227] = nil; val_936 = val_936 - 1 
			if self.multiselect then
				self.values[var_227] = nil; self:SetValue(self.value)
			else
				table.remove(self.values, table.find(self.values, var_227))
				if self.value == var_227 then
					val_938 = nil; self:SetValue(self.values[1] or "")
				end
			end
		end
	end 
function var_206:SetValue(var_156, var_41)
		if self.multiselect and typeof(var_156) ~= "table" then
			var_156 = {}
			for var_49, var_165 in self.values do
				var_156[var_165] = false
			end
		end 
		self.value = typeof(var_156) == "table" and var_156 or tostring(table.find(self.values, var_156) and var_156 or self.values[1]); library_flags[self.flag] = self.value; local txt = ""
		if self.multiselect then
			txt = var_224()
		else
			txt = (type(self.value) == "table" or tostring(self.value):match("table:")) and "None" or tostring(self.value)
		end
		if tostring(txt):find("table:") then txt = "None" end
		var_206.listvalue.Text = " " .. txt
		if self.multiselect then
			for var_146, var_22 in self.labels do
				var_22.TextTransparency = self.value[var_146] and 1 or 0 
				if var_22:FindFirstChild"TextLabel" then
					var_22.TextLabel.Visible = self.value[var_146]
				end
			end
		else
			if val_938 then
				val_938.TextTransparency = 0 
				if val_938:FindFirstChild"TextLabel" then
					val_938.TextLabel.Visible = false
				end
			end 
			if self.labels[self.value] then
				val_938 = self.labels[self.value]; val_938.TextTransparency = 1 
				if val_938:FindFirstChild"TextLabel" then
					val_938.TextLabel.Visible = true
				end
			end
		end 
		if not var_41 and type(self.callback) == "function" then
			self.callback(self.value)
		end
	end 
	delay(1, function()
		if UI_Library then
			var_206:SetValue(var_206.value)
		end
	end)
	function var_206:Close()
		UI_Library.popup = nil; var_206.arrow.Rotation = 90; self.open = false 
		if var_206.closeBtn then var_206.closeBtn.Visible = false end
		var_206.holder:TweenSize(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.2, true)
		delay(0.2, function()
			if not self.open then
				var_206.holder.Visible = false
			end
		end)
		var_206.listvalue.BorderColor3 = Color3.new()
	end 
	return var_206
end 
local function var_48(var_201, var_105)
	var_201.hasInit = true; var_201.main = UI_Library:Create("Frame", { LayoutOrder = var_201.position, Size = UDim2.new(1, 0, 0, var_201.text == "nil" and 26 or 44), BackgroundTransparency = 1, Parent = var_105 })
	if var_201.text ~= "nil" then
		var_201.title = UI_Library:Create("TextLabel", { Position = UDim2.new(0, 6, 0, 0), Size = UDim2.new(1, -12, 0, 18), BackgroundTransparency = 1, Text = var_201.text, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(210, 210, 210), TextXAlignment = Enum.TextXAlignment.Left, Parent = var_201.main })
	end 
	var_201.holder = UI_Library:Create("Frame", { Position = UDim2.new(0, 6, 0, var_201.text == "nil" and 4 or 20), Size = UDim2.new(1, -12, 0, 20), BackgroundColor3 = Color3.fromRGB(50, 50, 50), BorderColor3 = Color3.new(), Parent = var_201.main })
	UI_Library:Create("ImageLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2454009026", ImageColor3 = Color3.new(), ImageTransparency = 0.8, Parent = var_201.holder })
	UI_Library:Create("ImageLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2592362371", ImageColor3 = Color3.fromRGB(60, 60, 60), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(2, 2, 62, 62), Parent = var_201.holder })
	local val_947 = UI_Library:Create("TextBox", { Position = UDim2.new(0, 4, 0, 0), Size = UDim2.new(1, -4, 1, 0), BackgroundTransparency = 1, Text = "  " .. var_201.value, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.new(1, 1, 1), TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, ClearTextOnFocus = false, Parent = var_201.holder })
	val_947.FocusLost:connect(function(var_23)
		var_201.holder.BorderColor3 = Color3.new(); var_201:SetValue(val_947.Text, var_23)
	end)
	val_947.Focused:connect(function()
		var_201.holder.BorderColor3 = library_flags["Menu Accent Color"]
	end)
	val_947.InputBegan:connect(function(var_226)
		if var_226.UserInputType.Name == "MouseButton1" then
			pcall(function() var_201:SetState(not var_201.state) end)
		end 
		if var_226.UserInputType.Name == "MouseMovement" then
			if not UI_Library.popup and not UI_Library.warning and not UI_Library.slider then
				var_201.holder.BorderColor3 = library_flags["Menu Accent Color"]
			end 
			if var_201.tip then
				UI_Library.tooltip.Text = var_201.tip; UI_Library.tooltip.Size = UDim2.new(0, textService:GetTextSize(var_201.tip, 15, Enum.Font.Legacy, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	val_947.InputChanged:connect(function(var_59)
		if var_59.UserInputType.Name == "MouseMovement" then
			if var_201.tip then
				UI_Library.tooltip.Position = UDim2.new(0, var_59.Position.X + 56, 0, var_59.Position.Y - 10)
			end
		end
	end)
	val_947.InputEnded:connect(function(var_118)
		if var_118.UserInputType.Name == "MouseMovement" then
			if not val_947:IsFocused() then
				var_201.holder.BorderColor3 = Color3.new()
			end 
			UI_Library.tooltip.Position = UDim2.new(2)
		end
	end)
function var_201:SetValue(var_60, var_105)
		if tostring(var_60) == "" then
			val_947.Text = self.value
		else
			library_flags[self.flag] = tostring(var_60); self.value = tostring(var_60); val_947.Text = self.value 
			if type(self.callback) == "function" then
				self.callback(var_60, var_105)
			end
		end
	end 
	delay(1, function()
		if UI_Library then
			var_201:SetValue(var_201.value)
		end
	end)
end 
local function var_200(var_12)
	var_12.mainHolder = UI_Library:Create("TextButton", { ZIndex = 14, Size = UDim2.new(0, var_12.trans and 170 or 150, 0, 160), BackgroundColor3 = Color3.fromRGB(22, 22, 22), BorderColor3 = Color3.fromRGB(0, 0, 0), AutoButtonColor = false, Visible = false, Parent = UI_Library.base }); local val_949, val_950, val_951 = Color3.toHSV(var_12.color); val_949, val_950, val_951 = val_949 == 0 and 1 or val_949, val_950 + 0.005, val_951 - 0.005; local val_952; local val_953; local val_954; local val_955; local marginX = var_12.trans and -20 or -10; local val_956 = UI_Library:Create("Frame", { ZIndex = 14, AnchorPoint = Vector2.new(0, 1), Position = UDim2.new(0, 5, 1, -5), Size = UDim2.new(1, marginX, 0, 10), BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = var_12.mainHolder })
	local val_957 = UI_Library:Create("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)) }), Parent = val_956 })
	local val_959 = UI_Library:Create("Frame", { ZIndex = 15, Position = UDim2.new(1 - val_949, 0, 0, 0), Size = UDim2.new(0, 2, 1, 0), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = val_956 })
	val_956.InputBegan:connect(function(var_214)
		if var_214.UserInputType.Name == "MouseButton1" then
			val_952 = true; X = val_956.AbsolutePosition.X + val_956.AbsoluteSize.X - val_956.AbsolutePosition.X; X = math.clamp((var_214.Position.X - val_956.AbsolutePosition.X) / X, 0, 1); var_12:SetColor(Color3.fromHSV(1 - X, val_950, val_951))
		end
	end)
	val_956.InputEnded:connect(function(inputBeganEvent)
		if inputBeganEvent.UserInputType.Name == "MouseButton1" then
			val_952 = false
		end
	end)
	local val_960 = UI_Library:Create("ImageLabel", { ZIndex = 14, Position = UDim2.new(0, 5, 0, 5), Size = UDim2.new(1, marginX, 1, -25), BackgroundColor3 = Color3.fromHSV(val_949, 1, 1), BorderColor3 = Color3.fromRGB(0, 0, 0), Image = "rbxassetid://4155801252", ClipsDescendants = true, Parent = var_12.mainHolder })
	local val_961 = UI_Library:Create("Frame", { ZIndex = 15, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(val_950, 0, 1 - val_951, 0), Size = UDim2.new(0, 4, 0, 4), Rotation = 45, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = val_960 })
	val_960.InputBegan:connect(function(var_188)
		if var_188.UserInputType.Name == "MouseButton1" then
			val_953 = true; X = val_960.AbsolutePosition.X + val_960.AbsoluteSize.X - val_960.AbsolutePosition.X; Y = val_960.AbsolutePosition.Y + val_960.AbsoluteSize.Y - val_960.AbsolutePosition.Y; X = math.clamp((var_188.Position.X - val_960.AbsolutePosition.X) / X, 0.005, 1); Y = math.clamp((var_188.Position.Y - val_960.AbsolutePosition.Y) / Y, 0, 1); var_12:SetColor(Color3.fromHSV(val_949, X, 1 - Y))
		end
	end)
	val_960.InputEnded:connect(function(var_251)
		if var_251.UserInputType.Name == "MouseButton1" then
			val_953 = false
		end
	end)
	if var_12.trans then
		val_955 = UI_Library:Create("ImageLabel", { ZIndex = 15, Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2454009026", ImageColor3 = Color3.fromHSV(val_949, 1, 1), Rotation = 180, Parent = UI_Library:Create("ImageLabel", { ZIndex = 14, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -5, 0, 5), Size = UDim2.new(0, 10, 1, -25), BorderColor3 = Color3.fromRGB(0, 0, 0), Image = "rbxassetid://4632082392", ScaleType = Enum.ScaleType.Tile, TileSize = UDim2.new(0, 5, 0, 5), Parent = var_12.mainHolder }) })
		var_12.transSlider = UI_Library:Create("Frame", { ZIndex = 16, Position = UDim2.new(0, -1, var_12.trans, 0), Size = UDim2.new(1, 2, 0, 2), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), Parent = val_955 })
		val_955.InputBegan:connect(function(var_207)
			if var_207.UserInputType.Name == "MouseButton1" then
				val_954 = true; var_12:SetTrans(1 - (var_207.Position.Y - val_955.AbsolutePosition.Y) / val_955.AbsoluteSize.Y)
			end
		end)
		val_955.InputEnded:connect(function(var_222)
			if var_222.UserInputType.Name == "MouseButton1" then
				val_954 = false
			end
		end)
	end 
	UI_Library:AddConnection(inputService.InputChanged, function(var_221)
		if var_221.UserInputType.Name == "MouseMovement" then
			if val_953 then
				X = val_960.AbsolutePosition.X + val_960.AbsoluteSize.X - val_960.AbsolutePosition.X; Y = val_960.AbsolutePosition.Y + val_960.AbsoluteSize.Y - val_960.AbsolutePosition.Y; X = math.clamp((var_221.Position.X - val_960.AbsolutePosition.X) / X, 0.005, 1); Y = math.clamp((var_221.Position.Y - val_960.AbsolutePosition.Y) / Y, 0, 1); var_12:SetColor(Color3.fromHSV(val_949, X, 1 - Y))
			elseif val_952 then
				X = val_956.AbsolutePosition.X + val_956.AbsoluteSize.X - val_956.AbsolutePosition.X; X = math.clamp((var_221.Position.X - val_956.AbsolutePosition.X) / X, 0, 1); var_12:SetColor(Color3.fromHSV(1 - X, val_950, val_951))
			elseif val_954 then
				var_12:SetTrans(1 - (var_221.Position.Y - val_955.AbsolutePosition.Y) / val_955.AbsoluteSize.Y)
			end
		end
	end)
function var_12:updateVisuals(var_27)
		val_949, val_950, val_951 = Color3.toHSV(var_27); val_949 = val_949 == 0 and 1 or val_949; val_960.BackgroundColor3 = Color3.fromHSV(val_949, 1, 1)
		if var_12.trans then
			val_955.ImageColor3 = Color3.fromHSV(val_949, 1, 1)
		end 
		val_959.Position = UDim2.new(1 - val_949, 0, 0, 0); val_961.Position = UDim2.new(val_950, 0, 1 - val_951, 0)
	end 
	return var_12
end 
local function var_211(var_30, var_38)
	var_30.hasInit = true 
	if var_30.sub then
		var_30.main = var_30:getMain()
	else
		var_30.main = UI_Library:Create("Frame", { LayoutOrder = var_30.position, Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, Parent = var_38 })
		var_30.title = UI_Library:Create("TextLabel", { Position = UDim2.new(0, 6, 0, 0), Size = UDim2.new(1, -12, 1, 0), BackgroundTransparency = 1, Text = var_30.text, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(210, 210, 210), TextXAlignment = Enum.TextXAlignment.Left, Parent = var_30.main })
	end 
	var_30.visualize = UI_Library:Create(var_30.sub and "TextButton" or "Frame", { Position = UDim2.new(1, - (var_30.subpos or 0) - 24, 0, 4), Size = UDim2.new(0, 18, 0, 12), SizeConstraint = Enum.SizeConstraint.RelativeYY, BackgroundColor3 = var_30.color, BorderColor3 = Color3.new(), Parent = var_30.main })
	UI_Library:Create("ImageLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2454009026", ImageColor3 = Color3.new(), ImageTransparency = 0.6, Parent = var_30.visualize })
	UI_Library:Create("ImageLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2592362371", ImageColor3 = Color3.fromRGB(60, 60, 60), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(2, 2, 62, 62), Parent = var_30.visualize }); local val_963 = var_30.sub and var_30.visualize or var_30.main 
	if var_30.sub then
		var_30.visualize.Text = ""; var_30.visualize.AutoButtonColor = false
	end 
	val_963.InputBegan:connect(function(var_245)
		if var_245.UserInputType.Name == "MouseButton1" then
			if not var_30.mainHolder then
				var_200(var_30)
			end 
			if UI_Library.popup == var_30 then
				UI_Library.popup:Close(); return
			end 
			if UI_Library.popup then
				UI_Library.popup:Close()
			end 
			var_30.open = true; local val_964 = var_30.main.AbsolutePosition; var_30.mainHolder.Position = UDim2.new(0, val_964.X + 36 + (var_30.trans and -16 or 0), 0, val_964.Y + 56); var_30.mainHolder.Visible = true; UI_Library.popup = var_30; var_30.visualize.BorderColor3 = library_flags["Menu Accent Color"]
		end 
		if var_245.UserInputType.Name == "MouseMovement" then
			if not UI_Library.popup and not UI_Library.warning and not UI_Library.slider then
				var_30.visualize.BorderColor3 = library_flags["Menu Accent Color"]
			end 
			if var_30.tip then
				UI_Library.tooltip.Text = var_30.tip; UI_Library.tooltip.Size = UDim2.new(0, textService:GetTextSize(var_30.tip, 15, Enum.Font.Legacy, Vector2.new(387420489, 387420489)).X, 0, 20)
			end
		end
	end)
	val_963.InputChanged:connect(function(var_150)
		if var_150.UserInputType.Name == "MouseMovement" then
			if var_30.tip then
				UI_Library.tooltip.Position = UDim2.new(0, var_150.Position.X + 56, 0, var_150.Position.Y - 10)
			end
		end
	end)
	val_963.InputEnded:connect(function(var_14)
		if var_14.UserInputType.Name == "MouseMovement" then
			if not var_30.open then
				var_30.visualize.BorderColor3 = Color3.new()
			end 
			UI_Library.tooltip.Position = UDim2.new(2)
		end
	end)
function var_30:SetColor(var_251, var_21)
		if typeof(var_251) == "table" then
			var_251 = Color3.new(var_251[1], var_251[2], var_251[3])
		end 
		var_251 = var_251 or Color3.new(1, 1, 1)
		if self.mainHolder then
			self:updateVisuals(var_251)
		end 
		var_30.visualize.BackgroundColor3 = var_251; library_flags[self.flag] = var_251; self.color = var_251 
		if not var_141 and type(self.callback) == "function" then
			self.callback(var_251)
		end
	end 
	if var_30.trans then
function var_30:SetTrans(var_180, var_183)
			var_180 = math.clamp(tonumber(var_180) or 0, 0, 1)
			if self.transSlider then
				self.transSlider.Position = UDim2.new(0, 0, var_180, 0)
			end 
			self.trans = var_180; library_flags[self.flag .. " Transparency"] = 1 - var_180 
			if type(self.calltrans) == "function" then
				self.calltrans(var_180)
			end
		end 
		var_30:SetTrans(var_30.trans)
	end 
	delay(1, function()
		if UI_Library then
			var_30:SetColor(var_30.color)
		end
	end)
function var_30:Close()
		UI_Library.popup = nil; self.open = false; self.mainHolder.Visible = false; var_30.visualize.BorderColor3 = Color3.new()
	end
end 
	function UI_Library:RegisterTabObject(obj)
		function obj:GetColumn(var_40)
			return self.columns[var_40]
		end 
		function obj:AddColumn()
			local val_967 = { sections = {}, position = # self.columns, canInit = true, tab = self }; table.insert(self.columns, val_967)
			function val_967:AddSection(var_191)
				local val_968 = { title = tostring(var_191), hasInit = false, options = {}, canInit = true, column = self }; table.insert(self.sections, val_968)
				function val_968:AddLabel(var_215)
					local val_970 = {}; val_970.section = self; val_970.text = tostring(var_215); val_970.type = "label"; val_970.position = # self.options; val_970.canInit = true; table.insert(self.options, val_970)
					if UI_Library.hasInit and self.hasInit then
						var_250(val_970, self.content)
					else
						val_970.Init = var_250
					end 
					return val_970
				end 
				function val_968:AddToggle(var_178)
					var_178 = typeof(var_178) == "table" and var_178 or {}; var_178.section = self; var_178.text = tostring(var_178.text); var_178.state = typeof(var_178.state) == "boolean" and var_178.state or false 
					var_178.callback = typeof(var_178.callback) == "function" and var_178.callback or function() end 
					var_178.type = "toggle"; var_178.position = # self.options; var_178.flag = (UI_Library.flagprefix and UI_Library.flagprefix .. " " or "") .. (var_178.flag or var_178.text); var_178.subcount = 0; var_178.canInit = var_178.canInit ~= nil and var_178.canInit or true; var_178.tip = var_178.tip and tostring(var_178.tip); var_178.style = var_178.style == 2; library_flags[var_178.flag] = var_178.state; table.insert(self.options, var_178); UI_Library.options[var_178.flag] = var_178 
					function var_178:AddColor(var_100)
						var_100 = typeof(var_100) == "table" and var_100 or {}; var_100.sub = true; var_100.subpos = self.subcount * 24 
						function var_100:getMain() return var_178.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddColor(var_100)
					end 
					function var_178:AddBind(var_261)
						var_261 = typeof(var_261) == "table" and var_261 or {}; var_261.sub = true; var_261.subpos = self.subcount * 24; var_261.flag = var_261.flag or ((var_178.flag or var_178.text or "Bind") .. " Bind")
						function var_261:getMain() return var_178.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddBind(var_261)
					end 
					function var_178:AddList(var_253)
						var_253 = typeof(var_253) == "table" and var_253 or {}; var_253.sub = true 
						function var_253:getMain() return var_178.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddList(var_253)
					end 
					function var_178:AddSlider(var_71)
						var_71 = typeof(var_71) == "table" and var_71 or {}; var_71.sub = true 
						function var_71:getMain() return var_178.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddSlider(var_71)
					end 
					if UI_Library.hasInit and self.hasInit then
						InitCheckbox(var_178, self.content)
					else
						var_178.Init = InitCheckbox
					end 
					return var_178
				end 
				function val_968:AddButton(var_42)
					var_42 = typeof(var_42) == "table" and var_42 or {}; var_42.section = self; var_42.text = tostring(var_42.text)
					var_42.callback = typeof(var_42.callback) == "function" and var_42.callback or function() end 
					var_42.type = "button"; var_42.position = # self.options; var_42.flag = (UI_Library.flagprefix and UI_Library.flagprefix .. " " or "") .. (var_42.flag or var_42.text); var_42.subcount = 0; var_42.canInit = var_42.canInit ~= nil and var_42.canInit or true; var_42.tip = var_42.tip and tostring(var_42.tip); table.insert(self.options, var_42); UI_Library.options[var_42.flag] = var_42 
					function var_42:AddBind(var_79)
						var_79 = typeof(var_79) == "table" and var_79 or {}; var_79.sub = true; var_79.subpos = self.subcount * 24; var_79.flag = var_79.flag or ((var_42.flag or var_42.text or "Bind") .. " Bind")
						function var_79:getMain() var_42.main.Size = UDim2.new(1, 0, 0, 40) return var_42.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddBind(var_79)
					end 
					function var_42:AddColor(var_193)
						var_193 = typeof(var_193) == "table" and var_193 or {}; var_193.sub = true; var_193.subpos = self.subcount * 24 
						function var_193:getMain() var_42.main.Size = UDim2.new(1, 0, 0, 40) return var_42.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddColor(var_193)
					end 
					if UI_Library.hasInit and self.hasInit then
						var_28(var_42, self.content)
					else
						var_42.Init = var_28
					end 
					return var_42
				end 
				function val_968:AddBind(var_256)
					var_256 = typeof(var_256) == "table" and var_256 or {}; var_256.section = self; var_256.text = tostring(var_256.text); var_256.key = shortenBindName(var_256.key or "none"); var_256.nomouse = typeof(var_256.nomouse) == "boolean" and var_256.nomouse or false; var_256.mode = (var_256.mode == "hold" or var_256.mode == "always on") and var_256.mode or "toggle"
					var_256.callback = typeof(var_256.callback) == "function" and var_256.callback or function() end 
					var_256.type = "bind"; var_256.position = # self.options; var_256.flag = (UI_Library.flagprefix and UI_Library.flagprefix .. " " or "") .. (var_256.flag or var_256.text); var_256.canInit = var_256.canInit ~= nil and var_256.canInit or true; var_256.tip = var_256.tip and tostring(var_256.tip); table.insert(self.options, var_256); UI_Library.options[var_256.flag] = var_256 
					if UI_Library.hasInit and self.hasInit then
						var_68(var_256, self.content)
					else
						var_256.Init = var_68
					end 
					return var_256
				end 
				function val_968:AddSlider(var_115)
					var_115 = typeof(var_115) == "table" and var_115 or {}; var_115.section = self; var_115.text = tostring(var_115.text); var_115.min = typeof(var_115.min) == "number" and var_115.min or 0; var_115.max = typeof(var_115.max) == "number" and var_115.max or 0; var_115.value = var_115.min < 0 and 0 or math.clamp(typeof(var_115.value) == "number" and var_115.value or var_115.min, var_115.min, var_115.max)
					var_115.callback = typeof(var_115.callback) == "function" and var_115.callback or function() end 
					var_115.float = typeof(var_115.value) == "number" and var_115.float or 1; var_115.suffix = var_115.suffix and tostring(var_115.suffix) or ""; var_115.textpos = var_115.textpos == 2; var_115.type = "slider"; var_115.position = # self.options; var_115.flag = (UI_Library.flagprefix and UI_Library.flagprefix .. " " or "") .. (var_115.flag or var_115.text); var_115.subcount = 0; var_115.canInit = var_115.canInit ~= nil and var_115.canInit or true; var_115.tip = var_115.tip and tostring(var_115.tip); library_flags[var_115.flag] = var_115.value; table.insert(self.options, var_115); UI_Library.options[var_115.flag] = var_115 
					function var_115:AddColor(var_200)
						var_200 = typeof(var_200) == "table" and var_200 or {}; var_200.sub = true; var_200.subpos = self.subcount * 24 
						function var_200:getMain() return var_115.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddColor(var_200)
					end 
					function var_115:AddBind(var_149)
						var_149 = typeof(var_149) == "table" and var_149 or {}; var_149.sub = true; var_149.flag = var_149.flag or ((var_115.flag or var_115.text or "Bind") .. " Bind"); var_149.subpos = self.subcount * 24 
						function var_149:getMain() return var_115.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddBind(var_149)
					end 
					if UI_Library.hasInit and self.hasInit then
						var_225(var_115, self.content)
					else
						var_115.Init = var_225
					end 
						return var_115
				end 
				function val_968:AddList(var_261)
					var_261 = typeof(var_261) == "table" and var_261 or {}; var_261.section = self; var_261.text = tostring(var_261.text); var_261.values = typeof(var_261.values) == "table" and var_261.values or {}
					var_261.callback = typeof(var_261.callback) == "function" and var_261.callback or function() end 
					var_261.multiselect = typeof(var_261.multiselect) == "boolean" and var_261.multiselect or false; var_261.value = var_261.multiselect and (typeof(var_261.value) == "table" and var_261.value or {}) or tostring(var_261.value or var_261.values[1] or "")
					if var_261.multiselect then for var_87, lllll1_ in var_261.values do var_261.value[lllll1_] = false end end 
					var_261.max = var_261.max or 4; var_261.open = false; var_261.type = "list"; var_261.position = # self.options; var_261.labels = {}; var_261.flag = (UI_Library.flagprefix and UI_Library.flagprefix .. " " or "") .. (var_261.flag or var_261.text); var_261.subcount = 0; var_261.canInit = var_261.canInit ~= nil and var_261.canInit or true; var_261.tip = var_261.tip and tostring(var_261.tip); library_flags[var_261.flag] = var_261.value; table.insert(self.options, var_261); UI_Library.options[var_261.flag] = var_261 
					function var_261:AddValue(var_85, var_200) if self.multiselect then self.values[var_85] = var_200 else table.insert(self.values, var_85) end end 
					function var_261:AddColor(var_116)
						var_116 = typeof(var_116) == "table" and var_116 or {}; var_116.sub = true; var_116.subpos = self.subcount * 24 
						function var_116:getMain() return var_261.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddColor(var_116)
					end 
					function var_261:AddBind(var_198)
						var_198 = typeof(var_198) == "table" and var_198 or {}; var_198.sub = true; var_198.subpos = self.subcount * 24; var_198.flag = var_198.flag or ((var_261.flag or var_261.text or "Bind") .. " Bind")
						function var_198:getMain() return var_261.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddBind(var_198)
					end 
					if UI_Library.hasInit and self.hasInit then var_189(var_261, self.content) else var_261.Init = var_189 end 
					return var_261
				end 
				function val_968:AddBox(var_131)
					var_131 = typeof(var_131) == "table" and var_131 or {}; var_131.section = self; var_131.text = tostring(var_131.text); var_131.value = tostring(var_131.value or "")
					var_131.callback = typeof(var_131.callback) == "function" and var_131.callback or function() end 
					var_131.type = "box"; var_131.position = # self.options; var_131.flag = (UI_Library.flagprefix and UI_Library.flagprefix .. " " or "") .. (var_131.flag or var_131.text); var_131.canInit = var_131.canInit ~= nil and var_131.canInit or true; var_131.tip = var_131.tip and tostring(var_131.tip); library_flags[var_131.flag] = var_131.value; table.insert(self.options, var_131); UI_Library.options[var_131.flag] = var_131 
					if UI_Library.hasInit and self.hasInit then var_48(var_131, self.content) else var_131.Init = var_48 end 
					return var_131
				end 
				function val_968:AddColor(var_61)
					var_61 = typeof(var_61) == "table" and var_61 or {}; var_61.section = self; var_61.text = tostring(var_61.text); var_61.color = typeof(var_61.color) == "table" and Color3.new(tonumber(var_61.color[1]), tonumber(var_61.color[2]), tonumber(var_61.color[3])) or var_61.color or Color3.new(255, 255, 255)
					var_61.callback = typeof(var_61.callback) == "function" and var_61.callback or function() end 
					var_61.calltrans = typeof(var_61.calltrans) == "function" and var_61.calltrans or var_61.calltrans == 1 and var_61.callback or function() end 
					var_61.open = false; var_61.trans = tonumber(var_61.trans); var_61.subcount = 1; var_61.type = "color"; var_61.position = # self.options; var_61.flag = (UI_Library.flagprefix and UI_Library.flagprefix .. " " or "") .. (var_61.flag or var_61.text); var_61.canInit = var_61.canInit ~= nil and var_61.canInit or true; var_61.tip = var_61.tip and tostring(var_61.tip); library_flags[var_61.flag] = var_61.color; table.insert(self.options, var_61); UI_Library.options[var_61.flag] = var_61 
					function var_61:AddColor(var_1)
						var_1 = typeof(var_1) == "table" and var_1 or {}; var_1.sub = true; var_1.subpos = self.subcount * 24 
						function var_1:getMain() return var_61.main end 
						self.subcount = self.subcount + 1 
						return val_968:AddColor(var_1)
					end 
					if var_61.trans then library_flags[var_61.flag .. " Transparency"] = var_61.trans end 
					if UI_Library.hasInit and self.hasInit then var_211(var_61, self.content) else var_61.Init = var_211 end 
					return var_61
				end 
				function val_968:AddPlayerList(opt)
					opt = typeof(opt) == "table" and opt or {}; opt.section = self; opt.type = "player_list"; opt.flag = (UI_Library.flagprefix and UI_Library.flagprefix .. " " or "") .. (opt.flag or "Player List"); opt.canInit = opt.canInit ~= nil and opt.canInit or true; table.insert(self.options, opt); UI_Library.options[opt.flag] = opt
					return opt
				end 
				function val_968:SetTitle(var_202) self.title = tostring(var_202) if self.titleText then self.titleText.Text = tostring(var_202) end end 
				function val_968:Init()
					if self.hasInit then return end
					self.hasInit = true; self.main = UI_Library:Create("Frame", { BackgroundColor3 = Color3.fromRGB(30,30,30), BorderColor3 = Color3.new(), Parent = val_967.main })
					self.content = UI_Library:Create("Frame", { Size = UDim2.new(1, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(60, 60, 60), BorderMode = Enum.BorderMode.Inset, Parent = self.main })
					table.insert(UI_Library.theme, UI_Library:Create("Frame", { Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = library_flags["Menu Accent Color"], BorderSizePixel = 0, BorderMode = Enum.BorderMode.Inset, Parent = self.main }))
					local val_974 = UI_Library:Create("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2), Parent = self.content }); UI_Library:Create("UIPadding", { PaddingTop = UDim.new(0, 12), Parent = self.content })
					self.titleText = UI_Library:Create("TextLabel", { AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(0, textService:GetTextSize(self.title, 15, Enum.Font.Legacy, Vector2.new(387420489, 387420489)).X + 10, 0, 2), BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderSizePixel = 0, Text = self.title, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.new(1, 1, 1), Parent = self.main })
					val_974.Changed:connect(function() self.main.Size = UDim2.new(1, 0, 0, val_974.AbsoluteContentSize.Y + 16) end)
					for var_179, var_17 in self.options do var_17.Init(var_17, self.content) end
				end 
				return val_968
			end 
			function val_967:Init()
				if self.hasInit then return end
				self.hasInit = true
				self.main = UI_Library:Create("ScrollingFrame", { ZIndex = 2, Position = UDim2.new(0, 6 + self.position * 239, 0, 2), Size = UDim2.new(0, 233, 1, -4), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarImageColor3 = Color3.fromRGB(), ScrollBarThickness = 4, VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, ScrollingDirection = Enum.ScrollingDirection.Y, Visible = false, Parent = UI_Library.columnHolder })
				local val_975 = UI_Library:Create("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 12), Parent = self.main }); UI_Library:Create("UIPadding", { PaddingTop = UDim.new(0, 8), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 2), Parent = self.main })
				val_975.Changed:connect(function() self.main.CanvasSize = UDim2.new(0, 0, 0, val_975.AbsoluteContentSize.Y + 14) end)
				for var_111, var_44 in self.sections do if var_44.canInit and # var_44.options > 0 then var_44:Init() end end
			end
			return val_967
		end
	end
	function UI_Library:AddTab(var_265, var_206)
		local val_966 = { canInit = true, hasInit = false, columns = {}, subtabs = {}, title = tostring(var_265) }; table.insert(self.tabs, var_206 or # self.tabs + 1, val_966); self:RegisterTabObject(val_966)
		function val_966:AddSubTab(name)
			local subtab = { title = tostring(name), columns = {}, parent = self, canInit = true, hasInit = false }; table.insert(self.subtabs, subtab); UI_Library:RegisterTabObject(subtab)
			return subtab
		end
		return val_966
	end 
function UI_Library:AddWarning(var_147)
	var_147 = typeof(var_147) == "table" and var_147 or {}; var_147.text = tostring(var_147.text); var_147.type = var_147.type == "confirm" and "confirm" or ""; local val_977 
	function var_147:Show()
		val_977 = nil; UI_Library.warning = var_147 
		if var_147.main and var_147.type == "" then
			return true
		end 
		if UI_Library.popup then
			UI_Library.popup:Close()
		end 
		if not var_147.main then
			var_147.main = UI_Library:Create("TextButton", { ZIndex = 11, Size = UDim2.new(1, 400, 1, 400), Position = UDim2.new(0, -200, 0, -200), BackgroundTransparency = 1, BackgroundColor3 = Color3.new(0,0,0), BorderSizePixel = 0, Text = "", AutoButtonColor = false, Parent = UI_Library.main })
			local modal = UI_Library:Create("Frame", { ZIndex = 12, Size = UDim2.new(0, 260, 0, 140), Position = UDim2.new(0.5, -130, 0.5, -70), BackgroundColor3 = Color3.fromRGB(15, 15, 15), BorderSizePixel = 0, Parent = var_147.main }); Instance.new("UICorner", modal).CornerRadius = UDim.new(0, 6); local stroke = Instance.new("UIStroke", modal); stroke.Color = Color3.fromRGB(30, 30, 30)
			var_147.message = UI_Library:Create("TextLabel", { ZIndex = 13, Position = UDim2.new(0, 15, 0, 15), Size = UDim2.new(1, -30, 0, 75), BackgroundTransparency = 1, TextSize = 14, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(220, 220, 220), TextWrapped = true, RichText = true, TextYAlignment = Enum.TextYAlignment.Top, Parent = modal })
			if var_147.type == "confirm" then
				local yesBtn = UI_Library:Create("TextButton", { ZIndex = 13, Position = UDim2.new(0.12, 0, 1, -45), Size = UDim2.new(0, 85, 0, 25), BackgroundColor3 = Color3.fromRGB(22, 22, 22), Text = "Yes", TextSize = 14, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(0, 200, 0), Parent = modal })
				Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 4); local ySt = Instance.new("UIStroke", yesBtn) ySt.Color = Color3.fromRGB(35,35,35)
				local noBtn = UI_Library:Create("TextButton", { ZIndex = 13, Position = UDim2.new(0.54, 0, 1, -45), Size = UDim2.new(0, 85, 0, 25), BackgroundColor3 = Color3.fromRGB(22, 22, 22), Text = "No", TextSize = 14, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(200, 200, 200), Parent = modal })
				Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 4); local nSt = Instance.new("UIStroke", noBtn) nSt.Color = Color3.fromRGB(35,35,35)
				yesBtn.MouseButton1Click:Connect(function() val_977 = true end)
				noBtn.MouseButton1Click:Connect(function() val_977 = false end)
			else
				local okBtn = UI_Library:Create("TextButton", { ZIndex = 12, Position = UDim2.new(0.33, 0, 1, -35), Size = UDim2.new(0, 85, 0, 24), BackgroundColor3 = Color3.fromRGB(22, 22, 22), Text = "OK", TextSize = 14, Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(200, 200, 200), Parent = modal })
				Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 4); local oSt = Instance.new("UIStroke", okBtn) oSt.Color = Color3.fromRGB(35,35,35)
				okBtn.MouseButton1Click:Connect(function() val_977 = true end)
			end
		end 
		var_147.main.Visible = true; var_147.message.Text = var_147.text; val_977 = nil 
		repeat
			wait()
		until val_977 ~= nil 
		local res = val_977; spawn(var_147.Close); UI_Library.warning = nil 
		return res
	end 
	function var_147:Close()
		val_977 = nil 
		if not var_147.main then
			return
		end 
		var_147.main.Visible = false
	end 
	return var_147
end 
function UI_Library:Close()
	self.open = not self.open 
	if self.open then
		inputService.MouseIconEnabled = false; inputService.MouseBehavior = Enum.MouseBehavior.Default
	else
		inputService.MouseIconEnabled = self.mousestate ~= nil and self.mousestate or true 
		if val_824 and val_824.mainFrame then val_824.mainFrame.Visible = false end
	end 
	if self.mainFrame then
		if self.popup then
			self.popup:Close()
		end 
		self.mainFrame.Visible = self.open 
		if self.base then self.base.Enabled = self.open end
	end
	env._cursor_outer.Visible = self.open; env._cursor_inner.Visible = self.open
end 
function UI_Library:Init()
	if self.hasInit then
		return
	end 
	self.hasInit = true; self.base = UI_Library:Create("ScreenGui", { IgnoreGuiInset = true }); self.base.Parent = game:GetService"CoreGui"; self.main = self:Create("ImageButton", { AutoButtonColor = false, Position = UDim2.new(0, 100, 0, 46), Size = UDim2.new(0, 500, 0, 700), BackgroundColor3 = Color3.fromRGB(12, 12, 12), BorderColor3 = Color3.new(), ScaleType = Enum.ScaleType.Tile, Modal = true, Visible = false, Parent = self.base })
	local val_979 = self:Create("Frame", { Size = UDim2.new(1, 0, 0, 50), BackgroundColor3 = Color3.fromRGB(16, 16, 16), BorderColor3 = Color3.new(), Parent = self.main })
	self:Create("TextLabel", { Position = UDim2.new(0, 6, 0, -1), Size = UDim2.new(0, 0, 0, 20), BackgroundTransparency = 1, Text = tostring(self.title), Font = Enum.Font.Code, TextSize = 18, TextColor3 = Color3.new(1, 1, 1), TextXAlignment = Enum.TextXAlignment.Left, Parent = self.main })
	table.insert(UI_Library.theme, self:Create("Frame", { Size = UDim2.new(1, 0, 0, 1), Position = UDim2.new(0, 0, 0, 24), BackgroundColor3 = library_flags["Menu Accent Color"], BorderSizePixel = 0, Parent = self.main }))
	UI_Library:Create("ImageLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2454009026", ImageColor3 = Color3.new(), ImageTransparency = 0.4, Parent = val_979 }); self.tabHighlight = self:Create("Frame", { BackgroundColor3 = library_flags["Menu Accent Color"], BorderSizePixel = 0, Parent = self.main }); table.insert(UI_Library.theme, self.tabHighlight); self.columnHolder = self:Create("Frame", { Position = UDim2.new(0, 5, 0, 55), Size = UDim2.new(1, -10, 1, -60), BackgroundTransparency = 1, Parent = self.main })
	self.tooltip = self:Create("TextLabel", { ZIndex = 2, BackgroundTransparency = 1, BorderSizePixel = 0, TextSize = 15, Font = Enum.Font.Code, TextColor3 = Color3.new(1, 1, 1), Visible = true, Parent = self.base })
	self:Create("Frame", { AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 0), Size = UDim2.new(1, 10, 1, 0), Style = Enum.FrameStyle.RobloxRound, Parent = self.tooltip })
	self:Create("ImageLabel", { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Image = "rbxassetid://2592362371", ImageColor3 = Color3.fromRGB(60, 60, 60), ScaleType = Enum.ScaleType.Slice, SliceCenter = Rect.new(2, 2, 62, 62), Parent = self.main })
	val_979.InputBegan:connect(function(var_154)
		if var_154.UserInputType.Name == "MouseButton1" then
			val_357 = self.main; val_914 = true; val_973 = var_154.Position; val_1015 = val_357.Position 
			if UI_Library.popup then
				UI_Library.popup:Close()
			end
		end
	end)
	val_979.InputChanged:connect(function(var_163)
		if val_914 and var_163.UserInputType.Name == "MouseMovement" then
			val_934 = var_163
		end
	end)
	val_979.InputEnded:connect(function(var_54)
		if var_54.UserInputType.Name == "MouseButton1" then
			val_914 = false
		end
	end)
function self:selectTab(var_152)
		if self.currentTab == var_152 then return end 
		if UI_Library.popup then UI_Library.popup:Close() end 
		if self.currentTab then
			self.currentTab.button.TextColor3 = Color3.fromRGB(255, 255, 255)
			if self.currentTab.subtabHolder then self.currentTab.subtabHolder.Visible = false end
			for var_156, var_123 in self.currentTab.columns do var_123.main.Visible = false end
			if self.currentTab.activeSubTab then
				for _, col in self.currentTab.activeSubTab.columns do col.main.Visible = false end
			end
		end 
		self.currentTab = var_152; var_152.button.TextColor3 = library_flags["Menu Accent Color"]; self.tabHighlight:TweenPosition(UDim2.new(0, var_152.button.Position.X.Offset, 0, 50), "Out", "Quad", 0.2, true); self.tabHighlight:TweenSize(UDim2.new(0, var_152.button.AbsoluteSize.X, 0, -1), "Out", "Quad", 0.1, true)
		if #var_152.subtabs > 0 then
			var_152.subtabHolder.Visible = true
			if not var_152.activeSubTab then var_152:selectSubTab(var_152.subtabs[1])
			else
				local sub = var_152.activeSubTab; self.main.Size = UDim2.new(0, 16 + (# sub.columns < 2 and 2 or # sub.columns) * 239, 0, 600)
				for _, col in sub.columns do if col.canInit then col:Init() col.main.Visible = true end end
			end
		else
			self.main.Size = UDim2.new(0, 16 + (# var_152.columns < 2 and 2 or # var_152.columns) * 239, 0, 600)
			for var_268, var_269 in var_152.columns do if var_269.canInit then var_269:Init() var_269.main.Visible = true end end
		end
	end 
	for var_262, var_136 in self.tabs do
		if var_136.canInit then
			var_136:Init(); self:selectTab(var_136)
		end
	end 
	self:AddConnection(inputService.InputEnded, function(var_276)
		if var_276.UserInputType.Name == "MouseButton1" and self.slider then
			self.slider.slider.BorderColor3 = Color3.new(); self.slider = nil
		end
	end)
	self:AddConnection(inputService.InputChanged, function(var_254)
		if self.open then
			if var_254.UserInputType.Name == "MouseMovement" then
				if self.open then
					local mPos = inputService:GetMouseLocation(); local p = Vector2.new(mPos.X, mPos.Y); env._cursor_outer.Position = p; env._cursor_inner.Position = p
				end 
				if self.slider then
					local _mx = inputService:GetMouseLocation().X; self.slider:SetValue(self.slider.min + (_mx - self.slider.slider.AbsolutePosition.X) / self.slider.slider.AbsoluteSize.X * (self.slider.max - self.slider.min))
				end
			end 
			if var_254 == val_934 and val_914 and UI_Library.draggable then
				local val_983 = var_254.Position - val_973; local val_984 = val_1015.Y.Offset + val_983.Y < -36 and -36 or val_1015.Y.Offset + val_983.Y; val_357:TweenPosition(UDim2.new(val_1015.X.Scale, val_1015.X.Offset + val_983.X, val_1015.Y.Scale, val_984), "Out", "Quint", 0.1, true)
			end
		end
	end)
	if not env.silent then
		delay(1, function()
			self:Close()
		end)
	end
end 
function hasProperty(var_104, var_182)
	return pcall(function()
		_ = var_104[var_182]
	end)
end 
val_650 = { "HeadHB", "UpperTorso", "LowerTorso", "LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot" }; val_654 = game:GetService("ReplicatedStorage").Events.DataEvent; val_662 = game:GetService("ReplicatedStorage"); val_671 = game:GetService("UserInputService"); val_678 = game:GetService("NetworkClient"); val_683 = game:GetService("TweenService"); val_690 = game:GetService("RunService"); val_699 = game:GetService("Lighting"); val_711 = game:GetService("Players"); val_722 = game:GetService("Debris"); val_733 = val_711.LocalPlayer; val_741 = val_733:GetMouse(); val_749 = workspace.CurrentCamera; val_753 = val_733.PlayerGui.Client; val_757 = getsenv(val_753); local val_762, val_767, val_772 = false, false, false; val_776 = val_662.Events.HitParl; val_782 = val_662.Events.Vote; val_788 = val_662.Events.DropMag; val_792 = Instance.new("Folder", workspace); val_796 = Instance.new("ColorCorrectionEffect", val_699); val_797 = getsenv(val_733.PlayerScripts.ControlScript.MasterControl); val_806 = Instance.new("Folder", val_749); val_814 = {}; val_818 = Vector3.new(0, 0, 0); val_823 = true; val_830 = false; env.oldPositions = {}; val_838 = {}; val_845 = {}; val_852 = false; val_858 = false; val_866 = 0; val_868 = {}; env.target = nil; env.targetPosition = nil; env.CB_SilentDebug = env.CB_SilentDebug or false; env.hookWS = false; env.hookJP = nil; env.holdE = false 
val_872 = {
	alive = false, melee = false, clientgun = nil, ammo = 0, name = "", sniper = false, silentAim = false, FOV = 0, silentFOV = 0, smoothness = 0, deadzone = 0, baim = false, mindmg = 0, hitboxes = {}, hitchance = 100, closestHitbox = false, trigger = false, triggerDelay = 0, type = ""
}
val_882 = 0; local val_890; cbCHAMS = nil; fonts = { UI = 0, System = 1, Plex = 2, Monospace = 3 }; _LightingSky = game:GetService("Lighting"):FindFirstChildOfClass("Sky"); currentSky = _LightingSky or {  SkyboxBk = "", SkyboxDn = "", SkyboxFt = "", SkyboxLf = "", SkyboxRt = "", SkyboxUp = "" }
Skyboxes = {
	["Game's Sky"] = {  ["SkyboxBk"] = currentSky.SkyboxBk, ["SkyboxDn"] = currentSky.SkyboxDn, ["SkyboxFt"] = currentSky.SkyboxFt, ["SkyboxLf"] = currentSky.SkyboxLf, ["SkyboxRt"] = currentSky.SkyboxRt, ["SkyboxUp"] = currentSky.SkyboxUp },
	["Purple Nebula"] = {  ["SkyboxBk"] = "rbxassetid://159454299", ["SkyboxDn"] = "rbxassetid://159454296", ["SkyboxFt"] = "rbxassetid://159454293", ["SkyboxLf"] = "rbxassetid://159454286", ["SkyboxRt"] = "rbxassetid://159454300", ["SkyboxUp"] = "rbxassetid://159454288" },
	["Night Sky"] = { ["SkyboxBk"] = "rbxassetid://12064107", ["SkyboxDn"] = "rbxassetid://12064152", ["SkyboxFt"] = "rbxassetid://12064121", ["SkyboxLf"] = "rbxassetid://12063984", ["SkyboxRt"] = "rbxassetid://12064115", ["SkyboxUp"] = "rbxassetid://12064131" },
	["Pink Daylight"] = { ["SkyboxBk"] = "rbxassetid://271042516", ["SkyboxDn"] = "rbxassetid://271077243", ["SkyboxFt"] = "rbxassetid://271042556", ["SkyboxLf"] = "rbxassetid://271042310", ["SkyboxRt"] = "rbxassetid://271042467", ["SkyboxUp"] = "rbxassetid://271077958" },
	["Morning Glow"] = { ["SkyboxBk"] = "rbxassetid://1417494030", ["SkyboxDn"] = "rbxassetid://1417494146", ["SkyboxFt"] = "rbxassetid://1417494253", ["SkyboxLf"] = "rbxassetid://1417494402", ["SkyboxRt"] = "rbxassetid://1417494499", ["SkyboxUp"] = "rbxassetid://1417494643" },
	["Setting Sun"] = { ["SkyboxBk"] = "rbxassetid://626460377", ["SkyboxDn"] = "rbxassetid://626460216", ["SkyboxFt"] = "rbxassetid://626460513", ["SkyboxLf"] = "rbxassetid://626473032", ["SkyboxRt"] = "rbxassetid://626458639", ["SkyboxUp"] = "rbxassetid://626460625" },
	["Fade Blue"] = { ["SkyboxBk"] = "rbxassetid://153695414", ["SkyboxDn"] = "rbxassetid://153695352", ["SkyboxFt"] = "rbxassetid://153695452", ["SkyboxLf"] = "rbxassetid://153695320", ["SkyboxRt"] = "rbxassetid://153695383", ["SkyboxUp"] = "rbxassetid://153695471" },
	["Elegant Morning"] = { ["SkyboxBk"] = "rbxassetid://153767241", ["SkyboxDn"] = "rbxassetid://153767216", ["SkyboxFt"] = "rbxassetid://153767266", ["SkyboxLf"] = "rbxassetid://153767200", ["SkyboxRt"] = "rbxassetid://153767231", ["SkyboxUp"] = "rbxassetid://153767288" },
	["Neptune"] = { ["SkyboxBk"] = "rbxassetid://218955819", ["SkyboxDn"] = "rbxassetid://218953419", ["SkyboxFt"] = "rbxassetid://218954524", ["SkyboxLf"] = "rbxassetid://218958493", ["SkyboxRt"] = "rbxassetid://218957134", ["SkyboxUp"] = "rbxassetid://218950090" },
	["Redshift"] = { ["SkyboxBk"] = "rbxassetid://401664839", ["SkyboxDn"] = "rbxassetid://401664862", ["SkyboxFt"] = "rbxassetid://401664960", ["SkyboxLf"] = "rbxassetid://401664881", ["SkyboxRt"] = "rbxassetid://401664901", ["SkyboxUp"] = "rbxassetid://401664936" },
	["Aesthetic Night"] = {  ["SkyboxBk"] = "rbxassetid://1045964490", ["SkyboxDn"] = "rbxassetid://1045964368", ["SkyboxFt"] = "rbxassetid://1045964655", ["SkyboxLf"] = "rbxassetid://1045964655", ["SkyboxRt"] = "rbxassetid://1045964655", ["SkyboxUp"] = "rbxassetid://1045962969" },
	["Gloomy Gray"] = { ["SkyboxBk"] = "rbxassetid://4495864450", ["SkyboxDn"] = "rbxassetid://4495864887", ["SkyboxFt"] = "rbxassetid://4495865458", ["SkyboxLf"] = "rbxassetid://4495866035", ["SkyboxRt"] = "rbxassetid://4495866584", ["SkyboxUp"] = "rbxassetid://4495867486" },
	["Light Within Dark"] = { ["SkyboxBk"] = "rbxassetid://15502511288", ["SkyboxDn"] = "rbxassetid://15502508460", ["SkyboxFt"] = "rbxassetid://15502510289", ["SkyboxLf"] = "rbxassetid://15502507918", ["SkyboxRt"] = "rbxassetid://15502509398", ["SkyboxUp"] = "rbxassetid://15502511911" },
	["Green Space"] = { ["SkyboxBk"] = "rbxassetid://16823270864", ["SkyboxDn"] = "rbxassetid://16823272150", ["SkyboxFt"] = "rbxassetid://16823273508", ["SkyboxLf"] = "rbxassetid://16823274898", ["SkyboxRt"] = "rbxassetid://16823276281", ["SkyboxUp"] = "rbxassetid://16823277547" },
	["The Winter"] = { ["SkyboxBk"] = "rbxassetid://7307273436", ["SkyboxDn"] = "rbxassetid://7307275898", ["SkyboxFt"] = "rbxassetid://7307282434", ["SkyboxLf"] = "rbxassetid://7307284944", ["SkyboxRt"] = "rbxassetid://7307287254", ["SkyboxUp"] = "rbxassetid://7307290025" },
	["Oblivion"] = { ["SkyboxBk"] = "rbxassetid://16642312709", ["SkyboxDn"] = "rbxassetid://16642313526", ["SkyboxFt"] = "rbxassetid://16642314757", ["SkyboxLf"] = "rbxassetid://16642315809", ["SkyboxRt"] = "rbxassetid://16642317038", ["SkyboxUp"] = "rbxassetid://16642318139" },
	["Final Bloodmoon"] = { ["SkyboxBk"] = "rbxassetid://15493709538", ["SkyboxDn"] = "rbxassetid://15493710499", ["SkyboxFt"] = "rbxassetid://15493711616", ["SkyboxLf"] = "rbxassetid://15493712720", ["SkyboxRt"] = "rbxassetid://15493713902", ["SkyboxUp"] = "rbxassetid://15493714708" },
	["Clouds"] = { ["SkyboxBk"] = "rbxassetid://570557514", ["SkyboxDn"] = "rbxassetid://570557775", ["SkyboxFt"] = "rbxassetid://570557559", ["SkyboxLf"] = "rbxassetid://570557620", ["SkyboxRt"] = "rbxassetid://570557672", ["SkyboxUp"] = "rbxassetid://570557727" },
	["Twilight"] = { ["SkyboxBk"] = "rbxassetid://264908339", ["SkyboxDn"] = "rbxassetid://264907909", ["SkyboxFt"] = "rbxassetid://264909420", ["SkyboxLf"] = "rbxassetid://264909758", ["SkyboxRt"] = "rbxassetid://264908886", ["SkyboxUp"] = "rbxassetid://264907379" },
	["Red Mountain"] = { ["SkyboxBk"] = "rbxassetid://6636457509", ["SkyboxDn"] = "rbxassetid://6636457509", ["SkyboxFt"] = "rbxassetid://6636457509", ["SkyboxLf"] = "rbxassetid://6636457509", ["SkyboxRt"] = "rbxassetid://6636457509", ["SkyboxUp"] = "rbxassetid://6636457509" },
	["Cloudy Skies"] = { ["SkyboxBk"] = "rbxassetid://252760981", ["SkyboxDn"] = "rbxassetid://252763035", ["SkyboxFt"] = "rbxassetid://252761439", ["SkyboxLf"] = "rbxassetid://252760980", ["SkyboxRt"] = "rbxassetid://252762652", ["SkyboxUp"] = "rbxassetid://252762652" },
	["Dark Blue"] = { ["SkyboxBk"] = "rbxassetid://30306692", ["SkyboxDn"] = "rbxassetid://25901058", ["SkyboxFt"] = "rbxassetid://30306730", ["SkyboxLf"] = "rbxassetid://30306626", ["SkyboxRt"] = "rbxassetid://30306665", ["SkyboxUp"] = "rbxassetid://30306603" },
	["Minecraft"] = { ["SkyboxBk"] = "rbxassetid://3822390508", ["SkyboxDn"] = "rbxassetid://3822392871", ["SkyboxFt"] = "rbxassetid://3822391392", ["SkyboxLf"] = "rbxassetid://3822391866", ["SkyboxRt"] = "rbxassetid://3822390968", ["SkyboxUp"] = "rbxassetid://3822392413" },
	["Vaporwave"] = { ["SkyboxBk"] = "rbxassetid://1417494030", ["SkyboxDn"] = "rbxassetid://1417494146", ["SkyboxFt"] = "rbxassetid://1417494253", ["SkyboxLf"] = "rbxassetid://1417494402", ["SkyboxRt"] = "rbxassetid://1417494499", ["SkyboxUp"] = "rbxassetid://1417494643" },
	["Space"] = { ["SkyboxBk"] = "rbxassetid://149397692", ["SkyboxDn"] = "rbxassetid://149397686", ["SkyboxFt"] = "rbxassetid://149397697", ["SkyboxLf"] = "rbxassetid://149397684", ["SkyboxRt"] = "rbxassetid://149397688", ["SkyboxUp"] = "rbxassetid://149397702" },
	["Pink Vision"] = { ["SkyboxBk"] = "rbxassetid://6593929026", ["SkyboxDn"] = "rbxassetid://6593930140", ["SkyboxFt"] = "rbxassetid://6593931249", ["SkyboxLf"] = "rbxassetid://6593932587", ["SkyboxRt"] = "rbxassetid://6593933789", ["SkyboxUp"] = "rbxassetid://6593935319" },
	["Anime Sky"] = { ["SkyboxBk"] = "rbxassetid://6598038571", ["SkyboxDn"] = "rbxassetid://6598060864", ["SkyboxFt"] = "rbxassetid://6598069162", ["SkyboxLf"] = "rbxassetid://6598081281", ["SkyboxRt"] = "rbxassetid://6598083861", ["SkyboxUp"] = "rbxassetid://6598088065" },
	["Alien Red"] = { ["SkyboxBk"] = "rbxassetid://1012890", ["SkyboxDn"] = "rbxassetid://1012891", ["SkyboxFt"] = "rbxassetid://1012887", ["SkyboxLf"] = "rbxassetid://1012889", ["SkyboxRt"] = "rbxassetid://1012888", ["SkyboxUp"] = "rbxassetid://1014449" },
	["CS City"] = { ["SkyboxBk"] = "rbxassetid://2240134413", ["SkyboxDn"] = "rbxassetid://2240136039", ["SkyboxFt"] = "rbxassetid://2240130790", ["SkyboxLf"] = "rbxassetid://2240133550", ["SkyboxRt"] = "rbxassetid://2240132643", ["SkyboxUp"] = "rbxassetid://2240135222" },
	["Dark City"] = { ["SkyboxBk"] = "rbxassetid://1424486234", ["SkyboxDn"] = "rbxassetid://1424485998", ["SkyboxFt"] = "rbxassetid://1424485697", ["SkyboxLf"] = "rbxassetid://1424484951", ["SkyboxRt"] = "rbxassetid://1424484760", ["SkyboxUp"] = "rbxassetid://1424484510" },
	["Earth"] = { ["SkyboxBk"] = "rbxassetid://166509999", ["SkyboxDn"] = "rbxassetid://166510057", ["SkyboxFt"] = "rbxassetid://166510116", ["SkyboxLf"] = "rbxassetid://166510092", ["SkyboxRt"] = "rbxassetid://166510131", ["SkyboxUp"] = "rbxassetid://166510114" },
	["Mountains"] = { ["SkyboxBk"] = "rbxassetid://368385273", ["SkyboxDn"] = "rbxassetid://48015300", ["SkyboxFt"] = "rbxassetid://368388290", ["SkyboxLf"] = "rbxassetid://368390615", ["SkyboxRt"] = "rbxassetid://368385190", ["SkyboxUp"] = "rbxassetid://48015387" },
	["Old Skybox"] = { ["SkyboxBk"] = "rbxassetid://15436783", ["SkyboxDn"] = "rbxassetid://15436796", ["SkyboxFt"] = "rbxassetid://15436831", ["SkyboxLf"] = "rbxassetid://15437157", ["SkyboxRt"] = "rbxassetid://15437166", ["SkyboxUp"] = "rbxassetid://15437184" },
	["Red Sky"] = { ["SkyboxBk"] = "rbxassetid://401664839", ["SkyboxDn"] = "rbxassetid://401664862", ["SkyboxFt"] = "rbxassetid://401664960", ["SkyboxLf"] = "rbxassetid://401664881", ["SkyboxRt"] = "rbxassetid://401664901", ["SkyboxUp"] = "rbxassetid://401664936" },
	["Stormy Sky"] = { ["SkyboxBk"] = "rbxassetid://1327366", ["SkyboxDn"] = "rbxassetid://1327367", ["SkyboxFt"] = "rbxassetid://1327362", ["SkyboxLf"] = "rbxassetid://1327363", ["SkyboxRt"] = "rbxassetid://1327361", ["SkyboxUp"] = "rbxassetid://1327368" },
	["Wasteland"] = { ["SkyboxBk"] = "rbxassetid://2046134302", ["SkyboxDn"] = "rbxassetid://2046134976", ["SkyboxFt"] = "rbxassetid://2046135977", ["SkyboxLf"] = "rbxassetid://2046135392", ["SkyboxRt"] = "rbxassetid://2046136939", ["SkyboxUp"] = "rbxassetid://2046136551" },
	["Blue Sky"] = { ["SkyboxBk"] = "rbxassetid://226060119", ["SkyboxDn"] = "rbxassetid://226060115", ["SkyboxFt"] = "rbxassetid://226060143", ["SkyboxLf"] = "rbxassetid://226060136", ["SkyboxRt"] = "rbxassetid://226060155", ["SkyboxUp"] = "rbxassetid://226060167" },
	["Green Sky"] = { ["SkyboxBk"] = "rbxassetid://157711514", ["SkyboxDn"] = "rbxassetid://157711501", ["SkyboxFt"] = "rbxassetid://157711522", ["SkyboxLf"] = "rbxassetid://157711494", ["SkyboxRt"] = "rbxassetid://157711509", ["SkyboxUp"] = "rbxassetid://157711528" }
}
val_899 = { SmoothPlastic = "", ForceField = "4573037993" }
hitSounds = {
	Bameware = "rbxassetid://3124331820", Bell = "rbxassetid://6534947240", Bubble = "rbxassetid://6534947588", Pick = "rbxassetid://1347140027", Pop = "rbxassetid://198598793", Rust = "rbxassetid://1255040462", Sans = "rbxassetid://3188795283", Fart = "rbxassetid://130833677", Big = "rbxassetid://5332005053", Vine = "rbxassetid://5332680810", Bruh = "rbxassetid://4578740568", Skeet = "rbxassetid://5633695679", Neverlose = "rbxassetid://6534948092", Fatality = "rbxassetid://6534947869", Bonk = "rbxassetid://5766898159", Minecraft = "rbxassetid://4018616850", Moan = { "rbxassetid://2440888376", "rbxassetid://2440889605", "rbxassetid://2440889869", "rbxassetid://2440889381", "rbxassetid://2440891382" }
}
val_741.TargetFilter = val_749; indicatorHolder = Instance.new("ScreenGui", game.CoreGui); leftIndicator = Instance.new("TextLabel", indicatorHolder); rightIndicator = Instance.new("TextLabel", indicatorHolder); indicatorHolder.Enabled = false; leftIndicator.BackgroundTransparency = 1; leftIndicator.Size = UDim2.new(0.4, 0, 0, 0); leftIndicator.Position = UDim2.new(0, 0, 0.5, 0); leftIndicator.TextXAlignment = "Right"; leftIndicator.TextColor3 = Color3.new(1, 1, 1); leftIndicator.Text = "<"; leftIndicator.TextSize = 40; leftIndicator.TextTransparency = 0.5 
leftIndicator.Font = "Bodoni"
rightIndicator.BackgroundTransparency = 1; rightIndicator.Size = UDim2.new(0.6, 0, 0, 0); rightIndicator.Position = UDim2.new(0, 0, 0.5, 0); rightIndicator.TextXAlignment = "Right"; rightIndicator.TextColor3 = Color3.new(1, 1, 1); rightIndicator.Text = ">"; rightIndicator.TextSize = 40 
rightIndicator.Font = "Bodoni"
rightIndicator.TextTransparency = 0.5 
local success, result = pcall(function() return game:GetObjects("rbxassetid://6219220506")[1] end)
if success and result then
    val_824 = result
else
    warn("Failed to load asset 6219220506"); val_824 = Instance.new("ScreenGui"); local dummyFrame = Instance.new("Frame", val_824); dummyFrame.Name = "mainFrame"; dummyFrame.Visible = false
end
val_824.Parent = game.CoreGui; val_824.mainFrame.Visible = false; val_824.mainFrame.ZIndex = 100; onHit = Instance.new("BindableEvent", workspace); onHit.Name = "onHit"; onKill = Instance.new("BindableEvent", workspace); onKill.Name = "onKill"; val_904 = -3846999; val_906 = 8532252; val_907 = -1162714; val_908 = 52; val_909 = 4; val_910 = 82 
function encodePos(var_29)
	local val_985, val_986, val_987 = var_29.X * val_908, var_29.Y * val_909, var_29.Z * val_910 
	return Vector3.new(val_904 + val_985, val_906 + val_986, val_907 + val_987)
end 
function decodePos(var_240)
	local val_988, val_990, val_991 = var_240.X - val_904, var_240.Y - val_906, var_240.Z - val_907 
	return Vector3.new(val_988 / val_908, val_990 / val_909, val_991 / val_910)
end 
env.encodePos = encodePos; env.decodePos = decodePos 
function addSkin(var_247, var_235, var_127, var_158, var_132)
	local val_992, val_993 = pcall(function()
		local val_994 = {}
		for var_263, var_257 in var_127 do
			if var_257:match("^%w+://([^/]+)") then
				local val_1007 = request({ Url = var_257, Method = "GET" })
				if val_1007.Success then
					table.insert(val_994, var_263)
				end
			end
		end 
		local val_996 = false 
		if var_158:match("^%w+://([^/]+)") then
			local val_1008 = request({ Url = var_158, Method = "GET" })
			if val_1008.Success then
				val_996 = true
			end
		end 
		local val_997 = var_247 .. "_" .. var_235; local val_998 = string.split(val_997, "_")[2]; local val_999 = string.split(val_997, "_")[1]
		if not val_996 then
			var_158 = var_158 and "rbxassetid://" .. tostring(var_158) or "rbxassetid://1541381206"
		end 
		local val_1000 = nil 
		if var_132 == "Glove" then
			val_1000 = "Knife"
		else
			val_1000 = var_132 or "Red"
		end 
		local val_1001 = Instance.new("StringValue"); val_1001.Name = val_998; local val_1002 = Instance.new("StringValue"); val_1002.Name = val_997; local val_1003 = Instance.new("StringValue"); val_1003.Name = val_998; val_1003.Value = var_158 
		pcall(function()
			val_1003.Parent = game.Players.LocalPlayer.PlayerGui.Client.Images[val_999]
		end)
		local val_1004 = Instance.new("StringValue"); val_1004.Name = val_998; val_1004.Name = "Quality"; val_1004.Value = val_1000; val_1004.Parent = val_1003; local val_1005 = Instance.new("StringValue"); val_1005.Name = val_997; val_1005.Value = val_1000 
		pcall(function()
			val_1005.Parent = game.Players.LocalPlayer.PlayerGui.Client.Rarities 
		end)
		if var_132 == "Glove" then
			local gloveChildren = val_662.Gloves[val_999]:GetChildren(); local template = gloveChildren[1]
			if not template then
				for _, otherGlove in val_662.Gloves:GetChildren() do
					if #otherGlove:GetChildren() > 0 then
						template = otherGlove:GetChildren()[1]; break
					end
				end
			end
			local val_1009 = template:Clone(); val_1009.Textures.TextureId = "rbxassetid://" .. var_127.Main; val_1009.Name = val_998; val_1009.Parent = val_662.Gloves[val_999]
		else
			local val_1010 = game.ReplicatedStorage.Skins[val_999]:GetChildren()[1]:Clone(); val_1010.Name = val_998; val_1010.Parent = game.ReplicatedStorage.Skins[val_999]
			for var_122, var_69 in val_1010:GetChildren() do
				if var_69.ClassName ~= "Folder" then
					local vname = var_69.Name; local val_1012 = table.find(val_994, vname) and "" or "rbxassetid://"
					if var_127[vname] then
						var_69.Value = val_1012 .. var_127[vname]
					elseif var_127.Main then
						val_1012 = table.find(val_994, "Main") and "" or "rbxassetid://"; var_69.Value = val_1012 .. var_127.Main
					end
				end
			end
			for reqPart, reqId in var_127 do
				if reqPart ~= "Main" and not val_1010:FindFirstChild(reqPart) then
					local nv = Instance.new("StringValue"); nv.Name = reqPart; local val_1012 = table.find(val_994, reqPart) and "" or "rbxassetid://"; nv.Value = val_1012 .. reqId; nv.Parent = val_1010
				end
			end
		end
	end)
	if not val_992 then
		warn(val_993)
	end
end 
function chat(var_239)
	val_662.Events.PlayerChatted:FireServer(var_239, false, false, true)
end 
function alive(var_252)
	if var_252 == nil then
		var_252 = val_733
	end 
	if var_252.Character and var_252:FindFirstChild("Ragdoll") and var_252.Character.PrimaryPart and var_252.Character:FindFirstChild("UpperTorso") and var_252.Character:FindFirstChild("Head") and var_252.Character:FindFirstChild("EquippedTool") and var_252.Character:FindFirstChild("HumanoidRootPart") and var_252.Character:FindFirstChild("Humanoid") and var_252.Character.Humanoid.Health > 0 then
		return true
	end 
	return false
end 
function updateViewModelVisuals()
	local val_1013 
	if val_749:FindFirstChild("Arms") then
		val_1013 = val_749.Arms
	end 
	if val_1013 and val_1013.Name == "Arms" then
		for var_246, var_141 in val_1013:GetChildren() do
			if library_flags["Weapon Chams"] then
				if var_141:IsA"MeshPart" or var_141.Name == "Part" then
					if var_141.Name == "StatClock" then
						var_141:ClearAllChildren()
					end 
					var_141.Color = library_flags["weaponColor"]; var_141.Transparency = 1 - UI_Library.options["weaponColor"].trans; var_141.Material = chamsMaterial(library_flags["weaponMaterial"])
					if hasProperty(var_141, "TextureID") then
						var_141.TextureID = library_flags["weaponMaterial"] == "Ghost" and GHOST_TEXTURE or ""
					end 
					if hasProperty(var_141, "Reflectance") then
						var_141.Reflectance = library_flags["weaponReflectance"] / 50
					end 
					if var_141:FindFirstChild("SurfaceAppearance") then
						var_141.SurfaceAppearance:Destroy()
					end
				end 
				local val_277 = false 
				for var_77, var_176 in val_749.Arms:GetChildren() do
					if string.find(var_176.Name, 'Knife') or var_176.Name == "Handle2" or var_176.Name == "Blade" then
						val_277 = true
					end
				end 
				if val_277 then
					if val_749.Arms:FindFirstChild("Handle") then
						val_749.Arms.Handle.Transparency = 1
					end
				end 
				pcall(function()
					if val_749.Arms:FindFirstChild("Silencer2") and workspace:FindFirstChild("Map") then
						if workspace.Map.SpawnPoints:FindFirstChild("BuyArea") then
							val_749.Arms.Silencer2.Welded.Part0 = workspace.Map.SpawnPoints.BuyArea
						end
					end
				end)
			end 
			if var_141:IsA"Model" then
                local descendants = val_1013:GetDescendants()
				if env.ApplySleeveChangerToCurrent then
					pcall(env.ApplySleeveChangerToCurrent)
				end
				for var_194, var_255 in descendants do
					if var_255.Name == "Sleeve" or var_255.Name == "Glove" then
                        if library_flags["Remove Sleeves"] and var_255.Name == "Sleeve" and var_255:GetAttribute("Applied") == nil then
    						var_255:Destroy()
                        end
						if var_255.Name == "Sleeve" then
							local motor = var_255:FindFirstChild("SleeveMotor")
							if motor then
								local sx = (library_flags["skinSleeveX"] or 0) / 25; local sy = (library_flags["skinSleeveY"] or 0) / 25; local sz = (library_flags["skinSleeveZ"] or 0) / 25
								if not library_flags["skinSleeveChangerToggle"] then
									sx, sy, sz = 0, 0, 0
								end
								local origC1 = motor:GetAttribute("OrigC1")
								if not origC1 then
									origC1 = motor.C1; motor:SetAttribute("OrigC1", origC1)
								end
								motor.C1 = origC1 * CFrame.new(sx, sy, -sz):Inverse()
							end
						end
					end 
					local isSleeve = string.find(string.lower(var_255.Name), "sleeve") or (var_255.Parent and string.find(string.lower(var_255.Parent.Name), "sleeve"))
					if library_flags["Arm Chams"] and not isSleeve then
						if hasProperty(var_255, "CastShadow") then
							var_255.CastShadow = false
						end 
						local val_278 = chamsMaterial(library_flags["armMaterial"])
						if var_255:IsA"SpecialMesh" then
							if library_flags["armMaterial"] == "Ghost" then
								var_255.TextureId = GHOST_TEXTURE
							elseif val_278 == "ForceField" then
								var_255.TextureId = val_899[val_278]
							else
								var_255.TextureId = ""
							end 
							local val_279 = library_flags["armColor"]; var_255.VertexColor = Vector3.new(val_279.R, val_279.G, val_279.B)
						end 
						if var_255:IsA"BasePart" then
							var_255.Material = val_278; var_255.Color = library_flags["armColor"]
							if var_255.Transparency == 1 then
								continue 
							end 
							var_255.Transparency = 1.01 - UI_Library.options["armColor"].trans
						end
					elseif library_flags["customArmColor"] and not isSleeve then
						if var_255:IsA"SpecialMesh" then
							local clr = library_flags["customArmColorValue"]; var_255.VertexColor = Vector3.new(clr.R, clr.G, clr.B)
						end 
						if var_255:IsA"BasePart" then
							var_255.Color = library_flags["customArmColorValue"]
						end
					elseif library_flags["customSleeveColor"] and isSleeve then
						if var_255:IsA"SpecialMesh" then
							local clr = library_flags["customSleeveColorValue"]; var_255.VertexColor = Vector3.new(clr.R, clr.G, clr.B)
						end 
						if var_255:IsA"BasePart" then
							var_255.Color = library_flags["customSleeveColorValue"]
						end
					end
				end
			end
		end
	end
end 
val_911 = {
	{ "", "DualBerettas", "", "", "Deagle/R8" }, {}, {}, { "", "AK47/M4", "Scout", "", "AWP", "Autosniper" }, { "Kevlar Vest", "Kevlar + Helmet", "" }, { "Fire Grenade", "Decoy Grenade", "Flashbang", "HE Grenade", "Smoke Grenade" }
}
function buyWeapon(var_139)
	if var_139 == "None" then
		return
	end 
	wait(0.15)
	CreateThread(function()
		val_757.createNotification2("Purchasing " .. var_139 .. "...")
	end)
	val_757.Buymenuframe.Visible = true; val_757.BuyMenuOpen = true 
	for var_91, var_90 in val_911 do
		if table.find(var_90, var_139) then
			val_757.Click(var_91); wait()
			for var_98, var_131 in var_90 do
				if var_131 == var_139 then
					val_757.Click(var_98); wait(); val_757.Back(var_98)
				end
			end
		end
	end
end 
function draggable(var_56)
	local val_281 = game:GetService("UserInputService"); local val_282; local val_283; local val_284; local val_285 
local function var_119(var_168)
		if not scrollon then
			local val_286 = var_168.Position - val_284; var_56.Position = UDim2.new(val_285.X.Scale, val_285.X.Offset + val_286.X, val_285.Y.Scale, val_285.Y.Offset + val_286.Y)
		end
	end 
	var_56.InputBegan:Connect(function(var_103)
		if var_103.UserInputType == Enum.UserInputType.MouseButton1 or var_103.UserInputType == Enum.UserInputType.Touch then
			val_282 = true; val_284 = var_103.Position; val_285 = var_56.Position 
			var_103.Changed:Connect(function()
				if var_103.UserInputState == Enum.UserInputState.End then
					val_282 = false
					if var_56.Name and var_56.Name ~= "Frame" then
						library_flags["ui_pos_" .. var_56.Name] = tostring(var_56.Position.X.Scale)..","..tostring(var_56.Position.X.Offset)..","..tostring(var_56.Position.Y.Scale)..","..tostring(var_56.Position.Y.Offset)
					end
				end
			end)
		end
	end)
	var_56.InputChanged:Connect(function(var_82)
		if var_82.UserInputType == Enum.UserInputType.MouseMovement or var_82.UserInputType == Enum.UserInputType.Touch then
			val_283 = var_82
		end
	end)
	val_281.InputChanged:Connect(function(var_250)
		if var_250 == val_283 and val_282 then
			var_119(var_250)
		end
	end)
end 
function returntime(var_120)
	return os.date("*t", os.time())[var_120]
end 
val_912 = { DiamondPlate = 3, CorrodedMetal = 2, Metal = 2, Concrete = 2, Brick = 2, WoodPlanks = 0.1, Wood = 0.1, nowallbang = 100, Grate = 0.1, Glass = 0.1, Cardboard = 0.1 }; env.damagemod = 1 
function wallbangCheck(var_119)
	return var_119 and var_119.Parent and var_119.Parent.Name == "Hitboxes" or var_119 and var_119.Parent and var_119.Parent.Parent and var_119.Parent.Parent:FindFirstChild("Humanoid") or var_119 and var_119.Parent and var_119.Parent:FindFirstChild("Humanoid") or var_119 and var_119.Parent and var_119.Parent:FindFirstChild("Humanoid") and (1 > var_119.Transparency or var_119.Name == "HeadHB") and var_119.Parent:IsA("Model")
end 
val_913 = false; val_915 = Instance.new("Part"); val_915.Size = Vector3.new(0.75, 0.75, 0.75); val_915.Anchored = true; val_915.Material = "Neon"; val_915.Color = Color3.new(0.85, 0.25, 0.75); val_915.Transparency = 1; val_915.Name = "jigpart"
function calculateWallbang(var_200, var_70, var_273)
	local val_287 = val_757.gun 
	if type(val_287) == "string" or not val_287 or not val_287:FindFirstChild("Penetration") or val_287:FindFirstChild("Melee") or not var_200:FindFirstChild(var_70) then
		return 0, 0
	end 
	if not workspace:FindFirstChild("Map") then
		return 0, 0
	end 
	val_913 = not val_913 
	if var_273 and val_913 then
		local val_301 = val_915:Clone(); val_301.CFrame = var_200[var_70].CFrame + var_200[var_70].Velocity * library_flags["predictAmount"] / 400; val_301.Parent = var_200; var_70 = "jigpart"
	end 
	local val_289 = var_200[var_70]; local val_290 = library_flags["From Camera"] and val_749.CFrame.p or Vector3.new(val_733.Character.PrimaryPart.Position.X, val_733.Character.Head.Position.Y, val_733.Character.PrimaryPart.Position.Z); local val_291 = CFrame.new(val_290, val_289.Position).lookVector.unit * 4096 * 0.0694; local val_292 = Ray.new(val_290, val_291); local val_293 = val_287.Penetration.Value * 0.013 or 0; local val_294 = { val_749, val_733.Character, workspace.Debris, workspace.Ray_Ignore, workspace.Map.Clips, workspace.Map.SpawnPoints }; local val_295 = {}; local val_296 = nil; local val_297 = 1; local val_298 = 0; local val_299 = 0; local val_300 = 0 
	repeat
		val_300 = val_300 + 1; val_296, pos = workspace:FindPartOnRayWithIgnoreList(val_292, val_294, false, true)
		if val_296 and val_296 ~= val_289 or val_296 and val_296.Parent and val_296 ~= val_289 then
			if not val_296:IsDescendantOf(var_200) and not string.find(val_296.Name, "Head") then
				local val_302 = 1; local val_303 = tostring(val_296.Material); local val_304 = string.sub(tostring(val_296.Material), 15, # val_303); local val_305 = val_912[val_296.Name]; local val_306 = val_912[val_304]; local val_307 = 2 - library_flags["awallMod"] == 0 and 0.1 or 2 - library_flags["awallMod"]; val_302 = (val_305 or val_306 or 1) * val_307 
				if string.find(val_296.Name, "Hat") or string.find(val_296.Parent.Name, "Hat") then
					val_302 = 0
				end 
				local val_308, val_310 = workspace:FindPartOnRayWithWhitelist(Ray.new(pos + val_291 * 1, val_291 * -2), { val_296 }, true); local val_311 = (val_310 - pos).magnitude; local val_312 = val_311 * val_302; val_299 = math.min(val_293, val_299 + val_312); val_297 = 1 - val_299 / val_293 
				if val_302 > 0 then
					val_298 = val_298 + 1
				end 
				table.insert(val_295, val_296)
				if wallbangCheck(val_296) then
					table.insert(val_294, val_296.Parent)
				else
					table.insert(val_294, val_296)
				end
			end
		end
	until val_296 == nil or val_296 == val_289 or val_296:IsDescendantOf(var_200) or val_298 >= 4 or val_299 >= val_293 or val_300 > 20 or val_296.Name == "jigpart" or string.find(val_296.Name, "Head")
	if val_298 >= 4 or val_300 >= 20 then
		val_297 = 0
	end 
	if var_273 and val_913 then
		if val_297 ~= 0 then
			if library_flags["Show Prediction Position"] then
				local val_313 = Instance.new("Part"); val_313.Size = Vector3.new(0.5, 0.5, 0.5); val_313.Anchored = true; val_313.CanCollide = false; val_313.Transparency = 0.6; val_313.Position = val_289.Position; val_313.Color = Color3.new(0.3, 1, 0.3); val_313.Material = "Neon"; val_313.Parent = workspace.Ray_Ignore; val_722:AddItem(val_313, 3)
			end
		end 
		val_289:Destroy()
	end 
	return val_297, val_298
end 
function returnDamage(var_86, var_162)
	local val_314 = 0; local val_315 = 0 
	if val_757.gun and val_757.gun:FindFirstChild("Melee") then
		return 0, 0
	end 
	if not workspace:FindFirstChild("Map") then
		return 0, 0
	end 
	pcall(function()
		local val_316 = { val_749, val_733.Character, workspace.Debris, workspace.Ray_Ignore, workspace.Map:FindFirstChild("Clips"), workspace.Map:FindFirstChild("SpawnPoints") }; local val_317 = val_757.gun; local val_318 = val_317.Penetration.Value * 0.01 or 0; local val_319 = val_317.Range.Value; local val_320 = val_317.DMG.Value; local val_321 = var_86[var_162].Position; local val_322 = library_flags["From Camera"] and val_749.CFrame.p or Vector3.new(val_733.Character.PrimaryPart.Position.X, val_733.Character.Head.Position.Y, val_733.Character.PrimaryPart.Position.Z); local val_323 = CFrame.new(val_322, val_321).lookVector.unit * val_319 * 0.0694; local val_324 = Ray.new(val_322, val_323); local val_325, val_326 = workspace:FindPartOnRayWithIgnoreList(val_324, val_316, false, true); local val_327 = 0; local val_328 = 0; local val_329, val_330, val_331; local val_332 = 1; val_314 = 1 
		pcall(function()
			repeat
				val_329, val_330, val_331 = workspace:FindPartOnRayWithIgnoreList(val_324, val_316, false, true)
				if val_329 and val_329.Parent then
					val_332 = 1; local val_333 = tostring(val_329.Material); local val_334 = string.sub(tostring(val_329.Material), 15, # val_333); local val_335 = val_912[val_329.Name]; local val_336 = val_912[val_334]; val_332 = val_335 or val_336 or 1 
					if val_329:FindFirstChild("PartModifier") then
						val_332 = val_329.PartModifier.Value
					end 
					if val_329:IsDescendantOf(game.Workspace.Ray_Ignore) or val_329:IsDescendantOf(game.Workspace.Debris) then
						val_332 = 0
					end 
					local val_337, val_338 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(val_330 + val_323 * 1, val_323 * -2), { val_329 }, true); local val_339 = (val_338 - val_330).magnitude; local val_340 = val_339 * val_332; val_328 = math.min(val_318, val_328 + val_340); val_314 = 1 - val_328 / val_318 
					if val_332 > 0 then
						val_327 = val_327 + 1
					end 
					if val_329 and val_329.Parent and val_329.Parent.Name == "Hitboxes" or val_329 and val_329.Parent and val_329.Parent.Parent and val_329.Parent.Parent:FindFirstChild("Humanoid") or val_329 and val_329.Parent and val_329.Parent:FindFirstChild("Humanoid") or val_329 and val_329.Parent and val_329.Parent:FindFirstChild("Humanoid") and (1 > val_329.Transparency or val_329.Name == "HeadHB") and val_329.Parent:IsA("Model") then
						table.insert(val_316, val_329.Parent)
					else
						table.insert(val_316, val_329)
					end
				end
			until val_329 == nil or val_329.Parent == var_86 or val_328 >= val_318 or 0 >= val_314 or val_327 >= 4
		end)
		if val_327 >= 5 then
			val_314 = 0
		end
	end)
	return val_314, val_315
end 
function tracerTable(var_171)
	if not workspace:FindFirstChild("Map") then
		return {}
	end 
	local val_341 = { val_749, val_733.Character, game.Workspace.Debris, game.Workspace.Ray_Ignore, game.Workspace.Map:FindFirstChild("Clips"), game.Workspace.Map:FindFirstChild("SpawnPoints") }; local val_342 = game.ReplicatedStorage.Weapons:FindFirstChild(val_733.Character.EquippedTool.Value); local val_343 = val_342.Penetration.Value * 0.01; local val_344 = val_342.Range.Value; local val_345 = val_342.DMG.Value; local val_346 = var_171; local val_347 = CFrame.new(val_749.CFrame.p, val_346).lookVector.unit * val_344 * 0.0694; local val_348 = Ray.new(val_749.CFrame.p, val_347); local val_349, val_350 = workspace:FindPartOnRayWithIgnoreList(val_348, val_341, false, true); local val_351 = 0; local val_352 = 0; local val_353, val_354, val_355; local val_356 = 1; damagemodifier = 1 
	pcall(function()
		repeat
			val_353, val_354, val_355 = workspace:FindPartOnRayWithIgnoreList(val_348, val_341, false, true)
			if val_353 and val_353.Parent then
				val_356 = 1; val_351 = val_351 + 1 
				if val_353.Name == "nowallbang" then
					val_356 = 100
				elseif val_353:FindFirstChild("PartModifier") then
					val_356 = val_353.PartModifier.Value
				end 
				local val_358, val_359 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(val_354 + val_347 * 1, val_347 * -2), { val_353 }, true); local val_360 = (val_359 - val_354).magnitude; local val_361 = val_360 * val_356; val_352 = math.min(val_343, val_352 + val_361); damagemodifier = 1 - val_352 / val_343 
				if damagemodifier > 0 and val_356 < 100 then
					if val_353 and val_353.Parent and val_353.Parent.Name == "Hitboxes" or val_353 and val_353.Parent and val_353.Parent.Parent and val_353.Parent.Parent:FindFirstChild("Humanoid") or val_353 and val_353.Parent and val_353.Parent:FindFirstChild("Humanoid") or val_353 and val_353.Parent and val_353.Parent:FindFirstChild("Humanoid") and (1 > val_353.Transparency or val_353.Name == "HeadHB") and val_353.Parent:IsA("Model") then
						table.insert(val_341, val_353.Parent)
					else
						table.insert(val_341, val_353)
					end
				end
			end
		until val_353 == nil or val_352 >= val_343 or 0 >= damagemodifier or val_351 >= 4
	end)
	return val_341
end 
function teamCheck(var_203, var_173)
	if var_203 == val_733 then
		return false
	end
	if var_173 then
		return true
	end
	local sameTeam = false; local myStatusTeam, otherStatusTeam = nil, nil
	pcall(function()
		if val_733 and val_733:FindFirstChild("Status") and val_733.Status:FindFirstChild("Team") then
			myStatusTeam = val_733.Status.Team.Value
		end
		if var_203 and var_203:FindFirstChild("Status") and var_203.Status:FindFirstChild("Team") then
			otherStatusTeam = var_203.Status.Team.Value
		end
	end)
	if myStatusTeam and otherStatusTeam and myStatusTeam ~= "" and otherStatusTeam ~= "" then
		return myStatusTeam ~= otherStatusTeam
	end
	if var_203.Team and val_733.Team then
		if var_203.Team == val_733.Team or var_203.Team.Name == val_733.Team.Name then
			sameTeam = true
		end
	end
	if var_203.TeamColor == val_733.TeamColor then
		sameTeam = true
	end
	return not sameTeam
end 
function isBindDown(flag)
	local opt = UI_Library.options[flag]
	if not opt then return false end
	return opt.mode == "always on" or library_flags[flag] == true
end
function getWeaponInfo()
	local val_362 = {
		alive = false, melee = false, clientgun = nil, ammo = 0, name = "", sniper = false, silentAim = library_flags["otherSilentAim"], FOV = library_flags["otherFOV"], silentFOV = library_flags["otherSilentFOV"], smoothness = library_flags["otherSmoothness"], deadzone = library_flags["otherDeadzone"], baim = library_flags["otherBaim"], mindmg = library_flags["otherMin"], hitboxes = library_flags["otherHitboxes"], hitchance = library_flags["otherHitchance"] or 100, closestHitbox = library_flags["otherClosestHitbox"], trigger = library_flags["otherTrigger"], triggerDelay = library_flags["otherTriggerDelay"], type = ""
	}
	if alive() and val_662.Weapons:FindFirstChild(val_733.Character.EquippedTool.Value) then
		local val_363 = val_662.Weapons[val_733.Character.EquippedTool.Value]; val_362.clientgun = val_363; val_362.ammo = (val_733.PlayerGui:FindFirstChild("GUI") and val_733.PlayerGui.GUI:FindFirstChild("AmmoGUI") and val_733.PlayerGui.GUI.AmmoGUI:FindFirstChild("AmmoClip")) and tonumber(val_733.PlayerGui.GUI.AmmoGUI.AmmoClip.Text) or 0; val_362.melee = val_363:FindFirstChild("Melee"); val_362.name = val_363.Name; val_362.alive = true 
		if val_362.melee then
			val_362.mindmg = 387420489; val_362.hitboxes = { "Body" }; val_362.silentAim = false; val_362.silentFOV = 0
		end 
		if val_363:FindFirstChild("RifleThing") then
			val_362.FOV = library_flags["riflesFOV"]; val_362.silentFOV = library_flags["riflesSilentFOV"]; val_362.deadzone = library_flags["riflesDeadzone"]; val_362.baim = library_flags["riflesBaim"]; val_362.silentAim = library_flags["riflesSilentAim"]; val_362.smoothness = library_flags["riflesSmoothness"]; val_362.mindmg = library_flags["riflesMin"]; val_362.hitboxes = library_flags["riflesHitboxes"]; val_362.hitchance = library_flags["riflesHitchance"] or 100; val_362.closestHitbox = library_flags["riflesClosestHitbox"]; val_362.trigger = library_flags["riflesTrigger"]; val_362.triggerDelay = library_flags["riflesTriggerDelay"]; val_362.type = "main"
		elseif val_363:FindFirstChild("Secondary") and val_363.Name ~= "R8" and val_363.Name ~= "DesertEagle" then
			val_362.FOV = library_flags["pistolFOV"]; val_362.silentFOV = library_flags["pistolSilentFOV"]; val_362.deadzone = library_flags["pistolDeadzone"]; val_362.baim = library_flags["pistolBaim"]; val_362.silentAim = library_flags["pistolSilentAim"]; val_362.smoothness = library_flags["pistolSmoothness"]; val_362.mindmg = library_flags["pistolMin"]; val_362.hitboxes = library_flags["pistolHitboxes"]; val_362.hitchance = library_flags["pistolHitchance"] or 100; val_362.closestHitbox = library_flags["pistolClosestHitbox"]; val_362.trigger = library_flags["pistolTrigger"]; val_362.triggerDelay = library_flags["pistolTriggerDelay"]; val_362.type = "secondary"
		elseif val_363.Name == "R8" or val_363.Name == "DesertEagle" then
			val_362.FOV = library_flags["heavypFOV"]; val_362.silentFOV = library_flags["heavypSilentFOV"]; val_362.deadzone = library_flags["heavypDeadzone"]; val_362.baim = library_flags["heavypBaim"]; val_362.silentAim = library_flags["heavypSilentAim"]; val_362.smoothness = library_flags["heavypSmoothness"]; val_362.mindmg = library_flags["heavypMin"]; val_362.hitboxes = library_flags["heavypHitboxes"]; val_362.hitchance = library_flags["heavypHitchance"] or 100; val_362.closestHitbox = library_flags["heavypClosestHitbox"]; val_362.trigger = library_flags["heavypTrigger"]; val_362.triggerDelay = library_flags["heavypTriggerDelay"]; val_362.type = "secondary"
		elseif val_363.Name == "AWP" then
			val_362.FOV = library_flags["awpFOV"]; val_362.silentFOV = library_flags["awpSilentFOV"]; val_362.deadzone = library_flags["awpDeadzone"]; val_362.baim = library_flags["awpBaim"]; val_362.silentAim = library_flags["awpSilentAim"]; val_362.smoothness = library_flags["awpSmoothness"]; val_362.mindmg = library_flags["awpMin"]; val_362.hitboxes = library_flags["awpHitboxes"]; val_362.hitchance = library_flags["awpHitchance"] or 100; val_362.closestHitbox = library_flags["awpClosestHitbox"]; val_362.trigger = library_flags["awpTrigger"]; val_362.triggerDelay = library_flags["awpTriggerDelay"]; val_362.sniper = true; val_362.type = "main"
		elseif val_363.Name == "Scout" then
			val_362.FOV = library_flags["scoutFOV"]; val_362.silentFOV = library_flags["scoutSilentFOV"]; val_362.deadzone = library_flags["scoutDeadzone"]; val_362.baim = library_flags["scoutBaim"]; val_362.silentAim = library_flags["scoutSilentAim"]; val_362.smoothness = library_flags["scoutSmoothness"]; val_362.mindmg = library_flags["scoutMin"]; val_362.hitboxes = library_flags["scoutHitboxes"]; val_362.hitchance = library_flags["scoutHitchance"] or 100; val_362.closestHitbox = library_flags["scoutClosestHitbox"]; val_362.trigger = library_flags["scoutTrigger"]; val_362.triggerDelay = library_flags["scoutTriggerDelay"]; val_362.sniper = true; val_362.type = "main"
		elseif val_363.Name == "G3SG1" then
			val_362.mindmg = library_flags["autoMin"]; val_362.hitboxes = library_flags["autoHitboxes"]; val_362.sniper = true; val_362.type = "main"
		end
		if library_flags["allwEnabled"] then
			val_362.FOV = library_flags["allwFOV"]; val_362.deadzone = library_flags["allwDeadzone"]; val_362.baim = library_flags["allwBaim"]; val_362.smoothness = library_flags["allwSmoothness"]; val_362.hitchance = library_flags["allwHitchance"] or 100; val_362.closestHitbox = library_flags["allwClosestHitbox"]; val_362.trigger = library_flags["allwTrigger"]; val_362.triggerDelay = library_flags["allwTriggerDelay"]
			if not val_362.melee then
				val_362.silentAim = library_flags["allwSilentAim"]; val_362.silentFOV = library_flags["allwSilentFOV"]
			end
		end
	end
	return val_362
end
function getNearest(var_75, var_117, var_157)
	var_75 = var_75 * 3 
	if not val_872.alive then
		return
	end 
	if not workspace:FindFirstChild("Map") then
		return
	end 
	local val_364, val_365 = 387420489, nil 
	for var_1, var_167 in val_711:GetPlayers() do
		if var_167.Character and var_167.Character.PrimaryPart and var_167.Character:FindFirstChild("Head") and teamCheck(var_167, var_117) then
			local val_366, val_367 = val_749:WorldToScreenPoint(var_167.Character.Head.Position); local val_368 = false 
			if var_157 then
				local val_369 = Ray.new(val_749.CFrame.p, (var_167.Character.Head.Position - val_749.CFrame.p).unit * 500); local val_370, val_371 = workspace:FindPartOnRayWithIgnoreList(val_369, { val_749, val_733.Character, workspace.Ray_Ignore, workspace.Map:FindFirstChild("Clips"), workspace.Map:FindFirstChild("SpawnPoints") })
				if val_370:IsDescendantOf(var_167.Character) then
					val_368 = true
				end
			end 
			if val_367 then
				if not var_157 or var_157 and val_368 then
					local val_372 = Vector2.new(val_741.X, val_741.Y); local val_373 = (Vector2.new(val_366.X, val_366.Y) - val_372).magnitude 
					if val_373 < val_364 and val_373 <= var_75 then
						val_364 = val_373; val_365 = var_167
					end
				end
			end
		end
	end 
	return val_365, val_364
end 
function encodeHitPos(pos)
	return Vector3.new(
((pos.X - 156325) * 13 + 17854) * 16, (pos.Y + 64000) * 7 - 142657, (pos.Z * 9 - 47000) * 6
	)
end
SILENT_HITBOX_NAMES = { "Head", "HeadHB", "UpperTorso", "LowerTorso", "Torso", "LeftUpperArm", "RightUpperArm", "Left Arm", "Right Arm", "LeftUpperLeg", "RightUpperLeg", "Left Leg", "Right Leg", "HumanoidRootPart" }
function getClosestHitboxPart(char)
	local aimPos = Vector2.new(val_741.X, val_741.Y); local best, bestDist = nil, math.huge
	for _, name in SILENT_HITBOX_NAMES do
		local part = char:FindFirstChild(name) or (char:FindFirstChild("Hitboxes") and char.Hitboxes:FindFirstChild(name))
		if part and part:IsA("BasePart") then
			local sp, onScreen = val_749:WorldToScreenPoint(part.Position)
			if onScreen then
				local d = (Vector2.new(sp.X, sp.Y) - aimPos).Magnitude
				if d < bestDist then
					bestDist = d; best = part
				end
			end
		end
	end
	return best
end
function getSilentTargetPart(char)
	if val_872.baim then
		return char.PrimaryPart or char:FindFirstChild("HumanoidRootPart")
	end
	if val_872.closestHitbox then
		local closest = getClosestHitboxPart(char)
		if closest then
			return closest
		end
	end
	local hitboxes = char:FindFirstChild("Hitboxes")
	return (hitboxes and hitboxes:FindFirstChild("HeadHB")) or char:FindFirstChild("HeadHB") or char:FindFirstChild("Head")
end
function buildSilentRay(targetPart)
	local targetPos = env.targetPosition or (targetPart.CFrame and targetPart.CFrame.p or targetPart.Position); local rayOrigin = val_749.CFrame.p
	if not library_flags["From Camera"] and val_733.Character and val_733.Character.PrimaryPart then
		rayOrigin = Vector3.new(
			val_733.Character.PrimaryPart.Position.X, val_733.Character.Head.Position.Y, val_733.Character.PrimaryPart.Position.Z
		)
	end
	local dist = (rayOrigin - targetPos).Magnitude; local predicted = targetPos + Vector3.new(0, dist / 500, 0)
	return Ray.new(rayOrigin, (predicted - rayOrigin).Unit * 500), rayOrigin, predicted
end
function applySilentHitParl(args)
	local tgt = env.target
	if not tgt or not tgt.Parent then return args end
	local hitPos = env.targetPosition or (tgt.CFrame and tgt.CFrame.p or tgt.Position); args[1] = tgt; args[2] = encodeHitPos(hitPos)
	if typeof(args[10]) == "Vector3" and typeof(args[12]) == "Vector3" then
		local dir = hitPos - args[10]
		if dir.Magnitude > 0.001 then
			args[12] = dir.Unit
		end
	end
	return args
end
function playAudio(var_182)
	if not game.ReplicatedStorage.Weapons:FindFirstChild(var_182) then
		return
	end 
	local val_374 = game.ReplicatedStorage.Weapons[var_182]; local val_375 = val_374.Model:FindFirstChild("PreSounds") or val_374.Model; local val_376 = "Shoot"
	if val_374.Name == "USP" or val_374.Name == "M4A1" then
		val_376 = "SShoot"
	end 
	if val_872.alive and val_375:FindFirstChild(val_376) then
		local val_377 = Instance.new('Sound', workspace); val_377.SoundId = val_375[val_376].Value; val_377.PlayOnRemove = true; val_377.Volume = 0.7; val_377:Destroy()
	end
end 
val_916 = { ["AK47"] = "rbxassetid://6061266272", ["AWP"] = "rbxassetid://6067278314", ["G3SG1"] = "rbxassetid://6067426225", ["DesertEagle"] = "rbxassetid://6067333190", ["Glock"] = "rbxassetid://6067337612", ["USP"] = "rbxassetid://6067338308", ["Scout"] = "rbxassetid://6067338138", ["P250"] = "rbxassetid://6067337798", ["M4A4"] = "rbxassetid://6067358591", ["M4A1"] = "rbxassetid://6067358774" }
val_920 = { ["USP"] = "SShoot", ["M4A1"] = "SShoot" }
function replaceAudio(var_184)
	if not val_916[var_184] then
		return
	end 
	local val_378 = "Shoot"
	if val_920[var_184] then
		val_378 = val_920[var_184]
	end 
	pcall(function()
		val_733.Character.Gun[val_378].Value = val_916[var_184]
	end)
end 
val_923 = 0; val_925 = false 
function CreateThread(var_175)
	local val_379 = coroutine.create(var_175); coroutine.resume(val_379)
	return val_379
end 
val_926 = false 
function tracers(var_220, var_99)
	if not val_926 and val_733.Character and val_733.Character:FindFirstChild("Gun") and var_99 then
		val_926 = true 
		CreateThread(function()
			wait(); val_926 = false
		end)
		local val_380 = Instance.new("Part"); local val_381 = Instance.new("Part"); local val_382 = Instance.new("Beam", val_380); local val_384 = Instance.new("Part"); local val_385 = Instance.new("Attachment"); local val_386 = Instance.new("Attachment")
		if library_flags["Tracer Mode"] == "Part" then
			local val_387 = var_99.Position - var_220; val_384.Material = "ForceField"; val_384.CFrame = CFrame.new(var_220 + val_387 / 2, var_220); val_384.Size = Vector3.new(0.125, 0.125, val_387.Magnitude); val_384.CanCollide = false; val_384.Transparency = 0; val_384.Anchored = true; val_384.Color = library_flags["tracerColor"]; val_384.Parent = workspace.Debris
		elseif library_flags["Tracer Mode"] == "Beam" then
			val_380.Size = Vector3.new(0.1, 0.1, 0.1); val_380.Transparency = 1; val_380.Parent = workspace; val_380.Position = var_220; val_380.CanCollide = false; val_380.Anchored = true; val_385.Parent = val_380; val_381.Size = Vector3.new(0.1, 0.1, 0.1); val_381.Transparency = 1; val_381.Parent = workspace; val_381.Position = var_99.Position; val_381.CanCollide = false; val_381.Anchored = true; val_386.Parent = val_381; val_382.Color = ColorSequence.new(library_flags["tracerColor"]); val_382.LightEmission = 1; val_382.LightInfluence = 0; val_382.Transparency = NumberSequence.new{ NumberSequenceKeypoint.new(0, 1 - UI_Library.options["tracerColor"].trans), NumberSequenceKeypoint.new(1, 1 - UI_Library.options["tracerColor"].trans) }; val_382.Width0 = 0.25; val_382.Width1 = 0.25; val_382.Attachment0 = val_385; val_382.Attachment1 = val_386; val_382.FaceCamera = library_flags["Beams Face Camera"]
			local texMap = { ["Solid"] = "rbxassetid://446111271", ["Lightning"] = "rbxassetid://7216850022", ["Laser"] = "rbxassetid://7136858729", ["Twisted Energy"] = "rbxassetid://7071778278", ["Anime Lazer"] = "rbxassetid://17441065350", ["Arrow"] = "rbxassetid://1274378728", ["Minecraft"] = "rbxassetid://152410036", ["Alien Energy Ray"] = "rbxassetid://6091341618", ["Energy Ray"] = "rbxassetid://13832105797", ["Matrix"] = "rbxassetid://15097610754", ["Cartoony Eletric"] = "rbxassetid://18722421816" }
			local texName = library_flags["Tracer Texture"] or library_flags["tracerTexture"] or "Solid"; val_382.Texture = texMap[texName] or texMap["Solid"]; val_382.Parent = val_380
		end 
		CreateThread(function()
			wait(0.3)
			for var_24 = 1, 100, 4 do
				wait()
				if var_24 / 100 > 1 - UI_Library.options["tracerColor"].trans then
					val_384.Transparency = var_24 / 100; val_382.Transparency = NumberSequence.new{ NumberSequenceKeypoint.new(0, var_24 / 100), NumberSequenceKeypoint.new(1, var_24 / 100) }
				end
			end 
			val_384:Destroy(); val_380:Destroy(); val_381:Destroy()
		end)
	end
end 
env.tracers = tracers 
function fireHitpart(var_109, var_248, var_63, var_135, var_213)
	if workspace.CurrentCamera:FindFirstChild("Arms") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("EquippedTool") and game.Players.LocalPlayer.Character:FindFirstChild("Gun") then
		local val_389 = game.Players.LocalPlayer.Character.EquippedTool.Value; local val_390 = game.Players.LocalPlayer.Character.Gun; local val_391 = workspace.CurrentCamera.Arms:FindFirstChild("Guy"); local val_392 = workspace.CurrentCamera.Arms:FindFirstChild("fire")
		if val_391 and val_392 then
			pcall(function()
				val_391:LoadAnimation(val_392):Play()
			end)
			val_776:FireServer(var_109, var_213 or encodePos(var_109.Position), val_389, 4096, val_390, nil, var_248, false, var_248 < 1, workspace.CurrentCamera.CFrame.p, game.Workspace.DistributedTime.Value, Vector3.zAxis, false, false, false, false, true)
			if not var_135 then
				playAudio(val_389)
			end
		end
	end
end 
function countESP()
	local val_393 = 0 
	for var_55, var_106 in val_868 do
		if var_106.type == "plr" then
			val_393 = val_393 + 1
		end
	end 
	return val_393
end 
val_927 = 0; GetIcon = require(game.ReplicatedStorage.GetIcon); espIconsGui = Instance.new("ScreenGui")
pcall(function() if syn and syn.protect_gui then syn.protect_gui(espIconsGui) end end)
espIconsGui.Name = "espIconsGui"; espIconsGui.Parent = game.CoreGui
function createEsp(var_140, var_271)
	local val_394 = Drawing.new("Text"); local val_395 = Drawing.new("Text"); local val_396 = Drawing.new("Line"); local val_397 = Drawing.new("Square"); local val_398 = Drawing.new("Square"); local L_1164_fill = Drawing.new("Square"); local val_399 = Drawing.new("Square"); local val_400 = Drawing.new("Square"); local var_231 = Drawing.new("Square"); local var_62 = Drawing.new("Square"); var_231.Color = Color3.new(0, 0, 0); var_231.Thickness = 2; var_231.Transparency = 1; var_231.Visible = false; var_62.Color = Color3.fromRGB(0, 100, 255); var_62.Thickness = 1; var_62.Transparency = 1; var_62.Visible = false; local val_401 = "Object" .. tostring(val_927); local val_402; local iconLabel = Instance.new("ImageLabel"); iconLabel.BackgroundTransparency = 1; iconLabel.Size = UDim2.new(0, 62, 0, 25); iconLabel.Visible = false; iconLabel.ScaleType = Enum.ScaleType.Fit; iconLabel.AnchorPoint = Vector2.new(0.5, 0.5); iconLabel.Parent = espIconsGui
	if var_140 == "plr" then
		val_402 = Instance.new("Folder", val_806); val_401 = var_271.Name; val_402.Name = val_401; val_399.Color = Color3.new(0, 0, 0); val_399.Thickness = 2; val_399.Transparency = 1; val_399.Visible = false; val_400.Color = Color3.new(0, 1, 0); val_400.Thickness = 1; val_400.Transparency = 1; val_400.Visible = false
	else
		val_927 = val_927 + 1
	end 
	val_397.Color = Color3.new(0, 0, 0); val_397.Thickness = 3; val_397.Transparency = 1; val_397.Filled = false; val_397.Visible = false; val_398.Color = Color3.new(1, 1, 1); val_398.Thickness = 1; val_398.Transparency = 1; val_398.Filled = false; val_398.Visible = false; L_1164_fill.Color = Color3.new(1, 1, 1); L_1164_fill.Thickness = 1; L_1164_fill.Transparency = 0.5; L_1164_fill.Filled = true; L_1164_fill.Visible = false; val_396.From = Vector2.new(val_749.ViewportSize.X / 2, val_749.ViewportSize.Y * 0.9); val_396.Color = Color3.new(1, 1, 1); val_396.Thickness = 1; val_396.Transparency = 1; val_396.Visible = false; val_394.Text = var_271.Name; val_394.Size = 13; val_394.Center = true; val_394.OutlineColor = Color3.new(0, 0, 0); val_394.Color = Color3.new(1, 1, 1); val_394.Visible = false; val_395.Text = "Gun"; val_395.Size = 13; val_395.Center = true; val_395.OutlineColor = Color3.new(0, 0, 0); val_395.Color = Color3.new(1, 1, 1); val_395.Visible = false; local L_flags_ = Drawing.new("Text"); L_flags_.Text = ""; L_flags_.Size = 12; L_flags_.Center = false; L_flags_.OutlineColor = Color3.new(0, 0, 0); L_flags_.Outline = true; L_flags_.Color = Color3.fromRGB(255, 255, 255); L_flags_.Visible = false; local skeleton = {}
	local function skelLine(idx)
		local ln = skeleton[idx]
		if not ln then
			ln = Drawing.new("Line"); ln.Thickness = 1; ln.Transparency = 1; ln.Visible = false; skeleton[idx] = ln
		end
		return ln
	end
	local HEALTH_SEGMENTS = 16; local healthSegs = {}
	for i = 1, HEALTH_SEGMENTS do
		local seg = Drawing.new("Square"); seg.Filled = true; seg.Thickness = 1; seg.Transparency = 1; seg.Visible = false; healthSegs[i] = seg
	end
	local healthNum = Drawing.new("Text"); healthNum.Text = ""; healthNum.Size = 13; healthNum.Center = true; healthNum.Outline = true; healthNum.OutlineColor = Color3.new(0, 0, 0); healthNum.Color = Color3.new(1, 1, 1); healthNum.Visible = false
	function invis()
		if var_223 and var_223._isInvis then return end
		val_398.Visible = false; L_1164_fill.Visible = false; val_396.Visible = false; val_394.Visible = false; val_400.Visible = false; val_397.Visible = false; val_399.Visible = false; val_395.Visible = false; var_231.Visible = false; var_62.Visible = false 
		if L_flags_ then L_flags_.Visible = false end
		if iconLabel then iconLabel.Visible = false end
		for var_244, var_250 in skeleton do
			var_250.Visible = false
		end
		for _, seg in healthSegs do seg.Visible = false end
		healthNum.Visible = false
		if var_223 then var_223._isInvis = true end
	end 
function remove()
		L_1164_fill:Remove(); val_396:Remove(); val_394:Remove(); val_400:Remove(); val_397:Remove(); val_399:Remove(); var_231:Remove(); var_62:Remove()
		if L_flags_ then L_flags_:Remove() end
		if iconLabel then iconLabel:Destroy() end
		for var_114, var_204 in skeleton do
			var_204:Remove()
		end
		for _, seg in healthSegs do seg:Remove() end
		if healthNum then healthNum:Remove() end
	end 
	local val_403 = {
		text = val_394, weapon = val_395, flags = L_flags_, tracer = val_396, box = val_398, boxfill = L_1164_fill, boxoutline = val_397, healthb = val_400, healthbo = val_399, armorb = var_62, armorbo = var_231, skeleton = skeleton, skelLine = skelLine, skelCount = 0, healthSegs = healthSegs, healthSegCount = HEALTH_SEGMENTS, healthNum = healthNum, hpSmooth = 0, invis = invis, remove = remove, type = var_140, object = var_271, icon = iconLabel
	}
	val_868[val_401] = val_403 
	return val_403
end 
val_929 = {}
function ApplyValue(var_156, var_96, var_237, var_29)
	if var_156 then
		for var_93, var_34 in game.ReplicatedStorage.Weapons:GetDescendants() do
			if var_34.Name == var_96 then
				var_237[var_34] = { value = var_34.Value }; var_34.Value = var_29 
				for var_135, var_232 in var_34:GetChildren() do
					var_237[var_232] = { value = var_232.Value }; var_232.Value = var_29
				end
			end
		end
	else
		for var_84, var_92 in game.ReplicatedStorage.Weapons:GetDescendants() do
			if var_92.Name == var_96 and var_237[var_92] then
				var_92.Value = var_237[var_92].value 
				for var_229, var_80 in var_92:GetChildren() do
					var_80.Value = var_237[var_80].value
				end
			end
		end
	end
end 
val_792.Name = "bt"
val_931 = false 
function selfChams()
	if library_flags["Self Chams"] and val_733.Character then
		local mat = chamsMaterial(library_flags["selfChamsMaterial"])
		for _, part in val_733.Character:GetDescendants() do
			if part.Name == "HumanoidRootPart" or part.Name == "Head" or part.Name == "HeadHB" or part.Name == "Gun" or (string.find(part.Name, "C4") and part.Name ~= "BackC4") then
				continue
			end
			if part:IsA("BasePart") then
				part.Color = library_flags["selfChamsColor"]; part.Transparency = 1 - UI_Library.options["selfChamsColor"].trans; part.Material = mat
				if hasProperty(part, "Reflectance") then part.Reflectance = 0 end
			end
			if part:IsA("SpecialMesh") then
				local c = library_flags["selfChamsColor"]; part.VertexColor = Vector3.new(c.R, c.G, c.B); part.TextureId = library_flags["selfChamsMaterial"] == "Ghost" and GHOST_TEXTURE or ""
			end
			if part.Name == "Shirt" then
				part.ShirtTemplate = "rbxassetid://0"
			elseif part.Name == "Pants" then
				part.PantsTemplate = "rbxassetid://0"
			elseif part.Name == "Face" then
				part.Texture = "rbxassetid://0"
			end
			if hasProperty(part, "TextureID") then part.TextureID = val_899[mat] end
			if hasProperty(part, "TextureId") then part.TextureId = val_899[mat] end
		end
	end
end 
function updateSkybox()
	if val_699:FindFirstChild("SunRays") and not library_flags["sunraysEnabled"] then
		val_699.SunRays.Enabled = false
	end
	
	for _, child in val_699:GetChildren() do
		if child.Name == "customsky" then
			child:Destroy()
		end
	end
	
	local val_406 = library_flags["skyboxValue"]
	if library_flags["Skybox Changer"] and Skyboxes[val_406] then
		local val_407 = Instance.new("Sky", val_699); val_407.Name = "customsky"; val_407.SunTextureId = "rbxassetid://"; val_407.CelestialBodiesShown = "rbxassetid://"; val_931 = true 
		for var_147, var_143 in Skyboxes[val_406] do
			val_407[var_147] = var_143
		end
	elseif not library_flags["Skybox Changer"] and val_931 then
		local val_408 = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
		if val_408 and val_408.Name ~= "customsky" then
			val_931 = false; val_408.Parent = workspace; wait(); val_408.Parent = val_699
		end
	end
end 
val_933 = { "HumanoidRootPart", "FakeHead", "C4", "Gun" }; val_940 = false 
function hitChams(var_95, var_114, var_134, var_179)
	if var_95.Character and not val_940 then
		val_940 = true 
		CreateThread(function()
			wait(0.05); val_940 = false
		end)
		for var_236, var_241 in var_95.Character:GetChildren() do
			if var_241:IsA"MeshPart" and var_241.Transparency ~= 1 or var_241.Name == "Head" then
				if not val_933[var_241.Name] then
					local val_410 = var_241:Clone(); val_410:ClearAllChildren(); val_410.Material = var_114 and "SmoothPlastic" or "ForceField"; val_410.CFrame = var_241.CFrame; val_410.Size = var_241.Name == "Head" and Vector3.new(1.18, 1.18, 1.18) or val_410.Size; val_410.CanCollide = false; val_410.Color = var_114 or library_flags["hitchamsColor"]; val_410.Anchored = true; val_410.Transparency = var_134 or 0; val_410.Parent = workspace.Debris 
					if hasProperty(val_410, "TextureID") then
						val_410.TextureID = ""
					end 
					if hasProperty(val_410, "UsePartColor") then
						val_410.UsePartColor = true
					end 
					val_722:AddItem(val_410, var_179 or 1.5)
					if not var_114 then
						local val_411 = val_683:Create(val_410, TweenInfo.new(1.5), { Transparency = 1 }); val_411:Play()
					end
				end
			end
		end
	end
end 
env.hitChams = hitChams 
val_944 = {
	"Head", "UpperTorso", "LowerTorso", "LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"
}
chamsAdornments = {}; chamsRayParams = RaycastParams.new(); chamsRayParams.FilterType = Enum.RaycastFilterType.Exclude
function reverseChamsPlr(var_266)
	if var_266.Character then
		chamsAdornments[var_266.Character] = nil
		for _, oldH in var_266.Character:GetChildren() do
			if oldH:IsA("Highlight") and (oldH.Name == "DefaultChams" or oldH.Name == "WallChams" or oldH.Name == "VisibleChams") then
				oldH:Destroy()
			end
		end
		local h = var_266.Character:FindFirstChildOfClass("Highlight")
		if h then h:Destroy() end
		local g = var_266.Character:FindFirstChild("GlobalAssets")
		if g then
			for _, child in g:GetChildren() do
				if child:IsA("Decal") then child.Parent = var_266.Character:FindFirstChild("Head") or var_266.Character else child.Parent = var_266.Character end
			end
			g:Destroy()
		end
		for _, child in var_266.Character:GetDescendants() do
			if child:IsA("BasePart") then
				if child:GetAttribute("OrigMat") then
					pcall(function()
						local mat = child:GetAttribute("OrigMat")
						if type(mat) == "string" and mat:match("Enum%.Material%.") then
							mat = mat:gsub("Enum%.Material%.", "")
						end
						child.Material = Enum.Material[mat]; child.Color = child:GetAttribute("OrigColor")
					end)
					child:SetAttribute("OrigMat", nil); child:SetAttribute("OrigColor", nil)
				end
				local f = child:FindFirstChild("HiddenAssets")
				if f then
					for _, sa in f:GetChildren() do
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
CHAMS_BODYPARTS = { "Head", "UpperTorso", "LowerTorso", "LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }
function chamsPlr(var_266)
	if var_266.Character and teamCheck(var_266, val_772) and var_266.Character:FindFirstChild("HumanoidRootPart") then
		reverseChamsPlr(var_266)
		pcall(function()
			local char = var_266.Character; local style = library_flags["chamsStyle"] or "Fill"; local visColor = library_flags["chamsVisibleColor"] or library_flags["chamsColor"] or Color3.fromRGB(255, 255, 255); local wallColor = library_flags["chamsWallColor"] or library_flags["chamsColor2"] or Color3.fromRGB(255, 80, 80)
			local function optTrans(flag, default)
				local o = UI_Library.options[flag]
				if o and type(o.trans) == "number" then return 1 - o.trans end
				return default
			end
			local visTrans = optTrans("chamsVisibleColor", 0.25); local wallTrans = optTrans("chamsWallColor", 0.25); local visibleOnly = library_flags["Visible Only ESP"]; local materialStyles = { Neon = "Neon", ForceField = "ForceField", Glass = "Glass", Plastic = "SmoothPlastic" }; local isMaterial = materialStyles[style] ~= nil
			if isMaterial then
				local mat = materialStyles[style]
				for _, part in char:GetDescendants() do
					if part:IsA("Accoutrement") then part:Destroy() end
				end
				for _, part in char:GetDescendants() do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						if part:GetAttribute("OrigMat") == nil then
							part:SetAttribute("OrigMat", part.Material.Name); part:SetAttribute("OrigColor", part.Color)
						end
						part.Material = Enum.Material[mat]; part.Color = visibleOnly and visColor or wallColor
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
			local wallFill = fillT(wallTrans); local visFill = fillT(visTrans)
			for _, part in char:GetChildren() do
				if part:IsA("Accoutrement") then part:Destroy() end
			end
			for _, part in char:GetDescendants() do
				if part:IsA("BasePart") and table.find(CHAMS_BODYPARTS, part.Name) then
					if not (part:FindFirstChild("inner") or part:FindFirstChild("outer")) then
						local inner, outer
						if part.Name == "Head" then
							inner = Instance.new("CylinderHandleAdornment", part)
							outer = Instance.new("CylinderHandleAdornment", part)
							inner.CFrame = inner.CFrame * CFrame.Angles(math.rad(90), 0, 0); outer.CFrame = outer.CFrame * CFrame.Angles(math.rad(90), 0, 0); inner.Radius = 0.6; outer.Radius = 0.6; inner.Height = 1.2; outer.Height = 1.2
						else
							inner = Instance.new("BoxHandleAdornment", part)
							outer = Instance.new("BoxHandleAdornment", part)
							inner.Size = part.Size + Vector3.new(0.05, 0.05, 0.05); outer.Size = part.Size + Vector3.new(0.05, 0.05, 0.05)
						end
						inner.Name = "inner"; outer.Name = "outer"
							chamsAdornments[char] = chamsAdornments[char] or { inner = {}, outer = {} }
							table.insert(chamsAdornments[char].inner, inner); table.insert(chamsAdornments[char].outer, outer)
						inner.Adornee = part
						outer.Adornee = part
						inner.Color3 = wallColor; outer.Color3 = visColor; inner.Transparency = wallFill; outer.Transparency = visFill; inner.AlwaysOnTop = true; outer.AlwaysOnTop = true; inner.ZIndex = 5; outer.ZIndex = 6; inner.Visible = not visibleOnly; outer.Visible = false
					end
				end
			end
		end)
	end
end
 local val_948; local NoSpecLabel
do
	local val_946 = Instance.new("ScreenGui"); val_948 = Instance.new("Frame"); val_948.Name = "SpectatorList"; env.SpectatorList = val_948; local val_958 = Instance.new("TextLabel"); local val_962 = Instance.new("Frame"); local val_965 = Instance.new("UIListLayout"); val_946.Enabled = true; val_946.Parent = val_733.PlayerGui; val_948.Visible = false; val_948.Parent = val_946; val_948.BackgroundColor3 = Color3.fromRGB(0, 0, 0); val_948.BackgroundTransparency = 0; val_948.BorderSizePixel = 0; val_948.Position = UDim2.new(0, 15, 0.45, 0); val_948.Size = UDim2.new(0, 200, 0, 50)
	val_948.ClipsDescendants = true
	local L_83_Corner = Instance.new("UICorner"); L_83_Corner.CornerRadius = UDim.new(0, 3); L_83_Corner.Parent = val_948; local L_83_Stroke = Instance.new("UIStroke"); L_83_Stroke.Thickness = 1; L_83_Stroke.Color = Color3.fromRGB(65, 65, 65); L_83_Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; L_83_Stroke.Parent = val_948; local L_83_Extras = Instance.new("Folder"); L_83_Extras.Name = "Extras"; L_83_Extras.Parent = val_948; local L_83_OuterOutline = Instance.new("Frame"); L_83_OuterOutline.Name = "Outline"; L_83_OuterOutline.Size = UDim2.new(1, 2, 1, 2); L_83_OuterOutline.Position = UDim2.new(0, -1, 0, -1); L_83_OuterOutline.BackgroundTransparency = 1; L_83_OuterOutline.ZIndex = val_948.ZIndex - 1; L_83_OuterOutline.Parent = L_83_Extras; local L_83_OuterCorner = Instance.new("UICorner"); L_83_OuterCorner.CornerRadius = UDim.new(0, 4); L_83_OuterCorner.Parent = L_83_OuterOutline; local L_83_OuterStroke = Instance.new("UIStroke"); L_83_OuterStroke.Thickness = 1; L_83_OuterStroke.Color = Color3.new(0, 0, 0); L_83_OuterStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; L_83_OuterStroke.Parent = L_83_OuterOutline; val_965.Parent = val_948; val_965.SortOrder = Enum.SortOrder.LayoutOrder; val_965.HorizontalAlignment = Enum.HorizontalAlignment.Left; val_965.Padding = UDim.new(0, 4); local SpecPadding = Instance.new("UIPadding"); SpecPadding.PaddingTop = UDim.new(0, 8); SpecPadding.PaddingBottom = UDim.new(0, 8); SpecPadding.PaddingLeft = UDim.new(0, 11); SpecPadding.PaddingRight = UDim.new(0, 11); SpecPadding.Parent = val_948; val_958.Parent = val_948; val_958.BackgroundTransparency = 1; val_958.BorderSizePixel = 0; val_958.Size = UDim2.new(1, 0, 0, 13); val_958.Font = Enum.Font.Code; val_958.Text = "spectators"; val_958.TextColor3 = Color3.new(1, 1, 1); val_958.TextSize = 13; val_958.TextXAlignment = Enum.TextXAlignment.Center; val_958.LayoutOrder = 1; NoSpecLabel = Instance.new("TextLabel"); NoSpecLabel.Name = "NoSpecLabel"; NoSpecLabel.BackgroundTransparency = 1; NoSpecLabel.Size = UDim2.new(1, 0, 0, 13); NoSpecLabel.Font = Enum.Font.Code; NoSpecLabel.Text = "no spectators"; NoSpecLabel.TextColor3 = Color3.fromRGB(150, 150, 150); NoSpecLabel.TextSize = 13; NoSpecLabel.TextXAlignment = Enum.TextXAlignment.Left; NoSpecLabel.LayoutOrder = 2; NoSpecLabel.Parent = val_948
	pcall(function() val_962:Destroy() end)
end
function addSpectator(name)
	NoSpecLabel.Visible = false; local container = Instance.new("Frame"); container.Name = "SpecLabel"; container.BackgroundTransparency = 1; container.Size = UDim2.new(1, 0, 0, 14); container.LayoutOrder = 3; container.Parent = val_948; local icon = Instance.new("ImageLabel"); icon.BackgroundTransparency = 1; icon.Size = UDim2.new(0, 14, 0, 14); icon.Position = UDim2.new(0, 0, 0.5, -7); icon.Image = ""; icon.Parent = container
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
	local lbl = Instance.new("TextLabel"); lbl.BackgroundTransparency = 1; lbl.Size = UDim2.new(1, -20, 1, 0); lbl.Position = UDim2.new(0, 20, 0, 0); lbl.Font = Enum.Font.Code; lbl.TextColor3 = Color3.fromRGB(200, 200, 200); lbl.Text = name; lbl.TextSize = 13; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = container; local specCount = 0
	for _, child in val_948:GetChildren() do
		if child.Name == "SpecLabel" then specCount = specCount + 1 end
	end
	val_948.Size = UDim2.new(0, 200, 0, 30 + 18 * specCount)
end 
function removeSpectators()
	for _, child in val_948:GetChildren() do
		if child.Name == "SpecLabel" then
			child:Destroy()
		end
	end
	NoSpecLabel.Visible = true; val_948.Size = UDim2.new(0, 200, 0, 50)
end 
val_969 = Instance.new("Frame"); val_969.Name = "KeybindsList"; env.KeybindsList = val_969; val_971 = Instance.new("TextLabel"); val_972 = Instance.new("Frame"); val_976 = Instance.new("UIListLayout"); val_969.Visible = false 
val_978 = {}; val_980 = {}; val_981 = {}; val_982 = { { "TKnife_Stock" }, { "CTKnife_Stock" } }; val_989 = { { "TGlove_Stock" }, { "CTGlove_Stock" } }; val_995 = {}
pcall(function()
	for var_255, var_151 in game.Players.LocalPlayer.PlayerGui.Client.Rarities:GetChildren() do
		table.insert(val_981, { var_151.Name })
	end
end)
env.unlockInventory = false; env.silentAimEnabled = false; env.lastKnife = ""; env.lastGlove = ""; env.lastGloveSkin = ""; env.predictionValue = Vector3.new()
env.applyLocalNameSpoof = function(text, lp)
	if type(text) ~= "string" or not lp then return text end
	local spoofEnabled = library_flags["spoofName"]
	local clanEnabled = library_flags["clanTagEnabled"]
	if not spoofEnabled and not clanEnabled then return text end
	local origName = lp.Name
	local origDisplay = lp.DisplayName
	local name = origName
	if spoofEnabled then
		local spoof = library_flags["spoofedNameValue"]
		if spoof and spoof ~= "" then
			name = spoof
		elseif not clanEnabled then
			return text
		end
	end
	local finalName = name
	if clanEnabled then
		local tag = library_flags["clanTagValue"] or "clarity.tk"
		if tag ~= "" then
			finalName = tag .. " " .. name
		end
	end
	if finalName == origName and (not origDisplay or finalName == origDisplay) then
		return text
	end
	if text:find(finalName, 1, true) then
		return text
	end
	local function replaceAll(s, from, to)
		if not from or from == "" then return s end
		local out, pos, hit = {}, 1, false
		while true do
			local a, b = s:find(from, pos, true)
			if not a then break end
			local before = a > 1 and s:sub(a - 1, a - 1) or ""
			local after = s:sub(b + 1, b + 1)
			if before:match("[%w_]") or after:match("[%w_]") then
				table.insert(out, s:sub(pos, b))
			else
				table.insert(out, s:sub(pos, a - 1)); table.insert(out, to); hit = true
			end
			pos = b + 1
		end
		if not hit then return s end
		table.insert(out, s:sub(pos))
		return table.concat(out)
	end
	text = replaceAll(text, origName, finalName)
	if origDisplay and origDisplay ~= origName then
		text = replaceAll(text, origDisplay, finalName)
	end
	if spoofEnabled then
		local spoof = library_flags["spoofedNameValue"]
		if spoof and spoof ~= "" and spoof ~= origName then
			text = replaceAll(text, spoof, finalName)
		end
	end
	return text
end
spawn(function()
	wait(3); local val_413 = game:GetService("Players"); local val_414 = val_413.LocalPlayer; local val_415 = game:GetService("ReplicatedStorage"); local val_416 = workspace.CurrentCamera; local val_417 = game:GetService("RunService"); local val_418 = game:GetService("Debris"); pingIntance = game.Stats.PerformanceStats.Ping; local val_419 = false; local val_420 = false; local val_421 = nil; local val_422 = {}; local val_423 = env.library.flags; local val_424 = env.hitChams; local val_425 = env.decodePos; local val_426 = env.encodePos; local val_427 = env.hitlog; local val_428 = env.tracers; local val_429 = env.predictionValue; local val_430 = 1; local val_431 = 0; local val_432 = 0; local val_433 = false; local val_434 = nil; local val_435 = false 
	val_417.RenderStepped:Connect(function(var_238)
		val_431 = var_238; val_432 = pingIntance:GetValue(); val_430 = env.damagemod; val_422 = env.oldPositions; val_429 = env.predictionValue; val_433 = env.holdE; val_434 = env.hookJP; val_435 = env.hookWS
	end)
	oldNewindex = hookmetamethod(game, "__newindex", function(var_13, var_144, var_36)
		if var_13.Name == "Crosshair" and var_144 == "Visible" and val_423["Force Crosshair"] then
			var_36 = true
		end 
		if not checkcaller() and var_144 == "JumpPower" and var_13:IsA("Humanoid") and val_434 ~= nil then
			var_36 = val_434
		end
        if not checkcaller() and (var_144 == "Text" or var_144 == "text") and (var_13:IsA("TextLabel") or var_13:IsA("TextBox")) then
            if (library_flags["spoofName"] or library_flags["clanTagEnabled"]) and type(var_36) == "string" then
                var_36 = env.applyLocalNameSpoof(var_36, val_414)
            end
        end
		return oldNewindex(var_13, var_144, var_36)
	end)
	oldNamecall = hookmetamethod(game, "__namecall", function(var_270, ...)
		local val_437 = { ... }; local val_438 = getnamecallmethod(); local val_439 = var_270.Name
		if val_438 == "ChangeState" and library_flags["Jumpbug"] and env.jbBindHeld and not checkcaller() and val_437[1] == Enum.HumanoidStateType.Landed and var_270:IsA("Humanoid") then
			local root = var_270.Parent and var_270.Parent:FindFirstChild("HumanoidRootPart")
			if root and root.AssemblyLinearVelocity.Y > 5 then return end
		end
		if val_439 == "Hallooooooooooooo" or val_439 == "Boogers" then
			if val_438 == "FireServer" or val_438 == "FireUnreliable" or val_438 == "InvokeServer" then
				return nil
			end
		end
		if val_439 == "ParticleRemote" then
			if type(val_437[1]) == "table" and val_437[1][1] == "kick" then
				return
			end
		end
		if val_438 == "FireServer" and val_439 == "ApplyGun" then
			if library_flags["Inf Ammo"] then
				local ammoTable
				for _, obj in getgc(true) do
					if typeof(obj) == "table" and rawget(obj, "ammocount") ~= nil and rawget(obj, "ammocount2") ~= nil and rawget(obj, "ammocount3") ~= nil and rawget(obj, "ammocount4") ~= nil then
						ammoTable = obj; break
					end
				end
				if ammoTable then
					ammoTable.ammocount = 9e99999; ammoTable.ammocount2 = 9e99999; ammoTable.ammocount3 = 9e99999; ammoTable.ammocount4 = 9e99999
				end
			end
		end
		if val_439 == "ApplyGun" and type(val_437[1]) == "table" and val_437[1].Name then
			if string.find(val_437[1].Name, "Banana") or string.find(val_437[1].Name, "Flip") then
				local _replacement2 = val_415.Weapons[val_414.Status.Team.Value .. " Knife"]
				return oldNamecall(var_270, _replacement2, select(2, ...))
			end
		end
		if val_438 == "GetService" and val_437[1] == "clarity.tk" then
			local val_440 = { HitEvent = onHit, KillEvent = onKill, Chat = chat, }
function val_440:GetTabs()
				local val_441 = { Legit = UI_Library.tabs[1], Visuals = UI_Library.tabs[2], Misc = UI_Library.tabs[3], Exploits = UI_Library.tabs[4], Scripts = UI_Library.tabs[5], Settings = UI_Library.tabs[100] }
				return val_441
			end 
			return val_440
		end 
		if val_438 == "Kick" and var_270 == val_414 then
			return
		end 
		if env.CB_SilentDebug and val_671:IsMouseButtonPressed(0) then
			if string.find(val_438, "FindPartOnRay") or val_438 == "Raycast" then
				warn("[clarity SilentDbg] " .. val_438 .. " @ " .. tostring(var_270))
			elseif val_438 == "FireServer" and (val_439 == "HitParl" or val_439 == "Whizz" or val_439 == "Trail" or val_439 == "ReplicateShot") then
				warn("[clarity SilentDbg] " .. val_439 .. " fired")
			end
		end
		local isSilentActive = env.silentAimEnabled and env.target
		if isSilentActive then
			if string.find(val_438, "FindPartOnRay") then
				local val_444, _, val_443 = buildSilentRay(env.target)
				if env.CB_SilentDebug then
					warn("[clarity Silent] redirect FindPartOnRay -> " .. env.target.Name)
				end
				CreateThread(function()
					val_421 = val_443; wait(0.3); val_421 = nil
				end)
				return oldNamecall(var_270, val_444, select(2, ...))
			end
			if val_438 == "Raycast" and var_270 == workspace then
				local origin, direction = val_437[1], val_437[2]
				if typeof(origin) == "Vector3" and typeof(direction) == "Vector3" then
					local _, rayOrigin, predicted = buildSilentRay(env.target); local mag = direction.Magnitude
					if mag < 0.001 then mag = 500 end
					if env.CB_SilentDebug then
						warn("[clarity Silent] redirect Raycast -> " .. env.target.Name)
					end
					return oldNamecall(var_270, rayOrigin, (predicted - rayOrigin).Unit * mag, select(3, ...))
				end
			end
		end 
		if val_438 == "FireServer" then
			if val_439 == "Updat1ePing" and val_423["Ping Spoof"] then
				return oldNamecall(var_270, math.random(100, 600) / 1000, select(2, ...))
			end 
			if val_439 == "RemoteEvent" and typeof(val_437[1]) == "table" then
				local block = val_437[1][1]
				if type(block) == "string" then
					local b = string.lower(block)
					if b == "kick" or b == "error" or b == "report" or b == "ban" or b == "detect" or b == "detected" or b == "flag" or b == "cheat" or b == "exploit" or b == "anticheat" or b == "ac" then
						return
					end
				end
			end
			if val_439 == "RemoteE65vent" and typeof(val_437[1]) == "table" and val_437[1][1] == "ki8ck" then
				return
			end 
			if val_439 == "FallDamage" and val_423["No Fall Damage"] then
				return
			end 
			if val_439 == "ohnoflames" and val_423["No Fire Damage"] then
				return
			end 
			if val_439 == "Trail" and val_423["Bullet Tracers"] then
				CreateThread(function()
					pcall(function()
						local startPos = val_437[1].Position
						local endPos = val_437[2]
						local color = val_423["tracerColor"] or Color3.fromRGB(150, 20, 60); local mode = val_423["Tracer Mode"] or "Beam"; local texture = "446111271"; local faceCamera = val_423["Beams Face Camera"] or false
						if mode == "Beam" then
							local att0 = Instance.new("Attachment"); local att1 = Instance.new("Attachment"); att0.WorldPosition = startPos
							att1.WorldPosition = endPos
							att0.Parent = workspace.Terrain; att1.Parent = workspace.Terrain; local beam = Instance.new("Beam"); beam.Attachment0 = att0; beam.Attachment1 = att1; beam.Width0 = 0.15; beam.Width1 = 0.15; beam.Color = ColorSequence.new(color); beam.FaceCamera = faceCamera
							if texture and texture ~= "" then
								beam.Texture = "rbxassetid://" .. texture
							end
							beam.Parent = workspace.Terrain; game:GetService("Debris"):AddItem(beam, 1); game:GetService("Debris"):AddItem(att0, 1); game:GetService("Debris"):AddItem(att1, 1)
						else
							local dist = (startPos - endPos).Magnitude
							local part = Instance.new("Part"); part.Anchored = true; part.CanCollide = false; part.Size = Vector3.new(0.1, 0.1, dist)
							part.CFrame = CFrame.lookAt(startPos, endPos) * CFrame.new(0, 0, -dist / 2)
							part.Color = color; part.Material = Enum.Material.Neon; part.Parent = workspace.CurrentCamera; game:GetService("Debris"):AddItem(part, 1)
						end
					end)
				end)
			end 
			if val_439 == "HitParl" and val_423["Hit Chams"] then
				CreateThread(function()
					pcall(function()
						local hitPart = val_437[1]; local targetChar = nil
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
							local color = val_423["hitchamsColor"] or Color3.fromRGB(200, 30, 80); local container = Instance.new("Model"); container.Name = "HitCham"; local parts = {}
							for _, v in targetChar:GetChildren() do
								if v:IsA("BasePart") and v.Transparency ~= 1 then
									local p = Instance.new("Part"); p.Size = v.Size; p.CFrame = v.CFrame; p.Color = color; p.Material = Enum.Material.ForceField; p.Transparency = 0.3; p.Anchored = true; p.CanCollide = false; p.Parent = container; parts[#parts + 1] = p
								end
							end
							container.Parent = workspace.CurrentCamera
							for _, p in parts do
								val_683:Create(p, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}):Play()
							end
							val_722:AddItem(container, 1.3)
						end
					end)
				end)
			end 
			if val_437[1] == val_414.UserId or string.find(tostring(val_437[1]), '{') then
				return
			end 
			if env.unlockInventory then
				if string.len(tostring(var_270)) == 38 then
					if not val_419 then
						val_419 = true 
						for var_172, var_10 in val_981 do
							local val_445 
							for var_35, var_187 in val_437[1] do
								if var_10[1] == var_187[1] then
									val_445 = true
								end
							end 
							if not val_445 then
								table.insert(val_437[1], var_10)
							end
						end
					end 
					return
				end 
				if val_439 == "DataEvent" and val_437[1][4] then
					local val_446 = string.split(val_437[1][4][1], "_")[2]; local val_448 = val_437[1][3]
					if val_437[1][2] == "Both" then
						val_414["SkinFolder"]["CTFolder"][val_448].Value = val_446; val_414["SkinFolder"]["TFolder"][val_448].Value = val_446
					else
						val_414["SkinFolder"][val_437[1][2] .. "Folder"][val_448].Value = val_446
					end 
					spawn(function()
						if val_437[1][4] and val_437[1][5] and val_437[1][5][2] then
							if val_437[1][3] == "Knife" then
								env.lastKnife = val_437[1][4][1]
							elseif val_437[1][3] == "Glove" then
								env.lastGlove = val_437[1][4][1]
							end
						end
					end)
				end
			end 
			if val_439 == "HitParl" then
				local args = table.pack(...); local hitPart = args[1]
				if env.silentAimEnabled and env.target then
					args = applySilentHitParl(args); hitPart = args[1]
					if env.CB_SilentDebug then
						warn("[clarity Silent] redirect HitParl -> " .. tostring(env.target.Name))
					end
				end
				if library_flags["KillAllAuto"] then
					args[2] = {X = 0/0, Y = 0/0, Z = 0/0}
				end
				if not hitPart or not hitPart.Parent then
					return oldNamecall(var_270, unpack(args, 1, args.n))
				end
				spawn(function()
					pcall(function()
						local hp = val_413:FindFirstChild(hitPart.Parent.Name)
						if hp then
							local hitPlayer = val_413[hitPart.Parent.Name]
							pcall(function() onHit:Fire(hitPlayer, hitPart) end)
							if library_flags["Hitsound"] and teamCheck(hitPlayer, false) then
								local snd = Instance.new('Sound', workspace); local sndKey = library_flags["hitsoundValue"]; local sndId = hitSounds[sndKey]
								if type(sndId) == "table" then
									sndId = sndId[math.random(1, #sndId)]
								end
								snd.SoundId = sndId or "rbxassetid://3124331820"; snd.PlayOnRemove = true; snd.Volume = library_flags["Hitsound Volume"] or 5; snd:Destroy()
							end
						end
					end)
				end)
				return oldNamecall(var_270, unpack(args, 1, args.n))
			end
		end 
		if val_438 == "LoadAnimation" then
			if val_423["Slide Walk"] and (val_437[1].Name == "RunAnim" or val_437[1].Name == "JumpAnim") then
				return wait(387420489)
			end
		end 
		if val_438 == "SetPrimaryPartCFrame" or val_438 == "PivotTo" or val_438 == "pivotTo" then
			if val_439 ~= val_414.Name and val_423["viewmodelEnabled"] then
				local val_459 = val_437[1]; val_459 = val_459 * CFrame.new(val_423["viewmodelX"] / 10, val_423["viewmodelY"] / 10, - val_423["viewmodelZ"] / 10) * CFrame.Angles(0, 0, math.rad(val_423["viewmodelRoll"]))
				if val_421 and val_423["Visualize Silent Angles"] then
					val_459 = CFrame.new(val_459.p, val_421)
				end 
				return oldNamecall(var_270, val_459, select(2, ...))
			end
		end 
		if val_439 == "Filter" and val_423["Uncensor Chat"] then
			return val_437[1]
		end 
		return oldNamecall(var_270, ...)
	end)
end)
val_1006 = UI_Library:AddTab"Legit"; val_1011 = val_1006:AddColumn(); val_1014 = val_1006:AddColumn(); val_280 = false; masterSec = val_1011:AddSection("master")
masterSec:AddToggle({
	text = "enable aimbot", flag = "aimbotEnabled"
}):AddBind({
	key = "MouseButton1", mode = "hold", flag = "assistBind",
	callback = function()
		if library_flags["aimbotEnabled"] and not UI_Library.open then
			val_280 = true 
			if val_872.alive then
				local val_451 = val_733.Character.Humanoid:GetState()
				if val_451 == Enum.HumanoidStateType.Freefall and library_flags["legitFilterAir"] then
					return
				end 
				if val_733.PlayerGui.Blnd.Blind.Transparency <= 0.6 then
					return
				end 
				local val_453, val_454 = getNearest(val_872.FOV or 0, val_767, library_flags["legitVisOnly"])
				if val_453 and val_454 > (val_872.deadzone or 0) * 2.3 then
					local val_455, val_456 = val_749:WorldToScreenPoint(val_872.baim and val_453.Character.PrimaryPart.Position or val_453.Character.Head.Position)
					if val_456 then
						local sm = val_872.smoothness or 1
						if sm < 1 then sm = 1 end
						local val_457, val_458 = - ((val_741.X - val_455.X) / sm), - ((val_741.Y - val_455.Y) / sm); mousemoverel(val_457, val_458)
					end
				end
			end
		end
	end
})
function setAimbotPage(page)
	if not allw2 or not allw2.main then return end
	allw2.main.Visible = page == "All (Shared)"; rifles2.main.Visible = page == "Rifles"; scout2.main.Visible = page == "Scout"; awp2.main.Visible = page == "AWP"; heavyp2.main.Visible = page == "Heavy Pistols"; pistols2.main.Visible = page == "Pistols"; smg.main.Visible = page == "SMG"; other2.main.Visible = page == "Other"
end
masterSec:AddList({
	text = "weapon", flag = "aimbotWeaponPage", values = { "All (Shared)", "Rifles", "Scout", "AWP", "Heavy Pistols", "Pistols", "SMG", "Other" }, value = "All (Shared)", max = 10,
	callback = setAimbotPage
})
checksSec = val_1011:AddSection("checks & filters"); checksSec:AddToggle({ text = "Visible Only", flag = "legitVisOnly" }); checksSec:AddToggle({ text = "Jump Check", flag = "Jump Check" }); checksSec:AddToggle({ text = "Flash Check", flag = "Flash Check" }); val_288 = false 
checksSec:AddBind({
	text = "Triggerbot Keybind", key = Enum.KeyCode.LeftAlt, mode = "hold",
	callback = function(L_1297_arg0)
		val_288 = not L_1297_arg0
	end
})
generalSec = val_1011:AddSection("other")
generalSec:AddToggle({
	text = "friendly fire",
	flag = "legitteam",
	callback = function(v)
		val_767 = v
	end
})
generalSec:AddToggle({ text = "Magnet Triggerbot" })
generalSec:AddToggle({
	text = "Auto Pistol",
	callback = function()
		for _, wep in val_662.Weapons:GetChildren() do
			if wep:FindFirstChild("Secondary") and wep.Name ~= "CZ" then
				wep.Auto.Value = library_flags["Auto Pistol"]
			end
		end
	end
})
allw2 = val_1014:AddSection"All (Shared)"; rifles2 = val_1014:AddSection"Rifles"; scout2 = val_1014:AddSection"Scout"; awp2 = val_1014:AddSection"AWP"; heavyp2 = val_1014:AddSection"Heavy Pistols"; pistols2 = val_1014:AddSection"Pistols"; smg = val_1014:AddSection"SMG"; other2 = val_1014:AddSection"Other"
allw2:AddToggle({ text = "Use For All Weapons", flag = "allwEnabled", tip = "uses these values for every weapon instead of the per-weapon configs" }); allw2:AddToggle({ text = "Triggerbot", flag = "allwTrigger" }); allw2:AddToggle({ text = "Body Aim", flag = "allwBaim" }); allw2:AddToggle({ text = "Silent Aim", flag = "allwSilentAim" }); allw2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "allwFOV" }); allw2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "allwSilentFOV" }); allw2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "allwDeadzone" }); allw2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "allwSmoothness" }); allw2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "allwTriggerDelay" }); allw2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "allwHitchance" }); allw2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "allwClosestHitbox" })
allw2:AddButton({ text = "Copy To All Weapons", callback = function()
	local fields = { "Trigger", "Baim", "SilentAim", "FOV", "SilentFOV", "Deadzone", "Smoothness", "TriggerDelay", "Hitchance", "ClosestHitbox" }
	for _, prefix in { "rifles", "scout", "awp", "heavyp", "pistol", "smg", "other" } do
		for _, field in fields do
			local opt = UI_Library.options[prefix .. field]; local value = library_flags["allw" .. field]
			if opt and value ~= nil then
				if opt.type == "toggle" then opt:SetState(value == true) else opt:SetValue(value) end
			end
		end
	end
end })
rifles2:AddToggle({ text = "Triggerbot", flag = "riflesTrigger" }); rifles2:AddToggle({ text = "Body Aim", flag = "riflesBaim" }); rifles2:AddToggle({ text = "Silent Aim", flag = "riflesSilentAim" }); rifles2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "riflesFOV" }); rifles2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "riflesSilentFOV" }); rifles2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "riflesDeadzone" }); rifles2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "riflesSmoothness" }); rifles2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "riflesTriggerDelay" }); rifles2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "riflesHitchance" }); rifles2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "riflesClosestHitbox" }); scout2:AddToggle({ text = "Triggerbot", flag = "scoutTrigger" }); scout2:AddToggle({ text = "Body Aim", flag = "scoutBaim" }); scout2:AddToggle({ text = "Silent Aim", flag = "scoutSilentAim" }); scout2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "scoutFOV" }); scout2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "scoutSilentFOV" }); scout2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "scoutDeadzone" }); scout2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "scoutSmoothness" }); scout2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "scoutTriggerDelay" }); scout2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "scoutHitchance" }); scout2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "scoutClosestHitbox" }); awp2:AddToggle({ text = "Triggerbot", flag = "awpTrigger" }); awp2:AddToggle({ text = "Body Aim", flag = "awpBaim" }); awp2:AddToggle({ text = "Silent Aim", flag = "awpSilentAim" }); awp2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "awpFOV" }); awp2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "awpSilentFOV" }); awp2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "awpDeadzone" }); awp2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "awpSmoothness" }); awp2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "awpTriggerDelay" }); awp2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "awpHitchance" }); awp2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "awpClosestHitbox" }); heavyp2:AddToggle({ text = "Triggerbot", flag = "heavypTrigger" }); heavyp2:AddToggle({ text = "Body Aim", flag = "heavypBaim" }); heavyp2:AddToggle({ text = "Silent Aim", flag = "heavypSilentAim" }); heavyp2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "heavypFOV" }); heavyp2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "heavypSilentFOV" }); heavyp2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "heavypDeadzone" }); heavyp2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "heavypSmoothness" }); heavyp2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "heavypTriggerDelay" }); heavyp2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "heavypHitchance" }); heavyp2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "heavypClosestHitbox" }); pistols2:AddToggle({ text = "Triggerbot", flag = "pistolTrigger" }); pistols2:AddToggle({ text = "Body Aim", flag = "pistolBaim" }); pistols2:AddToggle({ text = "Silent Aim", flag = "pistolSilentAim" }); pistols2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "pistolFOV" }); pistols2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "pistolSilentFOV" }); pistols2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "pistolDeadzone" }); pistols2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "pistolSmoothness" }); pistols2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "pistolTriggerDelay" }); pistols2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "pistolHitchance" }); pistols2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "pistolClosestHitbox" }); smg:AddToggle({ text = "Triggerbot", flag = "smgTrigger" }); smg:AddToggle({ text = "Body Aim", flag = "smgBaim" }); smg:AddToggle({ text = "Silent Aim", flag = "smgSilentAim" }); smg:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "smgFOV" }); smg:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "smgSilentFOV" }); smg:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "smgDeadzone" }); smg:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "smgSmoothness" }); smg:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "smgTriggerDelay" }); smg:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "smgHitchance" }); smg:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "smgClosestHitbox" }); other2:AddToggle({ text = "Triggerbot", flag = "otherTrigger" }); other2:AddToggle({ text = "Body Aim", flag = "otherBaim" }); other2:AddToggle({ text = "Silent Aim", flag = "otherSilentAim" }); other2:AddSlider({ text = "Aim Assist FOV", min = 1, max = 180, flag = "otherFOV" }); other2:AddSlider({ text = "Silent Aim FOV", min = 1, max = 180, flag = "otherSilentFOV" }); other2:AddSlider({ text = "Deadzone", min = 0, max = 20, flag = "otherDeadzone" }); other2:AddSlider({ text = "Smoothness", min = 1, max = 50, flag = "otherSmoothness" }); other2:AddSlider({ text = "Triggerbot Delay", min = 0, max = 100, flag = "otherTriggerDelay" }); other2:AddSlider({ text = "Silent Aim Hitchance", min = 0, max = 100, value = 100, flag = "otherHitchance" }); other2:AddToggle({ text = "Silent Aim Closest Hitbox", flag = "otherClosestHitbox" })
visualsTab = UI_Library:AddTab"Visuals"; visualsEntities = visualsTab:AddSubTab("Entities"); visualsGame = visualsTab:AddSubTab("Game"); visualsScreen = visualsTab:AddSubTab("Screen"); visualsColumn = visualsEntities:AddColumn(); visualsColumn2 = visualsEntities:AddColumn(); visualsMaster = visualsColumn:AddSection"Master"; visualsMaster:AddToggle({ text = "Enabled", flag = "espEnabled" })
visualsMaster:AddToggle({
	text = "Teammates", flag = "visualsteam",
	callback = function(var_73)
		val_772 = var_73 
		if cbCHAMS then cbCHAMS() end
	end
})
visualsMaster:AddToggle({
	text = "Visible Only", flag = "Visible Only ESP",
	callback = function() if cbCHAMS then cbCHAMS() end end
})
visualsChams = visualsColumn:AddSection"Chams"
env.__chamsRefresh = function()
	if library_flags["espEnabled"] and library_flags["Chams"] then
		for _, plr in val_711:GetPlayers() do
			if plr.Character then chamsPlr(plr) end
		end
	else
		for _, plr in val_711:GetPlayers() do
			if plr.Character then reverseChamsPlr(plr) end
		end
	end
end
game:GetService("RunService").RenderStepped:Connect(function()
	if not (library_flags["espEnabled"] and library_flags["Chams"]) then return end
	local visibleOnly = library_flags["Visible Only ESP"]; local cam = workspace.CurrentCamera
	if not cam then return end
	local camPos = cam.CFrame.Position; local params = chamsRayParams
	for _, plr in val_711:GetPlayers() do
		local char = plr ~= val_733 and plr.Character
		local cached = char and chamsAdornments[char]
		if cached then
			local hum = char:FindFirstChild("Humanoid")
			if hum and hum.Health <= 0 then
				reverseChamsPlr(plr); continue
			end
			local hrp = char:FindFirstChild("HumanoidRootPart"); local head = char:FindFirstChild("Head")
			params.FilterDescendantsInstances = { val_733.Character, char, cam }
			local seen = false
			if hrp then
				local hit = workspace:Raycast(camPos, hrp.Position - camPos, params)
				if hit == nil or hit.Instance:IsDescendantOf(char) then seen = true end
			end
			if not seen and head then
				local hit = workspace:Raycast(camPos, head.Position - camPos, params)
				if hit == nil or hit.Instance:IsDescendantOf(char) then seen = true end
			end
			local wallVisible = (not seen) and (not visibleOnly)
			for _, adorn in cached.inner do
				if adorn.Parent then adorn.Visible = wallVisible end
			end
			for _, adorn in cached.outer do
				if adorn.Parent then adorn.Visible = seen end
			end
		end
	end
end)
visualsChams:AddToggle({ text = "Chams", flag = "Chams", callback = env.__chamsRefresh }):AddColor({ color = Color3.fromRGB(255, 255, 255), flag = "chamsVisibleColor", trans = 0.6, callback = env.__chamsRefresh, calltrans = env.__chamsRefresh })
UI_Library.options["Chams"]:AddColor({ color = Color3.fromRGB(255, 80, 80), flag = "chamsWallColor", trans = 0.6, callback = env.__chamsRefresh, calltrans = env.__chamsRefresh })
UI_Library.options["Chams"]:AddList({ text = "Chams Style", flag = "chamsStyle", values = { "Fill", "Outline Only", "Glow", "Flat", "Neon", "ForceField", "Glass", "Plastic" }, value = "Fill", callback = env.__chamsRefresh })
visualsChams:AddToggle({ text = "Chams Outline", flag = "Chams Outline", callback = env.__chamsRefresh }):AddColor({ color = Color3.fromRGB(255, 255, 255), flag = "chamsVisibleOutlineColor", trans = 1, callback = env.__chamsRefresh, calltrans = env.__chamsRefresh })
UI_Library.options["Chams Outline"]:AddColor({ color = Color3.fromRGB(255, 80, 80), flag = "chamsWallOutlineColor", trans = 1, callback = env.__chamsRefresh, calltrans = env.__chamsRefresh }); cbCHAMS = env.__chamsRefresh; UI_Library.options["espEnabled"].callback = cbCHAMS; visualsChams:AddToggle({ text = "Hit Chams", flag = "Hit Chams" }):AddColor({ color = Color3.fromRGB(200, 30, 80), flag = "hitchamsColor" }); visualsGlow = visualsColumn:AddSection"Glow"; visualsGlow:AddToggle({ text = "Outline" }); visualsGameCol2 = visualsGame:AddColumn(); visualsMisc = visualsGameCol2:AddSection"Bullet Tracers"; visualsMisc:AddToggle({ text = "Beams Face Camera" }); visualsMisc:AddToggle({ text = "Bullet Tracers" }):AddColor({ color = Color3.fromRGB(150, 20, 60), trans = 1, flag = "tracerColor" }); visualsMisc:AddList({ text = "Tracer Mode", values = { "Part", "Beam" }, value = "Beam" }); visualsMisc:AddList({ text = "Tracer Texture", flag = "tracerTexture", values = { "Solid", "Lightning", "Laser", "Twisted Energy", "Anime Lazer", "Arrow", "Minecraft", "Alien Energy Ray", "Energy Ray", "Matrix", "Cartoony Eletric" }, value = "Solid" }); miscColorsSection = visualsGameCol2:AddSection"Misc Colors"; miscColorsSection:AddToggle({ text = "Molotov Color Changer", flag = "molotovColorChanger" }):AddColor({ color = Color3.fromRGB(0, 200, 255), flag = "molotovColor" }); miscColorsSection:AddToggle({ text = "Smoke Color Changer", flag = "smokeColorChanger" }):AddColor({ color = Color3.fromRGB(0, 255, 100), flag = "smokeColor" }); miscColorsSection:AddToggle({ text = "Blood Color Changer", flag = "bloodColorChanger" }):AddColor({ color = Color3.fromRGB(255, 0, 0), flag = "bloodColor" })
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
				local debris = workspace:FindFirstChild("Debris"); local rayIgnore = workspace:FindFirstChild("Ray_Ignore")
				local function scanContainer(container)
					if not container then return end
					for _, desc in container:GetDescendants() do
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
				scanContainer(debris); scanContainer(rayIgnore)
			end)
		end
	end)
end
visualsESP = visualsColumn2:AddSection"ESP"; visualsESP:AddToggle({ text = "Box ESP" }):AddColor({ color = Color3.fromRGB(255, 255, 255), flag = "boxESPcolor" }); visualsESP:AddToggle({ text = "Box Fill", flag = "Box Fill" }):AddColor({ color = Color3.fromRGB(255, 255, 255), trans = 0.5, flag = "boxFillColor" }); visualsESP:AddToggle({ text = "Skeleton ESP" }):AddColor({ color = Color3.fromRGB(255, 255, 255), flag = "skeletonColor" }); visualsESP:AddToggle({ text = "Name ESP" }):AddColor({ color = Color3.fromRGB(255, 255, 255), flag = "nameESPcolor" }); visualsESP:AddToggle({ text = "Weapon ESP" }):AddColor({ color = Color3.fromRGB(255, 255, 255), flag = "weaponESPcolor" }); visualsESP:AddToggle({ text = "Flags ESP", flag = "Flags ESP", tip = "shows readable enemy states on the right side of the player" }):AddColor({ color = Color3.fromRGB(255, 255, 255), flag = "flagsESPcolor" })
UI_Library.options["Flags ESP"]:AddList({
	text = "Flags", flag = "flagsList", multiselect = true, max = 11, value = { ["Armored"] = true, ["Unarmored"] = true, ["Helmet"] = true, ["Defuser"] = true, ["Bomb"] = true, ["Scoped"] = true, ["Planting"] = true, ["Slowed"] = true }, values = { "Armored", "Unarmored", "Helmet", "Defuser", "Bomb", "Weapon", "Money", "Spent", "Scoped", "Planting", "Slowed" }
})
visualsESP:AddToggle({ text = "Armor ESP", flag = "Armor ESP" }); visualsESP:AddToggle({ text = "Health Bar" }):AddColor({ color = Color3.fromRGB(0, 255, 0), flag = "healthBar" }); visualsESP:AddToggle({ text = "Gradient Health Bar", flag = "Gradient Health Bar", tip = "fades the health bar from full color to low-health color" }):AddColor({ color = Color3.fromRGB(255, 0, 0), flag = "healthBarLow" })
visualsESP:AddToggle({ text = "Health Number", flag = "Health Number", tip = "shows numeric HP next to the health bar" }):AddColor({ color = Color3.fromRGB(0, 255, 0), flag = "healthNumberColor" }); visualsESP:AddToggle({ text = "Armor Bar" }):AddColor({ color = Color3.fromRGB(0, 100, 255), flag = "armorBarColor" }); visualsESP:AddToggle({ text = "Tracers" }):AddColor({ color = Color3.fromRGB(0, 0, 0), flag = "tracersColor" }); visualsESP:AddList({ text = "Font", values = { "UI", "System", "Plex", "Monospace" } }); visualsESP:AddList({ text = "Text Mode", values = { "Normal", "Upper", "Lower" } }); visualsLocal = visualsColumn2:AddSection"Local"
removeUIElementsCallback = function(var_31)
		local TARGET_GUIS = { "Game", "GUI", "HUDShading", "CBScoreboard", "SmokeGUI", "Performance", "Objective", "Crates", "NewItem", "BanBoi", "Blnd", "Winner", "RoundWin", "WinGui", "RoundEnd", "Win" }
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
			env.HUD_Connections = nil; env.HUD_OriginalState = nil
		end
local function hideObject(instance)
			if not instance or (not instance:IsA("GuiObject") and not instance:IsA("UIStroke")) then return end
			if instance:IsA("ScreenGui") then return end
			local whitelist = {"BuyMenu", "Crosshair", "Crosshairs", "SuitZoom", "Scope", "Cursor", "Reticle"}
			for _, name in whitelist do
				if instance.Name == name or instance:FindFirstAncestor(name) then return end
			end
			local cache = env.HUD_OriginalState or {}; env.HUD_OriginalState = cache
			if not cache[instance] then
				local state = { Visible = instance:IsA("GuiObject") and instance.Visible or nil, BackgroundTransparency = instance:IsA("GuiObject") and instance.BackgroundTransparency or nil, BorderSizePixel = instance:IsA("GuiObject") and instance.BorderSizePixel or nil, }
				if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
					state.ImageTransparency = instance.ImageTransparency
				elseif instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
					state.TextTransparency = instance.TextTransparency
				elseif instance:IsA("UIStroke") then
					state.Transparency = instance.Transparency; state.Enabled = instance.Enabled
				end
				cache[instance] = state
			end
			local propConns = {}
local function applyHidden()
				if instance:IsA("GuiObject") then
					instance.Visible = false; instance.BackgroundTransparency = 1; instance.BorderSizePixel = 0
					if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
						instance.ImageTransparency = 1
					elseif instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
						instance.TextTransparency = 1
					end
				elseif instance:IsA("UIStroke") then
					instance.Enabled = false; instance.Transparency = 1
				end
			end
			applyHidden()
			if instance:IsA("GuiObject") then
				table.insert(propConns, instance:GetPropertyChangedSignal("Visible"):Connect(applyHidden)); table.insert(propConns, instance:GetPropertyChangedSignal("BackgroundTransparency"):Connect(applyHidden))
				if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
					table.insert(propConns, instance:GetPropertyChangedSignal("ImageTransparency"):Connect(applyHidden))
				elseif instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
					table.insert(propConns, instance:GetPropertyChangedSignal("TextTransparency"):Connect(applyHidden))
				end
			elseif instance:IsA("UIStroke") then
				table.insert(propConns, instance:GetPropertyChangedSignal("Enabled"):Connect(applyHidden)); table.insert(propConns, instance:GetPropertyChangedSignal("Transparency"):Connect(applyHidden))
			end
			local conns = env.HUD_Connections or {}; env.HUD_Connections = conns; conns[instance] = {PropConns = propConns}
		end
local function recursiveHide(parent)
			hideObject(parent)
			for _, child in parent:GetChildren() do
				if child.Name == "BuyMenu" then continue end
				recursiveHide(child)
			end
		end
		if var_31 then
			clearOriginalState(); env.HUD_OriginalState = {}; env.HUD_Connections = {}
local function processGui(gui)
				recursiveHide(gui)
				local conn = gui.DescendantAdded:Connect(function(child)
					hideObject(child)
				end)
				env.HUD_Connections[gui] = env.HUD_Connections[gui] or {}; env.HUD_Connections[gui].Connection = conn
			end
			for _, name in TARGET_GUIS do
				local g = val_733.PlayerGui:FindFirstChild(name)
				if g and g:IsA("ScreenGui") then
					processGui(g)
				end
			end
			local mainConn = val_733.PlayerGui.ChildAdded:Connect(function(child)
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
							inst.Visible = state.Visible; inst.BackgroundTransparency = state.BackgroundTransparency; inst.BorderSizePixel = state.BorderSizePixel
							if state.ImageTransparency then inst.ImageTransparency = state.ImageTransparency end
							if state.TextTransparency then inst.TextTransparency = state.TextTransparency end
						elseif inst:IsA("UIStroke") then
							inst.Enabled = state.Enabled; inst.Transparency = state.Transparency
						end
					end
				end
			end
			clearOriginalState()
		end
	end
removeFlashCallback = function(var_44)
	pcall(function()
		val_733.PlayerGui.Blnd.Blind.Visible = not var_44
	end)
end
val_383 = Drawing.new("Circle"); val_388 = Drawing.new("Circle"); val_383.Color = Color3.new(1, 1, 1); val_383.Thickness = 0.05; val_383.NumSides = 100; val_383.Radius = 100; val_383.Visible = false; val_383.Filled = false; val_388.Color = Color3.new(1, 1, 1); val_388.Thickness = 0.05; val_388.NumSides = 100; val_388.Radius = 100; val_388.Visible = false; val_388.Filled = false; visualsGlow:AddToggle({ text = "Self Chams", callback = selfChams }):AddColor({ flag = "selfChamsColor", trans = 1, color = Color3.new(1, 1, 1), callback = selfChams, calltrans = selfChams }); UI_Library.options["Self Chams"]:AddList({ flag = "selfChamsMaterial", callback = selfChams, values = CHAMS_MATERIALS, value = "ForceField", max = 12 })
visualsGlow:AddToggle({ text = "Weapon Chams", callback = updateViewModelVisuals }):AddColor({ flag = "weaponColor", trans = 1, color = Color3.new(1, 1, 1), callback = updateViewModelVisuals, calltrans = updateViewModelVisuals })
UI_Library.options["Weapon Chams"]:AddList({ flag = "weaponMaterial", values = CHAMS_MATERIALS, value = "ForceField", max = 12, callback = updateViewModelVisuals })
visualsGlow:AddToggle({ text = "Arm Chams", callback = updateViewModelVisuals }):AddColor({ flag = "armColor", trans = 1, color = Color3.new(1, 1, 1), callback = updateViewModelVisuals, calltrans = updateViewModelVisuals })
UI_Library.options["Arm Chams"]:AddList({ flag = "armMaterial", values = CHAMS_MATERIALS, value = "ForceField", max = 12, callback = updateViewModelVisuals }); visualsGlow:AddSlider({ text = "Weapon Reflectance", flag = "weaponReflectance", max = 100, callback = updateViewModelVisuals })
visualsLocal:AddToggle({ text = "Custom Arm Color", flag = "customArmColor", callback = updateViewModelVisuals }):AddColor({ color = Color3.fromRGB(255, 255, 255), flag = "customArmColorValue", callback = updateViewModelVisuals })
visualsLocal:AddToggle({ text = "Custom Sleeve Color", flag = "customSleeveColor", callback = updateViewModelVisuals }):AddColor({ color = Color3.fromRGB(255, 255, 255), flag = "customSleeveColorValue", callback = updateViewModelVisuals })
function applyThirdPerson()
	local on = library_flags["thirdPerson"] == true; local tpValue = workspace:FindFirstChild("ThirdPerson")
	if tpValue and tpValue.Value ~= on then tpValue.Value = on end
	local dist = on and (library_flags["thirdPersonDistance"] or 10) or 0.5
	if val_733.CameraMinZoomDistance == dist and val_733.CameraMaxZoomDistance == dist then return end
	if dist > val_733.CameraMaxZoomDistance then
		val_733.CameraMaxZoomDistance = dist; val_733.CameraMinZoomDistance = dist
	else
		val_733.CameraMinZoomDistance = dist; val_733.CameraMaxZoomDistance = dist
	end
end
env.runService.Heartbeat:Connect(function()
	if not library_flags["thirdPerson"] then return end
	local hum = val_733.Character and val_733.Character:FindFirstChildOfClass("Humanoid")
	if hum and hum.Health > 0 then applyThirdPerson() end
end)
tpToggle = visualsLocal:AddToggle({ text = "Third Person", flag = "thirdPerson", callback = applyThirdPerson })
tpToggle:AddBind({
	key = "none", mode = "toggle", flag = "thirdPerson Bind",
	callback = function(active)
		local bind = UI_Library.options["thirdPerson Bind"]
		if bind.key == "none" then return end
		if bind.mode == "toggle" then
			tpToggle:SetState(not tpToggle.state)
		elseif tpToggle.state ~= active then
			tpToggle:SetState(active == true)
		end
	end
})
visualsLocal:AddSlider({ text = "Third Person Distance", flag = "thirdPersonDistance", min = 5, max = 25, value = 10, callback = applyThirdPerson })
visualsLocal:AddToggle({ text = "Grenade Predictor", flag = "grenadePredictor" }):AddColor({ color = Color3.fromRGB(255, 50, 50), flag = "grenadeColor" }); visualsLocal:AddToggle({ text = "Custom Crosshair", flag = "customCrosshair" }):AddColor({ color = Color3.fromRGB(0, 255, 0), flag = "crosshairColor" }); visualsLocal:AddSlider({ text = "Crosshair Size", flag = "crSize", value = 8, min = 2, max = 20 }); visualsLocal:AddSlider({ text = "Crosshair Gap", flag = "crGap", value = 4, min = 0, max = 20 }); visualsLocal:AddSlider({ text = "Crosshair Thickness", flag = "crThickness", value = 1, min = 1, max = 5 }); visualsLocal:AddToggle({ text = "Crosshair Spin", flag = "crSpin" }); crosshairLines = {}
for i = 1, 4 do
	local l = Drawing.new("Line"); l.Visible = false; l.Color = Color3.new(0, 1, 0); l.Thickness = 1; l.Transparency = 1; table.insert(crosshairLines, l)
end
crAngle = 0
game:GetService("RunService").RenderStepped:Connect(function()
	local enabled = library_flags["customCrosshair"]
	if not enabled then
		for _, l in crosshairLines do l.Visible = false end
		return
	end
	local center = workspace.CurrentCamera.ViewportSize / 2; local size = library_flags["crSize"] or 8; local gap = library_flags["crGap"] or 4; local thick = library_flags["crThickness"] or 1; local col = library_flags["crosshairColor"] or Color3.new(0,1,0); local isSpin = library_flags["crSpin"]
	if isSpin then
		crAngle = crAngle + 2
		if crAngle > 360 then crAngle = 0 end
	else
		crAngle = 0
	end
	local rad = math.rad(crAngle); local cosA, sinA = math.cos(rad), math.sin(rad)
	local function rotate(x, y) return Vector2.new(x * cosA - y * sinA, x * sinA + y * cosA) end
	local dirs = {Vector2.new(0, -1), Vector2.new(0, 1), Vector2.new(-1, 0), Vector2.new(1, 0)}
	for i = 1, 4 do
		local l = crosshairLines[i]; l.Visible = true; l.Color = col; l.Thickness = thick; local dir = rotate(dirs[i].X, dirs[i].Y); l.From = center + (dir * gap); l.To = center + (dir * (gap + size))
	end
end)
val_662.Particles.Light.Range = 0 
local function GetLightingEffect(classname)
	local expectedParent = game:GetService("Lighting"); local eff = expectedParent:FindFirstChildOfClass(classname)
	if not eff then
		eff = Instance.new(classname, expectedParent)
		pcall(function() eff.Enabled = false end)
		if classname == "Atmosphere" then
			pcall(function() eff.Density = 0 end)
		end
	end
	return eff
end
worldCol1 = visualsGame:AddColumn(); worldCol2 = visualsGame:AddColumn()
lightingSection = worldCol1:AddSection"Lighting"; skySection = worldCol1:AddSection"Sky"; fogSection = worldCol1:AddSection"Fog"
bloomSection = worldCol2:AddSection"Bloom"; sunRaysSection = worldCol2:AddSection"Sun Rays"; dofSection = worldCol2:AddSection"Depth of Field"; atmosphereSection = worldCol2:AddSection"Atmosphere"; terrainSection = worldCol2:AddSection"Terrain"
uiLoaded = false
function applyLighting()
	pcall(function()
		local bloom = GetLightingEffect("BloomEffect")
		bloom.Enabled = library_flags["bloomEnabled"] == true; bloom.Intensity = library_flags["bloomIntensity"] or 1; bloom.Size = library_flags["bloomSize"] or 10
		local rays = GetLightingEffect("SunRaysEffect")
		rays.Enabled = library_flags["sunraysEnabled"] == true; rays.Intensity = library_flags["sunraysIntensity"] or 0.2
		local dof = GetLightingEffect("DepthOfFieldEffect")
		dof.Enabled = library_flags["dofEnabled"] == true; dof.FocusDistance = library_flags["dofFocus"] or 0; dof.InFocusRadius = library_flags["dofRadius"] or 25; dof.FarIntensity = library_flags["dofFar"] or 0.75; dof.NearIntensity = library_flags["dofNear"] or 0
		local atmo = GetLightingEffect("Atmosphere")
		atmo.Density = library_flags["atmoEnabled"] and (library_flags["atmoDensity"] or 0.3) or 0; atmo.Haze = library_flags["atmoHaze"] or 0; atmo.Glare = library_flags["atmoGlare"] or 0
	end)
end
task.spawn(function()
	task.wait(1.5); uiLoaded = true; applyLighting()
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
	flag = "ambientColor", color = Color3.fromRGB(128, 128, 128),
	callback = function(c) if not uiLoaded then return end if library_flags["Enabled Ambient"] then game:GetService("Lighting").Ambient = c end end
})
lightingSection:AddSlider({
	text = "Brightness", min = 0, max = 10, float = 0.1, value = 2.5,
	callback = function(v) if not uiLoaded then return end game:GetService("Lighting").Brightness = v end
})
lightingSection:AddToggle({ text = "Gradient" }):AddColor({ flag = "gradientColor", color = Color3.fromRGB(90, 90, 90) }); UI_Library.options["Gradient"]:AddColor({ flag = "gradientColor2", color = Color3.fromRGB(150, 150, 150) }); lightingSection:AddToggle({ text = "Grenade Area" }):AddColor({ flag = "areaColor", color = Color3.fromRGB(150, 20, 75) }); lightingSection:AddToggle({ text = "Saturation" }):AddSlider({ min = 0, max = 100, value = 10, flag = "saturationValue" })
fogSection:AddToggle({
	text = "Fog Changer",
	callback = function(v)
		if not uiLoaded then return end
		pcall(function()
			if v then
				game:GetService("Lighting").FogStart = library_flags["fogStart"]; game:GetService("Lighting").FogEnd = library_flags["fogEnd"]; game:GetService("Lighting").FogColor = library_flags["fogColor"]
			else
				game:GetService("Lighting").FogStart = 0; game:GetService("Lighting").FogEnd = 100000
				local atmo = game:GetService("Lighting"):FindFirstChildOfClass("Atmosphere")
				if atmo then atmo.Enabled = false end
			end
		end)
	end
}):AddColor({
	flag = "fogColor", color = Color3.fromRGB(220, 220, 220),
	callback = function(c) if not uiLoaded then return end if library_flags["Fog Changer"] then pcall(function() game:GetService("Lighting").FogColor = c; GetLightingEffect("Atmosphere").Color = c end) end end
})
fogSection:AddSlider({
	text = "Fog Start", min = 0, max = 1000, float = 1, value = 0, flag = "fogStart",
	callback = function(v) if not uiLoaded then return end if library_flags["Fog Changer"] then pcall(function() game:GetService("Lighting").FogStart = v end) end end
})
fogSection:AddSlider({
	text = "Fog End", min = 45, max = 1000, float = 1, value = 45, flag = "fogEnd",
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
	min = 0, max = 24, float = 0.1, flag = "time", value = 14,
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
	text = "Enabled", flag = "bloomEnabled",
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("BloomEffect").Enabled = v end) end
})
bloomSection:AddSlider({
	text = "Intensity", flag = "bloomIntensity", min = 0, max = 10, float = 0.1, value = 1,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("BloomEffect").Intensity = v end) end
})
bloomSection:AddSlider({
	text = "Size", flag = "bloomSize", min = 0, max = 56, float = 1, value = 10,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("BloomEffect").Size = v end) end
})
atmosphereSection:AddToggle({
	text = "Enabled", flag = "atmoEnabled",
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Density = v and library_flags["atmoDensity"] or 0 end) end
})
atmosphereSection:AddSlider({
	text = "Density", min = 0, max = 2, float = 0.01, value = 0.3, flag = "atmoDensity",
	callback = function(v) if not uiLoaded then return end pcall(function() if library_flags["atmoEnabled"] then GetLightingEffect("Atmosphere").Density = v end end) end
})
atmosphereSection:AddSlider({
	text = "Haze", flag = "atmoHaze", min = 0, max = 10, float = 0.1, value = 0,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Haze = v end) end
})
atmosphereSection:AddSlider({
	text = "Glare", flag = "atmoGlare", min = 0, max = 10, float = 0.1, value = 0,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Glare = v end) end
})
atmosphereSection:AddToggle({
	text = "Atmosphere Color"
}):AddColor({
	flag = "atmoColor", color = Color3.fromRGB(199, 175, 166),
	callback = function(c) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Color = c end) end
})
atmosphereSection:AddToggle({
	text = "Decay Color"
}):AddColor({
	flag = "atmoDecay", color = Color3.fromRGB(92, 60, 13),
	callback = function(c) if not uiLoaded then return end pcall(function() GetLightingEffect("Atmosphere").Decay = c end) end
})
dofSection:AddToggle({
	text = "Enabled",
	flag = "dofEnabled",
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("DepthOfFieldEffect").Enabled = v end) end
})
dofSection:AddSlider({
	text = "Focus Distance", flag = "dofFocus", min = 0, max = 1000, float = 1, value = 0,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("DepthOfFieldEffect").FocusDistance = v end) end
})
dofSection:AddSlider({
	text = "In Focus Radius", flag = "dofRadius", min = 0, max = 200, float = 1, value = 25,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("DepthOfFieldEffect").InFocusRadius = v end) end
})
dofSection:AddSlider({
	text = "Far Blur", flag = "dofFar", min = 0, max = 1, float = 0.05, value = 0.75,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("DepthOfFieldEffect").FarIntensity = v end) end
})
dofSection:AddSlider({
	text = "Near Blur", flag = "dofNear", min = 0, max = 1, float = 0.05, value = 0,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("DepthOfFieldEffect").NearIntensity = v end) end
})
sunRaysSection:AddToggle({
	text = "Enabled", flag = "sunraysEnabled",
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("SunRaysEffect").Enabled = v end) end
})
sunRaysSection:AddSlider({
	text = "Intensity", flag = "sunraysIntensity", min = 0, max = 1, float = 0.01, value = 0.2,
	callback = function(v) if not uiLoaded then return end pcall(function() GetLightingEffect("SunRaysEffect").Intensity = v end) end
})
do
weatherSection = worldCol1:AddSection"Weather"
WEATHER_PRESETS = { ["Snow"] = { Count = 120, Color = Color3.fromRGB(255,255,255), Size = Vector3.new(0.14,0.14,0.14), Speed = 18, Drift = 8, Transparency = 0.15, Material = Enum.Material.Neon, }, ["Light Rain"] = { Count = 90, Color = Color3.fromRGB(150,190,255), Size = Vector3.new(0.035,2.8,0.035), Speed = 95, Drift = 3, Transparency = 0.25, Material = Enum.Material.Neon, }, ["Heavy Rain"] = { Count = 170, Color = Color3.fromRGB(130,180,255), Size = Vector3.new(0.045,4.2,0.045), Speed = 145, Drift = 7, Transparency = 0.15, Material = Enum.Material.Neon, }, ["Ash"] = { Count = 130, Color = Color3.fromRGB(255,120,45), Size = Vector3.new(0.22,0.22,0.22), Speed = 9, Drift = 20, Transparency = 0.2, Material = Enum.Material.Neon, }, }
weatherFolder = Instance.new("Folder"); weatherFolder.Name = "Weather"; weatherFolder.Parent = workspace; weatherParts = {}
rng = Random.new()
local function clearWeather()
	for _, p in weatherParts do
		if p then p:Destroy() end
	end
	table.clear(weatherParts)
end
local function randomWeatherPosition(cam)
	local cf = cam.CFrame; local x = rng:NextNumber(-95, 95); local z = rng:NextNumber(-95, 95)
	return cf.Position + (cf.RightVector * x) + (Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z).Unit * z) + Vector3.new(0, rng:NextNumber(35, 95), 0)
end
local function makeWeatherPart(preset)
	local part = Instance.new("Part"); part.Name = "WeatherDrop"; part.Anchored = true; part.CanCollide = false; part.CanQuery = false; part.CanTouch = false
	part.CastShadow = false
	part.Material = preset.Material; part.Color = preset.Color; part.Size = preset.Size; part.Transparency = preset.Transparency; part.Parent = weatherFolder
	if library_flags["weatherType"] == "Snow" or library_flags["weatherType"] == "Ash" then
		part.Shape = Enum.PartType.Ball
	end
	return part
end
local function applyWeather()
	clearWeather()
	if not library_flags["weatherEnabled"] then return end
	local preset = WEATHER_PRESETS[library_flags["weatherType"] or "Snow"] or WEATHER_PRESETS["Snow"]; local intensity = library_flags["weatherIntensity"] or 100; local count = math.clamp(math.floor(preset.Count * (intensity / 100)), 20, 260); local cam = workspace.CurrentCamera
	for i = 1, count do
		weatherParts[i] = makeWeatherPart(preset)
		if cam then
			weatherParts[i].CFrame = CFrame.new(randomWeatherPosition(cam))
		end
	end
	warn("[WEATHER] spawned visible " .. tostring(library_flags["weatherType"]) .. " parts=" .. tostring(count))
end
weatherSection:AddToggle({
	text = "Enabled", flag = "weatherEnabled",
	callback = function(v)
		applyWeather()
	end
})
weatherSection:AddList({
	text = "Type", flag = "weatherType", values = {"Snow", "Light Rain", "Heavy Rain", "Ash"}, value = "Snow",
	callback = function() applyWeather() end
})
weatherSection:AddSlider({
	text = "Intensity", flag = "weatherIntensity", min = 25, max = 200, float = 1, value = 100,
	callback = function() applyWeather() end
})
game:GetService("RunService").RenderStepped:Connect(function()
	if library_flags["weatherEnabled"] and #weatherParts > 0 then
		local cam = workspace.CurrentCamera; local preset = WEATHER_PRESETS[library_flags["weatherType"] or "Snow"] or WEATHER_PRESETS["Snow"]
		if cam then
			local toMoveParts = {}; local toMoveCFs = {}; local t = tick()
			for i, p in weatherParts do
				if p and p.Parent then
					local phase = i * 0.37; local drift = Vector3.new(math.sin(t + phase) * preset.Drift, 0, math.cos(t * 0.8 + phase) * preset.Drift); local newCf = p.CFrame + ((Vector3.new(0, -preset.Speed, 0) + drift) * (1 / 60))
					if p.Position.Y < cam.CFrame.Position.Y - 18 or (p.Position - cam.CFrame.Position).Magnitude > 170 then
						newCf = CFrame.new(randomWeatherPosition(cam))
					end
					table.insert(toMoveParts, p); table.insert(toMoveCFs, newCf)
				end
			end
			if #toMoveParts > 0 then
				workspace:BulkMoveTo(toMoveParts, toMoveCFs, Enum.BulkMoveMode.FireCFrameChanged)
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
	text = "Water Transparency", min = 0, max = 1, float = 0.05, value = 1,
	callback = function(v) pcall(function() workspace.Terrain.WaterTransparency = v end) end
})
terrainSection:AddSlider({
	text = "Water Wave Size", min = 0, max = 1, float = 0.05, value = 0.15,
	callback = function(v) pcall(function() workspace.Terrain.WaterWaveSize = v end) end
})
terrainSection:AddSlider({
	text = "Water Wave Speed", min = 0, max = 100, float = 1, value = 10,
	callback = function(v) pcall(function() workspace.Terrain.WaterWaveSpeed = v end) end
})
visualsScreenCol = visualsScreen:AddColumn(); miscMain = visualsScreenCol:AddSection"General"; movementTab = UI_Library:AddTab"Movement"; movementGeneral = movementTab:AddSubTab("General"); miscColumn = movementGeneral:AddColumn(); miscColumn2 = movementGeneral:AddColumn(); fakeLagDebounce = false; jumpbugging = false; noclipping = false; surfing = false 
edgebugCooldown = false 
edgebugDebounce = false; edgeBox = nil; lastKnownDirection = Vector3.new(1, 0, 0); edgeDetectionFrames = 0; env.newEdgebugActive = false; env.oldEbActive = false; miscMain:AddToggle({ text = "Hitlogs" }); miscMain:AddToggle({ text = "Log Damage", flag = "hitlogDamage" })
do
	local notifGui = Instance.new("ScreenGui", game:GetService("CoreGui")); notifGui.Name = "Clarity_HitLogs"; notifGui.ResetOnSpawn = false; notifGui.IgnoreGuiInset = true; local notifContainer = Instance.new("Frame", notifGui); notifContainer.Name = "Container"; notifContainer.AnchorPoint = Vector2.new(0.5, 1); notifContainer.Position = UDim2.new(0.5, 0, 1, -60); notifContainer.Size = UDim2.new(0, 340, 0, 300); notifContainer.BackgroundTransparency = 1; local notifLayout = Instance.new("UIListLayout", notifContainer); notifLayout.Padding = UDim.new(0, 4); notifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center; notifLayout.SortOrder = Enum.SortOrder.LayoutOrder; notifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom; local notifOrder = 0; local TweenService = game:GetService("TweenService")
	env.pushNotification = function(text, color, duration)
		if not library_flags["Hitlogs"] then return end
		duration = duration or 4; color = color or Color3.fromRGB(76, 175, 80); notifOrder = notifOrder + 1; local bar = Instance.new("Frame", notifContainer); bar.Name = "Notif_" .. notifOrder; bar.LayoutOrder = notifOrder; bar.Size = UDim2.new(1, 0, 0, 0); bar.BackgroundColor3 = Color3.fromRGB(18, 18, 18); bar.BorderSizePixel = 0
		bar.ClipsDescendants = true
		Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 4); local stroke = Instance.new("UIStroke", bar); stroke.Color = Color3.fromRGB(40, 40, 40); stroke.Thickness = 1; local progress = Instance.new("Frame", bar); progress.Name = "Progress"; progress.Size = UDim2.new(1, 0, 0, 2); progress.Position = UDim2.new(0, 0, 0, 0); progress.BackgroundColor3 = color; progress.BackgroundTransparency = 0; progress.BorderSizePixel = 0; progress.ZIndex = 2; local label = Instance.new("TextLabel", bar); label.Size = UDim2.new(1, -12, 1, 0); label.Position = UDim2.new(0, 6, 0, 0); label.BackgroundTransparency = 1; label.Text = text; label.TextSize = 13; label.Font = Enum.Font.Code; label.TextColor3 = Color3.fromRGB(220, 220, 220); label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd; label.ZIndex = 4; TweenService:Create(bar, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 0, 24) }):Play(); TweenService:Create(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), { Size = UDim2.new(0, 0, 0, 2) }):Play()
		spawn(function()
			wait(duration); local fadeOut = TweenService:Create(bar, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1 }); TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 1}):Play(); TweenService:Create(progress, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play(); fadeOut:Play(); fadeOut.Completed:Wait(); bar:Destroy()
		end)
	end
	pcall(function()
		onHit.Event:Connect(function(hitPlayer, hitPart)
			if library_flags["Hitlogs"] and library_flags["hitlogDamage"] then
				local partName = hitPart and hitPart.Name or "?"; local name = hitPlayer and hitPlayer.Name or "?"; pushNotification("Hit " .. name .. " in " .. partName, Color3.fromRGB(76, 175, 80))
			end
		end)
	end)
end
miscMain:AddToggle({
	text = "Spectator List",
	callback = function()
		val_948.Visible = library_flags["Spectator List"]; local currentSpectators = {}
		while library_flags["Spectator List"] do
			wait(0.5)
			if not library_flags["Spectator List"] then break end
			local newSpectators = {}
			if val_733:FindFirstChild("CameraCF") then
				local localCamPos = val_733.CameraCF.Value.p 
				for _, player in val_711:GetPlayers() do
					if not player.Character or (player.Character and not player.Character:FindFirstChild("HumanoidRootPart")) then
						if player:FindFirstChild("CameraCF") and player ~= val_733 and val_733.Character and val_733.Character.PrimaryPart then
							local otherCamPos = player.CameraCF.Value.p 
							if (otherCamPos - localCamPos).magnitude < 20 then
								table.insert(newSpectators, player.Name)
							end
						end
					end
				end
			end 
			local changed = false
			if #newSpectators ~= #currentSpectators then
				changed = true
			else
				for i=1, #newSpectators do
					if newSpectators[i] ~= currentSpectators[i] then
						changed = true; break
					end
				end
			end
			if changed then
				currentSpectators = newSpectators; removeSpectators()
				for _, name in newSpectators do
					addSpectator(name)
				end
			end
		end
	end
})
miscMain:AddToggle({ text = "Detect Moderators (Auto-Leave)", flag = "modDetect" }); CB_STAFF_GROUPS = { 13733926, 3098471 }
CB_STAFF_ROLES = { ["tester"] = true, ["content creator"] = true, ["game moderator"] = true, ["contractors"] = true, ["contractor"] = true, ["main developers"] = true, ["main developer"] = true, ["developer"] = true, ["developers"] = true, ["owners"] = true, ["owner"] = true, ["group holder"] = true, ["admin"] = true, ["administrator"] = true, ["moderator"] = true, ["staff"] = true, }
spawn(function()
	while task.wait(3) do
		if not library_flags["modDetect"] then continue end
		for _, plr in game:GetService("Players"):GetPlayers() do
			if plr == val_733 then continue end
			local kickReason = nil
			pcall(function()
				if plr:IsInGroup(1200769) then kickReason = "Roblox Admin" end
				for _, gid in CB_STAFF_GROUPS do
					if plr:IsInGroup(gid) then
						local roleName = plr:GetRoleInGroup(gid); local lowered = tostring(roleName):lower()
						if CB_STAFF_ROLES[lowered] then
							kickReason = "CB Staff (" .. roleName .. ") in group " .. gid; break
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
				val_733:Kick("Clarity Protection: Auto-Leave triggered.\nReason: " .. kickReason .. " detected (" .. plr.Name .. ")."); break
			end
		end
	end
end)
miscOK = UI_Library:AddWarning({ type = "ok" }); miscMovement = miscColumn:AddSection"Movement"
miscMovement:AddToggle({ text = "No Crouch Cooldown" })
miscMovement:AddToggle({ text = "Auto Strafe" }); last = Vector3.new(); miscMovement:AddToggle({ text = "Maintain Velocity" })
miscMovement:AddToggle({
	text = "Bunny Hop",
	callback = function()
	end
})
miscMovement:AddList({ text = "Bunny Hop Method", flag = "Bunny Hop Method", values = {"Directional", "A/D"}, value = "A/D" }); miscMovement:AddSlider({ text = "Bunny Hop Speed", min = 18, max = 100, flag = "Speed Value" }); miscIndicators = miscColumn2:AddSection"Indicators"; miscIndicators:AddToggle({ text = "Pixel Surf Indicator", flag = "showPSInd" }); miscIndicators:AddToggle({ text = "Long Jump Indicator", flag = "showLJInd" }); miscIndicators:AddToggle({ text = "Edgebug Indicator", flag = "showEBInd" }); miscIndicators:AddToggle({ text = "Jumpbug Indicator", flag = "showJBInd" }); miscIndicators:AddToggle({ text = "Airstuck Indicator", flag = "showASInd" }); miscIndicators:AddToggle({ text = "Texturebug Indicator", flag = "showTBInd" }); miscIndicators:AddToggle({ text = "Minijump Indicator", flag = "showMJInd" }); miscIndicators:AddToggle({ text = "Fireman Indicator", flag = "showFMInd" }); miscIndicators:AddToggle({ text = "Jetpack Indicator", flag = "showJPInd" }); miscIndicators:AddToggle({ text = "Wallclimb Indicator", flag = "showWCInd" }); miscIndicators:AddToggle({ text = "Ladderbug Indicator", flag = "showLBInd" }); miscIndicators:AddList({ text = "Indicator Font", flag = "indFont", values = { "UI", "System", "Plex", "Monospace" } }); miscIndicators:AddSlider({ text = "Indicator Size", flag = "indSize", min = 12, max = 30, value = 18 }); motionSettings = miscColumn2:AddSection"Movement Settings"; motionSettings:AddSlider({ text = "Jetpack Speed", flag = "jetpackSpeed", min = 10, max = 100, value = 35 }); motionSettings:AddSlider({ text = "Jumpbug Height", min = 1, max = 6, float = 0.5, flag = "jbHeight", value = 4, suffix = "x" }); motionSettings:AddSlider({ text = "Minijump Mult", min = 0.3, max = 0.8, float = 0.1, flag = "mjMult", value = 0.5 }); motionSettings:AddSlider({ text = "Pixel Surf Speed", min = 18, max = 200, value = 25, flag = "pspeed" }); motionSettings:AddSlider({ text = "Long Jump Studs", min = 1, max = 10, value = 1, suffix = "st", flag = "longJumpStuds" })
motionSettings:AddToggle({ text = "Auto Edge Bug" }); motionSettings:AddList({ text = "Edgebug Mode", flag = "Edgebug Mode", values = {"mimic", "redirectional", "helltracing"}, value = "redirectional" }); motionSettings:AddToggle({ text = "Edgebug Visualizer", flag = "showEBVis" }); motionSettings:AddToggle({ text = "Edgebug Logs", flag = "showEBLogs" }); motionSettings:AddToggle({ text = "Edgebug Badge", flag = "Edgebug Badge" }); blindParts = { "FakeHead", "Gun", "UpperTorso", "LowerTorso", "LeftUpperArm", "RightUpperArm" }; movementFeatures = miscColumn:AddSection"Movement Features"; val_412 = val_749.ViewportSize.Y - 50; val_436 = Drawing.new("Text"); val_436.Center = true; val_436.Outline = true; val_436.Color = Color3.new(1, 1, 1); val_436.Font = 3; val_436.Size = 20; val_436.Visible = false; oldWalk = val_757.walkupdate; oldSpeedUpdate = val_757.speedupdate 
movementFeatures:AddToggle({
	text = "Drawing Enabled",
	callback = function()
		local vTrans = 0
		while library_flags["Drawing Enabled"] do
			wait(); val_436.Position = Vector2.new(val_749.ViewportSize.X / 2, val_749.ViewportSize.Y - 40); val_412 = val_749.ViewportSize.Y - 50; local val_470 = 0 
			if val_872.alive and val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart") then
				val_470 = math.floor(math.clamp((val_733.Character.HumanoidRootPart.Velocity * Vector3.new(1, 0, 1)).magnitude * 14.85, 0, 400))
			end 
			local vTarget = library_flags["Velocity Indicator"] and 1 or 0; vTrans = vTrans + (vTarget - vTrans) * 0.15
			if math.abs(vTrans - vTarget) < 0.001 then vTrans = vTarget end
			val_436.Transparency = vTrans; val_436.Visible = vTrans > 0
			if val_436.Visible then
				val_436.Text = tostring(val_470)
			end 
		end 
		val_436.Visible = false 
	end
})
CreateThread(function()
	while true do
		env.runService.RenderStepped:Wait()
		if not env.psIndicator then
			env.psIndicator = Drawing.new("Text"); env.psIndicator.Center = true; env.psIndicator.Outline = true; env.psIndicator.Font = 3; env.psIndicator.Size = 18; env.psIndicator.Text = "PS"; env.psIndicator.Visible = false
		end
		if not env.jpIndicator then
			env.jpIndicator = Drawing.new("Text"); env.jpIndicator.Center = true; env.jpIndicator.Outline = true; env.jpIndicator.Font = 3; env.jpIndicator.Size = 18; env.jpIndicator.Text = "JP"; env.jpIndicator.Visible = false
		end
		if not env.ljIndicator then
			env.ljIndicator = Drawing.new("Text"); env.ljIndicator.Center = true; env.ljIndicator.Outline = true; env.ljIndicator.Font = 3; env.ljIndicator.Size = 18; env.ljIndicator.Text = "LJ"; env.ljIndicator.Visible = false
		end
		if not env.ebIndicator then
			env.ebIndicator = Drawing.new("Text"); env.ebIndicator.Center = true; env.ebIndicator.Outline = true; env.ebIndicator.Font = 3; env.ebIndicator.Size = 18; env.ebIndicator.Text = "EB"; env.ebIndicator.Visible = false
		end
		if not env.jbIndicator then
			env.jbIndicator = Drawing.new("Text"); env.jbIndicator.Center = true; env.jbIndicator.Outline = true; env.jbIndicator.Font = 3; env.jbIndicator.Size = 18; env.jbIndicator.Text = "JB"; env.jbIndicator.Visible = false
		end
		if not env.asIndicator then
			env.asIndicator = Drawing.new("Text"); env.asIndicator.Center = true; env.asIndicator.Outline = true; env.asIndicator.Font = 3; env.asIndicator.Size = 18; env.asIndicator.Text = "AS"; env.asIndicator.Visible = false
		end
		if not env.tbIndicator then
			env.tbIndicator = Drawing.new("Text"); env.tbIndicator.Center = true; env.tbIndicator.Outline = true; env.tbIndicator.Font = 3; env.tbIndicator.Size = 18; env.tbIndicator.Text = "TB"; env.tbIndicator.Visible = false
		end
		if not env.mjIndicator then
			env.mjIndicator = Drawing.new("Text"); env.mjIndicator.Center = true; env.mjIndicator.Outline = true; env.mjIndicator.Font = 3; env.mjIndicator.Size = 18; env.mjIndicator.Text = "MJ"; env.mjIndicator.Visible = false
		end
		if not env.fmIndicator then
			env.fmIndicator = Drawing.new("Text"); env.fmIndicator.Center = true; env.fmIndicator.Outline = true; env.fmIndicator.Font = 3; env.fmIndicator.Size = 18; env.fmIndicator.Text = "FM"; env.fmIndicator.Visible = false
		end
		if not env.wcIndicator then
			env.wcIndicator = Drawing.new("Text"); env.wcIndicator.Center = true; env.wcIndicator.Outline = true; env.wcIndicator.Font = 3; env.wcIndicator.Size = 18; env.wcIndicator.Text = "WC"; env.wcIndicator.Visible = false
		end
		if not env.lbIndicator then
			env.lbIndicator = Drawing.new("Text"); env.lbIndicator.Center = true; env.lbIndicator.Outline = true; env.lbIndicator.Font = 3; env.lbIndicator.Size = 18; env.lbIndicator.Text = "LB"; env.lbIndicator.Visible = false
		end
		local indFontMap = { ["UI"] = 0, ["System"] = 1, ["Plex"] = 2, ["Monospace"] = 3 }; local indFont = indFontMap[library_flags["indFont"]] or 3; local indSize = library_flags["indSize"] or 18; local L_psText = env.psIndicator; local L_ljText = env.ljIndicator; local L_ebText = env.ebIndicator; local L_jbText = env.jbIndicator; local L_asText = env.asIndicator; local L_tbText = env.tbIndicator
				local L_mjText = env.mjIndicator
		local L_fmText = env.fmIndicator; local L_jpText = env.jpIndicator; local L_wcText = env.wcIndicator; local L_lbText = env.lbIndicator; L_psText.Font = indFont; L_psText.Size = indSize; L_ljText.Font = indFont; L_ljText.Size = indSize; L_ebText.Font = indFont; L_ebText.Size = indSize; L_jbText.Font = indFont; L_jbText.Size = indSize; L_asText.Font = indFont; L_asText.Size = indSize; L_tbText.Font = indFont; L_tbText.Size = indSize
				L_mjText.Font = indFont; L_mjText.Size = indSize
		L_fmText.Font = indFont; L_fmText.Size = indSize; L_jpText.Font = indFont; L_jpText.Size = indSize; L_wcText.Font = indFont; L_wcText.Size = indSize; L_lbText.Font = indFont; L_lbText.Size = indSize
		if not val_749 or not val_749.ViewportSize then continue end
		local centerX = val_749.ViewportSize.X / 2; local baseY = val_749.ViewportSize.Y - 100; local lerpSpeed = 0.15
		if not env.indTrans then
			env.indTrans = { ps = 0, lj = 0, eb = 0, jb = 0, as = 0, mj = 0, fm = 0, jp = 0 }
		end
		local trans = env.indTrans; local psActive = library_flags["showPSInd"] and (env.pixelSurfTouching or (surfing and true or false)); local psTarget = psActive and 1 or 0; trans.ps = trans.ps + (psTarget - trans.ps) * lerpSpeed
		if math.abs(trans.ps - psTarget) < 0.001 then trans.ps = psTarget end
		L_psText.Transparency = trans.ps; L_psText.Visible = trans.ps > 0; local ljActive = library_flags["showLJInd"] and env.longJumpHold; local ljTarget = ljActive and 1 or 0; trans.lj = trans.lj + (ljTarget - trans.lj) * lerpSpeed
		if math.abs(trans.lj - ljTarget) < 0.001 then trans.lj = ljTarget end
		L_ljText.Transparency = trans.lj; L_ljText.Visible = trans.lj > 0; local ebActive = library_flags["showEBInd"] and library_flags["Edgebug"] and (val_830 or library_flags["Auto Edge Bug"]); local ebTarget = ebActive and 1 or 0; trans.eb = trans.eb + (ebTarget - trans.eb) * lerpSpeed
		if math.abs(trans.eb - ebTarget) < 0.001 then trans.eb = ebTarget end
		L_ebText.Transparency = trans.eb; L_ebText.Visible = trans.eb > 0; local jbActive = library_flags["showJBInd"] and (env.jbBindHeld or (tick() - (env.lastJumpbugTime or 0) < 0.4)); local jbTarget = jbActive and 1 or 0; trans.jb = trans.jb + (jbTarget - trans.jb) * lerpSpeed
		if math.abs(trans.jb - jbTarget) < 0.001 then trans.jb = jbTarget end
		L_jbText.Transparency = trans.jb; L_jbText.Visible = trans.jb > 0; L_jbText.Color = (tick() - (env.lastJumpbugTime or 0) <= 0.5) and Color3.new(0, 1, 0.5) or Color3.new(1, 1, 1); local asAnchored = val_872.alive and val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart") and val_733.Character.HumanoidRootPart.Anchored; local asActive = library_flags["showASInd"] and asAnchored; local asTarget = asActive and 1 or 0; trans.as = trans.as + (asTarget - trans.as) * lerpSpeed; local tbActive = library_flags["showTBInd"] and env.tbSurfing and library_flags["Texturebug"]; local tbTarget = tbActive and 1 or 0; trans.tb = (trans.tb or 0) + (tbTarget - (trans.tb or 0)) * lerpSpeed
		if math.abs(trans.as - asTarget) < 0.001 then trans.as = asTarget end
		L_asText.Transparency = trans.as; L_tbText.Transparency = trans.tb or 0
					L_tbText.Transparency = trans.tb or 0
		L_asText.Visible = trans.as > 0; L_tbText.Visible = (trans.tb or 0) > 0
				local mjActive = library_flags["showMJInd"] and (env.minijumpActive or (tick() - (env.minijumpSuccessTime or 0) < 0.3))
		local mjTarget = mjActive and 1 or 0; trans.mj = trans.mj + (mjTarget - trans.mj) * lerpSpeed
		if math.abs(trans.mj - mjTarget) < 0.001 then trans.mj = mjTarget end
		L_mjText.Transparency = trans.mj; L_mjText.Visible = trans.mj > 0; local fmActiveStatus = library_flags["showFMInd"] and library_flags["Fireman"] and (env.fmOnLadder or env.fmTriggered or env.fmActiveHold); local fmTarget = fmActiveStatus and 1 or 0; trans.fm = trans.fm + (fmTarget - trans.fm) * lerpSpeed
		if math.abs(trans.fm - fmTarget) < 0.001 then trans.fm = fmTarget end
		L_fmText.Transparency = trans.fm; L_fmText.Visible = trans.fm > 0; local jpActive = library_flags["showJPInd"] and library_flags["Jetpack"] and env.jetpackBindHeld; local jpTarget = jpActive and 1 or 0; trans.jp = (trans.jp or 0) + (jpTarget - (trans.jp or 0)) * lerpSpeed
		if math.abs((trans.jp or 0) - jpTarget) < 0.001 then trans.jp = jpTarget end
		L_jpText.Transparency = trans.jp; L_jpText.Visible = trans.jp > 0; local wcActive = library_flags["showWCInd"] and (library_flags["Wallclimb"] or library_flags["Like Gecko"]) and (env.wallclimbing or env.wcBindHeld); local wcTarget = wcActive and 1 or 0; trans.wc = (trans.wc or 0) + (wcTarget - (trans.wc or 0)) * lerpSpeed
		if math.abs((trans.wc or 0) - wcTarget) < 0.001 then trans.wc = wcTarget end
		L_wcText.Transparency = trans.wc; L_wcText.Visible = trans.wc > 0; local lbActive = library_flags["showLBInd"] and library_flags["Ladder Bug"] and (env.ladderBugActive or env.lbBindHeld or tick() - (env.lastLadderBugTime or 0) < 0.5); local lbTarget = lbActive and 1 or 0; trans.lb = (trans.lb or 0) + (lbTarget - (trans.lb or 0)) * lerpSpeed
		if math.abs((trans.lb or 0) - lbTarget) < 0.001 then trans.lb = lbTarget end
		L_lbText.Transparency = trans.lb; L_lbText.Visible = trans.lb > 0; local slot = 0; local spacing = 20
		if L_jpText.Visible then
			L_jpText.Position = Vector2.new(centerX, baseY + slot * spacing); local hrp = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart"); local isFlying = hrp and (val_733.Character and val_733.Character:FindFirstChild("Humanoid") and (val_733.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall or val_733.Character.Humanoid.FloorMaterial == Enum.Material.Air)); L_jpText.Color = isFlying and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.jp > 0.5 then slot = slot + 1 end
		end
		if L_psText.Visible then
			L_psText.Position = Vector2.new(centerX, baseY + slot * spacing); L_psText.Color = env.pixelSurfTouching and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.ps > 0.5 then slot = slot + 1 end
		end
		if L_ljText.Visible then
			L_ljText.Position = Vector2.new(centerX, baseY + slot * spacing); L_ljText.Color = (tick() - (env.lastLongJumpTime or 0) <= 0.5) and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.lj > 0.5 then slot = slot + 1 end
		end
		if L_ebText.Visible then
			L_ebText.Position = Vector2.new(centerX, baseY + slot * spacing); L_ebText.Color = (tick() - (env.lastEdgebugTime or 0) <= 0.5) and Color3.new(0, 1, 0.5) or Color3.new(1, 1, 1)
			if trans.eb > 0.5 then slot = slot + 1 end
		end
		if L_jbText.Visible then
			L_jbText.Position = Vector2.new(centerX, baseY + slot * spacing); L_jbText.Color = (tick() - (env.lastJumpbugTime or 0) <= 0.5) and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.jb > 0.5 then slot = slot + 1 end
		end
		if L_asText.Visible then
			L_asText.Position = Vector2.new(centerX, baseY + slot * spacing); L_asText.Color = asAnchored and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.as > 0.5 then slot = slot + 1 end
		end
		if L_tbText.Visible then
			L_tbText.Position = Vector2.new(centerX, baseY + slot * spacing); L_tbText.Color = (library_flags["Texturebug"] and env.tbSurfing) and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if (trans.tb or 0) > 0.5 then slot = slot + 1 end
		end
		if L_mjText.Visible then
			L_mjText.Position = Vector2.new(centerX, baseY + slot * spacing); local successRecently = tick() - (env.minijumpSuccessTime or 0) < 0.3; L_mjText.Color = successRecently and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.mj > 0.5 then slot = slot + 1 end
		end
		if L_fmText.Visible then
			L_fmText.Position = Vector2.new(centerX, baseY + slot * spacing); L_fmText.Color = (env.fmOnLadder or env.fmTriggered) and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.fm > 0.5 then slot = slot + 1 end
		end
		if L_wcText.Visible then
			L_wcText.Position = Vector2.new(centerX, baseY + slot * spacing); L_wcText.Color = (env.wallclimbing) and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if trans.wc > 0.5 then slot = slot + 1 end
		end
		if L_lbText.Visible then
			L_lbText.Position = Vector2.new(centerX, baseY + slot * spacing); L_lbText.Color = (env.ladderBugActive or tick() - (env.lastLadderBugTime or 0) < 0.5) and Color3.new(0, 1, 0) or Color3.new(1, 1, 1)
			if (trans.lb or 0) > 0.5 then slot = slot + 1 end
		end
	end
end)
movementFeatures:AddToggle({ text = "Velocity Indicator" }); strafedir = Vector3.new(); cachedMovementIcon = nil
local function getMovementIcon()
	if cachedMovementIcon then return cachedMovementIcon end
	pcall(function()
		if not isfolder("clarity.tk") then makefolder("clarity.tk") end
		local path = "clarity.tk/movement.png"
		if not isfile(path) then
			local data = game:HttpGet("https://raw.githubusercontent.com/Freezewo/clarity.tk/main/movement.png"); writefile(path, data)
		end
		cachedMovementIcon = getcustomasset(path)
	end)
	return cachedMovementIcon or ""
end
badgeScreenGui = Instance.new("ScreenGui"); badgeScreenGui.Name = "ClarityEdgebugBadge"; badgeScreenGui.Parent = game:GetService("CoreGui"); env.activeBadgesList = env.activeBadgesList or {}
env.updateBadgePositions = function()
    local ts = game:GetService("TweenService")
    for i, badge in env.activeBadgesList do
        local targetY = -((i - 1) * 46); ts:Create(badge.frame, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(1, -170, 0.8, targetY)}):Play()
    end
end
env.showEdgebugBadge = function()
	if not library_flags["Edgebug Badge"] then return end
	local frame = Instance.new("Frame"); frame.Size = UDim2.new(0, 160, 0, 42); frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15); frame.BackgroundTransparency = 0.2; frame.BorderSizePixel = 0; frame.Parent = badgeScreenGui; local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 4); corner.Parent = frame; local img = Instance.new("ImageLabel"); img.Size = UDim2.new(0, 24, 0, 24); img.Position = UDim2.new(0, 10, 0.5, -12); img.BackgroundTransparency = 1; img.Image = getMovementIcon(); img.Parent = frame; local title = Instance.new("TextLabel"); title.Size = UDim2.new(1, -44, 0.5, 0); title.Position = UDim2.new(0, 44, 0, 4); title.BackgroundTransparency = 1; title.Text = "clarity.tk"; title.TextColor3 = Color3.fromRGB(255, 255, 255); title.Font = Enum.Font.Code; title.TextSize = 13; title.TextXAlignment = Enum.TextXAlignment.Left; title.Parent = frame; local sub = Instance.new("TextLabel"); sub.Size = UDim2.new(1, -44, 0.5, 0); sub.Position = UDim2.new(0, 44, 0.5, -4); sub.BackgroundTransparency = 1; sub.Text = "edgebugged!"; sub.TextColor3 = Color3.fromRGB(180, 180, 180); sub.Font = Enum.Font.Code; sub.TextSize = 12; sub.TextXAlignment = Enum.TextXAlignment.Left; sub.Parent = frame
    local badgeData = {frame = frame}; table.insert(env.activeBadgesList, badgeData); local targetYOffset = -((#env.activeBadgesList - 1) * 46); frame.Position = UDim2.new(1, 10, 0.8, targetYOffset); env.updateBadgePositions()
	local ts = game:GetService("TweenService")
	task.delay(2.5, function()
        local currentIdx = table.find(env.activeBadgesList, badgeData)
        if currentIdx then
            table.remove(env.activeBadgesList, currentIdx); env.updateBadgePositions()
        end
		local tweenOut = ts:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1, 10, frame.Position.Y.Scale, frame.Position.Y.Offset)}); tweenOut:Play()
		tweenOut.Completed:Connect(function()
			frame:Destroy()
		end)
	end)
end
movementFeatures:AddToggle({
	text = "Edgebug"
}):AddBind({
	key = Enum.KeyCode.E, mode = "hold",
	callback = function(bool)
		env.ebHolding = not bool
		if not bool then
			val_830 = true
		else
			val_830 = false; env.hookJP = nil
		end
	end
})
val_442 = { CFrame.new(1, 0, 0), CFrame.new(-1, 0, 0), CFrame.new(0, 0, 1), CFrame.new(0, 0, -1), CFrame.new(0.7, 0, 0.7), CFrame.new(-0.7, 0, 0.7), CFrame.new(0.7, 0, -0.7), CFrame.new(-0.7, 0, -0.7), CFrame.new(1, -0.6, 0), CFrame.new(-1, -0.6, 0), CFrame.new(0, -0.6, 1), CFrame.new(0, -0.6, -1), CFrame.new(0.7, -0.6, 0.7), CFrame.new(-0.7, -0.6, 0.7), CFrame.new(0.7, -0.6, -0.7), CFrame.new(-0.7, -0.6, -0.7) }
val_447 = Instance.new("BodyVelocity"); lastWallNormal = nil
function findWallHit()
	local hrp = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return nil, nil, nil end
	local Map = workspace:FindFirstChild("Map"); local ignoreList = { val_749, val_733.Character, workspace.Ray_Ignore, Map and Map:FindFirstChild("SpawnPoints") }; local closestDist = math.huge; local closestPart, closestNormal, closestPos = nil, nil, nil; local partsToCheck = {hrp}
	for _, partToCheck in partsToCheck do
		for _, dir in val_442 do
			local worldDir = (partToCheck.CFrame * dir).p - partToCheck.CFrame.p; local ray = Ray.new(partToCheck.CFrame.p, worldDir.unit * 2.0); local hitPart, hitPos, hitNormal = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
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
						closestDist = dist; closestPart = hitPart; closestNormal = hitNormal; closestPos = hitPos
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
end 
movementFeatures:AddToggle({
	text = "Jetpack"
}):AddBind({
	key = Enum.KeyCode.V, mode = "hold",
	callback = function(var_44)
		env.jetpackBindHeld = not var_44
	end
})
movementFeatures:AddToggle({
	text = "Pixelsurf"
}):AddBind({
	key = Enum.KeyCode.T, mode = "hold",
	callback = function(var_44)
		env.surfingBindHeld = not var_44
	end
})
movementFeatures:AddToggle({
	text = "Long Jump"
}):AddBind({
	key = Enum.KeyCode.Z, mode = "hold",
	callback = function() end
})
game:GetService("RunService").RenderStepped:Connect(function()
	local uis = game:GetService("UserInputService")
	if not uis:GetFocusedTextBox() then
		local opt = UI_Library.options and UI_Library.options["Long Jump"]
		if opt and opt.key then
			local st, k = pcall(function()
				if type(opt.key) == "string" then
					return Enum.KeyCode[opt.key]
				elseif typeof(opt.key) == "EnumItem" then
					return opt.key
				end
			end)
			if st and k then
				env.longJumpHold = uis:IsKeyDown(k); return
			end
		end
		env.longJumpHold = uis:IsKeyDown(Enum.KeyCode.Z)
	else
		env.longJumpHold = false
	end
end)
movementFeatures:AddToggle({
	text = "Jumpbug",
}):AddBind({
	key = Enum.UserInputType.MouseButton3, mode = "hold",
	callback = function(bool)
		env.jbBindHeld = not bool
	end
})
movementFeatures:AddToggle({
	text = "Minijump", flag = "Minijump"
}):AddBind({
	key = Enum.KeyCode.X, mode = "hold",
	callback = function(bool)
		if not bool and library_flags["Minijump"] then
			local lastTime = env.lastMinijumpTime or 0
			if tick() - lastTime > 0.15 then
				env.lastMinijumpTime = tick(); env.minijumpActive = true; env.mjArmedTime = tick()
			end
		end
	end
})
movementFeatures:AddToggle({
	text = "Fireman", flag = "Fireman"
}):AddBind({
	key = Enum.KeyCode.V, mode = "hold",
	callback = function(bool)
		env.fmActiveHold = not bool
	end
})
movementFeatures:AddToggle({
	text = "Head Boost", flag = "Head Boost"
}):AddBind({
	key = Enum.KeyCode.H, mode = "hold",
	callback = function(bool)
		if library_flags["Head Boost"] then
			env.headboundActive = not bool
		end
	end
})
movementFeatures:AddToggle({
	text = "Noclip"
}):AddBind({
	key = Enum.KeyCode.V, mode = "hold",
	callback = function(var_20)
		if not val_872.alive or not library_flags["Noclip"] then
			noclipping = false; return
		end 
		noclipping = not var_20
	end
})
movementFeatures:AddToggle({
	text = "Airstuck",
	callback = function()
		if val_733.Character then
			local hrp = val_733.Character:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.Anchored = false end
		end
	end
}):AddBind({
	key = Enum.KeyCode.C, mode = "hold",
	callback = function(bool)
		if library_flags["Airstuck"] then
			local char = val_733.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart"); local torso = char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"))
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
movementFeatures:AddToggle({
	text = "Texturebug",
	callback = function()
		env.tbActive = false
		if val_733.Character then
			local hrp = val_733.Character:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.Anchored = false end
		end
	end
}):AddBind({
	key = Enum.KeyCode.Y, mode = "hold",
	callback = function(bool)
		if library_flags["Texturebug"] then
			local char = val_733.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart"); local torso = char and (char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso"))
			if char and hrp then
				if not bool then
					if env.tbActive or env.tbCooldown then return end
					env.tbActive = true; local surfStartTime = 0
					spawn(function()
						while env.tbActive and char.Parent do
							local pos = hrp.Position; local head = char:FindFirstChild("Head"); local headPos = head and head.Position or pos; local params = RaycastParams.new()
							params.FilterDescendantsInstances = {char, workspace.CurrentCamera}
							params.FilterType = Enum.RaycastFilterType.Exclude; local dirs = {hrp.CFrame.LookVector, -hrp.CFrame.LookVector, hrp.CFrame.RightVector, -hrp.CFrame.RightVector}; local bodyNearWall = false; local headNearWall = false
							for _, dir in dirs do
								if workspace:Raycast(pos, dir * 4.5, params) then bodyNearWall = true end
								if head and workspace:Raycast(headPos, dir * 4.5, params) then headNearWall = true end
							end
							local nearWall = bodyNearWall or headNearWall; local headOnly = headNearWall and not bodyNearWall
							if nearWall then
								if surfStartTime == 0 then surfStartTime = tick() end
								if tick() - surfStartTime > 2 then
									local vel = hrp.AssemblyLinearVelocity; hrp.AssemblyLinearVelocity = Vector3.new(vel.X * 0.5, vel.Y, vel.Z * 0.5); env.tbActive = false
									env.tbCooldown = true
									break
								end
							else
								surfStartTime = 0
							end
							env.tbSurfing = nearWall
							if nearWall then
								local vel = hrp.AssemblyLinearVelocity
								if headOnly then
									hrp.AssemblyLinearVelocity = Vector3.new(vel.X, 0, vel.Z)
									if torso then torso.AssemblyLinearVelocity = Vector3.new(vel.X, 0, vel.Z) end
								else
									if tick() % 0.35 < 0.2 then
										hrp.AssemblyLinearVelocity = Vector3.new(vel.X, 2, vel.Z)
										if torso then torso.AssemblyLinearVelocity = Vector3.new(vel.X, 2, vel.Z) end
									else
										hrp.AssemblyLinearVelocity = Vector3.new(vel.X, -20, vel.Z)
										if torso then torso.AssemblyLinearVelocity = Vector3.new(vel.X, -20, vel.Z) end
									end
								end
							end
							game:GetService("RunService").Heartbeat:Wait()
						end
						env.tbSurfing = false
					end)
				else
					env.tbCooldown = false
					env.tbActive = false; env.tbSurfing = false; hrp.Anchored = false
				end
			end
		end
	end
})
movementFeatures:AddToggle({
	text = "Wallclimb", flag = "Wallclimb"
}):AddBind({
	key = Enum.KeyCode.H, mode = "hold", flag = "Wallclimb Bind",
	callback = function(bool)
		env.wcBindHeld = not bool
	end
})
movementFeatures:AddToggle({
	text = "Ladder Bug", flag = "Ladder Bug"
}):AddBind({
	key = Enum.KeyCode.E, mode = "hold", flag = "Ladder Bug Bind",
	callback = function(bool)
		env.lbBindHeld = not bool
	end
})
movementFeatures:AddToggle({
	text = "Edge Jump", flag = "Edge Jump"
}):AddBind({
	key = "none", mode = "hold", flag = "Edge Jump Bind",
	callback = function(bool)
		env.ejBindHeld = not bool
	end
})
movementFeatures:AddToggle({
	text = "Auto Duck", flag = "Auto Duck"
}):AddBind({
	key = "none", mode = "hold", flag = "Auto Duck Bind",
	callback = function(bool)
		env.adBindHeld = not bool
	end
})


game:GetService("RunService").RenderStepped:Connect(function()
	if drawingState == 1 and currentPreview then
		local p2 = mouse.Hit.Position
		if currentType == "pixel" then
		    local dist = (point1 - p2).Magnitude
			if dist > 0.1 then
				currentPreview.Size = Vector3.new(2, 0.05, dist)
				currentPreview.CFrame = CFrame.lookAt(point1, p2) * CFrame.new(0, 0, -dist/2)
			end
		else
			local flatP2 = Vector3.new(p2.X, point1.Y, p2.Z)
			local dist2 = (point1 - flatP2).Magnitude
			if dist2 > 0.1 then
				currentPreview.Size = Vector3.new(3, 1, dist2)
				currentPreview.CFrame = CFrame.lookAt(point1, flatP2) * CFrame.new(0, 0, -dist2/2)
			end
		end
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if drawingState == 1 and currentPreview then
		local p2 = mouse.Hit.Position
		if currentType == "pixel" then
		    local dist = (point1 - p2).Magnitude
			if dist > 0.1 then
				currentPreview.Size = Vector3.new(2, 0.05, dist)
				currentPreview.CFrame = CFrame.lookAt(point1, p2) * CFrame.new(0, 0, -dist/2)
			end
		else
			local flatP2 = Vector3.new(p2.X, point1.Y, p2.Z)
			local dist2 = (point1 - flatP2).Magnitude
			if dist2 > 0.1 then
				currentPreview.Size = Vector3.new(3, 1, dist2)
				currentPreview.CFrame = CFrame.lookAt(point1, flatP2) * CFrame.new(0, 0, -dist2/2)
			end
		end
	end
end)

miscTab = UI_Library:AddTab"Misc"; generalMiscSubTab = miscTab:AddSubTab("General"); generalCol1 = generalMiscSubTab:AddColumn(); generalCol2 = generalMiscSubTab:AddColumn(); exploitSubTab = miscTab:AddSubTab("Exploits"); exploitColumn = exploitSubTab:AddColumn(); exploitMain = exploitColumn:AddSection"Main"
exploitMain:AddToggle({
	text = "Kill All", flag = "KillAllAuto"
}):AddBind({
	key = "none", mode = "toggle", flag = "KillAllAuto Bind",
	callback = function(active)
		local toggle = UI_Library.options["KillAllAuto"]; local bind = UI_Library.options["KillAllAuto Bind"]
		if bind.key == "none" then return end
		if bind.mode == "toggle" then
			toggle:SetState(not toggle.state)
		elseif toggle.state ~= active then
			toggle:SetState(active == true)
		end
	end
})
nameSpoofSec = generalCol1:AddSection("Name Spoofer"); nameSpoofSec:AddToggle({text = "Enabled", flag = "spoofName"}); nameSpoofSec:AddBox({text = "Spoofed Name", flag = "spoofedNameValue"}); nameSpoofSec:AddToggle({text = "Clan Tag Changer", flag = "clanTagEnabled"}); nameSpoofSec:AddList({text = "Clan Tag", flag = "clanTagValue", values = {"outmoon!", "fastcupmafia" , "clarity.tk", "japanhackmafia", "cuteware!"}, value = "clarity.tk"}); visualsViewmodel = generalCol2:AddSection"Viewmodel"; visualsViewmodel:AddToggle({ text = "Enabled", flag = "viewmodelEnabled" }); visualsViewmodel:AddToggle({ text = "Visualize Silent Angles" })
visualsViewmodel:AddToggle({ text = "Disable Arm Animation", flag = "Disable Arm Animation", tip = "Stops the arm/viewmodel bob & sway while walking and jumping" })
game:GetService("RunService").RenderStepped:Connect(function()
	if library_flags["Disable Arm Animation"] then
		pcall(function()
			val_757.mgn = 0; val_757.sway = 0; val_757.tme = 0; val_757.breath = 0
		end)
		pcall(function()
			for _, v in workspace.Camera:GetChildren() do
				if v:IsA("Model") and (v.Name:match("Arms") or v:FindFirstChild("AnimationController")) then
					local anim = v:FindFirstChildOfClass("AnimationController")
					if anim then
						for _, track in anim:GetPlayingAnimationTracks() do
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
visualsViewmodel:AddSlider({ text = "X", min = -25, max = 25, flag = "viewmodelX" }); visualsViewmodel:AddSlider({ text = "Y", min = -25, max = 25, flag = "viewmodelY" }); visualsViewmodel:AddSlider({ text = "Z", min = -25, max = 25, flag = "viewmodelZ" }); visualsViewmodel:AddSlider({ text = "Roll", min = 0, max = 360, flag = "viewmodelRoll" }); EB_LogGui = Instance.new("ScreenGui"); EB_LogGui.Name = "EBLog"; EB_LogGui.ResetOnSpawn = false; EB_LogGui.IgnoreGuiInset = true
pcall(function() EB_LogGui.Parent = game:GetService("CoreGui") end)
if not EB_LogGui.Parent then
	pcall(function() EB_LogGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") end)
end
ebLogContainer = Instance.new("Frame", EB_LogGui); ebLogContainer.Name = "HitlogContainer"; ebLogContainer.BackgroundTransparency = 1; ebLogContainer.Size = UDim2.new(0, 300, 0, 400); ebLogContainer.Position = UDim2.new(0, 15, 0, 70); ebList = Instance.new("UIListLayout", ebLogContainer); ebList.VerticalAlignment = Enum.VerticalAlignment.Top; ebList.HorizontalAlignment = Enum.HorizontalAlignment.Left; ebList.Padding = UDim.new(0, 3); ebList.SortOrder = Enum.SortOrder.LayoutOrder; ebLogOrder = 0
local function EBlog(text, duration)
    task.spawn(function()
        if not ebLogContainer then return end
        if not library_flags["showEBLogs"] then return end
        duration = duration or 2.5; ebLogOrder = ebLogOrder - 1; local logFrame = Instance.new("Frame", ebLogContainer); logFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0); logFrame.BackgroundTransparency = 0; logFrame.Size = UDim2.new(0, 280, 0, 22); logFrame.LayoutOrder = ebLogOrder; local corner = Instance.new("UICorner", logFrame); corner.CornerRadius = UDim.new(0, 4); local stroke = Instance.new("UIStroke", logFrame); stroke.Thickness = 1; stroke.Color = Color3.fromRGB(65, 65, 65); stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; local label = Instance.new("TextLabel", logFrame); label.Text = " " .. text; label.Font = Enum.Font.Code; label.TextSize = 13; label.TextColor3 = Color3.new(1, 1, 1); label.BackgroundTransparency = 1; label.Size = UDim2.new(1, -5, 1, -2); label.Position = UDim2.new(0, 5, 0, 1); label.TextXAlignment = Enum.TextXAlignment.Left; task.wait(duration)
        if logFrame then
            local ts = game:GetService("TweenService"); local it = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out); ts:Create(logFrame, it, {BackgroundTransparency = 1}):Play(); ts:Create(label, it, {TextTransparency = 1}):Play(); ts:Create(stroke, it, {Transparency = 1}):Play(); task.wait(0.5); logFrame:Destroy()
        end
    end)
end
do
	local ebDebounce = false; local ebWasFalling = false; local ebEdgePos = nil; local ebLastSound = 0; local ebChainCount = 0; local ebLoggedSeek = false; local ebLastEdgeLog = 0
	local ebCooldown = 0
	for _, v in workspace:GetChildren() do
		if v.Name == "EB_LockVis" then v:Destroy() end
	end
	if env._ebHeartbeat then
		env._ebHeartbeat:Disconnect(); env._ebHeartbeat = nil
	end
	local lockPart = Instance.new("Part"); lockPart.Name = "EB_LockVis"; lockPart.Anchored = true; lockPart.CanCollide = false; lockPart.Size = Vector3.new(2, 2, 2); lockPart.Color = Color3.fromRGB(0, 0, 0); lockPart.Transparency = 1; lockPart.Parent = workspace; local lockBox = Instance.new("SelectionBox")
	lockBox.Adornee = lockPart
	lockBox.Color3 = Color3.fromRGB(0, 0, 0); lockBox.LineThickness = 0.15; lockBox.SurfaceTransparency = 1; lockBox.Transparency = 1; lockBox.Parent = lockPart; local edgePlat = Instance.new("Part"); edgePlat.Name = "EBEdgePlat"; edgePlat.Anchored = true; edgePlat.CanCollide = false; edgePlat.CanQuery = false; edgePlat.CanTouch = false; edgePlat.Size = Vector3.new(2.5, 0.4, 2.5); edgePlat.Transparency = 1; edgePlat.Material = Enum.Material.SmoothPlastic; edgePlat.Color = Color3.fromRGB(255, 0, 0); edgePlat.CFrame = CFrame.new(0, -10000, 0); edgePlat.Parent = workspace
	local function hideEdgePlat()
		edgePlat.CanCollide = false; edgePlat.CFrame = CFrame.new(0, -10000, 0)
	end
	local scanDirs = { Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0), Vector3.new(0, 0, 1), Vector3.new(0, 0, -1), Vector3.new(0.707, 0, 0.707), Vector3.new(-0.707, 0, 0.707), Vector3.new(0.707, 0, -0.707), Vector3.new(-0.707, 0, -0.707), Vector3.new(0.924, 0, 0.383), Vector3.new(-0.924, 0, 0.383), Vector3.new(0.924, 0, -0.383), Vector3.new(-0.924, 0, -0.383), Vector3.new(0.383, 0, 0.924), Vector3.new(-0.383, 0, 0.924), Vector3.new(0.383, 0, -0.924), Vector3.new(-0.383, 0, -0.924), }
	EB_MAX_SPEED = 150
	if not library_flags["Edgebug Mode"] then
		library_flags["Edgebug Mode"] = "redirectional"
	end
	env._ebHeartbeat = game:GetService("RunService").Heartbeat:Connect(function()
		local _ebOk, _ebErr = pcall(function()
		local ebMode = library_flags["Edgebug Mode"] or "redirectional"
		if not library_flags["Edgebug"] or (not env.ebHolding and not library_flags["Auto Edge Bug"]) or ebMode ~= "redirectional" then
			ebWasFalling = false; ebEdgePos = nil; ebChainCount = 0; ebLoggedSeek = false; lockPart.Transparency = 1; lockBox.Transparency = 1; hideEdgePlat(); return
		end
		local char = val_733 and val_733.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart"); local hum = char and char:FindFirstChild("Humanoid")
		if not hrp or not hum then return end
		if env.ebRedirHum ~= hum then
			env.ebRedirHum = hum
			if env.ebRedirConn then env.ebRedirConn:Disconnect() end
			env.ebRedirConn = hum.StateChanged:Connect(function(old, new)
				if new == Enum.HumanoidStateType.Landed or (old == Enum.HumanoidStateType.Freefall and new == Enum.HumanoidStateType.Running) then
					local root = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart")
					env.ebLandTick = tick(); env.ebLandVel = root and root.AssemblyLinearVelocity or Vector3.zero
				end
			end)
		end
		local state = hum:GetState(); local vel = hrp.AssemblyLinearVelocity; local showVis = library_flags["showEBVis"]; local isAuto = library_flags["Auto Edge Bug"] and not env.ebHolding; local fallThreshold = isAuto and -25 or -8
		local justLanded = state == Enum.HumanoidStateType.Landed or (env.ebLandTick ~= nil and tick() - env.ebLandTick < 0.15)
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
				rp.FilterType = Enum.RaycastFilterType.Exclude; local startPos = hrp.Position; local bestEdgePoint = nil; local bestEdgeDir = nil; local bestScore = math.huge; local allDirs = {}; local flatVel = Vector3.new(vel.X, 0, vel.Z); local camLook = workspace.CurrentCamera.CFrame.LookVector; local flatCam = Vector3.new(camLook.X, 0, camLook.Z); local hasCam = flatCam.Magnitude > 0.1; local hasVel = flatVel.Magnitude > 1; local velDir = hasVel and flatVel.Unit or nil; local camDir = hasCam and flatCam.Unit or nil; local moveDir
				if velDir and camDir then
					local blend = (velDir * 0.6 + camDir * 0.4)
					moveDir = blend.Magnitude > 0.05 and blend.Unit or velDir
				else
					moveDir = velDir or camDir or Vector3.new(0, 0, 1)
				end
				local primaries = {}
				if velDir then table.insert(primaries, velDir) end
				if camDir then table.insert(primaries, camDir) end
				table.insert(primaries, moveDir); local seen = {}
				for _, dir in primaries do
					local key = string.format("%.2f_%.2f", dir.X, dir.Z)
					if not seen[key] then
						seen[key] = true; table.insert(allDirs, dir)
						for deg = 10, 60, 10 do
							table.insert(allDirs, (CFrame.lookAt(Vector3.zero, dir) * CFrame.Angles(0, math.rad(deg), 0)).LookVector); table.insert(allDirs, (CFrame.lookAt(Vector3.zero, dir) * CFrame.Angles(0, math.rad(-deg), 0)).LookVector)
						end
					end
				end
				local MIN_DIST = 1.2; local MAX_DIST = (ebChainCount > 0) and 6.0 or 8.0; local STEP = 0.35; local feetY = startPos.Y - 3
				for _, scanDir in allDirs do
					for dist = MIN_DIST, MAX_DIST, STEP do
						local pPos = startPos + (scanDir * dist); local pRay = workspace:Raycast(pPos, Vector3.new(0, -40, 0), rp); local fPos = startPos + (scanDir * (dist + STEP)); local fRay = workspace:Raycast(fPos, Vector3.new(0, -40, 0), rp)
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
							local toEdge = pt - startPos; local horizDir = Vector3.new(toEdge.X, 0, toEdge.Z)
							if horizDir.Magnitude >= MIN_DIST then
								local obstruct = workspace:Raycast(startPos, horizDir, rp); local blocked = false
								if obstruct then
									local distToHit = (obstruct.Position - startPos).Magnitude; local distToEdge = horizDir.Magnitude
									if distToHit < distToEdge - 0.6 and obstruct.Position.Y > pt.Y - 1.5 then
										blocked = true
									end
								end
								local edgeWallCheck = workspace:Raycast(pt + Vector3.new(0, 0.5, 0), Vector3.new(0, 2, 0), rp)
								if edgeWallCheck then blocked = true end
								if not blocked then
									local probeY = pt + Vector3.new(0, 1.5, 0); local perp = Vector3.new(-scanDir.Z, 0, scanDir.X) * 0.8; local sc1 = workspace:Raycast(probeY, perp, rp); local sc2 = workspace:Raycast(probeY, -perp, rp)
									if sc1 and sc2 then blocked = true end
								end
								if not blocked then
									local upCheck = workspace:Raycast(pt + Vector3.new(0, 0.6, 0), Vector3.new(0, 0.5, 0), rp)
									if not upCheck then
										local bodyA = workspace:Raycast(pt + Vector3.new(0, 0.8, 0), scanDir * 2.2, rp); local bodyB = workspace:Raycast(pt + Vector3.new(0, 2.2, 0), scanDir * 2.2, rp); local bodyC = workspace:Raycast(pt + Vector3.new(0, 3.6, 0), scanDir * 2.2, rp); local lipWall = (bodyA and bodyA.Normal.Y < 0.25) or (bodyB and bodyB.Normal.Y < 0.25) or (bodyC and bodyC.Normal.Y < 0.25); local sideDir = Vector3.new(-scanDir.Z, 0, scanDir.X)
										if sideDir.Magnitude < 0.05 then sideDir = Vector3.new(1, 0, 0) end
										sideDir = sideDir.Unit; local cornerLeft = workspace:Raycast(pt + (scanDir * 0.45) + Vector3.new(0, 1.4, 0), sideDir * 1.2, rp); local cornerRight = workspace:Raycast(pt + (scanDir * 0.45) + Vector3.new(0, 1.4, 0), -sideDir * 1.2, rp)
										local doorwayLike = cornerLeft and cornerRight and cornerLeft.Normal.Y < 0.25 and cornerRight.Normal.Y < 0.25
										local dropRay = workspace:Raycast(pt + (scanDir * 1.05) + Vector3.new(0, 0.2, 0), Vector3.new(0, -120, 0), rp); local dropDepth = dropRay and (pt.Y - dropRay.Position.Y) or 120; local minDrop = (ebChainCount > 0) and 1.5 or 0.35
										if not lipWall and not doorwayLike and dropDepth >= minDrop then
											local edgeDir = horizDir.Unit; local camAlign = camDir and math.max(0, edgeDir:Dot(camDir)) or 0; local velAlign = velDir and math.max(0, edgeDir:Dot(velDir)) or 0; local alignment
											if camDir and velDir then
												alignment = camAlign * 0.55 + velAlign * 0.45
											else
												alignment = camAlign + velAlign
											end
											local d = horizDir.Magnitude; local score = d - (alignment * 4.0) - math.min(dropDepth, 30) * 0.05
											if score < bestScore then
												bestScore = score; bestEdgePoint = pt; bestEdgeDir = scanDir
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
					local edgeDist = (Vector3.new(bestEdgePoint.X, 0, bestEdgePoint.Z) - Vector3.new(startPos.X, 0, startPos.Z)).Magnitude; local finalDirRaw = Vector3.new(bestEdgePoint.X - startPos.X, 0, bestEdgePoint.Z - startPos.Z); local finalDir = finalDirRaw.Magnitude > 0.1 and finalDirRaw.Unit or (bestEdgeDir or Vector3.new(0,0,1)); local finalWallLow = workspace:Raycast(bestEdgePoint + Vector3.new(0, 0.9, 0), finalDir * 1.8, rp); local finalWallMid = workspace:Raycast(bestEdgePoint + Vector3.new(0, 2.4, 0), finalDir * 1.8, rp)
					if (finalWallLow and finalWallLow.Normal.Y < 0.25) or (finalWallMid and finalWallMid.Normal.Y < 0.25) then
						if library_flags["showEBLogs"] then warn("[EB DEBUG] Reject edge: wall/doorway in front") end
						ebEdgePos = nil; hideEdgePlat(); return
					end
					local pathStart = Vector3.new(startPos.X, bestEdgePoint.Y, startPos.Z); local pathVec = (bestEdgePoint - pathStart); local pathLen = Vector3.new(pathVec.X, 0, pathVec.Z).Magnitude
					if pathLen > 0.2 then
						local pathDir = Vector3.new(pathVec.X, 0, pathVec.Z).Unit; local railHeights = {0.4, 1.1, 1.9, 2.7}
						for _, h in railHeights do
							local origin = pathStart + Vector3.new(0, h, 0); local hit = workspace:Raycast(origin, pathDir * (pathLen + 0.4), rp)
							if hit and hit.Instance and hit.Instance.CanCollide then
								local n = string.lower(hit.Instance.Name); local pn = hit.Instance.Parent and string.lower(hit.Instance.Parent.Name) or ""; local namedRail = string.find(n, "rail") or string.find(n, "fence") or string.find(n, "bar") or string.find(n, "grill") or string.find(pn, "rail") or string.find(pn, "fence"); local thin = hit.Instance.Size and (math.min(hit.Instance.Size.X, hit.Instance.Size.Z) < 0.8)
								if namedRail or thin or hit.Normal.Y < 0.35 then
									if library_flags["showEBLogs"] then warn("[EB DEBUG] Reject edge: railing/fence in path (" .. hit.Instance.Name .. ")") end
									ebEdgePos = nil; hideEdgePlat(); return
								end
							end
						end
					end
					for _, h in {0.5, 1.3, 2.1} do
						local railHit = workspace:Raycast(bestEdgePoint + Vector3.new(0, h, 0) - finalDir * 0.6, finalDir * 1.2, rp)
						if railHit and railHit.Instance and railHit.Instance.CanCollide and railHit.Normal.Y < 0.35 then
							local sz = railHit.Instance.Size
							if sz and math.min(sz.X, sz.Z) < 0.9 then
								if library_flags["showEBLogs"] then warn("[EB DEBUG] Reject edge: railing on edge") end
								ebEdgePos = nil; hideEdgePlat(); return
							end
						end
					end
					ebEdgePos = bestEdgePoint; lockPart.CFrame = CFrame.new(bestEdgePoint + Vector3.new(0, 3.5, 0)); local allowEdgePlat = ebChainCount == 0 or (ebLastEdgeY and bestEdgePoint.Y < ebLastEdgeY - 0.7)
					if allowEdgePlat then
						local rawPlatDir = flatVel.Magnitude > 2 and flatVel.Unit or (camDir or bestEdgeDir or Vector3.new(0,0,1)); local toEdgeDir = Vector3.new(bestEdgePoint.X - startPos.X, 0, bestEdgePoint.Z - startPos.Z)
						if toEdgeDir.Magnitude > 0.1 then
							local edgeUnit = toEdgeDir.Unit
							if rawPlatDir:Dot(edgeUnit) < 0.25 then
								rawPlatDir = edgeUnit
							end
						end
						local platDir = rawPlatDir; local platCenter = bestEdgePoint + (platDir * 0.85) + Vector3.new(0, -edgePlat.Size.Y * 0.5, 0); local probe = platCenter + Vector3.new(0, 0.35, 0); local frontBlock = workspace:Raycast(bestEdgePoint + Vector3.new(0, 0.6, 0), platDir * 1.4, rp); local topBlock = workspace:Raycast(probe, Vector3.new(0, 2.5, 0), rp); local backGround = workspace:Raycast(bestEdgePoint - platDir * 0.35 + Vector3.new(0, 0.25, 0), Vector3.new(0, -2, 0), rp); local frontGround = workspace:Raycast(bestEdgePoint + platDir * 1.15 + Vector3.new(0, 0.25, 0), Vector3.new(0, -3, 0), rp)
						if not frontBlock and not topBlock and backGround and (not frontGround or frontGround.Position.Y < bestEdgePoint.Y - 0.45) then
							edgePlat.Size = ebChainCount > 0 and Vector3.new(1.15, 0.22, 1.15) or Vector3.new(1.8, 0.28, 1.8); edgePlat.CFrame = CFrame.new(platCenter); edgePlat.CanCollide = true
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
				local pullVec = (Vector3.new(ebEdgePos.X, 0, ebEdgePos.Z) - Vector3.new(hrp.Position.X, 0, hrp.Position.Z)); local pullDist = pullVec.Magnitude; local feetY = hrp.Position.Y - 3; local altitude = feetY - ebEdgePos.Y; local ENGAGE_ALT = 22; local engaged = altitude <= ENGAGE_ALT and altitude > -5.0
				if showVis and engaged then lockBox.Transparency = 0 else lockBox.Transparency = 1 end
				if pullDist > 12.0 or altitude < -5.0 then
					if library_flags["showEBLogs"] then warn(string.format("[EB DEBUG] UNLOCK | pullDist=%.1f feetY=%.1f edgeY=%.1f reason=%s", pullDist, feetY, ebEdgePos.Y, pullDist > 12 and "too_far" or "below_edge")) end
					ebEdgePos = nil; lockBox.Transparency = 1; hideEdgePlat()
				elseif engaged then
					local flatHRP = Vector3.new(vel.X, 0, vel.Z)
					if pullDist > 0.1 and flatHRP.Magnitude > 5.0 then
						local altProx = math.clamp(1 - (altitude / ENGAGE_ALT), 0, 1); local distProx = math.clamp(1 - (pullDist / 12.0), 0, 1); local proximity = altProx * 0.6 + distProx * 0.4; local cfLerp = 0.03 + 0.07 * proximity; local velLerp = 0.025 + 0.065 * proximity; local targetPos = Vector3.new(ebEdgePos.X, hrp.Position.Y, ebEdgePos.Z); hrp.CFrame = hrp.CFrame:Lerp(CFrame.new(targetPos) * (hrp.CFrame - hrp.CFrame.Position), cfLerp); local curDir = flatHRP.Unit; local newDir = curDir:Lerp(pullVec.Unit, velLerp).Unit; hrp.AssemblyLinearVelocity = Vector3.new(newDir.X * flatHRP.Magnitude, vel.Y, newDir.Z * flatHRP.Magnitude)
					end
				end
				if ebEdgePos then
					lockPart.CFrame = CFrame.new(ebEdgePos + Vector3.new(0, 3.5, 0))
				end
			else
				lockBox.Transparency = 1
			end
		elseif (state == Enum.HumanoidStateType.Running or state == Enum.HumanoidStateType.Climbing) and not justLanded then
			ebWasFalling = false; ebEdgePos = nil; ebChainCount = 0; ebLastEdgeY = nil; ebLoggedSeek = false; lockBox.Transparency = 1; hideEdgePlat()
		end
		if ebWasFalling and ebEdgePos and justLanded then
			local landVel = env.ebLandVel or vel; env.ebLandTick = nil
			local landDist = (Vector3.new(hrp.Position.X, 0, hrp.Position.Z) - Vector3.new(ebEdgePos.X, 0, ebEdgePos.Z)).Magnitude; local feetY = hrp.Position.Y - 3; local edgeDelta = math.abs(feetY - ebEdgePos.Y)
			if library_flags["showEBLogs"] then warn(string.format("[EB DEBUG] LANDED | landDist=%.2f velY=%.1f flatSpeed=%.1f edgeDelta=%.2f", landDist, landVel.Y, Vector3.new(landVel.X,0,landVel.Z).Magnitude, edgeDelta)) end
			local landRay = workspace:Raycast(hrp.Position, Vector3.new(0, -6, 0), rp); local onEdgeSurface = landRay and math.abs(landRay.Position.Y - ebEdgePos.Y) < 0.4
			if landDist < 3.5 and (onEdgeSurface or edgeDelta < 1.1) then
				EBlog("Edge Bug: Sliding on edge"); ebLastEdgeY = ebEdgePos.Y; ebEdgePos = nil; lockBox.Transparency = 1; hideEdgePlat()
				if ebDebounce then return end
				ebDebounce = true; ebChainCount = ebChainCount + 1
				if ebChainCount > 1 then
					if ebChainCount == 2 then
						EBlog("Edge Bug: Double Edgebug!")
					elseif ebChainCount == 3 then
						EBlog("Edge Bug: Triple Edgebug!")
					else
						EBlog("Edge Bug: Combo x" .. tostring(ebChainCount) .. "!")
					end
				end
				env.hookJP = 0; hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false); task.wait()
				if not (hrp and hrp.Parent) then
					ebDebounce = false; hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true); return
				end
				local vX, vZ = landVel.X, landVel.Z; local flatSpeed = Vector3.new(vX, 0, vZ).Magnitude; local boostMult = flatSpeed > 5 and 1.0 or 1.15; local flatDir = Vector3.new(vX, 0, vZ); local moveDir = flatDir.Magnitude > 0.5 and flatDir.Unit or hrp.CFrame.LookVector
				if library_flags["showEBLogs"] then warn(string.format("[EB DEBUG] SLIDE | flatSpeed=%.1f boost=%.2f landDist=%.2f chain=%d edgeDelta=%.2f", flatSpeed, boostMult, landDist, ebChainCount, edgeDelta)) end
				local slide = Vector3.new(vX * boostMult + moveDir.X * 2.5, 0, vZ * boostMult + moveDir.Z * 2.5)
				if slide.Magnitude > EB_MAX_SPEED then slide = slide.Unit * EB_MAX_SPEED end
				hum:ChangeState(Enum.HumanoidStateType.Freefall); hrp.AssemblyLinearVelocity = slide; hrp.CFrame = hrp.CFrame + (moveDir * 0.5); env.hookJP = nil; hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true); env.lastEdgebugTime = tick()
				if env.showEdgebugBadge then env.showEdgebugBadge() end
				ebCooldown = tick()
				task.delay(0.15, function()
					ebDebounce = false
				end)
			else
				ebEdgePos = nil; lockBox.Transparency = 1; hideEdgePlat()
			end
		end
		end)
		if not _ebOk then
			ebEdgePos = nil; ebChainCount = 0; ebDebounce = false
			pcall(function() lockBox.Transparency = 1 end)
			pcall(function() lockPart.Transparency = 1 end)
			pcall(hideEdgePlat)
			pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true) end)
			env.hookJP = nil
		end
	end)
end
miscExtra = generalCol1:AddSection("Extra"); miscExtra:AddToggle({ text = "Remove Radio Commands" }); miscExtra:AddToggle({ text = "Remove UI Elements", callback = removeUIElementsCallback }); miscExtra:AddToggle({ text = "Remove Sleeves", callback = updateViewModelVisuals }); miscGeneralFeatures = generalCol2:AddSection("More Features"); miscGeneralFeatures:AddToggle({ text = "Old Gun Sounds" })
miscGeneralFeatures:AddToggle({
	text = "Hitsound"
}):AddList({
	flag = "hitsoundValue", max = 8, values = { "Bameware", "Bell", "Bubble", "Pick", "Pop", "Rust", "Sans", "Fart", "Big", "Vine", "Bruh", "Skeet", "Neverlose", "Fatality", "Bonk", "Moan", "Minecraft" }
})
miscGeneralFeatures:AddSlider({ text = "Hitsound Volume", min = 1, max = 10, float = 0.5 })
miscGeneralFeatures:AddToggle({
	text = "FOV Changer",
	callback = function(var_37)
		if var_37 then
			val_690:BindToRenderStep("fovchanger", 10, function()
				if not val_733.PlayerGui.GUI.Crosshairs.Scope.Visible then
					val_749.FieldOfView = library_flags["fovValue"]
				end
			end)
		else
			val_690:UnbindFromRenderStep("fovchanger")
		end 
		val_749.FieldOfView = 80
	end
}):AddSlider({ flag = "fovValue", min = 50, max = 120, value = 80 })
miscGeneralFeatures:AddToggle({
	text = "FOV Circle",
	callback = function()
		val_383.Position = Vector2.new(val_749.ViewportSize.X / 2, val_749.ViewportSize.Y / 2); val_388.Position = Vector2.new(val_749.ViewportSize.X / 2, val_749.ViewportSize.Y / 2); val_383.Visible = library_flags["FOV Circle"]; val_388.Visible = library_flags["FOV Circle"]
	end
}):AddColor({
	color = Color3.new(1, 1, 1), trans = 0.5, flag = "circleColor",
	callback = function()
		val_383.Color = library_flags["circleColor"]; val_388.Color = library_flags["circleColor"]
	end,
	calltrans = function()
		val_383.Transparency = 1 - UI_Library.options["circleColor"].trans; val_388.Transparency = 1 - UI_Library.options["circleColor"].trans
	end
})
cba, cbb = UI_Library.options["FOV Circle"].callback, UI_Library.options["FOV Circle"].calltrans; UI_Library.options["FOV Circle"]:AddColor({ flag = "silentCircleColor", color = Color3.new(1, 1, 0), trans = 0.5, callback = cba, calltrans = cbb }); oldcash = val_733.Cash.Value; loadingCFG = false 
exploitMain:AddToggle({
	text = "Double Tap",
	callback = function(state)
		if env.applyDoubleTap then
			env.applyDoubleTap(state)
		end
	end
})
exploitMain:AddToggle({ text = "No Fall Damage" }); exploitMain:AddToggle({ text = "Remove Flash", callback = removeFlashCallback }); exploitMain:AddToggle({ text = "No Fire Damage" })
exploitMain:AddToggle({
    text = "Rapid Fire", flag = "rapid_fire",
    callback = function(val)
        env.RapidFire = val
    end
})
exploitMain:AddToggle({ text = "Remove Recoil" }); exploitMain:AddToggle({ text = "Inf Ammo" })
exploitMain:AddToggle({
	text = "Remove Spread",
	callback = function()
		if library_flags["Remove Spread"] then
			ApplyValue(true, "Spread", val_929, 0.1)
		else
			ApplyValue(false, "Spread", val_929, 0.1)
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
            if not UI_Library.open and val_872.alive and val_872.trigger and val_288 then
                local mouse = game.Players.LocalPlayer:GetMouse(); local target = mouse.Target
                if target and target.Parent then
                    local character = target.Parent:FindFirstChild("Humanoid") and target.Parent or (target.Parent.Parent and target.Parent.Parent:FindFirstChild("Humanoid") and target.Parent.Parent)
                    if character then
                        local plr = game.Players:GetPlayerFromCharacter(character)
                        if plr and teamCheck(plr, val_767) and character.Humanoid.Health > 0 then
                            if val_757 and val_757.firebullet then
                                val_757.firebullet(game.Players.LocalPlayer.Character.EquippedTool.Value); task.wait(0.1)
                            end
                        end
                    end
                end
            end
        end)
    end
end)
MovementSimulator = {}; MovementSimulator.TICK_RATE = 1 / 64; MovementSimulator.GRAVITY = 800; MovementSimulator.JUMP_POWER = 300; MovementSimulator.MAX_SPEED = 250; MovementSimulator.MAX_AIR_SPEED = 30; MovementSimulator.ACCELERATION = 10; MovementSimulator.AIR_ACCELERATION = 100; MovementSimulator.FRICTION = 4; MovementSimulator.STOP_SPEED = 100; export type SimulationState = { pos: Vector3, vel: Vector3, isGrounded: boolean, isCrouching: boolean, tick: number }; export type UserInput = { wishdir: Vector3, jump: boolean, duck: boolean }
local function PM_Accelerate(vel: Vector3, wishdir: Vector3, wishspeed: number, accel: number, dt: number): Vector3
    local currentspeed = vel:Dot(wishdir); local addspeed = wishspeed - currentspeed
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
    local drop = 0; local control = (speed < MovementSimulator.STOP_SPEED) and MovementSimulator.STOP_SPEED or speed; drop = control * MovementSimulator.FRICTION * dt; local newspeed = math.max(speed - drop, 0)
    if newspeed ~= speed then
        newspeed = newspeed / speed
        return vel * newspeed
    end
    return vel
end
function MovementSimulator.ClipVelocity(vel: Vector3, normal: Vector3, overbounce: number): Vector3
    local backoff = vel:Dot(normal) * overbounce; local newVel = vel - (normal * backoff)
    if math.abs(newVel.X) < 0.1 then newVel = Vector3.new(0, newVel.Y, newVel.Z) end
    if math.abs(newVel.Y) < 0.1 then newVel = Vector3.new(newVel.X, 0, newVel.Z) end
    if math.abs(newVel.Z) < 0.1 then newVel = Vector3.new(newVel.X, newVel.Y, 0) end
    return newVel
end
function MovementSimulator:Step(state: SimulationState, input: UserInput, collisionFunc: any): SimulationState
    local dt = self.TICK_RATE; local newVel = state.vel
    if state.isGrounded then
        newVel = ApplyFriction(newVel, dt)
        if input.jump then
            newVel = Vector3.new(newVel.X, self.JUMP_POWER, newVel.Z); state.isGrounded = false
        else
            local groundWishdir = Vector3.new(input.wishdir.X, 0, input.wishdir.Z)
            if groundWishdir.Magnitude > 0 then groundWishdir = groundWishdir.Unit end
            newVel = PM_Accelerate(newVel, groundWishdir, self.MAX_SPEED, self.ACCELERATION, dt); newVel = Vector3.new(newVel.X, 0, newVel.Z)
        end
    else
        local airWishdir = Vector3.new(input.wishdir.X, 0, input.wishdir.Z)
        if airWishdir.Magnitude > 0 then airWishdir = airWishdir.Unit end
        newVel = PM_Accelerate(newVel, airWishdir, self.MAX_AIR_SPEED, self.AIR_ACCELERATION, dt); newVel -= Vector3.new(0, self.GRAVITY * dt, 0)
    end
    local hitboxSize = input.duck and Vector3.new(2, 3, 2) or Vector3.new(2, 5, 2); state.isCrouching = input.duck; local targetPos = state.pos + (newVel * dt); local collision = collisionFunc(state.pos, targetPos, hitboxSize)
    if collision.hit then
        state.pos = collision.hitPos; newVel = self.ClipVelocity(newVel, collision.normal, 1.0)
        if collision.normal.Y > 0.7 then
            state.isGrounded = true
        elseif collision.normal.Y < -0.7 then
            state.isGrounded = false; newVel = Vector3.new(newVel.X, math.min(newVel.Y, 0), newVel.Z)
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
    return { pos = state.pos, vel = newVel, isGrounded = state.isGrounded, isCrouching = state.isCrouching, tick = state.tick + 1 }
end
MapAnalyzer = {}; MapAnalyzer.GridSize = 20; MapAnalyzer.Cells = {}; export type AABB = { min: Vector3, max: Vector3, part: BasePart | nil }; export type CollisionResult = { hit: boolean, hitPos: Vector3, normal: Vector3, part: BasePart | nil }
local function HashCoords(x: number, y: number, z: number): string
    local gx = math.floor(x / MapAnalyzer.GridSize); local gy = math.floor(y / MapAnalyzer.GridSize); local gz = math.floor(z / MapAnalyzer.GridSize)
    return gx .. "_" .. gy .. "_" .. gz
end
function MapAnalyzer:InsertAABB(box: AABB)
    local minX, minY, minZ = box.min.X, box.min.Y, box.min.Z; local maxX, maxY, maxZ = box.max.X, box.max.Y, box.max.Z; local minGx = math.floor(minX / self.GridSize); local minGy = math.floor(minY / self.GridSize); local minGz = math.floor(minZ / self.GridSize); local maxGx = math.floor(maxX / self.GridSize); local maxGy = math.floor(maxY / self.GridSize); local maxGz = math.floor(maxZ / self.GridSize)
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
    self.Cells = {}; local count = 0
    for _, obj in rootFolder:GetDescendants() do
        if obj:IsA("BasePart") and obj.CanCollide then
            local cf = obj.CFrame; local size = obj.Size / 2; local rx, ry, rz = cf:ToEulerAnglesXYZ(); local isRotated = math.abs(rx)>0.01 or math.abs(ry)>0.01 or math.abs(rz)>0.01; local min, max
            if isRotated then
                local corners = { cf * Vector3.new(size.X, size.Y, size.Z), cf * Vector3.new(-size.X, size.Y, size.Z), cf * Vector3.new(size.X, -size.Y, size.Z), cf * Vector3.new(-size.X, -size.Y, size.Z), cf * Vector3.new(size.X, size.Y, -size.Z), cf * Vector3.new(-size.X, size.Y, -size.Z), cf * Vector3.new(size.X, -size.Y, -size.Z), cf * Vector3.new(-size.X, -size.Y, -size.Z), }
                min = corners[1]; max = corners[1]
                for i=2, 8 do
                    min = Vector3.new(math.min(min.X, corners[i].X), math.min(min.Y, corners[i].Y), math.min(min.Z, corners[i].Z)); max = Vector3.new(math.max(max.X, corners[i].X), math.max(max.Y, corners[i].Y), math.max(max.Z, corners[i].Z))
                end
            else
                min = obj.Position - size; max = obj.Position + size
            end
            self:InsertAABB({ min = min, max = max, part = obj }); count += 1
        end
    end
    print("NEVERGIVEUPPPPPPPPP", count, "parts.")
end
local function TestAABB(boxA: AABB, boxB: AABB): boolean
    return (boxA.min.X <= boxB.max.X and boxA.max.X >= boxB.min.X) and
(boxA.min.Y <= boxB.max.Y and boxA.max.Y >= boxB.min.Y) and (boxA.min.Z <= boxB.max.Z and boxA.max.Z >= boxB.min.Z)
end
function MapAnalyzer:SweepAABB(startPos: Vector3, endPos: Vector3, hitboxSize: Vector3): CollisionResult
    local halfExtents = hitboxSize / 2
    local dir = endPos - startPos
    local dist = dir.Magnitude
    if dist == 0 then return {hit = false, hitPos = endPos, normal = Vector3.zero, part = nil} end
    local normalDir = dir.Unit; local steps = math.ceil(dist / 0.5); local stepVec = dir / steps; local currPos = startPos
    for step = 1, steps do
        local testPos = currPos + stepVec; local playerBox = { min = testPos - halfExtents, max = testPos + halfExtents }; local hash = HashCoords(testPos.X, testPos.Y, testPos.Z); local candidates = self.Cells[hash]
        if candidates then
            for _, box in candidates do
                if TestAABB(playerBox, box) then
                    local overlapX1 = playerBox.max.X - box.min.X; local overlapX2 = box.max.X - playerBox.min.X; local overlapY1 = playerBox.max.Y - box.min.Y; local overlapY2 = box.max.Y - playerBox.min.Y; local overlapZ1 = playerBox.max.Z - box.min.Z; local overlapZ2 = box.max.Z - playerBox.min.Z; local minOverlap = math.min(overlapX1, overlapX2, overlapY1, overlapY2, overlapZ1, overlapZ2); local normal = Vector3.zero
                    if minOverlap == overlapY2 then normal = Vector3.new(0, 1, 0)
                    elseif minOverlap == overlapY1 then normal = Vector3.new(0, -1, 0)
                    elseif minOverlap == overlapX2 then normal = Vector3.new(1, 0, 0)
                    elseif minOverlap == overlapX1 then normal = Vector3.new(-1, 0, 0)
                    elseif minOverlap == overlapZ2 then normal = Vector3.new(0, 0, 1)
                    elseif minOverlap == overlapZ1 then normal = Vector3.new(0, 0, -1)
                    end
                    local safePos = currPos
                    return { hit = true, hitPos = safePos, normal = normal, part = box.part }
                end
            end
        end
        currPos = testPos
    end
    return { hit = false, hitPos = endPos, normal = Vector3.zero, part = nil }
end
RouteGenerator = {}
RouteGenerator.WALK_SPEED = 16; RouteGenerator.RUN_SPEED = 20; RouteGenerator.BHOP_SPEED = 45; RouteGenerator.DUCK_CLEARANCE = 3.2
function routeRayParams()
	local filters = { workspace.CurrentCamera, workspace:FindFirstChild("RouteMarkers"), workspace:FindFirstChild("RoutePath") }
	local char = game.Players.LocalPlayer.Character
	if char then table.insert(filters, char) end
	local params = RaycastParams.new()
	params.FilterDescendantsInstances = filters; params.FilterType = Enum.RaycastFilterType.Exclude; params.RespectCanCollide = true
	return params
end
function RouteGenerator:Airtime(dy, launch)
	local g = workspace.Gravity; local disc = launch * launch - 2 * g * dy
	if disc < 0 then return nil end
	return (launch + math.sqrt(disc)) / g
end
function RouteGenerator:IsLedge(pos, dir)
	local params = routeRayParams()
	local under = workspace:Raycast(pos + Vector3.new(0, 1.5, 0), Vector3.new(0, -4, 0), params)
	local ahead = workspace:Raycast(pos + dir * 3 + Vector3.new(0, 1.5, 0), Vector3.new(0, -8, 0), params)
	return under ~= nil and ahead == nil
end
function RouteGenerator:TracePath(from, to, launch, airtime)
	local g = workspace.Gravity; local flat = Vector3.new(to.X - from.X, 0, to.Z - from.Z); local points = {}
	local steps = math.clamp(math.floor(airtime * 32), 4, 96)
	for i = 0, steps do
		local t = airtime * i / steps
		local p = from + flat * (i / steps) + Vector3.new(0, launch * t - g * t * t / 2, 0)
		table.insert(points, { pos = p })
	end
	local params = routeRayParams(); local blocked = nil
	for i = 2, #points do
		local a = points[i - 1].pos; local b = points[i].pos
		local hit = workspace:Raycast(a, b - a, params)
		if hit and (b - to).Magnitude > 3 then
			blocked = hit.Position; break
		end
	end
	return points, blocked
end
function RouteGenerator:GenerateRoute(startPos, targetPos, targetNormal, targetType)
    targetNormal = targetNormal or Vector3.new(0, 1, 0)
    local dy = targetPos.Y - startPos.Y; local flat = Vector3.new(targetPos.X - startPos.X, 0, targetPos.Z - startPos.Z)
    local horizontal = flat.Magnitude; local dir = horizontal > 0.01 and flat.Unit or Vector3.new(0, 0, 1)
    local jumpApex = GAME_JUMP_POWER * GAME_JUMP_POWER / (2 * workspace.Gravity)
    if math.abs(targetNormal.Y) < 0.3 then
        local mode = dy > jumpApex and "duck" or "stand"
        return { { pos = startPos }, { pos = targetPos } }, string.format("pixelsurf (%s) | %.1fst up", mode, dy)
    end
    local launch = dy > 0.5 and GAME_JUMP_POWER or 0
    local airtime = self:Airtime(dy, launch)
    if not airtime and launch == 0 then
        launch = GAME_JUMP_POWER; airtime = self:Airtime(dy, launch)
    end
    if not airtime then
        return { { pos = startPos }, { pos = targetPos } }, string.format("unreachable | %.1fst up, jump reaches %.1fst", dy, jumpApex)
    end
    local needSpeed = horizontal / airtime
    local points, blocked = self:TracePath(startPos, targetPos, launch, airtime)
    local trick
    if targetType and targetType ~= "ground" and targetType ~= "jump" then
        trick = targetType
    elseif dy < -12 and self:IsLedge(targetPos, dir) then
        trick = "edgebug"
    elseif dy < -12 then
        trick = "jumpbug"
    elseif dy > jumpApex + 0.3 then
        trick = "duckjump"
    elseif horizontal < 3 and math.abs(dy) < 1 then
        trick = "walk"
    elseif needSpeed > self.RUN_SPEED then
        trick = "longjump"
    else
        trick = "jump"
    end
    local parts = { trick }
    parts[#parts + 1] = string.format("%.1fst", horizontal)
    if math.abs(dy) > 0.5 then parts[#parts + 1] = string.format("%+.1fst", dy) end
    parts[#parts + 1] = string.format("need %.0f speed", needSpeed)
    if needSpeed > self.BHOP_SPEED then
        parts[#parts + 1] = "IMPOSSIBLE"
    elseif needSpeed > self.RUN_SPEED then
        parts[#parts + 1] = "bhop required"
    end
    if blocked then parts[#parts + 1] = "BLOCKED" end
    return points, table.concat(parts, " ")
end
PointManager = {}; PointManager.Points = {}; PointManager.MAX_POINTS = 40
function PointManager:Initialize(workspaceRoot)
    MapAnalyzer:InitMap(workspaceRoot)
end
function PointManager:AddRoutePoint(position: Vector3, normal: Vector3)
    if #self.Points >= PointManager.MAX_POINTS then
        if RouteUI and RouteUI.Hitlog then RouteUI:Hitlog("point limit reached (" .. PointManager.MAX_POINTS .. ")", 3) end
        return
    end
    normal = normal or Vector3.new(0, 1, 0); local pType = "jump"; local params = RaycastParams.new(); params.FilterType = Enum.RaycastFilterType.Exclude
    if game.Players.LocalPlayer and game.Players.LocalPlayer.Character then
        params.FilterDescendantsInstances = {game.Players.LocalPlayer.Character, workspace.CurrentCamera}
    end
    local ray = workspace:Raycast(position + Vector3.new(0, 0.1, 0), Vector3.new(0, -3, 0), params)
    if math.abs(normal.Y) < 0.3 then
        pType = "pixelsurf"
    elseif ray then
        local previous = self.Points[#self.Points]
        local from = previous and previous.pos or (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
        local approach = from and Vector3.new(position.X - from.X, 0, position.Z - from.Z) or Vector3.zero
        approach = approach.Magnitude > 0.01 and approach.Unit or Vector3.new(0, 0, 1)
        if from and position.Y < from.Y - 12 and RouteGenerator:IsLedge(position, approach) then
            pType = "edgebug"
        else
            pType = "ground"
        end
    end
    table.insert(self.Points, {pos = position, normal = normal, type = pType})
    if RouteUI and RouteUI.RefreshPointsList then
        RouteUI:RefreshPointsList()
    end
end
function PointManager:ClearPoints()
    table.clear(self.Points); local markersFolder = game.Workspace:FindFirstChild("RouteMarkers")
    if markersFolder then
        markersFolder:ClearAllChildren()
    end
    local pathFolder = workspace:FindFirstChild("RoutePath")
    if pathFolder then pathFolder:Destroy() end
end
function PointManager:GenerateFullRoute()
    local Players = game:GetService("Players"); local routeNodes = {}; local char = Players.LocalPlayer and Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local footPos = char.HumanoidRootPart.Position - Vector3.new(0, 2.5, 0); table.insert(routeNodes, {pos = footPos, normal = Vector3.new(0, 1, 0)})
    end
    for _, p in self.Points do
        table.insert(routeNodes, p)
    end
    if #routeNodes < 2 then
        return nil
    end
    local fullRouteCombo = {}; local fullTickHistory = {}
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
    local total = 0; local drop = 0
    for i = 1, #routeNodes - 1 do
        local a = routeNodes[i].pos; local b = routeNodes[i + 1].pos
        total = total + (Vector3.new(b.X, 0, b.Z) - Vector3.new(a.X, 0, a.Z)).Magnitude
        if b.Y < a.Y then drop = drop + (a.Y - b.Y) end
    end
    local header = string.format("%d segments | %.0fst total | %.0fst drop", #routeNodes - 1, total, drop)
    self:VisualizePath(fullTickHistory)
    return fullTickHistory, header .. "\n" .. table.concat(fullRouteCombo, "\n")
end
function routePathColor()
    return library_flags["calcPathColor"] or THEME.AccentColor
end
function routeMarkerColor()
    return library_flags["calcMarkerColor"] or THEME.AccentColor
end
function refreshRouteVisuals()
    if RouteUI and RouteUI.UpdateMarkers then pcall(function() RouteUI:UpdateMarkers() end) end
    if env.lastRouteHistory then pcall(function() PointManager:VisualizePath(env.lastRouteHistory) end) end
end
function PointManager:VisualizePath(tickHistory)
    local folder = workspace:FindFirstChild("RoutePath")
    if folder then folder:Destroy() end
    env.lastRouteHistory = tickHistory
    if not tickHistory or #tickHistory < 2 or library_flags["calcShowPath"] == false then return end
    folder = Instance.new("Folder"); folder.Name = "RoutePath"; folder.Parent = workspace
    for i = 2, #tickHistory do
        local a = tickHistory[i - 1].pos; local b = tickHistory[i].pos; local span = (b - a).Magnitude
        if span > 0.05 then
            local width = (library_flags["calcPathWidth"] or 2) * 0.06
            local seg = Instance.new("Part"); seg.Anchored = true; seg.CanCollide = false; seg.CanQuery = false; seg.CanTouch = false; seg.CastShadow = false
            seg.Material = Enum.Material.Neon; seg.Color = routePathColor(); seg.Size = Vector3.new(width, width, span); seg.CFrame = CFrame.lookAt((a + b) / 2, b)
            seg.Parent = folder
        end
    end
end
UserInputService = game:GetService("UserInputService"); Players = game:GetService("Players"); RunService = game:GetService("RunService"); RouteUI = {}; RouteUI.Enabled = false; RouteUI.Gui = nil; RouteUI.MarkersFolder = nil; THEME = { BGColor = Color3.fromRGB(17, 17, 17), Transparency = 0, TextColor = Color3.fromRGB(180, 180, 180), Font = Enum.Font.Arial, AccentColor = Color3.fromRGB(147, 208, 23), }
function RouteUI:CreateGui()
    if self.Gui then self.Gui:Destroy() end
    local gui = Instance.new("ScreenGui"); gui.Name = "RouteCalculatorUI"; gui.ResetOnSpawn = false; gui.IgnoreGuiInset = true; local hitlogContainer = Instance.new("Frame", gui); hitlogContainer.Name = "HitlogContainer"; hitlogContainer.BackgroundTransparency = 1; hitlogContainer.AnchorPoint = Vector2.new(0.5, 1); hitlogContainer.Size = UDim2.new(1, 0, 0, 400); hitlogContainer.Position = UDim2.new(0.5, 0, 0.85, 0); self.HitlogContainer = hitlogContainer; local rcPanel = Instance.new("Frame"); rcPanel.Name = "RouteCalc"; env.RouteCalc = rcPanel; rcPanel.Active = true; rcPanel.Draggable = true; rcPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0); rcPanel.BackgroundTransparency = 0; rcPanel.BorderSizePixel = 0; rcPanel.Size = UDim2.new(0, 160, 0, 89); rcPanel.Position = UDim2.new(1, -180, 0, 20)
    rcPanel.ClipsDescendants = true
    rcPanel:GetPropertyChangedSignal("Position"):Connect(function()
        library_flags["ui_pos_RouteCalc"] = tostring(rcPanel.Position.X.Scale)..","..tostring(rcPanel.Position.X.Offset)..","..tostring(rcPanel.Position.Y.Scale)..","..tostring(rcPanel.Position.Y.Offset)
    end)
    rcPanel.Parent = gui; local rcPanel_Corner = Instance.new("UICorner"); rcPanel_Corner.CornerRadius = UDim.new(0, 4); rcPanel_Corner.Parent = rcPanel; local rcPanel_Stroke = Instance.new("UIStroke"); rcPanel_Stroke.Thickness = 1; rcPanel_Stroke.Color = Color3.fromRGB(65, 65, 65); rcPanel_Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; rcPanel_Stroke.Parent = rcPanel; local rcPanel_Extras = Instance.new("Folder"); rcPanel_Extras.Name = "Extras"; rcPanel_Extras.Parent = rcPanel; local rcPanel_OuterOutline = Instance.new("Frame"); rcPanel_OuterOutline.Name = "Outline"; rcPanel_OuterOutline.Size = UDim2.new(1, 2, 1, 2); rcPanel_OuterOutline.Position = UDim2.new(0, -1, 0, -1); rcPanel_OuterOutline.BackgroundTransparency = 1; rcPanel_OuterOutline.ZIndex = rcPanel.ZIndex - 1; rcPanel_OuterOutline.Parent = rcPanel_Extras; local rcPanel_OuterCorner = Instance.new("UICorner"); rcPanel_OuterCorner.CornerRadius = UDim.new(0, 5); rcPanel_OuterCorner.Parent = rcPanel_OuterOutline; local rcPanel_OuterStroke = Instance.new("UIStroke"); rcPanel_OuterStroke.Thickness = 1; rcPanel_OuterStroke.Color = Color3.new(0, 0, 0); rcPanel_OuterStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; rcPanel_OuterStroke.Parent = rcPanel_OuterOutline; local paddingRC = Instance.new("UIPadding", rcPanel); paddingRC.PaddingLeft = UDim.new(0, 11); paddingRC.PaddingRight = UDim.new(0, 11); paddingRC.PaddingTop = UDim.new(0, 8); paddingRC.PaddingBottom = UDim.new(0, 8); local titleRC = Instance.new("TextLabel", rcPanel); titleRC.Text = "route calculator"; titleRC.Font = Enum.Font.Code; titleRC.TextSize = 13; titleRC.TextColor3 = Color3.new(1, 1, 1); titleRC.BackgroundTransparency = 1; titleRC.Size = UDim2.new(1, 0, 0, 13); titleRC.Position = UDim2.new(0, 0, 0, 0); local textLeft = Instance.new("TextLabel", rcPanel); textLeft.Text = "add point\ncalculate combos\ndelete point\nclear all points"; textLeft.Font = Enum.Font.Code; textLeft.TextSize = 13; textLeft.TextColor3 = Color3.fromRGB(155, 155, 155); textLeft.BackgroundTransparency = 1; textLeft.Size = UDim2.new(1, 0, 1, -17); textLeft.Position = UDim2.new(0, 0, 0, 17); textLeft.TextXAlignment = Enum.TextXAlignment.Left; textLeft.TextYAlignment = Enum.TextYAlignment.Top; local textRight = Instance.new("TextLabel", rcPanel); textRight.Text = "F1\nF2\nF3\nF4"; textRight.Font = Enum.Font.Code; textRight.TextSize = 13; textRight.TextColor3 = Color3.fromRGB(155, 155, 155); textRight.BackgroundTransparency = 1; textRight.Size = UDim2.new(1, 0, 1, -17); textRight.Position = UDim2.new(0, 0, 0, 17); textRight.TextXAlignment = Enum.TextXAlignment.Right; textRight.TextYAlignment = Enum.TextYAlignment.Top; self.Gui = gui; local coreGui = game:GetService("CoreGui")
    pcall(function() self.Gui.Parent = coreGui end)
    if not self.Gui.Parent then
        self.Gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end
end
function RouteUI:Hitlog(text, duration)
    if not self.HitlogContainer then return end
    duration = duration or 5; local logFrame = Instance.new("Frame", self.HitlogContainer); logFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20); logFrame.BackgroundTransparency = 0.1; logFrame.AnchorPoint = Vector2.new(0.5, 1); logFrame.Size = UDim2.new(0, 0, 0, 0); logFrame.AutomaticSize = Enum.AutomaticSize.XY; logFrame.Position = UDim2.new(0.5, 0, 1, 0); local sizeConstraint = Instance.new("UISizeConstraint", logFrame); local viewportX = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize.X or 1920; sizeConstraint.MaxSize = Vector2.new(viewportX - 40, math.huge); local corner = Instance.new("UICorner", logFrame); corner.CornerRadius = UDim.new(0, 4); local topBorder = Instance.new("Frame", logFrame); topBorder.BackgroundColor3 = THEME.AccentColor; topBorder.Size = UDim2.new(1, 0, 0, 2); topBorder.BorderSizePixel = 0; local label = Instance.new("TextLabel", logFrame); label.Text = "  " .. text .. "  "; label.Font = Enum.Font.Code; label.TextSize = 13; label.TextColor3 = Color3.new(1, 1, 1); label.TextStrokeTransparency = 1; label.BackgroundTransparency = 1; label.TextWrapped = true; label.AutomaticSize = Enum.AutomaticSize.XY; label.Size = UDim2.new(0, 0, 0, 0); label.Position = UDim2.new(0, 0, 0, 4); label.TextXAlignment = Enum.TextXAlignment.Center; local padding = Instance.new("UIPadding", logFrame); padding.PaddingBottom = UDim.new(0, 6); local currentLogs = self.HitlogContainer:GetChildren()
    for _, child in currentLogs do
        if child ~= logFrame and child:IsA("Frame") then
            child.Position = child.Position - UDim2.new(0, 0, 0, 28)
        end
    end
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear); local tween = game:GetService("TweenService"):Create(topBorder, tweenInfo, {Size = UDim2.new(0, 0, 0, 2)}); tween:Play()
    task.delay(duration, function()
        if logFrame then logFrame:Destroy() end
    end)
end
function RouteUI:UpdateMarkers()
    if not self.MarkersFolder then
        self.MarkersFolder = Instance.new("Folder", game.Workspace); self.MarkersFolder.Name = "RouteMarkers"
    end
    self.MarkersFolder:ClearAllChildren()
    if library_flags["calcShowMarkers"] == false then return end
    for i, data in PointManager.Points do
        local part = Instance.new("Part", self.MarkersFolder); part.Anchored = true; part.CanCollide = false; part.Transparency = 1; part.Position = data.pos; part.Size = Vector3.new(1,1,1); local bb = Instance.new("BillboardGui", part); bb.Size = UDim2.new(0, 25, 0, 25); bb.AlwaysOnTop = true; local bg = Instance.new("Frame", bb); bg.Size = UDim2.new(1,0,1,0); bg.BackgroundColor3 = THEME.BGColor; bg.BackgroundTransparency = 0.2; local corner = Instance.new("UICorner", bg); corner.CornerRadius = UDim.new(1, 0)
        if i == #PointManager.Points then
            local stroke = Instance.new("UIStroke", bg); stroke.Color = routeMarkerColor(); stroke.Thickness = 2; local label = Instance.new("TextLabel", bb); label.Text = "point " .. i; label.Position = UDim2.new(0, 0, 0, -20); label.Size = UDim2.new(1, 0, 0, 20); label.BackgroundTransparency = 1; label.TextColor3 = Color3.new(1,1,1); label.Font = Enum.Font.Code; label.TextSize = 10
        end
        local num = Instance.new("TextLabel", bg); num.Text = tostring(i); num.Size = UDim2.new(1,0,1,0); num.BackgroundTransparency = 1; num.TextColor3 = routeMarkerColor(); num.Font = Enum.Font.Code; num.TextSize = 12
    end
end
function RouteUI:GetAimPosition()
    local cam = game.Workspace.CurrentCamera; local mouse = game.Players.LocalPlayer:GetMouse(); local unitRay = cam:ScreenPointToRay(mouse.X, mouse.Y); local params = RaycastParams.new(); params.FilterType = Enum.RaycastFilterType.Exclude; local filters = {self.MarkersFolder, cam}; local char = game.Players.LocalPlayer.Character
    if char then table.insert(filters, char) end
    local hitboxes = game.Workspace:FindFirstChild("Hitboxes")
    if hitboxes then table.insert(filters, hitboxes) end
    local ignoreFolders = {"Viewmodels", "Ignore", "Debris"}
    for _, name in ignoreFolders do
        local f = game.Workspace:FindFirstChild(name)
        if f then table.insert(filters, f) end
    end
    params.FilterDescendantsInstances = filters
    local origin = unitRay.Origin; local direction = unitRay.Direction * 2000; local res = game.Workspace:Raycast(origin, direction, params); local safety = 0
    while res and safety < 10 and (res.Instance.Name == "Hitbox" or res.Instance.Name == "FakeHead" or res.Instance.Name == "HeadHB" or res.Instance:FindFirstAncestor("Hitboxes")) do
        table.insert(filters, res.Instance)
        params.FilterDescendantsInstances = filters
        res = game.Workspace:Raycast(origin, direction, params); safety = safety + 1
    end
    if res then
        return res.Position, res.Normal
    end
    return nil, nil
end
function RouteUI:SetupInput()
    if self._inputConnection then
        self._inputConnection:Disconnect(); self._inputConnection = nil
    end
    self._inputConnection = UserInputService.InputBegan:Connect(function(input, processed)
        if processed or not self.Enabled then return end
        if not alive() then return end
        if input.KeyCode == Enum.KeyCode.F1 then
            local pos, normal = self:GetAimPosition()
            if pos then
                PointManager:AddRoutePoint(pos, normal); self:UpdateMarkers()
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
            local cam = game.Workspace.CurrentCamera; local camPos = cam.CFrame.Position; local lookDir = cam.CFrame.LookVector; local closestIdx = -1; local maxDot = 0.98
            for i, data in PointManager.Points do
                local dirToPoint = (data.pos - camPos).Unit
                local dot = lookDir:Dot(dirToPoint)
                if dot > maxDot then
                    maxDot = dot
                    closestIdx = i
                end
            end
            if closestIdx ~= -1 then
                table.remove(PointManager.Points, closestIdx); self:UpdateMarkers()
            end
        elseif input.KeyCode == Enum.KeyCode.F4 then
            PointManager:ClearPoints(); self:UpdateMarkers()
        end
    end)
end
function RouteUI:Start()
    self.Enabled = true; PointManager:ClearPoints(); PointManager:Initialize(game.Workspace); self:CreateGui(); self:SetupInput()
end
;(function()
	calcSubTab = movementTab:AddSubTab("Calculator"); local calcCol1 = calcSubTab:AddColumn(); local calcCol2 = calcSubTab:AddColumn(); local masterSec = calcCol1:AddSection("master")
	masterSec:AddToggle({text = "enable route calculator", flag = "calcEnable", callback = function(val)
		if val then
			RouteUI:Start()
		else
			RouteUI.Enabled = false
			if RouteUI.Gui then RouteUI.Gui:Destroy(); RouteUI.Gui = nil end
			if RouteUI.MarkersFolder then RouteUI.MarkersFolder:ClearAllChildren() end
		end
	end})
	local visualSec = calcCol1:AddSection("visuals")
	visualSec:AddToggle({ text = "route path", flag = "calcShowPath", state = true, callback = refreshRouteVisuals }):AddColor({ flag = "calcPathColor", color = Color3.fromRGB(147, 208, 23), callback = refreshRouteVisuals })
	visualSec:AddToggle({ text = "point markers", flag = "calcShowMarkers", state = true, callback = refreshRouteVisuals }):AddColor({ flag = "calcMarkerColor", color = Color3.fromRGB(147, 208, 23), callback = refreshRouteVisuals })
	visualSec:AddSlider({ text = "path thickness", flag = "calcPathWidth", min = 1, max = 10, value = 2, callback = refreshRouteVisuals })
	local prefSec = calcCol1:AddSection("preferences")
	prefSec:AddToggle({text = "use current pos for start jump", flag = "calcUseCurrentPos"})
	prefSec:AddToggle({text = "stop calculating at max displayed", flag = "calcStopAtMax"}); prefSec:AddToggle({text = "calculation timeout", flag = "calcTimeout"}); prefSec:AddToggle({text = "allow selecting invalid pixels", flag = "calcInvalid"}); prefSec:AddSlider({text = "max displayed combos", flag = "calcMaxCombos", min = 1, max = 20, value = 6, float = 1}); prefSec:AddSlider({text = "delayed hop amount", flag = "calcDelayedHop", min = 1, max = 10, value = 2, float = 1}); local pointsSec = calcCol2:AddSection("added points"); local listBox = Instance.new("Frame"); listBox.Size = UDim2.new(1, -10, 0, 150); listBox.Position = UDim2.new(0, 5, 0, 0); listBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15); listBox.BorderColor3 = Color3.fromRGB(40, 40, 40); listBox.Parent = pointsSec.content; local scrollFrame = Instance.new("ScrollingFrame"); scrollFrame.Size = UDim2.new(1, 0, 1, 0); scrollFrame.BackgroundTransparency = 1; scrollFrame.ScrollBarThickness = 2; scrollFrame.Parent = listBox; local scrollLayout = Instance.new("UIListLayout", scrollFrame); scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder; scrollLayout.Padding = UDim.new(0, 2); local scrollPad = Instance.new("UIPadding", scrollFrame); scrollPad.PaddingTop = UDim.new(0, 4); scrollPad.PaddingLeft = UDim.new(0, 4); scrollPad.PaddingRight = UDim.new(0, 4); RouteUI.CustomListContainer = scrollFrame; RouteUI.CustomListLayout = scrollLayout
	pointsSec:AddButton({text = "clear all points", callback = function()
		PointManager:ClearPoints(); library_flags.calcSelectedPoint = nil
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
	local typeSec = calcCol2:AddSection("types to calculate"); typeSec:AddList({text = "start type", flag = "calcType", values = {"jump (stand)", "longjump", "walk off (stand)", "jump"}, multiselect = true}); typeSec:AddToggle({text = "allow delayed jump", flag = "calcAllowDelayedJump"})
	function RouteUI:RefreshPointsList()
		if not RouteUI.CustomListContainer then return end
		for _, v in RouteUI.CustomListContainer:GetChildren() do
			if v:IsA("TextButton") or v:IsA("TextLabel") then
				v:Destroy()
			end
		end
		local startLabel = Instance.new("TextLabel"); startLabel.Size = UDim2.new(1, 0, 0, 16); startLabel.BackgroundTransparency = 1; startLabel.Text = "starting jump (current position)"; startLabel.TextColor3 = Color3.fromRGB(200, 200, 200); startLabel.Font = Enum.Font.Code; startLabel.TextSize = 12; startLabel.TextXAlignment = Enum.TextXAlignment.Left; startLabel.Parent = RouteUI.CustomListContainer
		for i, pt in PointManager.Points do
			local btn = Instance.new("TextButton"); btn.Size = UDim2.new(1, 0, 0, 16); btn.BackgroundTransparency = 1; btn.Text = "point " .. i .. ": " .. (pt.type or "ground"); btn.TextColor3 = (library_flags.calcSelectedPoint == i) and Color3.fromRGB(0, 200, 50) or Color3.fromRGB(200, 200, 200); btn.Font = Enum.Font.Code; btn.TextSize = 12; btn.TextXAlignment = Enum.TextXAlignment.Left; btn.Parent = RouteUI.CustomListContainer
			btn.MouseButton1Click:Connect(function()
				library_flags.calcSelectedPoint = i
				if ptTypeOpt and ptTypeOpt.SetValue then
					ptTypeOpt:SetValue(pt.type or "ground")
				end
				RouteUI:RefreshPointsList()
			end)
			if library_flags.calcSelectedPoint == i then
				local trash = Instance.new("TextButton"); trash.Size = UDim2.new(0, 16, 0, 16); trash.Position = UDim2.new(1, -16, 0, 0); trash.BackgroundTransparency = 1; trash.Text = "🗑"; trash.TextColor3 = Color3.fromRGB(200, 200, 200); trash.Font = Enum.Font.Code; trash.TextSize = 12; trash.Parent = btn
				trash.MouseButton1Click:Connect(function()
					table.remove(PointManager.Points, i); library_flags.calcSelectedPoint = nil; RouteUI:RefreshPointsList(); RouteUI:UpdateMarkers()
				end)
				local moveDown = Instance.new("TextButton"); moveDown.Size = UDim2.new(0, 16, 0, 16); moveDown.Position = UDim2.new(1, -32, 0, 0); moveDown.BackgroundTransparency = 1; moveDown.Text = "v"; moveDown.TextColor3 = Color3.fromRGB(200, 200, 200); moveDown.Font = Enum.Font.Code; moveDown.TextSize = 12; moveDown.Parent = btn
				moveDown.MouseButton1Click:Connect(function()
					if i < #PointManager.Points then
						local temp = PointManager.Points[i]; PointManager.Points[i] = PointManager.Points[i+1]; PointManager.Points[i+1] = temp; library_flags.calcSelectedPoint = i+1; RouteUI:RefreshPointsList(); RouteUI:UpdateMarkers()
					end
				end)
				local moveUp = Instance.new("TextButton"); moveUp.Size = UDim2.new(0, 16, 0, 16); moveUp.Position = UDim2.new(1, -48, 0, 0); moveUp.BackgroundTransparency = 1; moveUp.Text = "^"; moveUp.TextColor3 = Color3.fromRGB(200, 200, 200); moveUp.Font = Enum.Font.Code; moveUp.TextSize = 12; moveUp.Parent = btn
				moveUp.MouseButton1Click:Connect(function()
					if i > 1 then
						local temp = PointManager.Points[i]; PointManager.Points[i] = PointManager.Points[i-1]; PointManager.Points[i-1] = temp; library_flags.calcSelectedPoint = i-1; RouteUI:RefreshPointsList(); RouteUI:UpdateMarkers()
					end
				end)
			end
		end
		RouteUI.CustomListContainer.CanvasSize = UDim2.new(0, 0, 0, RouteUI.CustomListLayout.AbsoluteContentSize.Y + 10)
	end
end)() 
;(function()
	local skinTab = UI_Library:AddTab("Skins"); local skinCol1 = skinTab:AddColumn(); env.SkinCol1 = skinCol1; local skinCol2 = skinTab:AddColumn(); local knifeSection = skinCol1:AddSection("Knife Changer"); local knifeSkinSection = skinCol1:AddSection("Knife Skins"); local gloveSection = skinCol2:AddSection("Glove Changer"); local sleeveSection = generalCol1:AddSection("Sleeve Changer"); local weaponSection = skinCol2:AddSection("Weapon Skin Changer"); local RS = game:GetService("ReplicatedStorage"); local Camera = workspace.CurrentCamera; local Skins = RS:FindFirstChild("Skins") or RS:WaitForChild("Skins", 10); local Viewmodels = RS:FindFirstChild("Viewmodels") or RS:WaitForChild("Viewmodels", 10); local Gloves = RS:FindFirstChild("Gloves") or RS:WaitForChild("Gloves", 10); local GloveModels = Gloves and Gloves:FindFirstChild("Models"); local Models = nil
	pcall(function() Models = game:GetObjects("rbxassetid://7285197035")[1] end)
	if Models then repeat wait() until Models ~= nil end
	local OriginalCTKnife = Viewmodels and Viewmodels:FindFirstChild("v_CT Knife") and Viewmodels:FindFirstChild("v_CT Knife"):Clone(); local OriginalTKnife = Viewmodels and Viewmodels:FindFirstChild("v_T Knife") and Viewmodels:FindFirstChild("v_T Knife"):Clone(); local customSkins = { {["Weapon"] = "AWP", ["SkinName"] = "Bot", ["Skin"] = {["Scope"] = "6572594838", ["Handle"] = "6572594077"}} }
	if Skins then
		for _, skin in customSkins do
			pcall(function()
				if Skins:FindFirstChild(skin["Weapon"]) then
					local Folder = Instance.new("Folder"); Folder.Name = skin["SkinName"]; Folder.Parent = Skins[skin["Weapon"]]
					for partName, texId in skin["Skin"] do
						local val = Instance.new("StringValue"); val.Name = partName; val.Value = "rbxassetid://" .. texId; val.Parent = Folder
					end
				end
			end)
		end
	end
	local AllKnives = { "CT Knife", "T Knife", "Banana", "Bayonet", "Bearded Axe", "Butterfly Knife", "Cleaver", "Crowbar", "Falchion Knife", "Flip Knife", "Gut Knife", "Huntsman Knife", "Karambit", "M9 Bayonet", "Sickle", }; local AllWeapons = {}; local AllSkins = {}
	if Skins then
		for _, v in Skins:GetChildren() do
			local isKnife = false
			for _, knife in AllKnives do
				local cleanKnife = knife:gsub(" Knife", ""):gsub(" Classic", ""); local cleanLower = cleanKnife:lower()
				if v.Name:lower() == cleanLower or v.Name:lower():sub(1, #cleanLower + 1) == cleanLower .. " " then
					isKnife = true; break
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
			table.sort(AllSkins[v], function(a, b)
				if a == "Inventory" then return true end
				if b == "Inventory" then return false end
				return a < b
			end)
		end
	end
	local ActiveAnimations = {}; local AllGloveNamesList = {}; local AllGloves = {}
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
			table.sort(AllGloves[gName], function(a, b)
				if a == "Default" then return true end
				if b == "Default" then return false end
				return a < b
			end)
		end
	end
	local AllSleeves = {"Default", "None"}; local SleeveTemplates = {}
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
		local path = string.lower(part.Name); local parent = part.Parent
		while parent do
			path = path .. " " .. string.lower(parent.Name); parent = parent.Parent
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
		local parentName = model and model.Parent and model.Parent.Name or "Model"; local altName = parentName .. " " .. name
		if not SleeveTemplates[altName] then return altName end
		local i = 2
		while SleeveTemplates[altName .. " " .. tostring(i)] do
			i = i + 1
		end
		return altName .. " " .. tostring(i)
	end
	local function getOffsetFromJoints(arm, sleeve)
		if not arm or not sleeve then return nil end
		local p = arm.Parent
		if not p then return arm.CFrame:ToObjectSpace(sleeve.CFrame) end
		for _, j in p:GetDescendants() do
			if (j:IsA("JointInstance") or j:IsA("Motor6D") or j:IsA("Weld")) and j.Part0 and j.Part1 then
				if j.Part0 == arm and j.Part1 == sleeve then
					return j.C0 * j.C1:Inverse()
				elseif j.Part0 == sleeve and j.Part1 == arm then
					return j.C1 * j.C0:Inverse()
				end
			end
		end
		return arm.CFrame:ToObjectSpace(sleeve.CFrame)
	end
	local function registerSleeveTemplate(name, model)
		if not name or not model then return end
		local rArm = model and model:FindFirstChild("Right Arm", true); local lArm = model and model:FindFirstChild("Left Arm", true); local rSleeve = findArmSleeve(rArm); local lSleeve = findArmSleeve(lArm)
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
			local rOffset = (rSleeve and rArm) and getOffsetFromJoints(rArm, rSleeve) or nil; local lOffset = (lSleeve and lArm) and getOffsetFromJoints(lArm, lSleeve) or nil; SleeveTemplates[name] = { R = rSleeve and rSleeve:Clone() or nil, L = lSleeve and lSleeve:Clone() or nil, RO = rOffset, LO = lOffset, }; table.insert(AllSleeves, name)
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
				scannedSleeveModels[root] = true; registerSleeveTemplate(root.Name, root)
			end
			for _, model in root:GetDescendants() do
				local mn = string.lower(model.Name)
				if model:IsA("Model") and not scannedSleeveModels[model] and not isInsideViewmodels(model) and modelHasSleeve(model) and not mn:find("old") and not mn:find("viewmodel") then
					scannedSleeveModels[model] = true; registerSleeveTemplate(model.Name, model)
				end
			end
		end)
	end
	if Viewmodels then
		for _, vm in Viewmodels:GetChildren() do
			if vm:IsA("Model") and (vm:FindFirstChild("Right Arm", true) or vm:FindFirstChild("Left Arm", true)) then
				local cleanName = vm.Name:gsub("^v_", ""); registerSleeveTemplate(cleanName, vm)
			end
			for _, model in vm:GetChildren() do
				if model:IsA("Model") and (model:FindFirstChild("Right Arm", true) or model:FindFirstChild("Left Arm", true)) then
					local cleanName = model.Name:gsub("Arms$", ""):gsub("^v_", ""); registerSleeveTemplate(cleanName, model)
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
	env.AllSleeves = AllSleeves; env.SleeveTemplates = SleeveTemplates
	local function applySleeveChanger(model)
		if not model then return end
		local team = "T"
		pcall(function()
			if val_733:FindFirstChild("Status") and val_733.Status:FindFirstChild("Team") then
				team = val_733.Status.Team.Value
			end
		end)
		if not library_flags["skinSleeveChanger"] then return end
		local selected = team == "CT" and library_flags["skinSleeveCT"] or library_flags["skinSleeveT"]; selected = selected or "Default"
		if not selected or selected == "" then return end
		local rArm = model:FindFirstChild("Right Arm") or model:FindFirstChild("Right Arm", true); local lArm = model:FindFirstChild("Left Arm") or model:FindFirstChild("Left Arm", true)
		if not rArm and not lArm then return end
		local function isAppliedOk(arm)
			if not arm then return true end
			local s = arm:FindFirstChild("Sleeve")
			if not s then return false end
			return s:GetAttribute("Applied") == selected
		end
		if isAppliedOk(rArm) and isAppliedOk(lArm) then return end
		local originals = model:FindFirstChild("OriginalSleeves"); local originalR = findArmSleeve(rArm); local originalL = findArmSleeve(lArm)
		if not originals then
			if (not originalR and not originalL) and selected == "Default" then return end
			originals = Instance.new("Folder"); originals.Name = "OriginalSleeves"; originals.Parent = model
			local function stash(src, name)
				local c = src:Clone(); c.Name = name
				for _, j in c:GetDescendants() do
					if j:IsA("Weld") or j:IsA("WeldConstraint") or j:IsA("Motor6D") or j:IsA("JointInstance") then
						j:Destroy()
					end
				end
				if c:IsA("BasePart") or c:IsA("MeshPart") then
					c.Anchored = true; c.CanCollide = false; c.Transparency = 1
				end
				c.Parent = originals
				return c
			end
			if originalR and rArm then
				stash(originalR, "R"); local off = Instance.new("CFrameValue", originals); off.Name = "RO"; off.Value = rArm.CFrame:ToObjectSpace(originalR.CFrame)
			end
			if originalL and lArm then
				stash(originalL, "L"); local off = Instance.new("CFrameValue", originals); off.Name = "LO"; off.Value = lArm.CFrame:ToObjectSpace(originalL.CFrame)
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
					arm.Transparency = arm:GetAttribute("OrigTrans"); arm:SetAttribute("OrigTrans", nil)
				end
			end
		end
		local function attachSleeve(src, arm, offset)
			if not src or not arm then return end
			local sleeve = src:Clone(); sleeve.Name = "Sleeve"; sleeve.Anchored = false; sleeve.CanCollide = false; sleeve.Massless = true; sleeve.Transparency = 0
			for _, j in sleeve:GetDescendants() do
				if j:IsA("Weld") or j:IsA("WeldConstraint") or j:IsA("Motor6D") or j:IsA("JointInstance") then
					j:Destroy()
				end
			end
			sleeve.Parent = arm; local motor = Instance.new("Motor6D"); motor.Name = "SleeveMotor"; motor.Part0 = arm; motor.Part1 = sleeve; motor.C0 = offset or CFrame.new(); motor.C1 = CFrame.new(); motor.Parent = sleeve; sleeve:SetAttribute("Applied", selected)
		end
		if selected == "Default" then
			local rOff = originals:FindFirstChild("RO"); local lOff = originals:FindFirstChild("LO"); attachSleeve(originals:FindFirstChild("R"), rArm, rOff and rOff.Value or nil); attachSleeve(originals:FindFirstChild("L"), lArm, lOff and lOff.Value or nil); return
		end
		if selected == "None" then return end
		local template = SleeveTemplates[selected]
		if not template then return end
		attachSleeve(template.R, rArm, template.RO); attachSleeve(template.L, lArm, template.LO)
	end
	local function applySleeveChangerToCurrent()
		local arms = Camera and Camera:FindFirstChild("Arms")
		if not arms then return end
		local sx = (library_flags["skinSleeveX"] or 0) / 25; local sy = (library_flags["skinSleeveY"] or 0) / 25; local sz = (library_flags["skinSleeveZ"] or 0) / 25
		for _, d in arms:GetDescendants() do
			if string.find(string.lower(d.Name), "sleeve") and (d:IsA("BasePart") or d:IsA("MeshPart")) then
				local motor = d:FindFirstChild("SleeveMotor") or d:FindFirstChildWhichIsA("Motor6D")
				if motor then
					local origC1 = motor:GetAttribute("OrigC1")
					if not origC1 then
						origC1 = motor.C1; motor:SetAttribute("OrigC1", origC1)
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
	local currentKnife = nil; local swapping = false
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
				local clone = OriginalCTKnife:Clone(); clone.Parent = Viewmodels
			end
			if OriginalTKnife then
				local clone = OriginalTKnife:Clone(); clone.Parent = Viewmodels
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
				local ctClone = sourceVM:Clone(); ctClone.Name = "v_CT Knife"; ctClone.Parent = Viewmodels; local tClone = sourceVM:Clone(); tClone.Name = "v_T Knife"; tClone.Parent = Viewmodels
			else
				if OriginalCTKnife then
					local clone = OriginalCTKnife:Clone(); clone.Parent = Viewmodels
				end
				if OriginalTKnife then
					local clone = OriginalTKnife:Clone(); clone.Parent = Viewmodels
				end
			end
		end
		currentKnife = knifeName; swapping = false
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
		if library_flags["skinKnifeChanger"] and not loadingCFG then
			SwapKnifeModel(val)
		end
	end})
function UI_Library:RefreshList(dropdown, newValues)
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
			if AllGloves[val] and UI_Library.options["skinGloveSkin"] then
				pcall(function()
					UI_Library:RefreshList(UI_Library.options["skinGloveSkin"], AllGloves[val])
				end)
				pcall(function()
					local skinToSet = selectedGloveSkins[val] or AllGloves[val][1]; UI_Library.options["skinGloveSkin"]:SetValue(skinToSet); env.lastGloveSkin = skinToSet
				end)
			end 
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
	sleeveSection:AddToggle({text = "Enable Sleeve Changer", flag = "skinSleeveChangerToggle", callback = updateSleeves}); sleeveSection:AddSlider({text = "Forward/Backward", flag = "skinSleeveZ", min = -3, max = 3, float = 0.05, value = 0, callback = updateSleeves}); weaponSection:AddToggle({text = "Enabled", flag = "skinSkinChanger"})
	if #AllWeapons > 0 then
		for _, weaponName in AllWeapons do
			local weaponSkins = AllSkins[weaponName] or {"Inventory"}; local skinFlag = "skin_" .. weaponName:gsub(" ", "_"):gsub("-", "_"); weaponSection:AddList({ text = weaponName, flag = skinFlag, values = weaponSkins, max = 15, value = "Inventory" })
		end
	end
	local KnifeSkins = {}; local KnivesWithSkins = {}
	if Skins then
		for _, knifeName in AllKnives do
			local hasSkins = false; KnifeSkins[knifeName] = {"Inventory"}
			if Skins:FindFirstChild(knifeName) then
				for _, skin in Skins[knifeName]:GetChildren() do
					table.insert(KnifeSkins[knifeName], skin.Name); hasSkins = true
				end
			end
			table.sort(KnifeSkins[knifeName], function(a, b)
				if a == "Inventory" then return true end
				if b == "Inventory" then return false end
				return a < b
			end)
			if hasSkins then
				table.insert(KnivesWithSkins, knifeName)
			end
		end
	end
	if #KnivesWithSkins > 0 then
		for _, knifeName in KnivesWithSkins do
			local knifeSkinList = KnifeSkins[knifeName] or {"Inventory"}; local skinFlag = "skin_knife_" .. knifeName:gsub(" ", "_"):gsub("-", "_"); knifeSkinSection:AddList({ text = knifeName, flag = skinFlag, values = knifeSkinList, max = 15, value = "Inventory" })
		end
	end
	local Client = nil
	pcall(function() Client = getsenv(val_733.PlayerGui.Client) end)
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
			local isMelee = Client.gun:FindFirstChild("Melee"); local gunname = Client.gun ~= "none" and library_flags["skinKnifeChanger"] and isMelee and library_flags["skinKnifeModel"] or Client.gun ~= "none" and Client.gun.Name
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
							local skinFlag = (isMelee and "skin_knife_" or "skin_") .. gunname:gsub(" ", "_"):gsub("-", "_"); local selectedSkin = library_flags[skinFlag] or "Inventory"
							if selectedSkin and selectedSkin ~= "Inventory" then
								local SkinData = Skins[gunname]:FindFirstChild(selectedSkin)
								if SkinData then
									local function applySkinToPart(targetPart)
										local n = targetPart.Name:lower()
										if n:match("^right arm") or n:match("^left arm") or n:match("sleeve") or n:match("glove") or n:match("^right hand") or n:match("^left hand") then return end
										if targetPart:IsA("BasePart") or targetPart:IsA("MeshPart") then
											local tex = nil; local wm = SkinData:FindFirstChild("WorldModel")
											for _, Data in SkinData:GetDescendants() do
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
												for _, Data in SkinData:GetDescendants() do
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
													for _, Data in wm:GetDescendants() do
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
													for _, Data in wm:GetDescendants() do
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
											local isAnimated = SkinData:FindFirstChild("Animated", true)
											if (not tex or tex == "") and not isAnimated then
												for _, Data in wm and wm:GetDescendants() or SkinData:GetDescendants() do
													local lowerName = Data.Name:lower()
													if not lowerName:match("normal") and not lowerName:match("pbr") and not lowerName:match("roughness") and not lowerName:match("specular") and not lowerName:match("metallic") then
														local isAssetId = Data:IsA("StringValue") and (Data.Value:match("rbxassetid://") or (tonumber(Data.Value) ~= nil and string.len(Data.Value) >= 5))
														if Data:IsA("StringValue") and isAssetId and Data.Value ~= "rbxassetid://0" then tex = Data.Value
														elseif Data:IsA("MeshPart") and Data.TextureID ~= "" and Data.TextureID ~= "rbxassetid://0" then tex = Data.TextureID
														elseif (Data:IsA("Decal") or Data:IsA("Texture")) and Data.Texture ~= "" and Data.Texture ~= "rbxassetid://0" then tex = Data.Texture
														elseif Data:IsA("SurfaceAppearance") then tex = Data end
														if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
													end
												end
											end
											local animData = nil; local pbr = SkinData:FindFirstChild("PBR")
											if pbr and pbr:FindFirstChild("Animated") then animData = pbr.Animated
											else animData = SkinData:FindFirstChild("Animated", true) end
											if animData and animData:IsA("ModuleScript") and targetPart.Transparency ~= 1 then
												local delays
												pcall(function() delays = require(animData).delays end)
												if delays then
													local frames, maxFrame = {}, 0
													for _, child in animData:GetChildren() do
														local frameNum = tonumber(child.Name)
														if frameNum then
															local frameTex = nil
															if child:IsA("StringValue") and child.Value ~= "" and child.Value ~= "rbxassetid://0" then frameTex = child.Value
															elseif child:IsA("MeshPart") and child.TextureID ~= "" and child.TextureID ~= "rbxassetid://0" then frameTex = child.TextureID
															elseif (child:IsA("Decal") or child:IsA("Texture")) and child.Texture ~= "" and child.Texture ~= "rbxassetid://0" then frameTex = child.Texture
															elseif child:IsA("SurfaceAppearance") then frameTex = child end
															if frameTex then
																frames[frameNum] = frameTex
																if frameNum > maxFrame then maxFrame = frameNum end
															end
														end
													end
													if maxFrame > 0 then
														task.spawn(function()
															while targetPart and targetPart.Parent do
																for i = 1, maxFrame do
																	if not (targetPart and targetPart.Parent) then return end
																	local frameTex = frames[i]
																	if frameTex then
																		if type(frameTex) == "string" and tonumber(frameTex) ~= nil and string.len(frameTex) >= 5 then frameTex = "rbxassetid://" .. frameTex end
																		if typeof(frameTex) == "Instance" and frameTex:IsA("SurfaceAppearance") then
																			local currentSA = targetPart:FindFirstChildWhichIsA("SurfaceAppearance")
																			if currentSA then currentSA:Destroy() end
																			frameTex:Clone().Parent = targetPart
																		else
																			if targetPart:IsA("MeshPart") then targetPart.TextureID = frameTex
																			elseif targetPart:FindFirstChild("Mesh") then targetPart.Mesh.TextureId = frameTex
																			else pcall(function() targetPart.TextureID = frameTex end) end
																		end
																	end
																	task.wait(type(delays) == "table" and (delays[i] or delays[1] or 0.1) or delays)
																end
															end
														end)
														return
													end
												end
											end
											if tex and targetPart.Transparency ~= 1 then
												if type(tex) == "string" and tonumber(tex) ~= nil and string.len(tex) >= 5 then tex = "rbxassetid://" .. tex end
												if typeof(tex) == "Instance" and tex:IsA("SurfaceAppearance") then
													if targetPart:FindFirstChildWhichIsA("SurfaceAppearance") then
														targetPart:FindFirstChildWhichIsA("SurfaceAppearance"):Destroy()
													end
													local clone = tex:Clone(); clone.Parent = targetPart
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
									for _, targetPart in obj:GetDescendants() do
										applySkinToPart(targetPart)
									end
									local skinConn
									skinConn = obj.DescendantAdded:Connect(applySkinToPart)
									obj.AncestryChanged:Connect(function(_, newParent)
										if not newParent and skinConn then
											skinConn:Disconnect(); skinConn = nil
										end
									end)
								end
							end
						end
					end
				end)
			end)
			local RArm = Model:FindFirstChild("Right Arm"); local LArm = Model:FindFirstChild("Left Arm")
			if library_flags["skinGloveChanger"] and GloveModels and Client.gun ~= "none" then
				local gloveName = env.lastGlove; local gloveSkin = env.lastGloveSkin
				if gloveName and gloveName ~= "None" and gloveSkin and GloveModels:FindFirstChild(gloveName) then
					local gloveTexData = Gloves:FindFirstChild(gloveName) and Gloves[gloveName]:FindFirstChild(gloveSkin); local _gloveTex = ""; local gloveAnimData = nil
					if gloveTexData then
						if gloveTexData:FindFirstChild("Textures") then
							_gloveTex = gloveTexData.Textures.TextureId or ""
						end
						local pbr = gloveTexData:FindFirstChild("PBR")
						if pbr and pbr:FindFirstChild("Animated") then
							gloveAnimData = pbr.Animated
						elseif gloveTexData:FindFirstChild("Animated") then
							gloveAnimData = gloveTexData.Animated
						end
					end
					local function applyGloveAnim(glovePart)
						if gloveAnimData and gloveAnimData:IsA("ModuleScript") then
							local delays
							pcall(function() delays = require(gloveAnimData).delays end)
							if delays then
								local frames, maxFrame = {}, 0
								for _, child in gloveAnimData:GetChildren() do
									local frameNum = tonumber(child.Name)
									if frameNum then
										local frameTex = nil
										if child:IsA("StringValue") and child.Value ~= "" and child.Value ~= "rbxassetid://0" then frameTex = child.Value
										elseif child:IsA("MeshPart") and child.TextureID ~= "" and child.TextureID ~= "rbxassetid://0" then frameTex = child.TextureID
										elseif (child:IsA("Decal") or child:IsA("Texture")) and child.Texture ~= "" and child.Texture ~= "rbxassetid://0" then frameTex = child.Texture
										elseif child:IsA("SurfaceAppearance") then frameTex = child end
										if frameTex then
											frames[frameNum] = frameTex
											if frameNum > maxFrame then maxFrame = frameNum end
										end
									end
								end
								if maxFrame > 0 then
									task.spawn(function()
										while glovePart and glovePart.Parent do
											for i = 1, maxFrame do
												if not (glovePart and glovePart.Parent) then return end
												local frameTex = frames[i]
												if frameTex then
													if typeof(frameTex) == "Instance" and frameTex:IsA("SurfaceAppearance") then
														local currentSA = glovePart:FindFirstChildWhichIsA("SurfaceAppearance")
														if currentSA then currentSA:Destroy() end
														frameTex:Clone().Parent = glovePart
													else
														if glovePart:IsA("MeshPart") then glovePart.TextureID = frameTex
														elseif glovePart:FindFirstChild("Mesh") then glovePart.Mesh.TextureId = frameTex
														else pcall(function() glovePart.TextureID = frameTex end) end
													end
												end
												task.wait(type(delays) == "table" and (delays[i] or delays[1] or 0.1) or delays)
											end
										end
									end)
								end
							end
						end
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
						newRG.Parent = RArm; newRG.Transparency = 0
						pcall(function() newRG.Welded.Part0 = RArm end)
						applyGloveAnim(newRG)
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
						newLG.Transparency = 0; newLG.Parent = LArm
						pcall(function() newLG.Welded.Part0 = LArm end)
						applyGloveAnim(newLG)
					end
				end
			end
			applySleeveChanger(Model)
		end)
	end)
end)()
val_449 = UI_Library:AddTab("Configs")
do
val_450 = val_449:AddColumn(); val_452 = val_449:AddColumn(); val_461 = val_450:AddSection"configurations"; val_462 = UI_Library:AddWarning({ type = "confirm" })
local function refreshConfigList()
	if UI_Library.RefreshList and UI_Library.options["Config List"] then
		UI_Library:RefreshList(UI_Library.options["Config List"], UI_Library:GetConfigs())
	end
end
val_461:AddBox({ text = "create a config", flag = "Config Name", value = "", skipflag = true })
val_461:AddButton({
	text = "+",
	callback = function()
		local cfgName = library_flags["Config Name"]
		if not cfgName or cfgName == "" or cfgName == "..." then
			val_462.text = "Please enter a config name first!"; val_462:Show(); return
		end
		local path = UI_Library.foldername .. "/" .. cfgName .. UI_Library.fileext
		if isfile(path) then
			val_462.text = "A config with name <font color='rgb(200, 50, 0)'>" .. cfgName .. "</font> already exists. Overwrite?"
			if not val_462:Show() then return end
		end
		UI_Library:SaveConfig(cfgName); refreshConfigList()
	end
})
val_461:AddList({ text = "configs", skipflag = true, value = "", flag = "Config List", values = UI_Library:GetConfigs() })
val_461:AddButton({
	text = "load",
	callback = function()
		local cfgName = library_flags["Config List"]
		if not cfgName or cfgName == "" then
			val_462.text = "Please select a config from the list first!"; val_462:Show(); return
		end
		UI_Library:LoadConfig(cfgName)
	end
})
val_461:AddButton({
	text = "save",
	callback = function()
		local cfgName = library_flags["Config List"]
		if not cfgName or cfgName == "" then
			val_462.text = "Please select a config from the list to save to!"; val_462:Show(); return
		end
		UI_Library:SaveConfig(cfgName)
	end
})
val_461:AddButton({
	text = "edit",
	callback = function()
		local cfgName = library_flags["Config List"]
		if not cfgName or cfgName == "" then
			val_462.text = "Please select a config from the list to edit!"; val_462:Show(); return
		end
		local path = UI_Library.foldername .. "/" .. cfgName .. UI_Library.fileext
		if isfile(path) then
			setclipboard(readfile(path)); val_462.text = "Config copied to clipboard. Paste edited data into import / export box and press import."; val_462:Show()
		end
	end
})
val_461:AddBox({ text = "import / export", flag = "Config Import Export", value = "", skipflag = true })
val_461:AddButton({
	text = "import / export",
	callback = function()
		local cfgName = library_flags["Config List"]; local data = library_flags["Config Import Export"]
		if data and data ~= "" and data ~= "..." then
			local name = cfgName
			if not name or name == "" then name = library_flags["Config Name"] end
			if not name or name == "" or name == "..." then
				val_462.text = "Select a config or enter a config name before importing!"; val_462:Show(); return
			end
			writefile(UI_Library.foldername .. "/" .. name .. UI_Library.fileext, data); refreshConfigList(); UI_Library:LoadConfig(name); return
		end
		if not cfgName or cfgName == "" then
			val_462.text = "Select a config to export or paste data to import!"; val_462:Show(); return
		end
		UI_Library:SaveConfig(cfgName, true)
	end
})
val_461:AddButton({
	text = "refresh",
	callback = function()
		refreshConfigList()
	end
})
L_menuSec_ = val_452:AddSection"options"
L_menuSec_:AddBind({
	text = "menu key", key = "Delete", flag = "Menu Bind",
	callback = function()
		if env.ToggleClarity then env.ToggleClarity() end
	end
})
L_menuSec_:AddToggle({
	text = "watermark", flag = "configWatermark", state = false,
	callback = function(enabled)
		local cg = game:GetService("CoreGui"):FindFirstChild("NativeWatermark")
		if cg then cg.Enabled = enabled end
		local main = UI_Library.options["configWatermark"]
		if main and main.SetState and main.state ~= enabled then
			pcall(function() main:SetState(enabled) end)
		end
	end
})
local _menuScale
L_menuSec_:AddList({
	text = "dpi scaling", flag = "dpiScaling", value = "100%", values = {"75%", "100%", "125%", "150%", "175%", "200%"},
	callback = function(val)
		local mf = UI_Library.mainFrame or (val_824 and val_824.mainFrame)
		if not mf then return end
		if not _menuScale then
			_menuScale = mf:FindFirstChild("DPIScale") or Instance.new("UIScale"); _menuScale.Name = "DPIScale"; _menuScale.Parent = mf
		end
		local map = {["75%"]=0.75, ["100%"]=1, ["125%"]=1.25, ["150%"]=1.5, ["175%"]=1.75, ["200%"]=2}; _menuScale.Scale = map[val] or 1
	end
})
L_safetySec_ = val_452:AddSection"safety"; L_safetySec_:AddToggle({text = "aim step", flag = "safetyAimStep"})
L_safetySec_:AddToggle({
	text = "anti untrusted", flag = "antiUntrusted", state = true,
	callback = function(enabled)
		if enabled then
			local risky = {"KillAllAuto", "Loop Kill", "Target ESP"}
			for _, flag in risky do
				local opt = UI_Library.options[flag]
				if opt and opt.SetState then
					pcall(function() opt:SetState(false) end)
				end
			end
		end
	end
})
L_safetySec_:AddToggle({text = "anti smac", flag = "antiSmac", state = false}); L_safetySec_:AddToggle({ text = "anti kick", flag = "antiKick", state = false, tip = "instantly hops to a NEW server when a votekick targets you, escaping the vote" })
do
	local TS = game:GetService("TeleportService"); local RS = game:GetService("ReplicatedStorage"); local HS = game:GetService("HttpService"); local LP = game:GetService("Players").LocalPlayer
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
			local res = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"); local data = HS:JSONDecode(res); local servers = {}
			for _, s in data.data do
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
		UI_Library:AddConnection(target:GetPropertyChangedSignal("Value"), function()
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
L_joinSec_ = val_452:AddSection"servers"; L_joinSec_:AddBox({ text = "server id", flag = "Join Server Id", value = "", skipflag = true })
L_joinSec_:AddButton({
	text = "join server",
	callback = function()
		local id = library_flags["Join Server Id"]
		if not id or id == "" or id == "..." then
			val_462.text = "Enter a server id first!"; val_462:Show(); return
		end
		id = tostring(id):gsub("%s+", "")
		local ok, err = pcall(function()
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, id, game:GetService("Players").LocalPlayer)
		end)
		if not ok then
			val_462.text = "Failed to join: " .. tostring(err); val_462:Show()
		end
	end
})
L_joinSec_:AddButton({
	text = "copy current server id",
	callback = function()
		pcall(function() setclipboard(tostring(game.JobId)) end)
		val_462.text = "Current server id copied to clipboard."; val_462:Show()
	end
})
L_joinSec_:AddButton({
	text = "server hop (random)",
	callback = function()
		local ok, err = pcall(function()
			local res = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"); local data = game:GetService("HttpService"):JSONDecode(res); local servers = {}
			for _, s in data.data do
				if type(s) == "table" and s.playing and s.maxPlayers and s.playing < s.maxPlayers and s.id ~= game.JobId then
					table.insert(servers, s.id)
				end
			end
			if #servers == 0 then error("no available servers found") end
			local pick = servers[math.random(1, #servers)]
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, pick, game:GetService("Players").LocalPlayer)
		end)
		if not ok then
			val_462.text = "Server hop failed: " .. tostring(err); val_462:Show()
		end
	end
})
end
for var_142, var_53 in val_662.Viewmodels:GetDescendants() do
	if var_53.Name == "HumanoidRootPart" and var_53:IsA("BasePart") then
		var_53.Transparency = 1
	end
end 
val_463 = val_662.Viewmodels:Clone(); val_463.Name = "Viewmodel_Save"; val_463.Parent = val_662; local val_464, val_465 = {}, {}; L_CUSTOM_MODELS_DEFAULT = [[ [ {"modelid":"rbxassetid://7285197035/Knives/ACT Trophy","weaponname":"defaultknife","modelname":"ACT Trophy"}, {"modelid":"rbxassetid://7285197035/Knives/Arsenal Butterfly Knife","weaponname":"defaultknife","modelname":"Arsenal Butterfly Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Arsenal Karambit","weaponname":"defaultknife","modelname":"Arsenal Karambit"}, {"modelid":"rbxassetid://7285197035/Knives/Balloon Sword","weaponname":"defaultknife","modelname":"Balloon Sword"}, {"modelid":"rbxassetid://7285197035/Knives/Ban Hammer","weaponname":"defaultknife","modelname":"Ban Hammer"}, {"modelid":"rbxassetid://7285197035/Knives/Banana","weaponname":"defaultknife","modelname":"Banana"}, {"modelid":"rbxassetid://7285197035/Knives/Bat","weaponname":"defaultknife","modelname":"Bat"}, {"modelid":"rbxassetid://7285197035/Knives/Baton","weaponname":"defaultknife","modelname":"Baton"}, {"modelid":"rbxassetid://7285197035/Knives/Battle Axe","weaponname":"defaultknife","modelname":"Battle Axe"}, {"modelid":"rbxassetid://7285197035/Knives/Bayonet","weaponname":"defaultknife","modelname":"Bayonet"}, {"modelid":"rbxassetid://7285197035/Knives/Bearded Axe","weaponname":"defaultknife","modelname":"Bearded Axe"}, {"modelid":"rbxassetid://7285197035/Knives/Bloxy","weaponname":"defaultknife","modelname":"Bloxy"}, {"modelid":"rbxassetid://7285197035/Knives/Bloxy Cola","weaponname":"defaultknife","modelname":"Bloxy Cola"}, {"modelid":"rbxassetid://7285197035/Knives/Bouquet","weaponname":"defaultknife","modelname":"Bouquet"}, {"modelid":"rbxassetid://7285197035/Knives/Bowie Knife","weaponname":"defaultknife","modelname":"Bowie Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Brass Knuckles","weaponname":"defaultknife","modelname":"Brass Knuckles"}, {"modelid":"rbxassetid://7285197035/Knives/Butterfly Knife","weaponname":"defaultknife","modelname":"Butterfly Knife"}, {"modelid":"rbxassetid://7285197035/Knives/CT Knife","weaponname":"defaultknife","modelname":"CT Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Calculator","weaponname":"defaultknife","modelname":"Calculator"}, {"modelid":"rbxassetid://7285197035/Knives/Candleabra","weaponname":"defaultknife","modelname":"Candleabra"}, {"modelid":"rbxassetid://7285197035/Knives/Candy Cane","weaponname":"defaultknife","modelname":"Candy Cane"}, {"modelid":"rbxassetid://7285197035/Knives/Candy Cane Claws","weaponname":"defaultknife","modelname":"Candy Cane Claws"}, {"modelid":"rbxassetid://7285197035/Knives/Candy Cane Sword","weaponname":"defaultknife","modelname":"Candy Cane Sword"}, {"modelid":"rbxassetid://7285197035/Knives/Classic Knife","weaponname":"defaultknife","modelname":"Classic Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Classic Sword","weaponname":"defaultknife","modelname":"Classic Sword"}, {"modelid":"rbxassetid://7285197035/Knives/Claws","weaponname":"defaultknife","modelname":"Claws"}, {"modelid":"rbxassetid://7285197035/Knives/Cleaver","weaponname":"defaultknife","modelname":"Cleaver"}, {"modelid":"rbxassetid://7285197035/Knives/Coal Scythe","weaponname":"defaultknife","modelname":"Coal Scythe"}, {"modelid":"rbxassetid://7285197035/Knives/Coal Sword","weaponname":"defaultknife","modelname":"Coal Sword"}, {"modelid":"rbxassetid://7285197035/Knives/Combat Knife","weaponname":"defaultknife","modelname":"Combat Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Crewmate","weaponname":"defaultknife","modelname":"Crewmate"}, {"modelid":"rbxassetid://7285197035/Knives/Crowbar","weaponname":"defaultknife","modelname":"Crowbar"}, {"modelid":"rbxassetid://7285197035/Knives/Crucible","weaponname":"defaultknife","modelname":"Crucible"}, {"modelid":"rbxassetid://7285197035/Knives/Dagger","weaponname":"defaultknife","modelname":"Dagger"}, {"modelid":"rbxassetid://7285197035/Knives/Darkheart","weaponname":"defaultknife","modelname":"Darkheart"}, {"modelid":"rbxassetid://7285197035/Knives/Energy Blade","weaponname":"defaultknife","modelname":"Energy Blade"}, {"modelid":"rbxassetid://7285197035/Knives/Falchion Knife","weaponname":"defaultknife","modelname":"Falchion Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Fisticuffs","weaponname":"defaultknife","modelname":"Fisticuffs"}, {"modelid":"rbxassetid://7285197035/Knives/Flip Knife","weaponname":"defaultknife","modelname":"Flip Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Funny Melee","weaponname":"defaultknife","modelname":"Funny Melee"}, {"modelid":"rbxassetid://7285197035/Knives/Glacier Blade","weaponname":"defaultknife","modelname":"Glacier Blade"}, {"modelid":"rbxassetid://7285197035/Knives/Golden Knife","weaponname":"defaultknife","modelname":"Golden Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Gut Knife","weaponname":"defaultknife","modelname":"Gut Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Huntsman Knife","weaponname":"defaultknife","modelname":"Huntsman Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Icicle","weaponname":"defaultknife","modelname":"Icicle"}, {"modelid":"rbxassetid://7285197035/Knives/Illumina","weaponname":"defaultknife","modelname":"Illumina"}, {"modelid":"rbxassetid://7285197035/Knives/Karambit","weaponname":"defaultknife","modelname":"Karambit"}, {"modelid":"rbxassetid://7285197035/Knives/Katana","weaponname":"defaultknife","modelname":"Katana"}, {"modelid":"rbxassetid://7285197035/Knives/Kermit","weaponname":"defaultknife","modelname":"Kermit"}, {"modelid":"rbxassetid://7285197035/Knives/Kitchen Knife","weaponname":"defaultknife","modelname":"Kitchen Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Kogti","weaponname":"defaultknife","modelname":"Kogti"}, {"modelid":"rbxassetid://7285197035/Knives/M9 Bayonet","weaponname":"defaultknife","modelname":"M9 Bayonet"}, {"modelid":"rbxassetid://7285197035/Knives/Navaja Knife","weaponname":"defaultknife","modelname":"Navaja Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Nomad Knife","weaponname":"defaultknife","modelname":"Nomad Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Old Bayonet","weaponname":"defaultknife","modelname":"Old Bayonet"}, {"modelid":"rbxassetid://7285197035/Knives/Old Butterfly Knife","weaponname":"defaultknife","modelname":"Old Butterfly Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Old Gut Knife","weaponname":"defaultknife","modelname":"Old Gut Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Old Karambit Twitch","weaponname":"defaultknife","modelname":"Old Karambit Twitch"}, {"modelid":"rbxassetid://7285197035/Knives/Paddle","weaponname":"defaultknife","modelname":"Paddle"}, {"modelid":"rbxassetid://7285197035/Knives/Paracord Knife","weaponname":"defaultknife","modelname":"Paracord Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Patrick","weaponname":"defaultknife","modelname":"Patrick"}, {"modelid":"rbxassetid://7285197035/Knives/Pencil","weaponname":"defaultknife","modelname":"Pencil"}, {"modelid":"rbxassetid://7285197035/Knives/Peppermint Hammer","weaponname":"defaultknife","modelname":"Peppermint Hammer"},
{"modelid":"rbxassetid://7285197035/Knives/Shadow Daggers","weaponname":"defaultknife","modelname":"Shadow Daggers"},
{"modelid":"rbxassetid://7285197035/Knives/Skeleton Knife","weaponname":"defaultknife","modelname":"Skeleton Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Stiletto Knife","weaponname":"defaultknife","modelname":"Stiletto Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Survival Knife","weaponname":"defaultknife","modelname":"Survival Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Talon Knife","weaponname":"defaultknife","modelname":"Talon Knife"}, {"modelid":"rbxassetid://7285197035/Knives/Ursus Knife","weaponname":"defaultknife","modelname":"Ursus Knife"}, {"modelid":"rbxassetid://6482139276","weaponname":"AK47","modelname":"AK47"}, {"modelid":"rbxassetid://7161345483","weaponname":"AK47","modelname":"Dragon AK-47"}, {"modelid":"rbxassetid://6695013713","weaponname":"AK47","modelname":"Old AK47 TEST!!!"}, {"modelid":"rbxassetid://6685334889","weaponname":"AK47","modelname":"Old AK47 | Asiimov"}, {"modelid":"rbxassetid://6657382536","weaponname":"AK47","modelname":"Old AK47 | Eve"}, {"modelid":"rbxassetid://6657379343","weaponname":"AK47","modelname":"Old AK47 | Hallows"}, {"modelid":"rbxassetid://6657377436","weaponname":"AK47","modelname":"Old AK47 | Hypersonic"}, {"modelid":"rbxassetid://6657374606","weaponname":"AK47","modelname":"Old AK47 | Mean Green"}, {"modelid":"rbxassetid://6657370212","weaponname":"AK47","modelname":"Old AK47 | VAV"}, {"modelid":"rbxassetid://6594157951","weaponname":"AWP","modelname":"AWP But with comically large barrel"}, {"modelid":"rbxassetid://6578171344","weaponname":"AWP","modelname":"AWP No Scope"}, {"modelid":"rbxassetid://6605596017","weaponname":"AWP","modelname":"AWP | No Scope"}, {"modelid":"rbxassetid://6477535517","weaponname":"AWP","modelname":"Arsenal AWP"}, {"modelid":"rbxassetid://6477308219","weaponname":"AWP","modelname":"Barett"}, {"modelid":"rbxassetid://7161319343","weaponname":"AWP","modelname":"CSGO AWP"},
{"modelid":"rbxassetid://7161371614","weaponname":"AWP","modelname":"Codol"},
{"modelid":"rbxassetid://6482147359","weaponname":"AWP","modelname":"Mosin"}, {"modelid":"rbxassetid://6566015453","weaponname":"AWP","modelname":"Old AWP"}, {"modelid":"rbxassetid://6647769269","weaponname":"AWP","modelname":"Old AWP 02"}, {"modelid":"rbxassetid://6603299079","weaponname":"AWP","modelname":"Old AWP Doge Lore"}, {"modelid":"rbxassetid://6655720351","weaponname":"AWP","modelname":"Old AWP Weeb"}, {"modelid":"rbxassetid://6688342167","weaponname":"AWP","modelname":"Old AWP | Asiimov"}, {"modelid":"rbxassetid://6688424468","weaponname":"AWP","modelname":"Old AWP | Capillary"}, {"modelid":"rbxassetid://6688324627","weaponname":"AWP","modelname":"Old AWP | Dragon Lore"}, {"modelid":"rbxassetid://6688402770","weaponname":"AWP","modelname":"Old AWP | Exoskeleton"}, {"modelid":"rbxassetid://6688381209","weaponname":"AWP","modelname":"Old AWP | Fever Dream"}, {"modelid":"rbxassetid://6655883134","weaponname":"AWP","modelname":"Old AWP | Grepkin"}, {"modelid":"rbxassetid://6685386801","weaponname":"AWP","modelname":"Old AWP | Hyper Beast"}, {"modelid":"rbxassetid://6655879015","weaponname":"AWP","modelname":"Old AWP | JTF2"}, {"modelid":"rbxassetid://6685391063","weaponname":"AWP","modelname":"Old AWP | Medusa"}, {"modelid":"rbxassetid://6688373364","weaponname":"AWP","modelname":"Old AWP | Mortis"}, {"modelid":"rbxassetid://6685382109","weaponname":"AWP","modelname":"Old AWP | Neo Noir"}, {"modelid":"rbxassetid://6657360618","weaponname":"AWP","modelname":"Old AWP | Nerf"}, {"modelid":"rbxassetid://6605587179","weaponname":"AWP","modelname":"Old AWP | No Scope"}, {"modelid":"rbxassetid://6688410239","weaponname":"AWP","modelname":"Old AWP | Phobos"}, {"modelid":"rbxassetid://6688395944","weaponname":"AWP","modelname":"Old AWP | Redine"}, {"modelid":"rbxassetid://6476965169","weaponname":"AWP","modelname":"Pulse Musket"}, {"modelid":"rbxassetid://6477284418","weaponname":"AWP","modelname":"Railgun"}, {"modelid":"rbxassetid://6570678542","weaponname":"Bayonet","modelname":"Old Bayonet | Twitch"}, {"modelid":"rbxassetid://6570650309","weaponname":"Bayonet","modelname":"Old Bayonet, but with new bayonet animations"}, {"modelid":"rbxassetid://7010083169","weaponname":"Bearded Axe","modelname":"Prime Axe valorant"}, {"modelid":"rbxassetid://7055208812","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife V2"}, {"modelid":"rbxassetid://6500829342","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife v2"},
{"modelid":"rbxassetid://7055149338","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Bloodwidow"},
{"modelid":"rbxassetid://6559364836","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Bloodwidow v2"},
{"modelid":"rbxassetid://7055159032","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Crippled Fade"}, {"modelid":"rbxassetid://7055161937","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Frozen Dream"}, {"modelid":"rbxassetid://7055165378","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Hallows"}, {"modelid":"rbxassetid://7055168852","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Jade Dream"}, {"modelid":"rbxassetid://6566215977","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Jade Dream v2"}, {"modelid":"rbxassetid://7055171877","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Marbleized"}, {"modelid":"rbxassetid://7055176584","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Naval"}, {"modelid":"rbxassetid://6559368966","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Ruby"}, {"modelid":"rbxassetid://7055180908","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Ruby V2"}, {"modelid":"rbxassetid://6568018757","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Sapphire"}, {"modelid":"rbxassetid://6557295747","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Twitch"}, {"modelid":"rbxassetid://7055189620","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | Twitch V2"}, {"modelid":"rbxassetid://7055193166","weaponname":"Butterfly Knife","modelname":"Old Butterfly Knife | White Boss"}, {"modelid":"rbxassetid://6500095467","weaponname":"DesertEagle","modelname":"Pathbringer"}, {"modelid":"rbxassetid://6477313539","weaponname":"Glock","modelname":"Soul Pistol"}, {"modelid":"rbxassetid://6570236804","weaponname":"HE Grenade","modelname":"Heywe nade"}, {"modelid":"rbxassetid://6565837869","weaponname":"Huntsman Knife","modelname":"Old Huntsman Knife"}, {"modelid":"rbxassetid://6553852233","weaponname":"Huntsman Knife","modelname":"Old Huntsman Knife | Ruby"}, {"modelid":"rbxassetid://6476897690","weaponname":"Karambit","modelname":"Old Karambit"}, {"modelid":"rbxassetid://6566125740","weaponname":"Karambit","modelname":"Old Karambit | Gold"}, {"modelid":"rbxassetid://6569305303","weaponname":"Karambit","modelname":"Old Karambit | Twitch"}, {"modelid":"rbxassetid://6566770855","weaponname":"M4A1","modelname":"Old M4A1"}, {"modelid":"rbxassetid://6657401969","weaponname":"M4A4","modelname":"Old M4A4 | BOT [S]"}, {"modelid":"rbxassetid://7161407697","weaponname":"Scout","modelname":"CSGO Scout"}, {"modelid":"rbxassetid://6477587469","weaponname":"Scout","modelname":"M1 Garand"}, {"modelid":"rbxassetid://6482207385","weaponname":"Scout","modelname":"Mosin-Nagant Optical"}, {"modelid":"rbxassetid://7161433164","weaponname":"Scout","modelname":"Newan Scout"}, {"modelid":"rbxassetid://7161365495","weaponname":"USP","modelname":"Newan USP"}, {"modelid":"rbxassetid://6657391998","weaponname":"USP","modelname":"Old USP-S | Yellowbelly"}, {"modelid":"rbxassetid://6481976224","weaponname":"USP","modelname":"Silenced Pistol"}, {"modelid":"rbxassetid://6571605917","weaponname":"defaultknife","modelname":"$19 Fortnite Card"}, {"modelid":"rbxassetid://7161226974","weaponname":"defaultknife","modelname":"Atlast Knife"}, {"modelid":"rbxassetid://7160993313","weaponname":"defaultknife","modelname":"Banana Obama"}, {"modelid":"rbxassetid://6562607282","weaponname":"defaultknife","modelname":"Boxfun"}, {"modelid":"rbxassetid://6557148153","weaponname":"defaultknife","modelname":"Burger"}, {"modelid":"rbxassetid://6590565396","weaponname":"defaultknife","modelname":"CSGO M9 Autotronic"}, {"modelid":"rbxassetid://6597109573","weaponname":"defaultknife","modelname":"CSGO M9 Nebula"}, {"modelid":"rbxassetid://9480614267","weaponname":"defaultknife","modelname":"Cube Bomb"}, {"modelid":"rbxassetid://6558482294","weaponname":"defaultknife","modelname":"Da Melee"}, {"modelid":"rbxassetid://7161134543","weaponname":"defaultknife","modelname":"Dirt Block"}, {"modelid":"rbxassetid://9480170879","weaponname":"defaultknife","modelname":"Frame Picture"}, {"modelid":"rbxassetid://7161100828","weaponname":"defaultknife","modelname":"Gold Ring"},
{"modelid":"rbxassetid://6768617400","weaponname":"defaultknife","modelname":"Gordons Kitchen Knifes"},
{"modelid":"rbxassetid://6565691328","weaponname":"defaultknife","modelname":"Ham"}, {"modelid":"rbxassetid://6562139237","weaponname":"defaultknife","modelname":"Heywe Cube"}, {"modelid":"rbxassetid://6500791405","weaponname":"defaultknife","modelname":"Imposter"}, {"modelid":"rbxassetid://7374148548","weaponname":"defaultknife","modelname":"Kruk"}, {"modelid":"rbxassetid://7161024042","weaponname":"defaultknife","modelname":"Megu"}, {"modelid":"rbxassetid://7917769386","weaponname":"defaultknife","modelname":"Netherite Sword"}, {"modelid":"rbxassetid://7161049979","weaponname":"defaultknife","modelname":"NoMadFix"}, {"modelid":"rbxassetid://6478215819","weaponname":"defaultknife","modelname":"Pickaxe"}, {"modelid":"rbxassetid://7161018687","weaponname":"defaultknife","modelname":"Pillow"}, {"modelid":"rbxassetid://7161045678","weaponname":"defaultknife","modelname":"Sausage"}, {"modelid":"rbxassetid://7259218667","weaponname":"defaultknife","modelname":"Staff"}, {"modelid":"rbxassetid://7161029620","weaponname":"defaultknife","modelname":"Stillet"}, {"modelid":"rbxassetid://7161120469","weaponname":"defaultknife","modelname":"Stillet Stocked"}, {"modelid":"rbxassetid://6476945399","weaponname":"defaultknife","modelname":"Sword"}, {"modelid":"rbxassetid://7161230940","weaponname":"defaultknife","modelname":"Valor Knife"}, {"modelid":"rbxassetid://9471029205","weaponname":"defaultknife","modelname":"Valor Knife V2"}, {"modelid":"rbxassetid://6557159354","weaponname":"defaultknife","modelname":"Very Long Bat"}, {"modelid":"rbxassetid://9473358237","weaponname":"defaultknife","modelname":"cirno knife"} ] ]]
	val_464 = game:service("HttpService"):JSONDecode(L_CUSTOM_MODELS_DEFAULT); val_465 = {}
	for var_81, var_212 in val_464 do
		if type(var_212) == "table" and type(var_212.modelname) == "string" then
			table.insert(val_465, var_212.modelname)
		end
	end
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
	for _, name in val_980 do
		addName(name)
	end
	addName(library_flags["Custom Models"])
	return applied
end
local function restoreViewmodelsBackup()
	if not val_463 then
		return false
	end
	local ok = pcall(function()
		local existing = val_662:FindFirstChild("Viewmodels")
		if existing then
			existing:Destroy()
		end
		local clone = val_463:Clone(); clone.Name = "Viewmodels"; clone.Parent = val_662
	end)
	if ok then
		val_978 = {}; val_980 = {}
	end
	return ok
end
local function loadModel(modelid)
	local parts = string.split(modelid, "/")
	if #parts > 3 then
		local base = game:GetObjects(parts[1] .. "//" .. parts[3])[1]
		for i = 4, #parts do
			if base then base = base:FindFirstChild(parts[i]) end
		end
		return base and base:Clone()
	else
		return game:GetObjects(modelid)[1]
	end
end
function equipCustomModel(var_72)
	if type(var_72) ~= "string" or var_72 == "" then
		return false
	end
	for var_274, var_160 in val_464 do
		if var_160.modelname == var_72 then
			if var_160.weaponname == "defaultknife" then
				for var_177 = 1, 2 do
					local val_477 = var_177 == 1 and "T" or "CT"; local val_478 = loadModel(var_160.modelid)
					if not val_478 then
						error("failed to load model asset")
					end
					val_478.Name = "v_" .. val_477 .. " Knife"; local oldVm = val_662.Viewmodels:FindFirstChild("v_" .. val_477 .. " Knife")
					if oldVm then
						oldVm:Destroy()
					end
					val_478.Parent = val_662.Viewmodels 
					if val_478:FindFirstChild("HumanoidRootPart") then
						val_478.HumanoidRootPart.Transparency = 1 
					end
					if not val_478:FindFirstChild("stab") and val_478:FindFirstChild("fire") then
						local val_479 = val_478.fire:Clone(); val_479.Parent = val_478; val_479.Name = "stab"
					end 
					if val_478:FindFirstChild("AIM") then
						val_478.AIM:Destroy()
					end 
					if var_160.modelname == "Netherite Sword" and val_478:FindFirstChild("Handle") then
						val_478.Handle.TextureID = "rbxassetid://7375049028"
					end
					if not customModelListHas(val_978, val_477 .. " Knife") then
						table.insert(val_978, val_477 .. " Knife")
					end
				end
			else
				local val_480 = loadModel(var_160.modelid)
				if not val_480 then
					error("failed to load model asset")
				end
				val_480.Name = "v_" .. var_160.weaponname; local oldVm = val_662.Viewmodels:FindFirstChild("v_" .. var_160.weaponname)
				if oldVm then
					oldVm:Destroy()
				end
				val_480.Parent = val_662.Viewmodels 
				if val_480:FindFirstChild("HumanoidRootPart") then
					val_480.HumanoidRootPart.Transparency = 1 
				end
				if not customModelListHas(val_978, var_160.weaponname) then
					table.insert(val_978, var_160.weaponname)
				end
			end 
			if not customModelListHas(val_980, var_72) then
				table.insert(val_980, var_72)
			end
			return true
		end
	end
	return false
end 
local function applySavedCustomModels(modelNames, silent)
	if type(modelNames) ~= "table" or #modelNames == 0 then
		return false, "nothing to load"
	end
	if not restoreViewmodelsBackup() then
		return false, "viewmodel backup missing"
	end
	local applied = 0; local errors = {}
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
	ensureClarityFolder(); local models = getCustomModelsToSave()
	if #models == 0 then
		return false, "select or apply a custom model first"
	end
	local data = { applied = models, selected = library_flags["Custom Models"] or models[1] or "", favorites = favoriteCustomModels }; writefile(CUSTOM_MODELS_SAVE_PATH, game:GetService"HttpService":JSONEncode(data))
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
env.SaveCustomModels = saveCustomModelsToFile; env.LoadCustomModels = loadCustomModelsFromFile; env.GetCustomModelsToSave = getCustomModelsToSave; custommodeltextthingy = nil 
task.spawn(function()
	repeat task.wait(0.1) until env.SkinsPageFrame
	local pf = env.SkinsPageFrame; local bgCol = Color3.fromRGB(16, 17, 16); local borderCol = Color3.fromRGB(38, 38, 38); local textCol = Color3.fromRGB(200, 200, 200); local btnCol = Color3.fromRGB(22, 22, 22); local cmFrame = Instance.new("Frame", pf); cmFrame.Name = "CustomModelsSection"; cmFrame.Size = UDim2.new(0.95, 0, 0, 0); cmFrame.AutomaticSize = Enum.AutomaticSize.Y; cmFrame.BackgroundColor3 = bgCol; cmFrame.BorderSizePixel = 0; cmFrame.LayoutOrder = 100; local cmCorner = Instance.new("UICorner", cmFrame); cmCorner.CornerRadius = UDim.new(0, 3); local cmStroke = Instance.new("UIStroke", cmFrame); cmStroke.Color = borderCol; cmStroke.Thickness = 1; local cmLayout = Instance.new("UIListLayout", cmFrame); cmLayout.Padding = UDim.new(0, 4); cmLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center; cmLayout.SortOrder = Enum.SortOrder.LayoutOrder; local cmPad = Instance.new("UIPadding", cmFrame); cmPad.PaddingTop = UDim.new(0, 6); cmPad.PaddingBottom = UDim.new(0, 8); cmPad.PaddingLeft = UDim.new(0, 8); cmPad.PaddingRight = UDim.new(0, 8); local title = Instance.new("TextLabel", cmFrame); title.Size = UDim2.new(1, 0, 0, 20); title.BackgroundTransparency = 1; title.Text = "custom models"; title.Font = Enum.Font.Code; title.TextSize = 13; title.TextColor3 = Color3.fromRGB(255, 255, 255); title.LayoutOrder = 0; local dropRow = Instance.new("Frame", cmFrame); dropRow.Size = UDim2.new(1, 0, 0, 22); dropRow.BackgroundTransparency = 1; dropRow.LayoutOrder = 1; local dropLabel = Instance.new("TextLabel", dropRow); dropLabel.Size = UDim2.new(0.4, 0, 1, 0); dropLabel.BackgroundTransparency = 1; dropLabel.Text = "model"; dropLabel.Font = Enum.Font.Code; dropLabel.TextSize = 12; dropLabel.TextColor3 = textCol; dropLabel.TextXAlignment = Enum.TextXAlignment.Left; local dropBtn = Instance.new("TextButton", dropRow); dropBtn.Size = UDim2.new(0.58, 0, 1, 0); dropBtn.Position = UDim2.new(0.42, 0, 0, 0); dropBtn.BackgroundColor3 = btnCol; dropBtn.Text = val_465[1] or "---"; dropBtn.Font = Enum.Font.Code; dropBtn.TextSize = 11; dropBtn.TextColor3 = textCol; Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 3); Instance.new("UIStroke", dropBtn).Color = borderCol; library_flags["Custom Models"] = val_465[1] or ""; local searchBox = Instance.new("TextBox", cmFrame); searchBox.Size = UDim2.new(1, 0, 0, 20); searchBox.BackgroundColor3 = Color3.fromRGB(16, 16, 16); searchBox.PlaceholderText = "search models..."; searchBox.Text = ""; searchBox.Font = Enum.Font.Code; searchBox.TextSize = 11; searchBox.TextColor3 = textCol; searchBox.Visible = false; searchBox.LayoutOrder = 2; Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 3); Instance.new("UIStroke", searchBox).Color = borderCol; local dropList = Instance.new("ScrollingFrame", cmFrame); dropList.Size = UDim2.new(1, 0, 0, 0); dropList.BackgroundColor3 = Color3.fromRGB(12, 12, 12); dropList.BorderSizePixel = 0; dropList.Visible = false; dropList.LayoutOrder = 3; dropList.ScrollBarThickness = 2; dropList.AutomaticCanvasSize = Enum.AutomaticSize.Y; Instance.new("UICorner", dropList).CornerRadius = UDim.new(0, 3); local dlLayout = Instance.new("UIListLayout", dropList); dlLayout.Padding = UDim.new(0, 1)
	local setCustomModelDropdownSelection
	local function rebuildDropList()
		if env._FavoriteCustomModels then
			favoriteCustomModels = env._FavoriteCustomModels; env._FavoriteCustomModels = nil
		end
		for _, c in dropList:GetChildren() do
			if c:IsA("Frame") or c:IsA("TextButton") then c:Destroy() end
		end
		local function isFav(n)
			for _, v in favoriteCustomModels do if v == n then return true end end
			return false
		end
		local q = searchBox.Text:lower(); local filtered = {}
		for _, name in val_465 do
			if q == "" or name:lower():find(q, 1, true) then
				table.insert(filtered, name)
			end
		end
		table.sort(filtered, function(a, b)
			local fa = isFav(a); local fb = isFav(b)
			if fa == fb then return a:lower() < b:lower() end
			return fa
		end)
		local count = #filtered; dropList.Size = UDim2.new(1, 0, 0, math.min(count * 20, 150))
		for i, name in filtered do
			local item = Instance.new("Frame", dropList); item.Size = UDim2.new(1, 0, 0, 20); item.BackgroundColor3 = i % 2 == 0 and Color3.fromRGB(18, 18, 18) or Color3.fromRGB(14, 14, 14); item.BorderSizePixel = 0; local favBtn = Instance.new("TextButton", item); favBtn.Size = UDim2.new(0, 20, 1, 0); favBtn.BackgroundTransparency = 1; favBtn.Text = isFav(name) and "★" or "☆"; favBtn.TextColor3 = isFav(name) and Color3.fromRGB(255, 215, 0) or Color3.fromRGB(120, 120, 120); favBtn.Font = Enum.Font.Code; favBtn.TextSize = 14; local btn = Instance.new("TextButton", item); btn.Size = UDim2.new(1, -24, 1, 0); btn.Position = UDim2.new(0, 24, 0, 0); btn.BackgroundTransparency = 1; btn.Text = name; btn.Font = Enum.Font.Code; btn.TextSize = 11; btn.TextColor3 = textCol; btn.TextXAlignment = Enum.TextXAlignment.Left
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
				dropList.Visible = false; searchBox.Visible = false; dropList.Size = UDim2.new(1, 0, 0, 0); cmFrame.Size = UDim2.new(0.95, 0, 0, 0)
				if setCustomModelDropdownSelection then
					setCustomModelDropdownSelection(name)
				else
					dropBtn.Text = name; library_flags["Custom Models"] = name
				end
			end)
		end
	end
	env._RebuildCustomModelsList = rebuildDropList; searchBox:GetPropertyChangedSignal("Text"):Connect(rebuildDropList); local cmInfoLabel = Instance.new("TextLabel", cmFrame); cmInfoLabel.Size = UDim2.new(1, 0, 0, 16); cmInfoLabel.BackgroundTransparency = 1; cmInfoLabel.Text = "for: ---"; cmInfoLabel.Font = Enum.Font.Code; cmInfoLabel.TextSize = 11; cmInfoLabel.TextColor3 = Color3.fromRGB(130, 130, 130); cmInfoLabel.LayoutOrder = 3; local weaponByModelName = {}
	local function indexModels(list)
		if type(list) ~= "table" then
			return
		end
		for _, m in list do
			if type(m) == "table" and type(m.modelname) == "string" and type(m.weaponname) == "string" and m.weaponname ~= "" then
				if weaponByModelName[m.modelname] == nil then
					weaponByModelName[m.modelname] = m.weaponname
				end
			end
		end
	end
	indexModels(val_464)
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
		for _, mdl in val_464 do
			if type(mdl) == "table" and mdl.modelname == name and type(mdl.weaponname) == "string" and mdl.weaponname ~= "" then
				return mdl.weaponname
			end
		end
		return nil
	end
	dropBtn.MouseButton1Click:Connect(function()
		dropList.Visible = not dropList.Visible; searchBox.Visible = dropList.Visible
		if dropList.Visible then
			searchBox.Text = ""; rebuildDropList()
		else
			dropList.Size = UDim2.new(1, 0, 0, 0)
		end
	end)
	setCustomModelDropdownSelection = function(name)
		if type(name) ~= "string" or name == "" or name == "---" then
			return
		end
		library_flags["Custom Models"] = name; dropBtn.Text = name; local wn = weaponForModel(name); cmInfoLabel.Text = "for: " .. (wn or "---")
	end
	if type(val_465[1]) == "string" and val_465[1] ~= "" then
		cmInfoLabel.Text = "for: " .. (weaponForModel(val_465[1]) or "---")
	end
	env._SetCustomModelDropdownSelection = setCustomModelDropdownSelection
	rebuildDropList()
	local function makeBtn(text, order, callback)
		local btn = Instance.new("TextButton", cmFrame); btn.Size = UDim2.new(1, 0, 0, 24); btn.BackgroundColor3 = btnCol; btn.Text = text; btn.Font = Enum.Font.Code; btn.TextSize = 12; btn.TextColor3 = textCol; btn.LayoutOrder = order; Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 3); Instance.new("UIStroke", btn).Color = borderCol; btn.MouseButton1Click:Connect(callback)
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
		val_462.text = "Refreshed custom models from config!"; val_462:Show()
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
		local ok, msg = loadCustomModelsFromFile({ setSelection = setCustomModelDropdownSelection })
		if ok then
			warn("[clarity.tk] " .. msg)
		else
			warn("[clarity.tk] " .. tostring(msg))
		end
	end)
	makeBtn("Unlock Inventory", 9, function()
		if env.InventoryUnlocked then
			warn("[clarity.tk] inventory already unlocked"); return
		end
		local ok, err = pcall(function()
			local LocalPlayer = game:GetService("Players").LocalPlayer; local Client = getsenv(LocalPlayer.PlayerGui.Client); local HttpService = game:GetService("HttpService"); local Data = require(game:GetService("ReplicatedFirst").Data); local ReplicatedStorage = game:GetService("ReplicatedStorage")
			local SkinsTable = (function()
				local Skins = {}; local SeenSkins = {}
				local function AddSkinEntry(entry)
					local weapon = entry.weaponname; local skin = entry.skinname
					if type(weapon) ~= "string" or type(skin) ~= "string" or weapon == "" or skin == "" then
						return
					end
					local key = weapon .. "_" .. skin
					if SeenSkins[key] then
						return
					end
					SeenSkins[key] = true; Skins[HttpService:GenerateGUID(false)] = { key, weaponname = weapon, skinname = skin, skins = entry.skins, image = entry.image, rarity = entry.rarity }
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
				local TWeapons = { "Glock", "DualBerettas", "P250", "Tec9", "CZ", "DesertEagle", "R8", "Nova", "XM", "SawedOff", "M249", "Negev", "MAC10", "MP7", "MP7-SD", "UMP", "P90", "Bizon", "Galil", "AK47", "Scout", "SG", "AWP", "G3SG1", "Kevlar Vest", "Kevlar + Helmet", "Molotov", "Decoy Grenade", "Flashbang", "HE Grenade", "Smoke Grenade" }
				local CTWeapons = { "P2000", "USP", "DualBerettas", "P250", "FiveSeven", "CZ", "DesertEagle", "R8", "Nova", "XM", "MAG7", "M249", "Negev", "MP9", "MP7", "MP7-SD", "UMP", "P90", "Bizon", "Famas", "M4A4", "M4A1", "Scout", "AUG", "AWP", "G3SG1", "Kevlar Vest", "Kevlar + Helmet", "Defuse Kit", "Incendiary Grenade", "Decoy Grenade", "Flashbang", "HE Grenade", "Smoke Grenade" }
				local IsWeaponFundedInThisTeam = function(Team, Gun)
					if Team == "T" then
						if table.find(TWeapons, Gun) then return true end
					elseif Team == "CT" then
						if table.find(CTWeapons, Gun) then return true end
					end
				end
				for Index, Value in Skins do
					local Weapon = table.unpack(string.split(Value[1], "_"))[1]
					if type(Client.CTLoadout) == "table" and IsWeaponFundedInThisTeam("CT", Weapon) then
						Client.CTLoadout[Index] = Value
					end
					if type(Client.TLoadout) == "table" and IsWeaponFundedInThisTeam("T", Weapon) then
						Client.TLoadout[Index] = Value
					end
				end
				return Skins
			end)()
			local Old; Old = hookfunction(Data.GetData, function(Type, ...)
				local ToReturn = Old(Type, ...)
				if type(ToReturn) == "table" then
					for Index, Value in SkinsTable do
						ToReturn[tostring(Index)] = Value
					end
				end
				return ToReturn
			end)
			for Index, Value in getconnections(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent) do
				local Function = Value.Function
				if Function then
					local Old2; Old2 = hookfunction(Function, function(Type, Skins, ...)
						if Type == "CTLoadout" and type(Client.CTLoadout) == "table" then
							Skins = Client.CTLoadout
						elseif Type == "TLoadout" and type(Client.TLoadout) == "table" then
							Skins = Client.TLoadout
						elseif Type == "Inventory" then
							Skins = SkinsTable
						end
						return Old2(Type, Skins, ...)
					end)
				end
			end
			local OldNC; OldNC = hookmetamethod(game, "__namecall", function(self, ...)
				local Method = getnamecallmethod(); local Args = {...}
				if Method == "FireServer" then
					if self and self.Name == "DataEvent" then
						local Table = Args[1]
						if Table[1] == "EquipItem" then
							if Table[2] ~= "Both" then
								local SkinFolder = LocalPlayer.SkinFolder[Table[2] .. "Folder"]; local Weapon, Skin = table.unpack(string.split(Table[4][1], "_"))
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
									local SkinFolder = LocalPlayer.SkinFolder[Value .. "Folder"]; local Weapon, Skin = table.unpack(string.split(Table[4][1], "_"))
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
			if type(Client.CTLoadout) == "table" and next(Client.CTLoadout) then
				firesignal(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent, "CTLoadout", Client.CTLoadout)
			end
			if type(Client.TLoadout) == "table" and next(Client.TLoadout) then
				firesignal(ReplicatedStorage.Events.InventoryAndLoadout.OnClientEvent, "TLoadout", Client.TLoadout)
			end
		end)
		if ok then
			env.InventoryUnlocked = true; warn("[clarity.tk] inventory unlocked - all skins loaded")
		else
			warn("[clarity.tk] failed to unlock inventory: " .. tostring(err))
		end
	end)
end)
if false then
ConfigSectionOther = val_452:AddSection"Other"
ConfigSectionOther:AddButton({
	text = "Copy To Clipboard",
	callback = function()
		UI_Library:SaveConfig("", true)
	end
})
ConfigSectionOther:AddButton({
	text = "Load From Clipboard",
	callback = function()
		val_462.text = "Are you sure you want to load config from clipboard?"
		if val_462:Show() then
			local val_485 = Instance.new("ScreenGui", game.CoreGui); local val_486 = Instance.new("TextBox", val_485); val_486.Size = UDim2.new(1, 0, 1, 0); val_486.Text = ""; val_486.BackgroundTransparency = 0.99; val_486.TextTransparency = 1; wait(); mouse1click(); wait(); keypress(17); keypress(86); wait(); keyrelease(17); keyrelease(86); wait(); local val_487 = val_486.Text; val_485:Destroy()
			do local _opt = UI_Library.options["Loop Kill"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
			do local _opt = UI_Library.options["Target ESP"]; if _opt and type(_opt.SetState) == "function" then _opt:SetState(false) end end
			local val_488 = UI_Library:LoadConfig("", val_487)
			if val_488 then
				local val_489 = Drawing.new("Text"); val_489.Size = 45; val_489.Center = false; val_489.Position = Vector2.new(20, 20); val_489.Visible = true; val_489.Color = Color3.fromRGB(255, 100, 100); val_489.Outline = true; val_489.Text = "Invalid config!"
				CreateThread(function()
					wait(2); val_489:Remove()
				end)
			end
		end
	end
})
end
task.spawn(function()
	local senv, Data
	pcall(function() senv = getsenv(val_733.PlayerGui.Client) end)
	pcall(function() Data = require(game:GetService("ReplicatedFirst"):WaitForChild("Data")) end)
	if type(senv) ~= "table" then return end
	local emptyFor = {}
	while task.wait(1) do
		for _, key in { "CTLoadout", "TLoadout" } do
			local current = senv[key]; local isTable = type(current) == "table"
			if isTable and next(current) then
				emptyFor[key] = 0
			else
				emptyFor[key] = (emptyFor[key] or 0) + 1
				local value
				if type(Data) == "table" then
					local ok, fetched = pcall(Data.GetData, key)
					if ok and type(fetched) == "table" and next(fetched) then value = fetched end
				end
				if not value and not isTable then
					value = { KnifeOver = false, GloveOver = false }
				elseif not value and emptyFor[key] >= 5 then
					value = { KnifeOver = false, GloveOver = false }
				end
				if value then
					senv[key] = value; emptyFor[key] = 0
					warn("[clarity.tk] repaired " .. key .. " - game had " .. typeof(current) .. " " .. tostring(current))
				end
			end
		end
	end
end)
task.spawn(function()
	local misses = 0
	while task.wait(misses > 2 and 10 or 2) do
		local char = val_733.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart")
		if not hrp or not getgc then continue end
		local known = env.MovementController
		if known and rawget(known, "HumanoidRootPart") == hrp and env.GunState then continue end
		misses = misses + 1
		for _, obj in getgc(true) do
			if type(obj) == "table" and rawget(obj, "Held") ~= nil and rawget(obj, "Held2") ~= nil and rawget(obj, "DISABLED") ~= nil then
				env.GunState = obj
			end
			if type(obj) == "table" and rawget(obj, "GlobalVelocity") and rawget(obj, "Stamina") and rawget(obj, "HumanoidRootPart") == hrp then
				env.MovementController = obj; misses = 0
				if type(rawget(obj, "Jumping")) == "table" and not rawget(obj, "clarityJumpHooked") then
					local origFire = obj.Jumping.Fire
					if type(origFire) == "function" then
						rawset(obj, "clarityJumpHooked", true)
						obj.Jumping.Fire = function(self, ...)
							local hum = rawget(obj, "Humanoid")
							if hum then
								if library_flags["Jumpbug"] and env.jbBindHeld then
									hum.UseJumpPower = true; hum.JumpPower = GAME_JUMP_POWER * (library_flags["jbHeight"] or 4)
								else
									hum.UseJumpPower = false
								end
							end
							return origFire(self, ...)
						end
					end
				end
				if env.GunState then break end
			end
		end
	end
end)
env.runService.Heartbeat:Connect(function()
	local gun = env.GunState
	if gun and UI_Library and UI_Library.open then
		if gun.Held then gun.Held = false end
		if gun.Held2 then gun.Held2 = false end
	end
end)
env.spentThisRound = {}; env.lastCash = {}
task.spawn(function()
	local status = workspace:WaitForChild("Status", 10)
	if status and status:FindFirstChild("Preparation") then
		status.Preparation.Changed:Connect(function(prep)
			if prep then env.spentThisRound = {} end
		end)
	end
	while task.wait(0.2) do
		for _, plr in val_711:GetPlayers() do
			local cash = plr:FindFirstChild("Cash")
			if cash then
				local previous = env.lastCash[plr.Name]
				if previous and cash.Value < previous then
					env.spentThisRound[plr.Name] = (env.spentThisRound[plr.Name] or 0) + (previous - cash.Value)
				end
				env.lastCash[plr.Name] = cash.Value
			end
		end
	end
end)
function menuCapturingInput()
	if env.bindListening then return true end
	if UI_Library and UI_Library.open then return true end
	return env.inputService:GetFocusedTextBox() ~= nil
end
task.spawn(function()
	local canInput
	pcall(function() canInput = require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("CanInput")) end)
	if type(canInput) ~= "function" or not hookfunction then return end
	local old; old = hookfunction(canInput, function(...)
		if menuCapturingInput() then return false end
		return old(...)
	end)
end)
luaTab = UI_Library:AddTab("LUA"); playersTab = UI_Library:AddTab("Players")
	demoTab = UI_Library:AddTab("Demos"); demoCol1 = demoTab:AddColumn(); demoSecRecorder = demoCol1:AddSection("Recorder")
	if not isfolder("clarity.tk") then makefolder("clarity.tk") end
	if not isfolder("clarity.tk/demos") then makefolder("clarity.tk/demos") end
	currentDemoFolder = ""; isRecordingDemos = false; demoSecRecorder:AddBox({ text = "Demo Name", flag = "demoNameInput" }); demoStatusMode = "idle"
	function setDemoStatus(text, color)
		if demoStatusLabel and demoStatusLabel.main then
			demoStatusLabel.main.Text = text; demoStatusLabel.main.TextColor3 = color or Color3.fromRGB(170, 170, 170)
		end
	end
	function startDemoRecording()
		if isRecordingDemos then return end
		val_494 = {}; isRecordingDemos = true; local demoName = library_flags["demoNameInput"]
		if not demoName or demoName == "" then
			demoName = "Demo_" .. tostring(os.time())
		end
		currentDemoFolder = "clarity.tk/demos/" .. demoName
		if not isfolder(currentDemoFolder) then makefolder(currentDemoFolder) end
		demoStatusMode = "recording"; setDemoStatus("Status: Recording", Color3.fromRGB(95, 220, 120))
	end
	function stopDemoRecording()
		if not isRecordingDemos then return end
		isRecordingDemos = false; demoStatusMode = "saving"; local totalTicks = #val_494
		for i, frameData in val_494 do
			if i % 50 == 0 then wait() end
			local success, json = pcall(function() return game:GetService("HttpService"):JSONEncode(frameData) end)
			if success then
				writefile(currentDemoFolder .. "/" .. tostring(i) .. ".tick", json)
			end
			setDemoStatus("Status: Saving ticks " .. tostring(i) .. "/" .. tostring(totalTicks), Color3.fromRGB(235, 190, 80))
		end
		if workspace:FindFirstChild("Map") then
			local mapName = workspace.Map:FindFirstChild("Origin") and workspace.Map.Origin.Value or workspace.Map:GetChildren()[1].Name; local clips = workspace.Map:FindFirstChild("Clips", true); local mapAnchor = nil
			if clips then
				local sum = Vector3.zero; local count = 0
				for _, part in clips:GetDescendants() do
					if part:IsA("BasePart") then
						sum = sum + part.Position; count = count + 1
					end
				end
				if count > 0 then
					local avg = sum / count; mapAnchor = string.format("%.3f %.3f %.3f", avg.X, avg.Y, avg.Z)
				end
			end
			local mapData = {mapName = mapName, mapAnchor = mapAnchor, sky = false, sides = {}}; local skybox = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
			if skybox then
				mapData.sky = true; mapData.sides.SkyboxBk = skybox.SkyboxBk; mapData.sides.SkyboxDn = skybox.SkyboxDn; mapData.sides.SkyboxFt = skybox.SkyboxFt; mapData.sides.SkyboxLf = skybox.SkyboxLf; mapData.sides.SkyboxRt = skybox.SkyboxRt; mapData.sides.SkyboxUp = skybox.SkyboxUp
			end
			writefile(currentDemoFolder .. "/map.tick", game:GetService("HttpService"):JSONEncode(mapData))
		end
		local demoVer = workspace:FindFirstChild("version") and workspace.version.Value or ""; writefile(currentDemoFolder .. "/ver.tick", tostring(demoVer)); val_494 = {}; demoStatusMode = "idle"; setDemoStatus("Status: Saved " .. tostring(totalTicks) .. " ticks", Color3.fromRGB(95, 220, 120))
	end
	demoSecRecorder:AddButton({ text = "Start Recording", callback = startDemoRecording }); demoSecRecorder:AddButton({ text = "Stop Recording", callback = stopDemoRecording })
	demoSecRecorder:AddButton({
		text = "Copy Demo Viewer Link",
		callback = function()
			pcall(function()
				setclipboard("https://www.roblox.com/games/101013872711019/Untitled-Experience")
			end)
			if demoStatusMode == "idle" then
				setDemoStatus("Status: Link copied", Color3.fromRGB(120, 200, 255))
			end
		end
	})
	demoStatusLabel = demoSecRecorder:AddLabel("Status: Not recording"); local DEMO_TICK_INTERVAL = 1 / 32
	task.spawn(function()
		local nextTick = os.clock()
		while true do
			if isRecordingDemos then
				pcall(addTick); setDemoStatus("Status: Recording - " .. tostring(#val_494) .. " ticks", Color3.fromRGB(95, 220, 120)); nextTick = nextTick + DEMO_TICK_INTERVAL; local now = os.clock()
				if nextTick < now then nextTick = now + DEMO_TICK_INTERVAL end
				local waitFor = nextTick - now
				if waitFor > 0 then task.wait(waitFor) else task.wait() end
			else
				nextTick = os.clock(); task.wait(0.1)
			end
		end
	end)
playersCol1 = playersTab:AddColumn(); playersSec1 = playersCol1:AddSection("Player List"); playersSec1:AddPlayerList({ flag = "Player List" }); luaCol1 = luaTab:AddColumn(); luaScripts = {}
pcall(function()
    if not isfolder("clarity.tk/lua") then
        makefolder("clarity.tk/lua")
    end
    for _, file in listfiles("clarity.tk/lua") do
        if file:match("%.lua$") or file:match("%.txt$") then
            local name = file:match("([^/\\]+)%.%w+$")
            if name then
                table.insert(luaScripts, name)
            end
        end
    end
end)
if #luaScripts == 0 then table.insert(luaScripts, "none") end
luaSection = luaCol1:AddSection("Lua"); luaList = luaSection:AddList({ text = "Luas", flag = "scriptlist", values = luaScripts, value = luaScripts[1] })
luaSection:AddButton({
	text = "Run Lua",
	callback = function()
        local selected = library_flags["scriptlist"]
        if selected and selected ~= "none" then
            local success, err = pcall(function()
                local pathLua = "clarity.tk/lua/" .. selected .. ".lua"; local pathTxt = "clarity.tk/lua/" .. selected .. ".txt"
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
            for _, file in listfiles("clarity.tk/lua") do
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
function roundNumber(var_199, var_153)
	return tonumber(string.format("%." .. (var_153 or 0) .. "f", var_199))
end 
val_466 = { "Bayonet", "Huntsman Knife", "Falchion Knife", "Karambit", "Gut Knife", "Butterfly Knife", "M9 Bayonet", "Banana", "Flip Knife", "Sickle", "Bearded Axe", "Cleaver" }
if val_635 then
	val_491 = game:GetService("Players"); val_492 = val_491.LocalPlayer; val_493 = {}
	pcall(function()
		local events = game:GetService("ReplicatedStorage"):FindFirstChild("Events"); local addKill = events and events:FindFirstChild("AddToKillfeed")
		if addKill then
			addKill.OnClientEvent:Connect(function(kill)
				if type(kill) == "table" then
					table.insert(val_493, kill)
				end
			end)
		end
	end)
	val_494 = {}; local val_495 = Instance.new("IntValue"); val_495.Name = "jig"; local val_496 = { "FakeHead", "UpperTorso", "LowerTorso", "LeftFoot", "LeftHand", "LeftLowerArm", "LeftLowerLeg", "LeftUpperArm", "LeftUpperLeg", "RightFoot", "RightHand", "RightLowerArm", "RightLowerLeg", "RightUpperArm", "RightUpperLeg" }
	local val_497 = { ["HE Grenade"] = "rbxassetid://2473861397", ["Smoke Grenade"] = "rbxassetid://2465359739", ["Incendiary Grenade"] = "rbxassetid://2465356425", ["Molotov"] = "rbxassetid://2465357373", ["Flashbang"] = "rbxassetid://2472169712", ["Decoy Grenade"] = "rbxassetid://454821354" }
function addTick()
		if not workspace:FindFirstChild("Map") then
			return
		end 
		local val_501 = tick(); local val_502 = {}
		for var_155, var_218 in val_491:GetPlayers() do
			local val_503 = { name = var_218.Name, alive = false, gunState = "None" }
			pcall(function()
				val_503.alive = alive(var_218)
			end)
			xpcall(function()
				if val_503.alive then
					val_503.armsModel = (val_492.Status.Team.Value == "CT" and workspace.Map.CeeT.Value or workspace.Map.Tee.Value) .. "Arms"; val_503.gunName = var_218.Character.EquippedTool.Value; val_503.health = var_218.Character.Humanoid.Health; val_503.localplayer = var_218 == val_492; val_503.userid = var_218.UserId; val_503.kevlar = var_218:FindFirstChild("Kevlar") and var_218.Kevlar.Value or 0 
					val_503.plrModel = var_218.Ragdoll.Appearance.Value 
					val_503.scoped = var_218.Character:FindFirstChild("AIMING") and true or false 
				val_503.team = tostring(var_218.Team); val_503.skinName = "Stock"; val_503.partCF = {}; val_503.gunCF = {}; val_503.hatCF = {}; val_503.camCF = "0 0 0 0 0 0"; val_503.forcefield = var_218.Character:FindFirstChild("ForceField") and true or false; local val_504 = var_218.Character.UpperTorso.Velocity; val_503.velocity = { val_504.X, val_504.Y, val_504.Z }
				if val_503.localplayer then
					local _ag = val_492.PlayerGui:FindFirstChild("Game"); local _ammo = _ag and _ag:FindFirstChild("Right") and _ag.Right:FindFirstChild("Bottom") and _ag.Right.Bottom:FindFirstChild("Ammo"); val_503.ammo = (_ammo and _ammo:FindFirstChild("Ammo")) and tonumber(_ammo.Ammo.Text) or 0; val_503.ammoreserve = (_ammo and _ammo:FindFirstChild("AmmoLeft")) and tonumber(_ammo.AmmoLeft.Text) or 0
				end 
				if var_218:FindFirstChild("CameraCF") then
					local val_505, val_507 
					if var_218 == val_492 then
						val_505 = val_749.CFrame.p; val_507 = val_505 + val_749.CFrame.LookVector
					else
						val_505 = var_218.CameraCF.Value.p; val_507 = val_505 + var_218.CameraCF.Value.LookVector
					end 
					val_503.camCF = roundNumber(val_505.X, 3) .. " " .. roundNumber(val_505.Y, 3) .. " " .. roundNumber(val_505.Z, 3) .. " " .. roundNumber(val_507.X, 3) .. " " .. roundNumber(val_507.Y, 3) .. " " .. roundNumber(val_507.Z, 3)
				end 
				for var_124, var_89 in var_218.Character:GetChildren() do
					if table.find(val_496, var_89.Name) then
						local val_508 = tostring(var_89.CFrame):split(", ")
						val_503.partCF[var_89.Name] = roundNumber(val_508[1], 3) .. " " .. roundNumber(val_508[2], 3) .. " " .. roundNumber(val_508[3], 3) .. " " .. roundNumber(val_508[4], 3) .. " " .. roundNumber(val_508[5], 3) .. " " .. roundNumber(val_508[6], 3) .. " " .. roundNumber(val_508[7], 3) .. " " .. roundNumber(val_508[8], 3) .. " " .. roundNumber(val_508[9], 3) .. " " .. roundNumber(val_508[10], 3) .. " " .. roundNumber(val_508[11], 3) .. " " .. roundNumber(val_508[12], 3)
					elseif var_89.Name == "Gun" then
						if var_89:FindFirstChild("AnimateValue") then
							local val_509 = var_89.AnimateValue:GetChildren()
							if # val_509 > 0 then
								local val_510 = val_509[# val_509]
								if not val_510:FindFirstChild("jig") then
									local val_511 = val_495:Clone(); val_511.Parent = val_510; val_503.gunState = val_510.Name
								end
							end
						end 
						for var_128, var_120 in var_89:GetChildren() do
							local isMesh = var_120:IsA("MeshPart") or (var_120:IsA("BasePart") and var_120:FindFirstChildWhichIsA("SpecialMesh"))
							if isMesh then
								local val_512 = tostring(var_120.CFrame):split(", ")
								val_503.gunCF[var_120.Name] = roundNumber(val_512[1], 3) .. " " .. roundNumber(val_512[2], 3) .. " " .. roundNumber(val_512[3], 3) .. " " .. roundNumber(val_512[4], 3) .. " " .. roundNumber(val_512[5], 3) .. " " .. roundNumber(val_512[6], 3) .. " " .. roundNumber(val_512[7], 3) .. " " .. roundNumber(val_512[8], 3) .. " " .. roundNumber(val_512[9], 3) .. " " .. roundNumber(val_512[10], 3) .. " " .. roundNumber(val_512[11], 3) .. " " .. roundNumber(val_512[12], 3)
								if val_503.localplayer then
									local val_514 = val_503.team == "Terrorists" and val_492.SkinFolder.TFolder or val_492.SkinFolder.CTFolder 
									if val_514:FindFirstChild(val_503.gunName) then
										val_503.skinName = val_514[val_503.gunName].Value
									elseif table.find(val_466, val_503.gunName) then
										val_503.skinName = val_514.Knife.Value
									end
								else
									if val_662.Skins:FindFirstChild(val_503.gunName) then
										if var_120.Name == "Handle" or var_120.Name == "Handle2" then
											for var_267, var_15 in val_662.Skins[val_503.gunName]:GetChildren() do
												local val_515 = var_15:FindFirstChild("Handle") or var_15:FindFirstChild("Handle2")
												if val_515 and val_515.Value == var_89[var_120.Name].TextureID then
													val_503.skinName = var_15.Name
												end
											end
										end
									end
								end
							end
						end
					end 
					if var_89.ClassName == "Accessory" and var_89:FindFirstChild("Handle") and (var_89.Handle:FindFirstChild("Mesh") or var_89.Handle.ClassName == "MeshPart") then
						if var_89.Handle.ClassName == "UnionOperation" then
							continue 
						end 
						local val_516 = var_89.Handle.ClassName == "Part" and var_89.Handle.Mesh.MeshId or var_89.Handle.ClassName == "MeshPart" and var_89.Handle.MeshId or ""; local val_517 = tostring(var_89.Handle.CFrame):split(", ")
						val_503.hatCF[val_516] = roundNumber(val_517[1], 3) .. " " .. roundNumber(val_517[2], 3) .. " " .. roundNumber(val_517[3], 3) .. " " .. roundNumber(val_517[4], 3) .. " " .. roundNumber(val_517[5], 3) .. " " .. roundNumber(val_517[6], 3) .. " " .. roundNumber(val_517[7], 3) .. " " .. roundNumber(val_517[8], 3) .. " " .. roundNumber(val_517[9], 3) .. " " .. roundNumber(val_517[10], 3) .. " " .. roundNumber(val_517[11], 3) .. " " .. roundNumber(val_517[12], 3)
					end
				end
			else
				val_503.ragdoll = { found = false, positions = {}, hatPos = {} }
				if workspace.Debris:FindFirstChild(val_503.name) then
					val_503.ragdoll.found = true 
					for var_101, var_185 in workspace.Debris[val_503.name]:GetChildren() do
						if var_185:IsA("BasePart") then
							local val_518 = tostring(var_185.CFrame):split(", ")
							val_503.ragdoll.positions[var_185.Name] = roundNumber(val_518[1], 3) .. " " .. roundNumber(val_518[2], 3) .. " " .. roundNumber(val_518[3], 3) .. " " .. roundNumber(val_518[4], 3) .. " " .. roundNumber(val_518[5], 3) .. " " .. roundNumber(val_518[6], 3) .. " " .. roundNumber(val_518[7], 3) .. " " .. roundNumber(val_518[8], 3) .. " " .. roundNumber(val_518[9], 3) .. " " .. roundNumber(val_518[10], 3) .. " " .. roundNumber(val_518[11], 3) .. " " .. roundNumber(val_518[12], 3)
						end 
						if var_185.ClassName == "Accessory" then
							local val_519 = var_185.Handle.ClassName == "Part" and var_185.Handle.Mesh.MeshId or var_185.Handle.ClassName == "MeshPart" and var_185.Handle.MeshId or ""; local val_521 = tostring(var_185.Handle.CFrame):split(", ")
							val_503.ragdoll.hatPos[val_519] = roundNumber(val_521[1], 3) .. " " .. roundNumber(val_521[2], 3) .. " " .. roundNumber(val_521[3], 3) .. " " .. roundNumber(val_521[4], 3) .. " " .. roundNumber(val_521[5], 3) .. " " .. roundNumber(val_521[6], 3) .. " " .. roundNumber(val_521[7], 3) .. " " .. roundNumber(val_521[8], 3) .. " " .. roundNumber(val_521[9], 3) .. " " .. roundNumber(val_521[10], 3) .. " " .. roundNumber(val_521[11], 3) .. " " .. roundNumber(val_521[12], 3)
						end
					end
				end
				end
				val_502[var_218.Name] = val_503
			end, function(err2)
				local _ = err2
			end)
		end 
		val_502.nades = {}; val_502.nadePos = {}; val_502.droppedWeapons = {}; val_502.bombPlanted = workspace:FindFirstChild("C4") and true or false; val_502.roundInfo = { round = 0, T = 0, CT = 0, time = "0:00", TWin = { vis = false, mvpimage = "", mvptext = "", infotext = "" }, CTWin = { vis = false, mvpimage = "", mvptext = "", infotext = "" } }
		pcall(function()
			val_502.roundInfo.round = workspace.Status.Rounds.Value; val_502.roundInfo.T = workspace.Status.TWins.Value; val_502.roundInfo.CT = workspace.Status.CTWins.Value
		end)
		pcall(function()
			val_502.roundInfo.time = val_492.PlayerGui.Game.UpperInfo.Scoreboard.TimeLeft.Timer.Text
		end)
		pcall(function()
			local tw = val_492.PlayerGui.Game.TWin; val_502.roundInfo.TWin.vis = tw.Visible; val_502.roundInfo.TWin.mvpimage = tw.Top.Icon.PlayerIcon.Image; val_502.roundInfo.TWin.mvptext = tw.Top.PlayerInfo.Username.Text; val_502.roundInfo.TWin.infotext = tw.Top.PlayerInfo.Reason.Text
		end)
		pcall(function()
			local ctw = val_492.PlayerGui.Game.CTWin; val_502.roundInfo.CTWin.vis = ctw.Visible; val_502.roundInfo.CTWin.mvpimage = ctw.Top.Icon.PlayerIcon.Image; val_502.roundInfo.CTWin.mvptext = ctw.Top.PlayerInfo.Username.Text; val_502.roundInfo.CTWin.infotext = ctw.Top.PlayerInfo.Reason.Text
		end)
		val_502.regen = { props = {}, glasses = {}, doors = {} }
		val_502.bombPos = "0 -100 0"
		pcall(function()
			if val_502.bombPlanted then
				local val_522 = workspace.C4:GetModelCFrame(); val_502.bombPos = roundNumber(val_522.X, 3) .. " " .. roundNumber(val_522.Y, 3) .. " " .. roundNumber(val_522.Z, 3)
			end
		end)
		pcall(function()
		if workspace.Map.Regen:FindFirstChild("Props") then
			for var_147, var_145 in workspace.Map.Regen.Props:GetChildren() do
				local val_523 = var_145.Position; table.insert(val_502.regen.props, roundNumber(val_523.X, 3) .. " " .. roundNumber(val_523.Y, 3) .. " " .. roundNumber(val_523.Z, 3))
			end
		end 
		if workspace.Map.Regen:FindFirstChild("Glasses") then
			for var_133, var_216 in workspace.Map.Regen.Glasses:GetChildren() do
				local val_524 = var_216.Position; table.insert(val_502.regen.glasses, roundNumber(val_524.X, 3) .. " " .. roundNumber(val_524.Y, 3) .. " " .. roundNumber(val_524.Z, 3))
			end
		end 
		if workspace.Map.Regen:FindFirstChild("Doors") then
			for var_192, var_89 in workspace.Map.Regen.Doors:GetChildren() do
				local val_526 = var_89.HumanoidRootPart.Position; local val_527 = var_89.HumanoidRootPart.Orientation 
				table.insert(val_502.regen.doors, roundNumber(val_526.X, 3) .. " " .. roundNumber(val_526.Y, 3) .. " " .. roundNumber(val_526.Z, 3) .. " " .. roundNumber(val_527.X, 3) .. " " .. roundNumber(val_527.Y, 3) .. " " .. roundNumber(val_527.Z, 3))
			end
		end
		end)
		pcall(function()
		for var_161, var_130 in workspace.Debris:GetChildren() do
			pcall(function()
				if var_130.ClassName == "MeshPart" then
					for var_97, var_125 in val_497 do
						if var_125 == var_130.TextureID and var_130.Model.Handle2.Transparency ~= 1 then
							local val_528 = var_130.Position; local val_529 = var_130.Orientation; table.insert(val_502.nades, { nade = var_97, pos = roundNumber(val_528.X, 3) .. " " .. roundNumber(val_528.Y, 3) .. " " .. roundNumber(val_528.Z, 3) .. " " .. roundNumber(val_529.X, 3) .. " " .. roundNumber(val_529.Y, 3) .. " " .. roundNumber(val_529.Z, 3) })
						else
							continue 
						end
					end
				end
			end)
			if val_662.Viewmodels:FindFirstChild("v_" .. var_130.Name) then
				local val_530 = {}
				for var_130, var_228 in var_130:GetChildren() do
					if var_228.ClassName == "MeshPart" then
						local val_532 = var_228.Position; local val_533 = var_228.Orientation; val_530[var_228.Name] = roundNumber(val_532.X, 3) .. " " .. roundNumber(val_532.Y, 3) .. " " .. roundNumber(val_532.Z, 3) .. " " .. roundNumber(val_533.X, 3) .. " " .. roundNumber(val_533.Y, 3) .. " " .. roundNumber(val_533.Z, 3)
					else
						continue 
					end
				end 
				table.insert(val_502.droppedWeapons, { name = var_130.Name, positions = val_530 })
			end
		end 
		end)
		pcall(function()
		for var_22, var_230 in workspace["Ray_Ignore"]:GetDescendants() do
			if var_230:IsA("BasePart") and (var_230.Parent.Name == "Fires" or var_230.Parent.Name == "Smokes") then
				local val_534 = var_230.Position; local val_535 = var_230.Orientation; table.insert(val_502.nadePos, { type = var_230.Name, pos = roundNumber(val_534.X, 3) .. " " .. roundNumber(val_534.Y, 3) .. " " .. roundNumber(val_534.Z, 3) .. " " .. roundNumber(val_535.X, 3) .. " " .. roundNumber(val_535.Y, 3) .. " " .. roundNumber(val_535.Z, 3) })
			else
				continue 
			end
		end 
		end)
		val_502.killfeed = {}
		pcall(function()
			local now = workspace:GetServerTimeNow()
			for i = #val_493, 1, -1 do
				local kill = val_493[i]
				if not kill or (tonumber(kill.time) and kill.time + 10 < now) then
					table.remove(val_493, i)
				end
			end
			for _, kill in val_493 do
				local killerColor = typeof(kill.killerColor) == "Color3" and kill.killerColor or Color3.new(1, 1, 1); local victimColor = typeof(kill.victimColor) == "Color3" and kill.victimColor or Color3.new(1, 1, 1); local assistColor = typeof(kill.assistColor) == "Color3" and kill.assistColor or Color3.new(1, 1, 1); local weaponIcon = ""
				pcall(function()
					weaponIcon = kill.weapon and GetIcon.getWeaponOfKiller(kill.weapon) or ""
				end)
				table.insert(val_502.killfeed, { weapon = weaponIcon, killer = kill.killer or "", killercolor = {killerColor.R, killerColor.G, killerColor.B}, victim = kill.victim or "", victimcolor = {victimColor.R, victimColor.G, victimColor.B}, assist = kill.assist or "", assistcolor = {assistColor.R, assistColor.G, assistColor.B}, headshot = kill.isHeadshot == true, wallbang = kill.isWallbang == true })
			end
		end)
		val_502["delay"] = tick() - val_501; table.insert(val_494, val_502)
	end 
	val_498 = nil; val_499 = false 
end 
val_824.mainFrame.topname.TextButton.MouseButton1Click:connect(function()
	val_824.mainFrame.Visible = false
end)
function _loadIcon(name)
	local path = "clarity.tk/assets/" .. name .. ".png"
	if not isfile(path) then
		pcall(function()
			if not isfolder("clarity.tk") then makefolder("clarity.tk") end
			if not isfolder("clarity.tk/assets") then makefolder("clarity.tk/assets") end
			local githubUrl = "https://raw.githubusercontent.com/Freezewo/clarity.tk/main/"; local imgData = game:HttpGet(githubUrl .. name .. ".png")
			if imgData and imgData ~= "" then
				writefile(path, imgData)
			end
		end)
	end
	local ok, r = pcall(getcustomasset, path)
	return ok and r or ""
end
local function _loadIcon(name)
	local path = "clarity.tk/assets/" .. name .. ".png"
	if not isfile(path) then
		pcall(function()
			if not isfolder("clarity.tk") then makefolder("clarity.tk") end
			if not isfolder("clarity.tk/assets") then makefolder("clarity.tk/assets") end
			local githubUrl = "https://raw.githubusercontent.com/Freezewo/clarity.tk/main/"; local imgData = game:HttpGet(githubUrl .. name .. ".png")
			if imgData and imgData ~= "" then
				writefile(path, imgData)
			end
		end)
	end
	local ok, r = pcall(getcustomasset, path)
	return ok and r or ""
end
TabIcons = {
	["Demos"] = _loadIcon("demos"), ["demos"] = _loadIcon("demos"), ["Legit"] = _loadIcon("legit"), ["legit"] = _loadIcon("legit"), ["Visuals"] = _loadIcon("visuals"), ["visuals"] = _loadIcon("visuals"), ["Misc"] = _loadIcon("misc"), ["misc"] = _loadIcon("misc"), ["Movement"] = _loadIcon("movement"), ["movement"] = _loadIcon("movement"), ["Movement Features"] = _loadIcon("movement"), ["Skins"] = _loadIcon("skins"), ["skins"] = _loadIcon("skins"), ["Config"] = _loadIcon("configs"), ["configs"] = _loadIcon("configs"), ["Configs"] = _loadIcon("configs"), ["Exploits"] = _loadIcon("movement"), ["exploits"] = _loadIcon("movement"), ["World"] = _loadIcon("visuals"), ["world"] = _loadIcon("visuals"), ["Calculator"] = _loadIcon("misc"), ["calculator"] = _loadIcon("misc"), ["Lua"] = _loadIcon("lua"), ["lua"] = _loadIcon("lua"), ["Players"] = _loadIcon("players"), ["players"] = _loadIcon("players")
}
UI_Library.Init = function(self)
	if self.hasInit then return end
	self.hasInit = true; local sg = Instance.new("ScreenGui", game:GetService("CoreGui")); sg.ResetOnSpawn = false; sg.Name = "Clarity_Custom"; sg.IgnoreGuiInset = true; self.base = sg; self.open = true; local openColorPicker = nil; local main = Instance.new("ImageButton", sg); self.mainFrame = main; main.AutoButtonColor = false; main.Size = UDim2.new(0, 720, 0, 530); main.Position = UDim2.new(0.5, -360, 0.5, -265); main.BackgroundColor3 = Color3.fromRGB(16, 17, 16); main.BorderSizePixel = 0
	main.ClipsDescendants = false
	Instance.new("UICorner", main).CornerRadius = UDim.new(0, 3); local mainStroke = Instance.new("UIStroke", main); mainStroke.Color = Color3.fromRGB(55, 55, 55); mainStroke.Thickness = 1; mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; main.Active = true; self.mainFrame = main
	main:GetPropertyChangedSignal("Visible"):Connect(function()
		if main.Visible then
			pcall(function() game:GetService("ContextActionService"):BindActionAtPriority("ClarityMenuSink", function() return Enum.ContextActionResult.Sink end, false, 999999, Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2) end)
		else
			pcall(function() game:GetService("ContextActionService"):UnbindAction("ClarityMenuSink") end)
		end
	end)
	if main.Visible then
		pcall(function() game:GetService("ContextActionService"):BindActionAtPriority("ClarityMenuSink", function() return Enum.ContextActionResult.Sink end, false, 999999, Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2) end)
	end
	local sidebar = Instance.new("Frame", main); sidebar.Size = UDim2.new(0, 135, 1, 0); sidebar.BackgroundColor3 = Color3.fromRGB(12, 13, 12); sidebar.BorderSizePixel = 0; Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 3); local logoHeader = Instance.new("Frame", sidebar); logoHeader.Size = UDim2.new(1, 0, 0, 70); logoHeader.BackgroundTransparency = 1; local logo = Instance.new("ImageLabel", logoHeader); logo.Size = UDim2.new(0, 48, 0, 48); logo.Position = UDim2.new(0.5, -24, 0.5, -24); logo.BackgroundTransparency = 1; logo.Image = "rbxassetid://133384875688188"; logo.ImageColor3 = library_flags["Menu Accent Color"] or Color3.fromRGB(255, 255, 255); table.insert(UI_Library.theme, logo); local logoSep = Instance.new("Frame", sidebar); logoSep.Size = UDim2.new(0.8, 0, 0, 1); logoSep.Position = UDim2.new(0.1, 0, 0, 70); logoSep.BackgroundColor3 = Color3.fromRGB(40, 40, 40); logoSep.BorderSizePixel = 0; local sidebarDiv = Instance.new("Frame", main); sidebarDiv.Size = UDim2.new(0, 1, 1, -16); sidebarDiv.Position = UDim2.new(0, 135, 0, 8); sidebarDiv.BackgroundColor3 = Color3.fromRGB(40, 40, 40); sidebarDiv.BorderSizePixel = 0; local tabContainer = Instance.new("ScrollingFrame", sidebar); tabContainer.Size = UDim2.new(1, 0, 1, -70); tabContainer.Position = UDim2.new(0, 0, 0, 70); tabContainer.BackgroundTransparency = 1; tabContainer.BorderSizePixel = 0; tabContainer.ScrollBarThickness = 1; tabContainer.CanvasSize = UDim2.new(0, 0, 0, 0); tabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y; local list = Instance.new("UIListLayout", tabContainer); list.Padding = UDim.new(0, 3); list.HorizontalAlignment = Enum.HorizontalAlignment.Center; list.SortOrder = Enum.SortOrder.LayoutOrder
	local floatingDropdowns = {}
	local content = Instance.new("Frame", main); content.Size = UDim2.new(1, -145, 1, -20); content.Position = UDim2.new(0, 140, 0, 10); content.BackgroundTransparency = 1; content.BorderSizePixel = 0; local activePage = nil; local activeBtn = nil; local previewWin = Instance.new("Frame", main); previewWin.Size = UDim2.new(0, 240, 0, 360); previewWin.Position = UDim2.new(1, 35, 0, 0); previewWin.BackgroundColor3 = Color3.fromRGB(15, 15, 15); previewWin.Visible = false; Instance.new("UICorner", previewWin).CornerRadius = UDim.new(0, 3); local previewStroke = Instance.new("UIStroke", previewWin); previewStroke.Color = Color3.fromRGB(25, 25, 25); local previewHeader = Instance.new("TextLabel", previewWin); previewHeader.Size = UDim2.new(1, 0, 0, 25); previewHeader.BackgroundTransparency = 1; previewHeader.Text = "esp preview"; previewHeader.TextColor3 = Color3.fromRGB(140, 140, 140); previewHeader.Font = Enum.Font.Code; previewHeader.TextSize = 13; local viewport = Instance.new("ViewportFrame", previewWin); viewport.Size = UDim2.new(0.9, 0, 0.75, 0); viewport.Position = UDim2.new(0.05, 0, 0.08, 0); viewport.BackgroundTransparency = 1; viewport.Ambient = Color3.fromRGB(200, 200, 200); local cam = Instance.new("Camera"); cam.FieldOfView = 50; viewport.CurrentCamera = cam; cam.Parent = viewport; local light = Instance.new("PointLight", cam); light.Color = Color3.fromRGB(255, 255, 255); light.Brightness = 2; light.Range = 15; local previewModel = Instance.new("Model", viewport); local previewReady = false; local previewDragging = false; local previewLastX = 0; local previewRotY = 0
	local function rebuildDummy()
		previewModel:ClearAllChildren(); local ok = false; local src = nil
		pcall(function()
			for _, plr in game:GetService("Players"):GetPlayers() do
				if plr ~= val_733 and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					src = plr.Character; break
				end
			end
			if not src then
				for _, v in workspace:GetChildren() do
					if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
						src = v; break
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
							d.Name:match("Torso") or d.Name:match("Leg") or d.Name:match("Arm") or d.Name:match("Hand") or d.Name:match("Foot") or d.Name == "Head" or d.Name == "HumanoidRootPart" or d.Name == "FakeHead" or d.Name == "Hitbox" or d:FindFirstAncestorWhichIsA("Accessory") or d:FindFirstAncestorWhichIsA("Accoutrement")
						) then
							d:Destroy()
						end
					end
					local hrp = clone:FindFirstChild("HumanoidRootPart")
					if hrp then
						local hrpCF = hrp.CFrame; local resolvedCFrames = {}; resolvedCFrames[hrp] = CFrame.new(0, 1, 0)
						local function resolveJoints()
							local added = false
							for _, d in clone:GetDescendants() do
								if d:IsA("JointInstance") or d:IsA("WeldConstraint") then
									local p0 = d.Part0; local p1 = d.Part1
									if p0 and p1 then
										local c0, c1
										pcall(function() c0 = d.C0; c1 = d.C1 end)
										if c0 and c1 then
											local transform = CFrame.new()
											if d:IsA("Motor6D") then
												transform = CFrame.new()
											end
											if not resolvedCFrames[p1] and resolvedCFrames[p0] then
												resolvedCFrames[p1] = resolvedCFrames[p0] * c0 * transform * c1:Inverse(); added = true
											elseif not resolvedCFrames[p0] and resolvedCFrames[p1] then
												resolvedCFrames[p0] = resolvedCFrames[p1] * c1 * transform:Inverse() * c0:Inverse(); added = true
											end
										else
											local rel = p0.CFrame:Inverse() * p1.CFrame
											if not resolvedCFrames[p1] and resolvedCFrames[p0] then
												resolvedCFrames[p1] = resolvedCFrames[p0] * rel; added = true
											elseif not resolvedCFrames[p0] and resolvedCFrames[p1] then
												resolvedCFrames[p0] = resolvedCFrames[p1] * rel:Inverse(); added = true
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
				local desc = Instance.new("HumanoidDescription"); local model = game:GetService("Players"):CreateHumanoidModelFromDescription(desc, Enum.HumanoidRigType.R15)
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
			local parts = { {"Head", Vector3.new(1.2, 1.2, 1.2), CFrame.new(0, 3.1, 0)}, {"UpperTorso", Vector3.new(2, 0.8, 1), CFrame.new(0, 1.9, 0)}, {"LowerTorso", Vector3.new(2, 1, 1), CFrame.new(0, 1.0, 0)}, {"LeftUpperArm", Vector3.new(1, 1.2, 1), CFrame.new(-1.6, 1.9, 0)}, {"LeftLowerArm", Vector3.new(1, 1.2, 1), CFrame.new(-1.6, 0.6, 0)}, {"LeftHand", Vector3.new(1, 0.5, 1), CFrame.new(-1.6, -0.2, 0)}, {"RightUpperArm", Vector3.new(1, 1.2, 1), CFrame.new(1.6, 1.9, 0)}, {"RightLowerArm", Vector3.new(1, 1.2, 1), CFrame.new(1.6, 0.6, 0)}, {"RightHand", Vector3.new(1, 0.5, 1), CFrame.new(1.6, -0.2, 0)}, {"LeftUpperLeg", Vector3.new(1, 1.2, 1), CFrame.new(-0.5, -0.1, 0)}, {"LeftLowerLeg", Vector3.new(1, 1.2, 1), CFrame.new(-0.5, -1.4, 0)}, {"LeftFoot", Vector3.new(1, 0.4, 1), CFrame.new(-0.5, -2.1, 0)}, {"RightUpperLeg", Vector3.new(1, 1.2, 1), CFrame.new(0.5, -0.1, 0)}, {"RightLowerLeg", Vector3.new(1, 1.2, 1), CFrame.new(0.5, -1.4, 0)}, {"RightFoot", Vector3.new(1, 0.4, 1), CFrame.new(0.5, -2.1, 0)}, {"HumanoidRootPart", Vector3.new(2, 2, 1), CFrame.new(0, 1, 0), true} }
			for _, info in parts do
				local p = Instance.new("Part"); p.Name = info[1]; p.Size = info[2]; p.CFrame = info[3]; p.Transparency = info[4] and 1 or 0; p.Color = Color3.fromRGB(180, 180, 180); p.Material = Enum.Material.SmoothPlastic; p.Anchored = true; p.CanCollide = false; p.Parent = previewModel
			end
		end
		previewRotY = 0; previewReady = true; cam.CFrame = CFrame.new(Vector3.new(0, 2.5, -9.5), Vector3.new(0, 0, 0))
	end
	rebuildDummy()
	spawn(function()
		while not previewReady do
			task.wait(5); rebuildDummy()
		end
	end)
	local boxOverlay = Instance.new("Frame", previewWin); boxOverlay.BackgroundTransparency = 1; boxOverlay.ZIndex = 10; boxOverlay.Visible = false; local stroke = Instance.new("UIStroke", boxOverlay); stroke.Thickness = 1; stroke.Color = Color3.fromRGB(255, 255, 255); local boxFill = Instance.new("Frame", boxOverlay); boxFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255); boxFill.BackgroundTransparency = 0.5; boxFill.BorderSizePixel = 0; boxFill.Size = UDim2.new(1, 0, 1, 0); boxFill.ZIndex = 9; boxFill.Visible = false; local nameLabel = Instance.new("TextLabel", boxOverlay); nameLabel.BackgroundTransparency = 1; nameLabel.Size = UDim2.new(1, 0, 0, 15); nameLabel.Position = UDim2.new(0, 0, 0, -17); nameLabel.Text = "Enemy"; nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255); nameLabel.Font = Enum.Font.Code; nameLabel.TextSize = 13; local nameStroke = Instance.new("UIStroke", nameLabel); local healthBarBg = Instance.new("Frame", boxOverlay); healthBarBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0); healthBarBg.BorderSizePixel = 0; healthBarBg.Size = UDim2.new(0, 2, 1, 0); healthBarBg.Position = UDim2.new(0, -6, 0, 0); local healthBarFill = Instance.new("Frame", healthBarBg); healthBarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0); healthBarFill.BorderSizePixel = 0; healthBarFill.Size = UDim2.new(1, 0, 0.8, 0); healthBarFill.Position = UDim2.new(0, 0, 0.2, 0); local healthText = Instance.new("TextLabel", healthBarFill); healthText.BackgroundTransparency = 1; healthText.Size = UDim2.new(0, 20, 0, 10); healthText.Position = UDim2.new(0, -22, 0, -5); healthText.Text = "80%"; healthText.TextColor3 = Color3.fromRGB(255, 255, 255); healthText.Font = Enum.Font.Code; healthText.TextSize = 10; Instance.new("UIStroke", healthText); local armorBarBg = Instance.new("Frame", boxOverlay); armorBarBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0); armorBarBg.BorderSizePixel = 0; armorBarBg.Size = UDim2.new(0, 2, 1, 0); armorBarBg.Position = UDim2.new(0, -10, 0, 0); local armorBarFill = Instance.new("Frame", armorBarBg); armorBarFill.BackgroundColor3 = Color3.fromRGB(0, 150, 255); armorBarFill.BorderSizePixel = 0; armorBarFill.Size = UDim2.new(1, 0, 1, 0); armorBarFill.Position = UDim2.new(0, 0, 0, 0); local distLabel = Instance.new("TextLabel", boxOverlay); distLabel.BackgroundTransparency = 1; distLabel.Size = UDim2.new(1, 0, 0, 15); distLabel.Position = UDim2.new(0, 0, 1, 2); distLabel.Text = "12m"; distLabel.TextColor3 = Color3.fromRGB(255, 255, 255); distLabel.Font = Enum.Font.Code; distLabel.TextSize = 12; Instance.new("UIStroke", distLabel); local wepLabel = Instance.new("TextLabel", boxOverlay); wepLabel.BackgroundTransparency = 1; wepLabel.Size = UDim2.new(1, 0, 0, 15); wepLabel.Position = UDim2.new(0, 0, 1, 15); wepLabel.Text = "AK-47"; wepLabel.TextColor3 = Color3.fromRGB(200, 200, 200); wepLabel.Font = Enum.Font.Code; wepLabel.TextSize = 12; Instance.new("UIStroke", wepLabel); local infoLabel = Instance.new("TextLabel", boxOverlay); infoLabel.BackgroundTransparency = 1; infoLabel.Size = UDim2.new(0, 40, 0, 15); infoLabel.Position = UDim2.new(1, 4, 0, 0); infoLabel.Text = "Standing"; infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255); infoLabel.Font = Enum.Font.Code; infoLabel.TextSize = 12; infoLabel.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UIStroke", infoLabel); local flagsLabel = Instance.new("TextLabel", boxOverlay); flagsLabel.BackgroundTransparency = 1; flagsLabel.Size = UDim2.new(0, 40, 0, 15); flagsLabel.Position = UDim2.new(1, 4, 0, 15); flagsLabel.Text = "Armored\nScoped"; flagsLabel.TextColor3 = Color3.fromRGB(255, 255, 255); flagsLabel.Font = Enum.Font.Code; flagsLabel.TextSize = 12; flagsLabel.TextXAlignment = Enum.TextXAlignment.Left; flagsLabel.TextYAlignment = Enum.TextYAlignment.Top; Instance.new("UIStroke", flagsLabel); local chamsToggleBtn = Instance.new("TextButton", previewWin); chamsToggleBtn.Size = UDim2.new(1, -20, 0, 25); chamsToggleBtn.Position = UDim2.new(0, 10, 1, -35); chamsToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40); chamsToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255); chamsToggleBtn.Font = Enum.Font.Code; chamsToggleBtn.TextSize = 13; chamsToggleBtn.Text = "Chams: Behind Wall"; library_flags["previewChamsVisible"] = false
	chamsToggleBtn.MouseButton1Click:Connect(function()
		library_flags["previewChamsVisible"] = not library_flags["previewChamsVisible"]; chamsToggleBtn.Text = library_flags["previewChamsVisible"] and "Chams: Visible" or "Chams: Behind Wall"
	end)
	Instance.new("UICorner", chamsToggleBtn).CornerRadius = UDim.new(0, 3); local tracerLine = Instance.new("Frame", previewWin); tracerLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255); tracerLine.BorderSizePixel = 0; tracerLine.AnchorPoint = Vector2.new(0.5, 1); tracerLine.ZIndex = 5
    local skelLines = {}
    local function createLine()
        local f = Instance.new("Frame", previewWin); f.BackgroundColor3 = Color3.fromRGB(255, 255, 255); f.BorderSizePixel = 0; f.AnchorPoint = Vector2.new(0.5, 0.5); f.ZIndex = 6; f.Visible = false; table.insert(skelLines, f)
        return f
    end
    for i=1,15 do createLine() end
	local vpButton = Instance.new("TextButton", viewport); vpButton.Size = UDim2.new(1, 0, 1, 0); vpButton.BackgroundTransparency = 1; vpButton.Text = ""; vpButton.ZIndex = 2
	vpButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			previewDragging = true; previewLastX = input.Position.X
		end
	end)
	vpButton.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			previewDragging = false
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if previewDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local deltaX = input.Position.X - previewLastX; previewLastX = input.Position.X; local angle = deltaX * 0.01; previewRotY = previewRotY + angle; local rotCF = CFrame.Angles(0, angle, 0)
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
				local h = math.tan(math.rad(cam.FieldOfView)/2); local r = viewport.AbsoluteSize.X / viewport.AbsoluteSize.Y
				if r ~= r or r == 0 then r = 1 end
				local ndcX = (op.X / -op.Z) / (h * r); local ndcY = (op.Y / -op.Z) / h
				return Vector2.new(viewport.AbsoluteSize.X/2 * (1 + ndcX), viewport.AbsoluteSize.Y/2 * (1 - ndcY))
			end
			local pos = get2D(hrp.Position); local top = get2D((hrp.CFrame * CFrame.new(0, 3.4, 0)).Position); local bot = get2D((hrp.CFrame * CFrame.new(0, -3.2, 0)).Position); local height = math.abs(bot.Y - top.Y); local width = height * 0.65; local offset_X = viewport.AbsolutePosition.X - previewWin.AbsolutePosition.X; local offset_Y = viewport.AbsolutePosition.Y - previewWin.AbsolutePosition.Y; boxOverlay.Size = UDim2.new(0, width, 0, height); boxOverlay.Position = UDim2.new(0, pos.X - width/2 + offset_X, 0, top.Y + offset_Y); local isEsp = library_flags["espEnabled"]; local hasArmor = library_flags["Armor Bar"] or library_flags["Armor ESP"] or library_flags["Armor"]
			if isEsp and library_flags["Box ESP"] then
				stroke.Enabled = true; stroke.Color = library_flags["boxESPcolor"] or Color3.fromRGB(255,255,255)
			else
				stroke.Enabled = false
			end
			if isEsp and library_flags["Box Fill"] then
				boxFill.Visible = true; boxFill.BackgroundColor3 = library_flags["boxFillColor"] or Color3.fromRGB(255,255,255); local fillTrans = (UI_Library and UI_Library.options and UI_Library.options["Box Fill"] and UI_Library.options["Box Fill"].trans) or 0.5; boxFill.BackgroundTransparency = math.clamp(1 - fillTrans, 0, 1)
			else
				boxFill.Visible = false
			end
			boxOverlay.Visible = isEsp and (library_flags["Box ESP"] or library_flags["Box Fill"] or library_flags["Name ESP"] or library_flags["Health Bar"] or hasArmor or library_flags["Weapon ESP"] or library_flags["Distance ESP"] or library_flags["Info ESP"]); nameLabel.Visible = isEsp and library_flags["Name ESP"]; nameLabel.TextColor3 = library_flags["nameESPcolor"] or Color3.fromRGB(255,255,255); healthBarBg.Visible = isEsp and library_flags["Health Bar"]; healthBarFill.BackgroundColor3 = library_flags["healthBar"] or Color3.fromRGB(0, 255, 0); armorBarBg.Visible = isEsp and hasArmor; armorBarFill.BackgroundColor3 = library_flags["armorBarColor"] or Color3.fromRGB(0, 100, 255)
			if library_flags["Health Bar"] and not hasArmor then
				healthBarBg.Position = UDim2.new(0, -6, 0, 0)
			elseif library_flags["Health Bar"] and hasArmor then
				healthBarBg.Position = UDim2.new(0, -5, 0, 0); armorBarBg.Position = UDim2.new(0, -9, 0, 0)
			end
			wepLabel.Visible = isEsp and library_flags["Weapon ESP"]; distLabel.Visible = isEsp and library_flags["Distance ESP"]; wepLabel.TextColor3 = library_flags["weaponESPcolor"] or Color3.fromRGB(200, 200, 200); distLabel.TextColor3 = library_flags["distanceESPcolor"] or Color3.fromRGB(255, 255, 255)
			if not library_flags["Distance ESP"] and library_flags["Weapon ESP"] then
				wepLabel.Position = UDim2.new(0, 0, 1, 2)
			else
				wepLabel.Position = UDim2.new(0, 0, 1, 15)
			end
			infoLabel.Visible = isEsp and library_flags["Info ESP"]; flagsLabel.Visible = isEsp and library_flags["Flags ESP"]; flagsLabel.TextColor3 = library_flags["flagsESPcolor"] or Color3.fromRGB(255, 255, 255); local prFlags = {}; local _sel = library_flags["flagsList"]
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
				tracerLine.Visible = true; tracerLine.BackgroundColor3 = library_flags["tracersColor"] or Color3.fromRGB(255,255,255); local startX, startY = previewWin.AbsoluteSize.X / 2, previewWin.AbsoluteSize.Y
				local endX, endY = boxOverlay.Position.X.Offset + (width/2), boxOverlay.Position.Y.Offset + height
				local distance = math.sqrt((endX - startX)^2 + (endY - startY)^2)
				tracerLine.Size = UDim2.new(0, 1, 0, distance); tracerLine.Position = UDim2.new(0, startX, 0, startY)
				local angle = math.deg(math.atan2(endY - startY, endX - startX))
				tracerLine.Rotation = angle + 90
			else
				tracerLine.Visible = false
			end
			if isEsp and library_flags["Chams"] then
				local clr = library_flags["chamsVisibleColor"] or library_flags["chamsColor"] or Color3.fromRGB(0, 255, 0); local wallClr = library_flags["chamsWallColor"] or library_flags["chamsColor2"] or Color3.fromRGB(255, 0, 0); local trans = 1 - (UI_Library and UI_Library.options and UI_Library.options["chamsVisibleColor"] and UI_Library.options["chamsVisibleColor"].trans or 0.2); local wallTrans = 1 - (UI_Library and UI_Library.options and UI_Library.options["chamsWallColor"] and UI_Library.options["chamsWallColor"].trans or 0.2); local isVisible = library_flags["previewChamsVisible"]; local hidden = previewModel:FindFirstChild("HiddenAssets") or Instance.new("Folder", previewModel); hidden.Name = "HiddenAssets"; local hl = previewModel:FindFirstChild("PreviewHighlight")
				if library_flags["Chams Outline"] then
					if not hl then
						hl = Instance.new("Highlight"); hl.Name = "PreviewHighlight"; hl.Parent = previewModel
						hl.Adornee = previewModel
						hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					end
					local outClr = library_flags["chamsVisibleOutlineColor"] or Color3.fromRGB(0, 0, 0); local outWallClr = library_flags["chamsWallOutlineColor"] or Color3.fromRGB(0, 0, 0); local outTrans = 1 - (UI_Library and UI_Library.options and UI_Library.options["chamsVisibleOutlineColor"] and UI_Library.options["chamsVisibleOutlineColor"].trans or 0); local outWallTrans = 1 - (UI_Library and UI_Library.options and UI_Library.options["chamsWallOutlineColor"] and UI_Library.options["chamsWallOutlineColor"].trans or 0); hl.FillTransparency = 1; hl.OutlineColor = isVisible and outClr or outWallClr; hl.OutlineTransparency = isVisible and outTrans or outWallTrans
				else
					if hl then hl:Destroy() end
				end
				for _, part in previewModel:GetDescendants() do
					if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
						if not part:GetAttribute("OrigColor") then part:SetAttribute("OrigColor", part.Color) end
						if not part:GetAttribute("OrigMat") then part:SetAttribute("OrigMat", part.Material.Name) end
						if not part:GetAttribute("OrigTrans") then part:SetAttribute("OrigTrans", part.Transparency) end
						local c = isVisible and clr or wallClr; local t = isVisible and trans or wallTrans; part.Color = c; part.Material = Enum.Material.Neon; part.Transparency = t
					end
					if part:IsA("MeshPart") then
						if not part:GetAttribute("OrigTex") then part:SetAttribute("OrigTex", part.TextureID) end
						part.TextureID = ""
					end
					if part:IsA("SurfaceAppearance") or part:IsA("Shirt") or part:IsA("Pants") or part:IsA("Decal") or part:IsA("Texture") then
						if part.Parent ~= hidden then
							local ov = part:FindFirstChild("OrigParent") or Instance.new("ObjectValue", part); ov.Name = "OrigParent"; ov.Value = part.Parent; part.Parent = hidden
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
				stroke.Thickness = 2; nameStroke.Enabled = true
			else
				stroke.Thickness = 1; nameStroke.Enabled = false
			end
            if isEsp and library_flags["Skeleton ESP"] then
				local skelClr = library_flags["skeletonColor"] or Color3.fromRGB(255, 255, 255)
                local joints = { {"Head", "UpperTorso"}, {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"}, {"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"}, {"UpperTorso", "LowerTorso"}, {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"}, {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"} }
                for i, v in joints do
                    local j1 = previewModel:FindFirstChild(v[1], true); local j2 = previewModel:FindFirstChild(v[2], true); local line = skelLines[i]
                    if line and j1 and j2 then
                        local p1 = get2D(j1.Position); local p2 = get2D(j2.Position); p1 = Vector2.new(p1.X + offset_X, p1.Y + offset_Y); p2 = Vector2.new(p2.X + offset_X, p2.Y + offset_Y); local dist = (p2 - p1).Magnitude; line.Size = UDim2.new(0, dist, 0, 1); line.Position = UDim2.new(0, (p1.X + p2.X)/2, 0, (p1.Y + p2.Y)/2); line.Rotation = math.deg(math.atan2(p2.Y - p1.Y, p2.X - p1.X))
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
		local tabBtn = Instance.new("TextButton", tabContainer); tabBtn.LayoutOrder = index * 10; tabBtn.Size = UDim2.new(0, 130, 0, 32); tabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20); tabBtn.BackgroundTransparency = 1; tabBtn.Text = ""; Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 3); local tabIcon = Instance.new("ImageLabel", tabBtn)
		local icTitle = tostring(tab.title or ""):lower():gsub("(%a)(%w*)", function(a, b) return a:upper() .. b end)
		if icTitle == "Demos" then
			tabIcon.Size = UDim2.new(0, 48, 0, 48); tabIcon.Position = UDim2.new(0, -4, 0.5, -24)
		else
			tabIcon.Size = UDim2.new(0, 24, 0, 24); tabIcon.Position = UDim2.new(0, 8, 0.5, -12)
		end
		tabIcon.BackgroundTransparency = 1; tabIcon.ScaleType = Enum.ScaleType.Fit; tabIcon.Image = TabIcons[icTitle] or TabIcons[icTitle:lower()] or ""; tabIcon.ImageColor3 = Color3.fromRGB(0, 255, 0); local tabLabel = Instance.new("TextLabel", tabBtn); tabLabel.Size = UDim2.new(1, -36, 1, 0); tabLabel.Position = UDim2.new(0, 36, 0, 0); tabLabel.BackgroundTransparency = 1; tabLabel.Text = tostring(tab.title or "unnamed"):lower(); tabLabel.Font = Enum.Font.Code; tabLabel.TextSize = 14; tabLabel.TextColor3 = Color3.fromRGB(160, 160, 160); tabLabel.TextXAlignment = Enum.TextXAlignment.Left; local secFramesToToggle = {}; tab.sidebarSubBtns = {}; tab.subContainer = Instance.new("Frame", tabContainer); tab.subContainer.Name = "SubContainer"; tab.subContainer.LayoutOrder = index * 10 + 1; tab.subContainer.Size = UDim2.new(1, 0, 0, 0); tab.subContainer.BackgroundTransparency = 1
		tab.subContainer.ClipsDescendants = true
		local subList = Instance.new("UIListLayout", tab.subContainer); subList.SortOrder = Enum.SortOrder.LayoutOrder
		if #tab.subtabs > 0 then
			tab.subContainer.Visible = true
			for _, sub in tab.subtabs do
				local sBtn = Instance.new("TextButton", tab.subContainer); sBtn.Size = UDim2.new(1, 0, 0, 22); sBtn.BackgroundTransparency = 1; sBtn.Text = ""; local sLabel = Instance.new("TextLabel", sBtn); sLabel.Size = UDim2.new(1, -46, 1, 0); sLabel.Position = UDim2.new(0, 46, 0, 0); sLabel.BackgroundTransparency = 1; sLabel.Text = sub.title:lower(); sLabel.Font = Enum.Font.Code; sLabel.TextSize = 13; sLabel.TextColor3 = Color3.fromRGB(120, 120, 120); sLabel.TextXAlignment = Enum.TextXAlignment.Left; table.insert(tab.sidebarSubBtns, {btn = sBtn, label = sLabel, sub = sub})
			end
		end
		local pageFrame = Instance.new("ScrollingFrame", content); pageFrame.Size = UDim2.new(1, 0, 1, 0); pageFrame.BackgroundTransparency = 1; pageFrame.BorderSizePixel = 0; pageFrame.ScrollBarThickness = 1; pageFrame.CanvasSize = UDim2.new(0, 0, 0, 0); pageFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y; pageFrame.Visible = false
		if tostring(tab.title):lower() == "skins" then
			local skinLayout = Instance.new("UIListLayout", pageFrame); skinLayout.Padding = UDim.new(0, 8); skinLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center; skinLayout.SortOrder = Enum.SortOrder.LayoutOrder; Instance.new("UIPadding", pageFrame).PaddingTop = UDim.new(0, 5); local RS = game:GetService("ReplicatedStorage"); local Skins = RS:FindFirstChild("Skins"); local Viewmodels = RS:FindFirstChild("Viewmodels"); local AllWeapons = {}; local AllSkins = {}; local AllKnives = { "CT Knife", "T Knife", "Banana", "Bayonet", "Bearded Axe", "Butterfly Knife", "Cleaver", "Crowbar", "Falchion Knife", "Flip Knife", "Gut Knife", "Huntsman Knife", "Karambit", "M9 Bayonet", "Sickle" }
			if Skins then
				for _, v in Skins:GetChildren() do
					if v:IsA("Folder") then
						local isKnife = false
						for _, knife in AllKnives do
							local cleanKnife = knife:gsub(" Knife", ""):gsub(" Classic", ""); local cleanLower = cleanKnife:lower()
							if v.Name:lower() == cleanLower or v.Name:lower():sub(1, #cleanLower + 1) == cleanLower .. " " then
								isKnife = true; break
							end
						end
						if not isKnife then
							table.insert(AllWeapons, v.Name)
						end
						AllSkins[v.Name] = {"Inventory"}
						for _, v2 in v:GetChildren() do
							if v2:IsA("Folder") or v2:IsA("Model") then
								table.insert(AllSkins[v.Name], v2.Name)
							end
						end
					end
				end
			end
			table.sort(AllWeapons); table.sort(AllKnives); local currentWeapon = AllWeapons[1] or "none"; local currentSkin = "Inventory"; local scHeader = Instance.new("Frame", pageFrame); scHeader.Size = UDim2.new(0.95, 0, 0, 30); scHeader.BackgroundColor3 = Color3.fromRGB(16, 16, 16); scHeader.BorderSizePixel = 0; scHeader.LayoutOrder = 1; Instance.new("UICorner", scHeader).CornerRadius = UDim.new(0, 5); Instance.new("UIStroke", scHeader).Color = Color3.fromRGB(25, 25, 25); local scTitle = Instance.new("TextLabel", scHeader); scTitle.Size = UDim2.new(1, 0, 1, 0); scTitle.BackgroundTransparency = 1; scTitle.Text = "skin changer"; scTitle.TextColor3 = Color3.fromRGB(220, 220, 220); scTitle.Font = Enum.Font.Code; scTitle.TextSize = 13; local topContainer = Instance.new("Frame", pageFrame); topContainer.Size = UDim2.new(0.95, 0, 0, 76); topContainer.BackgroundTransparency = 1; topContainer.LayoutOrder = 2; local leftCol = Instance.new("Frame", topContainer); leftCol.Size = UDim2.new(0.31, 0, 1, 0); leftCol.BackgroundTransparency = 1; local leftList = Instance.new("UIListLayout", leftCol); leftList.Padding = UDim.new(0, 4); leftList.SortOrder = Enum.SortOrder.LayoutOrder; local rightCol = Instance.new("Frame", topContainer); rightCol.Size = UDim2.new(0.31, 0, 1, 0); rightCol.Position = UDim2.new(0.69, 0, 0, 0); rightCol.BackgroundTransparency = 1; local rightList = Instance.new("UIListLayout", rightCol); rightList.Padding = UDim.new(0, 4); rightList.SortOrder = Enum.SortOrder.LayoutOrder; local knifeCol = Instance.new("Frame", topContainer); knifeCol.Size = UDim2.new(0.31, 0, 1, 0); knifeCol.Position = UDim2.new(0.345, 0, 0, 0); knifeCol.BackgroundTransparency = 1; local knifeList = Instance.new("UIListLayout", knifeCol); knifeList.Padding = UDim.new(0, 4); knifeList.SortOrder = Enum.SortOrder.LayoutOrder; local wepFrame = Instance.new("Frame", leftCol); wepFrame.Size = UDim2.new(1, 0, 0, 22); wepFrame.BackgroundTransparency = 1; wepFrame.LayoutOrder = 1; local wepLabel = Instance.new("TextLabel", wepFrame); wepLabel.Size = UDim2.new(0.3, 0, 1, 0); wepLabel.BackgroundTransparency = 1; wepLabel.Text = "weapon"; wepLabel.TextColor3 = Color3.fromRGB(180, 180, 180); wepLabel.Font = Enum.Font.Code; wepLabel.TextSize = 13; wepLabel.TextXAlignment = Enum.TextXAlignment.Left; local wepBtn = Instance.new("TextButton", wepFrame); wepBtn.Size = UDim2.new(0.65, 0, 0, 18); wepBtn.Position = UDim2.new(0.35, 0, 0.5, -9); wepBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); wepBtn.Text = currentWeapon; wepBtn.TextColor3 = Color3.fromRGB(180, 180, 180); wepBtn.Font = Enum.Font.Code; wepBtn.TextSize = 11; wepBtn.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UICorner", wepBtn).CornerRadius = UDim.new(0, 3); Instance.new("UIStroke", wepBtn).Color = Color3.fromRGB(35, 35, 35); Instance.new("UIPadding", wepBtn).PaddingLeft = UDim.new(0, 6); local wepDrop = Instance.new("ScrollingFrame", sg); wepDrop.Size = UDim2.new(0, 200, 0, math.min(#AllWeapons * 18, 250)); wepDrop.CanvasSize = UDim2.new(0, 0, 0, #AllWeapons * 18); wepDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18); wepDrop.BorderSizePixel = 0; wepDrop.ScrollBarThickness = 2; wepDrop.Visible = false; wepDrop.ZIndex = 9999
			wepDrop.ClipsDescendants = true
			Instance.new("UIListLayout", wepDrop).SortOrder = Enum.SortOrder.LayoutOrder
			table.insert(floatingDropdowns, wepDrop)
			local rebuildSkinDrop; local skinBtn; local skinDrop; local loadWeaponPreview; local loadGlovePreview; local loadSleevePreview
			local function getFlagName(wName)
				local isKnife = false
				for _, k in AllKnives do
					if k == wName then isKnife = true break end
				end
				local formatted = wName:gsub(" ", "_"):gsub("-", "_")
				return (isKnife and "skin_knife_" or "skin_") .. formatted
			end
			for _, wName in AllWeapons do
				local item = Instance.new("TextButton", wepDrop); item.Size = UDim2.new(1, 0, 0, 18); item.BackgroundTransparency = 1; item.Text = " " .. wName; item.TextColor3 = Color3.fromRGB(180, 180, 180); item.Font = Enum.Font.Code; item.TextSize = 11; item.TextXAlignment = Enum.TextXAlignment.Left; item.ZIndex = 10000
				item.MouseButton1Click:Connect(function()
					currentWeapon = wName; wepBtn.Text = wName; library_flags["skinWeapon"] = wName
					if UI_Library.options and UI_Library.options["skinWeapon"] then UI_Library.options["skinWeapon"].value = wName end
					wepDrop.Visible = false; local flagName = getFlagName(wName); local savedSkin = library_flags[flagName] or "Inventory"; currentSkin = savedSkin; skinBtn.Text = savedSkin; library_flags["skinSkin"] = savedSkin
					if UI_Library.options and UI_Library.options["skinSkin"] then UI_Library.options["skinSkin"].value = savedSkin end
					if rebuildSkinDrop then rebuildSkinDrop() end
					loadWeaponPreview()
				end)
			end
			wepBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do if dl ~= wepDrop then dl.Visible = false end end
				wepDrop.Visible = not wepDrop.Visible
				if wepDrop.Visible then
					local relPos = wepBtn.AbsolutePosition - (UI_Library.mainFrame and UI_Library.mainFrame.AbsolutePosition or Vector2.new()); wepDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20); wepDrop.Size = UDim2.new(0, wepBtn.AbsoluteSize.X, 0, math.min(#AllWeapons * 18, 250)); wepDrop.Parent = UI_Library.mainFrame or sg
				end
			end)
			local skinFrame = Instance.new("Frame", leftCol); skinFrame.Size = UDim2.new(1, 0, 0, 22); skinFrame.BackgroundTransparency = 1; skinFrame.LayoutOrder = 2; local skinLabel = Instance.new("TextLabel", skinFrame); skinLabel.Size = UDim2.new(0.3, 0, 1, 0); skinLabel.BackgroundTransparency = 1; skinLabel.Text = "skin"; skinLabel.TextColor3 = Color3.fromRGB(180, 180, 180); skinLabel.Font = Enum.Font.Code; skinLabel.TextSize = 13; skinLabel.TextXAlignment = Enum.TextXAlignment.Left; skinBtn = Instance.new("TextButton", skinFrame); skinBtn.Size = UDim2.new(0.65, 0, 0, 18); skinBtn.Position = UDim2.new(0.35, 0, 0.5, -9); skinBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); skinBtn.Text = currentSkin; skinBtn.TextColor3 = Color3.fromRGB(180, 180, 180); skinBtn.Font = Enum.Font.Code; skinBtn.TextSize = 11; skinBtn.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UICorner", skinBtn).CornerRadius = UDim.new(0, 3); Instance.new("UIStroke", skinBtn).Color = Color3.fromRGB(35, 35, 35); Instance.new("UIPadding", skinBtn).PaddingLeft = UDim.new(0, 6); skinDrop = Instance.new("ScrollingFrame", sg); skinDrop.Size = UDim2.new(0, 200, 0, 100); skinDrop.CanvasSize = UDim2.new(0, 0, 0, 0); skinDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18); skinDrop.BorderSizePixel = 0; skinDrop.ScrollBarThickness = 2; skinDrop.Visible = false; skinDrop.ZIndex = 9999
			skinDrop.ClipsDescendants = true
			Instance.new("UIListLayout", skinDrop).SortOrder = Enum.SortOrder.LayoutOrder
			table.insert(floatingDropdowns, skinDrop)
			rebuildSkinDrop = function()
				for _, ch in skinDrop:GetChildren() do
					if ch:IsA("TextButton") then ch:Destroy() end
				end
				local skins = AllSkins[currentWeapon] or {"Inventory"}
				for _, sName in skins do
					local item = Instance.new("TextButton", skinDrop); item.Size = UDim2.new(1, 0, 0, 18); item.BackgroundTransparency = 1; item.Text = " " .. sName; item.TextColor3 = Color3.fromRGB(180, 180, 180); item.Font = Enum.Font.Code; item.TextSize = 11; item.TextXAlignment = Enum.TextXAlignment.Left; item.ZIndex = 10000
					item.MouseButton1Click:Connect(function()
						currentSkin = sName; skinBtn.Text = sName; library_flags["skinSkin"] = sName
						if UI_Library.options and UI_Library.options["skinSkin"] then UI_Library.options["skinSkin"].value = sName end
						skinDrop.Visible = false; loadWeaponPreview()
					end)
				end
				skinDrop.CanvasSize = UDim2.new(0, 0, 0, #skins * 18); skinDrop.Size = UDim2.new(0, skinBtn.AbsoluteSize.X, 0, math.min(#skins * 18, 250))
			end
			skinBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do if dl ~= skinDrop then dl.Visible = false end end
				skinDrop.Visible = not skinDrop.Visible
				if skinDrop.Visible then
					if rebuildSkinDrop then rebuildSkinDrop() end
					local relPos = skinBtn.AbsolutePosition - (UI_Library.mainFrame and UI_Library.mainFrame.AbsolutePosition or Vector2.new()); skinDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20); skinDrop.Parent = UI_Library.mainFrame or sg
				end
			end)
			local currentKnife = AllKnives[1] or "none"; local currentKnifeSkin = "Inventory"; local knifeFrame = Instance.new("Frame", knifeCol); knifeFrame.Size = UDim2.new(1, 0, 0, 22); knifeFrame.BackgroundTransparency = 1; knifeFrame.LayoutOrder = 1; local knifeLabel = Instance.new("TextLabel", knifeFrame); knifeLabel.Size = UDim2.new(0.3, 0, 1, 0); knifeLabel.BackgroundTransparency = 1; knifeLabel.Text = "knife"; knifeLabel.TextColor3 = Color3.fromRGB(180, 180, 180); knifeLabel.Font = Enum.Font.Code; knifeLabel.TextSize = 13; knifeLabel.TextXAlignment = Enum.TextXAlignment.Left; local knifeBtn = Instance.new("TextButton", knifeFrame); knifeBtn.Size = UDim2.new(0.65, 0, 0, 18); knifeBtn.Position = UDim2.new(0.35, 0, 0.5, -9); knifeBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); knifeBtn.Text = currentKnife; knifeBtn.TextColor3 = Color3.fromRGB(180, 180, 180); knifeBtn.Font = Enum.Font.Code; knifeBtn.TextSize = 11; knifeBtn.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UICorner", knifeBtn).CornerRadius = UDim.new(0, 3); Instance.new("UIStroke", knifeBtn).Color = Color3.fromRGB(35, 35, 35); Instance.new("UIPadding", knifeBtn).PaddingLeft = UDim.new(0, 6); local knifeDrop = Instance.new("ScrollingFrame", sg); knifeDrop.Size = UDim2.new(0, 200, 0, math.min(#AllKnives * 18, 250)); knifeDrop.CanvasSize = UDim2.new(0, 0, 0, #AllKnives * 18); knifeDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18); knifeDrop.BorderSizePixel = 0; knifeDrop.ScrollBarThickness = 2; knifeDrop.Visible = false; knifeDrop.ZIndex = 9999; Instance.new("UIListLayout", knifeDrop).SortOrder = Enum.SortOrder.LayoutOrder
			table.insert(floatingDropdowns, knifeDrop)
			local rebuildKnifeSkinDrop; local knifeSkinBtn; local knifeSkinDrop; local loadKnifePreview
			for _, kName in AllKnives do
				local item = Instance.new("TextButton", knifeDrop); item.Size = UDim2.new(1, 0, 0, 18); item.BackgroundTransparency = 1; item.Text = " " .. kName; item.TextColor3 = Color3.fromRGB(180, 180, 180); item.Font = Enum.Font.Code; item.TextSize = 11; item.TextXAlignment = Enum.TextXAlignment.Left; item.ZIndex = 10000
				item.MouseButton1Click:Connect(function()
					currentKnife = kName; knifeBtn.Text = kName; library_flags["skinKnife"] = kName
					if UI_Library.options and UI_Library.options["skinKnife"] then UI_Library.options["skinKnife"].value = kName end
					knifeDrop.Visible = false; local flagName = getFlagName(kName); local savedSkin = library_flags[flagName] or "Inventory"; currentKnifeSkin = savedSkin
					if knifeSkinBtn then knifeSkinBtn.Text = savedSkin end
					if rebuildKnifeSkinDrop then rebuildKnifeSkinDrop() end
					if loadKnifePreview then loadKnifePreview() end
				end)
			end
			knifeBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do if dl ~= knifeDrop then dl.Visible = false end end
				knifeDrop.Visible = not knifeDrop.Visible
				if knifeDrop.Visible then
					local relPos = knifeBtn.AbsolutePosition - (UI_Library.mainFrame and UI_Library.mainFrame.AbsolutePosition or Vector2.new()); knifeDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20); knifeDrop.Size = UDim2.new(0, knifeBtn.AbsoluteSize.X, 0, math.min(#AllKnives * 18, 250)); knifeDrop.Parent = UI_Library.mainFrame or sg
				end
			end)
			local knifeSkinFrame = Instance.new("Frame", knifeCol); knifeSkinFrame.Size = UDim2.new(1, 0, 0, 22); knifeSkinFrame.BackgroundTransparency = 1; knifeSkinFrame.LayoutOrder = 2; local knifeSkinLabel = Instance.new("TextLabel", knifeSkinFrame); knifeSkinLabel.Size = UDim2.new(0.3, 0, 1, 0); knifeSkinLabel.BackgroundTransparency = 1; knifeSkinLabel.Text = "skin"; knifeSkinLabel.TextColor3 = Color3.fromRGB(180, 180, 180); knifeSkinLabel.Font = Enum.Font.Code; knifeSkinLabel.TextSize = 13; knifeSkinLabel.TextXAlignment = Enum.TextXAlignment.Left; knifeSkinBtn = Instance.new("TextButton", knifeSkinFrame); knifeSkinBtn.Size = UDim2.new(0.65, 0, 0, 18); knifeSkinBtn.Position = UDim2.new(0.35, 0, 0.5, -9); knifeSkinBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); knifeSkinBtn.Text = currentKnifeSkin; knifeSkinBtn.TextColor3 = Color3.fromRGB(180, 180, 180); knifeSkinBtn.Font = Enum.Font.Code; knifeSkinBtn.TextSize = 11; knifeSkinBtn.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UICorner", knifeSkinBtn).CornerRadius = UDim.new(0, 3); Instance.new("UIStroke", knifeSkinBtn).Color = Color3.fromRGB(35, 35, 35); Instance.new("UIPadding", knifeSkinBtn).PaddingLeft = UDim.new(0, 6); knifeSkinDrop = Instance.new("ScrollingFrame", sg); knifeSkinDrop.Size = UDim2.new(0, 200, 0, 100); knifeSkinDrop.CanvasSize = UDim2.new(0, 0, 0, 0); knifeSkinDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18); knifeSkinDrop.BorderSizePixel = 0; knifeSkinDrop.ScrollBarThickness = 2; knifeSkinDrop.Visible = false; knifeSkinDrop.ZIndex = 9999
			knifeSkinDrop.ClipsDescendants = true
			Instance.new("UIListLayout", knifeSkinDrop).SortOrder = Enum.SortOrder.LayoutOrder
			table.insert(floatingDropdowns, knifeSkinDrop)
			rebuildKnifeSkinDrop = function()
				for _, ch in knifeSkinDrop:GetChildren() do
					if ch:IsA("TextButton") then ch:Destroy() end
				end
				local skins = AllSkins[currentKnife] or {"Inventory"}
				for _, sName in skins do
					local item = Instance.new("TextButton", knifeSkinDrop); item.Size = UDim2.new(1, 0, 0, 18); item.BackgroundTransparency = 1; item.Text = " " .. sName; item.TextColor3 = Color3.fromRGB(180, 180, 180); item.Font = Enum.Font.Code; item.TextSize = 11; item.TextXAlignment = Enum.TextXAlignment.Left; item.ZIndex = 10000
					item.MouseButton1Click:Connect(function()
						currentKnifeSkin = sName; knifeSkinBtn.Text = sName; local flagName = getFlagName(currentKnife); library_flags[flagName] = sName
						if UI_Library.options and UI_Library.options[flagName] then
							local opt = UI_Library.options[flagName]
							if type(opt.SetValue) == "function" then
								pcall(function() opt:SetValue(sName) end)
							else
								opt.value = sName
							end
						end
						knifeSkinDrop.Visible = false
						if loadKnifePreview then loadKnifePreview() end
					end)
				end
				knifeSkinDrop.CanvasSize = UDim2.new(0, 0, 0, #skins * 18); knifeSkinDrop.Size = UDim2.new(0, knifeSkinBtn.AbsoluteSize.X, 0, math.min(#skins * 18, 250))
			end
			knifeSkinBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do if dl ~= knifeSkinDrop then dl.Visible = false end end
				knifeSkinDrop.Visible = not knifeSkinDrop.Visible
				if knifeSkinDrop.Visible then
					if rebuildKnifeSkinDrop then rebuildKnifeSkinDrop() end
					local relPos = knifeSkinBtn.AbsolutePosition - (UI_Library.mainFrame and UI_Library.mainFrame.AbsolutePosition or Vector2.new()); knifeSkinDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20); knifeSkinDrop.Parent = UI_Library.mainFrame or sg
				end
			end)
			local gloveTypeFrame = Instance.new("Frame", rightCol); gloveTypeFrame.Size = UDim2.new(1, 0, 0, 22); gloveTypeFrame.BackgroundTransparency = 1; gloveTypeFrame.LayoutOrder = 1; local gloveTypeLabel = Instance.new("TextLabel", gloveTypeFrame); gloveTypeLabel.Size = UDim2.new(0.3, 0, 1, 0); gloveTypeLabel.BackgroundTransparency = 1; gloveTypeLabel.Text = "type"; gloveTypeLabel.TextColor3 = Color3.fromRGB(180, 180, 180); gloveTypeLabel.Font = Enum.Font.Code; gloveTypeLabel.TextSize = 13; gloveTypeLabel.TextXAlignment = Enum.TextXAlignment.Left; local GloveTypes = {"None"}; local Gloves = game:GetService("ReplicatedStorage"):FindFirstChild("Gloves"); local GloveModels = Gloves and Gloves:FindFirstChild("Models")
			if Gloves then
				for _, fldr in Gloves:GetChildren() do
					if fldr:IsA("Folder") and fldr.Name ~= "Models" and fldr.Name ~= "Racer" then
						table.insert(GloveTypes, fldr.Name)
					end
				end
			end
			table.sort(GloveTypes, function(a,b) if a == "None" then return true end if b == "None" then return false end return a < b end)
			local currentGloveType = library_flags["skinGloveModel"] or "None"; local gloveTypeBtn = Instance.new("TextButton", gloveTypeFrame); gloveTypeBtn.Size = UDim2.new(0.65, 0, 0, 18); gloveTypeBtn.Position = UDim2.new(0.35, 0, 0.5, -9); gloveTypeBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); gloveTypeBtn.Text = currentGloveType; gloveTypeBtn.TextColor3 = Color3.fromRGB(180, 180, 180); gloveTypeBtn.Font = Enum.Font.Code; gloveTypeBtn.TextSize = 11; gloveTypeBtn.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UICorner", gloveTypeBtn).CornerRadius = UDim.new(0, 3); Instance.new("UIStroke", gloveTypeBtn).Color = Color3.fromRGB(35, 35, 35); Instance.new("UIPadding", gloveTypeBtn).PaddingLeft = UDim.new(0, 6); local gtDrop = Instance.new("ScrollingFrame", sg); gtDrop.Size = UDim2.new(0, 200, 0, math.min(#GloveTypes * 18, 250)); gtDrop.CanvasSize = UDim2.new(0, 0, 0, #GloveTypes * 18); gtDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18); gtDrop.BorderSizePixel = 0; gtDrop.ScrollBarThickness = 2; gtDrop.Visible = false; gtDrop.ZIndex = 9999; Instance.new("UIListLayout", gtDrop).SortOrder = Enum.SortOrder.LayoutOrder
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
			local currentGloveSkin = library_flags["skinGloveSkin"] or "Default"; local gloveBtn
			local function rebuildGloveSkinDrop(gDrop, gBtn)
				for _, ch in gDrop:GetChildren() do
					if ch:IsA("TextButton") then ch:Destroy() end
				end
				local gSkins = getGloveSkins(currentGloveType)
				for _, skName in gSkins do
					local item = Instance.new("TextButton", gDrop); item.Size = UDim2.new(1, 0, 0, 18); item.BackgroundTransparency = 1; item.Text = " " .. skName; item.TextColor3 = Color3.fromRGB(180, 180, 180); item.Font = Enum.Font.Code; item.TextSize = 11; item.TextXAlignment = Enum.TextXAlignment.Left; item.ZIndex = 10000
					item.MouseButton1Click:Connect(function()
						currentGloveSkin = skName; library_flags["skinGloveSkin"] = skName
						if gBtn then gBtn.Text = skName end
						if UI_Library.options and UI_Library.options["skinGloveSkin"] then UI_Library.options["skinGloveSkin"].value = skName end
						gDrop.Visible = false; loadGlovePreview()
					end)
				end
				gDrop.CanvasSize = UDim2.new(0, 0, 0, #gSkins * 18)
				if gBtn then gDrop.Size = UDim2.new(0, gBtn.AbsoluteSize.X, 0, math.min(#gSkins * 18, 250)) end
			end
			for _, gtName in GloveTypes do
				local item = Instance.new("TextButton", gtDrop); item.Size = UDim2.new(1, 0, 0, 18); item.BackgroundTransparency = 1; item.Text = " " .. gtName; item.TextColor3 = Color3.fromRGB(180, 180, 180); item.Font = Enum.Font.Code; item.TextSize = 11; item.TextXAlignment = Enum.TextXAlignment.Left; item.ZIndex = 10000
				item.MouseButton1Click:Connect(function()
					currentGloveType = gtName; gloveTypeBtn.Text = gtName; library_flags["skinGloveModel"] = gtName
					if UI_Library.options and UI_Library.options["skinGloveModel"] then UI_Library.options["skinGloveModel"].value = gtName end
					gtDrop.Visible = false; currentGloveSkin = "Default"; library_flags["skinGloveSkin"] = "Default"
					if gloveBtn then gloveBtn.Text = "Default" end
					if UI_Library.options and UI_Library.options["skinGloveSkin"] then UI_Library.options["skinGloveSkin"].value = "Default" end
					rebuildGloveSkinDrop(floatingDropdowns[#floatingDropdowns], gloveBtn)
					loadGlovePreview()
				end)
			end
			gloveTypeBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do if dl ~= gtDrop then dl.Visible = false end end
				gtDrop.Visible = not gtDrop.Visible
				if gtDrop.Visible then
					local relPos = gloveTypeBtn.AbsolutePosition - (UI_Library.mainFrame and UI_Library.mainFrame.AbsolutePosition or Vector2.new()); gtDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20); gtDrop.Size = UDim2.new(0, gloveTypeBtn.AbsoluteSize.X, 0, math.min(#GloveTypes * 18, 250)); gtDrop.Parent = UI_Library.mainFrame or sg
				end
			end)
			local gloveRow = Instance.new("Frame", rightCol); gloveRow.Size = UDim2.new(1, 0, 0, 22); gloveRow.BackgroundTransparency = 1; gloveRow.LayoutOrder = 2; local gloveLabel = Instance.new("TextLabel", gloveRow); gloveLabel.Size = UDim2.new(0.3, 0, 1, 0); gloveLabel.BackgroundTransparency = 1; gloveLabel.Text = "skin"; gloveLabel.TextColor3 = Color3.fromRGB(180, 180, 180); gloveLabel.Font = Enum.Font.Code; gloveLabel.TextSize = 13; gloveLabel.TextXAlignment = Enum.TextXAlignment.Left; gloveBtn = Instance.new("TextButton", gloveRow); gloveBtn.Size = UDim2.new(0.65, 0, 0, 18); gloveBtn.Position = UDim2.new(0.35, 0, 0.5, -9); gloveBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); gloveBtn.Text = currentGloveSkin; gloveBtn.TextColor3 = Color3.fromRGB(180, 180, 180); gloveBtn.Font = Enum.Font.Code; gloveBtn.TextSize = 11; gloveBtn.TextXAlignment = Enum.TextXAlignment.Left; Instance.new("UICorner", gloveBtn).CornerRadius = UDim.new(0, 3); Instance.new("UIStroke", gloveBtn).Color = Color3.fromRGB(35, 35, 35); Instance.new("UIPadding", gloveBtn).PaddingLeft = UDim.new(0, 6); local gDrop = Instance.new("ScrollingFrame", sg); gDrop.Size = UDim2.new(0, 200, 0, 100); gDrop.CanvasSize = UDim2.new(0, 0, 0, 0); gDrop.BackgroundColor3 = Color3.fromRGB(18, 18, 18); gDrop.BorderSizePixel = 0; gDrop.ScrollBarThickness = 2; gDrop.Visible = false; gDrop.ZIndex = 9999; Instance.new("UIListLayout", gDrop).SortOrder = Enum.SortOrder.LayoutOrder
			table.insert(floatingDropdowns, gDrop)
			rebuildGloveSkinDrop(gDrop, gloveBtn)
			gloveBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do
					if dl ~= gDrop then dl.Visible = false end
				end
				gDrop.Visible = not gDrop.Visible
				if gDrop.Visible then
					rebuildGloveSkinDrop(gDrop, gloveBtn); local relPos = gloveBtn.AbsolutePosition - (UI_Library.mainFrame and UI_Library.mainFrame.AbsolutePosition or Vector2.new()); gDrop.Position = UDim2.new(0, relPos.X, 0, relPos.Y + 20); gDrop.Parent = UI_Library.mainFrame or sg
				end
			end)
			local prevContainer = Instance.new("Frame", pageFrame); prevContainer.Size = UDim2.new(0.95, 0, 0, 220); prevContainer.BackgroundColor3 = Color3.fromRGB(10, 10, 10); prevContainer.BorderSizePixel = 0; prevContainer.LayoutOrder = 4; prevContainer.Active = true; Instance.new("UICorner", prevContainer).CornerRadius = UDim.new(0, 5); Instance.new("UIStroke", prevContainer).Color = Color3.fromRGB(25, 25, 25); local prevLabelWep = Instance.new("TextLabel", prevContainer); prevLabelWep.Size = UDim2.new(0.333, 0, 0, 18); prevLabelWep.BackgroundTransparency = 1; prevLabelWep.Text = "weapon"; prevLabelWep.TextColor3 = Color3.fromRGB(100, 100, 100); prevLabelWep.Font = Enum.Font.Code; prevLabelWep.TextSize = 12; local prevLabelGlove = Instance.new("TextLabel", prevContainer); prevLabelGlove.Size = UDim2.new(0.333, 0, 0, 18); prevLabelGlove.Position = UDim2.new(0.333, 0, 0, 0); prevLabelGlove.BackgroundTransparency = 1; prevLabelGlove.Text = "knife"; prevLabelGlove.TextColor3 = Color3.fromRGB(100, 100, 100); prevLabelGlove.Font = Enum.Font.Code; prevLabelGlove.TextSize = 12; local prevLabelSleeve = Instance.new("TextLabel", prevContainer); prevLabelSleeve.Size = UDim2.new(0.333, 0, 0, 18); prevLabelSleeve.Position = UDim2.new(0.666, 0, 0, 0); prevLabelSleeve.BackgroundTransparency = 1; prevLabelSleeve.Text = "gloves"; prevLabelSleeve.TextColor3 = Color3.fromRGB(100, 100, 100); prevLabelSleeve.Font = Enum.Font.Code; prevLabelSleeve.TextSize = 12; local splitContainer = Instance.new("Frame", prevContainer); splitContainer.Size = UDim2.new(0.95, 0, 0, 168); splitContainer.Position = UDim2.new(0.025, 0, 0, 20); splitContainer.BackgroundTransparency = 1; local skinViewport = Instance.new("ViewportFrame", splitContainer); skinViewport.Size = UDim2.new(0.31, 0, 1, 0); skinViewport.Position = UDim2.new(0, 0, 0, 0); skinViewport.BackgroundTransparency = 1; skinViewport.Ambient = Color3.fromRGB(200, 200, 200); skinViewport.Active = true; getgenv().skinViewportRef = skinViewport; local knifeViewport = Instance.new("ViewportFrame", splitContainer); knifeViewport.Size = UDim2.new(0.31, 0, 1, 0); knifeViewport.Position = UDim2.new(0.345, 0, 0, 0); knifeViewport.BackgroundTransparency = 1; knifeViewport.Ambient = Color3.fromRGB(200, 200, 200); knifeViewport.Active = true; getgenv().knifeViewportRef = knifeViewport; local gloveViewport = Instance.new("ViewportFrame", splitContainer); gloveViewport.Size = UDim2.new(0.31, 0, 1, 0); gloveViewport.Position = UDim2.new(0.69, 0, 0, 0); gloveViewport.BackgroundTransparency = 1; gloveViewport.Ambient = Color3.fromRGB(200, 200, 200); gloveViewport.Active = true; getgenv().gloveViewportRef = gloveViewport; local splitLine = Instance.new("Frame", splitContainer); splitLine.Size = UDim2.new(0, 2, 1, -10); splitLine.Position = UDim2.new(0.327, -1, 0, 5); splitLine.BackgroundColor3 = Color3.fromRGB(30, 30, 30); splitLine.BorderSizePixel = 0; local splitLine2 = Instance.new("Frame", splitContainer); splitLine2.Size = UDim2.new(0, 2, 1, -10); splitLine2.Position = UDim2.new(0.672, -1, 0, 5); splitLine2.BackgroundColor3 = Color3.fromRGB(30, 30, 30); splitLine2.BorderSizePixel = 0; local skinCam = Instance.new("Camera"); skinCam.FieldOfView = 50; skinViewport.CurrentCamera = skinCam; skinCam.Parent = skinViewport; local skinLight = Instance.new("PointLight", skinCam); skinLight.Color = Color3.fromRGB(255, 255, 255); skinLight.Brightness = 2; skinLight.Range = 20; local skinModel = Instance.new("Model", skinViewport); local knifeCam = Instance.new("Camera"); knifeCam.FieldOfView = 50; knifeViewport.CurrentCamera = knifeCam; knifeCam.Parent = knifeViewport; local knifeLight = Instance.new("PointLight", knifeCam); knifeLight.Color = Color3.fromRGB(255, 255, 255); knifeLight.Brightness = 2; knifeLight.Range = 20; local knifeModel = Instance.new("Model", knifeViewport); local gloveCam = Instance.new("Camera"); gloveCam.FieldOfView = 50; gloveViewport.CurrentCamera = gloveCam; gloveCam.Parent = gloveViewport; local gloveLight = Instance.new("PointLight", gloveCam); gloveLight.Color = Color3.fromRGB(255, 255, 255); gloveLight.Brightness = 2; gloveLight.Range = 20; local gloveModel = Instance.new("Model", gloveViewport); local hintLabel = Instance.new("TextLabel", prevContainer); hintLabel.Size = UDim2.new(1, 0, 0, 15); hintLabel.Position = UDim2.new(0, 0, 1, -18); hintLabel.BackgroundTransparency = 1
			hintLabel.Text = "drag \xE2\x80\xA2 scroll  (independently)"
			hintLabel.TextColor3 = Color3.fromRGB(60, 60, 60); hintLabel.Font = Enum.Font.Code; hintLabel.TextSize = 11; local skinRotY = -90; local skinRotX = 0; local skinDist = 5; local skinDragging = false; local skinDragStart = Vector2.new(); local gloveRotY = 0; local gloveRotX = 0; local gloveDist = 5; local gloveDragging = false; local gloveDragStart = Vector2.new(); local knifeRotY = 0; local knifeRotX = 0; local knifeDist = 5; local knifeDragging = false; local knifeDragStart = Vector2.new()
			local function updateSkinCam()
				local radY = math.rad(skinRotY); local radX = math.rad(skinRotX); local offset = CFrame.Angles(radX, radY, 0) * Vector3.new(0, 0, skinDist); skinCam.CFrame = CFrame.new(offset, Vector3.new(0, 0, 0))
			end
			updateSkinCam()
			local function updateGloveCam()
				local radY = math.rad(gloveRotY); local radX = math.rad(gloveRotX); local offset = CFrame.Angles(radX, radY, 0) * Vector3.new(0, 0, gloveDist); gloveCam.CFrame = CFrame.new(offset, Vector3.new(0, 0, 0))
			end
			updateGloveCam()
			local function updateKnifeCam()
				local radY = math.rad(knifeRotY); local radX = math.rad(knifeRotX); local offset = CFrame.Angles(radX, radY, 0) * Vector3.new(0, 0, knifeDist); knifeCam.CFrame = CFrame.new(offset, Vector3.new(0, 0, 0))
			end
			updateKnifeCam()
			skinViewport.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					skinDragging = true; skinDragStart = Vector2.new(input.Position.X, input.Position.Y)
				end
			end)
			skinViewport.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					skinDragging = false
				end
			end)
			skinViewport.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and skinDragging then
					local deltaX = input.Position.X - skinDragStart.X; local deltaY = input.Position.Y - skinDragStart.Y; skinRotY = skinRotY - deltaX * 0.5; skinRotX = math.clamp(skinRotX - deltaY * 0.5, -89, 89); skinDragStart = Vector2.new(input.Position.X, input.Position.Y); updateSkinCam()
				end
				if input.UserInputType == Enum.UserInputType.MouseWheel then
					skinDist = math.clamp(skinDist - input.Position.Z * 0.2, 1, 20); updateSkinCam()
				end
			end)
			gloveViewport.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					gloveDragging = true; gloveDragStart = Vector2.new(input.Position.X, input.Position.Y)
				end
			end)
			gloveViewport.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					gloveDragging = false
				end
			end)
			gloveViewport.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and gloveDragging then
					local deltaX = input.Position.X - gloveDragStart.X; local deltaY = input.Position.Y - gloveDragStart.Y; gloveRotY = gloveRotY - deltaX * 0.5; gloveRotX = math.clamp(gloveRotX - deltaY * 0.5, -89, 89); gloveDragStart = Vector2.new(input.Position.X, input.Position.Y); updateGloveCam()
				end
				if input.UserInputType == Enum.UserInputType.MouseWheel then
					gloveDist = math.clamp(gloveDist - input.Position.Z * 0.2, 1, 20); updateGloveCam()
				end
			end)
			knifeViewport.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					knifeDragging = true; knifeDragStart = Vector2.new(input.Position.X, input.Position.Y)
				end
			end)
			knifeViewport.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					knifeDragging = false
				end
			end)
			knifeViewport.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement and knifeDragging then
					local deltaX = input.Position.X - knifeDragStart.X; local deltaY = input.Position.Y - knifeDragStart.Y; knifeRotY = knifeRotY - deltaX * 0.5; knifeRotX = math.clamp(knifeRotX - deltaY * 0.5, -89, 89); knifeDragStart = Vector2.new(input.Position.X, input.Position.Y); updateKnifeCam()
				end
				if input.UserInputType == Enum.UserInputType.MouseWheel then
					knifeDist = math.clamp(knifeDist - input.Position.Z * 0.2, 1, 20); updateKnifeCam()
				end
			end)
			loadWeaponPreview = function()
				skinModel:ClearAllChildren()
				if not Viewmodels then return end
				local vmName = "v_" .. currentWeapon; local srcVM = Viewmodels and Viewmodels:FindFirstChild(vmName); local isExtModel = false
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
							if n == "left arm" or n == "right arm" or n == "rglove" or n == "lglove" or n == "glove" or n:find("sleeve") or n:find("fake") then
								d.Transparency = 1
							end
							d.Anchored = true; d.CanCollide = false
						end
					end
					if currentSkin ~= "Inventory" and Skins then
						local wepForSkin = currentWeapon
						if (wepForSkin == "CT Knife" or wepForSkin == "T Knife") and not Skins:FindFirstChild(wepForSkin) then
							wepForSkin = "M9 Bayonet"
						end
						local skinData = Skins:FindFirstChild(wepForSkin) and Skins[wepForSkin]:FindFirstChild(currentSkin)
						if skinData then
							for _, targetPart in clone:GetDescendants() do
								if targetPart:IsA("BasePart") or targetPart:IsA("MeshPart") then
									local tex = nil; local wm = skinData:FindFirstChild("WorldModel")
									for _, Data in skinData:GetDescendants() do
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
										for _, Data in skinData:GetDescendants() do
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
											for _, Data in wm:GetDescendants() do
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
											for _, Data in wm:GetDescendants() do
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
									local isAnimated = skinData:FindFirstChild("Animated", true)
									if (not tex or tex == "") and not isAnimated then
										for _, Data in wm and wm:GetDescendants() or skinData:GetDescendants() do
											local lowerName = Data.Name:lower()
											if not lowerName:match("normal") and not lowerName:match("pbr") and not lowerName:match("roughness") and not lowerName:match("specular") and not lowerName:match("metallic") then
											local isAssetId = Data:IsA("StringValue") and (Data.Value:match("rbxassetid://") or (tonumber(Data.Value) ~= nil and string.len(Data.Value) >= 5))
												if Data:IsA("StringValue") and isAssetId and Data.Value ~= "rbxassetid://0" then tex = Data.Value
												elseif Data:IsA("MeshPart") and Data.TextureID ~= "" and Data.TextureID ~= "rbxassetid://0" then tex = Data.TextureID
												elseif (Data:IsA("Decal") or Data:IsA("Texture")) and Data.Texture ~= "" and Data.Texture ~= "rbxassetid://0" then tex = Data.Texture
												elseif Data:IsA("SurfaceAppearance") then tex = Data end
												if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
											end
										end
									end
									if tex and targetPart.Transparency ~= 1 then
										if type(tex) == "string" and tonumber(tex) ~= nil and string.len(tex) >= 5 then tex = "rbxassetid://" .. tex end
										if typeof(tex) == "Instance" and tex:IsA("SurfaceAppearance") then
											if targetPart:FindFirstChildWhichIsA("SurfaceAppearance") then
												targetPart:FindFirstChildWhichIsA("SurfaceAppearance"):Destroy()
											end
											local saClone = tex:Clone(); saClone.Parent = targetPart
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
					local minV = Vector3.new(math.huge, math.huge, math.huge); local maxV = Vector3.new(-math.huge, -math.huge, -math.huge); local hasVisible = false
					for _, d in clone:GetDescendants() do
						if d:IsA("BasePart") and d.Transparency < 1 then
							hasVisible = true; local p = d.Position; local s = d.Size / 2; minV = Vector3.new(math.min(minV.X, p.X - s.X), math.min(minV.Y, p.Y - s.Y), math.min(minV.Z, p.Z - s.Z)); maxV = Vector3.new(math.max(maxV.X, p.X + s.X), math.max(maxV.Y, p.Y + s.Y), math.max(maxV.Z, p.Z + s.Z))
						end
					end
					if not hasVisible then minV = Vector3.new(); maxV = Vector3.new(1,1,1) end
					local center = (minV + maxV) / 2; local size = (maxV - minV).Magnitude; local preRot = CFrame.new(); local isKnife = false
					for _, k in AllKnives do
						if k == currentWeapon then isKnife = true break end
					end
					if isKnife or isExtModel then
						local corePart = nil
						for _, d in clone:GetDescendants() do
							if d:IsA("BasePart") and d.Transparency < 1 then
								if d.Name:lower() == "handle" or d.Name:lower() == "main" or d.Name:lower() == "blade" then
									corePart = d; break
								end
							end
						end
						if not corePart then
							for _, d in clone:GetDescendants() do
								if d:IsA("BasePart") and d.Transparency < 1 then
									corePart = d; break
								end
							end
						end
						if corePart then
							local coreRotInv = (corePart.CFrame - corePart.Position):Inverse(); local bMin = Vector3.new(math.huge, math.huge, math.huge); local bMax = Vector3.new(-math.huge, -math.huge, -math.huge)
							for _, d in clone:GetDescendants() do
								if d:IsA("BasePart") and d.Transparency < 1 then
									local relCFrame = coreRotInv * (d.CFrame - corePart.Position)
									for x = -1, 1, 2 do
										for y = -1, 1, 2 do
											for z = -1, 1, 2 do
												local corner = relCFrame * (d.Size * Vector3.new(x, y, z) / 2); bMin = Vector3.new(math.min(bMin.X, corner.X), math.min(bMin.Y, corner.Y), math.min(bMin.Z, corner.Z)); bMax = Vector3.new(math.max(bMax.X, corner.X), math.max(bMax.Y, corner.Y), math.max(bMax.Z, corner.Z))
											end
										end
									end
								end
							end
							local sz = bMax - bMin; local localCenter = (bMin + bMax) / 2; local addedRot = CFrame.new()
							if sz.Y > sz.X and sz.Y > sz.Z then
								addedRot = CFrame.Angles(0, 0, math.rad(90))
							elseif sz.Z > sz.X and sz.Z > sz.Y then
								addedRot = CFrame.Angles(0, math.rad(90), 0)
							end
							preRot = addedRot * coreRotInv; center = corePart.Position + (corePart.CFrame - corePart.Position) * localCenter; size = sz.Magnitude
						end
					end
					for _, d in clone:GetDescendants() do
						if d:IsA("BasePart") then
							local offset = d.Position - center; d.CFrame = CFrame.new(preRot * offset) * (preRot * (d.CFrame - d.CFrame.Position))
						end
					end
					skinDist = isKnife and math.clamp(size * 1.1, 1, 15) or math.clamp(size * 0.8, 1, 15); clone.Parent = skinModel; skinRotY = -90; skinRotX = 0; updateSkinCam()
				end)
			end
			loadKnifePreview = function()
				knifeModel:ClearAllChildren()
				if not Viewmodels then return end
				local vmName = "v_" .. currentKnife; local srcVM = Viewmodels and Viewmodels:FindFirstChild(vmName); local isExtModel = false
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
							if n == "left arm" or n == "right arm" or n == "rglove" or n == "lglove" or n == "glove" or n:find("sleeve") or n:find("fake") then
								d.Transparency = 1
							end
							d.Anchored = true; d.CanCollide = false
						end
					end
					if currentKnifeSkin ~= "Inventory" and Skins then
						local wepForSkin = currentKnife
						if (wepForSkin == "CT Knife" or wepForSkin == "T Knife") and not Skins:FindFirstChild(wepForSkin) then
							wepForSkin = "M9 Bayonet"
						end
						local skinData = Skins:FindFirstChild(wepForSkin) and Skins[wepForSkin]:FindFirstChild(currentKnifeSkin)
						if skinData then
							for _, targetPart in clone:GetDescendants() do
								if targetPart:IsA("BasePart") or targetPart:IsA("MeshPart") then
									local tex = nil; local wm = skinData:FindFirstChild("WorldModel")
									for _, Data in skinData:GetDescendants() do
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
										for _, Data in skinData:GetDescendants() do
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
											for _, Data in wm:GetDescendants() do
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
											for _, Data in wm:GetDescendants() do
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
									local isAnimated = skinData:FindFirstChild("Animated", true)
									if (not tex or tex == "") and not isAnimated then
										for _, Data in wm and wm:GetDescendants() or skinData:GetDescendants() do
											local lowerName = Data.Name:lower()
											if not lowerName:match("normal") and not lowerName:match("pbr") and not lowerName:match("roughness") and not lowerName:match("specular") and not lowerName:match("metallic") then
											local isAssetId = Data:IsA("StringValue") and (Data.Value:match("rbxassetid://") or (tonumber(Data.Value) ~= nil and string.len(Data.Value) >= 5))
												if Data:IsA("StringValue") and isAssetId and Data.Value ~= "rbxassetid://0" then tex = Data.Value
												elseif Data:IsA("MeshPart") and Data.TextureID ~= "" and Data.TextureID ~= "rbxassetid://0" then tex = Data.TextureID
												elseif (Data:IsA("Decal") or Data:IsA("Texture")) and Data.Texture ~= "" and Data.Texture ~= "rbxassetid://0" then tex = Data.Texture
												elseif Data:IsA("SurfaceAppearance") then tex = Data end
												if tex and tex ~= "" and tex ~= "rbxassetid://0" then break end
											end
										end
									end
									if tex and targetPart.Transparency ~= 1 then
										if type(tex) == "string" and tonumber(tex) ~= nil and string.len(tex) >= 5 then tex = "rbxassetid://" .. tex end
										if typeof(tex) == "Instance" and tex:IsA("SurfaceAppearance") then
											if targetPart:FindFirstChildWhichIsA("SurfaceAppearance") then
												targetPart:FindFirstChildWhichIsA("SurfaceAppearance"):Destroy()
											end
											local saClone = tex:Clone(); saClone.Parent = targetPart
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
					local minV = Vector3.new(math.huge, math.huge, math.huge); local maxV = Vector3.new(-math.huge, -math.huge, -math.huge); local hasVisible = false
					for _, d in clone:GetDescendants() do
						if d:IsA("BasePart") and d.Transparency < 1 then
							hasVisible = true; local p = d.Position; local s = d.Size / 2; minV = Vector3.new(math.min(minV.X, p.X - s.X), math.min(minV.Y, p.Y - s.Y), math.min(minV.Z, p.Z - s.Z)); maxV = Vector3.new(math.max(maxV.X, p.X + s.X), math.max(maxV.Y, p.Y + s.Y), math.max(maxV.Z, p.Z + s.Z))
						end
					end
					if not hasVisible then minV = Vector3.new(); maxV = Vector3.new(1,1,1) end
					local center = (minV + maxV) / 2; local size = (maxV - minV).Magnitude; local preRot = CFrame.new(); local corePart = nil
					for _, d in clone:GetDescendants() do
						if d:IsA("BasePart") and d.Transparency < 1 then
							if d.Name:lower() == "handle" or d.Name:lower() == "main" or d.Name:lower() == "blade" then
								corePart = d; break
							end
						end
					end
					if not corePart then
						for _, d in clone:GetDescendants() do
							if d:IsA("BasePart") and d.Transparency < 1 then
								corePart = d; break
							end
						end
					end
					if corePart then
						local coreRotInv = (corePart.CFrame - corePart.Position):Inverse(); local bMin = Vector3.new(math.huge, math.huge, math.huge); local bMax = Vector3.new(-math.huge, -math.huge, -math.huge)
						for _, d in clone:GetDescendants() do
							if d:IsA("BasePart") and d.Transparency < 1 then
								local relCFrame = coreRotInv * (d.CFrame - corePart.Position)
								for x = -1, 1, 2 do
									for y = -1, 1, 2 do
										for z = -1, 1, 2 do
											local corner = relCFrame * (d.Size * Vector3.new(x, y, z) / 2); bMin = Vector3.new(math.min(bMin.X, corner.X), math.min(bMin.Y, corner.Y), math.min(bMin.Z, corner.Z)); bMax = Vector3.new(math.max(bMax.X, corner.X), math.max(bMax.Y, corner.Y), math.max(bMax.Z, corner.Z))
										end
									end
								end
							end
						end
						local sz = bMax - bMin; local localCenter = (bMin + bMax) / 2; local addedRot = CFrame.new()
						if sz.Y > sz.X and sz.Y > sz.Z then
							addedRot = CFrame.Angles(0, 0, math.rad(90))
						elseif sz.Z > sz.X and sz.Z > sz.Y then
							addedRot = CFrame.Angles(0, math.rad(90), 0)
						end
						preRot = addedRot * coreRotInv; center = corePart.Position + (corePart.CFrame - corePart.Position) * localCenter; size = sz.Magnitude
					end
					for _, d in clone:GetDescendants() do
						if d:IsA("BasePart") then
							local offset = d.Position - center; d.CFrame = CFrame.new(preRot * offset) * (preRot * (d.CFrame - d.CFrame.Position))
						end
					end
					knifeDist = math.clamp(size * 1.1, 1, 15); clone.Parent = knifeModel; knifeRotY = -90; knifeRotX = 0; updateKnifeCam()
				end)
			end
			loadGlovePreview = function()
				gloveModel:ClearAllChildren(); local gloveType = library_flags["skinGloveModel"] or "None"; local gloveSkin = library_flags["skinGloveSkin"] or "Default"; local Gloves = game:GetService("ReplicatedStorage"):FindFirstChild("Gloves"); local GloveModels = Gloves and Gloves:FindFirstChild("Models")
				if gloveType == "None" or not GloveModels or not GloveModels:FindFirstChild(gloveType) then
					gloveDist = 5; updateGloveCam(); return
				end
				local gloveTexData = nil; local _gloveTex = ""
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
					newLG.CFrame = CFrame.new(-0.8, 0, 0); newLG.Anchored = true; newLG.CanCollide = false; newLG.Transparency = 0; newLG.Parent = gloveModel
				end
				local newRG = GloveModels[gloveType]:FindFirstChild("RGlove")
				if newRG then
					newRG = newRG:Clone()
					if newRG:FindFirstChild("Mesh") then
						newRG.Mesh.TextureId = _gloveTex
					else
						pcall(function() newRG.TextureID = _gloveTex end)
					end
					newRG.CFrame = CFrame.new(0.8, 0, 0); newRG.Anchored = true; newRG.CanCollide = false; newRG.Transparency = 0; newRG.Parent = gloveModel
				end
				gloveDist = 4.5; updateGloveCam()
			end
			local applyFrame = Instance.new("Frame", pageFrame); applyFrame.Size = UDim2.new(0.95, 0, 0, 26); applyFrame.BackgroundTransparency = 1; applyFrame.LayoutOrder = 5; local applyWepBtn = Instance.new("TextButton", applyFrame); applyWepBtn.Size = UDim2.new(0.31, 0, 1, 0); applyWepBtn.Position = UDim2.new(0, 0, 0, 0); applyWepBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); applyWepBtn.Text = "apply weapon"; applyWepBtn.TextColor3 = Color3.fromRGB(180, 180, 180); applyWepBtn.Font = Enum.Font.Code; applyWepBtn.TextSize = 11; Instance.new("UICorner", applyWepBtn).CornerRadius = UDim.new(0, 4); Instance.new("UIStroke", applyWepBtn).Color = Color3.fromRGB(35, 35, 35); local applyKnifeBtn = Instance.new("TextButton", applyFrame); applyKnifeBtn.Size = UDim2.new(0.31, 0, 1, 0); applyKnifeBtn.Position = UDim2.new(0.345, 0, 0, 0); applyKnifeBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); applyKnifeBtn.Text = "apply knife"; applyKnifeBtn.TextColor3 = Color3.fromRGB(180, 180, 180); applyKnifeBtn.Font = Enum.Font.Code; applyKnifeBtn.TextSize = 11; Instance.new("UICorner", applyKnifeBtn).CornerRadius = UDim.new(0, 4); Instance.new("UIStroke", applyKnifeBtn).Color = Color3.fromRGB(35, 35, 35); local applyGlvBtn = Instance.new("TextButton", applyFrame); applyGlvBtn.Size = UDim2.new(0.31, 0, 1, 0); applyGlvBtn.Position = UDim2.new(0.69, 0, 0, 0); applyGlvBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); applyGlvBtn.Text = "apply gloves"; applyGlvBtn.TextColor3 = Color3.fromRGB(180, 180, 180); applyGlvBtn.Font = Enum.Font.Code; applyGlvBtn.TextSize = 11; Instance.new("UICorner", applyGlvBtn).CornerRadius = UDim.new(0, 4); Instance.new("UIStroke", applyGlvBtn).Color = Color3.fromRGB(35, 35, 35)
			applyWepBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do dl.Visible = false end
				local flagName = getFlagName(currentWeapon); library_flags[flagName] = currentSkin
				if UI_Library and UI_Library.options and UI_Library.options[flagName] then
					pcall(function() UI_Library.options[flagName]:SetValue(currentSkin) end)
				end
				library_flags["skinSkinChanger"] = true
				if UI_Library and UI_Library.options then
					pcall(function() UI_Library.options["skinSkinChanger"]:SetValue(true) end)
				end
				pcall(function()
					local arms = workspace.CurrentCamera:FindFirstChild("Arms")
					if arms then arms:Destroy() end
				end)
				applyWepBtn.Text = "applied!"
				task.delay(1, function() applyWepBtn.Text = "apply weapon" end)
			end)
			applyKnifeBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do dl.Visible = false end
				local flagName = getFlagName(currentKnife); library_flags[flagName] = currentKnifeSkin
				if UI_Library and UI_Library.options and UI_Library.options[flagName] then
					pcall(function() UI_Library.options[flagName]:SetValue(currentKnifeSkin) end)
				end
				library_flags["skinKnifeChanger"] = true
				if UI_Library and UI_Library.options then
					pcall(function() UI_Library.options["skinKnifeChanger"]:SetValue(true) end)
				end
				library_flags["skinKnifeModel"] = currentKnife
				if UI_Library and UI_Library.options and UI_Library.options["skinKnifeModel"] then
					pcall(function() UI_Library.options["skinKnifeModel"]:SetValue(currentKnife) end)
				end
				pcall(function()
					local arms = workspace.CurrentCamera:FindFirstChild("Arms")
					if arms then arms:Destroy() end
				end)
				applyKnifeBtn.Text = "applied!"
				task.delay(1, function() applyKnifeBtn.Text = "apply knife" end)
			end)
			applyGlvBtn.MouseButton1Click:Connect(function()
				for _, dl in floatingDropdowns do dl.Visible = false end
				local gType = library_flags["skinGloveModel"] or "None"; local gSkin = library_flags["skinGloveSkin"] or "Default"; library_flags["skinGloveChanger"] = true
				if UI_Library and UI_Library.options then
					pcall(function() UI_Library.options["skinGloveChanger"]:SetValue(true) end)
				end
				getgenv().lastGlove = gType; getgenv().lastGloveSkin = gSkin; applyGlvBtn.Text = "applied!"
				task.delay(1, function() applyGlvBtn.Text = "apply gloves" end)
			end)
			local padder = Instance.new("Frame", pageFrame); padder.Size = UDim2.new(0.95, 0, 0, 15); padder.BackgroundTransparency = 1; padder.LayoutOrder = 99; library_flags["skinWeapon"] = currentWeapon; library_flags["skinSkin"] = currentSkin
			pcall(function()
				if UI_Library and UI_Library.options then
					UI_Library.options["skinWeapon"] = {
						hasInit = true, type = "string", flag = "skinWeapon", value = library_flags["skinWeapon"],
						SetValue = function(self, val)
							if not val or val == "" or val == "nil" then return end
							self.value = val; library_flags["skinWeapon"] = val; currentWeapon = val; wepBtn.Text = val
							if not loadingCFG then task.defer(loadWeaponPreview) end
						end
					}
					UI_Library.options["skinSkin"] = {
						hasInit = true, type = "string", flag = "skinSkin", value = library_flags["skinSkin"],
						SetValue = function(self, val)
							if not val or val == "" or val == "nil" then return end
							self.value = val; library_flags["skinSkin"] = val; currentSkin = val; skinBtn.Text = val; rebuildSkinDrop()
							if not loadingCFG then task.defer(loadWeaponPreview) end
						end
					}
					UI_Library.options["skinGloveModel"] = {
						hasInit = true, type = "string", flag = "skinGloveModel", value = library_flags["skinGloveModel"],
						SetValue = function(self, val)
							if not val or val == "" or val == "nil" then return end
							self.value = val; library_flags["skinGloveModel"] = val 
							if gloveTypeBtn then gloveTypeBtn.Text = val end
							if not loadingCFG then task.defer(loadGlovePreview) end
						end
					}
					UI_Library.options["skinGloveSkin"] = {
						hasInit = true, type = "string", flag = "skinGloveSkin", value = library_flags["skinGloveSkin"],
						SetValue = function(self, val)
							if not val or val == "" or val == "nil" then return end
							self.value = val; library_flags["skinGloveSkin"] = val 
							if gloveBtn then gloveBtn.Text = val end
							if not loadingCFG then task.defer(loadGlovePreview) end
						end
					}
					UI_Library.options["skinKnife"] = {
						hasInit = true, type = "string", flag = "skinKnife", value = library_flags["skinKnife"],
						SetValue = function(self, val)
							if not val or val == "" or val == "nil" then return end
							self.value = val; library_flags["skinKnife"] = val; currentKnife = val; knifeBtn.Text = val
							if not loadingCFG then task.defer(loadKnifePreview) end
						end
					}
					UI_Library.options["skinKnifeSkin"] = {
						hasInit = true, type = "string", flag = "skinKnifeSkin", value = library_flags["skinKnifeSkin"],
						SetValue = function(self, val)
							if not val or val == "" or val == "nil" then return end
							self.value = val; library_flags["skinKnifeSkin"] = val; currentKnifeSkin = val; knifeSkinBtn.Text = val; rebuildKnifeSkinDrop()
							if not loadingCFG then task.defer(loadKnifePreview) end
						end
					}
				end
			end)
			rebuildSkinDrop(); rebuildKnifeSkinDrop()
			task.defer(function()
				loadWeaponPreview(); loadKnifePreview(); loadGlovePreview()
			end)
			getgenv().UpdateSkinUI = function()
				loadWeaponPreview(); loadKnifePreview(); loadGlovePreview()
			end
			getgenv().CW_SkinsPageFrame = pageFrame
			env.UpdateSkinUI = function()
				loadWeaponPreview(); loadKnifePreview(); loadGlovePreview()
			end
			env.SkinsPageFrame = pageFrame
		else
		local isWide = (tostring(tab.title):lower() == "players" or tostring(tab.title):lower() == "lua"); local leftCol = Instance.new("Frame", pageFrame); leftCol.Size = isWide and UDim2.new(0.98, 0, 0, 0) or UDim2.new(0.49, 0, 0, 0); leftCol.AutomaticSize = Enum.AutomaticSize.Y; leftCol.BackgroundTransparency = 1; local leftList = Instance.new("UIListLayout", leftCol); leftList.Padding = UDim.new(0, 10); local rightCol = Instance.new("Frame", pageFrame); rightCol.Size = UDim2.new(0.49, 0, 0, 0); rightCol.Position = UDim2.new(0.51, 0, 0, 0); rightCol.AutomaticSize = Enum.AutomaticSize.Y; rightCol.BackgroundTransparency = 1; rightCol.Visible = not isWide; local rightList = Instance.new("UIListLayout", rightCol); rightList.Padding = UDim.new(0, 10)
		local function updateCanvas()
			local leftH = leftList.AbsoluteContentSize.Y; local rightH = rightList.AbsoluteContentSize.Y; pageFrame.CanvasSize = UDim2.new(0, 0, 0, math.max(leftH, rightH) + 30)
		end
		leftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas); rightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas); local allColumns = {}
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
			local col = data.col; local sub = data.sub; local targetCol = (col.position == 1 or col.position == "1") and rightCol or leftCol
			for _, sec in col.sections or {} do
				local secFrame = Instance.new("Frame", targetCol); secFrame.Size = UDim2.new(1, 0, 0, 0); secFrame.AutomaticSize = Enum.AutomaticSize.Y; secFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18); secFrame.BorderSizePixel = 0; Instance.new("UICorner", secFrame).CornerRadius = UDim.new(0, 3); sec.main = secFrame
				if #tab.subtabs > 0 then
					table.insert(secFramesToToggle, {frame = secFrame, sub = sub}); secFrame.Visible = (sub == tab.subtabs[1])
				end
				if tab.title == "Legit" and (sec.title == "Rifles" or sec.title == "Scout" or sec.title == "AWP" or sec.title == "Heavy Pistols" or sec.title == "Pistols" or sec.title == "SMG" or sec.title == "Other") then
					secFrame.Visible = false
				end
				local stroke = Instance.new("UIStroke", secFrame); stroke.Color = Color3.fromRGB(38, 38, 38); stroke.Thickness = 1; stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; local secList = Instance.new("UIListLayout", secFrame); secList.Padding = UDim.new(0, 4); secList.HorizontalAlignment = Enum.HorizontalAlignment.Center; secList.SortOrder = Enum.SortOrder.LayoutOrder; local secPad = Instance.new("UIPadding", secFrame); secPad.PaddingTop = UDim.new(0, 0); secPad.PaddingBottom = UDim.new(0, 8); local secHeaderBar = Instance.new("Frame", secFrame); secHeaderBar.Size = UDim2.new(1, 0, 0, 26); secHeaderBar.BackgroundColor3 = Color3.fromRGB(26, 26, 26); secHeaderBar.BorderSizePixel = 0; secHeaderBar.LayoutOrder = 0; Instance.new("UICorner", secHeaderBar).CornerRadius = UDim.new(0, 3); local headerMask = Instance.new("Frame", secHeaderBar); headerMask.Size = UDim2.new(1, 0, 0.5, 0); headerMask.Position = UDim2.new(0, 0, 0.5, 0); headerMask.BackgroundColor3 = Color3.fromRGB(26, 26, 26); headerMask.BorderSizePixel = 0; headerMask.ZIndex = secHeaderBar.ZIndex; local secHeader = Instance.new("TextLabel", secHeaderBar); secHeader.Size = UDim2.new(1, -20, 1, 0); secHeader.Position = UDim2.new(0, 12, 0, 0); secHeader.BackgroundTransparency = 1; secHeader.Text = tostring(sec.title or "unnamed"):lower(); secHeader.TextColor3 = Color3.fromRGB(235, 235, 235); secHeader.Font = Enum.Font.Code; secHeader.TextSize = 13; secHeader.TextXAlignment = Enum.TextXAlignment.Left; secHeader.ZIndex = secHeaderBar.ZIndex + 1; local headerLine = Instance.new("Frame", secFrame); headerLine.Size = UDim2.new(1, 0, 0, 1); headerLine.BackgroundColor3 = Color3.fromRGB(38, 38, 38); headerLine.BorderSizePixel = 0; headerLine.LayoutOrder = 0; local totalHeight = 27; local boundBinds = {}
				for _, opt in sec.options or {} do
					local optFrame = Instance.new("Frame", secFrame); optFrame.Size = UDim2.new(0.9, 0, 0, 22); optFrame.BackgroundTransparency = 1; optFrame.LayoutOrder = _ + 1; local rawText = opt.text or opt.flag or "unnamed"
					if rawText == "nil" and opt.flag then rawText = opt.flag end
					local optText = tostring(rawText):lower()
					if optText:find("material") then optText = "material" end
					local associatedBind = nil; local associatedColor = nil; local associatedColor2 = nil
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
						local accent = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 200, 50); local check = Instance.new("TextButton", optFrame); check.Size = UDim2.new(0, 16, 0, 16); check.Position = UDim2.new(0, 0, 0.5, -8); check.BackgroundColor3 = opt.state and accent or Color3.fromRGB(20, 20, 20); check.Text = opt.state and "✓" or ""; check.TextColor3 = Color3.fromRGB(255, 255, 255); check.TextSize = 13; check.Font = Enum.Font.Code; check.AutoButtonColor = false; Instance.new("UICorner", check).CornerRadius = UDim.new(0, 3); local checkStroke = Instance.new("UIStroke", check); checkStroke.Color = opt.state and accent or Color3.fromRGB(55, 55, 55); checkStroke.Thickness = 1; checkStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; local label = Instance.new("TextLabel", optFrame); label.Position = UDim2.new(0, 24, 0, 0); label.Size = UDim2.new(1, -24, 1, 0); label.BackgroundTransparency = 1; label.Text = optText; label.TextColor3 = opt.state and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(160, 160, 160); label.Font = Enum.Font.Code; label.TextSize = 13; label.TextXAlignment = Enum.TextXAlignment.Left
						check.MouseButton1Click:Connect(function()
							opt.state = not opt.state; check.BackgroundColor3 = opt.state and accent or Color3.fromRGB(20, 20, 20); check.Text = opt.state and "✓" or ""; checkStroke.Color = opt.state and accent or Color3.fromRGB(55, 55, 55); label.TextColor3 = opt.state and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(160, 160, 160); library_flags[opt.flag] = opt.state; pcall(opt.callback, opt.state)
						end)
						function opt:SetState(val)
							opt.state = val; library_flags[opt.flag] = val
							if check then
								check.BackgroundColor3 = val and accent or Color3.fromRGB(20, 20, 20); check.Text = val and "✓" or ""; checkStroke.Color = val and accent or Color3.fromRGB(55, 55, 55); label.TextColor3 = val and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(160, 160, 160)
							end
							pcall(opt.callback, val)
						end
						opt.hasInit = true
						if associatedBind then
							local bindBtn = Instance.new("TextButton", optFrame); bindBtn.Size = UDim2.new(0, 45, 0, 16); bindBtn.Position = UDim2.new(1, -50, 0.5, -8); bindBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 24); bindBtn.Text = shortenBindName(associatedBind.key or "none"); bindBtn.TextColor3 = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 255, 0); table.insert(UI_Library.theme, bindBtn); bindBtn.Font = Enum.Font.Code; bindBtn.TextSize = 11; Instance.new("UICorner", bindBtn).CornerRadius = UDim.new(0, 3); local listening = false
							bindBtn.MouseButton1Click:Connect(function()
								listening = not listening; env.bindListening = listening; bindBtn.Text = listening and "..." or shortenBindName(associatedBind.key or "none")
							end)
							function associatedBind:SetKey(val)
								associatedBind.key = shortenBindName(val or associatedBind.key or "none"); library_flags[associatedBind.flag] = associatedBind.key
								if bindBtn then bindBtn.Text = shortenBindName(associatedBind.key) end
							end
							game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
								if listening and not processed then
									local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
									if kName then
										associatedBind.key = kName; bindBtn.Text = kName; listening = false; env.bindListening = false
									end
								end
							end)
							local runConnection = nil
							game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
								if processed or associatedBind.key == "none" or env.bindListening or env.inputService:GetFocusedTextBox() then return end
								local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
								if kName == associatedBind.key then
									if associatedBind.mode == "toggle" then
										library_flags[associatedBind.flag] = not library_flags[associatedBind.flag]; pcall(associatedBind.callback, library_flags[associatedBind.flag], 0)
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
							local offset1 = associatedBind and -72 or -18; local colorBtn1 = Instance.new("TextButton", optFrame); colorBtn1.Size = UDim2.new(0, 14, 0, 14); colorBtn1.Position = UDim2.new(1, offset1, 0.5, -7); colorBtn1.BackgroundColor3 = associatedColor.color or Color3.fromRGB(255, 255, 255); colorBtn1.Text = ""; Instance.new("UICorner", colorBtn1).CornerRadius = UDim.new(0, 3)
							colorBtn1.MouseButton1Click:Connect(function()
								if openColorPicker then
									openColorPicker(associatedColor, colorBtn1)
								end
							end)
							function associatedColor:SetColor(clr)
								if typeof(clr) == "table" and clr[1] then
									clr = Color3.new(clr[1], clr[2], clr[3])
								end
								associatedColor.color = clr; colorBtn1.BackgroundColor3 = clr; library_flags[associatedColor.flag] = clr; pcall(associatedColor.callback, clr)
							end
						end
						if associatedColor2 then
							local offset2 = associatedBind and -90 or -36; local colorBtn2 = Instance.new("TextButton", optFrame); colorBtn2.Size = UDim2.new(0, 14, 0, 14); colorBtn2.Position = UDim2.new(1, offset2, 0.5, -7); colorBtn2.BackgroundColor3 = associatedColor2.color or Color3.fromRGB(255, 255, 255); colorBtn2.Text = ""; Instance.new("UICorner", colorBtn2).CornerRadius = UDim.new(0, 3)
							colorBtn2.MouseButton1Click:Connect(function()
								if openColorPicker then
									openColorPicker(associatedColor2, colorBtn2)
								end
							end)
							function associatedColor2:SetColor(clr)
								if typeof(clr) == "table" and clr[1] then
									clr = Color3.new(clr[1], clr[2], clr[3])
								end
								associatedColor2.color = clr; colorBtn2.BackgroundColor3 = clr; library_flags[associatedColor2.flag] = clr; pcall(associatedColor2.callback, clr)
							end
						end
					elseif opt.type == "slider" then
						local accent = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 200, 50); local label = Instance.new("TextLabel", optFrame); label.Size = UDim2.new(0.55, 0, 1, 0); label.BackgroundTransparency = 1; label.Text = optText; label.TextColor3 = Color3.fromRGB(170, 170, 170); label.Font = Enum.Font.Code; label.TextSize = 12; label.TextXAlignment = Enum.TextXAlignment.Left; local valLabel = Instance.new("TextLabel", optFrame); valLabel.Size = UDim2.new(0, 26, 1, 0); valLabel.Position = UDim2.new(0.55, 0, 0, 0); valLabel.BackgroundTransparency = 1; valLabel.Text = tostring(opt.value or opt.state or 0); valLabel.TextColor3 = accent; valLabel.Font = Enum.Font.Code; valLabel.TextSize = 12; valLabel.TextXAlignment = Enum.TextXAlignment.Left; local bar = Instance.new("TextButton", optFrame); bar.Size = UDim2.new(0.35, 0, 0, 4); bar.Position = UDim2.new(0.65, 0, 0.5, -2); bar.BackgroundColor3 = Color3.fromRGB(28, 28, 28); bar.BorderSizePixel = 0; bar.Text = ""; bar.Active = true; bar.AutoButtonColor = false; Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0); local fill = Instance.new("Frame", bar); local fillPercent = math.clamp((tonumber(opt.value or opt.state or 0) - (opt.min or 0)) / ((opt.max or 100) - (opt.min or 0)), 0, 1); fill.Size = UDim2.new(fillPercent, 0, 1, 0); fill.BackgroundColor3 = accent; fill.BorderSizePixel = 0; Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0); local dragging = false
						local function updateSlider(input)
							local percent = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1); local min = opt.min or 0; local max = opt.max or 100; local val = math.floor(min + (max - min) * percent); opt.value = val; valLabel.Text = tostring(val); fill.Size = UDim2.new(percent, 0, 1, 0); library_flags[opt.flag] = val; pcall(opt.callback, val)
						end
						function opt:SetValue(val)
							if val == nil then return end
							opt.value = val; library_flags[opt.flag] = val
							if valLabel then valLabel.Text = tostring(val) end
							local percent = math.clamp((val - (opt.min or 0)) / ((opt.max or 100) - (opt.min or 0)), 0, 1)
							if fill then fill.Size = UDim2.new(percent, 0, 1, 0) end
							pcall(opt.callback, val)
						end
						opt.SetState = opt.SetValue; opt.hasInit = true
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
						optFrame.Size = UDim2.new(0.9, 0, 0, 42); local label = Instance.new("TextLabel", optFrame); label.Size = UDim2.new(1, 0, 0, 16); label.Position = UDim2.new(0, 0, 0, 0); label.BackgroundTransparency = 1; label.Text = optText; label.TextColor3 = Color3.fromRGB(170, 170, 170); label.Font = Enum.Font.Code; label.TextSize = 12; label.TextXAlignment = Enum.TextXAlignment.Left; local dropBtn = Instance.new("TextButton", optFrame); dropBtn.Size = UDim2.new(1, 0, 0, 22); dropBtn.Position = UDim2.new(0, 0, 0, 18); dropBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20); local _initText
						if opt.multiselect or type(opt.value) == "table" then
							local _names = {}
							if type(opt.value) == "table" then
								for k, v in opt.value do if v then _names[#_names+1] = k end end
							end
							_initText = #_names > 0 and table.concat(_names, ", ") or "none"
						else
							_initText = tostring(opt.value or opt.state or "none")
						end
						dropBtn.Text = "  " .. _initText; dropBtn.TextColor3 = Color3.fromRGB(220, 220, 220); dropBtn.Font = Enum.Font.Code; dropBtn.TextSize = 12; dropBtn.TextXAlignment = Enum.TextXAlignment.Left; dropBtn.AutoButtonColor = false; Instance.new("UICorner", dropBtn).CornerRadius = UDim.new(0, 3); local stroke = Instance.new("UIStroke", dropBtn); stroke.Color = Color3.fromRGB(45, 45, 45); stroke.Thickness = 1; local dropArrow = Instance.new("TextLabel", dropBtn); dropArrow.Size = UDim2.new(0, 16, 1, 0); dropArrow.Position = UDim2.new(1, -18, 0, 0); dropArrow.BackgroundTransparency = 1; dropArrow.Text = "▾"; dropArrow.TextColor3 = Color3.fromRGB(160, 160, 160); dropArrow.Font = Enum.Font.Code; dropArrow.TextSize = 12; local dropList = Instance.new("ScrollingFrame"); dropList.Size = UDim2.new(0, 120, 0, 0); dropList.BackgroundColor3 = Color3.fromRGB(16, 16, 16); dropList.BorderSizePixel = 0; dropList.ZIndex = 100; dropList.Visible = false; dropList.ScrollBarThickness = 1; Instance.new("UICorner", dropList).CornerRadius = UDim.new(0, 4); local listLayout = Instance.new("UIListLayout", dropList); listLayout.SortOrder = Enum.SortOrder.LayoutOrder; local dropItemOrder = 0; dropList.Parent = self.base
						table.insert(floatingDropdowns, dropList)
						opt.labels = opt.labels or {}; opt.open = false; opt.dropList = dropList; opt.dropBtn = dropBtn; opt.listLayout = listLayout
						function opt:SetValue(val)
							if val == nil then return end
							if opt.multiselect then
								if type(val) == "table" then
									opt.value = val
								else
									if type(opt.value) ~= "table" then opt.value = {} end
									opt.value[val] = not opt.value[val]
								end
								library_flags[opt.flag] = opt.value; local names = {}
								for k, v in opt.value do if v then names[#names+1] = k end end
								if dropBtn then dropBtn.Text = "  " .. (#names > 0 and table.concat(names, ", ") or "none") end
								for lv, litem in opt.labels do
									litem.TextColor3 = (opt.value[lv]) and Color3.fromRGB(255,255,255) or Color3.fromRGB(190,190,190)
								end
								pcall(opt.callback, opt.value); return
							end
							opt.value = val; library_flags[opt.flag] = val
							if dropBtn then dropBtn.Text = "  " .. tostring(val) end
							pcall(opt.callback, val)
						end
						opt.SetState = opt.SetValue; opt.hasInit = true
						local function createDropItem(val)
							local item = Instance.new("TextButton", dropList); item.Size = UDim2.new(1, 0, 0, 18); item.BackgroundTransparency = 1; item.Text = "  " .. tostring(val); item.TextColor3 = Color3.fromRGB(190, 190, 190); item.Font = Enum.Font.Code; item.TextSize = 12; item.TextXAlignment = Enum.TextXAlignment.Left; item.ZIndex = 101; item.Name = "item_" .. tostring(val); dropItemOrder = dropItemOrder + 1; item.LayoutOrder = dropItemOrder; opt.labels[val] = item
							if opt.multiselect and type(opt.value) == "table" and opt.value[val] then
								item.TextColor3 = Color3.fromRGB(255,255,255)
							end
							item.MouseButton1Click:Connect(function()
								if opt.multiselect then
									opt:SetValue(val); return
								end
								opt.value = val; dropBtn.Text = "  " .. tostring(val); library_flags[opt.flag] = val; pcall(opt.callback, val); dropList.Visible = false; opt.open = false
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
								opt.labels[val]:Destroy(); opt.labels[val] = nil
							end
							local idx = table.find(opt.values, val)
							if idx then table.remove(opt.values, idx) end
							if opt.value == val then
								opt:SetValue(opt.values[1] or "")
							end
						end
						function opt:Close()
							dropList.Visible = false; opt.open = false
						end
						for _, val in opt.values or {} do
							createDropItem(val)
						end
						local dropPosTrack = nil
						local function updateDropSize()
							local count = #(opt.values or {}); dropList.Size = UDim2.new(0, dropBtn.AbsoluteSize.X, 0, math.min(count * 18, 250)); dropList.CanvasSize = UDim2.new(0, 0, 0, count * 18)
						end
						dropBtn.MouseButton1Click:Connect(function()
							if not dropList.Visible then
								for _, dl in floatingDropdowns do dl.Visible = false end
							end
							dropList.Visible = not dropList.Visible; opt.open = dropList.Visible
							if dropList.Visible then
								dropList.Position = UDim2.new(0, dropBtn.AbsolutePosition.X, 0, dropBtn.AbsolutePosition.Y + 20); updateDropSize()
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
						local label = Instance.new("TextLabel", optFrame); label.Size = UDim2.new(0.4, 0, 1, 0); label.BackgroundTransparency = 1; label.Text = optText; label.TextColor3 = Color3.fromRGB(180,180,180); label.Font = Enum.Font.Code; label.TextSize = 13; label.TextXAlignment = Enum.TextXAlignment.Left; local box = Instance.new("TextBox", optFrame); box.Size = UDim2.new(0.5, 0, 0, 18); box.Position = UDim2.new(0.5, 0, 0.5, -9); box.BackgroundColor3 = Color3.fromRGB(18, 18, 18); box.Text = tostring(opt.value or ""); box.TextColor3 = Color3.fromRGB(200, 200, 200); box.PlaceholderText = "..."; box.Font = Enum.Font.Code; box.TextSize = 12; box.ClearTextOnFocus = false; Instance.new("UICorner", box).CornerRadius = UDim.new(0, 3); local stroke = Instance.new("UIStroke", box); stroke.Color = Color3.fromRGB(35,35,35)
						box.FocusLost:Connect(function(enterPressed)
							opt.value = box.Text; library_flags[opt.flag] = box.Text; pcall(opt.callback, box.Text)
						end)
						function opt:SetValue(val)
							opt.value = val; library_flags[opt.flag] = val
							if box then box.Text = tostring(val or "") end
						end
						if opt.flag and library_flags[opt.flag] and library_flags[opt.flag] ~= "" then
							box.Text = tostring(library_flags[opt.flag]); opt.value = library_flags[opt.flag]
						end
					elseif opt.type == "button" then
						local btn = Instance.new("TextButton", optFrame); btn.Size = UDim2.new(0.9, 0, 0, 20); btn.Position = UDim2.new(0.05, 0, 0.5, -10); btn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); btn.Text = optText; btn.TextColor3 = Color3.fromRGB(220, 220, 220); btn.Font = Enum.Font.Code; btn.TextSize = 12; Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4); local stroke = Instance.new("UIStroke", btn); stroke.Color = Color3.fromRGB(35,35,35)
						btn.MouseButton1Click:Connect(function()
							pcall(opt.callback)
						end)
					elseif opt.type == "label" then
						local label = Instance.new("TextLabel", optFrame); label.Size = UDim2.new(1, 0, 1, 0); label.BackgroundTransparency = 1; label.Text = opt.text or ""; label.TextColor3 = Color3.fromRGB(170, 170, 170); label.Font = Enum.Font.Code; label.TextSize = 13; label.TextXAlignment = Enum.TextXAlignment.Left; label.TextTruncate = Enum.TextTruncate.AtEnd; opt.main = label
					elseif opt.type == "keybind" or opt.type == "bind" then
						local isChained = false
						if _ > 1 and sec.options[_ - 1] and sec.options[_ - 1].type == "toggle" then
							isChained = true
						end
						if isChained then
							optFrame.Size = UDim2.new(0, 0, 0, 0); optFrame.Visible = false; totalHeight = totalHeight - 26
						else
							local label = Instance.new("TextLabel", optFrame); label.Size = UDim2.new(0.6, 0, 1, 0); label.BackgroundTransparency = 1; label.Text = optText; label.TextColor3 = Color3.fromRGB(180,180,180); label.Font = Enum.Font.Code; label.TextSize = 13; label.TextXAlignment = Enum.TextXAlignment.Left; local bindBtn = Instance.new("TextButton", optFrame); bindBtn.Size = UDim2.new(0, 55, 0, 18); bindBtn.Position = UDim2.new(1, -60, 0.5, -9); bindBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 22); bindBtn.Text = shortenBindName(opt.key or opt.state or "none"); bindBtn.TextColor3 = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 255, 0); table.insert(UI_Library.theme, bindBtn); bindBtn.Font = Enum.Font.Code; bindBtn.TextSize = 12; Instance.new("UICorner", bindBtn).CornerRadius = UDim.new(0, 3); local bSt = Instance.new("UIStroke", bindBtn) bSt.Color = Color3.fromRGB(35,35,35); local listening = false
							bindBtn.MouseButton1Click:Connect(function()
								listening = not listening; env.bindListening = listening; bindBtn.Text = listening and "..." or shortenBindName(opt.key or opt.state or "none")
							end)
							game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
								if listening and not processed then
									local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
									if kName then
										opt.key = kName; opt.state = kName; bindBtn.Text = kName; listening = false; env.bindListening = false; library_flags[opt.flag] = kName
									end
								end
							end)
							local runConnection = nil
							game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
								if processed or opt.key == "none" or env.bindListening or env.inputService:GetFocusedTextBox() then return end
								local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
								if kName == opt.key then
									if opt.mode == "toggle" then
										library_flags[opt.flag] = not library_flags[opt.flag]; pcall(opt.callback, library_flags[opt.flag], 0)
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
								val = val or opt.key or "none"; opt.key = val; opt.state = val; library_flags[opt.flag] = val
								if bindBtn then bindBtn.Text = shortenBindName(val) end
							end
							opt.hasInit = true
						end
					elseif opt.type == "color" then
						optFrame.Size = UDim2.new(0, 0, 0, 0); optFrame.Visible = false
					elseif opt.type == "player_list" then
						optFrame.Size = UDim2.new(0.98, 0, 0, 290); totalHeight = totalHeight + 268; local listFrame = Instance.new("ScrollingFrame", optFrame); listFrame.Size = UDim2.new(1, 0, 0, 160); listFrame.Position = UDim2.new(0, 0, 0, 10); listFrame.BackgroundTransparency = 1; listFrame.BorderSizePixel = 0; listFrame.ScrollBarThickness = 2; listFrame.CanvasSize = UDim2.new(0, 0, 0, 0); local listLayout = Instance.new("UIListLayout", listFrame); listLayout.SortOrder = Enum.SortOrder.Name; local headers = Instance.new("Frame", optFrame); headers.Size = UDim2.new(1, 0, 0, 15); headers.Position = UDim2.new(0, 0, 0, -8); headers.BackgroundTransparency = 1
						local function createH(t, x, s)
							local l = Instance.new("TextLabel", headers); l.Size = s; l.Position = x; l.BackgroundTransparency = 1; l.Text = t; l.TextColor3 = Color3.fromRGB(150, 150, 150); l.Font = Enum.Font.Code; l.TextSize = 11; l.TextXAlignment = Enum.TextXAlignment.Left
						end
						createH("name", UDim2.new(0, 5, 0, 0), UDim2.new(0.3, 0, 1, 0)); createH("team", UDim2.new(0.3, 5, 0, 0), UDim2.new(0.45, 0, 1, 0)); createH("status", UDim2.new(0.75, 5, 0, 0), UDim2.new(0.25, 0, 1, 0)); local detail = Instance.new("Frame", optFrame); detail.Size = UDim2.new(1, 0, 0, 115); detail.Position = UDim2.new(0, 0, 0, 175); detail.BackgroundColor3 = Color3.fromRGB(20, 20, 20); detail.BorderSizePixel = 0; Instance.new("UICorner", detail).CornerRadius = UDim.new(0, 4); local dSt = Instance.new("UIStroke", detail) dSt.Color = Color3.fromRGB(35, 35, 35); local avatar = Instance.new("ImageLabel", detail); avatar.Size = UDim2.new(0, 65, 0, 65); avatar.Position = UDim2.new(0, 10, 0.5, -32); avatar.BackgroundColor3 = Color3.fromRGB(10, 10, 10); avatar.BorderSizePixel = 0; Instance.new("UIStroke", avatar).Color = Color3.fromRGB(30, 30, 30); local selLabel = Instance.new("TextLabel", detail); selLabel.Size = UDim2.new(0, 160, 0, 18); selLabel.Position = UDim2.new(0, 85, 0, 6); selLabel.BackgroundTransparency = 1; selLabel.Text = "no player selected"; selLabel.TextColor3 = Color3.fromRGB(220, 220, 220); selLabel.Font = Enum.Font.Code; selLabel.TextSize = 14; selLabel.TextXAlignment = Enum.TextXAlignment.Left; local selInfo = Instance.new("TextLabel", detail); selInfo.Size = UDim2.new(0, 200, 0, 60); selInfo.Position = UDim2.new(0, 85, 0, 24); selInfo.BackgroundTransparency = 1; selInfo.Text = ""; selInfo.TextColor3 = Color3.fromRGB(170, 170, 170); selInfo.Font = Enum.Font.Code; selInfo.TextSize = 12; selInfo.TextXAlignment = Enum.TextXAlignment.Left; selInfo.TextYAlignment = Enum.TextYAlignment.Top; local selectedPlayer = nil
						local function updateAvatar()
							if selectedPlayer and selectedPlayer:IsA("Player") then
								local plr = selectedPlayer
								spawn(function()
									if not (plr and plr.Parent and plr:IsA("Player")) then return end
									local thumbType = Enum.ThumbnailType.HeadShot; local thumbSize = Enum.ThumbnailSize.Size100x100
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
							local plr = selectedPlayer; local L = {}; L[#L+1] = "display: " .. tostring(plr.DisplayName); L[#L+1] = "@" .. tostring(plr.Name); local wep = "-"; local char = plr.Character
							if char then local et = char:FindFirstChild("EquippedTool") if et then wep = tostring(et.Value) end end
							L[#L+1] = "weapon: " .. wep; local team = "-"
							if plr:FindFirstChild("Status") and plr.Status:FindFirstChild("Team") then team = tostring(plr.Status.Team.Value) end
							local hp = "-"
							if char and char:FindFirstChild("Humanoid") then hp = tostring(math.floor(char.Humanoid.Health)) .. "/" .. tostring(math.floor(char.Humanoid.MaxHealth)) end
							L[#L+1] = "hp: " .. hp .. "  team: " .. team; local dist = "-"; local myChar = game.Players.LocalPlayer.Character; local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart"); local thHrp = char and char:FindFirstChild("HumanoidRootPart")
							if myHrp and thHrp then dist = tostring(math.floor((myHrp.Position - thHrp.Position).Magnitude)) .. "m" end
							L[#L+1] = "dist: " .. dist; local money = nil
							pcall(function()
								if plr:FindFirstChild("Cash") then money = plr.Cash.Value end
							end)
							if money ~= nil then L[#L+1] = "money: $" .. tostring(money) end
							local fl = {}
							if plr:FindFirstChild("Kevlar") and plr.Kevlar.Value > 0 then
								fl[#fl+1] = plr:FindFirstChild("Helmet") and "Helmet" or "Armored"
							else fl[#fl+1] = "Unarmored" end
							if plr:FindFirstChild("DefuseKit") then fl[#fl+1] = "Defuser" end
							if workspace:FindFirstChild("Status") and workspace.Status:FindFirstChild("HasBomb") and workspace.Status.HasBomb.Value == plr.Name then fl[#fl+1] = "Bomb" end
							if env.spentThisRound and (env.spentThisRound[plr.Name] or 0) > 0 then L[#L+1] = "spent: $" .. tostring(env.spentThisRound[plr.Name]) end
							if char then
								local g = char:FindFirstChild("Gun")
								if g and g:FindFirstChild("Scoped") then fl[#fl+1] = "Scoped" end
							end
							if #fl > 0 then L[#L+1] = "flags: " .. table.concat(fl, ", ") end
							selInfo.Text = table.concat(L, "\n")
						end
						local function createB(t, y)
							local b = Instance.new("TextButton", detail); b.Size = UDim2.new(0, 85, 0, 28); b.Position = UDim2.new(1, -95, 0, y); b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.Text = t; b.TextColor3 = Color3.fromRGB(180, 180, 180); b.Font = Enum.Font.Code; b.TextSize = 12; Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4); local s = Instance.new("UIStroke", b) s.Color = Color3.fromRGB(40, 40, 40)
							return b
						end
						local priBtn = createB("prioritize", 12)
						local frnBtn = createB("friendly", 45)
						local lkBtn = createB("loop kill", 78); library_flags["PlayerPriorities"] = library_flags["PlayerPriorities"] or {}
						library_flags["PlayerFriendlies"] = library_flags["PlayerFriendlies"] or {}
						library_flags["PlayerLoopKills"] = library_flags["PlayerLoopKills"] or {}
						local function updateBtns()
							if not selectedPlayer then return end
							local isPri = library_flags["PlayerPriorities"][selectedPlayer.Name]
							local isFrn = library_flags["PlayerFriendlies"][selectedPlayer.Name]
							local isLk = library_flags["PlayerLoopKills"][selectedPlayer.Name]; priBtn.TextColor3 = isPri and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(180, 180, 180); frnBtn.TextColor3 = isFrn and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(180, 180, 180); lkBtn.TextColor3 = isLk and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(180, 180, 180)
						end
						priBtn.MouseButton1Click:Connect(function()
							if not selectedPlayer then return end
							library_flags["PlayerPriorities"][selectedPlayer.Name] = not library_flags["PlayerPriorities"][selectedPlayer.Name]; updateBtns()
						end)
						frnBtn.MouseButton1Click:Connect(function()
							if not selectedPlayer then return end
							library_flags["PlayerFriendlies"][selectedPlayer.Name] = not library_flags["PlayerFriendlies"][selectedPlayer.Name]
							updateBtns()
						end)
						lkBtn.MouseButton1Click:Connect(function()
							if not selectedPlayer then return end
							library_flags["PlayerLoopKills"][selectedPlayer.Name] = not library_flags["PlayerLoopKills"][selectedPlayer.Name]; updateBtns()
						end)
						local rows = {}
						local function addPlayer(p)
							local row = Instance.new("TextButton", listFrame); row.Size = UDim2.new(1, 0, 0, 22); row.BackgroundTransparency = 1; row.Text = ""; local nameL = Instance.new("TextLabel", row); nameL.Size = UDim2.new(0.3, -5, 1, 0); nameL.Position = UDim2.new(0, 5, 0, 0); nameL.BackgroundTransparency = 1; nameL.Text = p.Name:lower(); nameL.TextColor3 = Color3.fromRGB(220, 220, 220); nameL.Font = Enum.Font.Code; nameL.TextSize = 12; nameL.TextXAlignment = Enum.TextXAlignment.Left; local teamL = Instance.new("TextLabel", row); teamL.Size = UDim2.new(0.45, -5, 1, 0); teamL.Position = UDim2.new(0.3, 5, 0, 0); teamL.BackgroundTransparency = 1; teamL.Text = "none"; teamL.TextColor3 = Color3.fromRGB(140, 140, 140); teamL.Font = Enum.Font.Code; teamL.TextSize = 11; teamL.TextXAlignment = Enum.TextXAlignment.Left; local statusL = Instance.new("TextLabel", row); statusL.Size = UDim2.new(0.25, -5, 1, 0); statusL.Position = UDim2.new(0.75, 5, 0, 0); statusL.BackgroundTransparency = 1; statusL.Text = "none"; statusL.TextColor3 = Color3.fromRGB(180, 180, 180); statusL.Font = Enum.Font.Code; statusL.TextSize = 11; statusL.TextXAlignment = Enum.TextXAlignment.Left
							local function updateInfo()
								pcall(function()
									local team = "none"
									if p:FindFirstChild("Status") and p.Status:FindFirstChild("Team") then
										team = p.Status.Team.Value
									end
									teamL.Text = team == "CT" and "counter-terrorists" or team == "T" and "terrorists" or team:lower(); local teamPrefix = "3_"
									if team == "CT" then
										teamL.TextColor3 = Color3.fromRGB(70, 120, 180); teamPrefix = "1_"
									elseif team == "T" then
										teamL.TextColor3 = Color3.fromRGB(180, 150, 60); teamPrefix = "2_"
									else
										teamL.TextColor3 = Color3.fromRGB(140, 140, 140)
									end
									row.Name = teamPrefix .. p.Name:lower(); local sText = "none"
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
								row.BackgroundTransparency = 0.9; row.BackgroundColor3 = Color3.fromRGB(200, 200, 200); selectedPlayer = p; selLabel.Text = "selected: " .. p.Name:lower(); updateBtns(); updateAvatar(); updateSelInfo()
							end)
							rows[p.UserId] = row; listFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
						end
						game.Players.PlayerAdded:Connect(addPlayer)
						game.Players.PlayerRemoving:Connect(function(p)
							if rows[p.UserId] then rows[p.UserId]:Destroy(); rows[p.UserId] = nil end
							if selectedPlayer == p then
								selectedPlayer = nil; selLabel.Text = "no player selected"; updateBtns()
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
			if UI_Library.lastTabBtn then
				UI_Library.lastTabBtn:FindFirstChild("TextLabel").TextColor3 = Color3.fromRGB(160, 160, 160); UI_Library.lastTabBtn.BackgroundTransparency = 1
			end
			if UI_Library.lastSubBtn then
				UI_Library.lastSubBtn.TextColor3 = Color3.fromRGB(120, 120, 120)
			end
			tabLabel.TextColor3 = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 255, 0); tabBtn.BackgroundTransparency = 0.8; UI_Library.lastTabBtn = tabBtn
			if selSub then
				for _, item in tab.sidebarSubBtns do
					if item.sub == selSub then
						item.label.TextColor3 = library_flags["Menu Accent Color"] or Color3.fromRGB(0, 255, 0); UI_Library.lastSubBtn = item.label; break
					end
				end
			end
		end
		local function activateTab(targetSub)
			for _, dl in floatingDropdowns do dl.Visible = false end
			if activePage then activePage.Visible = false end
			activePage = pageFrame; activeBtn = tabBtn; pageFrame.Visible = true; previewWin.Visible = (tab.title == "Visuals"); local TS = game:GetService("TweenService"); local ti = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
			for _, t in self.tabs do
				if t.subContainer then
					local targetHeight = (t == tab and #t.subtabs > 0) and (#t.subtabs * 22) or 0; TS:Create(t.subContainer, ti, {Size = UDim2.new(1, 0, 0, targetHeight)}):Play()
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
	local colorPop = Instance.new("Frame", sg); colorPop.Size = UDim2.new(0, 150, 0, 160); colorPop.BackgroundColor3 = Color3.fromRGB(22, 22, 22); colorPop.BorderColor3 = Color3.fromRGB(0, 0, 0); colorPop.BorderSizePixel = 1; colorPop.Visible = false; colorPop.Active = true; local dragging, dragInput, dragStart, startPos
	main.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if colorPop.Visible then
				local x, y = input.Position.X, input.Position.Y
				if not (x and y) then
					local mLoc = game:GetService("UserInputService"):GetMouseLocation(); x, y = mLoc.X, mLoc.Y - 36
				end
				local pX, pY = colorPop.AbsolutePosition.X, colorPop.AbsolutePosition.Y
				if x >= pX and x <= pX + colorPop.AbsoluteSize.X and y >= pY and y <= pY + colorPop.AbsoluteSize.Y then
					return
				end
			end
			local sv = env.skinViewportRef
			if sv and sv.Visible and sv:IsDescendantOf(game) and sv.AbsoluteSize.X > 0 and sv.Parent.Parent.Visible then
				local x, y = input.Position.X, input.Position.Y; local pX, pY = sv.AbsolutePosition.X, sv.AbsolutePosition.Y
				if x >= pX and x <= pX + sv.AbsoluteSize.X and y >= pY and y <= pY + sv.AbsoluteSize.Y then
					return
				end
			end
			local gv = env.gloveViewportRef
			if gv and gv.Visible and gv:IsDescendantOf(game) and gv.AbsoluteSize.X > 0 then
				local x, y = input.Position.X, input.Position.Y; local pX, pY = gv.AbsolutePosition.X, gv.AbsolutePosition.Y
				if x >= pX and x <= pX + gv.AbsoluteSize.X and y >= pY and y <= pY + gv.AbsoluteSize.Y then
					return
				end
			end
			local kv = env.knifeViewportRef
			if kv and kv.Visible and kv:IsDescendantOf(game) and kv.AbsoluteSize.X > 0 then
				local x, y = input.Position.X, input.Position.Y; local pX, pY = kv.AbsolutePosition.X, kv.AbsolutePosition.Y
				if x >= pX and x <= pX + kv.AbsoluteSize.X and y >= pY and y <= pY + kv.AbsoluteSize.Y then
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
			local delta = input.Position - dragStart; main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	local currentTargetColor = nil; local currentTargetBtn = nil; local hue, sat, val = 1, 1, 1; local hueSlider = Instance.new("Frame", colorPop); hueSlider.Size = UDim2.new(1, -20, 0, 10); hueSlider.Position = UDim2.new(0, 10, 1, -20); hueSlider.BackgroundColor3 = Color3.new(1,1,1); hueSlider.BorderColor3 = Color3.fromRGB(0,0,0); hueSlider.BorderSizePixel = 1; hueSlider.Active = true; local hueGrad = Instance.new("UIGradient", hueSlider)
	hueGrad.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)) })
	local hueCursor = Instance.new("Frame", hueSlider); hueCursor.Size = UDim2.new(0, 2, 1, 0); hueCursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255); hueCursor.BorderColor3 = Color3.fromRGB(0, 0, 0); hueCursor.BorderSizePixel = 1; local satValBox = Instance.new("ImageLabel", colorPop); satValBox.Size = UDim2.new(1, -20, 1, -40); satValBox.Position = UDim2.new(0, 10, 0, 10); satValBox.Image = "rbxassetid://4155801252"; satValBox.BackgroundColor3 = Color3.fromHSV(hue, 1, 1); satValBox.BorderColor3 = Color3.fromRGB(0, 0, 0); satValBox.BorderSizePixel = 1
	satValBox.ClipsDescendants = true
	satValBox.Active = true; local satValCursor = Instance.new("Frame", satValBox); satValCursor.Size = UDim2.new(0, 4, 0, 4); satValCursor.AnchorPoint = Vector2.new(0.5, 0.5); satValCursor.Rotation = 45; satValCursor.BackgroundColor3 = Color3.fromRGB(255, 255, 255); satValCursor.BorderColor3 = Color3.fromRGB(0, 0, 0); satValCursor.BorderSizePixel = 1
	local function updateColor()
		satValBox.BackgroundColor3 = Color3.fromHSV(hue, 1, 1); hueCursor.Position = UDim2.new(1 - hue, 0, 0, 0); satValCursor.Position = UDim2.new(sat, 0, 1 - val, 0); local finalColor = Color3.fromHSV(hue, sat, val)
		if currentTargetColor and currentTargetBtn then
			if typeof(currentTargetColor.SetColor) == "function" then
				currentTargetColor:SetColor(finalColor)
			else
				currentTargetColor.color = finalColor
			end
			currentTargetBtn.BackgroundColor3 = finalColor
		end
	end
	local uis = game:GetService("UserInputService"); local draggingHue = false; local draggingSatVal = false
	hueSlider.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingHue = true; hue = 1 - math.clamp((input.Position.X - hueSlider.AbsolutePosition.X) / hueSlider.AbsoluteSize.X, 0, 1); updateColor()
		end
	end)
	satValBox.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingSatVal = true; sat = math.clamp((input.Position.X - satValBox.AbsolutePosition.X) / satValBox.AbsoluteSize.X, 0.005, 1); val = 1 - math.clamp((input.Position.Y - satValBox.AbsolutePosition.Y) / satValBox.AbsoluteSize.Y, 0, 1); updateColor()
		end
	end)
	uis.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			if draggingHue then
				hue = 1 - math.clamp((input.Position.X - hueSlider.AbsolutePosition.X) / hueSlider.AbsoluteSize.X, 0, 1); updateColor()
			elseif draggingSatVal then
				sat = math.clamp((input.Position.X - satValBox.AbsolutePosition.X) / satValBox.AbsoluteSize.X, 0.005, 1); val = 1 - math.clamp((input.Position.Y - satValBox.AbsolutePosition.Y) / satValBox.AbsoluteSize.Y, 0, 1); updateColor()
			end
		end
	end)
	uis.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			draggingHue = false; draggingSatVal = false
		end
	end)
	openColorPicker = function(opt, btn)
		currentTargetColor = opt; currentTargetBtn = btn; colorPop.Position = UDim2.new(0, btn.AbsolutePosition.X - 160, 0, btn.AbsolutePosition.Y); colorPop.Visible = true; local clr = opt.color or Color3.fromRGB(255, 255, 255); hue, sat, val = Color3.toHSV(clr); hue = hue == 0 and 1 or hue; satValBox.BackgroundColor3 = Color3.fromHSV(hue, 1, 1); hueCursor.Position = UDim2.new(1 - hue, 0, 0, 0); satValCursor.Position = UDim2.new(sat, 0, 1 - val, 0)
	end
	game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and colorPop.Visible then
			local mousePos = input.Position; local pos = colorPop.AbsolutePosition; local size = colorPop.AbsoluteSize
			if mousePos.X < pos.X or mousePos.X > pos.X + size.X or mousePos.Y < pos.Y or mousePos.Y > pos.Y + size.Y then
				if currentTargetBtn then
					local bPos = currentTargetBtn.AbsolutePosition; local bSize = currentTargetBtn.AbsoluteSize
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
			local uis = game:GetService("UserInputService"); uis.MouseIconEnabled = false; uis.MouseBehavior = Enum.MouseBehavior.Default; local mPos = uis:GetMouseLocation(); local p = Vector2.new(mPos.X, mPos.Y); env._cursor_outer.Position = p; env._cursor_inner.Position = p; env._cursor_outer.Visible = true; env._cursor_inner.Visible = true
		end
	end)
	game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
			if processed or env.bindListening or env.inputService:GetFocusedTextBox() then return end
			local currentBind = (val_614 and val_614.flags and val_614.flags["Menu Bind"]) or (library_flags and library_flags["Menu Bind"]) or "Delete"; local kName = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode.Name or (input.UserInputType.Name:find("MouseButton") and "M" .. input.UserInputType.Name:sub(-1) or nil)
			if kName == currentBind then
				if self.toggling then return end
				self.toggling = true; local isVisible = false
				if self.base and self.mainFrame then
					isVisible = self.base.Enabled and self.mainFrame.Visible
				elseif self.mainFrame then
					isVisible = self.mainFrame.Visible
				elseif self.base then
					isVisible = self.base.Enabled
				end
				self.open = isVisible; self.open = not self.open
				if not self.open then env.bindListening = false end
				if self.mainFrame then self.mainFrame.Visible = self.open end
				if self.base then self.base.Enabled = self.open end
				env._cursor_outer.Visible = self.open; env._cursor_inner.Visible = self.open; game:GetService("UserInputService").MouseIconEnabled = not self.open; game:GetService("UserInputService").MouseBehavior = self.open and Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter
				task.delay(0.2, function() self.toggling = false end)
			end
	end)
	env.ToggleClarity = function()
		if self.toggling then return end
		self.toggling = true; local isVisible = false
		if self.base and self.mainFrame then
			isVisible = self.base.Enabled and self.mainFrame.Visible
		elseif self.mainFrame then
			isVisible = self.mainFrame.Visible
		elseif self.base then
			isVisible = self.base.Enabled
		end
		self.open = isVisible; self.open = not self.open
		if self.mainFrame then self.mainFrame.Visible = self.open end
		if self.base then self.base.Enabled = self.open end
		env._cursor_outer.Visible = self.open; env._cursor_inner.Visible = self.open; game:GetService("UserInputService").MouseIconEnabled = not self.open; game:GetService("UserInputService").MouseBehavior = self.open and Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter
		task.delay(0.2, function() self.toggling = false end)
	end
end
UI_Library:Init(); setAimbotPage(library_flags["aimbotWeaponPage"] or "All (Shared)")
hitlogGui = Instance.new("ScreenGui", game:service("CoreGui")); logholder = game:GetObjects("rbxassetid://6502006065")[1]; logholder.log.main.BackgroundColor3 = Color3.fromRGB(25, 25, 25); logholder.log.main.text.TextColor3 = Color3.new(0.8, 0.8, 0.8); logholder.Parent = hitlogGui; logcount = 0; logDebounce = false 
function hitlog(var_45, var_156, var_25)
	var_156 = string.find(var_156, "Head") and "Head" or var_156 
	if logDebounce then
		return
	end 
	logDebounce = true 
	spawn(function()
		wait(); logDebounce = false
	end)
	logcount = logcount + 1 
	if logcount >= 7 then
		for var_52, var_137 in logholder:GetChildren() do
			if var_137.Name == "logged" then
				var_137:Destroy(); logcount = logcount - 1; break
			end
		end
	end 
	local val_538 = logholder.log:Clone(); val_538.Parent = logholder; val_538.Visible = true; val_538.Name = "logged"; val_538.BackgroundColor3 = library_flags["Menu Accent Color"]; val_538.main.text.Text = "Hit " .. var_45.Name .. " in the " .. tostring(var_156) .. " with a " .. tostring(var_25); local val_539 = game:service("TweenService"):Create(val_538.main, TweenInfo.new(0.75), { Size = UDim2.new(0, val_538.main.text.TextBounds.X + 7, 0, 25) }); val_539:Play(); val_539.Completed:Wait(); wait(2); local val_541 = game:service("TweenService"):Create(val_538.main, TweenInfo.new(1), { Size = UDim2.new(0, 0, 0, 25) }); val_541:Play(); val_541.Completed:Wait(); val_538:Destroy(); logcount = logcount - 1
end 
env.hitlog = hitlog 
if UI_Library.mainFrame then UI_Library.mainFrame.Modal = true end
for var_200, var_245 in val_711:GetPlayers() do
	UI_Library:AddConnection(var_245.CharacterAdded, function(var_43)
		wait(0.25)
		if var_245 == val_733 then
			if library_flags["autoBuyEnabled"] then
				wait(0.5); local val_542, val_543, val_544, val_545, val_547, val_548 = false, false, false, false, false, false 
				if not val_733.PlayerGui.GUI.Inventory.Item1.Visible then
					buyWeapon(library_flags["Primary Weapon"]); val_548 = true
				end 
				if string.find(string.lower(val_733.PlayerGui.GUI.Inventory.Item2.ToolName.Text), "glock") or string.find(string.lower(val_733.PlayerGui.GUI.Inventory.Item2.ToolName.Text), "usp") or string.find(string.lower(val_733.PlayerGui.GUI.Inventory.Item2.ToolName.Text), "px") then
					buyWeapon(library_flags["Secondary Weapon"]); val_548 = true
				end 
				if val_733:FindFirstChild("Kevlar") and var_245.Kevlar.Value < 100 then
					buyWeapon(library_flags["Armor"]); val_548 = true
				end 
				local val_549 = 0 
				for var_174 = 4, 6 do
					local val_550 = val_733.PlayerGui.GUI.Inventory["Item" .. tostring(var_174)]; local val_551 = val_550.ToolName.Text 
					if val_550.Visible and val_551 == "Molotov" or val_550.Visible and val_551 == "Incendiary Grenade" then
						val_544 = true; val_549 = val_549 + 1
					elseif val_550.Visible and val_551 == "HE Grenade" then
						val_543 = true; val_549 = val_549 + 1
					elseif val_550.Visible and val_551 == "Decoy Grenade" then
						val_547 = true; val_549 = val_549 + 1
					elseif val_550.Visible and val_551 == "Smoke Grenade" then
						val_545 = true; val_549 = val_549 + 1
					elseif val_550.Visible and val_551 == "Flashbang" then
						val_542 = true; val_549 = val_549 + 1
					end
				end 
				for var_4, var_121 in library_flags["Grenades"] do
					if var_121 and val_549 < 3 then
						if var_4 == "Fire Grenade" and not val_544 or var_4 == "HE Grenade" and not val_543 or var_4 == "Decoy Grenade" and not val_547 or var_4 == "Smoke Grenade" and not val_545 or var_4 == "Flashbang" and not val_542 then
							buyWeapon(var_4); val_549 = val_549 + 1; val_548 = true
						end
					end
				end 
				wait()
				if val_548 then
					val_757.Back()
				end
			end
		end 
		wait(0.75); val_823 = true 
		if not UI_Library then return end
		do local _opt = UI_Library.options["Self Chams"]; if _opt and type(_opt.callback) == "function" then _opt.callback() end end
		if library_flags["Chams"] and var_245 ~= val_733 then
			chamsPlr(var_245); cbCHAMS()
		end
	end)
end 
UI_Library:AddConnection(val_711.PlayerAdded, function(var_57)
	UI_Library:AddConnection(var_57.CharacterAdded, function(var_264)
		wait(1); val_823 = true 
		if library_flags["Chams"] and var_57 ~= val_733 then
			chamsPlr(var_57); cbCHAMS()
		end
	end)
end)
local val_467, val_468 = 0, 90; env.val_469 = val_757.firebullet 
val_757.firebullet = function(var_51, ...)
	if not UI_Library or not UI_Library.open or env.target then
		local val_553 = false 
		if env.target and not val_872.melee then
			if env.val_469 then env.val_469(var_51, ...) end
			val_553 = true
		elseif not env.target and not val_553 then
			if env.val_469 then env.val_469(var_51, ...) end
			val_553 = true
		end 
	end
end 
UI_Library:AddConnection(val_749.ChildAdded, function(var_5)
	updateViewModelVisuals(); selfChams()
end)
UI_Library:AddConnection(workspace.Debris.ChildAdded, function(var_78)
	local val_554 = false 
	if val_662.Weapons:FindFirstChild(var_78.Name) and not var_78:FindFirstChild("Folder") then
		f = Instance.new("Folder", var_78); createEsp("weapon", var_78)
	end 
	for var_3 = 1, 10 do
		wait()
		if var_78:FindFirstChild("ball") then
			val_554 = true
		end
	end 
	if val_554 and library_flags["Grenade Area"] then
		local val_555 = Instance.new("Part", var_78); val_555.Color = library_flags["areaColor"]; val_555.Size = Vector3.new(12, 12, 12); val_555.Shape = "Ball"; val_555.Material = "ForceField"; val_555.CanCollide = false; val_555.Anchored = true 
		repeat
			val_690.RenderStepped:Wait()
			if val_555 and var_78 and var_78:FindFirstChild("Handle2") then
				val_555.Position = var_78.Handle2.Position
			else
				break
			end
		until var_78:FindFirstChild("Explode1Playing")
		val_555:Destroy()
	end
end)
for var_249, var_66 in game.Teams:GetChildren() do
	var_66.PlayerAdded:connect(function(var_260)
		if var_260 == val_733 then
			wait(0.5)
			for var_209, var_147 in val_711:GetPlayers() do
				if var_147.Character then
					for var_159, var_50 in var_147.Character:GetDescendants() do
						if var_50:IsA"CylinderHandleAdornment" or var_50:IsA"BoxHandleAdornment" then
							var_50:Destroy()
						end
					end
				end
			end 
			wait(1)
			for var_164, inputBeganEvent in val_711:GetPlayers() do
				if inputBeganEvent.Character then
					if library_flags["Chams"] then chamsPlr(inputBeganEvent) end
				end
			end
		end
	end)
end 
val_733.Status.Kills.Changed:Connect(function(var_189)
	if var_189 ~= 0 then
		onKill:Fire()
	end
end)
env.MenuFrame = val_824.mainFrame; draggable(val_948); draggable(val_969); draggable(val_824.mainFrame)
spawn(function()
	while wait(3.5) do
		updateSkybox()
	end
end)
if isfile("clarity.tk/temp.tmp") then
	task.delay(1, function()
		UI_Library:LoadConfig(readfile("clarity.tk/temp.tmp")); delfile("clarity.tk/temp.tmp")
	end)
end 
val_733.OnTeleport:Connect(function(var_47)
end)
knifeDebounce = false; invissed = false; chatspamDebounce = 0; textbounded = false; tpdebounce = false; reloading = false; reloaddebounce = false; strafing = false; oldLook = Vector3.new(); oldAmbient = val_699.Ambient 
oldOutdoorAmbient = val_699.OutdoorAmbient 
testpart = Instance.new("Part", workspace); testpart.Anchored = true; testpart.Size = Vector3.new(1, 1, 1); testpart.CanCollide = false 
val_671.InputChanged:Connect(function(var_219)
	if not library_flags["Override Game Movement"] then
		return
	end 
	if not val_872.alive then
		return
	end 
	if var_219.UserInputType == Enum.UserInputType.MouseMovement then
		local val_558 = val_733.Character.Humanoid:GetState()
		if val_558 == Enum.HumanoidStateType.Freefall or val_558 == Enum.HumanoidStateType.Jumping then
		else
			return
		end 
		strafing = true 
		if not val_671:IsKeyDown(Enum.KeyCode.W) and not val_671:IsKeyDown(Enum.KeyCode.S) then
			if var_219.Delta.X < 0 then
				if var_219.Delta.X > -11 and val_671:IsKeyDown(Enum.KeyCode.A) then
					local val_559 = math.abs(var_219.Delta.X) / 25 * library_flags["Air Acceleration"]; val_733.Character.Humanoid.WalkSpeed = val_733.Character.Humanoid.WalkSpeed + val_559
				elseif val_671:IsKeyDown(Enum.KeyCode.A) then
					local val_560 = - (math.abs(var_219.Delta.X) / 7.5); val_733.Character.Humanoid.WalkSpeed = val_733.Character.Humanoid.WalkSpeed + val_560
				end
			elseif var_219.Delta.X > 0 then
				if var_219.Delta.X < 11 and val_671:IsKeyDown(Enum.KeyCode.D) then
					local val_561 = math.abs(var_219.Delta.X) / 25 * library_flags["Air Acceleration"]; val_733.Character.Humanoid.WalkSpeed = val_733.Character.Humanoid.WalkSpeed + val_561
				elseif val_671:IsKeyDown(Enum.KeyCode.D) then
					local val_562 = - (math.abs(var_219.Delta.X) / 7.5); val_733.Character.Humanoid.WalkSpeed = val_733.Character.Humanoid.WalkSpeed + val_562
				end
			end
		end 
		val_733.Character.Humanoid.WalkSpeed = math.clamp(val_733.Character.Humanoid.WalkSpeed, 0, 120)
		spawn(function()
			strafing = false
		end)
	end
end)
val_690.Stepped:Connect(function()
	if alive() then
		local val_563, val_564 = val_733.Character, not noclipping; val_563.Head.CanCollide = val_564; val_563.UpperTorso.CanCollide = val_564; val_563.LowerTorso.CanCollide = val_564; val_563.HumanoidRootPart.CanCollide = val_564
	end
end)
pcall(function()
	UI_Library.base.TextLabel.Visible = false
end)
pingIntance = game.Stats.PerformanceStats.Ping; noscroll = false 
oldmovedown = val_757.moveDown 
oldmoveup = val_757.moveUp; oldmakevisible = val_757.makeVisible; env._espFrameCount = 0
val_690.RenderStepped:Connect(function(var_129)
    LastStep = var_129
	env._espFrameCount = (env._espFrameCount or 0) + 1
	if env._espFrameCount % 30 == 0 then
		env._espIgnoreList = nil
	end
	if not workspace:FindFirstChild("Map") then
		return
	end 
	val_890 = var_129; val_882 = pingIntance:GetValue()
	pcall(function()
		if library_flags["Gradient"] then
			val_699.Ambient = typeof(library_flags["gradientColor"]) == "Color3" and library_flags["gradientColor"] or val_699.Ambient
			val_699.OutdoorAmbient = typeof(library_flags["gradientColor2"]) == "Color3" and library_flags["gradientColor2"] or val_699.OutdoorAmbient
		else
			val_699.Ambient = typeof(oldAmbient) == "Color3" and oldAmbient or Color3.fromRGB(128, 128, 128)
			val_699.OutdoorAmbient = typeof(oldOutdoorAmbient) == "Color3" and oldOutdoorAmbient or Color3.fromRGB(128, 128, 128)
		end
		if library_flags["Enabled Ambient"] then
			val_699.Ambient = library_flags["ambientColor"]
		end
		if library_flags["Brightness"] ~= nil then
			val_699.Brightness = library_flags["Brightness"]
		end
	end)
	pcall(function()
		if not val_796 or not val_796.Parent then
			val_796 = Instance.new("ColorCorrectionEffect", val_699)
		end
		val_796.Saturation = library_flags["Saturation"] and library_flags["saturationValue"] / 50 or 0; val_699.ClockTime = library_flags["Time Changer"] and library_flags["time"] / 2 or 14
		if library_flags["Skybox Changer"] and not val_699:FindFirstChild("customsky") then
			task.spawn(updateSkybox)
		end
	end)
	pcall(function()
		local hrp = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart"); local hum = val_733.Character and val_733.Character:FindFirstChild("Humanoid")
		if not hrp or not hum or not val_872.alive then
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
		local ebEnabled = library_flags["Edgebug"]; local autoStatus = library_flags["Auto Edge Bug"]; local ebMode = library_flags["Edgebug Mode"] or "redirectional"
		if env.mimicHum ~= hum then
			env.mimicHum = hum
			if env.mimicStateConn then
				env.mimicStateConn:Disconnect(); env.mimicStateConn = nil
			end
			if library_flags["showEBLogs"] then warn("[EB] mimic armed on " .. hum:GetFullName()) end
			env.mimicStateConn = hum.StateChanged:Connect(function(old, new)
				if not (library_flags["Edgebug"] and (library_flags["Auto Edge Bug"] or env.ebHolding)) then return end
				if library_flags["Edgebug Mode"] ~= "mimic" then return end
				local rootNow = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart")
				if new == Enum.HumanoidStateType.Freefall then
					env.mimicWasFalling = true
				end
				if env.mimicWasFalling and new == Enum.HumanoidStateType.Landed and not edgebugDebounce then
					env.mimicWasFalling = false
					local peak = env.mimicPeakY or env.mimicLastPeak; local drop = (peak and rootNow) and (peak - rootNow.Position.Y) or 99
					if library_flags["showEBLogs"] then warn(string.format("[EB] mimic landed | drop=%.2f debounce=%s", drop, tostring(edgebugDebounce))) end
					if drop < 1.5 then return end
					edgebugDebounce = true; env.hookJP = 0; local currentHrp = rootNow; local currentHum = val_733.Character and val_733.Character:FindFirstChild("Humanoid")
					if not currentHrp or not currentHum then
						edgebugDebounce = false; return
					end
					spawn(function()
						wait()
						if not currentHrp then return end
						local vel = currentHrp.AssemblyLinearVelocity; local flat = Vector3.new(vel.X, 0, vel.Z)
						flat = flat * (flat.Magnitude > 5 and 1 or 1.15)
						if flat.Magnitude > EB_MAX_SPEED then flat = flat.Unit * EB_MAX_SPEED end
						currentHrp.AssemblyLinearVelocity = Vector3.new(flat.X, -7, flat.Z); local vel2 = currentHrp.AssemblyLinearVelocity
						for i = 1, 4 do
							wait()
							if not currentHrp then return end
							currentHrp.AssemblyLinearVelocity = vel2 - Vector3.new(0, 2, 0)
						end
						wait()
						if not currentHrp then return end
						env.hookJP = nil
						delay(0.3, function()
							edgebugDebounce = false
						end)
					end)
				end
			end)
		end
		if (not val_830) and edgeBox then edgeBox.Transparency = 1 end
		if ebEnabled and (autoStatus or env.ebHolding) and ebMode == "helltracing" then
			local state = hum:GetState(); local velocity = hrp.AssemblyLinearVelocity; local rayParams = RaycastParams.new(); rayParams.FilterType = Enum.RaycastFilterType.Exclude
			rayParams.FilterDescendantsInstances = {val_733.Character, workspace:FindFirstChild("Ray_Ignore")}
			if state == Enum.HumanoidStateType.Freefall and velocity.Y < -8 then
				local moveDir = Vector3.new(velocity.X, 0, velocity.Z)
				if moveDir.Magnitude < 0.5 then
					moveDir = hrp.CFrame.LookVector
				else
					moveDir = moveDir.Unit
				end
				local underRay = workspace:Raycast(hrp.Position, Vector3.new(0, -6, 0), rayParams); local forwardOrigin = hrp.Position + moveDir * 2.0; local forwardRay = workspace:Raycast(forwardOrigin, Vector3.new(0, -6, 0), rayParams); local isEdge = (underRay and not forwardRay) or
(underRay and forwardRay and (underRay.Position.Y - forwardRay.Position.Y) > 1.0)
				if isEdge then
					env.helltracingEdgeDetected = true; env.helltracingEdgeTime = tick()
					if library_flags["showEBLogs"] then
						warn("[EB DEBUG] helltracing edge detected | velY=" .. string.format("%.1f", velocity.Y) .. " flatSpeed=" .. string.format("%.1f", Vector3.new(velocity.X, 0, velocity.Z).Magnitude))
					end
				end
			end
			if env.helltracingEdgeDetected and not env.helltracingFallSpeed then
				local ff = Vector3.new(velocity.X, 0, velocity.Z)
				if ff.Magnitude > 0.5 then
					env.helltracingFallSpeed = ff.Magnitude; env.helltracingFallDir = ff.Unit
				end
			end
			if env.helltracingEdgeDetected and state == Enum.HumanoidStateType.Landed and not edgebugDebounce then
				if (tick() - (env.helltracingEdgeTime or 0)) < 0.5 then
					edgebugDebounce = true; env.hookJP = 0; local liveFlat = Vector3.new(velocity.X, 0, velocity.Z); local flatSpeed = math.max(env.helltracingFallSpeed or 0, liveFlat.Magnitude); local moveDir = env.helltracingFallDir or (liveFlat.Magnitude > 0.5 and liveFlat.Unit) or hrp.CFrame.LookVector; hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false); hum:ChangeState(Enum.HumanoidStateType.Freefall); hrp.AssemblyLinearVelocity = Vector3.new(
						moveDir.X * flatSpeed, 0, moveDir.Z * flatSpeed
					); hrp.CFrame = hrp.CFrame + moveDir * 0.5; env.lastEdgebugTime = tick()
					if env.showEdgebugBadge then env.showEdgebugBadge() end
					if library_flags["showEBLogs"] then
						warn(string.format("[EB DEBUG] helltracing slide | speed=%.1f", flatSpeed))
					end
					task.delay(0.15, function()
						env.hookJP = nil
						pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true) end)
						edgebugDebounce = false
					end)
				end
				env.helltracingEdgeDetected = false; env.helltracingFallSpeed = nil; env.helltracingFallDir = nil
			end
			if env.helltracingEdgeDetected and (tick() - (env.helltracingEdgeTime or 0)) > 0.8 then
				env.helltracingEdgeDetected = false; env.helltracingFallSpeed = nil; env.helltracingFallDir = nil
			end
		elseif env.helltracingEdgeDetected then
			env.helltracingEdgeDetected = false; env.helltracingFallSpeed = nil; env.helltracingFallDir = nil
		end
		local velocity = hrp.AssemblyLinearVelocity
		if env.minijumpActive then
			if tick() - (env.mjArmedTime or 0) > 1.5 then
				env.minijumpActive = nil
			elseif velocity.Y > 2 then
				local mult = library_flags["mjMult"] or 0.5; hrp.AssemblyLinearVelocity = Vector3.new(velocity.X, velocity.Y * mult, velocity.Z); env.minijumpActive = nil; env.minijumpSuccessTime = tick()
			end
		end
		local isGrounded = hum.FloorMaterial ~= Enum.Material.Air
		if isGrounded then
			if env.mimicPeakY then
				env.mimicLastPeak = env.mimicPeakY; env.mimicPeakY = nil
			end
		else
			env.mimicPeakY = math.max(env.mimicPeakY or hrp.Position.Y, hrp.Position.Y)
		end
		if hum.UseJumpPower then hum.UseJumpPower = false end
	end)
	if #val_711:GetPlayers() ~= #val_868 then
		for var_88, var_39 in val_711:GetPlayers() do
			if not val_868[var_39.Name] then
				createEsp("plr", var_39)
			end
		end
	end 
	if UI_Library and UI_Library.open and not noscroll then
		noscroll = true 
		val_757.moveDown = function()
		end 
		val_757.moveUp = function()
		end
	elseif UI_Library and not UI_Library.open and noscroll then
		noscroll = false 
		val_757.moveDown = oldmovedown 
		val_757.moveUp = oldmoveup
	end 
	if not env.espBoundingBox then
		env.espBoundingBox = function(rootCf, headCf, rootSize, headSize, hipHeight, cam)
			local th = (headCf * Vector3.new(0, headSize.Y * 0.5 + 0.5, 0)); local bf = (rootCf * Vector3.new(0, -(rootSize.Y * 0.5 + hipHeight + 0.5), 0)); local td = (th - rootCf.Position).Magnitude; local bd = (rootCf.Position - bf).Magnitude; local up = rootCf.UpVector; local tp = rootCf.Position + up * td; local bp = rootCf.Position - up * bd; local top, tv = cam:WorldToViewportPoint(tp); local bottom, bv = cam:WorldToViewportPoint(bp); local width = math.abs(top.X - bottom.X); local height = math.max(math.abs(top.Y - bottom.Y), width / 1.75); local sizeX = math.floor(math.max(height / 1.7, width * 2.5)); local sizeY = math.floor(height); local posX = math.floor((bottom.X - sizeX + top.X) / 2); local posY = math.floor(math.min(top.Y, bottom.Y))
			return Vector2.new(posX, posY), Vector2.new(sizeX, sizeY), (tv or bv)
		end
	end
	if not env.drawLineFast then
		env.drawLineFast = function(p1, p2, line, offset1, offset2, cam, color)
			if p1 and p2 and line then
				local pos1 = offset1 and (p1.CFrame * offset1).Position or p1.Position; local pos2 = offset2 and (p2.CFrame * offset2).Position or p2.Position; local s1, v1 = cam:WorldToViewportPoint(pos1); local s2, v2 = cam:WorldToViewportPoint(pos2)
				if v1 and v2 then
					line.From = Vector2.new(s1.X, s1.Y); line.To = Vector2.new(s2.X, s2.Y); line.Visible = true; line.Color = color
				else
					line.Visible = false
				end
			else
				if line then line.Visible = false end
			end
		end
	end
	if library_flags["espEnabled"] then
		invissed = false 
		for var_101, var_223 in val_868 do
			local val_566 = var_223.type == "plr"
			if val_566 and not val_711:FindFirstChild(var_101) or not val_566 and var_223.object == nil then
				var_223.invis(); var_223.remove(); val_868[var_101] = nil; continue 
			end 
			if var_223.type == "weapon" and not library_flags["Dropped Weapon ESP"] then
				var_223.text.Visible = false; continue 
			end 
			if val_566 and teamCheck(val_711[var_101], val_772) and val_711[var_101].Character and val_711[var_101].Character:FindFirstChild("Humanoid") and val_711[var_101].Character:FindFirstChild("HumanoidRootPart") and val_711[var_101].Character:FindFirstChild("Head") or not val_566 and var_223.object then
				if not alive() then
					var_223.invis(); continue 
				end 
				local val_567; local val_568 = val_818; local val_569 = val_818; local val_570 
				if val_566 then
					val_567 = val_711[var_101]; local val_584 = val_567.Character.HumanoidRootPart.Position; val_568 = Vector3.new(val_584.x, val_584.y + 2.45, val_584.z); val_569 = Vector3.new(val_584.x, val_584.y - 3.1, val_584.z); val_570 = math.clamp(val_567.Character.Humanoid.Health, 0, 100)
				elseif var_223.type == "weapon" and var_223.object and var_223.object then
					val_568 = var_223.object.Position; val_569 = var_223.object.Position
				end 
				local val_571, val_573 = val_749:WorldToViewportPoint(val_568); local val_574, val_575 = val_749:WorldToViewportPoint(val_569)
				if val_573 or val_575 then
				else
					var_223.invis(); continue 
				end 
				local val_576 = (val_574.y - val_571.y) / 2; local val_577 = true 
				if library_flags["Visible Only ESP"] and val_733.Character or not val_566 and var_223.object then
					val_577 = false; local val_585 = val_566 and val_567.Character.Head.Position or var_223.object.Position; local val_586 = Ray.new(val_749.CFrame.p, (val_585 - val_749.CFrame.p).unit * 500)
					if not env._espIgnoreList or env._espIgnoreListFrame ~= (env._espFrameCount or 0) then
						local mapClips = workspace.Map and workspace.Map:FindFirstChild("Clips") or nil; local spawnPts = workspace.Map and workspace.Map:FindFirstChild("SpawnPoints") or nil; local il = {val_749, val_733.Character, workspace:FindFirstChild("Ray_Ignore")}
						if mapClips then il[#il+1] = mapClips end
						if spawnPts then il[#il+1] = spawnPts end
						env._espIgnoreList = il; env._espIgnoreListFrame = env._espFrameCount or 0
					end
					local val_587, val_588 = workspace:FindPartOnRayWithIgnoreList(val_586, env._espIgnoreList)
					if val_566 and val_567.Character then
						val_577 = val_587:IsDescendantOf(val_567.Character)
					elseif val_587 then
						val_577 = val_587 == var_223.object
					end
				end 
				if not val_577 then
					var_223.invis(); continue 
				end 
				local val_578 = library_flags["Font"]; local val_579 = ""
				if var_223 then var_223._isInvis = false end
				if val_566 then
					if val_567.Character:FindFirstChild("EquippedTool") then
						val_579 = tostring(val_567.Character.EquippedTool.Value)
					end 
					local val_589 = library_flags["Box ESP"]; local val_590 = library_flags["Health Bar"]; local rectMin, rectSize
					do
						local char = val_567 and val_567.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart"); local head = char and char:FindFirstChild("Head"); local hum = char and char:FindFirstChild("Humanoid")
						if hrp and head and hum then
							local bpos, bsize = env.espBoundingBox(hrp.CFrame, head.CFrame, hrp.Size, head.Size, hum.HipHeight, val_749); rectMin, rectSize = bpos, bsize
						end
					end
					if not rectMin then
						rectMin = Vector2.new(val_571.X - val_576 / 2, val_571.Y); rectSize = Vector2.new(val_576, val_574.y - val_571.Y)
					end
					local rectHeight = rectSize.Y; local isGradientHp = library_flags["Gradient Health Bar"] and true or false; var_223.text.Visible = library_flags["Name ESP"]; var_223.weapon.Text = val_579; var_223.weapon.Visible = library_flags["Weapon ESP"]; var_223.tracer.Visible = library_flags["Tracers"]; var_223.boxoutline.Visible = val_589 and library_flags["Outline"] and true or false; var_223.box.Visible = val_589; var_223.healthb.Visible = val_590 and not isGradientHp; var_223.healthbo.Visible = val_590 
					if not val_590 then
						for i = 1, var_223.healthSegCount do
							var_223.healthSegs[i].Visible = false
						end
						var_223.healthNum.Visible = false
					end
					var_223.tracer.To = UI_Library.round(Vector2.new(val_574.X, val_574.Y)); local val_591 = library_flags["Armor Bar"]; var_223.armorb.Visible = val_591 and true or false; var_223.armorbo.Visible = val_591 and true or false 
					if val_590 or val_591 then
						local hasKevlar = val_567 and val_567:FindFirstChild("Kevlar") and true or false
						if val_590 then
							local pct = math.clamp(val_570 / 100, 0, 1); local a = math.clamp((var_129 or 0.016) * 16, 0, 1); var_223.hpSmooth = var_223.hpSmooth + (pct - var_223.hpSmooth) * a; local sp = var_223.hpSmooth; local chunk = rectHeight * sp; local hpMax = library_flags["healthBar"] or Color3.fromRGB(0, 255, 0); local hpLow = library_flags["healthBarLow"] or Color3.fromRGB(255, 0, 0); var_223.healthbo.Position = UI_Library.round(rectMin + Vector2.new(-6, -1)); var_223.healthbo.Size = UI_Library.round(Vector2.new(4, rectHeight + 2)); var_223.healthb.Position = UI_Library.round(rectMin + Vector2.new(-5, rectHeight - chunk)); var_223.healthb.Size = UI_Library.round(Vector2.new(2, chunk)); var_223.healthb.Color = hpLow:Lerp(hpMax, sp)
							if isGradientHp then
								local segCount = var_223.healthSegCount; local sizePerSegment = math.ceil(rectHeight / segCount); local maxSegments = rectHeight / sizePerSegment + 1; local healthPos = var_223.healthb.Position
								for i = 1, segCount do
									local seg = var_223.healthSegs[i]; local projMinY = (i - 1) * sizePerSegment; local projMaxY = projMinY + sizePerSegment
									if projMinY > chunk then
										seg.Visible = false
									else
										seg.Visible = true; seg.Position = healthPos + Vector2.new(0, projMinY); seg.Size = Vector2.new(2, projMaxY - chunk > 0 and sizePerSegment - (projMaxY - chunk) or sizePerSegment); seg.Color = hpMax:Lerp(hpLow, i / maxSegments)
									end
								end
							else
								for i = 1, var_223.healthSegCount do
									var_223.healthSegs[i].Visible = false
								end
							end
							if library_flags["Health Number"] then
								local hn = var_223.healthNum; hn.Text = tostring(math.floor(sp * 100 + 0.5)); hn.Position = Vector2.new(var_223.healthbo.Position.X - hn.TextBounds.X / 2 - 2, var_223.healthb.Position.Y - hn.TextBounds.Y / 2); hn.Color = library_flags["healthNumberColor"] or Color3.fromRGB(0, 255, 0); hn.Visible = true
							else
								var_223.healthNum.Visible = false
							end
						else
							for i = 1, var_223.healthSegCount do
								var_223.healthSegs[i].Visible = false
							end
							var_223.healthNum.Visible = false
						end
						if val_591 then
							local barOffset = val_590 and 9 or 5; var_223.armorb.Position = UI_Library.round(rectMin + Vector2.new(-barOffset, rectHeight * (hasKevlar and 0 or 1) - 1)); var_223.armorb.Size = UI_Library.round(Vector2.new(2, hasKevlar and rectHeight + 2 or 0)); var_223.armorbo.Position = UI_Library.round(rectMin + Vector2.new(-barOffset, -1)); var_223.armorbo.Size = UI_Library.round(Vector2.new(2, rectHeight + 2)); var_223.armorb.Color = library_flags["armorBarColor"]
						end
					end 
					if val_589 then
						var_223.boxoutline.Position = UI_Library.round(rectMin); var_223.boxoutline.Size = UI_Library.round(rectSize); var_223.box.Position = UI_Library.round(rectMin); var_223.box.Size = UI_Library.round(rectSize); var_223.boxfill.Visible = library_flags["Box Fill"] and true or false
						if var_223.boxfill.Visible then
							local t = math.floor(var_223.box.Thickness / 2) + 1; var_223.boxfill.Position = var_223.box.Position + Vector2.new(t, t); var_223.boxfill.Size = var_223.box.Size - Vector2.new(t * 2, t * 2); var_223.boxfill.Color = library_flags["boxFillColor"] or Color3.fromRGB(255,255,255); local fillTrans = UI_Library.options["Box Fill"] and UI_Library.options["Box Fill"].trans or 0.5; var_223.boxfill.Transparency = math.clamp(1 - fillTrans, 0, 1)
						end
					else
						var_223.boxfill.Visible = false
					end 
					local _targetData = val_845[val_567.Name]
					if _targetData and _targetData.TargetESP then
						var_223.box.Color = library_flags["Target Box Color"]; var_223.text.Color = library_flags["Target Name Color"]; var_223.weapon.Color = library_flags["Target Weapon Color"]; var_223.tracer.Color = library_flags["Target Tracer Color"]; var_223.healthb.Color = library_flags["Target Health Bar Color"]
					else
						var_223.box.Color = library_flags["boxESPcolor"]; var_223.text.Color = library_flags["nameESPcolor"]; var_223.weapon.Color = library_flags["weaponESPcolor"]; var_223.tracer.Color = library_flags["tracersColor"]; var_223.healthb.Color = library_flags["healthBar"]
					end 
					if library_flags["Skeleton ESP"] and val_567 and val_567.Character then
						local char = val_567.Character; local skelColor = library_flags["skeletonColor"] or var_223.box.Color; local idx = 0
						for _, part in char:GetChildren() do
							if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart"
								and part.Name ~= "Gun" and part.Name ~= "BackC4" and part.Name ~= "HeadHB" then
								local weld = part:FindFirstChildOfClass("Motor6D")
								if weld and weld.Part0 and weld.Part1 then
									idx = idx + 1; local ln = var_223.skelLine(idx); local p0, v0 = val_749:WorldToViewportPoint(weld.Part0.Position); local p1, v1 = val_749:WorldToViewportPoint(weld.Part1.Position)
									if v0 and v1 then
										ln.From = Vector2.new(math.floor(p0.X), math.floor(p0.Y)); ln.To = Vector2.new(math.floor(p1.X), math.floor(p1.Y)); ln.Color = skelColor; ln.Visible = true
									else
										ln.Visible = false
									end
								end
							end
						end
						var_223.skelCount = idx
						for i = idx + 1, #var_223.skeleton do
							var_223.skeleton[i].Visible = false
						end
					else
						if var_223.skeleton then
							for var_32, var_94 in var_223.skeleton do
								var_94.Visible = false
							end
						end
					end
				else
					var_223.text.Visible = library_flags["Dropped Weapon ESP"]; var_223.text.Color = library_flags["dropESPcolor"]
				end 
				local val_580 = val_566 and var_101 or var_223.object.Name; local val_581 = library_flags["Outline"]; var_223.text.Position = Vector2.new(val_571.X, val_571.Y - 15); var_223.text.Font = fonts[val_578]; var_223.text.Outline = val_581; var_223.weapon.Position = UI_Library.round(Vector2.new(val_571.X, val_574.Y + 3)); var_223.weapon.Outline = val_581; var_223.weapon.Font = fonts[val_578]
				if val_566 and var_223.icon then
					local showIcon = library_flags["Weapon Icon ESP"] and true or false
					if showIcon and val_579 and val_579 ~= "" then
						if not env._wepIconCache then
							env._wepIconCache = {}
							pcall(function()
								local consts = getconstants(GetIcon.getWeaponOfKiller)
								for i = 1, #consts do
									local item = consts[i]
									if type(item) == "string" and item:find("rbxassetid://") then
										local prev = consts[i-1]
										if type(prev) == "string" then
											env._wepIconCache[prev] = item
										end
									end
								end
							end)
						end
						local iconData = env._wepIconCache[val_579]
						if iconData then
							var_223.icon.Image = iconData; local iconScale = library_flags["espIconScale"] or 40; local boxHeight = math.abs(val_574.Y - val_571.Y); local scaleFactor = math.clamp(boxHeight / 110, 0.4, 1.0); local w = (iconScale * 2.4) * scaleFactor; local h = iconScale * scaleFactor; var_223.icon.Size = UDim2.new(0, w, 0, h); var_223.icon.AnchorPoint = Vector2.new(0.5, 0); local yOffset = val_574.Y + 3
							if library_flags["Weapon ESP"] then yOffset = yOffset + 14 end
							var_223.icon.Position = UDim2.new(0, val_571.X, 0, yOffset); var_223.icon.ImageColor3 = library_flags["weaponESPcolor"] or Color3.fromRGB(255, 255, 255); var_223.icon.Visible = true
						else
							var_223.icon.Visible = false
						end
					else
						var_223.icon.Visible = false
					end
				end
				local armorText = ""
				if val_566 and val_567 and val_567:FindFirstChild("Kevlar") then
					local hasHelmet = val_567:FindFirstChild("Helmet") and true or false; armorText = hasHelmet and " [HK]" or " [K]"
				end
				local val_582 = library_flags["Text Mode"]; local _armorSuffix = library_flags["Armor ESP"] and armorText or ""; local _nameText = val_580 .. _armorSuffix
				if val_582 == "Upper" then
					var_223.text.Text = string.upper(_nameText); var_223.weapon.Text = string.upper(val_579)
				elseif val_582 == "Lower" then
					var_223.text.Text = string.lower(_nameText); var_223.weapon.Text = string.lower(val_579)
				else
					var_223.text.Text = _nameText; var_223.weapon.Text = val_579
				end
				if var_223.flags then
					if library_flags["Flags ESP"] and val_567 then
						local fl = {}; local ch = val_567.Character; local _sel = library_flags["flagsList"]
						local function _on(n) return (type(_sel) ~= "table") or _sel[n] end
						local hasKev = val_567:FindFirstChild("Kevlar") and val_567.Kevlar.Value > 0
						if hasKev then
							if val_567:FindFirstChild("Helmet") then if _on("Helmet") then fl[#fl+1] = "Helmet" end elseif _on("Armored") then fl[#fl+1] = "Armored" end
						elseif _on("Unarmored") then
							fl[#fl+1] = "Unarmored"
						end
						if _on("Defuser") and val_567:FindFirstChild("DefuseKit") then fl[#fl+1] = "Defuser" end
						if _on("Bomb") and workspace:FindFirstChild("Status") and workspace.Status:FindFirstChild("HasBomb") and workspace.Status.HasBomb.Value == val_567.Name then
							fl[#fl+1] = "Bomb"
						end
						if _on("Money") and val_567:FindFirstChild("Cash") then fl[#fl+1] = "$" .. tostring(val_567.Cash.Value) end
						if _on("Spent") and env.spentThisRound and env.spentThisRound[val_567.Name] and env.spentThisRound[val_567.Name] > 0 then
							fl[#fl+1] = "spent $" .. tostring(env.spentThisRound[val_567.Name])
						end
						if ch then
							local g = ch:FindFirstChild("Gun")
							if _on("Weapon") and g and g.Name ~= "" then fl[#fl+1] = g.Name end
							if _on("Scoped") and g and g:FindFirstChild("Scoped") and g:FindFirstChild("RifleThing") == nil then fl[#fl+1] = "Scoped" end
							if _on("Planting") and g and g:FindFirstChild("Planting") then fl[#fl+1] = "Planting" end
							local hum = ch:FindFirstChild("Humanoid")
							if _on("Slowed") and hum and hum.WalkSpeed and hum.WalkSpeed < 12 and hum.WalkSpeed > 0 then fl[#fl+1] = "Slowed" end
						end
						if #fl > 0 then
							var_223.flags.Text = table.concat(fl, "\n"); var_223.flags.Font = fonts[val_578]; var_223.flags.Outline = val_581; var_223.flags.Color = library_flags["flagsESPcolor"] or Color3.fromRGB(255, 255, 255); var_223.flags.Position = Vector2.new(val_571.X + val_576 / 2 + 6, val_571.Y); var_223.flags.Visible = true
						else
							var_223.flags.Visible = false
						end
					else
						var_223.flags.Visible = false
					end
				end
			else
				var_223.invis()
			end
		end
	else
		if not invissed then
			invissed = true 
			for var_8, var_7 in val_868 do
				var_7.invis()
			end
		end
	end 
	for var_18, var_76 in val_711:GetPlayers() do
		if alive(var_76) then
			env.oldPositions[var_76.Name] = var_76.Character.HumanoidRootPart.Position
		end 
		if library_flags["Resolve Angles"] then
			if teamCheck(var_76, val_762) and var_76.Character and var_76.Character:FindFirstChild("UpperTorso") and var_76.Character.UpperTorso:FindFirstChild("Waist") then
				var_76.Character.UpperTorso.Waist.C0 = CFrame.Angles(0, 0, 0)
			end
		end
	end 
	if library_flags["Grenade Area"] and workspace["Ray_Ignore"]:FindFirstChild("Fires") then
		for var_148, var_242 in workspace["Ray_Ignore"].Fires:GetChildren() do
			pcall(function()
				if not var_242:FindFirstChild("Part") then
					local val_593 = library_flags["areaColor"]; local val_594 = Instance.new("Part", var_242); local firePos = (var_242:IsA("BasePart") and var_242.Position) or (var_242:IsA("Model") and var_242:GetPivot().Position) or Vector3.new(0, 0, 0); val_594.Position = firePos; val_594.Color = Color3.fromRGB(val_593.R / 4, val_593.G / 4, val_593.B / 4); val_594.Size = Vector3.new(0.15, 1, 1); val_594.Shape = "Cylinder"; val_594.Material = "Neon"; val_594.Transparency = 0.5; val_594.Orientation = Vector3.new(0, 0, 90); val_594.CanCollide = false; val_594.Anchored = true; local val_595 = val_683:Create(val_594, TweenInfo.new(1.5), { Size = Vector3.new(0.15, 24, 24), Color = val_593 }); val_595:Play()
				end
			end)
		end
	end 
	pcall(function()
		env.wallclimbing = false
		if not (library_flags["Wallclimb"] or library_flags["Like Gecko"]) then return end
		local wcBind = UI_Library.options["Wallclimb Bind"]
		if wcBind and wcBind.key ~= "none" and not env.wcBindHeld then return end
		local char = val_733.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart"); local hum = char and char:FindFirstChild("Humanoid")
		if not hrp or not hum or hum.Health <= 0 then return end
		if hum:GetState() ~= Enum.HumanoidStateType.Freefall and hum.FloorMaterial ~= Enum.Material.Air then return end
		if val_671:GetFocusedTextBox() or not val_671:IsKeyDown(Enum.KeyCode.Space) then return end
		local now = tick()
		if now - (env.wcLast or 0) < 0.4 then return end
		local params = RaycastParams.new()
		params.FilterDescendantsInstances = { char, val_749 }
		params.FilterType = Enum.RaycastFilterType.Exclude
		local look = hrp.CFrame.LookVector; local right = hrp.CFrame.RightVector
		local lv = Vector3.new(look.X, 0, look.Z).Unit; local rv = Vector3.new(right.X, 0, right.Z).Unit
		local touching = false
		for _, base in { lv, -lv, rv, -rv } do
			for _, angle in { 0, 15, -15 } do
				local dir = angle == 0 and base or (CFrame.lookAt(Vector3.zero, base) * CFrame.Angles(0, math.rad(angle), 0)).LookVector
				if workspace:Raycast(hrp.Position + Vector3.new(0, 0.4, 0), dir * 2.5, params) or workspace:Raycast(hrp.Position - Vector3.new(0, 0.4, 0), dir * 2.5, params) then
					touching = true; break
				end
			end
			if touching then break end
		end
		if not touching then return end
		env.wcLast = now; env.wallclimbing = true; env.wcLastActive = now
		local vel = hrp.AssemblyLinearVelocity; hrp.AssemblyLinearVelocity = Vector3.new(vel.X, 17, vel.Z)
		local controller = env.MovementController
		if controller and controller.CharacterAnimator then
			pcall(function() controller.CharacterAnimator:play("Jump", 0.1) end)
		end
	end)
	val_872 = getWeaponInfo()
	local wcBlocking = env.wallclimbing or tick() - (env.wcLastActive or 0) < 0.25
	if library_flags["Bunny Hop"] and val_872.alive and not val_858 and not wcBlocking then
		local val_596 = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart"); local val_598 = val_818; local val_599; local val_600 
		if val_596 then
			val_599 = val_733.Character.HumanoidRootPart.CFrame.LookVector; val_600 = val_596.Position
		end 
		if library_flags["Override Game Movement"] and not edgebugDebounce then
			return
		end 
		local hum = val_733.Character:FindFirstChild("Humanoid")
		if not val_671:GetFocusedTextBox() and val_596 and val_671:IsKeyDown(Enum.KeyCode.Space) and hum and hum:GetState() ~= Enum.HumanoidStateType.Climbing then
			val_852 = true; local baseSpeed = library_flags["Speed Value"] or 50
			if not env.bhopSpeed then env.bhopSpeed = baseSpeed end
			if env.bhopSpeed < baseSpeed then env.bhopSpeed = baseSpeed end
			local isAutoHop = (library_flags["Bunny Hop Method"] == "Auto Hop"); local strafing = false
			if library_flags["Auto Strafe"] and isAutoHop then
				local hum = val_733.Character.Humanoid; local state = hum:GetState()
				if state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Jumping then
					local mouseDelta = val_671:GetMouseDelta()
					if math.abs(mouseDelta.X) > 0.5 then
						strafing = true
						if isAutoHop then
							local rawGain = math.abs(mouseDelta.X) * 0.005; local clampedGain = math.min(rawGain, 0.15); env.bhopSpeed = math.min(env.bhopSpeed + clampedGain, baseSpeed + 25); local camLook = val_749.CFrame.LookVector; local rightVec = Vector3.new(-camLook.Z, 0, camLook.X); local strafeDir = mouseDelta.X > 0 and rightVec or -rightVec; local currentVel = val_596.AssemblyLinearVelocity; local currentVelXZ = Vector3.new(currentVel.X, 0, currentVel.Z); local newVelXZ = currentVelXZ + (strafeDir * 1.5)
							if newVelXZ.Magnitude > 0 then
								newVelXZ = newVelXZ.Unit * env.bhopSpeed
							end
							val_596.AssemblyLinearVelocity = Vector3.new(newVelXZ.X, currentVel.Y, newVelXZ.Z)
						else
							local camLook = val_749.CFrame.LookVector; local rightVec = Vector3.new(-camLook.Z, 0, camLook.X); local strafeDir = mouseDelta.X > 0 and rightVec or -rightVec; local currentVel = val_596.AssemblyLinearVelocity; val_596.AssemblyLinearVelocity = Vector3.new(
								currentVel.X + strafeDir.X * 0.7, currentVel.Y, currentVel.Z + strafeDir.Z * 0.7
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
			local val_601 = isAutoHop and env.bhopSpeed or baseSpeed
			if library_flags["Bunny Hop Method"] == "CFrame" or library_flags["Bunny Hop Method"] == "Velocity" then
				val_598 = val_671:IsKeyDown(Enum.KeyCode.W) and val_598 + val_599 or val_598; val_598 = val_671:IsKeyDown(Enum.KeyCode.S) and val_598 - val_599 or val_598; val_598 = val_671:IsKeyDown(Enum.KeyCode.D) and val_598 + Vector3.new(- val_599.Z, 0, val_599.X) or val_598; val_598 = val_671:IsKeyDown(Enum.KeyCode.A) and val_598 + Vector3.new(val_599.Z, 0, - val_599.X) or val_598 
				if library_flags["Bunny Hop Method"] == "CFrame" and val_598 ~= val_818 then
					local cfSpeed = val_601 / 300; val_598 = val_598.Unit; val_733.Character.HumanoidRootPart.CFrame = val_733.Character.HumanoidRootPart.CFrame + Vector3.new(val_598.X * cfSpeed, 0, val_598.Z * cfSpeed); val_733.Character.Humanoid.Jump = true; return
				end 
				if not strafing then
					local val_602 = val_671:IsKeyDown(Enum.KeyCode.S) or val_671:IsKeyDown(Enum.KeyCode.D) or val_671:IsKeyDown(Enum.KeyCode.A)
					if val_598.Unit.X == val_598.Unit.X and not library_flags["Auto Strafe"] or val_598.Unit.X == val_598.Unit.X and library_flags["Auto Strafe"] and val_602 then
						val_598 = val_598.Unit; val_596.AssemblyLinearVelocity = Vector3.new(val_598.X * val_601, val_596.AssemblyLinearVelocity.Y, val_598.Z * val_601)
					elseif library_flags["Auto Strafe"] and not val_671:IsKeyDown(Enum.KeyCode.S) and not val_671:IsKeyDown(Enum.KeyCode.D) and not val_671:IsKeyDown(Enum.KeyCode.A) then
						val_598 = val_598 + val_599; val_598 = val_598.Unit; val_596.AssemblyLinearVelocity = Vector3.new(val_598.X * val_601, val_596.AssemblyLinearVelocity.Y, val_598.Z * val_601); val_733.Character.Humanoid:MoveTo(val_600 + val_599)
					end 
				end
				last = val_596.AssemblyLinearVelocity
			elseif library_flags["Bunny Hop Method"] == "A/D" then
				local currentVel = val_596.AssemblyLinearVelocity; local flatVel = Vector3.new(currentVel.X, 0, currentVel.Z); local camCF = val_749.CFrame; local look = camCF.LookVector; local right = camCF.RightVector; local flatLook = Vector3.new(look.X, 0, look.Z).Unit; local flatRight = Vector3.new(right.X, 0, right.Z).Unit; local baseSpeed = library_flags["Speed Value"] or 50
				if not env.adBhopSpeed or env.adBhopSpeed < baseSpeed then
					env.adBhopSpeed = baseSpeed
				end
				local isA = val_671:IsKeyDown(Enum.KeyCode.A); local isD = val_671:IsKeyDown(Enum.KeyCode.D); local isW = val_671:IsKeyDown(Enum.KeyCode.W); local isS = val_671:IsKeyDown(Enum.KeyCode.S); local moveDir = flatLook
				if isW then moveDir = flatLook end
				if isS then moveDir = -flatLook end
				local currentDir = flatVel.Magnitude > 2 and flatVel.Unit or moveDir; local turnRate = 0.15
				if isA then
					currentDir = (currentDir - flatRight * turnRate).Unit; env.adBhopSpeed = math.min(env.adBhopSpeed + 1.2, baseSpeed * 2.5)
				elseif isD then
					currentDir = (currentDir + flatRight * turnRate).Unit; env.adBhopSpeed = math.min(env.adBhopSpeed + 1.2, baseSpeed * 2.5)
				else
					env.adBhopSpeed = math.max(env.adBhopSpeed - 0.4, baseSpeed)
				end
				local newVel = currentDir * env.adBhopSpeed; val_596.AssemblyLinearVelocity = Vector3.new(newVel.X, currentVel.Y, newVel.Z); val_733.Character.Humanoid.Jump = true; last = val_596.AssemblyLinearVelocity
			elseif library_flags["Bunny Hop Method"] == "Directional" or library_flags["Bunny Hop Method"] == "Directional 2" or library_flags["Bunny Hop Method"] == "Gyro" then
				local add = 0; local keyHeld = false
				if library_flags["Bunny Hop Method"] == "Directional" or library_flags["Bunny Hop Method"] == "Directional 2" then
					if val_671:IsKeyDown(Enum.KeyCode.W) or val_671:IsKeyDown(Enum.KeyCode.A) or val_671:IsKeyDown(Enum.KeyCode.S) or val_671:IsKeyDown(Enum.KeyCode.D) then keyHeld = true end
					if val_671:IsKeyDown(Enum.KeyCode.A) then add = 90 end
					if val_671:IsKeyDown(Enum.KeyCode.S) then add = 180 end
					if val_671:IsKeyDown(Enum.KeyCode.D) then add = 270 end
					if val_671:IsKeyDown(Enum.KeyCode.A) and val_671:IsKeyDown(Enum.KeyCode.W) then add = 45 end
					if val_671:IsKeyDown(Enum.KeyCode.D) and val_671:IsKeyDown(Enum.KeyCode.W) then add = 315 end
					if val_671:IsKeyDown(Enum.KeyCode.D) and val_671:IsKeyDown(Enum.KeyCode.S) then add = 225 end
					if val_671:IsKeyDown(Enum.KeyCode.A) and val_671:IsKeyDown(Enum.KeyCode.S) then add = 145 end
				end
				val_733.Character.Humanoid.Jump = true
				if not strafing and (not keyHeld and library_flags["Bunny Hop Method"] == "Directional_OLD") then
				elseif not strafing then
					local camCF = val_749.CFrame; local _, camY, _ = camCF:ToOrientation(); local rot = CFrame.new(camCF.Position) * CFrame.Angles(0, camY, 0) * CFrame.Angles(0, math.rad(add), 0); local currentFlatSpeed = Vector3.new(val_596.AssemblyLinearVelocity.X, 0, val_596.AssemblyLinearVelocity.Z).Magnitude; local appliedSpeed = math.max(currentFlatSpeed, val_601)
					if not surfing and not env.pixelSurfTouching then
						if library_flags["Bunny Hop Method"] == "Gyro" or (library_flags["Bunny Hop Method"] == "Directional" and keyHeld) then
							if not env.bhopGyro or not pcall(function() return env.bhopGyro.Parent end) then
								env.bhopGyro = Instance.new("BodyVelocity"); env.bhopGyro.Parent = val_733.Character:FindFirstChild("UpperTorso") or val_596
							end
							local bv = env.bhopGyro; bv.MaxForce = Vector3.new(500000, 0, 500000); bv.Velocity = Vector3.new(rot.LookVector.X, 0, rot.LookVector.Z) * appliedSpeed
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
							val_596.AssemblyLinearVelocity = Vector3.new(rot.LookVector.X * appliedSpeed, val_596.AssemblyLinearVelocity.Y, rot.LookVector.Z * appliedSpeed)
						end
					else
					    if env.bhopGyro then
					        pcall(function() env.bhopGyro:Destroy() end)
					        env.bhopGyro = nil
					    end
					end
				end
				last = val_596.AssemblyLinearVelocity
			end 
			val_733.Character.Humanoid.Jump = true
		else
			if val_852 and library_flags["Maintain Velocity"] then
				local val_603 = 0; val_858 = true 
				repeat
					wait(); val_603 = val_603 + 1; local val_604 = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart")
					if val_604 then
						val_604.AssemblyLinearVelocity = Vector3.new(last.X, val_604.AssemblyLinearVelocity.Y, last.Z)
					end
				until not val_872.alive or val_671:IsKeyDown(Enum.KeyCode.Space) or val_733.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall or val_733.Character.Humanoid:GetState() == Enum.HumanoidStateType.Landed or val_603 == 15 
				last = Vector3.new(); val_858 = false; env.longJumpDebounce = false
			end 
			val_852 = false
		end
	end 
	pcall(function()
		local uis = game:GetService("UserInputService")
		if library_flags["Jetpack"] and env.jetpackBindHeld then
			local hrp = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local speedLimit = library_flags["jetpackSpeed"] or 35; local currentY = hrp.AssemblyLinearVelocity.Y
				if currentY < 0 then currentY = 0 end
				hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, math.min(currentY + 1.2, speedLimit), hrp.AssemblyLinearVelocity.Z)
			end
		end
		local isMoveHeld = uis:IsKeyDown(Enum.KeyCode.W) or uis:IsKeyDown(Enum.KeyCode.S) or (library_flags["Auto Pixel Surf"] and (uis:IsKeyDown(Enum.KeyCode.A) or uis:IsKeyDown(Enum.KeyCode.D))); local isBindHeld = env.surfingBindHeld; local hum = val_733.Character and val_733.Character:FindFirstChild("Humanoid"); local hrp = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart"); local isInAir = hum and (hum:GetState() == Enum.HumanoidStateType.Freefall or hum:GetState() == Enum.HumanoidStateType.Jumping or hum.FloorMaterial == Enum.Material.Air); local autoSurfAllowed = library_flags["Auto Pixel Surf"] and isInAir; local bv = hrp and hrp:FindFirstChild("PixelSurfVelocity")
		if hrp and not bv then
			bv = Instance.new("BodyVelocity"); bv.Name = "PixelSurfVelocity"; bv.MaxForce = Vector3.new(0, 0, 0); bv.Parent = hrp
		end
		if library_flags["Pixelsurf"] and (isBindHeld or autoSurfAllowed) and isMoveHeld and isInAir and val_872.alive and hrp and bv then
			local wallPart, wallNormal, wallPos = findWallHit(); env.pixelSurfTouching = wallPart ~= nil
			if wallPart and wallNormal then
			    surfing = true 
				if lastWallNormal and wallNormal:Dot(lastWallNormal) < 0.9 then
					surfing = false; bv.MaxForce = Vector3.new(0, 0, 0); lastWallNormal = nil; env.pixelSurfTouching = false; return
				end
				lastWallNormal = wallNormal; local pspeed = library_flags["pspeed"] or 18; local moveDir = hum.MoveDirection; local horizNormal = Vector3.new(wallNormal.X, 0, wallNormal.Z).Unit; local vel = hrp.AssemblyLinearVelocity; local horizVel = Vector3.new(vel.X, 0, vel.Z); local glideDir = Vector3.new(0,0,0)
				if moveDir.Magnitude > 0.1 then
					local horizMove = Vector3.new(moveDir.X, 0, moveDir.Z).Unit; local projected = horizMove - horizNormal * horizMove:Dot(horizNormal)
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
				bv.Velocity = Vector3.new(glideDir.X * pspeed, 0, glideDir.Z * pspeed); bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			else
				bv.MaxForce = Vector3.new(0, 0, 0); lastWallNormal = nil; env.pixelSurfTouching = false
			end
		else
			surfing = false 
			if bv then
				bv.MaxForce = Vector3.new(0, 0, 0)
			end
			lastWallNormal = nil; env.pixelSurfTouching = false
		end
	end)
	if library_flags["Long Jump"] and val_872.alive then
		local hrp = val_733.Character and val_733.Character:FindFirstChild("HumanoidRootPart"); local hum = val_733.Character and val_733.Character:FindFirstChild("Humanoid")
		if hrp and hum then
			local state = hum:GetState(); local params = RaycastParams.new()
			params.FilterDescendantsInstances = {val_733.Character}
			params.FilterType = Enum.RaycastFilterType.Exclude; local hit = workspace:Raycast(hrp.Position, Vector3.new(0, -3.2, 0), params); local inAir = (not hit) or state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Jumping
			if env.longJumpHold and inAir then
				local ljStuds = library_flags["longJumpStuds"] or 5; local dir = hum.MoveDirection
				if dir.Magnitude == 0 then
					local flatVel = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
					if flatVel.Magnitude > 0.1 then
						dir = flatVel.Unit
					end
				end
				if dir.Magnitude > 0 then
					local ljSpeed = ljStuds * 3; local now = tick(); local dt = (env.lastLJTick and (now - env.lastLJTick) < 0.1) and (now - env.lastLJTick) or (1/60); env.lastLJTick = now; hrp.CFrame = hrp.CFrame + Vector3.new(dir.X * ljSpeed, 0, dir.Z * ljSpeed) * dt; env.lastLongJumpTime = tick()
				end
			end
			local bv = hrp:FindFirstChild("LJ_BodyVelocity")
			if bv then bv:Destroy() end
		end
	end 
	if val_872.alive and library_flags["Old Gun Sounds"] then
		replaceAudio(val_872.name)
	end 
	env.silentAimEnabled = val_872.alive and not val_872.melee and val_872.silentAim 
	if val_671:IsMouseButtonPressed(0) and env.silentAimEnabled then
		if not env.silentMouseDown then
			env.silentMouseDown = true; local chance = val_872.hitchance or 100
			env.silentRollPassed = (chance >= 100) or (math.random(1, 100) <= chance)
		end
		local val_606, val_607 = getNearest(val_872.silentFOV or 0, val_767, library_flags["legitVisOnly"]); local dz = (val_872.deadzone or 0) * 2.3; local fovPx = (val_872.silentFOV or 0) * 3; env.targetPosition = nil
		if val_606 and val_607 > dz and val_607 <= fovPx and env.silentRollPassed then
			env.target = getSilentTargetPart(val_606.Character)
		else
			env.target = nil
		end
	else
		env.silentMouseDown = false; env.target = nil
	end 
	if val_872.alive and val_662.Weapons:FindFirstChild(val_733.Character.EquippedTool.Value) then
		local val_608 = val_662.Weapons:FindFirstChild(val_733.Character.EquippedTool.Value)
		if val_608:FindFirstChild("Melee") then
			val_309 = true
		elseif val_309 and not knifeDebounce then
			knifeDebounce = true 
			CreateThread(function()
				wait(0.05); val_309 = false; knifeDebounce = false
			end)
		end
	end 
	env.holdE = not val_671:GetFocusedTextBox() and val_671:IsKeyDown(Enum.KeyCode.E)
	if library_flags["No Crouch Cooldown"] then
		val_757.crouchcooldown = 0
	end 
	if library_flags["Remove Radio Commands"] then
		val_733.PlayerGui.GUI.SuitZoom.Visible = false
	end 
	if library_flags["Remove Recoil"] then
		val_757.RecoilX = 0.1; val_757.RecoilY = 0.1
	end 
	if val_872.alive then
		val_733.Character.Humanoid.AutoRotate = true 
	end 
	if val_872.alive then
		local val_610 = not val_872.melee and library_flags["FOV Circle"] and library_flags["aimbotEnabled"]; val_383.Radius = (val_872.FOV or 0) * 3; val_383.Position = val_610 and library_flags["aimbotEnabled"] and Vector2.new(val_749.ViewportSize.X / 2, val_749.ViewportSize.Y / 2) or Vector2.new(-2000, -2000); val_388.Radius = (val_872.silentFOV or 0) * 3; val_388.Position = val_610 and val_872.silentAim and Vector2.new(val_749.ViewportSize.X / 2, val_749.ViewportSize.Y / 2) or Vector2.new(-2000, -2000)
	end
end)
;(function()
FiremanConfig = { climbSpeed = 38, boostForce = 15, upwardBoost = 3, cooldown = 0.2 }
LadderBugConfig = { launch = 55, minSpeed = 16, maxClimbFrames = 15, stuckFrames = 10, regrabDelay = 0.4 }
function movementRayParams(char)
	local params = RaycastParams.new()
	params.FilterDescendantsInstances = { char, val_749, workspace:FindFirstChild("Ray_Ignore"), workspace:FindFirstChild("Debris") }
	params.FilterType = Enum.RaycastFilterType.Exclude; params.RespectCanCollide = true
	return params
end
function setCrouch(char, state)
	local existing = char:FindFirstChild("Crouched")
	if state and not existing then
		local marker = Instance.new("IntValue"); marker.Name = "Crouched"; marker:SetAttribute("clarity", true); marker.Parent = char
		if env.GunState then env.GunState.crouched = true end
	elseif not state and existing and existing:GetAttribute("clarity") ~= nil then
		existing:Destroy()
		if env.GunState then env.GunState.crouched = false end
	end
end
env.runService.Heartbeat:Connect(function()
	local char = val_733.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart"); local hum = char and char:FindFirstChild("Humanoid")
	if not hrp or not hum or hum.Health <= 0 then env.autoDucking = false; return end
	local grounded = hum.FloorMaterial ~= Enum.Material.Air
	local vel = hrp.AssemblyLinearVelocity; local flat = Vector3.new(vel.X, 0, vel.Z)
	if library_flags["Edge Jump"] and env.ejBindHeld and grounded and flat.Magnitude > 4 then
		local ahead = hrp.Position + flat.Unit * math.clamp(flat.Magnitude * 0.12, 1.5, 5)
		if not workspace:Raycast(ahead, Vector3.new(0, -6, 0), movementRayParams(char)) then
			hum.Jump = true; env.lastEdgeJumpTime = tick()
		end
	end
	if library_flags["Auto Duck"] and env.adBindHeld and not grounded and flat.Magnitude > 1 then
		local feet = hrp.Position.Y - 3; local params = movementRayParams(char)
		local probe = hrp.Position + flat.Unit * 3.5
		local ledge = workspace:Raycast(probe + Vector3.new(0, 6, 0), Vector3.new(0, -12, 0), params)
		if ledge and ledge.Position.Y > feet + 0.2 and ledge.Position.Y < feet + 3.5 then
			setCrouch(char, true); env.autoDucking = true; env.lastAutoDuckTime = tick()
		end
	elseif env.autoDucking and grounded then
		setCrouch(char, false); env.autoDucking = false
	end
end)
env.runService.Heartbeat:Connect(function()
	local char = val_733.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart"); local hum = char and char:FindFirstChild("Humanoid")
	if not (library_flags["Ladder Bug"] and env.lbBindHeld) or not hrp or not hum or hum.Health <= 0 then
		env.lbFrames = 0; env.ladderBugActive = false; return
	end
	local vel = hrp.AssemblyLinearVelocity
	if hum:GetState() ~= Enum.HumanoidStateType.Climbing then
		env.lbFrames = 0; env.ladderBugActive = false; env.lbApproach = Vector3.new(vel.X, 0, vel.Z); env.lbLastZ = nil
		return
	end
	env.ladderBugActive = true; env.lbFrames = (env.lbFrames or 0) + 1
	local held = env.lbLastZ ~= nil and math.abs(vel.Y - env.lbLastZ) < 0.01 and vel.Y > 0
	env.lbLastZ = vel.Y
	if not held and env.lbFrames <= LadderBugConfig.maxClimbFrames then return end
	local flat = env.lbApproach or Vector3.new(vel.X, 0, vel.Z)
	if flat.Magnitude < 0.1 then flat = hrp.CFrame.LookVector * Vector3.new(1, 0, 1) end
	if flat.Magnitude > 0 then flat = flat.Unit * math.max(flat.Magnitude, LadderBugConfig.minSpeed) end
	hrp.AssemblyLinearVelocity = Vector3.new(flat.X, math.max(vel.Y, LadderBugConfig.launch), flat.Z)
	env.lbFrames = 0; env.lbLastZ = nil; env.lastLadderBugTime = tick()
	hum:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
	task.delay(LadderBugConfig.regrabDelay, function()
		pcall(function() hum:SetStateEnabled(Enum.HumanoidStateType.Climbing, true) end)
	end)
end)
isOnLadder = false; wasOnLadder = false
lastCooldown = 0
canBoost = false
local function detectLadder(pos)
    local plr = game.Players.LocalPlayer; local char = plr.Character
    if not char then return false end
    local hum = char:FindFirstChild("Humanoid")
    if not hum then return false end
    return hum:GetState() == Enum.HumanoidStateType.Climbing
end
spaceJustPressed = false
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
	if gpe then return end
	pcall(function()
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if library_flags["PixelSetterToggle"] and isBindDown("Pixel Setter Bind") then
				currentType = "pixel"
			elseif library_flags["HeadbounceSetterToggle"] and isBindDown("Headbounce Setter Bind") then
				currentType = "headbounce"
			else
				return
			end

			if drawingState == 0 then
				point1 = mouse.Hit.Position
				drawingState = 1
				currentPreview = Instance.new("Part")
				currentPreview.Anchored = true
				currentPreview.CanCollide = false
				currentPreview.Material = Enum.Material.ForceField
				currentPreview.Color = currentType == "pixel" and Color3.new(1,1,1) or Color3.new(0,0,0)
				currentPreview.Parent = env.CustomSettersFolder
			elseif drawingState == 1 then
				local point2 = mouse.Hit.Position
				drawingState = 0
				if currentPreview then
					currentPreview.CanCollide = true
					currentPreview.Material = Enum.Material.SmoothPlastic
					currentPreview.Transparency = 0.5
					currentPreview.Name = currentType == "pixel" and "CustomPixelSurf" or "CustomHeadbounce"
					
					local dist = (point1 - point2).Magnitude
					if currentType == "pixel" then
						currentPreview.Size = Vector3.new(2, 0.05, dist)
						if dist > 0.1 then
							currentPreview.CFrame = CFrame.lookAt(point1, point2) * CFrame.new(0, 0, -dist/2)
						end
					else
						local flatP2 = Vector3.new(point2.X, point1.Y, point2.Z)
						local dist2 = (point1 - flatP2).Magnitude
						currentPreview.Size = Vector3.new(3, 1, dist2)
						if dist2 > 0.1 then
							currentPreview.CFrame = CFrame.lookAt(point1, flatP2) * CFrame.new(0, 0, -dist2/2)
						end
					end
					currentPreview = nil
				end
			end
		end
	end)
end)
local function getClosestEnemy()
    local localPlr = game.Players.LocalPlayer; local localChar = localPlr.Character
    if not localChar then return nil end
    local localHrp = localChar:FindFirstChild("HumanoidRootPart")
    if not localHrp then return nil end
    local closest = nil; local minDist = math.huge
    for _, plr in game.Players:GetPlayers() do
        if plr ~= localPlr and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart"); local hum = plr.Character:FindFirstChild("Humanoid")
            if hrp and hum and hum.Health > 0 then
                local dist = (localHrp.Position - hrp.Position).Magnitude
                if dist < minDist then
                    minDist = dist; closest = plr
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
            local char = game.Players.LocalPlayer.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart"); local hitboxes = enemy.Character:FindFirstChild("Hitboxes"); local targetHead = (hitboxes and hitboxes:FindFirstChild("HeadHB")) or enemy.Character:FindFirstChild("HeadHB") or enemy.Character:FindFirstChild("Head") or enemy.Character:FindFirstChild("HumanoidRootPart")
            if hrp and targetHead then
                wasRiding = true; hrp.CFrame = CFrame.new(targetHead.Position + Vector3.new(0, 2.6, 0)) * (hrp.CFrame - hrp.CFrame.Position); hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        else
            wasRiding = false
        end
    else
        if wasRiding then
            wasRiding = false; local char = game.Players.LocalPlayer.Character; local hrp = char and char:FindFirstChild("HumanoidRootPart"); local hum = char and char:FindFirstChild("Humanoid")
            if hrp and hum then
                local dir = hum.MoveDirection
                if dir.Magnitude < 0.1 then dir = hrp.CFrame.LookVector * Vector3.new(1,0,1) end
                if dir.Magnitude > 0 then dir = dir.Unit end
                hrp.AssemblyLinearVelocity = dir * 45 + Vector3.new(0, 22, 0)
            end
        end
    end
    local plr = game.Players.LocalPlayer; local char = plr.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart"); local hum = char and char:FindFirstChild("Humanoid")
    if not (library_flags["Fireman"] and env.fmActiveHold) or not hrp or not hum then
        canBoost = false; isOnLadder = false; wasOnLadder = false; env.fmOnLadder = false; env.fmCarry = nil; return
    end
    wasOnLadder = isOnLadder; isOnLadder = detectLadder(); local vel = hrp.AssemblyLinearVelocity
    local flatSpeed = Vector3.new(vel.X, 0, vel.Z).Magnitude
    if isOnLadder then
        if not wasOnLadder then
            env.fmCarry = math.max(env.fmApproachSpeed or 0, flatSpeed)
        end
        local dir = hum.MoveDirection; local flat = Vector3.new(dir.X, 0, dir.Z)
        local carry = env.fmCarry or 0
        local horizontal = flat.Magnitude > 0.1 and flat.Unit * math.max(carry, 16) or Vector3.zero
        local climb = 0
        if vel.Y > 0.1 then
            climb = FiremanConfig.climbSpeed
        elseif vel.Y < -0.1 then
            climb = -FiremanConfig.climbSpeed
        end
        hrp.AssemblyLinearVelocity = Vector3.new(horizontal.X, climb, horizontal.Z)
        env.fmOnLadder = true; canBoost = true
    else
        env.fmOnLadder = false; env.fmApproachSpeed = flatSpeed
        if wasOnLadder and canBoost and tick() - lastCooldown > FiremanConfig.cooldown then
            lastCooldown = tick(); canBoost = false
            local dir = hum.MoveDirection
            if dir.Magnitude < 0.1 then dir = hrp.CFrame.LookVector * Vector3.new(1, 0, 1) end
            if dir.Magnitude > 0 then dir = dir.Unit end
            local exit = math.max(flatSpeed + FiremanConfig.boostForce, env.fmCarry or 0)
            hrp.AssemblyLinearVelocity = Vector3.new(dir.X * exit, vel.Y < 0 and FiremanConfig.upwardBoost or 15, dir.Z * exit); env.fmTriggered = true; env.fmCarry = nil
            task.delay(0.5, function() env.fmTriggered = false end)
        end
    end
end)
end)() 
;(function()
	local RS = game:GetService("RunService"); local hitRemote = val_776; local localPlr = val_733; local players = val_711; local cam = val_749
	RS.Heartbeat:Connect(function()
		local loopKills = library_flags["PlayerLoopKills"]; local hasLoopKill = false
		if loopKills then
			for k, v in loopKills do
				if v then hasLoopKill = true; break end
			end
		end
		local killAll = library_flags["KillAllAuto"]
		if not killAll and not hasLoopKill then return end
		local char = localPlr.Character
		if not char then return end
		local hum = char:FindFirstChild("Humanoid")
		if not hum or hum.Health <= 0 then return end
		local gun = char:FindFirstChild("Gun"); local eqTool = char:FindFirstChild("EquippedTool")
		if not gun or not eqTool then return end
		local gunName = "AWP"; local gunRef = gun; local rsWeapons = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons"); local awpFolder = rsWeapons and rsWeapons:FindFirstChild("AWP")
		if awpFolder then gunRef = awpFolder end
		local camPos = cam.CFrame.p; local srvTime = workspace:GetServerTimeNow(); local burstCount = 3; local nanBypass = true
		for _, plr in players:GetPlayers() do
			if plr == localPlr then continue end
			local isLk = loopKills and loopKills[plr.Name]
			if not isLk then
				if not killAll then continue end
				if not teamCheck(plr, val_772) then continue end
			end
			local pChar = plr.Character
			if not pChar then continue end
			local hitboxes = pChar:FindFirstChild("Hitboxes"); local head = (hitboxes and hitboxes:FindFirstChild("HeadHB")) or pChar:FindFirstChild("HeadHB") or pChar:FindFirstChild("Head"); local pHum = pChar:FindFirstChild("Humanoid")
			if not head or not pHum or pHum.Health <= 0 then continue end
			for burst = 1, burstCount do
				pcall(function()
					local posArg = nanBypass and {X = 0/0, Y = 0/0, Z = 0/0} or encodePos(head.Position); hitRemote:FireServer(
						head, posArg, gunName, 4096, gunRef, nil, 1, false, true, camPos, srvTime, Vector3.new(0, 1, 0), true, true, true, true, true, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
					)
				end)
			end
		end
	end)
end)() 
;(function()
WatermarkGui = Instance.new("ScreenGui"); WatermarkGui.Name = "NativeWatermark"; WatermarkGui.ResetOnSpawn = false; WatermarkGui.IgnoreGuiInset = true; WatermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function()
	if syn and syn.protect_gui then
		syn.protect_gui(WatermarkGui)
	end
end)
WatermarkGui.Parent = game:GetService("CoreGui"); WatermarkGui.Enabled = library_flags and library_flags["configWatermark"] or false
if WatermarkGui.Enabled then
	pcall(function()
		local perf = val_733.PlayerGui:FindFirstChild("Performance")
		if perf and perf:IsA("ScreenGui") then
			perf.Enabled = false
		end
	end)
	pcall(function()
		game:GetService("GuiService"):SetStatsItemEnabled("FPS", false); game:GetService("GuiService"):SetStatsItemEnabled("Ping", false)
	end)
end
task.spawn(function()
	local Container = Instance.new("Frame"); Container.Name = "Container"; Container.BackgroundColor3 = Color3.fromRGB(15, 15, 15); Container.BackgroundTransparency = 0.05; Container.AnchorPoint = Vector2.new(1, 0); Container.Position = UDim2.new(1, -15, 0, 30); Container.AutomaticSize = Enum.AutomaticSize.X; Container.Size = UDim2.new(0, 0, 0, 26)
	Container.ClipsDescendants = true
	Container.Parent = WatermarkGui; local Corner = Instance.new("UICorner"); Corner.CornerRadius = UDim.new(0, 4); Corner.Parent = Container; local Stroke = Instance.new("UIStroke"); Stroke.Color = Color3.fromRGB(45, 45, 45); Stroke.Thickness = 1; Stroke.Parent = Container; local LogoBG = Instance.new("ImageLabel"); LogoBG.Name = "LogoBG"; LogoBG.BackgroundTransparency = 1; LogoBG.Size = UDim2.new(0, 46, 0, 46); LogoBG.Position = UDim2.new(0, 0, 0.5, 0); LogoBG.AnchorPoint = Vector2.new(0, 0.5); LogoBG.Image = "rbxassetid://133384875688188"; LogoBG.ImageColor3 = Color3.fromRGB(30, 160, 30); LogoBG.ImageTransparency = 0.75; LogoBG.ZIndex = 0; LogoBG.Parent = Container; local Content = Instance.new("Frame"); Content.Name = "Content"; Content.BackgroundTransparency = 1; Content.Size = UDim2.new(0, 0, 1, 0); Content.AutomaticSize = Enum.AutomaticSize.X; Content.Parent = Container; local Padding = Instance.new("UIPadding"); Padding.PaddingLeft = UDim.new(0, 8); Padding.PaddingRight = UDim.new(0, 8); Padding.Parent = Content; local Layout = Instance.new("UIListLayout"); Layout.FillDirection = Enum.FillDirection.Horizontal; Layout.SortOrder = Enum.SortOrder.LayoutOrder; Layout.VerticalAlignment = Enum.VerticalAlignment.Center; Layout.Padding = UDim.new(0, 6); Layout.Parent = Content; local T_Clarity = Instance.new("TextLabel"); T_Clarity.Name = "clarity"; T_Clarity.BackgroundTransparency = 1; T_Clarity.AutomaticSize = Enum.AutomaticSize.XY; T_Clarity.Text = "clarity"; T_Clarity.TextColor3 = Color3.fromRGB(30, 255, 30); T_Clarity.Font = Enum.Font.GothamBold; T_Clarity.TextSize = 13; T_Clarity.LayoutOrder = 1; T_Clarity.ZIndex = 2; T_Clarity.Parent = Content; local Sep1 = Instance.new("Frame"); Sep1.Name = "Sep1"; Sep1.Size = UDim2.new(0, 1, 0, 12); Sep1.BackgroundColor3 = Color3.fromRGB(60, 60, 60); Sep1.BorderSizePixel = 0; Sep1.LayoutOrder = 2; Sep1.Parent = Content; local pName = "user"; local T_User = Instance.new("TextLabel"); T_User.Name = "user"; T_User.BackgroundTransparency = 1; T_User.AutomaticSize = Enum.AutomaticSize.XY; T_User.Text = pName; T_User.TextColor3 = Color3.fromRGB(180, 180, 180); T_User.Font = Enum.Font.GothamSemibold; T_User.TextSize = 13; T_User.LayoutOrder = 3; T_User.Parent = Content; local Sep2 = Instance.new("Frame"); Sep2.Name = "Sep2"; Sep2.Size = UDim2.new(0, 1, 0, 12); Sep2.BackgroundColor3 = Color3.fromRGB(60, 60, 60); Sep2.BorderSizePixel = 0; Sep2.LayoutOrder = 4; Sep2.Parent = Content; local T_FPS = Instance.new("TextLabel"); T_FPS.Name = "FPS"; T_FPS.BackgroundTransparency = 1; T_FPS.AutomaticSize = Enum.AutomaticSize.XY; T_FPS.RichText = true; T_FPS.Text = "<b>0</b> <font color=\"#AAAAAA\">fps</font>"; T_FPS.TextColor3 = Color3.fromRGB(255, 255, 255); T_FPS.Font = Enum.Font.Gotham; T_FPS.TextSize = 13; T_FPS.LayoutOrder = 5; T_FPS.Parent = Content; local dragging, dragInput, dragStart, startPos; local UserInputService = game:GetService("UserInputService")
	Container.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true; dragStart = input.Position; startPos = Container.Position
		end
	end)
	Container.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart; Container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	Container.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false; library_flags["ui_pos_Watermark"] = tostring(Container.Position.X.Scale)..","..tostring(Container.Position.X.Offset)..","..tostring(Container.Position.Y.Scale)..","..tostring(Container.Position.Y.Offset)
		end
	end)
	local RunService = game:GetService("RunService"); local lastUpdate = tick(); local frames = 0
	RunService.RenderStepped:Connect(function()
		frames = frames + 1; local now = tick()
		if now - lastUpdate >= 1 then
			T_FPS.Text = string.format("<b>%d</b> <font color=\"#AAAAAA\">fps</font>", math.floor(frames / (now - lastUpdate))); frames = 0; lastUpdate = now
		end
	end)
end)
end)() 
task.spawn(function()
    local cachedObjects = {}; local lastCacheTime = 0; local CACHE_INTERVAL = 10; local Players = game:GetService("Players")
    while task.wait(1) do
        if not library_flags["spoofName"] and not library_flags["clanTagEnabled"] then
            continue
        end
        local lp = Players.LocalPlayer
        if not lp then continue end
        local now = tick()
        if now - lastCacheTime > CACHE_INTERVAL then
            lastCacheTime = now; cachedObjects = {}
            pcall(function()
                local robloxGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")
                if robloxGui then
                    for _, v in robloxGui:GetDescendants() do
                        if (v:IsA("TextLabel") or v:IsA("TextBox")) and v.Visible then
                            table.insert(cachedObjects, v)
                        end
                    end
                end
                local pg = lp:FindFirstChild("PlayerGui")
                if pg then
                    for _, v in pg:GetDescendants() do
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
                    local newText = env.applyLocalNameSpoof(v.Text, lp)
                    if newText ~= v.Text then
                        v.Text = newText
                    end
                end)
            end
        end
    end
end)
task.spawn(function()
    local Players = game:GetService("Players"); local RunService = game:GetService("RunService"); local PredictionFolder = Instance.new("Folder"); PredictionFolder.Name = "GrenadePredictor"
    pcall(function() PredictionFolder.Parent = workspace.Terrain end)
    local gAtts = {}; local gBeams = {}
    for i = 1, 40 do
        local att = Instance.new("Attachment", PredictionFolder); gAtts[i] = att
        if i > 1 then
            local beam = Instance.new("Beam", PredictionFolder); beam.Attachment0 = gAtts[i-1]; beam.Attachment1 = att; beam.Width0 = 0.2; beam.Width1 = 0.2; beam.FaceCamera = true; beam.Segments = 1; beam.LightEmission = 1; beam.LightInfluence = 0; beam.Transparency = NumberSequence.new(0.2); beam.Enabled = false; gBeams[i-1] = beam
        end
    end
    local gSphere = Instance.new("Part"); gSphere.Shape = Enum.PartType.Ball; gSphere.Size = Vector3.new(1.2, 1.2, 1.2); gSphere.Material = Enum.Material.Neon; gSphere.Anchored = true; gSphere.CanCollide = false; gSphere.Parent = PredictionFolder
    gSphere.CastShadow = false
    gSphere.Transparency = 1; local pulseDir = 1; local pulseVal = 1.0
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
    local lmbDown, rmbDown = false, false; local UIS = game:GetService("UserInputService")
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
            gSphere.Transparency = 1; return
        end
        local lp = Players.LocalPlayer; local rgb = library_flags["grenadeColor"] or Color3.fromRGB(255, 50, 50); local c3 = typeof(rgb) == "Color3" and rgb or Color3.new(rgb[1] or 1, rgb[2] or 0.2, rgb[3] or 0.2)
        for _, b in gBeams do
            b.Color = ColorSequence.new(c3); b.Enabled = true
        end
        gSphere.Color = c3; pulseVal = pulseVal + (pulseDir * dt * 2.5)
        if pulseVal >= 1.6 then pulseDir = -1 end
        if pulseVal <= 0.7 then pulseDir = 1 end
        gSphere.Size = Vector3.new(pulseVal, pulseVal, pulseVal); local cam = workspace.CurrentCamera; local lp = Players.LocalPlayer; local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart"); local plrVel = hrp and hrp.AssemblyLinearVelocity or Vector3.new(); local nadeType = getNadeType(); local LOOK_SPEED = 100; local PLR_FACTOR = 1.0; local UP_BIAS = 12; local maxBounces, bounceDamping = 3, 0.42
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
        local velocity = cam.CFrame.LookVector * LOOK_SPEED + plrVel * PLR_FACTOR + Vector3.new(0, UP_BIAS, 0); local startPos = getNadePosition(); local grav = Vector3.new(0, -workspace.Gravity, 0); local tStep = 1/60; local maxSteps = 240; local currentPos = startPos; local rp = RaycastParams.new(); local filterList = {lp.Character, workspace:FindFirstChild("Ray_Ignore"), PredictionFolder}; local mapObj = workspace:FindFirstChild("Map")
        if mapObj then
            local clips = mapObj:FindFirstChild("Clips")
            if clips then table.insert(filterList, clips) end
        end
        rp.FilterDescendantsInstances = filterList
        rp.FilterType = Enum.RaycastFilterType.Exclude; local bounces = 0; local pointCount = 1; gAtts[1].WorldPosition = startPos; local samplePeriod = 3; local stepIdx = 0
        for s = 1, maxSteps do
            local nextVel = velocity + (grav * tStep); local moveDelta = (velocity + nextVel) * 0.5 * tStep; local nextPos = currentPos + moveDelta; local ray = workspace:Raycast(currentPos, nextPos - currentPos, rp)
            if ray then
                bounces = bounces + 1; nextPos = ray.Position + ray.Normal * 0.05; local normal = ray.Normal; local reflected = nextVel - (2 * nextVel:Dot(normal) * normal); velocity = reflected * bounceDamping; local isFloor = normal.Y > 0.6
                if (nadeType == "molotov" and isFloor) or bounces >= maxBounces or velocity.Magnitude < 5 then
                    pointCount = pointCount + 1
                    if pointCount <= 40 then
                        gAtts[pointCount].WorldPosition = nextPos; gBeams[pointCount-1].Transparency = NumberSequence.new(0.15 + (pointCount/40)*0.85)
                    end
                    currentPos = nextPos; break
                end
            else
                velocity = nextVel
            end
            currentPos = nextPos; stepIdx = stepIdx + 1
            if stepIdx % samplePeriod == 0 or ray then
                pointCount = pointCount + 1
                if pointCount > 40 then break end
                gAtts[pointCount].WorldPosition = nextPos; gBeams[pointCount-1].Transparency = NumberSequence.new(0.15 + (pointCount/40)*0.85)
            end
        end
        for j = pointCount, 39 do
            if gBeams[j] then gBeams[j].Enabled = false end
        end
        gSphere.CFrame = CFrame.new(currentPos); gSphere.Transparency = 0.3
    end)
end)
warn("Script made by freezewo thanks for using report if find bugs in discord server")
task.spawn(function()
val_612 = setmetatable({ options = setmetatable({}, { __index = function() return {values = {}} end }) }, { __index = function() return function() return val_612 end end })
env.DemoFlags = env.DemoFlags or {}
LPH_NO_VIRTUALIZE = function(a) return a end
LPH_NO_UPVALUES = function(a) return a end
if game.PlaceId == 101013872711019 then
	repeat
		wait()
	until game:IsLoaded()
	setfpscap(144); local val_469 = game:GetService("ReplicatedStorage"); local val_471 = game:GetService("HttpService"); local val_472 = game:GetService("UserInputService"); local val_473 = game:GetService("Lighting"); local val_474 = game:GetService("TweenService"); local val_475 = game:GetService("Players"); local val_476 = workspace.settings; local val_481 = val_475.LocalPlayer; local val_482 = workspace.CurrentCamera; local val_483 = val_481:GetMouse(); local val_484 = {}; local val_490 = { 4, 2, 1, 20, 40 }; local val_500 = { 0.25, 0.5, 1, 2, 4 }; local val_506 = { 4, 2, 1, 0.5, 0.25 }; local val_513 = { "1/4", "1/2", "1", "2", "4" }; local val_520 = false; local val_525 = false; local val_531 = false; local val_536 = ""; local val_537 = "freecam"; local val_540 = nil; local val_546 = 3; local val_552 = 0; local val_556 = 0; local val_557; local val_565 = game:GetService("RunService"); local val_572 = val_481:GetMouse(); local val_583 = val_473.Ambient 
	local val_592 = val_473.OutdoorAmbient 
	local val_597 = Instance.new("ColorCorrectionEffect", val_473)
	repeat
		wait()
	until val_481.PlayerGui:FindFirstChild("main")
	local val_605 = val_481.PlayerGui.main; local val_609 = val_605; local val_611 = val_609.settings.outline.main.group; val_609.settings.Position = UDim2.new(0.5, - val_609.settings.Size.X.Offset / 2, 0.5, - val_609.settings.Size.Y.Offset / 2)
	function tickToSec(L_220_arg0)
		local val_645 = tostring(math.floor(math.floor(L_220_arg0 / 32) / 60)); local val_646 = tostring(math.floor(L_220_arg0 / 32) - val_645 * 60); val_646 = # tostring(val_646) == 1 and "0" .. val_646 or val_646 
		return val_645 .. ":" .. val_646
	end 
	function extractNumber(L_223_arg0)
		if not L_223_arg0 then
			return 0
		end 
		local val_647 = ""
		for L_225_forvar0 = 1, string.len(L_223_arg0) do
			local val_648 = string.sub(L_223_arg0, L_225_forvar0, L_225_forvar0)
			if tonumber(val_648) then
				val_647 = val_647 .. val_648
			end
		end 
		return tonumber(val_647)
	end 
	function playAudio(L_227_arg0, L_228_arg1)
		if env.DemoFlags["hide_character_models"] then
			return
		end 
		if ignoreSound then
			return
		end 
		local val_649 = L_227_arg0:Clone(); val_649.Volume = 0.15; val_649.PlaybackSpeed = val_500[val_546]; val_649.Parent = L_228_arg1; val_649:Play()
		val_649.Ended:Connect(function()
			if val_649 then
				val_649:Destroy()
			end
		end)
	end 
	function hasProperty(L_230_arg0, L_231_arg1)
		return pcall(function()
			_ = L_230_arg0[L_231_arg1]
		end)
	end 
	local val_615 = {}; local val_616 = {}; local val_617 = {}; local val_618 = {}; local val_619 = {}; local val_620 = {}; local val_621 = 0; local val_622 = false; local val_623 = { AWP = { magout = 1.5 } }; local val_624 = {}; local val_625 = require(workspace.Bezier); local val_626 = false; local val_627 = false 
	function count(L_232_arg0)
		a = 0 
		for L_233_forvar0, L_234_forvar1 in L_232_arg0 do
			a = a + 1
		end 
		return a
	end 
	function updateKeyframes()
		workspace.camParts:ClearAllChildren()
		if count(val_624) < 1 or not val_476.showkeyframes.Value then
			return
		end 
		for L_235_forvar0, L_236_forvar1 in val_624 do
			if L_235_forvar0 ~= count(val_624) then
				local val_651 = L_236_forvar1.cf.p; local val_652 = val_624[L_235_forvar0 + 1].cf; local val_653 = val_651.X > val_652.p.X and val_651.X or val_652.p.X; local val_655 = (val_651.Y + val_652.p.Y) / 2; local val_656 = val_651.Z > val_652.p.Z and val_651.Z or val_652.p.Z; local val_657 = val_625.new(val_651, Vector3.new(val_653, val_655, val_656), val_652.p):GetPath(0.15)
				for L_243_forvar0, L_244_forvar1 in val_657 do
					local val_658 = Instance.new("Part"); val_658.Anchored = true; val_658.Size = Vector3.new(0.3, 0.3, 0.3); val_658.Material = "SmoothPlastic"; val_658.Color = Color3.new(0.5, 0.2, 0.7); val_658.CFrame = CFrame.new(L_244_forvar1, L_244_forvar1 + val_652.LookVector); val_658.Transparency = 0.65; val_658.Parent = workspace.camParts; local val_659 = Instance.new("Part"); val_659.Shape = "Cylinder"; val_659.Anchored = true; val_659.Size = Vector3.new(0.1, 0.2, 0.1); val_659.Material = "SmoothPlastic"; val_659.Color = Color3.new(1, 1, 1); val_659.Position = val_658.Position + val_658.CFrame.LookVector / 3.5; val_659.Transparency = 0.75; val_659.Orientation = val_658.Orientation + Vector3.new(0, 90, 0); val_659.Parent = val_658
				end
			end 
			wait()
		end
	end 
	local val_628 = tick(); local val_629 = CFrame.new(0, 0, 0); local val_630 = CFrame.Angles(0, 0, 0); mgn = 0; local val_631 = { 0, 0 }; local val_632 = 0; local val_633 = 0; waveScale = 0; local val_634 = { aim_amp = 0.5, aim_max_change = 4, aim_retract = 15, aim_max_deg = 20 }; local val_636 = Vector3.new(); Camera = workspace.CurrentCamera; local val_637 = Drawing.new("Text"); val_637.Visible = true; val_637.Position = Vector2.new(100, 100); val_637.Size = 30; val_637.Font = 2; val_637.Text = "tps:"; val_637.Color = Color3.new(1, 1, 1); val_637.Visible = false; local val_638 = 0 
	spawn(function()
		while wait(1) do
			val_637.Text = "tps: " .. tostring(val_638); val_638 = 0
		end
	end)
	function playTick(L_247_arg0)
		if not L_247_arg0 then
			L_247_arg0 = val_556
		end 
		if val_476.keyframing.Value and val_537 == "freecam" and val_476.playing.Value then
			if count(val_624) > 1 then
				if not val_626 then
					local val_661, val_663 = 387420489, nil 
					for L_251_forvar0, L_252_forvar1 in val_624 do
						if L_252_forvar1.tick > L_247_arg0 and L_252_forvar1.tick < val_661 then
							val_661, val_663 = L_252_forvar1.tick, L_252_forvar1.cf
						end
					end 
					if val_663 then
						val_626 = true; local val_664 = math.abs(L_247_arg0 - val_661); local val_665 = val_482.CFrame.p; local val_666 = val_665.X > val_663.p.X and val_665.X or val_663.p.X; local val_667 = (val_665.Y + val_663.p.Y) / 2; local val_668 = val_665.Z > val_663.p.Z and val_665.Z or val_663.p.Z; local val_669 = val_625.new(val_665, Vector3.new(val_666, val_667, val_668), val_663.p):GetPath(0.15); local val_670 = 30 * val_500[val_546]
						spawn(function()
							warn(L_247_arg0, val_661); warn(val_664, val_664 / val_670, val_664 / val_670 / (# val_669 - 1))
							for L_260_forvar0, L_261_forvar1 in val_669 do
								if L_260_forvar0 > 1 then
									local val_672 = TweenInfo.new(val_664 / val_670 / (# val_669 - 1), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0); local val_673 = val_474:Create(val_482, val_672, { CFrame = CFrame.new(L_261_forvar1, L_261_forvar1 + val_663.LookVector * 10000) }); val_673:Play()
									if L_260_forvar0 ~= # val_669 - 1 then
										wait(val_664 / val_670 / (# val_669 - 1))
									end
								end
							end 
							val_626 = false
						end)
					end
				end
			end
		end 
		workspace.demoModels.nades:ClearAllChildren(); local val_660 = val_484[L_247_arg0]
		if type(val_660) == "table" then
			for L_265_forvar0, L_266_forvar1 in val_660 do
				if type(L_266_forvar1) ~= "table" or not L_266_forvar1.name then
					continue 
				end 
				if L_266_forvar1.alive then
					local val_675 = workspace.demoModels:FindFirstChild(L_265_forvar0); local val_676 = workspace.demoModels.weapons:FindFirstChild(L_265_forvar0 .. "_" .. L_266_forvar1.gunName); local val_677 = false; local val_679 = false 
					if not val_675 then
						val_675 = val_469.CharacterModels[L_266_forvar1.plrModel]:Clone(); val_675.Name = L_265_forvar0; val_675.Parent = workspace.demoModels; val_615[L_266_forvar1.name] = L_266_forvar1.plrModel; val_679 = true
					end 
					if not val_676 then
						for L_273_forvar0, L_274_forvar1 in workspace.demoModels.weapons:GetChildren() do
							if L_274_forvar1.Name:find(L_265_forvar0) then
								L_274_forvar1:Destroy(); break
							end
						end 
						if val_469.Weapons:FindFirstChild(L_266_forvar1.gunName) then
							val_676 = val_469.Weapons[L_266_forvar1.gunName].Model:Clone(); val_676.Name = L_265_forvar0 .. "_" .. L_266_forvar1.gunName; val_676.Parent = workspace.demoModels.weapons 
							for L_275_forvar0, L_276_forvar1 in val_676:GetDescendants() do
								if L_276_forvar1:IsA("BasePart") then
									L_276_forvar1.Anchored = true 
									if val_469.Weapons[L_266_forvar1.gunName]:FindFirstChild("Grenade") then
										L_276_forvar1.Transparency = 0
									end
								end
							end
						end 
						val_677 = true
					end 
					local val_680 = L_265_forvar0 == val_536 and val_537 == "follow" and val_520 or env.DemoFlags["hide_character_models"]
					if (not val_620[L_265_forvar0] and L_266_forvar1.scoped or val_620[L_265_forvar0] and not L_266_forvar1.scoped) and val_676:FindFirstChild("Zoom") then
						playAudio(val_676.Zoom, val_540 and val_680 and workspace or val_676:FindFirstChild("Handle") or val_676:FindFirstChild("Handle2") or nil)
					end 
					val_605.Scope.Visible = L_266_forvar1.scoped and (L_265_forvar0 == val_536 and val_520); val_482.FieldOfView = val_605.Scope.Visible and 35 or 80 
					if val_537 == "follow" then
						if L_265_forvar0 == val_536 then
							if L_266_forvar1.alive then
								val_605.crosshair.Visible = L_266_forvar1.gunName ~= "AWP" and L_266_forvar1.gunName ~= "Scout" and L_266_forvar1.gunName ~= "G3SG1" and (val_520 and val_537 == "follow") and not L_266_forvar1.scoped 
								if L_266_forvar1.localplayer and val_520 then
									val_605.hud.Vitals.Visible = true; val_605.hud.AmmoGUI.Visible = true; val_605.hud.Spectate.Visible = false; val_605.hud.Vitals.Health.Text = math.floor(tonumber(L_266_forvar1.health)); val_605.hud.Vitals.Armor.Text = math.floor(tonumber(L_266_forvar1.kevlar)); val_605.hud.Vitals.HealthB.Fill.Size = UDim2.new(L_266_forvar1.health / 100, 0, 1, 0); val_605.hud.Vitals.ArmorB.Fill.Size = UDim2.new(L_266_forvar1.kevlar / 100, 0, 1, 0); val_605.hud.AmmoGUI.AmmoClip.Text = L_266_forvar1.ammo; val_605.hud.AmmoGUI.AmmoReserve.Text = L_266_forvar1.ammoreserve
								else
									val_605.hud.Vitals.Visible = false; val_605.hud.AmmoGUI.Visible = false; val_605.hud.Spectate.Visible = true; val_605.hud.Spectate.PlayerBox.BackgroundColor3 = L_266_forvar1.team == "Terrorists" and Color3.fromRGB(245, 205, 48) or Color3.fromRGB(13, 105, 172); val_605.hud.Spectate.PlayerBox.PlayerName.TextColor3 = L_266_forvar1.team == "Terrorists" and Color3.fromRGB(245, 205, 48) or Color3.fromRGB(13, 105, 172); val_605.hud.Spectate.PlayerBox.PlayerName.Text = L_266_forvar1.name; val_605.hud.Spectate.PlayerBox.PlayerIcon.Plr.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(L_266_forvar1.userid) .. "&width=420&height=420&format=png"; val_605.hud.Spectate.PlayerBox.GreyPart.PHealth.Text = math.floor(tonumber(L_266_forvar1.health)); val_605.hud.Spectate.PlayerBox.GreyPart.WeaponName.Text = L_266_forvar1.gunName
								end
							else
								val_605.hud.Spectate.Visible = false; val_605.hud.Vitals.Visible = false; val_605.hud.AmmoGUI.Visible = false; val_605.crosshair.Visible = false
							end
						end
					else
						val_605.hud.Spectate.Visible = false; val_605.hud.Vitals.Visible = false; val_605.hud.AmmoGUI.Visible = false; val_605.crosshair.Visible = false
					end 
					if not env.DemoFlags["show_hud"] then
						val_605.hud.Spectate.Visible = false; val_605.hud.Vitals.Visible = false; val_605.hud.AmmoGUI.Visible = false
					end 
					if env.DemoFlags["hide_crosshair"] then
						val_605.crosshair.Visible = false
					end 
					val_622 = val_605.Scope.Visible or env.DemoFlags["hide_viewmodel"]
					for L_277_forvar0, L_278_forvar1 in val_675:GetChildren() do
						local val_682 = nil; local val_684 = nil; local val_685 = nil; local val_686 = nil 
						for L_283_forvar0, L_284_forvar1 in L_266_forvar1.partCF do
							val_682 = L_283_forvar0 == L_278_forvar1.Name and L_278_forvar1 or nil; val_684 = val_682 and L_284_forvar1 or nil 
							if val_682 then
								break
							end
						end 
						if L_278_forvar1.ClassName == "Accessory" then
							for L_285_forvar0, L_286_forvar1 in L_266_forvar1.hatCF do
								local val_687 = L_278_forvar1.Handle.ClassName == "Part" and L_278_forvar1.Handle.Mesh.MeshId or L_278_forvar1.Handle.ClassName == "MeshPart" and L_278_forvar1.Handle.MeshId or ""; val_685 = L_285_forvar0 == val_687 and L_278_forvar1 or nil; val_686 = val_685 and L_286_forvar1 or nil 
								if val_685 then
									break
								end
							end
						end 
						if val_682 then
							local val_688 = val_680 and "0 0 0 0 0 0 0 0 0 0 0 0" or val_684:split(" "); local val_689 = TweenInfo.new(val_679 and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
							local val_691 = val_474:Create(val_682, val_689, { CFrame = CFrame.new(val_688[1], val_688[2], val_688[3], val_688[4], val_688[5], val_688[6], val_688[7], val_688[8], val_688[9], val_688[10], val_688[11], val_688[12]) }); val_691:Play(); val_682.Anchored = true
						end 
						if val_685 then
							local val_692 = val_680 and "0 0 0 0 0 0 0 0 0 0 0 0" or val_686:split(" "); local val_693 = TweenInfo.new(val_679 and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
							local val_694 = val_474:Create(val_685.Handle, val_693, { CFrame = CFrame.new(val_692[1], val_692[2], val_692[3], val_692[4], val_692[5], val_692[6], val_692[7], val_692[8], val_692[9], val_692[10], val_692[11], val_692[12]) }); val_694:Play(); val_685.Handle.Anchored = true
						end
					end 
					if val_676 and val_469.Skins:FindFirstChild(L_266_forvar1.gunName) then
						for L_294_forvar0, L_295_forvar1 in L_266_forvar1.gunCF do
							local val_695 = val_676:FindFirstChild(L_294_forvar0); local val_696 = val_469.Skins[L_266_forvar1.gunName]:FindFirstChild(L_266_forvar1.skinName) and val_469.Skins[L_266_forvar1.gunName][L_266_forvar1.skinName]:FindFirstChild(L_294_forvar0, true) or nil 
							if val_695 then
								local val_697 = val_680 and "0 0 0 0 0 0 0 0 0 0 0 0" or L_295_forvar1:split(" "); local val_698 = TweenInfo.new(val_677 and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
								local val_701 = val_474:Create(val_695, val_698, { CFrame = CFrame.new(val_697[1], val_697[2], val_697[3], val_697[4], val_697[5], val_697[6], val_697[7], val_697[8], val_697[9], val_697[10], val_697[11], val_697[12]) }); val_701:Play()
								if val_696 then
									val_695.TextureID = val_696.Value
								end
							end
						end
					end 
					local val_681 = L_266_forvar1.gunState 
					if val_681 ~= "None" then
						local val_702, val_703; val_703 = val_540 and (L_265_forvar0 == val_536 and val_537 == "follow" and val_520) and workspace or val_676:FindFirstChild("Handle") or val_676:FindFirstChild("Handle2") or nil 
						if string.find(val_681, "Fire") or val_681 == "Stab" then
							val_702 = val_676:FindFirstChild("Shoot") or val_676:FindFirstChild("Shoot1")
							if val_536 == L_265_forvar0 and val_540 then
								if val_681 ~= "Stab" then
									val_636 = Vector3.new(0, 0.5, 0)
								end 
								local val_704 = val_540.Guy:LoadAnimation(val_540[val_681:lower()]); val_704:Play(); val_704:AdjustSpeed(val_500[val_546])
							end
						elseif val_681 == "Reload" then
							if val_536 == L_265_forvar0 and val_540 then
								local val_707 = val_540.Guy:LoadAnimation(val_540.reload); val_707:Play(); val_707:AdjustSpeed(val_500[val_546])
							end 
							local val_705 = val_676; local val_706 = val_676.Name:split("_")[2]
							spawn(function()
								if val_469.Weapons:FindFirstChild(val_706) then
									local val_708 = val_469.Weapons[val_706].Model:FindFirstChild("magout"); local val_709 = val_469.Weapons[val_706].Model:FindFirstChild("magin"); local val_710 = val_469.Weapons[val_706].Model:FindFirstChild("bolt") or val_469.Weapons[val_706].Model:FindFirstChild("slide"); local val_712 = val_469.Weapons[val_706].Model:FindFirstChild("boltin") or val_469.Weapons[val_706].Model:FindFirstChild("slidein")
									if val_708 and val_709 and val_710 and val_712 then
										playAudio(val_708, val_703); wait((val_623[val_706] and val_623[val_706].magout or val_708.TimeLength * 0.85) * val_506[val_546])
										if not val_705 then
											return
										end 
										playAudio(val_709, val_703); wait(val_709.TimeLength * 0.95 * val_506[val_546])
										if not val_705 then
											return
										end 
										playAudio(val_710, val_703); wait(val_710.TimeLength * 0.75 * val_506[val_546])
										if not val_705 then
											return
										end 
										playAudio(val_712, val_703)
									else
										warn(L_266_forvar1.gunName, "does not have all needed sounds!")
									end
								else
									warn(val_706, "does not exist [?]", val_676.Name)
								end
							end)
						elseif val_681 == "Inspect" then
							if val_536 == L_265_forvar0 and val_540 then
								local val_713 = val_540.Guy:LoadAnimation(val_540.inspect); val_713:Play(); val_713:AdjustSpeed(val_500[val_546])
							end
						end 
						if val_702 and val_703 then
							playAudio(val_702, val_703)
						end
					end 
					val_636 = Vector3.new(0, val_636.Y - 0.075 < 0 and 0 or val_636.Y - 0.075, 0)
					if val_677 and val_469.Weapons:FindFirstChild(L_266_forvar1.gunName) then
						if val_469.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("Equip") then
							local val_714 = val_540 and (L_265_forvar0 == val_536 and val_537 == "follow" and val_520) and val_540.HumanoidRootPart or val_676:FindFirstChild("Handle") or val_676:FindFirstChild("Handle2"); playAudio(val_469.Weapons[L_266_forvar1.gunName].Model.Equip, val_714)
						else
							local val_715 = val_540 and (L_265_forvar0 == val_536 and val_537 == "follow" and val_520) and val_540.HumanoidRootPart or val_676:FindFirstChild("Handle") or val_676:FindFirstChild("Handle2")
							local val_716 = val_469.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("bolt") or val_469.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("slide"); local val_717 = val_469.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("boltin") or val_469.Weapons[L_266_forvar1.gunName].Model:FindFirstChild("slidein")
							if val_716 and val_717 then
								spawn(function()
									wait(0.1); playAudio(val_716, val_715); wait(val_716.TimeLength * 0.75 * val_506[val_546]); playAudio(val_717, val_715)
								end)
							end
						end
					end 
					if workspace.demoModels.ragdoll:FindFirstChild(L_265_forvar0) then
						workspace.demoModels.ragdoll[L_265_forvar0]:Destroy()
					end 
					if L_266_forvar1.forcefield and not val_675:FindFirstChild("ForceField") then
						local val_718 = Instance.new("ForceField", val_675)
					elseif val_675:FindFirstChild("ForceField") and not L_266_forvar1.forcefield then
						val_675.ForceField:Destroy()
					end 
					if L_266_forvar1.velocity and val_520 and L_265_forvar0 == val_536 then
						local val_719 = tick() - val_628 > 0.12 and 0.12 or tick() - val_628; val_628 = tick(); local val_720 = val_482.CFrame.LookVector.magnitude == 0 and 1.0E-4 or val_482.CFrame.lookVector.magnitude; local val_721 = val_482.CFrame.LookVector.y; local val_723 
						if val_721 ~= 0 then
							val_723 = math.deg(math.asin(math.abs(val_721) / val_720)) * math.abs(val_721) / val_721
						else
							val_723 = 0
						end 
						local val_724 = val_482.CFrame; local val_725 = val_724 * CFrame.new(0, 0, -100); local val_726 = math.deg(math.atan2(val_724.p.x - val_725.p.x, val_724.p.z - val_725.p.z)) + 180; local val_727, val_728; local val_729, val_730 = 0, 0; val_727 = math.abs(val_723 - val_632)
						if val_727 ~= 0 then
							val_729 = (val_723 - val_632) / val_727
						end 
						local val_731 = { math.abs(val_726 - val_633), 360 - math.abs(val_726 - val_633) }
						if val_726 == val_633 then
							val_730 = 0; val_728 = 0
						elseif val_731[1] < val_731[2] then
							val_728 = val_731[1]; val_730 = (val_726 - val_633) / val_731[1]
						else
							val_728 = val_731[2]
							if val_726 < val_633 then
								val_730 = 1
							else
								val_730 = -1
							end
						end 
						val_632 = val_723; val_633 = val_726; val_631[1] = val_631[1] / (1 + val_719 * 15); val_631[2] = val_631[2] / (1 + val_719 * 15); local val_732 = val_727 * val_729 * 0.5 
						if val_732 ~= 0 then
							val_631[1] = val_631[1] + math.min(4, math.abs(val_732)) * val_732 / math.abs(val_732)
						end 
						local val_734 = val_728 * val_730 * 0.5 
						if val_734 ~= 0 then
							val_631[2] = val_631[2] + math.min(4, math.abs(val_734)) * val_734 / math.abs(val_734)
						end 
						if val_631[1] ~= 0 then
							val_631[1] = math.min(20, math.abs(val_631[1])) * math.abs(val_631[1]) / val_631[1]
						end 
						if val_631[2] ~= 0 then
							val_631[2] = math.min(20, math.abs(val_631[2])) * math.abs(val_631[2]) / val_631[2]
						end 
						local val_735 = math.cos(tick() * math.pi * 2.5); local val_736 = 0.05; local val_737 = Vector3.new(L_266_forvar1.velocity[1], L_266_forvar1.velocity[2], L_266_forvar1.velocity[3]).magnitude; waveScale = 0.75 * 0.5 
						if mgn < val_737 then
							mgn = math.min(val_737, mgn + 1)
						end 
						if mgn > val_737 then
							mgn = math.max(val_737, mgn - 1.5)
						end 
						local val_738 = mgn / 18.35; val_629 = env.fart and CFrame.new() or CFrame.new((0.25 * val_738 + val_735 / 10 * val_738) * waveScale, (0.25 * val_738 + math.abs(val_735 / 10) * val_738) * - waveScale, math.abs(0.25 * val_738) * waveScale); val_630 = CFrame.Angles(- val_631[1] / 150, - val_631[2] / 150, 0)
					end 
					val_616[L_265_forvar0] = L_266_forvar1.camCF; val_618[L_265_forvar0] = L_266_forvar1.gunName; val_617[L_265_forvar0] = L_266_forvar1.armsModel; val_619[L_265_forvar0] = L_266_forvar1.skinName; val_620[L_265_forvar0] = L_266_forvar1.scoped
				else
					if val_537 == "follow" and L_265_forvar0 == val_536 then
						val_605.hud.Spectate.Visible = false; val_605.hud.Vitals.Visible = false; val_605.hud.AmmoGUI.Visible = false; val_605.crosshair.Visible = false
					end 
					if L_266_forvar1.ragdoll.found and val_615[L_265_forvar0] then
						local val_739 = workspace.demoModels.ragdoll:FindFirstChild(L_265_forvar0)
						local val_740 = false 
						if not val_739 then
							val_739 = val_469.CharacterModels[val_615[L_265_forvar0]]:Clone(); val_739.Name = L_266_forvar1.name 
							val_739.Parent = workspace.demoModels.ragdoll 
							for L_337_forvar0, L_338_forvar1 in val_739:GetDescendants() do
								if L_338_forvar1:IsA("BasePart") then
									L_338_forvar1.Anchored = true
								end
							end 
							val_740 = true
						end 
						for L_339_forvar0, L_340_forvar1 in val_739:GetChildren() do
							local val_742 = L_266_forvar1.ragdoll.positions[L_340_forvar1.Name == "FakeHead" and "Head" or L_340_forvar1.Name]
							if val_742 then
								val_742 = env.DemoFlags["hide_ragdolls"] and "0 0 0 0 0 0 0 0 0 0 0 0" or val_742 
								local val_743 = val_742:split(" "); local val_744 = TweenInfo.new(val_740 and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
								local val_745 = val_474:Create(L_340_forvar1, val_744, { CFrame = CFrame.new(val_743[1], val_743[2], val_743[3], val_743[4], val_743[5], val_743[6], val_743[7], val_743[8], val_743[9], val_743[10], val_743[11], val_743[12]) }); val_745:Play()
							end 
							if L_340_forvar1.ClassName == "Accessory" then
								for L_345_forvar0, L_346_forvar1 in L_266_forvar1.ragdoll.hatPos do
									local val_746 = L_340_forvar1.Handle.ClassName == "Part" and L_340_forvar1.Handle.Mesh.MeshId or L_340_forvar1.Handle.ClassName == "MeshPart" and L_340_forvar1.Handle.MeshId or ""
									if val_746 == L_345_forvar0 then
										L_346_forvar1 = env.DemoFlags["hide_ragdolls"] and "0 0 0 0 0 0 0 0 0 0 0 0" or L_346_forvar1 
										local val_747 = L_346_forvar1:split(" "); local val_748 = TweenInfo.new(val_740 and 0 or workspace.settings.playertween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
										local val_750 = val_474:Create(L_340_forvar1.Handle, val_748, { CFrame = CFrame.new(val_747[1], val_747[2], val_747[3], val_747[4], val_747[5], val_747[6], val_747[7], val_747[8], val_747[9], val_747[10], val_747[11], val_747[12]) }); val_750:Play()
									end
								end
							end
						end
					elseif workspace.demoModels.ragdoll:FindFirstChild(L_265_forvar0) then
						workspace.demoModels.ragdoll[L_265_forvar0]:Destroy()
					end 
					for L_351_forvar0, L_352_forvar1 in workspace.demoModels.weapons:GetChildren() do
						if L_352_forvar1.Name:find(L_265_forvar0) then
							L_352_forvar1:Destroy(); break
						end
					end 
					if workspace.demoModels:FindFirstChild(L_265_forvar0) then
						workspace.demoModels[L_265_forvar0]:Destroy()
					end 
					val_616[L_265_forvar0] = nil; val_618[L_265_forvar0] = nil; val_617[L_265_forvar0] = nil; val_619[L_265_forvar0] = nil; val_620[L_265_forvar0] = nil
				end
			end 
			for L_353_forvar0, L_354_forvar1 in val_660.nades do
				local val_751 = val_469.Weapons[L_354_forvar1.nade].Model:Clone(); val_751.Parent = workspace.demoModels.nades; val_751.Anchored = true; val_751.Transparency = 0; local val_752 = L_354_forvar1.pos:split(" "); val_751.Position = Vector3.new(val_752[1], val_752[2], val_752[3]); val_751.Orientation = Vector3.new(val_752[4], val_752[5], val_752[6])
			end 
			if val_552 ~= val_660.roundInfo.round then
				for L_357_forvar0, L_358_forvar1 in val_557.Regen.Props:GetChildren() do
					L_358_forvar1.Transparency = 0
				end 
				if val_557.Regen:FindFirstChild("Glasses") then
					for L_359_forvar0, L_360_forvar1 in val_557.Regen.Glasses:GetChildren() do
						L_360_forvar1.Transparency = 0.5
					end
				end
			end 
			for L_361_forvar0, L_362_forvar1 in val_557.Regen.Props:GetChildren() do
				local val_754 = false 
				for L_364_forvar0, L_365_forvar1 in val_660.regen.props do
					local val_755 = L_365_forvar1:split(" "); val_754 = (Vector3.new(val_755[1], val_755[2], val_755[3]) - L_362_forvar1.Position).magnitude < 3 and true or val_754
				end 
				L_362_forvar1.Transparency = val_754 and 0 or 1
			end 
			if val_557.Regen:FindFirstChild("Glasses") then
				for L_367_forvar0, L_368_forvar1 in val_557.Regen.Glasses:GetChildren() do
					local val_756 = false 
					for L_370_forvar0, L_371_forvar1 in val_660.regen.glasses do
						local val_758 = L_371_forvar1:split(" "); val_756 = (Vector3.new(val_758[1], val_758[2], val_758[3]) - L_368_forvar1.Position).magnitude < 1 and true or val_756
					end 
					L_368_forvar1.Transparency = val_756 and 0.5 or 1
				end
			end 
			for L_373_forvar0, L_374_forvar1 in val_557.Regen.Doors:GetChildren() do
				pcall(function()
					local val_759 = val_660.regen.doors[L_373_forvar0]:split(" ")
					L_374_forvar1.HumanoidRootPart.Anchored = true; L_374_forvar1.HumanoidRootPart.Position = Vector3.new(val_759[1], val_759[2], val_759[3]); L_374_forvar1.HumanoidRootPart.Orientation = Vector3.new(val_759[4], val_759[5], val_759[6])
				end)
			end 
			for L_376_forvar0, L_377_forvar1 in val_660.nadePos do
				local val_760 = L_377_forvar1.pos:split(" "); local val_761 = Vector3.new(val_760[1], val_760[2], val_760[3]); local val_763 = false 
				for L_381_forvar0, L_382_forvar1 in workspace.demoModels.nadePos:GetChildren() do
					local val_764 = (L_382_forvar1.Position - val_761).magnitude 
					if val_764 <= 0.25 then
						val_763 = true
					end
				end 
				if not val_763 then
					local val_765 = val_469[L_377_forvar1.type]:Clone(); val_765.Parent = workspace.demoModels.nadePos; val_765.Position = val_761
				end
			end 
			for L_385_forvar0, L_386_forvar1 in workspace.demoModels.nadePos:GetChildren() do
				local val_766 = false 
				for L_388_forvar0, L_389_forvar1 in val_660.nadePos do
					local val_768 = L_389_forvar1.pos:split(" "); local val_769 = (L_386_forvar1.Position - Vector3.new(val_768[1], val_768[2], val_768[3])).magnitude 
					if val_769 <= 1 then
						val_766 = true
					end
				end 
				if not val_766 then
					L_386_forvar1:Destroy()
				end
			end 
			workspace.demoModels.droppedWeapons:ClearAllChildren()
			for L_392_forvar0, L_393_forvar1 in val_660.droppedWeapons do
				local val_770 = val_469.Weapons[L_393_forvar1.name].Model:Clone(); val_770.Parent = workspace.demoModels.droppedWeapons 
				for L_395_forvar0, L_396_forvar1 in L_393_forvar1.positions do
					L_396_forvar1 = env.DemoFlags["hide_dropped_weapons"] and "0 0 0 0 0 0" or L_396_forvar1; local val_771 = L_396_forvar1:split(" "); val_770[L_395_forvar0].Position = Vector3.new(val_771[1], val_771[2], val_771[3]); val_770[L_395_forvar0].Orientation = Vector3.new(val_771[4], val_771[5], val_771[6])
				end
			end 
			val_605.hud.TWin.Visible = val_660.roundInfo.TWin.vis; val_605.hud.TWin.MVPPlayer.Image = val_660.roundInfo.TWin.mvpimage; val_605.hud.TWin.TextLabel.Text = val_660.roundInfo.TWin.mvptext; val_605.hud.TWin.Info.TextLabel.Text = val_660.roundInfo.TWin.infotext; val_605.hud.CTWin.Visible = val_660.roundInfo.CTWin.vis; val_605.hud.CTWin.MVPPlayer.Image = val_660.roundInfo.CTWin.mvpimage; val_605.hud.CTWin.TextLabel.Text = val_660.roundInfo.CTWin.mvptext; val_605.hud.CTWin.Info.TextLabel.Text = val_660.roundInfo.CTWin.infotext; local val_674 = val_660.bombPos:split(" "); workspace.C4Normal:SetPrimaryPartCFrame(CFrame.new(val_674[1], val_674[2] - 1, val_674[3]) * CFrame.Angles(math.rad(90), 0, 0)); val_552 = val_660.roundInfo.round 
			for L_398_forvar0, L_399_forvar1 in val_605.killfeed:GetChildren() do
				if L_399_forvar1.Name ~= "example" and L_399_forvar1.Name ~= "UIListLayout" then
					L_399_forvar1:Destroy()
				end
			end 
			if val_660.killfeed then
				for L_400_forvar0, L_401_forvar1 in val_660.killfeed do
					local val_773 = val_605.killfeed.example:Clone(); x = 0; val_773.Killer.Text = L_401_forvar1.killer; val_773.Killer.TextColor3 = Color3.new(L_401_forvar1.killercolor[1], L_401_forvar1.killercolor[2], L_401_forvar1.killercolor[3]); val_773.Victim.Text = L_401_forvar1.victim; val_773.Victim.TextColor3 = Color3.new(L_401_forvar1.victimcolor[1], L_401_forvar1.victimcolor[2], L_401_forvar1.victimcolor[3]); val_773.Outline.Visible = val_537 == "follow" and (L_401_forvar1.killer == val_536 or L_401_forvar1.victim == val_536); val_773.Pic.Image = L_401_forvar1.weapon 
					if L_401_forvar1.headshot and L_401_forvar1.wallbang then
						val_773.Pic.Wallbang.Visible = true; val_773.Pic.Wallbang.Headshot.Visible = true
					elseif L_401_forvar1.headshot then
						val_773.Pic.Headshot.Visible = true
					end 
					val_773.Pic.Headshot.Position = L_401_forvar1.headshot and L_401_forvar1.wallbang and UDim2.new(0, 102, 0, 2) or val_773.Pic.Headshot.Position; val_773.Name = tostring(L_400_forvar0); val_773.Visible = env.DemoFlags["show_killfeed"]; val_773.Parent = val_605.killfeed; val_773.Pic.Position = UDim2.new(0, val_773.Killer.TextBounds.X + 3, 0, 0); val_773.Size = UDim2.new(0, val_773.Killer.TextBounds.X + val_773.Victim.TextBounds.X + val_773.Pic.Size.Width.Offset + (L_401_forvar1.headshot and 30 or 0) + (L_401_forvar1.wallbang and 30 or 0) + 28, 0, 25)
				end
			end 
			val_605.hud.UpperInfo.Visible = env.DemoFlags["show_hud"]
			if env.DemoFlags["show_hud"] then
				val_605.hud.UpperInfo.Timer.Text = val_660.roundInfo.time; val_605.hud.UpperInfo.TScore.Text = val_660.roundInfo.T; val_605.hud.UpperInfo.CTScore.Text = val_660.roundInfo.CT
			end 
			val_605.player.pauseresume.Image = val_476.playing.Value and "rbxassetid://4458862490" or "rbxassetid://4458863290"; val_605.player.tickcount.Text = tickToSec(L_247_arg0) .. " / " .. tickToSec(val_621); val_605.player.tickslider.volumesize.Size = UDim2.new(100 / val_621 * L_247_arg0 / 100, 0, 1, 0); ignoreSound = false
		end 
		val_638 = val_638 + 1
	end 
	local val_639 = ""; local val_640 = false 
	function createMap(L_403_arg0)
		workspace.Terrain:Clear()
		if workspace:FindFirstChild("Map") then
			workspace.Map:Destroy()
		end 
		workspace.createmap.mapevent:FireServer(L_403_arg0)
	end 
	local val_641 = { newKills = {}, newRounds = {}, newBombPlants = {} }
	function checkDifferences(L_404_arg0, L_405_arg1)
		local val_774 = L_405_arg1[L_404_arg0 - 1]; local val_775 = L_405_arg1[L_404_arg0]
		for L_408_forvar0, L_409_forvar1 in val_775.killfeed do
			local val_777 = false 
			for L_411_forvar0, L_412_forvar1 in val_774.killfeed do
				if L_412_forvar1.victim == L_409_forvar1.victim and L_409_forvar1.killer == L_412_forvar1.killer then
					val_777 = true; break
				end
			end 
			if not val_777 then
				table.insert(val_641.newKills, { victim = L_409_forvar1.victim, killer = L_409_forvar1.killer, killercolor = L_409_forvar1.killercolor, victimcolor = L_409_forvar1.victimcolor, tickNumber = L_404_arg0 })
			end
		end 
		if val_775.roundInfo.round > val_774.roundInfo.round then
			table.insert(val_641.newRounds, { round = val_775.roundInfo.round, tickNumber = L_404_arg0 })
		end 
		if val_775.bombPlanted and not val_774.bombPlanted then
			table.insert(val_641.newBombPlants, { round = val_775.roundInfo.round, tickNumber = L_404_arg0 })
		end
	end 
	function CreateThread(L_413_arg0)
		local val_778 = coroutine.create(L_413_arg0); coroutine.resume(val_778)
		return val_778
	end 
	function playDemo(L_415_arg0, L_416_arg1)
		val_605.playing.Visible = true 
		if val_640 then
			return
		end 
		if val_540 then
			val_540:Destroy(); val_540 = nil
		end 
		if env.DemoFlags["depth_of_field_map"] then
			val_612.options["depth_of_field_map"].changeState(false)
		end 
		if env.DemoFlags["greenscreen_map"] then
			val_612.options["greenscreen_map"].changeState(false)
		end 
		val_536 = ""; val_537 = "freecam"; val_520 = false; val_639 = L_415_arg0; val_605.demolist.Visible = false; val_476.playing.Value = false; local val_779 = "clarity.tk/demos/" .. L_415_arg0
		if isfolder(val_779) then
			local mapStr = isfile(val_779 .. "/map.tick") and readfile(val_779 .. "/map.tick") or "{}"; local val_780 = val_471:JSONDecode(mapStr)
			if val_780.sky then
				if not val_473:FindFirstChild("Sky") then
					local val_783 = Instance.new("Sky", val_473); val_783.Name = "Sky"
				end 
				val_473.Sky.SkyboxBk = val_780.sides["SkyboxBk"]; val_473.Sky.SkyboxDn = val_780.sides["SkyboxDn"]; val_473.Sky.SkyboxFt = val_780.sides["SkyboxFt"]; val_473.Sky.SkyboxLf = val_780.sides["SkyboxLf"]; val_473.Sky.SkyboxRt = val_780.sides["SkyboxRt"]; val_473.Sky.SkyboxUp = val_780.sides["SkyboxUp"]
			end 
			local val_781 = workspace:FindFirstChild("Map")
				if val_780.mapName or val_781 then
				if not val_781 then
						createMap(L_416_arg1 or val_780.mapName)
				end 
				repeat
					wait()
				until workspace:FindFirstChild("Map")
				val_557 = workspace.Map:GetChildren()[1]
				repeat
					wait()
				until val_557:FindFirstChild("TSpawns") and val_557:FindFirstChild("Clips") and val_557:FindFirstChild("Regen") and val_557.Regen:FindFirstChild("Props") or val_781 
				if not val_781 then
					val_557.Clips:Destroy(); val_482.CFrame = val_557.TSpawns:GetChildren()[1].CFrame + Vector3.new(0, 5, 0)
				else
					val_476.playing.Value = false
				end 
				val_525 = true; val_641 = { newKills = {}, newRounds = {}, newBombPlants = {} }; val_484 = {}; local tickNum = 1
				while true do
					local tickPath = val_779 .. "/" .. tostring(tickNum) .. ".tick"
					if isfile(tickPath) then
						local success, decoded = pcall(function() return val_471:JSONDecode(readfile(tickPath)) end)
						if success and decoded then
							table.insert(val_484, decoded)
						end
						tickNum = tickNum + 1
					else
						break
					end
				end 
				for L_426_forvar0, L_427_forvar1 in val_484 do
					L_427_forvar1.delay = L_427_forvar1.delay + 0.01
				end 
				for L_428_forvar0 = 2, # val_484, 1 do
					checkDifferences(L_428_forvar0, val_484)
				end 
				for L_429_forvar0, L_430_forvar1 in val_613:GetChildren() do
					if L_430_forvar1.Name == "kill" or L_430_forvar1.Name == "newRound" or L_430_forvar1.name == "bombPlant" then
						L_430_forvar1:Destroy()
					end
				end 
				warn("kills:"); local val_784 = 5 
				if # val_641.newKills > 0 then
					for L_431_forvar0, L_432_forvar1 in val_641.newKills do
						local val_789 = val_469.events.kill:Clone(); val_789.killer.Text = L_432_forvar1.killer; val_789.killer.TextColor3 = Color3.new(L_432_forvar1.killercolor[1], L_432_forvar1.killercolor[2], L_432_forvar1.killercolor[3]); val_789.victim.Text = L_432_forvar1.victim; val_789.victim.TextColor3 = Color3.new(L_432_forvar1.victimcolor[1], L_432_forvar1.victimcolor[2], L_432_forvar1.victimcolor[3]); val_789.time.Text = tickToSec(L_432_forvar1.tickNumber); val_789.Parent = val_613; val_789.Position = UDim2.new(0, 30, 0, val_784); val_789.killtext.Position = val_789.killer.Position + UDim2.new(0, val_789.killer.TextBounds.X + 5, 0, 0); val_789.victim.Position = val_789.killtext.Position + UDim2.new(0, val_789.killtext.TextBounds.X + 5, 0, 0); val_784 = val_784 + 35 
						val_789.move.MouseButton1Click:Connect(function()
							val_556 = math.clamp(L_432_forvar1.tickNumber - 15, 1, 387420489); playTick(val_556)
						end)
						print(L_432_forvar1.killer, "killed", L_432_forvar1.victim, "tick:", L_432_forvar1.tickNumber)
					end
				else
					print("No kills found!")
				end 
				warn("rounds:")
				if # val_641.newRounds > 0 then
					for L_434_forvar0, L_435_forvar1 in val_641.newRounds do
						local val_790 = val_469.events.newRound:Clone(); val_790.text.Text = "Round " .. tostring(L_435_forvar1.round) .. " start"; val_790.time.Text = tickToSec(L_435_forvar1.tickNumber); val_790.Parent = val_613; val_790.Position = UDim2.new(0, 30, 0, val_784); val_784 = val_784 + 35 
						val_790.move.MouseButton1Click:Connect(function()
							val_556 = L_435_forvar1.tickNumber; playTick(L_435_forvar1.tickNumber)
						end)
						print("Round", L_435_forvar1.round, "started tick:", L_435_forvar1.tickNumber)
					end
				else
					print("No new rounds found!")
				end 
				warn("bombplants:")
				if # val_641.newBombPlants > 0 then
					for L_437_forvar0, L_438_forvar1 in val_641.newBombPlants do
						local val_791 = val_469.events.bombPlant:Clone(); val_791.time.Text = tickToSec(L_438_forvar1.tickNumber); val_791.Parent = val_613; val_791.Position = UDim2.new(0, 30, 0, val_784); val_784 = val_784 + 35 
						val_791.move.MouseButton1Click:Connect(function()
							val_556 = L_438_forvar1.tickNumber; playTick(L_438_forvar1.tickNumber)
						end)
						print("Bomb planted on round", L_438_forvar1.round, "tick:", L_438_forvar1.tickNumber)
					end
				else
					print("No bomb plants found!")
				end 
				local val_785 = val_613.size.ScrollingFrame; val_785.CanvasSize = UDim2.new(0, 0, 0, 5 + (# val_785:GetChildren() - 1) * 35); val_552 = 0 
				for L_440_forvar0, L_441_forvar1 in val_557.Regen.Props:GetChildren() do
					L_441_forvar1.Transparency = 0
				end 
				if val_557.Regen:FindFirstChild("Glasses") then
					for L_442_forvar0, L_443_forvar1 in val_557.Regen.Glasses:GetChildren() do
						L_443_forvar1.Transparency = 0.5
					end
				end 
				val_556 = 0; local val_786 = 0; val_621 = # val_484; local val_787 = game:GetService("RunService")
				while val_556 < # val_484 do
					val_640 = true; local val_793 = val_476.reverse.Value and -1 or 1; val_556 = math.clamp(val_556 + val_793, 1, # val_484); local val_794, val_795 = 387420489, nil 
					if val_476.keyframing.Value and val_537 == "freecam" and val_476.playing.Value then
						if # val_624 > 1 then
							for L_447_forvar0, L_448_forvar1 in val_624 do
								if L_448_forvar1.tick < val_794 then
									val_794, val_795 = L_448_forvar1.tick, L_448_forvar1.cf
								end
							end 
							if val_794 > val_556 then
								val_556 = val_794; val_482.CFrame = val_795
							end
						end
					end 
					CreateThread(function()
						playTick(val_556)
					end)
					if val_476.speed.Value >= 1 and val_476.speed.Value < 20 then
						for L_449_forvar0 = 1, val_476.speed.Value do
							wait(0.03)
						end
					else
						val_786 = val_786 + 1 
						if val_786 == val_476.speed.Value / 10 then
							wait(0.03); val_786 = 0
						end
					end 
					val_605.playing.Visible = false 
					if not val_476.playing.Value then
						val_605.playing.Visible = true 
						repeat
							wait()
						until val_476.playing.Value or val_476.stop.Value
					end 
					if val_476.stop.Value then
						break
					end
				end
			end
		end 
		val_640 = false; val_605.player.pauseresume.Image = "rbxassetid://4458863290"
		if val_476.stop.Value then
			val_624 = {}
			if env.DemoFlags["depth_of_field_map"] then
				val_612.options["depth_of_field_map"].changeState(false)
			end 
			if env.DemoFlags["greenscreen_map"] then
				val_612.options["greenscreen_map"].changeState(false)
			end 
			for L_450_forvar0, L_451_forvar1 in val_613:GetChildren() do
				if L_451_forvar1.Name == "kill" or L_451_forvar1.Name == "newRound" or L_451_forvar1.name == "bombPlant" then
					L_451_forvar1:Destroy()
				end
			end 
			val_525 = false; val_473.Blur.Enabled = true; val_605.demolist.Visible = true; val_605.player.Visible = false; val_605.settings.Visible = false; val_605.playing.Visible = false; val_605.hud.Spectate.Visible = false; val_605.hud.Vitals.Visible = false; val_605.hud.AmmoGUI.Visible = false; val_605.crosshair.Visible = false 
			if val_473:FindFirstChild("Sky") then
				val_473.Sky:Destroy()
			end 
			updateKeyframes()
			if workspace:FindFirstChild("Map") then
				workspace.Map:Destroy()
			end 
			for L_452_forvar0, L_453_forvar1 in workspace.demoModels:GetDescendants() do
				if not L_453_forvar1:IsA("Folder") then
					L_453_forvar1:Destroy()
				end
			end
		end
	end 
	workspace.start.Event:Connect(playDemo)
	workspace.changeAmount.Event:Connect(function(L_454_arg0)
		val_556 = val_556 + L_454_arg0 
		if not val_476.playing.Value then
			playTick(val_556)
		end
	end)
	workspace.changeTick.Event:Connect(function(L_455_arg0)
		if val_640 then
			val_556 = math.clamp(math.floor(val_621 / 100 * L_455_arg0), 1, val_621) - 1; ignoreSound = true; playTick(val_556)
		end
	end)
	val_605.player.pauseresume.MouseButton1Click:Connect(function()
		if not val_640 then
			for L_456_forvar0, L_457_forvar1 in workspace.demoModels:GetDescendants() do
				if not L_457_forvar1:IsA("Folder") then
					L_457_forvar1:Destroy()
				end
			end 
			playDemo(val_639)
		end
	end)
	val_605.player.stop.MouseButton1Click:Connect(function()
		if not val_640 then
			if not val_476.playing.Value then
				val_525 = false; val_473.Blur.Enabled = true; val_605.demolist.Visible = true; val_605.player.Visible = false; val_605.settings.Visible = false; val_473.Sky.SkyboxBk = ""; val_473.Sky.SkyboxDn = ""; val_473.Sky.SkyboxFt = ""; val_473.Sky.SkyboxLf = ""; val_473.Sky.SkyboxRt = ""; val_473.Sky.SkyboxUp = ""; workspace.Map:Destroy()
				for L_458_forvar0, L_459_forvar1 in workspace.demoModels:GetDescendants() do
					if not L_459_forvar1:IsA("Folder") then
						L_459_forvar1:Destroy()
					end
				end
			end
		end
	end)
	val_605.player.reverse.MouseButton1Click:Connect(function()
		val_476.reverse.Value = not val_476.reverse.Value; val_605.player.reverse.Text = "Reverse: " .. tostring(val_476.reverse.Value)
	end)
	local val_642 = 5; local val_643 = Vector2.new(0, math.rad(-60)); local val_644 = { math.rad(-81), math.rad(20) }
	game:GetService("RunService").RenderStepped:Connect(function()
		if val_537 == "follow" then
			if workspace.demoModels:FindFirstChild(val_536) then
				if val_520 and val_616[val_536] and val_618[val_536] ~= "" then
					val_482.CameraType = "Scriptable"; val_482.CameraSubject = nil; local val_798 = val_616[val_536]:split(" "); local val_799 = TweenInfo.new(workspace.settings.tween.Value, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0); local val_800 = val_474:Create(val_482, val_799, { CFrame = CFrame.new(Vector3.new(val_798[1], val_798[2], val_798[3]), Vector3.new(val_798[4], val_798[5], val_798[6])) + val_636 }); val_800:Play()
					if val_540 and (val_618[val_536] ~= val_540.Name or not val_520) then
						val_540:Destroy(); val_540 = nil
					end 
					if not val_540 then
						val_540 = val_469.Viewmodels["v_" .. val_618[val_536]]:Clone(); val_540.Name = val_618[val_536]; val_540.Parent = workspace.demoModels; val_540["Right Arm"].Transparency = 1; local val_801 = val_469.Viewmodels[val_617[val_536]]:Clone(); local val_802 = Instance.new("Weld", val_801["Right Arm"]); val_802.C0 = CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)); val_802.Part0 = val_801["Right Arm"]; val_802.Part1 = val_540["Right Arm"]
						if val_540:FindFirstChild("Left Arm") then
							local val_805 = Instance.new("Weld", val_801["Left Arm"]); val_805.C0 = CFrame.Angles(math.rad(90), math.rad(0), math.rad(-90)); val_540["Left Arm"].Transparency = 1; val_805.Part0 = val_801["Left Arm"]; val_805.Part1 = val_540["Left Arm"]
						else
							val_801["Left Arm"]:Destroy()
						end 
						val_801.Name = "arms"; val_801.Parent = val_540; local val_803 = val_469.Skins:FindFirstChild(val_618[val_536]) and val_469.Skins[val_618[val_536]]:FindFirstChild(val_619[val_536]) or nil 
						if val_803 then
							for L_468_forvar0, L_469_forvar1 in val_540:GetChildren() do
								if L_469_forvar1.ClassName == "MeshPart" then
									local val_807 = val_803:FindFirstChild(L_469_forvar1.Name, true)
									if val_807 then
										L_469_forvar1.TextureID = val_807.Value
									end
								end
							end
						end 
						local val_804 = val_540.Guy:LoadAnimation(val_540.equip)
						if val_469.Weapons:FindFirstChild(val_618[val_536]) then
							if val_469.Weapons[val_618[val_536]].Model:FindFirstChild("Equip") then
								playAudio(val_469.Weapons[val_618[val_536]].Model.Equip, workspace)
							else
								local val_808 = val_469.Weapons[val_618[val_536]].Model:FindFirstChild("bolt") or val_469.Weapons[val_618[val_536]].Model:FindFirstChild("slide"); local val_809 = val_469.Weapons[val_618[val_536]].Model:FindFirstChild("boltin") or val_469.Weapons[val_618[val_536]].Model:FindFirstChild("slidein")
								if val_808 and val_809 then
									spawn(function()
										wait(0.1); playAudio(val_808, workspace); wait(val_808.TimeLength * 0.75 * val_506[val_546]); playAudio(val_809, workspace)
									end)
								end
							end
						end 
						val_804:Play(); val_804:AdjustSpeed(val_500[val_546])
					end 
					val_540:SetPrimaryPartCFrame((val_622 and CFrame.new() or val_482.CFrame * val_629 * val_630) * CFrame.new((env.DemoFlags["viewmodel_x"] - 20) / 10, (env.DemoFlags["viewmodel_y"] - 20) / 10, (env.DemoFlags["viewmodel_z"] - 20) / 10))
				else
					val_482.CameraType = "Follow"; val_482.CameraSubject = workspace.demoModels[val_536].LowerTorso
				end
			end
		elseif val_537 == "freecam" then
			val_482.CameraType = "Scriptable"; val_482.CameraSubject = nil 
			if not (val_476.keyframing.Value and val_476.playing.Value) then
				local val_810 = val_482.CFrame.LookVector / 50 * env.DemoFlags["camera_speed"]; local val_811 = Vector3.new(); val_811 = val_472:IsKeyDown(Enum.KeyCode.W) and val_811 + val_810 or val_811; val_811 = val_472:IsKeyDown(Enum.KeyCode.S) and val_811 - val_810 or val_811; val_811 = val_472:IsKeyDown(Enum.KeyCode.D) and val_811 + Vector3.new(- val_810.Z, 0, val_810.X) or val_811; val_811 = val_472:IsKeyDown(Enum.KeyCode.A) and val_811 - Vector3.new(- val_810.Z, 0, val_810.X) or val_811; val_811 = val_472:IsKeyDown(Enum.KeyCode.Q) and val_811 + Vector3.new(0, val_810.Y, 0) or val_811; val_811 = val_472:IsKeyDown(Enum.KeyCode.E) and val_811 - Vector3.new(0, val_810.Y, 0) or val_811; val_811 = val_811 * 1.25; local val_812 = val_472:GetMouseDelta() / 30; val_643 = val_643 + val_812 * math.rad(15); local val_813 = CFrame.Angles(0, - val_643.X, 0) * CFrame.Angles(- val_643.Y, 0, 0); val_482.CFrame = val_813 + val_482.CFrame.p + val_811 + val_813 * Vector3.new(0, 0, 0)
			end 
			if val_540 then
				val_540:Destroy(); val_540 = nil
			end
		end 
		val_597.Saturation = env.DemoFlags["world_saturation"] and env.DemoFlags["saturation_value"] / 50 or 0 
		if env.DemoFlags["world_gradient"] then
			val_473.Ambient = env.DemoFlags["gradient_color"]
			val_473.OutdoorAmbient = env.DemoFlags["outdoor_gradient_color"]
		else
			val_473.Ambient = val_583 
			val_473.OutdoorAmbient = val_592
		end 
		val_472.MouseBehavior = val_525 and not val_605.player.Visible and Enum.MouseBehavior.LockCenter or Enum.MouseBehavior.Default; val_472.MouseIconEnabled = val_605.demolist.Visible or val_605.player.Visible; game.StarterGui:SetCoreGuiEnabled("PlayerList", false); game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.All, false); game.CoreGui.ThemeProvider.Enabled = false; game.CoreGui.TopBarApp.Enabled = false
	end)
	game:GetService("RunService").Stepped:Connect(function()
		local demoModels = workspace:FindFirstChild("demoModels")
		if not demoModels or #demoModels:GetChildren() == 0 then return end
		for L_477_forvar0, L_478_forvar1 in demoModels:GetChildren() do
			if L_478_forvar1:IsA("Model") then
				for L_479_forvar0, L_480_forvar1 in L_478_forvar1:GetChildren() do
					if L_480_forvar1:IsA("BasePart") then
						L_480_forvar1.CanCollide = false
					end
				end
			end
		end
	end)
	game:GetService("UserInputService").InputBegan:Connect(function(L_481_arg0)
		if L_481_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
			if val_572.Target and val_572.Target.Parent.Parent == workspace.demoModels and val_572.Target.Parent:FindFirstChild("FakeHead") then
				val_536 = val_572.Target.Parent.Name; val_537 = "follow"
				if not val_476.playing.Value then
					playTick(val_556)
				end
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["toggle_ui"] and val_525 then
			val_605.player.Visible = not val_605.player.Visible; val_605.settings.Visible = val_605.player.Visible; val_612.scrolling = false; val_612.colorpicking = false 
			for L_482_forvar0, L_483_forvar1 in val_612.toInvis do
				L_483_forvar1.Visible = false
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["toggle_spec_mode"] then
			val_537 = val_537 == "follow" and "freecam" or val_537 
			if not val_476.playing.Value then
				playTick(val_556)
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["pause_resume"] then
			if not val_640 and val_525 then
				for L_484_forvar0, L_485_forvar1 in workspace.demoModels:GetDescendants() do
					if not L_485_forvar1:IsA("Folder") then
						L_485_forvar1:Destroy()
					end
				end 
				playDemo(val_639)
			elseif val_525 then
				val_476.playing.Value = not val_476.playing.Value
			end
		elseif L_481_arg0.KeyCode == Enum.KeyCode.Left then
			val_556 = val_556 - 1 
			if not val_476.playing.Value then
				playTick(val_556)
			end
		elseif L_481_arg0.KeyCode == Enum.KeyCode.Right then
			val_556 = val_556 + 1 
			if not val_476.playing.Value then
				playTick(val_556)
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["toggle_firstperson"] then
			val_520 = not val_520 
			if not val_476.playing.Value then
				playTick(val_556)
			end
		elseif L_481_arg0.KeyCode == env.DemoFlags["increase_playback_speed"] then
			val_546 = math.clamp(val_546 + 1, 1, 5); workspace.settings.speed.Value = val_490[val_546]
		elseif L_481_arg0.KeyCode == env.DemoFlags["decrease_playback_speed"] then
			val_546 = math.clamp(val_546 - 1, 1, 5); workspace.settings.speed.Value = val_490[val_546]
		elseif L_481_arg0.KeyCode == Enum.KeyCode.Z then
		elseif L_481_arg0.KeyCode == Enum.KeyCode.F then
		end
	end)
	val_482:GetPropertyChangedSignal("CFrame"):Connect(function()
		if val_540 and val_520 and val_540.PrimaryPart then
			val_540:SetPrimaryPartCFrame((val_622 and CFrame.new() or val_482.CFrame * val_629 * val_630) * CFrame.new((env.DemoFlags["viewmodel_x"] - 20) / 10, (env.DemoFlags["viewmodel_y"] - 20) / 10, (env.DemoFlags["viewmodel_z"] - 20) / 10))
		end
	end)
	function draggable(L_486_arg0)
		local val_815 = val_472; local val_816; local val_817; local val_819; local val_820 
		local function L_492_func(L_493_arg0)
			if not val_612.colorpicking then
				local val_821 = L_493_arg0.Position - val_819; L_486_arg0.Position = UDim2.new(val_820.X.Scale, val_820.X.Offset + val_821.X, val_820.Y.Scale, val_820.Y.Offset + val_821.Y)
			end
		end 
		L_486_arg0.InputBegan:Connect(function(L_495_arg0)
			if L_495_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_495_arg0.UserInputType == Enum.UserInputType.Touch then
				val_816 = true; val_819 = L_495_arg0.Position; val_820 = L_486_arg0.Position 
				L_495_arg0.Changed:Connect(function()
					if L_495_arg0.UserInputState == Enum.UserInputState.End then
						val_816 = false
					end
				end)
			end
		end)
		L_486_arg0.InputChanged:Connect(function(L_496_arg0)
			if L_496_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_496_arg0.UserInputType == Enum.UserInputType.Touch then
				val_817 = L_496_arg0
			end
		end)
		val_815.InputChanged:Connect(function(L_497_arg0)
			if L_497_arg0 == val_817 and val_816 then
				L_492_func(L_497_arg0)
			end
		end)
	end 
	draggable(val_609.settings)
	function val_612:addTab(L_498_arg0)
		local val_822 = val_611.tab:Clone(); local val_825 = val_611.tabbuttons.button:Clone(); table.insert(val_612.tabs, val_822); val_822.Parent = val_611; val_822.Visible = false; table.insert(val_612.tabbuttons, val_825); val_825.Parent = val_611.tabbuttons; val_825.Modal = true; val_825.Visible = true; val_825.Text = L_498_arg0 
		val_825.MouseButton1Click:Connect(function()
			for L_505_forvar0, L_506_forvar1 in val_612.tabs do
				L_506_forvar1.Visible = L_506_forvar1 == val_822
			end 
			for L_507_forvar0, L_508_forvar1 in val_612.toInvis do
				L_508_forvar1.Visible = false
			end
		end)
		for L_509_forvar0, L_510_forvar1 in val_612.tabbuttons do
			L_510_forvar1.Size = UDim2.new(1 / # val_612.tabbuttons, 0, 1, 0)
		end 
		local val_826 = {}; local val_827 = 0; local val_828 = 0; local val_829 = 2000 
		function val_826:createGroup(L_511_arg0)
			local val_831 = Instance.new("Frame"); local val_832 = Instance.new("Frame"); local val_833 = Instance.new("UIListLayout"); val_827 = val_827 - 1; val_831.Parent = val_822[L_511_arg0 == 0 and "left" or "right"]; val_831.BackgroundColor3 = Color3.fromRGB(35, 35, 35); val_831.BorderSizePixel = 0; val_831.Size = UDim2.new(1, -5, 0, 10); val_831.ZIndex = val_827; val_831.Parent.UIListLayout.Padding = UDim.new(0, 5); val_832.Parent = val_831; val_832.BackgroundColor3 = Color3.fromRGB(255, 255, 255); val_832.BackgroundTransparency = 1; val_832.Position = UDim2.new(0, 5, 0, 7); val_832.Size = UDim2.new(1, 0, 1, 0); val_833.Parent = val_832; val_833.Padding = UDim.new(0, 5); val_833.SortOrder = "LayoutOrder"; local val_834 = {}
			function val_834:addToggle(L_516_arg0)
				if not L_516_arg0.flag and L_516_arg0.text then
					L_516_arg0.flag = L_516_arg0.text
				end 
				if not L_516_arg0.flag then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end 
				val_831.Size = val_831.Size + UDim2.new(0, 0, 0, 23); local val_835 = Instance.new("TextButton"); local val_836 = Instance.new("Frame"); local val_837 = Instance.new("TextLabel"); val_828 = val_828 - 1; val_835.Parent = val_832; val_835.BackgroundColor3 = Color3.fromRGB(255, 255, 255); val_835.BackgroundTransparency = 1; val_835.Size = UDim2.new(1, 0, 0, 18); val_835.Text = ""; val_835.TextColor3 = Color3.fromRGB(0, 0, 0); val_835.TextSize = 14; val_835.ZIndex = val_828; val_836.Parent = val_835; val_836.BackgroundColor3 = Color3.fromRGB(20, 20, 20); val_836.BorderColor3 = Color3.fromRGB(50, 50, 50); val_836.Size = UDim2.new(0, 18, 0, 18); val_837.Parent = val_836; val_837.BackgroundColor3 = Color3.fromRGB(255, 255, 255); val_837.BorderSizePixel = 0; val_837.Position = UDim2.new(1, 10, 0, 0); val_837.Size = UDim2.new(0, 0, 1, 0); val_837.Font = "SourceSans"; val_837.Text = L_516_arg0.text or L_516_arg0.flag; val_837.TextColor3 = Color3.fromRGB(255, 255, 255); val_837.TextSize = 16; val_837.TextXAlignment = "Left"; local val_839 = false 
				local function L_521_func(L_522_arg0)
					val_839 = L_522_arg0; val_836.BackgroundColor3 = val_839 and val_612.libColor or Color3.fromRGB(20, 20, 20); env.DemoFlags[L_516_arg0.flag] = val_839 
					if L_516_arg0.callback then
						L_516_arg0.callback(val_839)
					end
				end 
				val_835.MouseButton1Click:Connect(function()
					val_839 = not val_839; val_836.BackgroundColor3 = val_839 and val_612.libColor or Color3.fromRGB(20, 20, 20); env.DemoFlags[L_516_arg0.flag] = val_839 
					if L_516_arg0.callback then
						L_516_arg0.callback(val_839)
					end
				end)
				env.DemoFlags[L_516_arg0.flag] = false; val_612.options[L_516_arg0.flag] = { type = "toggle", changeState = L_521_func, skipflag = L_516_arg0.skipflag, oldargs = L_516_arg0 }
				if L_516_arg0.state then
					L_521_func(L_516_arg0.state)
				end
			end 
			function val_834:addButton(L_523_arg0)
				if not L_523_arg0.callback or not L_523_arg0.text then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end 
				val_831.Size = val_831.Size + UDim2.new(0, 0, 0, 23); local val_840 = Instance.new("TextButton"); val_840.Parent = val_832; val_840.BackgroundColor3 = Color3.fromRGB(20, 20, 20); val_840.BorderColor3 = Color3.fromRGB(50, 50, 50); val_840.Size = UDim2.new(1, -10, 0, 18); val_840.AutoButtonColor = false; val_840.TextColor3 = Color3.fromRGB(255, 255, 255); val_840.Font = "SourceSans"; val_840.TextSize = 16; val_840.Text = L_523_arg0.text 
				val_840.MouseButton1Click:Connect(function()
					if not val_612.colorpicking then
						L_523_arg0.callback()
					end
				end)
			end 
			function val_834:addSlider(L_525_arg0)
				if not L_525_arg0.flag or not L_525_arg0.max then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end 
				val_831.Size = val_831.Size + UDim2.new(0, 0, 0, 41); local val_841 = Instance.new("Frame"); local val_842 = Instance.new("TextButton"); local val_843 = Instance.new("TextLabel"); local val_844 = Instance.new("Frame"); local val_846 = Instance.new("TextLabel"); val_841.Parent = val_832; val_841.BackgroundColor3 = Color3.fromRGB(255, 255, 255); val_841.BackgroundTransparency = 1; val_841.Size = UDim2.new(1, 0, 0, 36); val_842.Parent = val_841; val_842.BackgroundColor3 = Color3.fromRGB(20, 20, 20); val_842.BorderColor3 = Color3.fromRGB(50, 50, 50); val_842.Position = UDim2.new(0, 0, 0, 18); val_842.Size = UDim2.new(1, -10, 0, 18); val_842.AutoButtonColor = false; val_842.Font = Enum.Font.Code; val_842.Text = ""; val_842.TextColor3 = Color3.fromRGB(255, 255, 255); val_842.TextSize = 14; val_843.Parent = val_842; val_843.BackgroundColor3 = Color3.fromRGB(255, 255, 255); val_843.BackgroundTransparency = 1; val_843.BorderSizePixel = 0; val_843.Position = UDim2.new(0, 0, -1, 0); val_843.Size = UDim2.new(1, 0, 1, 0); val_843.Font = Enum.Font.Code; val_843.Text = L_525_arg0.text or L_525_arg0.flag; val_843.TextColor3 = Color3.fromRGB(255, 255, 255); val_843.TextSize = 16; val_843.TextXAlignment = "Left"; val_843.TextYAlignment = "Top"; val_844.Parent = val_842; val_844.BackgroundColor3 = val_612.libColor; val_844.BorderSizePixel = 0; val_844.Size = UDim2.new(0, 0, 1, 0); val_844.ZIndex = 0; val_846.Parent = val_842; val_846.BackgroundColor3 = Color3.fromRGB(255, 255, 255); val_846.BackgroundTransparency = 1; val_846.Size = UDim2.new(1, 0, 1, 0); val_846.Font = Enum.Font.Code; val_846.Text = "0"; val_846.TextColor3 = Color3.fromRGB(150, 150, 150); val_846.TextSize = 16; local val_847 = false; local val_848 = false; local val_849 = 0 
				local function L_534_func(L_536_arg0)
					if L_536_arg0 ~= 0 then
						val_844:TweenSize(UDim2.new(L_536_arg0 / L_525_arg0.max, 0, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.01)
					else
						val_844:TweenSize(UDim2.new(0, 1, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.01)
					end 
					val_846.Text = L_536_arg0; env.DemoFlags[L_525_arg0.flag] = L_536_arg0 
					if L_525_arg0.callback then
						L_525_arg0.callback(L_536_arg0)
					end
				end 
				local function L_535_func()
					if val_848 or val_612.scrolling or not val_822.Visible or val_612.colorpicking then
						return
					end 
					while val_472:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and val_609.Enabled do
						val_565.RenderStepped:Wait()
						val_612.scrolling = true; val_846.TextColor3 = Color3.fromRGB(255, 255, 255); val_848 = true; local val_850 = L_525_arg0.min + (val_572.X - val_842.AbsolutePosition.X) / val_842.AbsoluteSize.X * (L_525_arg0.max - L_525_arg0.min)
						if val_850 < 0 then
							val_850 = 0
						end 
						if val_850 > L_525_arg0.max then
							val_850 = L_525_arg0.max
						end 
						L_534_func(math.floor(val_850))
					end 
					if val_848 and not val_847 then
						val_846.TextColor3 = Color3.fromRGB(150, 150, 150)
					end 
					if not val_609.Enabled then
						val_847 = false
					end 
					val_848 = false; val_612.scrolling = false
				end 
				val_842.MouseEnter:connect(function()
					if val_848 or val_847 then
						return
					end 
					val_847 = true; val_846.TextColor3 = Color3.fromRGB(255, 255, 255)
					while val_847 do
						wait(); L_535_func()
					end
				end)
				val_842.MouseLeave:connect(function()
					val_847 = false; val_846.TextColor3 = Color3.fromRGB(150, 150, 150)
				end)
				if L_525_arg0.value then
					L_534_func(L_525_arg0.value)
				end 
				env.DemoFlags[L_525_arg0.flag] = 0; val_612.options[L_525_arg0.flag] = { type = "slider", changeState = L_534_func, skipflag = L_525_arg0.skipflag, oldargs = L_525_arg0 }; L_534_func(L_525_arg0.value or 0)
			end 
			function val_834:addDivider()
				val_831.Size = val_831.Size + UDim2.new(0, 0, 0, 3); local val_851 = Instance.new("Frame"); val_851.Parent = val_832; val_851.BackgroundColor3 = Color3.fromRGB(25, 25, 25); val_851.Size = UDim2.new(1, -10, 0, 1); val_851.BorderSizePixel = 0 
				val_851.Name = "dontchange"
			end 
			function val_834:addTextbox(L_539_arg0)
				if not L_539_arg0.flag then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end 
				local val_853 = Instance.new("TextBox"); val_831.Size = val_831.Size + UDim2.new(0, 0, 0, 23)
				val_853:GetPropertyChangedSignal('Text'):Connect(function(L_541_arg0)
					env.DemoFlags[L_539_arg0.flag] = val_853.Text
				end)
				val_853.Parent = val_832; val_853.BackgroundColor3 = Color3.fromRGB(20, 20, 20); val_853.BorderColor3 = Color3.fromRGB(50, 50, 50); val_853.Size = UDim2.new(1, -10, 0, 18); val_853.ClearTextOnFocus = false; val_853.Font = Enum.Font.Code; val_853.PlaceholderColor3 = Color3.fromRGB(130, 130, 130); val_853.PlaceholderText = L_539_arg0.text or ""; val_853.Text = ""; val_853.TextColor3 = Color3.fromRGB(255, 255, 255); val_853.TextSize = 16; env.DemoFlags[L_539_arg0.flag] = ""
				val_612.options[L_539_arg0.flag] = {
					type = "textbox",
					changeState = function(L_542_arg0)
						val_853.Text = L_542_arg0
					end,
					skipflag = L_539_arg0.skipflag, oldargs = L_539_arg0
				}
			end 
			function val_834:addKeybind(L_543_arg0)
				if not L_543_arg0.flag then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end 
				val_831.Size = val_831.Size + UDim2.new(0, 0, 0, 23); local val_854 = Instance.new("TextButton"); local val_855 = Instance.new("TextLabel"); local val_856 = Instance.new("TextLabel"); local val_857 = false; val_854.Parent = val_832; val_854.BackgroundColor3 = Color3.fromRGB(20, 20, 20); val_854.BorderColor3 = Color3.fromRGB(50, 50, 50); val_854.Size = UDim2.new(0.55, 0, 0, 18); val_854.AutoButtonColor = false; val_854.TextColor3 = Color3.new(1, 1, 1); val_854.Font = "SourceSans"; val_854.TextSize = 16; val_854.Text = ""; val_856.Parent = val_854; val_856.BackgroundTransparency = 1; val_856.Position = UDim2.new(0, 0, 0, 0); val_856.Size = UDim2.new(1, 0, 1, 0); val_856.Font = "SourceSans"; val_856.Text = ""; val_856.TextColor3 = Color3.fromRGB(255, 255, 255); val_856.TextSize = 16; val_856.TextXAlignment = "Left"
				val_856.ClipsDescendants = true 
				val_856.TextXAlignment = "Center"; val_855.Parent = val_854; val_855.BackgroundColor3 = Color3.fromRGB(255, 255, 255); val_855.BorderSizePixel = 0; val_855.Position = UDim2.new(1, 10, 0, 0); val_855.Size = UDim2.new(0, 0, 1, 0); val_855.Font = "SourceSans"; val_855.Text = L_543_arg0.text or L_543_arg0.flag; val_855.TextColor3 = Color3.fromRGB(255, 255, 255); val_855.TextSize = 16; val_855.TextXAlignment = "Left"
				function updateValue(L_548_arg0)
					env.DemoFlags[L_543_arg0.flag] = L_548_arg0; val_856.Text = string.split(tostring(L_548_arg0), ".")[3]:gsub("MouseButton", "Mouse")
				end 
				val_472.InputBegan:Connect(function(L_549_arg0)
					local val_859 = L_549_arg0.KeyCode == Enum.KeyCode.Unknown and L_549_arg0.UserInputType or L_549_arg0.KeyCode 
					if val_857 then
						if not table.find(val_612.blacklisted, val_859) then
							val_857 = false; env.DemoFlags[L_543_arg0.flag] = val_859; val_856.Text = string.split(tostring(val_859), ".")[3]:gsub("MouseButton", "Mouse")
						end
					end 
					if not val_857 and val_859 == env.DemoFlags[L_543_arg0.flag] and L_543_arg0.callback then
						L_543_arg0.callback()
					end
				end)
				val_854.MouseButton1Click:Connect(function()
					env.DemoFlags[L_543_arg0.flag] = Enum.KeyCode.Unknown; val_856.Text = "..."; val_857 = true
				end)
				env.DemoFlags[L_543_arg0.flag] = Enum.KeyCode.Unknown; val_612.options[L_543_arg0.flag] = { type = "keybind", changeState = updateValue, skipflag = L_543_arg0.skipflag, oldargs = L_543_arg0 }; updateValue(L_543_arg0.key or Enum.KeyCode.Unknown)
			end 
			function val_834:addList(L_551_arg0)
				if not L_551_arg0.flag or not L_551_arg0.values then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end 
				val_831.Size = val_831.Size + UDim2.new(0, 0, 0, 23); val_612.multiZindex = val_612.multiZindex - 1; local val_860 = Instance.new("TextButton"); local val_861 = Instance.new("Frame"); local val_862 = Instance.new("UIListLayout"); local val_863 = Instance.new("TextLabel"); local val_864 = Instance.new("TextLabel"); val_862.Parent = val_861; val_862.Padding = UDim.new(0, 0); val_862.SortOrder = "LayoutOrder"; val_860.Parent = val_832; val_860.BackgroundColor3 = Color3.fromRGB(20, 20, 20); val_860.BorderColor3 = Color3.fromRGB(50, 50, 50); val_860.Size = UDim2.new(0.65, 0, 0, 18); val_860.AutoButtonColor = false; val_860.TextColor3 = Color3.new(1, 1, 1); val_860.Font = "SourceSans"; val_860.TextSize = 16; val_860.Text = ""; val_860.ZIndex = val_612.multiZindex; val_864.Parent = val_860; val_864.BackgroundTransparency = 1; val_864.Position = UDim2.new(0, 0, 0, 0); val_864.Size = UDim2.new(1, 0, 1, 0); val_864.Font = "SourceSans"; val_864.Text = L_551_arg0.multiselect and "..." or ""; val_864.TextColor3 = Color3.fromRGB(255, 255, 255); val_864.TextSize = 16; val_864.TextXAlignment = "Left"
				val_864.ClipsDescendants = true 
				val_864.TextXAlignment = "Center"; val_861.ZIndex = val_612.multiZindex; val_861.Visible = false; val_861.Parent = val_860; val_861.Transparency = 0; val_861.Size = UDim2.new(1, 0, 0, # L_551_arg0.values * 18); val_861.BorderColor3 = Color3.fromRGB(50, 50, 50); val_861.Position = UDim2.new(0, 0, 1, 0); val_863.Parent = val_860; val_863.BackgroundColor3 = Color3.fromRGB(255, 255, 255); val_863.BorderSizePixel = 0; val_863.Position = UDim2.new(1, 10, 0, 0); val_863.Size = UDim2.new(0, 0, 1, 0); val_863.Font = "SourceSans"; val_863.Text = L_551_arg0.text or L_551_arg0.flag; val_863.TextColor3 = Color3.fromRGB(255, 255, 255); val_863.TextSize = 16; val_863.TextXAlignment = "Left"
				local function L_557_func(L_558_arg0)
					if L_558_arg0 == nil then
						val_864.Text = ""; return
					end 
					if L_551_arg0.multiselect then
						if type(L_558_arg0) == "string" then
							if not table.find(val_612.options[L_551_arg0.flag].values, L_558_arg0) then
								return
							end 
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
						end 
						local val_865 = ""
						for L_562_forvar0, L_563_forvar1 in env.DemoFlags[L_551_arg0.flag] do
							local val_867 = L_562_forvar0 ~= # env.DemoFlags[L_551_arg0.flag] and "," or ""; val_865 = val_865 .. " " .. L_563_forvar1 .. val_867
						end 
						if val_865 == "" then
							val_865 = "..."
						end 
						for L_565_forvar0, L_566_forvar1 in val_861:GetChildren() do
							if L_566_forvar1.ClassName ~= "TextButton" then
								continue 
							end 
							L_566_forvar1.TextColor3 = Color3.new(0.65, 0.65, 0.65)
							for L_567_forvar0, L_568_forvar1 in env.DemoFlags[L_551_arg0.flag] do
								if L_566_forvar1.Name == L_568_forvar1 then
									L_566_forvar1.TextColor3 = Color3.new(1, 1, 1)
								end
							end
						end 
						val_864.Text = val_865 
						if L_551_arg0.callback then
							L_551_arg0.callback(env.DemoFlags[L_551_arg0.flag])
						end
					else
						if not table.find(val_612.options[L_551_arg0.flag].values, L_558_arg0) then
							L_558_arg0 = val_612.options[L_551_arg0.flag].values[1]
						end 
						env.DemoFlags[L_551_arg0.flag] = L_558_arg0 
						for L_569_forvar0, L_570_forvar1 in val_861:GetChildren() do
							if L_570_forvar1.ClassName ~= "TextButton" then
								continue 
							end 
							L_570_forvar1.TextColor3 = Color3.new(0.65, 0.65, 0.65)
							if L_570_forvar1.Name == env.DemoFlags[L_551_arg0.flag] then
								L_570_forvar1.TextColor3 = Color3.new(1, 1, 1)
							end
						end 
						val_861.Visible = false 
						if env.DemoFlags[L_551_arg0.flag] then
							val_864.Text = env.DemoFlags[L_551_arg0.flag]
							if L_551_arg0.callback then
								L_551_arg0.callback(env.DemoFlags[L_551_arg0.flag])
							end
						end
					end
				end 
				function refresh(L_571_arg0)
					for L_572_forvar0, L_573_forvar1 in val_861:GetChildren() do
						if L_573_forvar1.ClassName == "TextButton" then
							L_573_forvar1:Destroy()
						end
					end 
					for L_574_forvar0, L_575_forvar1 in L_571_arg0 do
						local val_869 = Instance.new("TextButton"); val_869.ZIndex = 1000; val_869.Visible = true; val_869.Parent = val_861; val_869.Transparency = 0; val_869.Size = UDim2.new(1, 0, 0, 18); val_869.Position = UDim2.new(0, 0, 0, 0); val_869.BackgroundColor3 = Color3.fromRGB(20, 20, 20); val_869.TextColor3 = L_551_arg0.multiselect and Color3.new(0.65, 0.65, 0.65) or Color3.new(1, 1, 1); val_869.BorderSizePixel = 0; val_869.AutoButtonColor = false; val_869.TextSize = 16; val_869.Font = "SourceSans"; val_869.Text = L_575_forvar1; val_869.Name = L_575_forvar1 
						val_869.MouseButton1Click:Connect(function()
							L_557_func(L_575_forvar1)
						end)
					end 
					val_612.options[L_551_arg0.flag].values = L_571_arg0; L_557_func(table.find(val_612.options[L_551_arg0.flag].values, env.DemoFlags[L_551_arg0.flag]) and env.DemoFlags[L_551_arg0.flag] or val_612.options[L_551_arg0.flag].values[1])
				end 
				val_860.MouseButton1Click:Connect(function()
					if not val_612.colorpicking then
						val_861.Visible = not val_861.Visible
					end
				end)
				table.insert(val_612.toInvis, val_861); env.DemoFlags[L_551_arg0.flag] = L_551_arg0.multiselect and {} or ""; val_612.options[L_551_arg0.flag] = { type = "list", changeState = L_557_func, values = L_551_arg0.values, refresh = refresh, skipflag = L_551_arg0.skipflag, oldargs = L_551_arg0 }; refresh(L_551_arg0.values); L_557_func(L_551_arg0.value or not L_551_arg0.multiselect and L_551_arg0.values[1] or "abcdefghijklmnopqrstuwvxyz")
			end 
			function val_834:addColorpicker(L_577_arg0)
				if not L_577_arg0.flag then
					return warn("âš ï¸ incorrect arguments âš ï¸")
				end 
				val_831.Size = val_831.Size + UDim2.new(0, 0, 0, 20); val_612.multiZindex = val_612.multiZindex - 1; val_828 = val_828 - 1; val_829 = val_829 - 1; local val_870 = Instance.new("TextButton"); local val_871 = Instance.new("Frame"); local val_873 = Instance.new("TextLabel"); local val_874 = Instance.new("ImageLabel"); local val_875 = Instance.new("ImageLabel"); val_871.ZIndex = val_612.multiZindex; val_871.Visible = false; val_871.Parent = val_870; val_871.Transparency = 0; val_871.Size = UDim2.new(0, 120, 0, 100); val_871.Position = UDim2.new(1, 0, 1, 0); val_874.Parent = val_871; val_874.BackgroundColor3 = Color3.fromRGB(0, 255, 0); val_874.BorderColor3 = Color3.fromRGB(0, 0, 0); val_874.Size = UDim2.new(0, 100, 0, 100); val_874.Image = "rbxassetid://2615689005"
				val_874.Name = "dontchange"
				val_875.Parent = val_871; val_875.AnchorPoint = Vector2.new(1, 0); val_875.BackgroundColor3 = Color3.fromRGB(248, 248, 248); val_875.BorderColor3 = Color3.fromRGB(0, 0, 0); val_875.Position = UDim2.new(1, 0, 0, 0); val_875.Size = UDim2.new(0, 20, 0, 100); val_875.Image = "rbxassetid://2615692420"; val_870.Parent = val_832; val_870.BackgroundColor3 = L_577_arg0.color or Color3.new(1, 1, 1); val_870.BorderColor3 = Color3.fromRGB(50, 50, 50); val_870.Size = UDim2.new(0, 35, 0, 15); val_870.AutoButtonColor = false; val_870.ZIndex = L_577_arg0.ontop and val_829 or val_828; val_870.TextColor3 = Color3.fromRGB(255, 255, 255); val_870.Font = "SourceSans"; val_870.TextSize = 16; val_870.Text = ""
				val_870.Name = "dontchange"
				val_873.Parent = val_870; val_873.BackgroundColor3 = Color3.fromRGB(255, 255, 255); val_873.BorderSizePixel = 0; val_873.Position = UDim2.new(1, 10, 0, 0); val_873.Size = UDim2.new(0, 0, 1, 0); val_873.Font = "SourceSans"; val_873.Text = L_577_arg0.text or L_577_arg0.flag; val_873.TextColor3 = Color3.fromRGB(255, 255, 255); val_873.TextSize = 16; val_873.TextXAlignment = "Left"
				val_870.MouseButton1Click:Connect(function()
					val_871.Visible = not val_871.Visible
				end)
				local function L_583_func(L_593_arg0, L_594_arg1)
					if typeof(L_593_arg0) == "table" then
						L_593_arg0 = L_594_arg1
					end 
					val_870.BackgroundColor3 = L_593_arg0; env.DemoFlags[L_577_arg0.flag] = L_593_arg0 
					if L_577_arg0.callback then
						L_577_arg0.callback(L_593_arg0)
					end
				end 
				local val_876, val_877 = Color3.new(1, 1, 1), Color3.new(0, 0, 0); local val_878 = { Color3.new(1, 0, 0), Color3.new(1, 1, 0), Color3.new(0, 1, 0), Color3.new(0, 1, 1), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 0, 0) }; local val_879 = game:GetService("RunService").Heartbeat; local val_880, val_881, val_883 = 0, 0, 0; local val_884, val_885 = 0, 0 
				val_875.MouseEnter:Connect(function()
					local val_886 = val_875.InputBegan:connect(function(L_597_arg0)
						if L_597_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
							while val_879:wait() and val_472:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								val_612.colorpicking = true; local val_888 = (val_883 - val_875.AbsolutePosition.Y - 36) / val_875.AbsoluteSize.Y; local val_889 = math.max(1, math.min(7, math.floor((val_888 * 7 + 0.5) * 100) / 100)); local val_891 = val_878[math.floor(val_889)]; local val_892 = val_878[math.ceil(val_889)]; local val_893 = val_876:lerp(val_874.BackgroundColor3, val_884):lerp(val_877, val_885); val_874.BackgroundColor3 = val_891:lerp(val_892, val_889 - math.floor(val_889)) or Color3.new(0, 0, 0); L_583_func(val_893)
							end 
							val_612.colorpicking = false
						end
					end)
					local val_887 
					val_887 = val_875.MouseLeave:connect(function()
						val_886:disconnect(); val_887:disconnect()
					end)
				end)
				val_874.MouseEnter:Connect(function()
					local val_894 = val_874.InputBegan:connect(function(L_605_arg0)
						if L_605_arg0.UserInputType == Enum.UserInputType.MouseButton1 then
							while val_879:wait() and val_472:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								val_612.colorpicking = true; local val_896 = (val_880 - val_874.AbsolutePosition.X) / val_874.AbsoluteSize.X; local val_897 = (val_881 - val_874.AbsolutePosition.Y - 36) / val_874.AbsoluteSize.Y; local val_898 = val_876:lerp(val_874.BackgroundColor3, val_896):lerp(val_877, val_897); L_583_func(val_898); val_884, val_885 = val_896, val_897
							end 
							val_612.colorpicking = false
						end
					end)
					local val_895 
					val_895 = val_874.MouseLeave:connect(function()
						val_894:disconnect(); val_895:disconnect()
					end)
				end)
				val_875.MouseMoved:connect(function(L_609_arg0, L_610_arg1)
					val_883 = L_610_arg1
				end)
				val_874.MouseMoved:connect(function(L_611_arg0, L_612_arg1)
					val_880, val_881 = L_611_arg0, L_612_arg1
				end)
				table.insert(val_612.toInvis, val_871); env.DemoFlags[L_577_arg0.flag] = Color3.new(1, 1, 1); val_612.options[L_577_arg0.flag] = { type = "colorpicker", changeState = L_583_func, skipflag = L_577_arg0.skipflag, oldargs = L_577_arg0 }; L_583_func(L_577_arg0.color or Color3.new(1, 1, 1))
			end 
			function val_834:addEventList(L_613_arg0)
			end 
			return val_834, val_831
		end 
		return val_826, val_822
	end 
	if not isfolder("clarity.tk_configs") then
		makefolder("clarity.tk")
	end 
	if not isfolder("clarity.tk/democfg") then
		makefolder("clarity.tk/democfg")
	end 
	function val_612:saveConfig()
		local val_900 = env.DemoFlags["config_name"]
		if val_900 == "" then
			val_900 = env.DemoFlags["selected_config"]
		end 
		local val_901 = {}
		for L_616_forvar0, L_617_forvar1 in env.DemoFlags do
			if val_612.options[L_616_forvar0].skipflag then
				continue 
			end 
			if typeof(L_617_forvar1) == "Color3" then
				val_901[L_616_forvar0] = { L_617_forvar1.R, L_617_forvar1.G, L_617_forvar1.B }
			elseif typeof(L_617_forvar1) == "EnumItem" then
				val_901[L_616_forvar0] = { string.split(tostring(L_617_forvar1), ".")[2], string.split(tostring(L_617_forvar1), ".")[3] }
			else
				val_901[L_616_forvar0] = L_617_forvar1
			end
		end 
		writefile("clarity.tk/democfg/" .. val_900 .. ".cfg", game:GetService("HttpService"):JSONEncode(val_901)); val_612:refreshConfigs()
	end 
	function val_612:loadConfig()
		local val_902 = env.DemoFlags["selected_config"]
		if not isfile("clarity.tk/democfg/" .. val_902 .. ".cfg") then
			return
		end 
		local val_903 = game:GetService("HttpService"):JSONDecode(readfile("clarity.tk/democfg/" .. val_902 .. ".cfg"))
		for L_620_forvar0, L_621_forvar1 in val_612.options do
			spawn(function()
				pcall(function()
					if val_903[L_620_forvar0] then
						if L_621_forvar1.type == "colorpicker" then
							L_621_forvar1.changeState(Color3.new(val_903[L_620_forvar0][1], val_903[L_620_forvar0][2], val_903[L_620_forvar0][3]))
						elseif L_621_forvar1.type == "keybind" then
							L_621_forvar1.changeState(Enum[val_903[L_620_forvar0][1]][val_903[L_620_forvar0][2]])
						else
							if val_903[L_620_forvar0] ~= env.DemoFlags[L_620_forvar0] then
								L_621_forvar1.changeState(val_903[L_620_forvar0])
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
	end 
	function val_612:refreshConfigs()
		local val_905 = {}
		for L_623_forvar0, L_624_forvar1 in listfiles("clarity.tk/democfg") do
			table.insert(val_905, L_624_forvar1:split("\\")[2]:split(".")[1])
		end 
		val_612.options["selected_config"].refresh(val_905)
	end 
	function val_612:deleteConfig()
		if isfile("clarity.tk/democfg/" .. env.DemoFlags["selected_config"] .. ".cfg") then
			delfile("clarity.tk/democfg/" .. env.DemoFlags["selected_config"] .. ".cfg"); val_612:refreshConfigs()
		end
	end 
spawn(function()
	local demoListFrame = val_605:WaitForChild("demolist"):WaitForChild("ScrollingFrame"); demoListFrame:WaitForChild("UIListLayout").SortOrder = Enum.SortOrder.Name
	for _, child in demoListFrame:GetChildren() do
		if child:IsA("TextButton") and child.Name ~= "example" then
			child:Destroy()
		end
	end
	if isfolder("clarity.tk/demos") then
		for _, demoPath in listfiles("clarity.tk/demos") do
			local demoName = demoPath:match("([^/\\]+)$")
			if isfolder(demoPath) then
				local newBtn = demoListFrame.example:Clone(); newBtn.Text = demoName; newBtn.Name = demoName; newBtn.Visible = true; newBtn.Parent = demoListFrame
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