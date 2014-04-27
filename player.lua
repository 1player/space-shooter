local class = require 'hump.class'

Player = class{}

local SIZE = 32
local SPEED = 300
local INERTIA = 10
local COLOR = {51, 51, 204}

local HSIZE = SIZE/2
local FRICTION = 1-(1/INERTIA)

function Player:init(posv)
	-- position vector of the center of the player
	self.posv = posv

	-- direction vector, pointing up initially
	self.dir = vector.new(0, -1)

	self.movev = vector.new(0, 0)
end

function Player:updateDirection(dt)
	-- get mouse position vector
	local mousePosv = vector.new(love.mouse.getPosition())
	local mouseDirv = mousePosv - self.posv

	-- set direction vector
	self.dir = mouseDirv:normalized()
end

function Player:move(dt)
	if love.keyboard.isDown("w") then
		self.movev = vector.new(1, 1) * SPEED * dt
	elseif love.keyboard.isDown("s") then
		self.movev = vector.new(-1, -1) * SPEED * dt
	else
		self.movev = self.movev * FRICTION
	end

	self.posv = self.posv + self.dir:permul(self.movev)
end

function Player:update(dt)
	self:updateDirection(dt)
	self:move(dt)
end

function Player:draw()
	love.graphics.setColor(COLOR[1], COLOR[2], COLOR[3])

	love.graphics.push()
		-- set origin to player position
		love.graphics.translate(self.posv.x, self.posv.y)

		-- rotate player by the direction
		love.graphics.rotate(self.dir:angleTo()+math.pi/2)

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