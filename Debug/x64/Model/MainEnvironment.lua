--[[
Thank you insaladarel on discord for the fucntions, More credits to vxstyy for some of the rconsole functions. 
More features are also available at Advanced-Decompiler-V3, Fixed some issues.
]]

getgenv().checkcaller = function() return true end
local logserv = game:GetService("LogService")
local cached, ConsoleClone, identity, log = {}, nil, nil, nil
getgenv().cache = {
    iscached = function(part) return cached[part] ~= 'nil' end,
    invalidate = function(part) cached[part] = 'nil'; part.Parent = nil end,
    replace = function(part, replacement)
        cached[part] = replacement
        replacement.Name, replacement.Parent, part.Parent = part.Name, part.Parent, nil
    end
}

local function check(func, ...) return pcall(func, ...) end

local dbg = {}
function getcallingscript()
 local s = debug.info(1, 's')
 for i, v in next, game:GetDescendants() do
  if v:GetFullName() == s then return v end
 end
 return nil
end
function dbg.getinfo(thread)
 local CurrentLine = tonumber(debug.info(thread, 'l'))
 local Source = debug.info(thread, 's')
 local name = debug.info(thread, 'n')
 local numparams, isvrg = debug.info(thread, 'a')
 if #name == 0 then name = nil end
 local a, b = debug.info(thread, 'a')
 return {
  ['currentline'] = CurrentLine,
  ['Source'] = Source,
  ['name'] = tostring(name),
  ['numparams'] = tonumber(numparams),
  ['is_vararg'] = isvrg and 1 or 0,
  ['short_src'] = tostring(Source:sub(1, 60))
  }
end
return dbg


log = logserv.MessageOut:Connect(function(msg)
    if msg:find("Current identity is") then identity = tonumber(msg:gsub('Current identity is', ''):match("%d+")) end 
end)


getgenv().getthreadidentity = function()
    return identity 
end

getgenv().printidentity = function()
    print("Current identity is "..getthreadidentity()) 
end

getgenv().identifyexecutor = function()
  return "Slaze", "3.376.61"
end

getgenv().getidentity = getthreadidentity
getgenv().getthreadcontext = getthreadidentity
getgenv().setthreadidentity = function(newidentity) identity = newidentity end
getgenv().setidentity = setthreadidentity
getgenv().setthreadcontext = setthreadidentity

local Console = Instance.new("ScreenGui")
local ConsoleFrame = Instance.new("Frame")
local Topbar = Instance.new("Frame")
local _CORNER = Instance.new("UICorner")
local ConsoleCorner = Instance.new("UICorner")
local CornerHide = Instance.new("Frame")
local DontModify = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local CornerHide2 = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local ConsoleIcon = Instance.new("ImageLabel")
local Holder = Instance.new("ScrollingFrame")
local MessageTemplate = Instance.new("TextLabel")
local InputTemplate = Instance.new("TextBox")
local UIListLayout = Instance.new("UIListLayout")
local HolderPadding = Instance.new("UIPadding")

