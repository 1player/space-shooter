local class = require 'hump.class'

Player = class{}

local SIZE = 32
local HSIZE = SIZE/2
local SPEED = 10
local COLOR = {51, 51, 204}

function Player:init(posv)
	-- position vector of the center of the player
	self.posv = posv

	-- direction vector, pointing up initially
	self.dir = vector.new(1, 0)
end

function Player:updateDirection(dt)
	-- get mouse position vector
	local mousePosv = vector.new(love.mouse.getPosition())
	local mouseDirv = mousePosv - self.posv

	-- rotate direction vector by 90 degrees, so that 0 is up
	mouseDirv:rotate_inplace(math.pi/2)

	-- set direction vector
	self.dir = mouseDirv:normalized()
end

function Player:update(dt)
	self:updateDirection(dt)
end

function Player:draw()
	love.graphics.setColor(COLOR[1], COLOR[2], COLOR[3])

	love.graphics.push()
		-- set origin to player position
		love.graphics.translate(self.posv.x, self.posv.y)

		-- rotate player by the direction
		love.graphics.rotate(self.dir:angleTo())

		-- draw player triangle
		love.graphics.polygon('fill',
			-- left base
			-HSIZE, HSIZE,
			-- right base
			HSIZE, HSIZE,
			-- top
			0, -HSIZE)

	love.graphics.pop()
end

return Player