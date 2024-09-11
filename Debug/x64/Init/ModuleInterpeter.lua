-- xAPI		- A Powerful Exploit Simulator
-- Version	- build::896581584
-- Author	- Eskue (@SQLanguage)

-- Locals
local xAPI = {}
local instances = {}
local _nil = {}
local _g = {}
local metatables = {}
local windowactive = true
local uis = game:GetService("UserInputService")
local gc = {}
local sha2 = script:FindFirstChild("sha2")
if sha2 then
	sha2 = require(sha2)
end
local _workspace = Instance.new("Folder", script)
_workspace.Name = "workspace"

local loadedmodules = {}

local fps = 120
local clock = tick()
task.spawn(function()
	while true do
		while clock + 1/fps > tick() do end
		task.wait()
		clock = tick()
	end
end)

local xAPI_replicated = game.ReplicatedStorage:FindFirstChild("xAPI")

local function descendanthandler(descendant:Instance)
	if not table.find(instances, descendant) then
		table.insert(instances, descendant)
		local function onParentChanged(Parent)
			if Parent == nil then
				table.insert(_nil, descendant)
			else
				local found = table.find(_nil, descendant)
				if found then
					table.remove(_nil, found)
				end
			end
		end
		descendant.Changed:Connect(onParentChanged)
		descendant.Destroying:Connect(onParentChanged)
	end
end

local function replace_rconsoleFormatting(txt:string)
	local a,_ = txt:gsub("@@(.+)@@", "")
	return a
end

local rconsoleevent = Instance.new("BindableEvent")
rconsoleevent.Name = "rconsole"
rconsoleevent.Parent = script

local clipboardevent = Instance.new("BindableEvent")
clipboardevent.Name = "clipboard"
clipboardevent.Parent = script

-- Connections
game.DescendantAdded:Connect(descendanthandler)

for _, descendant in pairs(game:GetDescendants()) do
	descendanthandler(descendant)
end

pcall(function()
	uis.WindowFocused:Connect(function()
		windowactive = true
	end)

	uis.WindowFocusReleased:Connect(function()
		windowactive = false
	end)
end)

-- Main
local function add(aliases:any, value:any, places:any?)
	places = places or {xAPI}
	for _,alias in pairs(aliases) do
		for _,place in pairs(places) do
			if type(value) == "function" then
				place[alias] = function(...)
					return value(alias, ...)
				end
			else
				place[alias] = value
			end
		end
	end
end

add({"gethui"}, function(self):Instance
	local CGUI = (game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.PlayerGui)
	return CGUI
end)

add({"getinstances"}, function(self):{any}
	return instances
end)

add({"getnilinstances"}, function(self):{any}
	local r = {}

	for _, descendant in pairs(_nil) do
		table.insert(r, descendant)
	end

	return r
end)

add({"getscripts"}, function(self):{any}
	local r = {}

	for _, descendant in pairs(instances) do
		if descendant:IsA("BaseScript") then
			table.insert(r, descendant)
		end
	end

	return r
end)

add({"getmodules"}, function(self):{any}
	local r = {}

	for _, descendant in pairs(instances) do
		if descendant:IsA("ModuleScript") then
			table.insert(r, descendant)
		end
	end

	return r
end)

add({"newcclosure"}, function(self, closure)
	assert(closure, "missing argument #1 to 'newcclosure' (function expected)")
	assert(type(closure) == "function", string.format("invalid argument #1 to 'newcclosure' (function expected, got %s)", type(closure)))

	return coroutine.wrap(function(...)
		while true do
			coroutine.yield(closure(...))
		end
	end)
end)

add({"newlclosure"}, function(self, closure)
	assert(closure, "missing argument #1 to 'newlclosure' (function expected)")
	assert(type(closure) == "function", string.format("invalid argument #1 to 'newlclosure' (function expected, got %s)", type(closure)))

	return function(...)
		return closure(...)
	end
end)

