class Api::V1::WeatherController < ApplicationController

  def index
    render json: WeatherSerializer.new(.all)
  end
end
