# frozen_string_literal: true

require_relative 'display'
require_relative 'logics'

# In the Guess Mode, de player have to guess the code
class GuessMode
  MAX_TRIES = 12

  include Display

  def initialize
    @code = nil
    @player_guess = nil
    @number_of_tries = MAX_TRIES
    @user_code_try = nil
    @logics = nil
  end

  def play
    set_up_guess_mode
    game_play
  end

  private

  def set_up_guess_mode
    puts guess_mode_welcome_msg
    guess_mode_example_game
  end

  def guess_mode_example_game
    numbers_colored('4351')
    clues_print(2, 1)
    puts display_example_explanation
  end

  def game_play
    @code = create_code
    run_guess
  end

  # This method create a code that the player has to guess
  def create_code
    @code = ''
    4.times do
      @code += rand(1..6).to_s
    end
    @logics = Logics.new(@code)
    code_created
    @code
  end

  # The code was created succesfully
  def code_created
    puts code_created_display
    numbers_colored('9999')
  end

  # The player have 12 tries to win
  def run_guess
    try_result = [nil]
    until @number_of_tries.zero? || win?(try_result[0])
      new_try
      try_result = @logics.evaluate_try(@user_code_try)
      numbers_colored(@user_code_try)
      clues_print(try_result[0].to_i, try_result[1].to_i)
      @number_of_tries -= 1
    end
    win_or_lose(@number_of_tries)
  end

  # Check if the player wins
  def win?(corrects)
    corrects == 4
  end

  def win_or_lose(tries)
    puts tries.zero? ? loser_display : congrats_display
  end

  def new_try
    puts new_try_msg(@number_of_tries)
    user_try
  end

  # get the code from the user. It valitades that is 4 digit long and with every number between 1-6
  def user_try
    @user_code_try = '0000'
    @user_code_try = gets.chomp until valid_input_msg && valid_digits(@user_code_try) && @user_code_try.size == 4
  end

  # valid_digits check if the code is maded but all numbers between 1 and 6s
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