add({"iscclosure"}, function(self, closure)
	assert(closure, "missing argument #1 to 'iscclosure' (function expected)")
	assert(type(closure) == "function", string.format("invalid argument #1 to 'iscclosure' (function expected, got %s)", type(closure)))
	
	return debug.info(closure, "s") == "[C]"
end)

add({"islclosure"}, function(self, closure)
	assert(closure, "missing argument #1 to 'islclosure' (function expected)")
	assert(type(closure) == "function", string.format("invalid argument #1 to 'islclosure' (function expected, got %s)", type(closure)))

	return debug.info(closure, "s") ~= "[C]"
end)

add({"clonefunction"}, function(self, closure)
	assert(closure, "missing argument #1 to 'clonefunction' (function expected)")
	assert(type(closure) == "function", string.format("invalid argument #1 to 'clonefunction' (function expected, got %s)", type(closure)))
	
	if debug.info(closure, "s") ~= "[C]" then
		return function(...)
			return closure(...)
		end
	else
		return coroutine.wrap(function(...)
			while true do
				coroutine.yield(closure(...))
			end
		end)
	end
end)

add({"getcurrentline"}, function(self):number
	return debug.info(3, "l")
end)

add({"getthreadidentity", "getidentity", "getthreadcontext"}, function(self):number
	return 2
end)

add({"getthread"}, function(self):thread
	return getfenv(3).coroutine.running()
end)

add({"getmemoryaddress"}, function(self, obj:any, keep_0x:boolean | nil):string
	assert(obj, "missing argument #1 to 'getmemoryaddress'")
	assert(type(keep_0x) == "boolean" or keep_0x == nil, string.format("invalid argument #1 to 'getmemoryaddress' (boolean or nil expected, got %s)", type(keep_0x)))

	local s,r = pcall(function()
		local str = tostring(obj)
		local strmatch = str:gmatch("(.+): 0x(.+)$")
		local address
		for _type, _addr in strmatch do
			address = _addr
		end
		if keep_0x == true then
			address = "0x"..address
		end
		if not address then
			assert(nil, string.format("invalid argument #1 to 'getmemoryaddress' (%s is not supported)", typeof(obj)))
		end
		return address
	end)
	if s then
		return r
	else
		assert(nil, string.format("invalid argument #1 to 'getmemoryaddress' (%s is not supported)", typeof(obj)))
	end
end)

add({"getgenv"}, function(self):{any}
	return setmetatable(xAPI, {__newindex = function(self, key, value)
		getfenv(3)[key] = value
	end,__index = function(self, key)
		return (self[key] or getfenv(3)[key])
	end,})
end)

add({"getrenv"}, function(self):{any}
	return getfenv(1)
end)

add({"identifyexecutor", "getexecutorname"}, function(self):(string, string)
	local Build = 0
	local _count = 0
	for name, value in pairs(getfenv(3)) do
		for _, char in pairs(name:split("")) do
			Build += string.byte(char)*#name
			_count += 1
		end
	end
	Build *= _count
	return "xAPI", "build::"..Build
end)

add({"isexecutorclosure", "checkclosure", "isourclosure"}, function(self, closure):boolean
	assert(closure, string.format("missing argument #1 to '%s'", self))
	assert(type(closure) == "function", string.format("invalid argument #1 to '%s' (%s is not supported)", self, type(closure)))

	if xAPI.getrenv()[debug.info(closure, "n")] then
		return false
	else
		return true
	end
end)

add({"_G", "shared"}, _g)

add({"newproxy"}, function(self, addMetatable:boolean):userdata
	assert(type(addMetatable) == "boolean" or addMetatable == nil, string.format("invalid argument #1 to 'newproxy' (nil or boolean expected, got %s)", type(addMetatable)))
	local userdata = newproxy(addMetatable)
	if addMetatable == true then
		local a = getmetatable(userdata)
		local raw = {}
		setmetatable(a, {__newindex=function(self, key, value)
			raw[key] = value
		end,})
		metatables[userdata] = {raw, userdata}
	end
	return userdata
end)

