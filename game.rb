# frozen_string_literal: true

require_relative 'display'
require_relative 'creator_mode'
require_relative 'guess_mode'

# Class for first level of game
class Game
  attr_accessor :rol

  include Display

  def initialize
    @computer = nil
    @rol = nil
    @mode = nil
  end

  def play
    set_up_game
    play_mode(@rol)
  end

  private

  def set_up_game
    puts display_welcome
    rol_picker
  end

  def rol_picker
    puts rol_picker_msg
    chosing_rol until rol
    puts rol_picked_msg(@rol)
  end

  def chosing_rol
    entry = gets.chomp
    @rol = 'Creator' if entry == '1'
    @rol = 'Guesser' if entry == '2'
  end

  def play_mode(rol)
    @mode = rol == 1 ? CreatorMode.new : GuessMode.new
    @mode.play
  end
end
