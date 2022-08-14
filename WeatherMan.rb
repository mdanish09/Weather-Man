
require 'colorize'
require 'date'
require './modules/weather_module.rb'


#if the first Command line argument is "-a" this will execute
if ARGV[0] == "-a"
  year,month=ARGV[1].split('/')
  dir = ARGV[2]
  Weather_module.month_temperature(dir,year,month)
end

# if the first command line argument is "-e" this will execute
if ARGV[0] == "-e"
  year=ARGV[1]
  path=ARGV[2]

  max,min,max_humid=Weather_module.year_temperature(path,year)

  max.each do |key,value|
    puts "Highest:#{value}C on #{DateTime.parse(key.to_s).strftime('%B %d')}"
  end
  min.each do |key,value|
    puts "Lowest:#{value}C on #{DateTime.parse(key.to_s).strftime('%B %d')}"
  end
  max_humid.each do |key,value|
    puts "Humid:#{value}% on #{DateTime.parse(key.to_s).strftime('%B %d')}"
  end

end

# if the first command line argument is "-e" this will execute
if ARGV[0] == "-c"
  year,month=ARGV[1].split('/')
  dir = ARGV[2]
  min_temp,max_temp= Weather_module.month_temperature_bar(dir,year,month)
    min_temp.each_with_index do |min,index|
      print "#{index+1} "
      max_temp[index].times{print "+".colorize(:red)}
      print "#{max_temp[index]}\n"
      print "#{index+1} "
      min_temp[index].times{print "+".colorize(:blue)}
      print "#{min_temp[index]}\n"
    end
end
# if the first command line argument is "-r" this will execute

if ARGV[0] == "-r"
  year,month=ARGV[1].split('/')
  dir = ARGV[2]
  min_temperature,max_temperature=Weather_module.month_temperature_bar(dir,year,month)

  min_temperature.each_with_index do |min,index|
    print "#{index+1} "
    min_temperature[index].times{print "+".colorize(:blue)}
    max_temperature[index].times{print "+".colorize(:red)}
    print "#{min_temperature[index]}C-#{max_temperature[index]}C"
    print "\n"
  end
end

