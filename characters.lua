module(...,package.seeall)
require('classes')

GROUND = 650

player1 = classes.Ninja:new{
	x = 100,
	y = 0,
	controls = { -- Keyboard/joystick controls
		up = "up",
		down = "down",
		left = "left",
		right = "right"
	},
	currentState = "idle", -- Animation state
	facing = "right"
}