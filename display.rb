# frozen_string_literal: true

# Module for everything that is showed in the console
module Display

  # The codes for the colors. This was copied from other project.
  def code_colors(number)
    {
      '1' => "\e[101m  1  \e[0m ",
      '2' => "\e[43m  2  \e[0m ",
      '3' => "\e[44m  3  \e[0m ",
      '4' => "\e[45m  4  \e[0m ",
      '5' => "\e[46m  5  \e[0m ",
      '6' => "\e[41m  6  \e[0m ",
      '9' => "\e[40m  ?  \e[0m "
    }[number]
  end

  # The codes for the clues. This was copied from other project.
  def clue_colors(clue)
    {
      '*' => "\e[91m\u25CF\e[0m ",
      '?' => "\e[37m\u25CB\e[0m "
    }[clue]
  end

  # Returns "Welcome to m4st3rm1nd"
  def display_welcome
    'Welcome to m4st3rm1nd!'
  end

  # Msg asking the player which rol does he want
  def rol_picker_msg
    "Plase, select a rol to play: \n1. Creator \n2. Guess"
  end

  # A msg that tells the player which rol has been choosed.
  def rol_picked_msg(rol)
    "Ok! You've choose #{rol} rol of m4st3rm1nd. \n"
  end

  # Just a msg for the player who pick guess mode
  def guess_mode_welcome_msg
    "Computer will to create a random 4 colors code (each color is number) and you'll have 12 tries to guess it.\n \n"
  end

  # The numbers_colored method take the numbers and show them up in the console.
  def numbers_colored(numbers)
    numbers.split('').each do |number|
      print code_colors(number.to_s)
    end
  end

  # This method shows the clues to console. It receives the correct answers and the ones that appear but not in position
  def clues_print(correct, almost)
    print '   ' # This is just to be more elegant in the way you show up the clues.
    correct.times do
      print clue_colors('*')
    end
    almost.times do
      print clue_colors('?')
    end
    print "\n"
  end

  def display_example_explanation
    "\nIn this case, you have: \n 2 guesses in the right place \n 1 guess correct but in the wrong place \n\n"
  end

  def code_created_display
    "Computer has created a code. Can you guess it? Pick numbers from 1 to 6\n"
  end

  def new_try_msg(number_of_tries)
    "Try to guess the code. You have #{number_of_tries} left"
  end

  # A msg for the usser to remember how to enter the try
  def display_valid_input_msg
    'Rembember: Your code must to be four digits long, with every digit between 1-6 (both included)'
  end

  def congrats_display
    'Congrats! You broke the code!'
  end

  def loser_display(code)
    "You lose! The code was #{code}"
  end

  def play_again_msg
    puts "Ready to play? 'q' to quit. Any other key to continue"
  end
end
