require "rails_helper"

describe Pokemon, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it {should belong_to :trainer}
  end

  # describe "instance methods" do
    
  # end
  # describe '#sort_by_created_at' do
  #   it 'sorts trainers by created at' do
  #     @trainer1 = Trainer.create!(name: "Ash", badges: 8, full_team_of_six: true)
  #     @trainer2 = Trainer.create!(name: "Misy", badges: 6, full_team_of_six: false)
  #     @trainer3 = Trainer.create!(name: "Brock", badges: 5, full_team_of_six: false)
  #     # pry
  #     # time stamps are different in pry
  #     expect(Trainer.pokemons_count).to eq([@trainer1, @trainer2, @trainer3])
  #     expect(Trainer.sort_by_created_at).to eq([@trainer1, @trainer2, @trainer3])
  #   end
  # end
  describe 'class methods' do
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

    # describe '::sort_by' do
    #   it 'can sort all pokemons by an attribute' do

    #     expect(Pokemon.sort_by("name")).to eq([@pokemon2, @pokemon1, @pokemon3])
    #   end
    # end

    describe '#in_team_true' do
      it 'returns pokemon with in_team attribute = true' do

        expect(Pokemon.in_team_true).to eq([@pokemon1, @pokemon3])
      end
    end
  end
end