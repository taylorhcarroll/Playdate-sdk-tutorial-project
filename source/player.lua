local pd <const> = playdate
local gfx <const> = pd.graphics

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
function Player:update()
    -- if statement added to prevent user from going out of bounds
    if (pd.buttonIsPressed(pd.kButtonUp) and self.y > 0 ) then
            self:moveBy(0, -self.speed)
    elseif (pd.buttonIsPressed(pd.kButtonDown) and self.y < 240) then
            self:moveBy(0, self.speed)
    end
end