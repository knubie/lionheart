module(..., package.seeall)
require('controls')
require('animation')

function update (char)



	if char.facing == "right" then
		B, UB, DB, F, UF, DF, U, D = controls.set(char)
	else
		F, UF, DF, B, UB, DB, U, D = controls.set(char)
	end

	local class = char.class
	local state = char.state

	if state == "idle" then

		-- INPUTS
		if U then
			-- sprite:init_jump("neutral")
		elseif UF then
			-- sprite:init_jump("right")
		elseif F then
			char:walk("F")
		elseif DF then
			-- sprite:crouch()
		elseif D then
			-- sprite:crouch()
		elseif DB then
			-- sprite:crouch()
		elseif B then
			-- sprite:walk("left")
		elseif UB then
			-- sprite:init_jump("left")
		elseif jabb then
			-- jab(sprite, "standing")
		end

		-- ANIMATION
		animation.loop(char)

	elseif char.state == "walk_f" then

		-- INPUTS
		if U then
			-- sprite:init_jump("neutral")
		elseif UF then
			-- sprite:init_jump("right")
		elseif F then
			char:walk("F")
		elseif DF then
			-- sprite:crouch()
		elseif D then
			-- sprite:crouch()
		elseif DB then
			-- sprite:crouch()
		elseif B then
			-- sprite:walk("left")
		elseif UB then
			-- sprite:init_jump("left")
		elseif jabb then
			-- jab(sprite, "standing")
		else
			char:set_state("idle")
		end

		-- ANIMATION
		animation.loop(char)
	end

end