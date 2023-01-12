local angles = {
    [1] = -55,
    [2] = 55,
    [3] = 38,
    [4] = -38,
    [5] = -29,
    [6] = 29,
    [7] = -15,
    [8] = 15,
    [9] = 180,
    [10] = -180,
    [11] = 360,
    [12] = -360,
    [13] = 20,
    [14] = -29,
    [15] = -12,
    [16] = 12,
    [17] = 40,
    [18] = -40,
    [19] = 0
    
}
-- good values could be better
local last_angle = 19
local new_angle = 1
local switch1 = false
local switch2 = false
local i = 19
local function resolve(player)
    plist.set(player, "Correction active", false) --Disabling the original correction
    plist.set(player, "Force body yaw", true) -- Enable the forcing of the body yaw.

    if last_angle == new_angle and switch1 then
        new_angle = -angles[i]
        if switch2 == true then
            switch1 = not switch1
        end
    else
        if i < #angles then
            i = i + 1
        else
            i = 19
        end
        new_angle = angles[i]
    end
  plist.set(player, "Force body yaw value", new_angle) -- Will pick from the numbers at "local angles" 
    last_angle = new_angle
    switch2 = false
end