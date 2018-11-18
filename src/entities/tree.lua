-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local tiny = require "ext.tiny-ecs"
local bag = require "ext.artemis.src.bag"
local terrain = require "terrain"

local tree = {
  is_tree = true,
  symbol = "♠",
  color = {0,0.75, 0, 1},
  disallowed_terrains = bag:new({ terrain:water() }),
  filter = tiny.requireAll("is_tree", "position")
}

function tree:new(x, y)
  local t = {
    position = { x = x, y = y},
  }
  setmetatable(t, self)
  self.__index = self
  return t
end

return tree
