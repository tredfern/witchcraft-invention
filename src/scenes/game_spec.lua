-- Copyright (c) 2018 Redfern, Trevor <trevorredfern@gmail.com>
--
-- This software is released under the MIT License.
-- https://opensource.org/licenses/MIT

describe("Game", function()
  local mock_love = require "test_helpers.mock_love"
  local game = require "scenes.game":new()
  local systems = require "systems"

  it("configures systems to be used for rendering", function()
    assert.array_includes(systems.render_map, game.world.systems)
    assert.array_includes(systems.render_symbols, game.world.systems)
    assert.array_includes(systems.render_sprites, game.world.systems)
    assert.array_includes(systems.gui_display, game.world.systems)
  end)

  it("configures systems used for updating", function()
    assert.array_includes(systems.assign_tasks, game.world.systems)
    assert.array_includes(systems.entity_factory, game.world.systems)
    assert.array_includes(systems.entity_tracker, game.world.systems)
    assert.array_includes(systems.gather_resources, game.world.systems)
    assert.array_includes(systems.perform_actions, game.world.systems)
    assert.array_includes(systems.process_user_commands, game.world.systems)
  end)

  it("draws only systems that have the is_draw_system flag set", function()
    systems.render_map.update = spy.new(function() end)
    systems.render_symbols.update = spy.new(function() end)
    systems.assign_tasks.update = spy.new(function() end)
    game:draw()
    assert.spy(systems.render_map.update).was.called()
    assert.spy(systems.render_symbols.update).was.called()
    assert.spy(systems.assign_tasks.update).was.not_called()
  end)

  it("updates only systems that do not have the render_system flag set", function()
    systems.render_map.update = spy.new(function() end)
    systems.render_symbols.update = spy.new(function() end)
    systems.assign_tasks.update = spy.new(function() end)
    game:update()
    assert.spy(systems.render_map.update).was.not_called()
    assert.spy(systems.render_symbols.update).was.not_called()
    assert.spy(systems.assign_tasks.update).was.called()
  end)

  it("quits the game on escape key", function()
    mock_love.mock(love.event, "quit", spy.new(function() end))
    game:keypressed("escape")
    assert.spy(love.event.quit).was.called()
  end)
end)
