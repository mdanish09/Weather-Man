# frozen_string_literal: true

require 'colorize'
require 'date'
require './modules/weather_module'

case ARGV[0]
when '-a'
  year, month = ARGV[1].split('/')
  dir = ARGV[2]
  Weather_module.month_temperature(dir, year, month)
when '-e'
  year = ARGV[1]
  path = ARGV[2]

  max, min, max_humid = Weather_module.year_temperature(path, year)

  max.each do |key, value|
    puts "Highest:#{value}C on #{DateTime.parse(key.to_s).strftime('%B %d')}"
  end
  min.each do |key, value|
    puts "Lowest:#{value}C on #{DateTime.parse(key.to_s).strftime('%B %d')}"
  end
  max_humid.each do |key, value|
    puts "Humid:#{value}% on #{DateTime.parse(key.to_s).strftime('%B %d')}"
  end
when '-c'
  year, month = ARGV[1].split('/')
  dir = ARGV[2]
  min_temp, max_temp = Weather_module.month_temperature_bar(dir, year, month)
  min_temp.each_with_index do |_min, index|
    print "#{index + 1} "
    max_temp[index].times { print '+'.colorize(:red) }
    print "#{max_temp[index]}\n"
    print "#{index + 1} "
    min_temp[index].times { print '+'.colorize(:blue) }
    print "#{min_temp[index]}\n"
  end
when '-r'
  year, month = ARGV[1].split('/')
  dir = ARGV[2]
  min_temperature, max_temperature = Weather_module.month_temperature_bar(dir, year, month)

  min_temperature.each_with_index do |_min, index|
    print "#{index + 1} "
    min_temperature[index].times { print '+'.colorize(:blue) }
    max_temperature[index].times { print '+'.colorize(:red) }
    print "#{min_temperature[index]}C-#{max_temperature[index]}C"
    print "\n"
  end
else
  puts 'Wrong number of arguments'
end
