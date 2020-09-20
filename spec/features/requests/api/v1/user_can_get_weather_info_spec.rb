require 'rails_helper'

RSpec.describe "As an API User", type: "request" do
  it "I can get weather info" do

    get "/api/v1/weather"

    expect(response).to have_http_status(200)

    weather_data = JSON.parse(response.body, symbolize_names: true)

    expect(weather_data[:data][:attributes]).to_not be_empty
  end
end