Console.Name = "Console"
Console.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ConsoleFrame.Name, ConsoleFrame.BackgroundColor3, ConsoleFrame.BorderColor3, ConsoleFrame.BorderSizePixel, ConsoleFrame.Position, ConsoleFrame.Size = "ConsoleFrame", Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0), 0, UDim2.new(0.096, 0, 0.221, 0), UDim2.new(0, 888, 0, 577)
Topbar.Name, Topbar.BackgroundColor3, Topbar.BorderColor3, Topbar.BorderSizePixel, Topbar.Position, Topbar.Size = "Topbar", Color3.fromRGB(20, 20, 20), Color3.fromRGB(0, 0, 0), 0, UDim2.new(0, 0, -0.00046, 0), UDim2.new(1, 0, 0, 32)
_CORNER.Name, ConsoleCorner.Name = "_CORNER", "ConsoleCorner"
CornerHide.Name, CornerHide.BackgroundColor3, CornerHide.BorderColor3, CornerHide.BorderSizePixel, CornerHide.Position, CornerHide.Size = "CornerHide", Color3.fromRGB(20, 20, 20), Color3.fromRGB(0, 0, 0), 0, UDim2.new(0, 0, 0.028, 0), UDim2.new(1, 0, 0, 12)
DontModify.Name, DontModify.BackgroundColor3, DontModify.BorderColor3, DontModify.BorderSizePixel, DontModify.Position, DontModify.Size = "DontModify", Color3.fromRGB(20, 20, 20), Color3.fromRGB(0, 0, 0), 0, UDim2.new(0.982, 0, 0.028, 0), UDim2.new(-0.007, 21, 0.972, 0)
UICorner.Parent = DontModify
CornerHide2.Name, CornerHide2.AnchorPoint, CornerHide2.BackgroundColor3, CornerHide2.BorderColor3, CornerHide2.BorderSizePixel, CornerHide2.Position, CornerHide2.Size = "CornerHide2", Vector2.new(1, 0), Color3.fromRGB(20, 20, 20), Color3.fromRGB(0, 0, 0), 0, UDim2.new(1, 0, 0.045, 0), UDim2.new(0, 9, 0.955, 0)
Title.Name, Title.BackgroundColor3, Title.BackgroundTransparency, Title.BorderColor3, Title.BorderSizePixel, Title.Position, Title.Size, Title.Font, Title.Text, Title.TextColor3, Title.TextSize, Title.TextXAlignment = "Title", Color3.fromRGB(255, 255, 255), 1, Color3.fromRGB(0, 0, 0), 0, UDim2.new(0.044, 0, 0, 0), UDim2.new(0, 164, 0, 30), Enum.Font.GothamMedium, "rconsole title", Color3.fromRGB(255, 255, 255), 17, Enum.TextXAlignment.Left
UIPadding.Parent, UIPadding.PaddingTop = Title, UDim.new(0, 5)
ConsoleIcon.Name, ConsoleIcon.BackgroundColor3, ConsoleIcon.BackgroundTransparency, ConsoleIcon.BorderColor3, ConsoleIcon.BorderSizePixel, ConsoleIcon.Position, ConsoleIcon.Size, ConsoleIcon.Image = "ConsoleIcon", Color3.fromRGB(255, 255, 255), 1, Color3.fromRGB(0, 0, 0), 0, UDim2.new(0.01, 0, 0.00087, 0), UDim2.new(0, 31, 0, 31), "http://www.roblox.com/asset/?id=11843683545"
Holder.Name, Holder.Active, Holder.BackgroundColor3, Holder.BackgroundTransparency, Holder.BorderColor3, Holder.BorderSizePixel, Holder.Position, Holder.Size, Holder.ScrollBarThickness, Holder.CanvasSize, Holder.AutomaticCanvasSize = "Holder", true, Color3.fromRGB(20, 20, 20), 1, Color3.fromRGB(0, 0, 0), 0, UDim2.new(0, 0, 0.0546, 0), UDim2.new(1, 0, 0.9454, 0), 8, UDim2.new(0, 0, 0, 0), Enum.AutomaticSize.XY
MessageTemplate.Name, MessageTemplate.BackgroundColor3, MessageTemplate.BackgroundTransparency, MessageTemplate.BorderColor3, MessageTemplate.BorderSizePixel, MessageTemplate.Size, MessageTemplate.Visible, MessageTemplate.Font, MessageTemplate.Text, MessageTemplate.TextColor3, MessageTemplate.TextSize, MessageTemplate.TextXAlignment, MessageTemplate.TextYAlignment, MessageTemplate.RichText = "MessageTemplate", Color3.fromRGB(255, 255, 255), 1, Color3.fromRGB(0, 0, 0), 0, UDim2.new(0.9745, 0, 0.03, 0), false, Enum.Font.RobotoMono, "TEMPLATE", Color3.fromRGB(255, 255, 255), 20, Enum.TextXAlignment.Left, Enum.TextYAlignment.Top, true
UIListLayout.Parent, UIListLayout.SortOrder, UIListLayout.Padding = Holder, Enum.SortOrder.LayoutOrder, UDim.new(0, 4)
HolderPadding.Name, HolderPadding.Parent, HolderPadding.PaddingLeft, HolderPadding.PaddingTop = "HolderPadding", Holder, UDim.new(0, 15), UDim.new(0, 15)
InputTemplate.Name, InputTemplate.BackgroundColor3, InputTemplate.BackgroundTransparency, InputTemplate.BorderColor3, InputTemplate.BorderSizePixel, InputTemplate.Size, InputTemplate.Visible, InputTemplate.RichText, InputTemplate.Font, InputTemplate.Text, InputTemplate.PlaceholderText, InputTemplate.TextColor3, InputTemplate.TextSize, InputTemplate.TextXAlignment, InputTemplate.TextYAlignment = "InputTemplate", Color3.fromRGB(255, 255, 255), 1, Color3.fromRGB(0, 0, 0), 0, UDim2.new(0.9745, 0, 0.03, 0), false, true, Enum.Font.RobotoMono, "", '', Color3.fromRGB(255, 255, 255), 20, Enum.TextXAlignment.Left, Enum.TextYAlignment.Top

