require('char')
require('actions')
require('races')
function love.load()
	min_dt = 1/24
	next_time = love.timer.getMicroTime()
	love.graphics.setMode(650, 650, false, true, 0)
	-- love.graphics.setBackgroundColor(255, 255, 255)
	i = 0
end

function love.update(dt)
	next_time = next_time + min_dt

	actions.update(char.p1)
end

function love.draw()
	local bb1 = races.human.ibuki.walk_f.hb.bb1
	local bb2 = races.human.ibuki.walk_f.hb.bb2
	local bb3 = races.human.ibuki.walk_f.hb.bb3

	if char.p1.state == "walk_f" then
		for bb = 1, table.getn(races.human.ibuki.walk_f.hb) do
			love.graphics.rectangle("line",
				races.human.ibuki.walk_f.hb[bb][char.p1.frame][1]+char.p1.x-char.p1.class[char.p1.state].c.x,
				races.human.ibuki.walk_f.hb[bb][char.p1.frame][2]+650-char.p1.class[char.p1.state].h+char.p1.y,
				races.human.ibuki.walk_f.hb[bb][char.p1.frame][3],
				races.human.ibuki.walk_f.hb[bb][char.p1.frame][4])
		end
	end

	char.p1:draw()

	local cur_time = love.timer.getMicroTime()
   if next_time <= cur_time then
      next_time = cur_time
      return
   end
   love.timer.sleep(1000*(next_time - cur_time))
end

function love.keypressed(key)
end