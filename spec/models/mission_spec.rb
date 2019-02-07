require 'rails_helper'

describe Mission, type: :model do

  before :each do
    @astro_1 = Astronaut.create(name: "Dave", age: 35, job: "friend")
    @astro_2 = Astronaut.create(name: "Hal", age: 40, job: "friend")
    @astro_3 = Astronaut.create(name: "Sam", age: 45, job: "friend")
    @astros = [@astro_1, @astro_2, @astro_3]

    @astro_1.missions.create(title: "Gemini 7", time_in_space: 500)
    @astro_1.missions.create(title: "Apollo 13", time_in_space: 400)
    @astro_1.missions.create(title: "Capricorn 4", time_in_space: 600)
    @astro_2.missions.create(title: "Apollo 13", time_in_space: 400)
    @astro_2.missions.create(title: "Capricorn 4", time_in_space: 600)
    @astro_3.missions.create(title: "Gemini 7", time_in_space: 500)
  end

  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'Class Methods' do

    it '.ordered_missions' do

      expected = ["Apollo 13", "Capricorn 4", "Gemini 7"]
      actual = Mission.ordered_missions

      expect(actual).to eq(expected)

    end
  end
end
