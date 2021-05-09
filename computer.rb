# frozen_string_literal: true

require_relative 'display'
require_relative 'logics'

# The computer try to guess the answer
class Computer

  include display

  def initialize
    @old_tries = nil
    @current_try = nil
    @logics = new.Logics
    @try_data = {
      corrects: 0,
      almost: 0,
      tried_before: 0
    }
  end

  def start_thinking
    create_guess
  end

  def create_guess
  end

end
