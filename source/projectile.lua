local pd <const> = playdate
local gfx <const> = pd.graphics

class('Projectile').extends(gfx.sprite)

-- this chunk sets up the image for the basic bullet, moved out of the init func so as to not redraw it every time it's called
projectileSize = 4
projectileImage = gfx.image.new(projectileSize * 2, projectileSize * 2)
-- allows us to draw directly on an image instead of the screen
gfx.pushContext(projectileImage)
    gfx.drawCircleAtPoint(projectileSize, projectileSize, projectileSize)
gfx.popContext()

function Projectile:init(x, y, speed)
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



