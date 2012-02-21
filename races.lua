module(..., package.seeall)
-- base_damage = weapon.dmg + self.str - foe.vit
-- damage = base_damage * self.attack/foe.defense
human = {
	
	ibuki = {
		stats = {},
		idle = {
			img = love.graphics.newImage("assets/ibuki-idle.png"),
			c = {x=48,y=100},
			w = 96,
			h = 100,
			nf = 54
		},
		walk_f = {
			img = love.graphics.newImage("assets/ibuki-walkf.png"),
			c = {x=50,y=101},
			w = 96,
			h = 101,
			nf = 16
		}
	}

}

function drawBoxes (state, img)
	local all_frames = {}
	for frame = 1, state.nf do
		local box_x1 = 0
		local box_x2 = 0
		local box_y1 = 0
		local box_y2 = 0
		for y = 1, state.h do
			for x = 1+(state.w*(frame-1)), state.w*frame do

				local r,g,b,a = img:getPixel(x-1,y-1)
				if a ~= 0 then
					box_x1 = x-(state.w*(frame-1))
					box_y1 = y
					break
				end

			end
			if box_y1 ~= 0 then
				break
			end
		end

		for x = box_x1+(state.w*(frame-1)), (state.w*frame) do
			local r,g,b,a = img:getPixel(x-1,box_y1-1)
			if a == 0 then
				box_x2 = x-(state.w*(frame-1))-1
				break
			end
		end

		if box_x2 == 0 then
			box_x2 = state.w
		end

		for y = box_y1, state.h do
			local r,g,b,a = img:getPixel(box_x2+(state.w*(frame-1)-1),y-1)
			if a == 0 then
				box_y2 = y
				break
			end
		end

		if box_y2 == 0 then
			box_y2 = state.h
		end

		table.insert(all_frames, {box_x1, box_y1, (box_x2-box_x1), (box_y2-box_y1)})
	end
	return all_frames
end

human.ibuki.walk_f.hb = {
	drawBoxes(human.ibuki.walk_f, love.image.newImageData("assets/ibuki-walkf-bb1.png")),
	drawBoxes(human.ibuki.walk_f, love.image.newImageData("assets/ibuki-walkf-bb2.png")),
	drawBoxes(human.ibuki.walk_f, love.image.newImageData("assets/ibuki-walkf-bb3.png"))
}