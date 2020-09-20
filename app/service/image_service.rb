class ImageService

  def conn
    Faraday.new('https://api.giphy.com')
  end

  def current_image(current_weather)
    response = conn.get('/v1/gifs/search') do |f|
      f.params['q'] = current_weather
      f.params['api_key'] = ENV["IMAGE_KEY"]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
