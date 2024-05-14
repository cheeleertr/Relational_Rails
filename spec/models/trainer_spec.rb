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
      @pokemon3 = @trainer1.pokemons.create!(
        name: "Squirtle",
        pokemon_type: "Water",
        level: 36,
        hit_points: 44,
        attack: 48,
        defense: 65,
        speed: 43,
        special: 51,
        in_team: true,
      )
    end

    describe '#pokemon_count' do
      it 'counts trainers pokemon' do
        
        expect(@trainer1.pokemons_count).to eq(3)
      end
    end

    describe '#pokemons_by_name' do
      it 'returns trainers pokemon sorted by name' do
        
        expect(@trainer1.pokemons_by_name).to eq([@pokemon2, @pokemon1, @pokemon3])
      end
    end

    describe '#pokemons_over_level(number)' do
      it 'returns trainers pokemon over a certain level' do
        
        expect(@trainer1.pokemons_over_level(42)).to eq([@pokemon1])
        expect(@trainer1.pokemons_over_level(39)).to eq([@pokemon1, @pokemon2])
      end
    end
  end

  describe 'class methods' do
    describe '::by_created_at' do
      it 'can sort all trainers by create_at' do
        @trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        @trainer2 = Trainer.create!(name: "Misty", badges: 6 , full_team_of_six: false)
        @trainer3 = Trainer.create!(name: "Brock", badges: 5 , full_team_of_six: false)

        expect(Trainer.by_created_at).to eq([@trainer1, @trainer2, @trainer3])
      end
    end
  end
end
