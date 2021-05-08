# frozen_string_literal: true

require_relative 'game'
require_relative 'display'
require_relative 'computer'
require_relative 'guess_mode'
require_relative 'creator_mode'
require_relative 'logics'

new_game = Game.new
new_game.play
