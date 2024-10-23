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

syn.hook -- returns hookfunction

syn.protect_gui -- Does the same thing, and sets the parent to ScorpionContainer, which is game.CoreGui.RobloxGui.Modules.Shell.Components.Overscan.MODULEINTERPETER_INTACTWITHINX07178CD6X677111650258302937LIAYZ86829HGUHTUYSER32KRN2376156

is_synapse_function -- Checks if synapse's functions are registered (Removing lately)

-- Here's a not so synapse related function that died 500 years ago

PROTOSMASHER_LOADED -- Returns true
```
