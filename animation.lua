module(...,package.seeall)

function loop (char)

	local class = char.class
	local state = char.state
	
	if char.frame < class[state].nf then
		char.frame = char.frame + 1
	else
		char.frame = 1
	end
end