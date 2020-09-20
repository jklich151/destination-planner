class WeatherService

  def conn
    Faraday.new('https://api.openweathermap.org')
  end

  def current_weather(zip)
    response = conn.get('/data/2.5/weather') do |f|
      f.params['zip'] = zip
      f.params['appid'] = ENV["WEATHER_KEY"]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
