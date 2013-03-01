module(...,package.seeall)
require('classes')

one = classes.Ninja:new{
  x = 100,
  y = 0,
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
  x = 400,
  y = 0,
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