add({"setmetatable"}, function(self, object, meta):{any}
	assert(object, "missing argument #1 to 'setmetatable' (table expected)")
	assert(type(object) == "table", string.format("invalid argument #1 to 'setmetatable' (expected table, got %s)", type(object)))

	metatables[object] = {meta, setmetatable(object, meta)}
	return metatables[object][2]
end)

add({"getmetatable"}, function(self, object):{any}
	assert(object, "missing argument #1 to 'getmetatable' (expected table or userdata)")
	assert(type(object) == "userdata" or type(object) == "table", string.format("invalid argument #1 to 'getmetatable' (expected table or userdata, got %s)", type(object)))

	return getmetatable(metatables[object][2])
end)

add({"getrawmetatable"}, function(self, object):{any}
	assert(object, "missing argument #1 to 'getrawmetatable' (expected table or userdata)")
	assert(type(object) == "userdata" or type(object) == "table", string.format("invalid argument #1 to 'getrawmetatable' (expected table or userdata, got %s)", type(object)))

	local raw = metatables[object][1]
	local prev_mt = metatables[object][2]

	local loading = true
	local proxy = setmetatable({}, {__newindex = function(self, key, value)
		rawset(self, key, value)
		if not loading then
			pcall(function()
				xAPI.setrawmetatable("setrawmetatable", object, self)
			end)
		end
	end
	})
	for i,v in pairs(raw) do
		proxy[i] = v
	end
	loading = false
	return proxy
end)

add({"setrawmetatable"}, function(self, object, meta):{any}
	assert(object, string.format("missing argument #1 to '%s' (expected table or userdata)", self))
	assert(type(object) == "userdata" or type(object) == "table", string.format("invalid argument #1 to '%s' (expected table or userdata, got %s)", self, type(object)))
	
	local found = nil
	
	for i,v in pairs(getfenv(3)) do
		if v == object then
			found = {v,i}
		end
	end
	
	if not found then 
		local s, mt_or_err = pcall(function()
			setmetatable(object, meta)
		end)

		if not s then
			local filtered = {}
			for metamethod, value in pairs(meta) do
				if metamethod == "__metatable" then continue end
				filtered[metamethod] = value
			end
			return setmetatable(object, filtered)
		end

		return mt_or_err
	else
		local _t = found[1]

		if type(found[1]) == "table" then
			getfenv(3)[found[2]] = {}
			return setmetatable(getfenv(3)[found[2]], meta)
		else
			getfenv(3)[found[2]] = newproxy()
			local meta = getmetatable(getfenv(3)[found[2]])
			for metamethod, value in pairs(meta) do
				meta[metamethod] = value
			end
			return meta
		end
	end
end)

add({"isluau"}, function(self):boolean
	return _VERSION == "Luau"
end)

add({"dumpstring"}, function(self, _string:string):string
	assert(_string, "missing argument #1 to 'dumpstring' (expected string)")
	assert(type(_string) == "string", string.format("invalid argument #1 to 'dumpstring' (expected string, got %s)", type(_string)))

	local r = ""

	for _, char in _string:split("") do
		r ..= "\\"..char:byte()
	end

	return r
end)

add({"isgameactive", "isrbxactive"}, function(self):boolean
	return windowactive
end)

add({"setfpscap"}, function(self, newfpscap:number):nil
	-- https://devforum.roblox.com/t/is-it-possible-to-cap-fps/602143/7
	assert(newfpscap, "missing argument #1 to 'setfpscap' (function expected)")
	assert(type(newfpscap) == "number", string.format("invalid argument #1 to 'setfpscap' (number expected, got %s)", type(newfpscap)))

	fps = newfpscap
end)

add({"setclipboard", "setrbxclipboard", "toclipboard"}, function(self, content)
	assert(content, string.format("missing argument #1 to '%s' (expected string)", self))
	assert(type(content) == "string", string.format("invalid argument #1 to '%s' (expected string, got %s)", self, type(content)))

	clipboardevent:Fire(content)
end)

