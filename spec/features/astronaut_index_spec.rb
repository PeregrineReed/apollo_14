require 'rails_helper'

RSpec.describe "as a visitor when I visit the /astronauts" do

  before :each do
    @astro_1 = Astronaut.create(name: "Dave", age: 35, job: "friend")
    @astro_2 = Astronaut.create(name: "Hal", age: 40, job: "friend")
    @astro_3 = Astronaut.create(name: "Sam", age: 45, job: "friend")
    @astros = [@astro_1, @astro_2, @astro_3]

    @astro_1.missions.create(title: "Apollo 13", time_in_space: 400)
    @astro_1.missions.create(title: "Capricorn 4", time_in_space: 600)
    @astro_1.missions.create(title: "Gemini 7", time_in_space: 500)
    @astro_2.missions.create(title: "Apollo 13", time_in_space: 400)
    @astro_2.missions.create(title: "Capricorn 4", time_in_space: 600)
    @astro_3.missions.create(title: "Gemini 7", time_in_space: 500)
  end

  it "sees a list of astronauts with name age and job" do

    visit astronauts_path

    @astros.each do |astro|
      within "#astro-#{astro.id}" do
        expect(page).to have_content(astro.name)
        expect(page).to have_content("Age: #{astro.age}")
        expect(page).to have_content(astro.job)
      end
    end
  end

  it "sees an average age of all astronauts" do

    visit astronauts_path

    expect(page).to have_content("Average Age: 40")
  end

  it 'sees missions in alphabetic order' do

    visit astronauts_path

    expect(page).to have_content("Apollo 13")
    expect(page).to have_content("Capricorn 4")
    expect(page).to have_content("Gemini 7")

  end

  it 'sees total time in space for each astronaut' do

    visit astronauts_path

    @astros.each do |astro|
      within "#astro-#{astro.id}" do
        expect(page).to have_content("Total Time in Space: #{astro.total_space}")
      end
    end
  end

end
