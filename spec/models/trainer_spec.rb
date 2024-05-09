require "rails_helper"

describe Trainer, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :pokemons}
  end

  describe "instance methods" do
    before :each do
      @trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        @pokemon1 = @trainer1.pokemons.create!(
          name: "Pikachu",
          pokemon_type: "Electric",
          level: 50,
          hit_points: 35,
          attack: 55,
          defense: 30,
          speed: 90,
          special: 50,
          in_team: true,
        )
        @pokemon2 = @trainer1.pokemons.create!(
          name: "Charizard",
          pokemon_type: "Fire/Flying",
          level: 40,
          hit_points: 78,
          attack: 84,
          defense: 78,
          speed: 100,
          special: 85,
          in_team: false,
        )
    end
    describe '#pokemon_count' do
      it 'counts trainers pokemon' do

      expect(@trainer1.pokemons_count).to eq(2)
      end
    end
  end

  
end
