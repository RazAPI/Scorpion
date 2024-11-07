#  Our Documentation

```lua

scr = {} -- Main table


scr.protect_script (or scr.unprotect_script) -- Protects a script



scr.print -- Does the same as printing, but instead it looks like that C information print.

scr.kickme() -- Kicks the LocalPlayer

scr.crash() -- Sends a kick message first, and then crashes the player 2 seconds later.

scr.identity() -- Provides the actual identity value, likely PrintIdentity but more focused, and uses a real getthreadidentity.

scr.Exit() -- Makes the player exit the game automatically

scr.killinstance(game.CoreGui.Your_UI_or_choose_Another_script_whatever) -- Destroys and kills the instance, Parts, LocalScripts, Scripts, ScreenGui's, Frames, etc.

scr.getsignal -- Returns device signal

scr.findnilinstances -- Finds nil instances, and returns them.

scr.ctable -- Creates a new table
scr.get_closure -- Returns main closure/ callback stack usage

scr.filetable -- Returns the file table

scr.setnilinstances -- Sets a instance to nil (Supports every service, if im not stupid enough)

scr.protect_gui -- Does the same thing synapse x does, No it's not gethui at all.

scr.get_closure -- Returns closure as callback stack size

scr.unprotect_gui -- Unprotects the Gui

scr.Update -- Updates to the latest version (Not Implemented yet)


-- More things (not our functions) listed down there, which helped us with a bunch of things.

```

# Fluxus Added Functions

```lua

fluxus = {}

fluxus.queue_on_teleport -- Returns queue on teleport

fluxus.request -- Returns request

fluxus.get_thread_identity -- Gets the thread identity
fluxus.get_thread_context -- Same thing as getthreadidentity

fluxus.set_thread_identity -- Sets the thread identity
fluxus.set_thread_context -- Sets thread context

fluxus.setidentity - Alias
fluxus.getidentity - Alias
```

# Synapse's Added Functions

```lua

syn = {}

syn.queue_on_teleport -- Yes, it still does return the same thing as queue on teleport

syn.request -- Returns request

syn.killprocess -- Kills the Roblox Process

syn.hook -- returns hookfunction

syn.protect_gui -- Actually has a purpose now
syn.unprotect_gui

syn.writefile -- Writes a file to workspace

syn.readfile -- Reads a file in workspace

syn.setthreadidentity (or set_thread_identity) -- Sets the current identity

syn.getthreadidentity (or get_thread_identity) -- Gets the current identity

syn.toast_notification -- Returns a toast notification

syn.websocket -- WebSocket.Connect/WebSocket moment (api.scorpion.v5:Connect(WebSocket.newBridge):localh.4712

syn.cache -- Can't list all the other cache functions cuz im too lazy

syn.is_beta -- Checks if you're on a beta version of Synapse (Ok at this point there's no need of this)

syn.setreadonly -- Sets a table as readonly (I have to go shit)

is_synapse_function -- Checks if synapse's functions are registered (Removing lately)

-- Here's a not so synapse related function that died 500 years ago

PROTOSMASHER_LOADED -- Returns true
```


# Bridge & Other Custom Functions/Aliases

```lua

http.request -- Alias
http_request -- Alias
isscriptrunning -- getrunning scripts alias

Bridge.Info -- Does the same as sli.print
Bridge.new -- Creates a new Actor inside HttpService with more supported methods to Request
Bridge.Task -- Finds tasks ingame

getfps -- RENC Function
getping -- not a RENC Function

getrunningmodulescript(s) -- Checks for modulescripts
getrunninglocalscript(s) -- Checks for localscripts
getrunningactor(s) -- Checks for Actors

http_new_request -- http.request alias

create_actor -- Creates an actor inside "game"
save_actor -- Don't know what this'll do for now

randomString -- a fucking random string the fuck you want me to do about this

get_running_actors -- getrunningactors alias

run_on_actor -- Not usable, maybe i'll just make it override execution to another path that has a Actor with default settings enabled that can then properly run actual RemoteEvents/Hooks

enable_Images -- Removes TextButtons like Execute, Clear, and Attach. and instead replaces them with ImageButtons with proper icons (Not Implemented)

```
