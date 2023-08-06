--[[
//
MADE BY PansRB
//

Weird Remotes Modules to handle secret functioning remotes.
Full Documentations is on Github
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local HashLib = require(script.HashLib)

local RemotesModule = {}
local DataSignature = "lllll0"
local EncryptionType = 0

if RunService:IsStudio() then
	DataSignature = DataSignature
else
	DataSignature = `{DataSignature}_{game.JobId}`
end

function encryptString(message : string)
	local encryptiontypes = {
		[0] = HashLib.bin_to_base64(HashLib.hex_to_bin(HashLib.sha1(message))),
		[1] = HashLib.base64_encode(message),
		[2] = HashLib.sha256(message),
		[3] = HashLib.md5(message)
	}
	return encryptiontypes[EncryptionType] or encryptiontypes[0]
end

RemotesModule.Function = function(Name)
	local encryptedRemoteName = encryptString(Name..DataSignature)
	
	local RemoteInstance = ReplicatedStorage:FindFirstChild(encryptedRemoteName)
	if not RemoteInstance then
		RemoteInstance = Instance.new("RemoteFunction")
		RemoteInstance.Name = encryptedRemoteName
		RemoteInstance.Parent = ReplicatedStorage
	end
	
	return RemoteInstance
end

RemotesModule.Event = function(Name)
	local encryptedRemoteName = encryptString(Name..DataSignature)

	local RemoteInstance = ReplicatedStorage:FindFirstChild(encryptedRemoteName)
	if not RemoteInstance then
		RemoteInstance = Instance.new("RemoteEvent")
		RemoteInstance.Name = encryptedRemoteName
		RemoteInstance.Parent = script
	end

	return RemoteInstance
end

return RemotesModule
