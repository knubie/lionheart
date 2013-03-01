require('player')
require('actions')
-- require('races')

function love.run()

  local fps = 10

  math.randomseed(os.time())
  math.random() math.random()

  if love.load then love.load(arg) end

  local dt = 0

  -- Main loop time.
  while true do

    -- Takes a time measurement for the start time of the frame.
    local frame_start_time = love.timer.getMicroTime()

    -- Process events.
    if love.event then
      love.event.pump()
      for e,a,b,c,d in love.event.poll() do
        if e == "quit" then
          if not love.quit or not love.quit() then
            if love.audio then
              love.audio.stop()
            end
            return
          end
        end
        love.handlers[e](a,b,c,d)
      end
    end

    -- Update dt, as we'll be passing it to update
    if love.timer then
      love.timer.step()
      dt = love.timer.getDelta()
    end

    -- Call update and draw
    if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
    if love.graphics then
      love.graphics.clear()
      if love.draw then love.draw() end
    end

    if love.timer then love.timer.sleep(0.001) end
    if love.graphics then love.graphics.present() end

    -- Takes a time measurement for the stop time of the frame.
    local frame_end_time = love.timer.getMicroTime()

    -- The time it took for this frame to be completed.
    local frame_time = frame_end_time - frame_start_time
    if frame_time < 1 / fps then
        love.timer.sleep(1/ fps - frame_time)
    end

  end

end

function love.load()
  love.graphics.setMode(650, 650, false, true, 0)
end

function love.update(dt)
  player.one:update()
  player.two:update()
  --player.fireball:animate()
end

function love.draw()
  -- local bb1 = races.human.ibuki.walk_f.hb.bb1
  -- local bb2 = races.human.ibuki.walk_f.hb.bb2
  -- local bb3 = races.human.ibuki.walk_f.hb.bb3

  -- if char.p1.state == "walk_f" then
  --  for bb = 1, table.getn(races.human.ibuki.walk_f.hb) do
  --    love.graphics.rectangle("line",
  --      races.human.ibuki.walk_f.hb[bb][char.p1.frame][1]+char.p1.x-char.p1.class[char.p1.state].c.x,
  --      races.human.ibuki.walk_f.hb[bb][char.p1.frame][2]+650-char.p1.class[char.p1.state].h+char.p1.y,
  --      races.human.ibuki.walk_f.hb[bb][char.p1.frame][3],
  --      races.human.ibuki.walk_f.hb[bb][char.p1.frame][4])
  --  end
  -- end

  player.one:draw()
  player.two:draw()
  --player.fireball:draw()

end

function love.keypressed(key)
end
