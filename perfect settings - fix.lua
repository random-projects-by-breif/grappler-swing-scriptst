local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChangeSetting = ReplicatedStorage:WaitForChild("DreamworksPackages")
    :WaitForChild("Dreamworks")
    :WaitForChild("AllocatedFunctionsFromServerForClientFolder")
    :WaitForChild("Settings")
    :WaitForChild("ChangeSetting")
local settingsToUpdate = {
    {"CameraFOV", 111111}, 
    {"FallDamage", false},
    {"Music", false},
    {"GrapplerCursor", 0.5},
    {"GrapplerCursorImage", 2},
    {"ImpactCraters", false}
}
for _, setting in ipairs(settingsToUpdate) do
    local success, result = pcall(function()
        return ChangeSetting:InvokeServer(shared._PRIVATE_DreamworksModularData.AllocatedModules.Settings, setting[1], setting[2])
    end)
    if not success then
        warn("Failed to update " .. setting[1] .. ": " .. tostring(result))
    end
end