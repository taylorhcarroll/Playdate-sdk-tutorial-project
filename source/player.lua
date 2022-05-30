import "projectile"

local spriteOffset <const> = 16

-- gives same properties as a sprite
class('Player').extends(gfx.sprite)

--x,y coords are starting point for player
-- init function creates new instance of an object
function Player:init(x, y)
    local playerImage = gfx.image.new("images/player")
    self:setImage(playerImage)
    self:moveTo(x, y)
    -- adds player to the drawList, therefore spriteupdate function in main file knows to update the sprite
    self:add()

    self.speed = 3
end

-- sprite update func in main file will be calling this update func every frame when the sprite is added with the add() method
-- added offset to keep player sprite from going over, but another option is to work with playdate SDK's collision system
function Player:update()
    -- if statement added to prevent user from going out of bounds
    if (pd.buttonIsPressed(pd.kButtonUp) and self.y > 0 + spriteOffset ) then
            self:moveBy(0, -self.speed)
    elseif (pd.buttonIsPressed(pd.kButtonDown) and self.y < 240 - spriteOffset) then
            self:moveBy(0, self.speed)
    end
    -- self.x & y passed in to set initial bullet spawning location to player's current position
    if (pd.buttonIsPressed(pd.kButtonA)) then
        projectile(self.x, self.y, 5)
    end
end