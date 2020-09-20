class WeatherSearch

  def initialize(zip)
    @zip = zip
  end

  def get_weather
    info = WeatherService.new.current_weather(@zip)
    Weather.new(info)
  end

  def get_image(current_weather)
    info = ImageService.new.current_image(current_weather)
    Image.new(info)
  end
end
