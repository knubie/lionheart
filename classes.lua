module(...,package.seeall)
require('actions')

GROUND = 300

Class = {
  new = function(self, o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
  end
}

Mob = Class:new{
  currentState = "idle", -- Current animation state
  frame = 1, -- Current animation frame

  animate = function(self)
    -- Create local reference to the character state
    local state = self.states[self.currentState]

    if self.frame < state.img:getWidth() / state.w then
      self.frame = self.frame + 1
    else
      self.frame = 1
      if state.loop == false then
        if state.dx then
          self.x = self.x + state.dx
        end
        self.currentState = state.next_state
      end
    end
  end,

  draw = function(self)
    -- Create local reference to the character state
    local state = self.states[self.currentState]

    local quad = love.graphics.newQuad(
      -- X, Y
      state.w * (math.floor(self.frame)-1), 0, -- Move to the correct frame on the animation sheet.
      -- W, H
      state.w, state.h,
      -- Image W, H
      state.img:getWidth(), state.img:getHeight()
    )
    -- Determine whether to flip the image or not.
    if self.facing == "left" then
      quad:flip(true, false)
      love.graphics.drawq(state.img, quad, self.x-state.w+state.c.x, GROUND-state.h+self.y)
    else
      love.graphics.drawq(state.img, quad, self.x-state.c.x, GROUND-state.h+self.y)
    end

    if self.projectile then
      self.projectile:draw()
    end
  end,

  movex = function(self, v)
    -- Create local reference to the character state
    local state = self.states[self.currentState]

    if self.x-state.c.x > 0 and self.x-state.c.x+state.w < GROUND then
      if self.x-state.c.x+v > 0 and self.x-state.c.x+state.w+v < GROUND then
        self.x = self.x+v
      end
    end
  end,

  set_state = function(self, state_name)
    if self.currentState ~= state_name then
      self.frame = 1
      self.currentState = state_name
    end
  end,

  update = function(self)
    actions.update(self)
    self:animate()
    if self.projectile then
      self.projectile:animate()
      if self.facing == "right" then
        self.projectile:movex(self.projectile.velocity)
      else
        self.projectile:movex(-self.projectile.velocity)
      end
    end
  end
}

Player = Mob:new{
  walk = function(self, direction)
    if direction == "F" then
      self:set_state("walk_f")
    else
      self:set_state("walk_b")
    end

    if (direction == "F" and self.facing == "right") then
      self:movex(self.attributes.walkf_v)
    elseif (direction == "B" and self.facing == "right") then
      self:movex(self.attributes.walkb_v)
    elseif (direction == "F" and self.facing == "left") then
      self:movex(-self.attributes.walkf_v)
    elseif (direction == "B" and self.facing == "left") then
      self:movex(-self.attributes.walkb_v)
    end
  end,

  crouch = function(self)
    if self.currentState == "crouch_outro" then
      if self.frame == 2 then
        self:set_state("crouch_intro")
        self.frame = 2
      elseif frame == 1 then
        self:set_state("crouch_loop")
      else
        self:set_state("crouch_intro")
      end
    else
      self:set_state("crouch_intro")
    end
  end,

  stand = function(self)
    if self.currentState == "crouch_intro" then
      if self.frame == 2 then
        self:set_state("crouch_outro")
        self.frame = 2
      elseif frame == 1 then
        self:set_state("idle")
      else
        self:set_state("crouch_outro")
      end
    else
      self:set_state("crouch_outro")
    end
  end,

  jump = function(self, direction)
    if direction == "N" then
      self:set_state("jump_neutral")
      if self.frame > self.states[self.currentState].till_action then
        self.frame = 1
      end
    elseif direction == "F" then
      self:set_state("jump_forward")
    elseif direction == "B" then
      self:set_state("jump_backward")
    end
  end
}

Projectile = Mob:new()

Fire = Projectile:new{
  velocity = 6,
  states = {
    idle = {
      img = love.graphics.newImage("assets/fire2.png"),
      c = {x=11,y=6},
      w = 14,
      h = 10,
      loop = true
    }
  }
}

Ninja = Player:new{
  attributes = {
    walkf_v = 4,
    walkb_v = -3,
  },
  states = {
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
      c = {x=67,y=101},
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
      c = {x=67,y=101},
      w = 110,
      h = 101,
      loop = false,
      next_state = 'idle'
    },
    jump_neutral = {
      img = love.graphics.newImage("assets/ibuki-jump.png"),
      c = {x=63,y=101},
      w = 111,
      h = 258,
      loop = false,
      next_state = 'idle',
      till_action = 22
    },
    jump_forward = {
      img = love.graphics.newImage("assets/ibuki-jump-forward.png"),
      c = {x=57,y=101},
      w = 275,
      h = 216,
      dx = 170,
      loop = false,
      next_state = 'idle'
    },
    jump_backward = {
      img = love.graphics.newImage("assets/ibuki-jump-backward.png"),
      c = {x=205,y=101},
      w = 244,
      h = 220,
      dx = -162,
      loop = false,
      next_state = 'idle'
    }
  }
}

Monk = Player:new{
  attributes = {
    walkf_v = 4,
    walkb_v = -3,
  },
  states = {
    idle = {
      img = love.graphics.newImage("assets/ryu-idle.png"),
      c = {x=39,y=111},
      w = 78,
      h = 111,
      loop = true
    },
    walk_f = {
      img = love.graphics.newImage("assets/ryu-walk-f.png"),
      c = {x=54,y=111},
      w = 112,
      h = 113,
      loop = true
    }
  }
}

Blm = Player:new{
  attributes = {
    walkf_v = 1,
    walkb_v = -1
  },
  states = {
    idle = {
      img = love.graphics.newImage("assets/blm_idle2.png"),
      c = {x=12,y=29},
      w = 23,
      h = 29,
      loop = true
    },
    walk_b = {
      img = love.graphics.newImage("assets/blm_walkf.png"),
      c = {x=12,y=29},
      w = 23,
      h = 29,
      loop = true
    },
    walk_f = {
      img = love.graphics.newImage("assets/blm_walkf.png"),
      c = {x=12,y=29},
      w = 23,
      h = 29,
      loop = true
    },
    cast = {
      img = love.graphics.newImage("assets/blm_cast.png"),
      c = {x=12,y=29},
      w = 28,
      h = 29,
      loop = false,
      next_state = 'idle'
    }
  },
  cast = function (self)
    self:set_state("cast")
    self.projectile = classes.Fire:new{
      x = self.x - 10,
      y = -6,
      currentState = "idle",
      facing = self.facing
    }
  end
}

