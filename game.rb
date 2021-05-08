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
    while keep_playing?
      set_up_game
      play_mode(@rol)
    end
  end

  private

  def keep_playing?
    puts play_again_msg
    response = gets.chomp
    response = 'y' if response == ''
    puts 'See you later!' if 'qQ'.include?(response)
    true unless 'qQ'.include?(response)
  end

  def set_up_game
    puts display_welcome
    rol_picker
  end

  def rol_picker
    @rol = nil
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
    @mode = rol == 'Creator' ? CreatorMode.new : GuessMode.new
    @mode.play
  end
end
