# frozen_string_literal: true

require 'date'
require 'optparse'

option = {}
opt = OptionParser.new
opt.on('-m VAL', Integer) { |month| option[:m] = month }
opt.parse!(ARGV)

today = Date.today
unless option.empty?
  raise "#{option[:m]} is neither a month number (1..12) nor a name" if option[:m] < 1 || option[:m] > 12

  today = Date.new(today.year, option[:m], today.mday)
end

puts "      #{today.mon}月 #{today.year}"
puts '月 火 水 木 金 土 日'

last_day = Date.new(today.year, today.mon, -1)

week = ''
# カレンダー本体
(1..last_day.mday).each do |i|
  day = Date.new(today.year, today.mon, i)
  wd = day.wday - 1
  if wd == -1
    week += if i < 10
              " #{i}"
            else
              i.to_s
            end
    puts week.rjust(20)
    week = ''
  elsif i < 10
    week += " #{i} "
  else
    week += "#{i} "
  end
end
puts week unless week.empty?
