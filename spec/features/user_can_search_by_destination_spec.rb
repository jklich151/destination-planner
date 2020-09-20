require 'rails_helper'

RSpec.describe "As a User" do
  it "I can search by destination" do
    destination = Destination.create({name: "Erwin",
                        zip: "37650",
                        description: "Small Town",
                        image_url: "http://placekitten.com/200/300"})
    visit "/"

    click_link 'Show'

    expect(current_path).to eq(destination_path(destination.id))

    expect(page).to have_content(destination.name)
    expect(page).to have_content(destination.zip)
    expect(page).to have_content(destination.description)

    within ".current_weather" do
      expect(page).to have_css('#date')
      expect(page).to have_css('#temp-high')
      expect(page).to have_css('#temp-low')
      expect(page).to have_css('#summary')
    end
  end

  it "I can see an image based on the current weather" do
    destination = Destination.create({name: "Erwin",
                        zip: "37650",
                        description: "Small Town",
                        image_url: "http://placekitten.com/200/300"})

    visit "/destinations/#{destination.id}"

    expect(current_path).to eq(destination_path(destination.id))

    expect(page).to have_css('#image')
  end
end
