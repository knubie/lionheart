module(..., package.seeall)
require('controls')
require('animation')

-- Checks user input and calls appropriate action method.
function update (char)

	-- Checks player input and assigns bolean values to the variables.
	if char.facing == "right" then
		B, UB, DB, F, UF, DF, U, D = controls.set(char)
	else
		F, UF, DF, B, UB, DB, U, D = controls.set(char)
	end

	local class = char.class
	local state = char.currentState

	if state == "idle" then

		-- INPUTS
		if U then
			-- sprite:init_jump("neutral")
		elseif UF then
			-- sprite:init_jump("right")
		elseif F then
			char:walk("F")
		elseif DF then
			char:crouch()
		elseif D then
			char:crouch()
		elseif DB then
			char:crouch()
		elseif B then
			char:walk("B")
		elseif UB then
			-- sprite:init_jump("left")
		elseif jabb then
			-- jab(sprite, "standing")
		end

		char:animate()

	elseif state == "walk_f" then

		-- INPUTS
		if U then
			-- sprite:init_jump("neutral")
		elseif UF then
			-- sprite:init_jump("right")
		elseif F then
			char:walk("F")
		elseif DF then
			-- sprite:crouch()
			char:crouch()
		elseif D then
			-- sprite:crouch()
			char:crouch()
		elseif DB then
			-- sprite:crouch()
			char:crouch()
		elseif B then
			char:walk("B")
		elseif UB then
			-- sprite:init_jump("left")
		elseif jabb then
			-- jab(sprite, "standing")
		else
			char:set_state("idle")
		end

		char:animate()

	elseif state == "walk_b" then

		-- INPUTS
		if U then
			-- sprite:init_jump("neutral")
		elseif UF then
			-- sprite:init_jump("right")
		elseif F then
			char:walk("F")
		elseif DF then
			-- sprite:crouch()
			char:crouch()
		elseif D then
			-- sprite:crouch()
			char:crouch()
		elseif DB then
			-- sprite:crouch()
			char:crouch()
		elseif B then
			char:walk("B")
		elseif UB then
			-- sprite:init_jump("left")
		elseif jabb then
			-- jab(sprite, "standing")
		else
			char:set_state("idle")
		end

		char:animate()

	elseif state == "crouch_intro" then

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
			-- char:crouch()
		elseif DB then
			-- sprite:crouch()
		elseif B then
			char:walk("B")
			-- sprite:walk("left")
		elseif UB then
			-- sprite:init_jump("left")
		elseif jabb then
			-- jab(sprite, "standing")
		else
			char:stand()
		end

		char:animate()

	elseif state == "crouch_loop" then

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
			-- char:crouch()
		elseif DB then
			-- sprite:crouch()
		elseif B then
			char:walk("B")
			-- sprite:walk("left")
		elseif UB then
			-- sprite:init_jump("left")
		elseif jabb then
			-- jab(sprite, "standing")
		else
			char:stand()
		end

		char:animate()

	elseif state == "crouch_outro" then

		-- INPUTS
		if U then
			-- sprite:init_jump("neutral")
		elseif UF then
			-- sprite:init_jump("right")
		elseif F then
			-- char:walk("F")
			char:walk("F")
		elseif DF then
			-- sprite:crouch()
		elseif D then
			char:crouch()
		elseif DB then
			-- sprite:crouch()
		elseif B then
			char:walk("B")
			-- sprite:walk("left")
		elseif UB then
			-- sprite:init_jump("left")
		elseif jabb then
			-- jab(sprite, "standing")
		end

		char:animate()

	end

end