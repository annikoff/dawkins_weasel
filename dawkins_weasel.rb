#!/usr/bin/env ruby

class DawkinsWeasel
  attr_accessor :target

  def initialize(target)
    @target = target.upcase
  end

  def run
    generations = []
    buffer = generate
    begin
      generation = generate
      @target.chars.each_with_index do |char, index|
        buffer[index] = char if char == generation[index]
      end
      generations << buffer.dup
    end while @target != buffer
    generations
  end

  private

  def generate
    @target.size.times.map { |i| random_char }.join
  end

  def random_char
    (('A'..'Z').to_a+[' '])[rand(27)]
  end
end
