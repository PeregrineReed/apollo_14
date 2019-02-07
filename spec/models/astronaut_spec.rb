require 'rails_helper'

describe Astronaut, type: :model do

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

  describe 'Instance Methods' do

    it '.total_space' do

      expected = 1500
      actual = @astro_1.total_space

      expect(actual).to eq(expected)

    end

  end

  describe 'Class Methods' do

    it '.avg_age' do

      expected = 40
      actual = Astronaut.avg_age

      expect(actual).to eq(expected)

    end

  end
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end
end
