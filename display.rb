# frozen_string_literal: true

# Module for everything that is showed in the console
module Display
  def code_colors(number)
    {
      '1' => "\e[101m  1  \e[0m ",
      '2' => "\e[43m  2  \e[0m ",
      '3' => "\e[44m  3  \e[0m ",
      '4' => "\e[45m  4  \e[0m ",
      '5' => "\e[46m  5  \e[0m ",
      '6' => "\e[41m  6  \e[0m "
    }[number]
  end

  def clue_colors(clue)
    {
      '*' => "\e[91m\u25CF\e[0m ",
      '?' => "\e[37m\u25CB\e[0m "
    }[clue]
  end

  def display_welcome
    'Welcome to m4st3rm1nd!'
  end

  def rol_picker_msg
    "Plase, select a rol to play: \n1. Creator \n2. Guess"
  end

  def rol_picked_msg(rol)
    "Ok! You've choose #{rol} rol"
  end
end
