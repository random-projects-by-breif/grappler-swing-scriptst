local targetName = "TeleportPlayerToCurrentCheckpoint"
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "InvokeServer" and tostring(self) == targetName then
        warn("Blocked attempt to call: " .. targetName)
        return nil
    end
    return oldNamecall(self, ...)
end)