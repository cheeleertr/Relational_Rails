require 'rails_helper'

describe "Trainer Show Page" do
  # User Story 2, Parent Show 
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)
  context "As a visitor" do
    describe "When I visit Trainer Show Page" do
      it "I see the trainer with that id including the trainer's attributes" do
        trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        trainer2 = Trainer.create!(name: "Misty", badges: 6 , full_team_of_six: false)
        visit "/trainers/#{trainer1.id}"
        
        expect(page).to have_content(trainer1.name)
        expect(page).to have_content("Badges: #{trainer1.badges}")
        expect(page).to have_content("Full Team: #{trainer1.full_team_of_six}")
        expect(page).to_not have_content(trainer2.name)
        expect(page).to_not have_content("Badges: #{trainer2.badges}")
        expect(page).to_not have_content("Full Team: #{trainer2.full_team_of_six}")
      end

      # User Story 7, Parent Child Count
      # As a visitor
      # When I visit a parent's show page
      # I see a count of the number of children associated with this parent
      xit "I see a count of the number of children associated with this parent" do
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
        pokemon2 = Pokemon.create!(
          name: "Charizard",
          pokemon_type: "Fire/Flying",
          level: 40,
          hit_points: 78,
          attack: 84,
          defense: 78,
          speed: 100,
          special: 85,
          trainer_id: 1,
          in_team: false,
        )
        visit "/trainers/#{trainer1.id}"
        
        expect(page).to have_content("Pokemons Count: #{trainer1.pokemon_count}")
      end

      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      xit "I see a link at the top of the page that takes me to the Pokemon Index Page" do
        trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        visit "/trainers/#{trainer1.id}"
        click_on 'All Pokemons'

        expect(current_path).to eq("/pokemons")
      end

      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
      xit "I see a link at the top of the page that takes me to the Trainer Index Page" do
        trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        visit "/trainers/#{trainer1.id}"
        click_on 'All Trainers'

        expect(current_path).to eq("/trainers")
      end

      # User Story 10, Parent Child Index Link
      # As a visitor
      # When I visit a parent show page ('/parents/:id')
      # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
      xit "I see a link to take me to that Trainer's Pokemon Index page" do
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
        visit "/trainers/#{trainer1.id}"
        click_on "Trainer's Pokemons"

        expect(current_path).to eq("/trainers/#{trainer1.id}/pokemon")
      end
    end
  end
end