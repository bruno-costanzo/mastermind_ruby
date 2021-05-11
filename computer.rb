# frozen_string_literal: true

require_relative 'logics'
require_relative 'display'

# The computer brokes the code less than five attemps.
class Computer
  attr_accessor :code

  include Display

  def initialize
    @pos_res = ((1..6).to_a * 4).permutation(4).to_a.uniq.map! { |el| el.join.to_i }
    @code = nil
    @try = 1122
    @flags = nil
    @tries = 12
    @logics = Logics.new
  end

  def start_thinking
    @logics.code = @code.to_s
    puts breaker ? well_broke : "The computer has lose! The code was #{@code}"
  end

  def well_broke
    print_try(@try, [4, 0])
    "The computer has won. Your code was: #{@code.to_s}"
  end

  def print_try(try, flags)
    numbers_colored(try.to_s)
    clues_print(flags[0], flags[1])
  end

  def broke?(code, try)
    code == try
  end

  def filtering_by_flags(flags)
    @pos_res = @pos_res.select do |possible_result|
      @logics.evaluate_try(possible_result.to_s, @try.to_s) == flags
    end
    @try = @pos_res.sample
  end

  def breaker
    until broke?(@code, @try) || @tries.zero?
      @flags = @logics.evaluate_try(@try.to_s)
      print_try(@try, @flags)
      sleep(1)
      filtering_by_flags(@flags)
      @tries -= 1
    end
    @tries.positive?
  end
end
