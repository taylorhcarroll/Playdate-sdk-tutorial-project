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
end