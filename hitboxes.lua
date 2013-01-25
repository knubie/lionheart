module(..., package.seeall)

function draw (state, img)
	local all_frames = {}
	for frame = 1, state.img:getWidth() / state.w do
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
