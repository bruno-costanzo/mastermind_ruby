# frozen_string_literal: true

require_relative 'display'

# This module is for the computer logics
class Logics
  attr_accessor :code

  def initialize(code = nil)
    @code = code
    @corrects = 0
    @almost = 0
  end

  def evaluate_try(user_code)
    @corrects = check_correct(@code, user_code)
    @almost = check_almost(@code, user_code)
    [@corrects, @almost]
  end

  private

  def check_correct(code, user_code)
    result = 0
    4.times do |idx|
      result += 1 if code[idx] == user_code[idx]
    end
    result
  end

  def check_almost(code, user_code)
    result = 0
    code_a = code.split('')
    user_code_a = user_code.split('')
    user_code_a.each do |digit|
      if code_a.count(digit) != 0
        result += 1
        code_a[code_a.index(digit)] = 'x'
      end
    end
    result - @corrects
  end
end