local colors = {
    BLACK = Color3.fromRGB(50, 50, 50), BLUE = Color3.fromRGB(0, 0, 204), GREEN = Color3.fromRGB(0, 255, 0),
    CYAN = Color3.fromRGB(0, 255, 255), RED = Color3.fromHex('#5A0101'), MAGENTA = Color3.fromRGB(255, 0, 255),
    BROWN = Color3.fromRGB(165, 42, 42), LIGHT_GRAY = Color3.fromRGB(211, 211, 211), DARK_GRAY = Color3.fromRGB(169, 169, 169),
    LIGHT_BLUE = Color3.fromRGB(173, 216, 230), LIGHT_GREEN = Color3.fromRGB(144, 238, 144), LIGHT_CYAN = Color3.fromRGB(224, 255, 255),
    LIGHT_RED = Color3.fromRGB(255, 204, 203), LIGHT_MAGENTA = Color3.fromRGB(255, 182, 193), YELLOW = Color3.fromRGB(255, 255, 0),
    WHITE = Color3.fromRGB(255, 255, 255), ORANGE = Color3.fromRGB(255, 186, 12)
}

local MessageColor = colors['WHITE']

getgenv().rconsolecreate = function()
    local Clone = Console:Clone()
    Clone.Parent = gethui()
    ConsoleClone = Clone
    ConsoleClone.ConsoleFrame.Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            startDrag(input, ConsoleClone.ConsoleFrame)
        end
    end)
end

getgenv().rconsoledestroy = function()
    if ConsoleClone then ConsoleClone:Destroy() end
    ConsoleClone = nil
end

getgenv().rconsoleprint = function(msg, cc)
    local CONSOLE = ConsoleClone or Console
    repeat task.wait() until ConsoleQueue:IsEmpty()
    msg = tostring(msg)
    local last_color = nil

    msg = msg:gsub('@@(%a+)@@', function(color)
        local rgbColor = colors[color:upper()]
        if rgbColor then
            local fontTag = string.format('<font color="rgb(%d,%d,%d)">', rgbColor.R * 255, rgbColor.G * 255, rgbColor.B * 255)
            local result = last_color and '</font>' .. fontTag or fontTag
            last_color = color
            return result
        end
        return '@@' .. color .. '@@'
    end)

    if last_color then msg = msg .. '</font>' end

    if msg:match('<font color=".+">.+</font>') and msg:match('<font color=".+"></font>') == msg then
        MessageColor = colors[last_color]
        return
    end

    local tmp = MessageTemplate:Clone()
    tmp.Parent = CONSOLE.ConsoleFrame.Holder
    tmp.Text = msg
    tmp.Visible = true
    tmp.TextColor3 = cc or MessageColor
end

getgenv().rconsoleinput = function()
    local CONSOLE = ConsoleClone or Console
    repeat task.wait() until ConsoleQueue:IsEmpty()
    ConsoleQueue:Queue('input')
    local box = InputTemplate:Clone()
    local val
    box.Parent = CONSOLE.ConsoleFrame.Holder
    box.Visible = true
    box.TextEditable = true
    box.TextColor3 = MessageColor

    box.FocusLost:Connect(function(focused)
        if focused then val = box.Text; ConsoleQueue:Update() end
    end)

    while true do
        if box.Text:sub(-1) == '_' or box.Text == '' or not box:IsFocused() then
            box.TextColor3 = Color3.fromRGB(255, 255, 255)
            box.Text = box.Text .. '_'

            for _ = 1, 100 do
                task.wait(0.5)
                if box:IsFocused() then
                    box.TextColor3 = MessageColor
                    break
                end
                box.Text = box.Text:sub(-1) == '_' and box.Text:sub(1, -2) or box.Text .. '_'
            end
            if box:IsFocused() then break end
        else
            task.wait(0.1)
        end
    end

    repeat task.wait() until val
    return val
end

getgenv().rconsolename = function(a)
    if ConsoleClone then ConsoleClone.ConsoleFrame.Title.Text = a
    else Console.ConsoleFrame.Title.Text = a end
end

getgenv().printconsole = function(msg, r, g, b)
    rconsoleprint(msg, Color3.fromRGB(r or 0, g or 0, b or 0))
end

getgenv().rconsoleclear = function()
    local targetConsole = ConsoleClone or Console
    for _, v in pairs(targetConsole.ConsoleFrame.Holder:GetChildren()) do
        if v:IsA('TextLabel') or v:IsA('TextBox') then v:Destroy() end
    end
end

