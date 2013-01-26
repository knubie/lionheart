module(...,package.seeall)
require('races')
require('actions')

GROUND = 650

Class = {
	new = function(self, o)
		o = o or {}
		setmetatable(o, self)
		self.__index = self
		return o
	end
}

Mob = Class:new{

	currentState = "idle", -- Current animation state
	frame = 1, -- Current animation frame

	animate = function(self)

		-- Create local reference to the character state
		local state = self.states[self.currentState]

		if self.frame < state.img:getWidth() / state.w then
			self.frame = self.frame + 1
		else
			if state.loop == true then
				self.frame = 1
			else
				self.currentState = state.next_state
			end
		end
	end,

	draw = function(self)
		-- Create local reference to the character state
		local state = self.states[self.currentState]

		local quad = love.graphics.newQuad(
			-- X, Y
			state.w * (self.frame-1), 0, -- Move to the correct frame on the animation sheet.
			-- W, H
			state.w, state.h,
			-- Image W, H
			state.img:getWidth(), state.img:getHeight()
		)
		-- Determine whether to flip the image or not.
		if self.facing == "left" then
			quad:flip(true, false)
			love.graphics.drawq(state.img, quad, self.x-state.w+state.c.x, GROUND-state.h+self.y)
		else
			love.graphics.drawq(state.img, quad, self.x-state.c.x, GROUND-state.h+self.y)
		end
	end,

	movex = function(self, v)
		-- Create local reference to the character state
		local state = self.states[self.currentState]

		if self.x-state.c.x > 0 and self.x-state.c.x+state.w < GROUND then
			if self.x-state.c.x+v > 0 and self.x-state.c.x+state.w+v < GROUND then
				self.x = self.x+v
			end
		end
	end,

	set_state = function(self, state_name)
		if self.currentState ~= state_name then
			self.frame = 1
			self.currentState = state_name
		end
	end,

	walk = function(self, direction)
		if direction == "F" then
			self:set_state("walk_f")
		else
			self:set_state("walk_b")
		end

		if (direction == "F" and self.facing == "right") then
			self:movex(self.attributes.walkf_v)
		elseif (direction == "B" and self.facing == "right") then
			self:movex(self.attributes.walkb_v)
		end
	end,

	crouch = function(self)
		if self.currentState == "crouch_outro" then
			if self.frame == 2 then
				self:set_state("crouch_intro")
				self.frame = 2
			elseif frame == 1 then
				self:set_state("crouch_loop")
			else
				self:set_state("crouch_intro")
			end
		else
			self:set_state("crouch_intro")
		end
	end,

	stand = function(self)
		if self.currentState == "crouch_intro" then
			if self.frame == 2 then
				self:set_state("crouch_outro")
				self.frame = 2
			elseif frame == 1 then
				self:set_state("idle")
			else
				self:set_state("crouch_outro")
			end
		else
			self:set_state("crouch_outro")
		end
	end,

	update = function(self)
		actions.update(self)
	end
}

Ninja = Mob:new{
	attributes = {
		walkf_v = 4,
		walkb_v = -3,
	},
	states = {
		idle = {
			img = love.graphics.newImage("assets/ibuki-idle.png"),
			c = {x=48,y=100},
			w = 96,
			h = 100,
			loop = true
		},
		walk_f = {
			img = love.graphics.newImage("assets/ibuki-walkf.png"),
			c = {x=50,y=101},
			w = 96,
			h = 101,
			loop = true
		},
		walk_b = {
			img = love.graphics.newImage("assets/ibuki-walkb.png"),
			c = {x=50,y=101},
			w = 96,
			h = 101,
			loop = true
		},
		crouch_intro = {
			img = love.graphics.newImage("assets/ibuki-crouch-intro.png"),
			c = {x=69,y=101},
			w = 110,
			h = 101,
			loop = false,
			next_state = 'crouch_loop'
		},
		crouch_loop = {
			img = love.graphics.newImage("assets/ibuki-crouch-loop.png"),
			c = {x=43,y=65},
			w = 84,
			h = 65,
			loop = true
		},
		crouch_outro = {
			img = love.graphics.newImage("assets/ibuki-crouch-outro.png"),
			c = {x=69,y=101},
			w = 110,
			h = 101,
			loop = false,
			next_state = 'idle'
		}
	}
}

player1 = Ninja:new{
	x = 100,
	y = 0,
	controls = { -- Keyboard/joystick controls
		up = "up",
		down = "down",
		left = "left",
		right = "right"
	},
	currentState = "idle", -- Animation state
	facing = "right"
}
