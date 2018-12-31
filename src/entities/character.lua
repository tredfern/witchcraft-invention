-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local tiny = require "ext.tiny-ecs"
local components = require "components"
local CharacterSheet = require "assets.images.character_sheet"

local character = {
  is_character = true,
  is_worker = true,
  filter = tiny.requireAll("is_character")
}

function character:new(x, y)
  local c = {
    inventory = components.inventory:new(),
    position = components.position:new(x, y),
    speed = 0.2,
    sprite = CharacterSheet.sprites.character()
  }
  setmetatable(c, self)
  self.__index = self
  return c
end

return character
