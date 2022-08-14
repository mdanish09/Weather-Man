require 'date'
require './classes/weather.rb'

class Weather_module
  # MAp fro numbers to track month names 
  @months=Hash.new("months")
  @months={
    "1" => "Jan",
    "2" => "Feb",
    "3" => "Mar",
    "4" => "Apr",
    "5" => "May",
    "6" => "Jun",
    "7" => "Jul",
    "8" => "Aug",
    "9" => "Sep",
    "10" => "Oct",
    "11" => "Nov",
    "12" => "Dec"
  }

  def self.year_temperature(path,year)
    max_temperature=Hash.new
    min_temperature=Hash.new
    max_humidity=Hash.new
    weatherData=Hash.new
    max_temp=0
    min_temp=1000
    max_humid=0
    max_temp_date=""
    min_temp_date=""
    max_humid_date=""
    @months.each do |key,value|
      _FILE="/home/dev/Documents/weatherman/#{path}/#{path}_#{year}_#{@months[key]}.txt"
      if File.file?(_FILE)
        File.readlines(_FILE)[1..-1].each do |line|
          obj_data=line.split(",")
          key,*data=obj_data
          weatherData[key]=Weather.new(*data)
        end
      end
    end

    weatherData.each do |name, value|
      if value.max_temp_C.to_i>max_temp && value.max_temp_C != ""
        max_temp=value.max_temp_C.to_i
         max_temp_date=name
      end
      if value.min_temp_C.to_i<min_temp && value.min_temp_C != ""
        min_temp=value.min_temp_C.to_i
        min_temp_date=name
      end
      if value.mean_humidity.to_i>max_humid
        max_humid=value.mean_humidity.to_i
        max_humid_date=name
      end
    end
    max_temperature[max_temp_date]=max_temp
    min_temperature[min_temp_date]=min_temp
    max_humidity[max_humid_date]=max_humid

    weatherData.clear()
    return max_temperature,min_temperature,max_humidity
  end

  # method to calculate minimum and maximum temperature for a given month
  def self.month_temperature(dir,year,month)
    _FILE="/home/dev/Documents/weatherman/#{dir}/#{dir}_#{year}_#{@months[month]}.txt"

    weatherData=Hash.new
    max_temp=0
    min_temp=1000
    max_humid=0

    File.readlines(_FILE)[1..-1].each do |line|
      obj_data=line.split(",")
      key,*data=obj_data
      weatherData[key]=Weather.new(*data)
    end

      weatherData.each do |name, value|
        if value.mean_temp_C.to_i>max_temp && value.mean_temp_C != ""
          max_temp=value.mean_temp_C.to_i
        end
        if value.mean_temp_C.to_i<min_temp && value.mean_temp_C != ""
          min_temp=value.mean_temp_C.to_i
        end
        if value.mean_humidity.to_i>max_humid
          max_humid=value.mean_humidity.to_i
        end
      end
      puts "Highest Average: #{max_temp}C"
      puts "Lowest Average: #{min_temp}C"
      puts "Average Humididty: #{max_humid}C"
  end

  # method to calculate minimum and maximum temperature for a given month and display in bars
  def self.month_temperature_bar(dir,year,month)

    weatherData=Hash.new
    _FILE="/home/dev/Documents/weatherman/#{dir}/#{dir}_#{year}_#{@months[month]}.txt"

    File.readlines(_FILE)[1..-1].each do |line|
      obj_data=line.split(",")
      key,*data=obj_data
      weatherData[key]=Weather.new(*data)
    end

    min_temerature=Array.new
    max_temerature=Array.new

    weatherData.each do |name, value|
      if value.min_temp_C != "" && value.min_temp_C != ""
        min_temerature.push(value.min_temp_C.to_i)
        max_temerature.push(value.max_temp_C.to_i)
      end
    end
    puts "#{@months[month]} #{year}"
    return min_temerature,max_temerature
  end
end
