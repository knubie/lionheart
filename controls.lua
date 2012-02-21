module(..., package.seeall)

function set (char)
	return love.keyboard.isDown(char.left)
					and not love.keyboard.isDown(char.up)
					and not love.keyboard.isDown(char.right)
					and not love.keyboard.isDown(char.down),

					love.keyboard.isDown(char.left)
					and love.keyboard.isDown(char.up)
					and not love.keyboard.isDown(char.right)
					and not love.keyboard.isDown(char.down),

					love.keyboard.isDown(char.left)
					and love.keyboard.isDown(char.down)
					and not love.keyboard.isDown(char.right)
					and not love.keyboard.isDown(char.up),

					love.keyboard.isDown(char.right)
					and not love.keyboard.isDown(char.up)
					and not love.keyboard.isDown(char.left)
					and not love.keyboard.isDown(char.down),

					love.keyboard.isDown(char.right)
					and love.keyboard.isDown(char.up)
					and not love.keyboard.isDown(char.left)
					and not love.keyboard.isDown(char.down),

					love.keyboard.isDown(char.right)
					and love.keyboard.isDown(char.down)
					and not love.keyboard.isDown(char.left)
					and not love.keyboard.isDown(char.up),

					love.keyboard.isDown(char.up)
					and not love.keyboard.isDown(char.right)
					and not love.keyboard.isDown(char.down)
					and not love.keyboard.isDown(char.left),

					love.keyboard.isDown(char.down)
					and not love.keyboard.isDown(char.right)
					and not love.keyboard.isDown(char.up)
					and not love.keyboard.isDown(char.left)
end