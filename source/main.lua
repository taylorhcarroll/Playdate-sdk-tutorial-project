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

-- can also add bg using sdk's tilemap, this example uses setbackgrounddrawingcallback
-- setbackgrounddrawingcallback is a convenience func that creates screen-sized sprite, adds to the draw list and sets to the lowest z-index so it will always be behind everything
	local backgroundImage = gfx.image.new("images/background")
	gfx.sprite.setBackgroundDrawingCallback(
		function(x, y, width, height)
-- setClipRect and clearClipRect are added for performance optimization, the system keeps track of something called `dirty rects` which are essentially bounding boxes of every sprite that has graphically changed on the screen and needs to be re-drawn. What's passed as `x,y,width,height` is the bounding box that encapsulates the direct rects on screen and so we can limit the drawing to just those regions and won't waste processing time on something that `hasn't changed`
			gfx.setClipRect(x, y, width, height)
			backgroundImage:draw(0, 0)
			gfx.clearClipRect()
		end
	)
end

initialize()

-- main loop for the game, called every frame before it's drawn
-- playdate runs at 30fps, no draw loop, only update
function playdate.update()
-- this tells the sprite class to update everything in the drawList on every frame
	gfx.sprite.update()
end