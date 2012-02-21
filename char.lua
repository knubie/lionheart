module(...,package.seeall)
require('races')

GROUND = 650

function new (class)
	char = {
		hp = 100,
		attack = 100,
		defense = 100,
		str = 6,
		dex = 6,
		vit = 6,
		agi = 6,
		int = 6,
		mnd = 6,
		walk_v = 5,
		x = 100,
		y = 0,
		up = "up",
		down = "down",
		left = "left",
		right = "right",
		state = "idle",
		facing = "right",
		frame = 1,
		class = class
	}

	local state = class[char.state]

	function char:draw ()
		local state = class[self.state]
		local quad = love.graphics.newQuad(
			state.w * (self.frame-1), 0,
			state.w, state.h,
			state.img:getWidth(), state.img:getHeight()
		)
		if self.facing == "left" then
			quad:flip(true, false)
			love.graphics.drawq(state.img, quad, self.x-state.w+state.c.x, GROUND-state.h+self.y)
		else
			love.graphics.drawq(state.img, quad, self.x-state.c.x, GROUND-state.h+self.y)
		end
	end

	function char:movex(v)
		if self.x-state.c.x > 0 and self.x-state.c.x+state.w < 650 then
			if self.x-state.c.x+v > 0 and self.x-state.c.x+state.w+v < 650 then
				self.x = self.x+v
			end
		end
	end

	function char:walk(direction)
		local walk = ""
		if direction == "F" then
			walk = "walk_f"
		else
			walk = "walk_b"
		end

		self:set_state(walk)

		if (direction == "F" and self.facing == "right") or (direction == "B" and self.facing == "left") then
			self:movex(self.walk_v)
		else
			self:movex(0-self.walk_v)
		end
	end

	function char:set_state (state_name)
		if self.state ~= state_name then
			self.frame = 1
			self.state = state_name
		end
	end

	return char
end

p1 = new(races.human.ibuki)