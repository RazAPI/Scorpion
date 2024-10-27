#  Our Documentation

```lua

scr = {} -- Main table

scr.print -- Does the same as printing, but instead it looks like that C information print.

scr.kickme() -- Kicks the LocalPlayer

scr.crash() -- Sends a kick message first, and then crashes the player 2 seconds later.

scr.identity() -- Provides the actual identity value, likely PrintIdentity but more focused, and uses a real getthreadidentity.

scr.Exit() -- Makes the player exit the game automatically

scr.killinstance(game.CoreGui.Your_UI_or_choose_Another_script_whatever) -- Destroys and kills the instance, Parts, LocalScripts, Scripts, ScreenGui's, Frames, etc.

scr.getsignal -- Returns device signal

scr.findnilinstances -- Finds nil instances, and returns them.

scr.filetable -- Returns the file table

scr.setnilinstances -- Sets a instance to nil (Supports every service, if im not stupid enough)

scr.protect_gui -- Does the same thing synapse x does, No it's not gethui at all.

scr.get_closure -- Returns closure as callback stack size

scr.unprotect_gui -- Unprotects the Gui


-- More things (not our functions) listed down there, which helped us with a bunch of things.

```

# Fluxus Added Functions

```lua

fluxus = {}

fluxus.queue_on_teleport -- Returns queue on teleport

fluxus.request -- Returns request

```

# Synapse's Added Functions

```lua

syn = {}

syn.queue_on_teleport -- Yes, it still does return the same thing as queue on teleport

syn.request -- Returns request

syn.killprocess -- Kills the Roblox Process

syn.hook -- returns hookfunction

syn.protect_gui -- Actually has a purpose now

syn.writefile -- Writes a file to workspace

syn.readfile -- Reads a file in workspace

syn.setthreadidentity (or set_thread_identity) -- Sets the current identity

syn.getthreadidentity (or get_thread_identity) -- Gets the current identity

syn.toast_notification -- Returns a toast notification

syn.cache -- Can't list all the other cache functions cuz im too lazy

syn.is_beta -- Checks if you're on a beta version of Synapse (Ok at this point there's no need of this)

syn.setreadonly -- Sets a table as readonly (I have to go shit)

is_synapse_function -- Checks if synapse's functions are registered (Removing lately)

-- Here's a not so synapse related function that died 500 years ago

PROTOSMASHER_LOADED -- Returns true
```
