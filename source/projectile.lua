local pd <const> = playdate
local gfx <const> = pd.graphics

class('Projectile').extends(gfx.sprite)

function Projectile:init(x, y, speed)
    local projectileSize = 4
    local projectileImage = gfx.image.new(projectileSize * 2, projectileSize * 2)
    -- allows us to draw directly on an image instead of the screen
    gfx.pushContext(projectileImage)
        gfx.drawCircleAtPoint(projectileSize, projectileSize, projectileSize)
    gfx.popContext()
    self:setImage(projectileImage)
    -- this property added to use moveWithCollisions
    self:setCollideRect(0, 0, self:getSize())
    self.speed = speed
    self:moveTo(x, y)
    self:add()
end

-- collisions is added to allow bullets to hit enemies
-- self.speed is added at a constant rate to self.x to move the bullet across the screen
function Projectile:update()
    self:moveWithCollisions(self.x + self.speed, self.y)
end



