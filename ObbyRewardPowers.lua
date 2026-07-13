local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local SETTINGS = {
    WalkSpeed = 60,
    JumpPower = 120,
}

local humanoid

local function applyCharacter(character)
    humanoid = character:WaitForChild("Humanoid")
    humanoid.UseJumpPower = true
    humanoid.WalkSpeed = SETTINGS.WalkSpeed
    humanoid.JumpPower = SETTINGS.JumpPower
end

if player.Character then
    applyCharacter(player.Character)
end

player.CharacterAdded:Connect(applyCharacter)

UserInputService.JumpRequest:Connect(function()
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
