# frozen_string_literal: true

require 'date'
require 'optparse'

option = {}
opt = OptionParser.new
opt.on('-m VAL', Integer) { |month| option[:m] = month }
opt.parse!(ARGV)

a = Date.today
unless option.empty?
  if option[:m] < 1 || option[:m] > 12
    puts "#{option[:m]} is neither a month number (1..12) nor a name"
    exit
  end
  a = Date.new(a.year, option[:m], a.mday)
end

puts "      #{a.mon}月 #{a.year}"
puts '月 火 水 木 金 土 日'
first_day = Date.new(a.year, a.mon, 1)
last_day = Date.new(a.year, a.mon, -1)

# 初週の空白調整
if first_day.wday - 1 == -1
  print ' ' * 18
else
  print ' ' * (first_day.wday - 1) * 3
end

# カレンダー本体
(1..last_day.mday).each do |i|
  day = Date.new(a.year, a.mon, i)
  x = day.wday - 1
  if x == -1
    if i < 10
      puts " #{i}"
    else
      puts i
    end
  elsif i < 10
    print " #{i} "
  else
    print "#{i} "
  end
end
puts
