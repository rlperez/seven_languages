class PrintByFour
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def print_with_each
    accum = []
    i = 0
    @array.each { |a|
      accum << a
      i += 1
      if (i % 4) == 0
        puts accum.join(',')
        accum.clear
      end
    }
  end

  def print_with_slice
    @array.each_slice(4) { |s| puts s.join(',') }
  end
end

array = (1..16).to_a
printer = PrintByFour.new(array)

puts '====== Print By Each  ======'
printer.print_with_each

puts '====== Print By Slice ======'
printer.print_with_slice