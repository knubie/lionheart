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
		if U then char:jump("N")
		elseif UF then char:jump("F")
		elseif F then char:walk("F")
		elseif DF then char:crouch()
		elseif D then char:crouch()
		elseif DB then char:crouch()
		elseif B then char:walk("B")
		elseif UB then
		elseif jabb then
		end

		char:animate()

	elseif state == "walk_f" then

		-- INPUTS
		if U then char:jump("N")
		elseif UF then char:jump("F")
		elseif F then char:walk("F")
		elseif DF then char:crouch()
		elseif D then char:crouch()
		elseif DB then char:crouch()
		elseif B then char:walk("B")
		elseif UB then
		elseif jabb then

		else
			char:set_state("idle")
		end

		char:animate()

	elseif state == "walk_b" then

		-- INPUTS
		if U then char:jump("N")
		elseif UF then
		elseif F then char:walk("F")
		elseif DF then char:crouch()
		elseif D then char:crouch()
		elseif DB then char:crouch()
		elseif B then char:walk("B")
		elseif UB then
		elseif jabb then
		else char:set_state("idle")
		end

		char:animate()

	elseif state == "crouch_intro" then

		-- INPUTS
		if U then char:jump("N")
		elseif UF then char:jump("F")
		elseif F then char:walk("F")
		elseif DF then
		elseif D then
		elseif DB then
		elseif B then char:walk("B")
		elseif UB then
		elseif jabb then
		else char:stand()
		end

		char:animate()

	elseif state == "crouch_loop" then

		-- INPUTS
		if U then
		elseif UF then
		elseif F then char:walk("F")
		elseif DF then
		elseif D then
		elseif DB then
		elseif B then char:walk("B")
		elseif UB then
		elseif jabb then
		else char:stand()
		end

		char:animate()

	elseif state == "crouch_outro" then

		-- INPUTS
		if U then char:jump("N")
		elseif UF then char:jump("F")
		elseif F then char:walk("F")
		elseif DF then
		elseif D then char:crouch()
		elseif DB then
		elseif B then char:walk("B")
		elseif UB then
		elseif jabb then
		else char:stand()
		end

		char:animate()

	elseif state == "jump_neutral" then

		-- INPUTS
		if U then char:jump("N")
		elseif UF then
		elseif F then
		elseif DF then
		elseif D then
		elseif DB then
		elseif B then
		elseif UB then
		elseif jabb then
		end

		char:animate()

	elseif state == "jump_forward" then

		-- INPUTS
		if U then char:jump("F")
		elseif UF then char:jump("F")
		elseif F then char:jump("F")
		elseif DF then char:jump("F")
		elseif D then char:jump("F")
		elseif DB then char:jump("F")
		elseif B then char:jump("F")
		elseif UB then char:jump("F")
		elseif jabb then char:jump("F")
		else char:jump("F")
		end

		char:animate()
	end

end