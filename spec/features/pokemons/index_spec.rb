require 'rails_helper'

describe "Pokemon Index Page" do
  # User Story 3, Child Index 
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  context "As a visitor" do
    describe "When I visit Pokemon Index Page" do
      it "Then I see each Pokemon in the system including the Pokemon's attributes" do
        pokemon1 = Pokemon.create!(
          name: "Pikachu",
          pokemon_type: "Electric",
          level: 50,
          hit_points: 35,
          attack: 55,
          defense: 30,
          speed: 90,
          special: 50,
          trainer_id: 1,
          in_team: true,
        )
        visit "/pokemons"
        
        expect(page).to have_content("Name: Pikachu")
        expect(page).to have_content("Type: Electric")
        expect(page).to have_content("Level: 50")
        expect(page).to have_content("Hit Points: 35")
        expect(page).to have_content("Attack: 55")
        expect(page).to have_content("Defense: 30")
        expect(page).to have_content("Speed: 90")
        expect(page).to have_content("Special: 50")
        expect(page).to have_content("Trainer ID: 1")
        expect(page).to have_content("In Team: true")
      end

      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      xit "I see a link at the top of the page that takes me to the Pokemon Index Page" do
        trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        pokemon1 = Pokemon.create!(
          name: "Pikachu",
          pokemon_type: "Electric",
          level: 50,
          hit_points: 35,
          attack: 55,
          defense: 30,
          speed: 90,
          special: 50,
          trainer_id: 1,
          in_team: true,
        )
        visit "/pokemons"
        click_on 'All Pokemons'

        expect(current_path).to eq("/pokemons")
      end

      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
      xit "I see a link at the top of the page that takes me to the Trainer Index Page" do
        trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        pokemon1 = Pokemon.create!(
          name: "Pikachu",
          pokemon_type: "Electric",
          level: 50,
          hit_points: 35,
          attack: 55,
          defense: 30,
          speed: 90,
          special: 50,
          trainer_id: 1,
          in_team: true,
        )
        visit "/pokemons"
        click_on 'All Trainers'

        expect(current_path).to eq("/trainers")
      end
    end
  end
end