add({"rconsoleprint", "consoleprint"}, function(self, txt)
	assert(txt, string.format("missing argument #1 to '%s' (expected string)", self))
	assert(type(txt) == "string", string.format("invalid argument #1 to '%s' (expected string, got %s)", self, type(txt)))

	rconsoleevent:Fire(1, replace_rconsoleFormatting(tostring(txt)))
end)

add({"rconsolewarn", "consolewarn"}, function(self, txt)
	assert(txt, string.format("missing argument #1 to '%s' (expected string)", self))
	assert(type(txt) == "string", string.format("invalid argument #1 to '%s' (expected string, got %s)", self, type(txt)))

	rconsoleevent:Fire(2, replace_rconsoleFormatting(tostring(txt)))
end)

add({"rconsoleerr", "rconsoleerror", "consoleerr", "consoleerror"}, function(self, txt)
	assert(txt, string.format("missing argument #1 to '%s' (expected string)", self))
	assert(type(txt) == "string", string.format("invalid argument #1 to '%s' (expected string, got %s)", self, type(txt)))

	rconsoleevent:Fire(3, replace_rconsoleFormatting(tostring(txt)))
end)

add({"rconsoleclear", "consoleclear"}, function(self)
	rconsoleevent:Fire(4)
end)

add({"rconsoleinput", "consoleinput"}, function(self)
	rconsoleevent:Fire(5)
	local recievedinput = rconsoleevent.Event:Wait()
	return recievedinput
end)

add({"rconsolesettitle", "consolesettitle", "rconsolename"}, function(self, txt)
	assert(txt, string.format("missing argument #1 to '%s' (expected string)", self))
	assert(type(txt) == "string", string.format("invalid argument #1 to '%s' (expected string, got %s)", self, type(txt)))

	rconsoleevent:Fire(6, txt)
end)

add({"rconsolecreate", "consolecreate"}, function(self)
	rconsoleevent:Fire(7)
end)

add({"rconsoledestroy", "consoledestroy"}, function(self)
	rconsoleevent:Fire(8)
end)