getgenv().rconsoleinfo = function(a) rconsoleprint('[INFO]: ' .. tostring(a)) end
getgenv().rconsolewarn = function(a) rconsoleprint('[*]: ' .. tostring(a)) end
getgenv().rconsoleerr = function(a)
    local clr = MessageColor
    local oldColor = next(function(v, k) if v == clr then return k end end, colors)
    rconsoleprint(string.format('[@@RED@@*@@%s@@]: %s', oldColor, tostring(a)))
end

getgenv().rconsoleinputasync = rconsoleinput
getgenv().consolecreate = rconsolecreate
getgenv().consoleclear = rconsoleclear
getgenv().consoledestroy = rconsoledestroy
getgenv().consoleinput = rconsoleinput
getgenv().rconsolesettitle = rconsolename
getgenv().consolesettitle = rconsolename
getgenv().consoleprint = rconsoleprint

-- partially working funcs start: 
getgenv().hookfunction = function(original, hook)
    if type(original) ~= "function" then
        error("The first arg must be a function (original func).")
    end
    if type(hook) ~= "function" then
        error("The second arg must be a function (hook).")
    end
    local hooked = function(...)
        return hook(original, ...)
    end
    local info = debug.getinfo(original)
    if info and info.name then
        getgenv()[info.name] = hooked
    else
        error("Failed to get function name")
    end

    return hook
end

local oldsm = setmetatable
local savedmts = {}
getgenv().setmetatable = function(taaable, metatable)
	local success, result = pcall(function() local result = oldsm(taaable, metatable) end)
	savedmts[taaable] = metatable
	if not success then error(result) end
	return taaable
end
getgenv().getrawmetatable = function(taaable)
	return savedmts[taaable]
end
getgenv().setrawmetatable = function(taaable, newmt)
	local currentmt = getgenv().getrawmetatable(taaable)
	table.foreach(newmt, function(key, value)
		currentmt[key] = value
	end)
	return taaable
end
getgenv().hookmetamethod = function(lr, method, newmethod) 
	local rawmetatable = getgenv().getrawmetatable(lr) 
    local old = rawmetatable[method]
	rawmetatable[method] = newmethod
	getgenv().setrawmetatable(lr, rawmetatable)
	return old
end 

getgenv().replaceclosure = hookfunction

local nilinstances = {}
game.DescendantRemoving:Connect(function(d) table.insert(nilinstances, d) end)
getgenv().getnilinstances = function() return nilinstances end

local objs = {}
local function trackobj(obj) table.insert(objs, obj) end

function createobj(name)
    local obj = {name = name}
    trackobj(obj)
    return obj
end

createobj("obj1")
createobj("obj2")

getgenv().getgc = function()
 return objs
 end

-- partially workin funcs end

getgenv().saveinstance = function() 
	local Params = {
		RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
		SSI = "saveinstance",
	}
	local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
	local SaveOptions = {
		ReadMe = true,
		IsolatePlayers = true,
		FilePath = string.format("%d", tick())
	}
	synsaveinstance(SaveOptions)
end

local decompsrc = game:HttpGet("https://raw.githubusercontent.com/RazAPI/SlazeV3/main/Debug/x64/InitScript.lua", true) 
local function loaddecomp(decomptimeout)
    local CONSTANTS = [[
        local ENABLED_REMARKS = {
            NATIVE_REMARK = true,
            INLINE_REMARK = true
        }
        local DECOMPILER_TIMEOUT = ]] .. decomptimeout .. [[
            
        local READER_FLOAT_PRECISION = 99 -- up to 99
        local SHOW_INSTRUCTION_LINES = false
        local SHOW_REFERENCES = true
        local SHOW_OPERATION_NAMES = false
        local SHOW_MISC_OPERATIONS = true
        local LIST_USED_GLOBALS = true
        local RETURN_ELAPSED_TIME = false
    ]]
    loadstring(string.gsub(decompsrc, "-- CONSTANTS HERE --", CONSTANTS), "Advanced-Decompiler-V3")()
end
loaddecomp(10)

function check(funcName: string, func, testfunc)
    local success, err = pcall(function()
        getgenv()[funcName] = func
    end)
end

check("getdevice", function()
    return tostring(game:GetService("UserInputService"):GetPlatform()):split(".")[3]
end, function()
    assert(getgenv().getdevice() == tostring(game:GetService("UserInputService"):GetPlatform()):split(".")[3], "getdevice function test failed")
end)

