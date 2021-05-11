# frozen_string_literal: true

require_relative 'display'
require_relative 'computer'

# In the Creator Mode, you made a code and the computer try to guess it
class CreatorMode
  attr_accessor :code

  include Display

  def initialize
    @computer = Computer.new
    @code = nil
  end

  def play
    set_up_mode
  end

  def set_up_mode
    puts creator_mode_welcome
    code_creator
    puts code_created_msg(@code)
    @computer.start_thinking
  end

  def code_creator
    @code = '0000'
    puts enter_code_msg
    @code = gets.chomp until valid_input_msg && valid_digits(@code) && @code.size == 4
    @computer.code = @code
  end

  def valid_digits(code)
    code.split('').all? do |number|
      number.to_i.positive? && number.to_i < 7
    end
  end

  def valid_input_msg
    puts display_valid_input_msg
    true
  end
end
