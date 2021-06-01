require 'rails_helper'

RSpec.describe "the Studio show page" do
  it "it displays the studio attributes" do
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

    visit "/studios/#{studio1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
    expect(page).to have_content(movie3.title)
  end

  it "displays a list of actors featured in any of the studio movies" do
    studio1 = Studio.create!(name: "Sonyy Productionz", location: "Los Angeles")
    movie1 = studio1.movies.create!(title: "Funny Movie", creation_year: 2004, genre: "comedy")
    movie2 = studio1.movies.create!(title: "Sad Movie", creation_year: 1998, genre: "drama")
    movie3 = studio1.movies.create!(title: "Slightly Scary Movie", creation_year: 2016, genre: "thriller")
    actor1 = Actor.create!(name: "Andy Sandy", age: 41, working: false)
    actor2 = Actor.create!(name: "Eve Rampell", age: 38, working: false)
    actor3 = Actor.create!(name: "Skilled Actor", age: 51, working: true)
    ma = movie1.actors.push(actor1)
    movie2.actors.push(actor2)
    movie3.actors.push(actor3)

    visit "/studios/#{studio1.id}"

    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)
  end

  it "displays a list of actors featured in any of the studio movies" do
    studio1 = Studio.create!(name: "Sonyy Productionz", location: "Los Angeles")
    movie1 = studio1.movies.create!(title: "Funny Movie", creation_year: 2004, genre: "comedy")
    movie2 = studio1.movies.create!(title: "Sad Movie", creation_year: 1998, genre: "drama")
    movie3 = studio1.movies.create!(title: "Slightly Scary Movie", creation_year: 2016, genre: "thriller")
    actor1 = Actor.create!(name: "Andy Sandy", age: 41, working: false)
    actor2 = Actor.create!(name: "Eve Rampell", age: 38, working: false)
    actor3 = Actor.create!(name: "Skilled Actor", age: 51, working: true)
    ma = movie1.actors.push(actor1)
    movie2.actors.push(actor2)
    movie3.actors.push(actor3)

    visit "/studios/#{studio1.id}"

    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)
  end

  it "has list of actors with no duplicates and ordered from oldest to youngest" do
    studio1 = Studio.create!(name: "Sonyy Productionz", location: "Los Angeles")
    movie1 = studio1.movies.create!(title: "Funny Movie", creation_year: 2004, genre: "comedy")
    movie2 = studio1.movies.create!(title: "Sad Movie", creation_year: 1998, genre: "drama")
    movie3 = studio1.movies.create!(title: "Slightly Scary Movie", creation_year: 2016, genre: "thriller")
    actor1 = Actor.create!(name: "Andy Sandy", age: 41, working: false)
    actor2 = Actor.create!(name: "Eve Rampell", age: 38, working: false)
    actor3 = Actor.create!(name: "Skilled Actor", age: 51, working: true)
    movie1.actors.push(actor1)
    movie2.actors.push(actor2, actor1)
    movie3.actors.push(actor3)

    visit "/studios/#{studio1.id}"
save_and_open_page
    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
    expect(page).to have_content(actor3.name)
  end
end
