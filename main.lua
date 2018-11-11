-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

local searchpath = love.filesystem.getRequirePath()
searchpath = searchpath .. ";src/?.lua;src/?/init.lua;"
love.filesystem.setRequirePath(searchpath)

local statemachine = require("statemachine")
local scenes = statemachine:new({"update", "draw", "keypressed"})

function love.load()
  local TextTiles = require "text_tiles"
  TextTiles:new("FreeMono.ttf", 24):make_default()
  scenes.title = require("scenes.title")
  scenes.game = require("scenes.game")
  scenes:change(scenes.game)
end

function love.draw()
  scenes:draw()
end

function love.update()
  scenes:update()
end

function love.keypressed(key, scancode)
  scenes:keypressed(key, scancode)

  if key == "escape" then
    love.event.quit()
  end
end