check("getping", function(suffix: boolean)
    local rawping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local pingstr = rawping:sub(1, #rawping - 7)
    local pingnum = tonumber(pingstr)
    local ping = tostring(math.round(pingnum))
    return not suffix and ping or ping .. " ms"
end, function()
    local ping = getgenv().getping()
    assert(tonumber(ping) ~= nil, "getping function test failed")
end)

check("getscriptclosure", function(module)
    local env = getrenv()
    local constants = env.require(module)
    return function()
        local copy = {}
        for k, v in pairs(constants) do
            copy[k] = v
        end
        return copy
    end
end)

check("getfps", function(): number
    local RunService = game:GetService("RunService")
    local FPS: number
    local TimeFunction = RunService:IsRunning() and time or os.clock

    local LastIteration: number, Start: number
    local FrameUpdateTable = {}

    local function HeartbeatUpdate()
        LastIteration = TimeFunction()
        for Index = #FrameUpdateTable, 1, -1 do
            FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
        end

        FrameUpdateTable[1] = LastIteration
        FPS = TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)
    end

    Start = TimeFunction()
    RunService.Heartbeat:Connect(HeartbeatUpdate)
    task.wait(1.1)
    return FPS
end, function()
    local fps = getgenv().getfps()
    assert(fps ~= nil and fps >= 0, "getfps function test failed")
end)

check("getaffiliateid", function()
    return "moREnc"
end, function()
    assert(getgenv().getaffiliateid() == "moREnc", "getaffiliateid function test failed")
end)

check("getplayer", function(name: string)
    return not name and getgenv().getplayers()["LocalPlayer"] or getgenv().getplayers()[name]
end)

check("getplayers", function()
    local players = {}
    for _, x in pairs(game:GetService("Players"):GetPlayers()) do
        players[x.Name] = x
    end
    players["LocalPlayer"] = game:GetService("Players").LocalPlayer
    return players
end, function()
    assert(getgenv().getplayers()["LocalPlayer"] == game:GetService("Players").LocalPlayer, "getplayers function test failed")
end)

check("getlocalplayer", function(): Player
    return getgenv().getplayer()
end, function()
    assert(getgenv().getlocalplayer() == game:GetService("Players").LocalPlayer, "getlocalplayer function test failed")
end)

check("customprint", function(text: string, properties: table, imageId: rbxasset)
    print(text)
    task.wait(0.025)
    local clientLog = game:GetService("CoreGui").DevConsoleMaster.DevConsoleWindow.DevConsoleUI.MainView.ClientLog
    local childrenCount = #clientLog:GetChildren()
    local msgIndex = childrenCount > 0 and childrenCount - 1 or 0
    local msg = clientLog:FindFirstChild(tostring(msgIndex))

    if msg then
        for i, x in pairs(properties) do
            msg[i] = x
        end
        if imageId then
            msg.Parent.image.Image = imageId
        end
    end
end)

check("join", function(placeID: number, jobID: string)
    game:GetService("TeleportService"):TeleportToPlaceInstance(placeID, jobID, getplayer())
end)

check("firesignal", function(instance: Instance, signalName: string, args: any)
    if instance and signalName then
        local signal = instance[signalName]
        if signal then
            for _, connection in ipairs(getconnections(signal)) do
                if args then
                    connection:Fire(args)
                else
                    connection:Fire()
                end
            end
        end
    end
end, function()
    local button = Instance.new("TextButton")
    local new = true
    button.MouseButton1Click:Connect(function() new = false end) 
    firesignal(button.MouseButton1Click)
    assert(new, "Uses old standard")
    firesignal(button, "MouseButton1Click")
end)

check("firetouchinterest", function(part: Instance, touched: boolean)
    firesignal(part, touched and "Touched" or touched == false and "TouchEnded" or "Touched")
end)

check("fireproximityprompt", function(prompt: Instance, triggered: boolean, hold: boolean)
    firesignal(prompt, hold and (triggered and "PromptButtonHoldBegan" or "PromptButtonHoldEnded") or (triggered and "Triggered" or triggered == false and "TriggerEnded" or "Triggered"))
end)

check("runanimation", function(animationId: any, player: Player)
    local plr: Player = player or getgenv().getplayer()
    local humanoid: Humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://" .. tostring(animationId)
        humanoid:LoadAnimation(animation):Play()
    end
end)

check("round", function()
    getgenv().round = math.round
end)

check("joingame", function()
    getgenv().joingame = join
end)

check("joinserver", function()
    getgenv().joinserver = join
end)

check("firetouchtransmitter", function()
    getgenv().firetouchtransmitter = firetouchinterest
end)

check("getplatform", function()
    getgenv().getplatform = getdevice
end)

check("getos", function()
    getgenv().getos = getdevice
end)

check("playanimation", function()
    getgenv().playanimation = runanimation
end)

check("setrbxclipboard", function()
    getgenv().setrbxclipboard = setclipboard
end)
