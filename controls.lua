module(..., package.seeall)

function set (char)

	-- LEFT
	return love.keyboard.isDown(char.controls.left)
					and not love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.down),

	-- LEFT-UP
					love.keyboard.isDown(char.controls.left)
					and love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.down),

	-- LEFT-DOWN
					love.keyboard.isDown(char.controls.left)
					and love.keyboard.isDown(char.controls.down)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.up),

	-- RIGHT
					love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.left)
					and not love.keyboard.isDown(char.controls.down),

	-- RIGHT-UP
					love.keyboard.isDown(char.controls.right)
					and love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.left)
					and not love.keyboard.isDown(char.controls.down),

	-- RIGHT-DOWN
					love.keyboard.isDown(char.controls.right)
					and love.keyboard.isDown(char.controls.down)
					and not love.keyboard.isDown(char.controls.left)
					and not love.keyboard.isDown(char.controls.up),

	-- UP
					love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.down)
					and not love.keyboard.isDown(char.controls.left),

	-- DOWN
					love.keyboard.isDown(char.controls.down)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.left)
end