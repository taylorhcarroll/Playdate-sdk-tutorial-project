import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- import this if you want to use the crank
-- import "CoreLibs/crank"

--this is commonly used variable you can just use gfx instead, less to write and increased performance
local gfx <const> = playdate.graphics

-- player sprite local variable
local playerSprite = nil

local function initialize()
-- .png file extension not needed to be passed
	local playerImage = gfx.image.new("images/player")
-- take playerImage local var and pass into following to create new sprite instance
	playerSprite = gfx.sprite.new(playerImage)
-- put player at center of screen to start, used a ` : ` below because we are calling ` moveTo ` on this particular instance of the sprite
-- playeDate resolution is 400 x 240, (0,0) is top left origin
	playerSprite:moveTo(200, 120)
-- this adds sprite to the displayList telling the system to know to draw that sprite
	playerSprite:add()
end

initialize()

-- main loop for the game, called every frame before it's drawn
-- playdate runs at 30fps, no draw loop, only update
function playdate.update()
-- this tells the sprite class to update everything in the drawList on every frame
	gfx.sprite.update()
end