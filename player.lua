module(...,package.seeall)
require('classes')

one = classes.Blm:new{
  x = 50,
  y = -10,
  controls = { -- Keyboard/joystick controls
    up = "up",
    down = "down",
    left = "left",
    right = "right",
    cast = "8"
  },
  currentState = "idle", -- Animation state
  facing = "right"
}

two = classes.Blm:new{
  x = 200,
  y = -10,
  controls = { -- Keyboard/joystick controls
    up = "w",
    down = "s",
    left = "a",
    right = "d",
    cast = " "
  },
  currentState = "idle", -- Animation state
  facing = "left"
}

--fireball = classes.Fire:new{
  --x = 170,
  --y = -4,
  --currentState = "idle",
  --facing = "left"
--}
