module(..., package.seeall)

function set (char)
	return love.keyboard.isDown(char.controls.left)
					and not love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.down),

					love.keyboard.isDown(char.controls.left)
					and love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.down),

					love.keyboard.isDown(char.controls.left)
					and love.keyboard.isDown(char.controls.down)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.up),

					love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.left)
					and not love.keyboard.isDown(char.controls.down),

					love.keyboard.isDown(char.controls.right)
					and love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.left)
					and not love.keyboard.isDown(char.controls.down),

					love.keyboard.isDown(char.controls.right)
					and love.keyboard.isDown(char.controls.down)
					and not love.keyboard.isDown(char.controls.left)
					and not love.keyboard.isDown(char.controls.up),

					love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.down)
					and not love.keyboard.isDown(char.controls.left),

					love.keyboard.isDown(char.controls.down)
					and not love.keyboard.isDown(char.controls.right)
					and not love.keyboard.isDown(char.controls.up)
					and not love.keyboard.isDown(char.controls.left)
end