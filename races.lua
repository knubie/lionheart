module(..., package.seeall)
require('hitboxes')
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
			loop = true
		},
		walk_f = {
			img = love.graphics.newImage("assets/ibuki-walkf.png"),
			c = {x=50,y=101},
			w = 96,
			h = 101,
			loop = true
		},
		walk_b = {
			img = love.graphics.newImage("assets/ibuki-walkb.png"),
			c = {x=50,y=101},
			w = 96,
			h = 101,
			loop = true
		},
		crouch_intro = {
			img = love.graphics.newImage("assets/ibuki-crouch-intro.png"),
			c = {x=69,y=101},
			w = 110,
			h = 101,
			loop = false,
			next_state = 'crouch_loop'
		},
		crouch_loop = {
			img = love.graphics.newImage("assets/ibuki-crouch-loop.png"),
			c = {x=43,y=65},
			w = 84,
			h = 65,
			loop = true
		},
		crouch_outro = {
			img = love.graphics.newImage("assets/ibuki-crouch-outro.png"),
			c = {x=69,y=101},
			w = 110,
			h = 101,
			loop = false,
			next_state = 'idle'
		},
		crouch_loop = {
			img = love.graphics.newImage("assets/ibuki-crouch-loop.png"),
			c = {x=43,y=65},
			w = 84,
			h = 65,
			loop = true
		}
	}

}

human.ibuki.walk_f.hb = {
	hitboxes.draw(human.ibuki.walk_f, love.image.newImageData("assets/ibuki-walkf-bb1.png")),
	hitboxes.draw(human.ibuki.walk_f, love.image.newImageData("assets/ibuki-walkf-bb2.png")),
	hitboxes.draw(human.ibuki.walk_f, love.image.newImageData("assets/ibuki-walkf-bb3.png"))
}