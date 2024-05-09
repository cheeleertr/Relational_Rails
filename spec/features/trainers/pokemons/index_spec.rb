require 'rails_helper'

describe "Trainer Pokemon Index" do
  # User Story 5, Parent Children Index 
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  context "As a visitor" do
    describe "When I visit Trainer Pokemon Index" do
      it "I see each Pokemon that is associated with that Trainer with each Pokemon's attributes" do
        trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        trainer2 = Trainer.create!(name: "Misty", badges: 6 , full_team_of_six: false)

        pokemon1 = Pokemon.create!(
          name: "Pikachu",
          pokemon_type: "Electric",
          level: 50,
          hit_points: 35,
          attack: 55,
          defense: 30,
          speed: 90,
          special: 50,
          trainer_id: trainer1.id,
          in_team: true,
        )
        pokemon2 = Pokemon.create!(
          name: "Charizard",
          pokemon_type: "Fire/Flying",
          level: 40,
          hit_points: 78,
          attack: 84,
          defense: 78,
          speed: 100,
          special: 85,
          trainer_id: trainer1.id,
          in_team: false,
        )
        pokemon3 = Pokemon.create!(
          name: "Psyduck",
          pokemon_type: "Water",
          level: 45,
          hit_points: 50,
          attack: 52,
          defense: 48,
          speed: 55,
          special: 51,
          trainer_id: trainer2.id,
          in_team: true,
        )
        visit "/trainers/#{trainer1.id}/pokemons"
        
        expect(page).to have_content(pokemon1.name)
        expect(page).to have_content("Type: #{pokemon1.pokemon_type}")
        expect(page).to have_content("Level: #{pokemon1.level}")
        expect(page).to have_content("Hit Points: #{pokemon1.hit_points}")
        expect(page).to have_content("Attack: #{pokemon1.attack}")
        expect(page).to have_content("Defense: #{pokemon1.defense}")
        expect(page).to have_content("Speed: #{pokemon1.speed}")
        expect(page).to have_content("Special: #{pokemon1.special}")
        expect(page).to have_content("Trainer ID: #{pokemon1.trainer_id}")
        expect(page).to have_content("In Team: #{pokemon1.in_team}")

        expect(page).to have_content(pokemon2.name)
        expect(page).to have_content("Type: #{pokemon2.pokemon_type}")
        expect(page).to have_content("Level: #{pokemon2.level}")
        expect(page).to have_content("Hit Points: #{pokemon2.hit_points}")
        expect(page).to have_content("Attack: #{pokemon2.attack}")
        expect(page).to have_content("Defense: #{pokemon2.defense}")
        expect(page).to have_content("Speed: #{pokemon2.speed}")
        expect(page).to have_content("Special: #{pokemon2.special}")
        # expect(page).to have_content("Trainer ID: #{pokemon2.trainer_id}")
        expect(page).to have_content("In Team: #{pokemon2.in_team}")

        expect(page).to_not have_content(pokemon3.name)
        expect(page).to_not have_content("Type: #{pokemon3.pokemon_type}")
        expect(page).to_not have_content("Level: #{pokemon3.level}")
        expect(page).to_not have_content("Hit Points: #{pokemon3.hit_points}")
        expect(page).to_not have_content("Attack: #{pokemon3.attack}")
        expect(page).to_not have_content("Defense: #{pokemon3.defense}")
        expect(page).to_not have_content("Speed: #{pokemon3.speed}")
        expect(page).to_not have_content("Special: #{pokemon3.special}")
        expect(page).to_not have_content("Trainer ID: #{pokemon3.trainer_id}")
        # expect(page).to_not have_content("In Team: #{pokemon3.in_team}")
      end

      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      it "I see a link at the top of the page that takes me to the Pokemon Index Page" do
        trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        pokemon1 = trainer1.pokemons.create!(
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
        visit "/trainers/#{trainer1.id}/pokemons"
        click_on 'All Pokemons'

        expect(current_path).to eq("/pokemons")
      end

      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
      it "I see a link at the top of the page that takes me to the Trainer Index Page" do
        trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        pokemon1 = trainer1.pokemons.create!(
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
        visit "/trainers/#{trainer1.id}/pokemons"
        click_on 'All Trainers'

        expect(current_path).to eq("/trainers")
      end
    end
  end
end