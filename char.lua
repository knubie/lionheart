module(...,package.seeall)
require('races')
require('actions')

GROUND = 650

function new (class)
	local char = {
		walkf_v = 4,
		walkb_v = -3,
		x = 100,
		y = 0,
		controls = { -- Keyboard/joystick controls
			up = "up",
			down = "down",
			left = "left",
			right = "right"
		},
		state = "idle", -- Animation state
		facing = "right",
		frame = 1,
		class = class
	}

	function char:draw ()
		-- Create local reference to the character state
		local state = class[self.state]

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
	end

	function char:movex(v)
		-- Create local reference to the character state
		local state = class[self.state]

		if self.x-state.c.x > 0 and self.x-state.c.x+state.w < GROUND then
			if self.x-state.c.x+v > 0 and self.x-state.c.x+state.w+v < GROUND then
				self.x = self.x+v
			end
		end
	end

	function char:walk(direction)
		if direction == "F" then
			self:set_state("walk_f")
		else
			self:set_state("walk_b")
		end

		if (direction == "F" and self.facing == "right") then
			self:movex(self.walkf_v)
		elseif (direction == "B" and self.facing == "right") then
			self:movex(self.walkb_v)
		end
	end

	function char:crouch ()
		if self.state == "crouch_outro" then
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
	end

	function char:stand()
		if self.state == "crouch_intro" then
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
	end

	function char:set_state (state_name)
		if self.state ~= state_name then
			self.frame = 1
			self.state = state_name
		end
	end

	function char:update ()
		actions.update(self)
	end

	return char
end

p1 = new(races.human.ibuki)