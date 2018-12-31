-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local Sprites = require "graphics.sprites"
local components = require "components"
local wood_pile = {
  storable = true
}

function wood_pile:new(x, y)
  local wp = {
    position = components.position:new(x, y),
    sprite = Sprites.wood_pile(),
    wood = 100
  }
  setmetatable(wp, self)
  self.__index = self
  return wp
end

return wood_pile