xAPI.crypt = {}

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
add({"base64encode", "base64_encode"}, function(self, data)
	assert(data, string.format("missing argument #1 to '%s' (expected string)", self))
	assert(type(data) == "string", string.format("invalid argument #1 to '%s' (expected string, got %s)", self, type(data)))
	
	return ((data:gsub('.', function(x) 
		local r,b='',x:byte()
		for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
		return r;
	end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
		if (#x < 6) then return '' end
		local c=0
		for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
		return b:sub(c+1,c+1)
	end)..({ '', '==', '=' })[#data%3+1])
end, {xAPI.crypt})

add({"base64decode", "base64_decode"}, function(self, data)
	assert(data, string.format("missing argument #1 to '%s' (expected string)", self))
	assert(type(data) == "string", string.format("invalid argument #1 to '%s' (expected string, got %s)", self, type(data)))

	data = string.gsub(data, '[^'..b..'=]', '')
	return (data:gsub('.', function(x)
		if (x == '=') then return '' end
		local r,f='',(b:find(x)-1)
		for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
		return r;
	end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
		if (#x ~= 8) then return '' end
		local c=0
		for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
		return string.char(c)
	end))
end, {xAPI.crypt})

if sha2 then
	add({"hash"}, function(self, data:string, algorithm:string)
		return sha2[algorithm:gsub("-","_")](data)
	end, {xAPI.crypt})

	add({"generatebytes"}, function(self, len)
		local random = ""
		for i=1, len do
			random ..= string.char(math.random(0,255))
		end
		return xAPI.crypt.base64encode(random)
	end, {xAPI.crypt})
end

local function parsefile(NameOrPath)
	if _workspace:FindFirstChild(NameOrPath) then
		return _workspace:FindFirstChild(NameOrPath), "workspace"
	elseif NameOrPath.ClassName then
		if NameOrPath:IsA("StringValue") or NameOrPath:IsA("Folder") then
			return NameOrPath, "instance"
		end
	else
		return NameOrPath, "not found"
	end
end

add({"writefile"}, function(self, name, data)
	local file, fileinfo = parsefile(name)
	if fileinfo == "not found" then
		local _file=Instance.new("StringValue",_workspace)
		_file.Name=name
		_file.Value=data
	else
		if file:IsA("StringValue") then
			file.Value=data
		end
	end
end)

add({"readfile"}, function(self, name)
	local file, fileinfo = parsefile(name)
	if fileinfo == "not found" then
		error("File '"..name.."' not found")
	else
		if file:IsA("StringValue") then
			return file.Value
		end
	end
end)

add({"appendfile"}, function(self, name, data)
	local file, fileinfo = parsefile(name)
	if file=="not found" then
		error("File '"..name.."' not found")
	else
		if file:IsA("StringValue") then
			xAPI.writefile(name, xAPI.readfile(name)..data)
		end
	end
end)

add({"listfiles"}, function(self, name)
	local file, fileinfo = parsefile(name)
	if fileinfo == "not found" then
		error("Folder '"..name.."' not found")
	else
		if file:IsA("Folder") then
			return file:GetChildren()
		else
			error(name.." is not a folder")
		end
	end
end)

add({"isfile"}, function(self, name)
	local file, fileinfo = parsefile(name)
	if fileinfo == "not found" then
		return false
	else
		return file:IsA("StringValue")
	end
end)

add({"isfolder"}, function(self, name)
	local file, fileinfo = parsefile(name)
	if fileinfo == "not found"then
		return false
	else
		return file:IsA("Folder")
	end
end)

add({"makefolder"}, function(self, name)
	local file, fileinfo = parsefile(name)
	if fileinfo == "not found"then
		Instance.new("Folder",_workspace).Name = name
	else
		error(file.." already exists!")
	end
end)

add({"delfolder"}, function(self, name)
	local file, fileinfo = parsefile(name)
	if fileinfo == "not found" then
		error("Folder '"..name.."' not found")
	else
		file:Destroy()
	end
end)

add({"delfile"}, function(self, name)
	local file, fileinfo = parsefile(name)
	if fileinfo == "not found"then
		error("File '"..name.."' not found")
	else
		file:Destroy()
	end
end)

add({"require"}, function(self, target)
	local required = require(target)
	loadedmodules[target] = required
	return required
end)

add({"getloadedmodules"}, function(self)
	return loadedmodules
end)

return function()
	local env = getfenv(2)
	local _count = 0
	for name, value in pairs(xAPI) do
		env[name] = value
		_count += 1
	end

	-- Since some functions require intimate data of the environment,
	-- they may not work using `add` and are instead assigned here

	local function hook(old, new):any
		assert(old, "missing argument #1 to 'hookfunction' (function expected)")
		assert(new, "missing argument #2 to 'hookfunction' (function expected)")
		assert(type(old) == "function", string.format("invalid argument #1 to 'hookfunction' (function expected, got %s)", type(old)))
		assert(type(new) == "function", string.format("invalid argument #2 to 'hookfunction' (function expected, got %s)", type(new)))

		local funcname = debug.info(old, "n")

		assert(funcname ~= "", "invalid argument #1 to 'hookfunction' (function must not be unnamed)")

		getfenv(old)[funcname] = new

		return old
	end
	env["hookfunction"], env["replaceclosure"] = hook, hook

	env["getgc"] = function()
		return gc
	end
	
	local env_thread = env.coroutine.running()
	env["checkcaller"] = function()
		return env.coroutine.running() == env_thread
	end

	-- catch garbage collection and/or nil assignment
	local clone = {}
	task.spawn(function()
		while task.wait() do
			for name, value in pairs(env) do
				clone[name] = value
			end
			for name, value in pairs(clone) do
				if not env[name] then
					gc[name] = value
				end
			end
			env["getgc"] = function()
				return gc
			end
		end
	end)

	print(string.format("[build::896581584] [xAPI] Loaded %d variables!", _count))
end
