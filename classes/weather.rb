# class to hold weather data  of single day
class Weather
  attr_accessor :max_temp_C
  attr_accessor :mean_temp_C
  attr_accessor :min_temp_C
  attr_accessor :dew_point_C
  attr_accessor :mean_dew_point_C
  attr_accessor :min_dew_point_C
  attr_accessor :mean_humidity
  attr_accessor :min_humidity
  attr_accessor :max_pressure_Pa
  attr_accessor :mean_pressure_Pa
  attr_accessor :min_pressure_Pa
  attr_accessor :max_visibility
  attr_accessor :mean_visibility
  attr_accessor :min_visibility
  attr_accessor :max_wind_speed
  attr_accessor :mean_wind_speed
  attr_accessor :max_gust_speed
  attr_accessor :max_humidity
  attr_accessor :precipitationmm
  attr_accessor :cloud_cover
  attr_accessor :events
  attr_accessor :wind_dir_degrees

  def initialize(
    max_temp_C,
    mean_temp_C,
    min_temp_C,
    dew_point_C,
    mean_dew_point_C,
    min_dew_point_C,
    max_humidity,
    mean_humidity,
    min_humidity,
    max_pressure_Pa,
    mean_pressure_Pa,
    min_pressure_Pa,
    max_visibility,
    mean_visibility,
    min_visibility,
    max_wind_speed,
    mean_wind_speed,
    max_gust_speed,
    precipitationmm,
    cloud_cover,
    events,
    wind_dir_degrees)

      @max_temp_C = max_temp_C
      @mean_temp_C = mean_temp_C
      @min_temp_C = min_temp_C
      @dew_point_C = dew_point_C
      @mean_dew_point_C = mean_dew_point_C
      @min_dew_point_C = min_dew_point_C
      @max_humidity = max_humidity
      @mean_humidity = max_humidity
      @min_humidity = min_humidity
      @max_pressure_Pa = max_pressure_Pa
      @mean_pressure_Pa = mean_pressure_Pa
      @min_pressure_Pa = min_pressure_Pa
      @max_visibility = max_visibility
      @mean_visibility = mean_visibility
      @min_visibility = min_visibility
      @max_wind_speed = max_wind_speed
      @mean_wind_speed = mean_wind_speed
      @max_gust_speed = max_gust_speed
      @precipitationmm = precipitationmm
      @cloud_cover = cloud_cover
      @events = events
      @wind_dir_degrees = wind_dir_degrees
  end
end
