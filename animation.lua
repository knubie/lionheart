module(...,package.seeall)

function loop (char)

	local class = char.class
	local state = char.state
	
	if char.frame < class[state].img:getWidth() / class[state].w then
		char.frame = char.frame + 1
	else
		if class[state].loop == true then
			char.frame = 1
		else
			char.state = class[state].next_state
		end
	end
end