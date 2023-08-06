[Remotes Handler](https://www.roblox.com/library/14332266448/Remotes-Handler)

## DESCRIPTION
Remotes Handler is a Module that handle all remotes that are created using this module, this module will hide the module name with HashLib by boatbomber's HashLib Module.
Feel free to use this module, no need to credit if u don't want ;)

## USAGES
this Module only have 2 functions, `Function()` and `Event()`

### RemoteHandler.Function()
this Function is used to create a new RemoteFunction.
```lua
local Remotes = -- Remote Handler module

--// SERVER
Remotes.Function("spawn_hallucination_ghost") -- CLIENT HANDLED REMOTE
Remotes.Function("trigger_sigma_boss").OnServerInvoke = function(Player) -- SERVER HANDLED REMOTE
    print("brrr skibidi bop bop bop yes yes")
    Remotes.Function("spawn_hallucination_ghost"):InvokeClient(Player)
    return "sigma titan toilet camera speaker man spawned beep boop boop"
end

--// CLIENT
local res = Remotes.Function("trigger_sigma_boss"):InvokeServer()
print(res) -- Expected Output : "sigma titan toilet camera speaker man spawned beep boop boop"

Remotes.Function("spawn_hallucination_ghost").OnClientInvoke = function()
    print("rahhhhh")
end
```
### RemoteHandler.Event()
this Function works the same like RemoteHandler.Function() but for RemoteEvent instead.
```lua
local Remotes = -- Remote Handler module

--// SERVER
Remotes.Event("spawn_hallucination_ghost") -- CLIENT HANDLED REMOTE
Remotes.Event("trigger_sigma_boss").OnServerEvent:Connect(function(Player) -- SERVER HANDLED REMOTE
    print("brrr skibidi bop bop bop yes yes")
    Remotes.Event("spawn_hallucination_ghost"):FireAllClient()
end)

--// CLIENT
Remotes.Event("trigger_sigma_boss"):FireServer()
Remotes.Event("spawn_hallucination_ghost").OnClientEvent:Connect(function()
    print("rahhhhh")
end)
```
