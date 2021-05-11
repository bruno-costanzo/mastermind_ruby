# frozen_string_literal: true

require_relative 'display'
require_relative 'logics'

# The computer try to guess the answer
class Computer
  attr_accessor :code

  include Display

  def initialize
    @code = nil
    @try = nil
    @flags = nil
    @logics = Logics.new
    @somewhere = []
    @tries = 12
  end

  def start_thinking
    @logics.code = @code
    puts breaker ? "The computer broke your code #{@code}" : "The computer has lose! The code was #{@code}"
  end

  def breaker
    @try = '1111'
    @flags = @logics.evaluate_try(@try)
    until broke?(@code, @try) || @tries.zero?
      sleep(1)
      try_thinker(@flags, @logics.evaluate_try(@try))
      @tries -= 1
    end
    @tries.positive?
  end

  def try_thinker(old_flags, new_flags)
    numbers_colored(@try)
    clues_print(new_flags[0].to_i, new_flags[1].to_i)
    @try = think_harder(old_flags, new_flags)
  end

  def think_harder(old_flags, new_flags)
    if new_flags.sum.zero?
      @try = (@try.to_i + 1111).to_s
    elsif new_flags.sum == 4
      @try = arrange_elements(@try)
    elsif old_flags.sum == new_flags.sum
      @try = (@try.to_i + 1).to_s
    elsif old_flags.sum < new_flags.sum
      (new_flags.sum - old_flags.sum).times do
        @somewhere << @try[3]
      end
      @try = function_super(@try, @somewhere)
    end
    @flags = new_flags
    @try
  end

  def function_super(try, somewhere)
    somewhere.join + try[somewhere.join.length..2] + try.split('')[3]
  end

  def arrange_elements(try)
    posibilities = try.split('').permutation(4).to_a.uniq
    posibilities.sample.join
  end

  def broke?(code, try)
    code == try
  end
end
