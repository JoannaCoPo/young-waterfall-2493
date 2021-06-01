require 'rails_helper'

RSpec.describe "the Studio show page" do
  it "it displays the studio attributes and location" do
    studio1 = Studio.create!(name: "Sonyy Productionz", location: "Los Angeles")

    visit "/studios/#{studio1.id}"

    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio1.location)
  end

  it "displays the titles of all of its movies" do
    studio1 = Studio.create!(name: "Sonyy Productionz", location: "Los Angeles")
    movie1 = studio1.movies.create!(title: "Funny Movie", creation_year: 2004, genre: "comedy")
    movie2 = studio1.movies.create!(title: "Sad Movie", creation_year: 1998, genre: "drama")
    movie3 = studio1.movies.create!(title: "Slightly Scary Movie", creation_year: 2016, genre: "thriller")
    # studio1.movies.push(movie1, movie2, movie3)

    visit "/studios/#{studio1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
    expect(page).to have_content(movie3.title)
  end
end
