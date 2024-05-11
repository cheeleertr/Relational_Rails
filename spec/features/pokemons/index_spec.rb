require 'rails_helper'

describe "Pokemon Index Page" do
  # User Story 3, Child Index 
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  context "As a visitor" do
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


    end
    describe "When I visit Pokemon Index Page" do
      it "Then I see each Pokemon in the system including the Pokemon's attributes" do
        visit "/pokemons"
        
        expect(page).to have_content("Name: Pikachu")
        expect(page).to have_content("Type: Electric")
        expect(page).to have_content("Level: 50")
        expect(page).to have_content("Hit Points: 35")
        expect(page).to have_content("Attack: 55")
        expect(page).to have_content("Defense: 30")
        expect(page).to have_content("Speed: 90")
        expect(page).to have_content("Special: 50")
        expect(page).to have_content("Trainer ID: #{@trainer1.id}")
        expect(page).to have_content("In Team: true")
      end

      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      it "I see a link at the top of the page that takes me to the Pokemon Index Page" do
        visit "/pokemons"
        click_on 'All Pokemons'

        expect(current_path).to eq("/pokemons")
      end

      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
      it "I see a link at the top of the page that takes me to the Trainer Index Page" do
        visit "/pokemons"
        click_on 'All Trainers'

        expect(current_path).to eq("/trainers")
      end

      # User Story 15, Child Index only shows `true` Records 
      # As a visitor
      # When I visit the child index
      # Then I only see records where the boolean column is `true`
      it "I only see records where the boolean column is `true`" do
        pokemon2 = @trainer1.pokemons.create!(
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
        visit "/pokemons"

        expect(page).to have_content("Name: Pikachu")
        expect(page).to have_content("Type: Electric")
        expect(page).to have_content("Level: 50")
        expect(page).to have_content("Hit Points: 35")
        expect(page).to have_content("Attack: 55")
        expect(page).to have_content("Defense: 30")
        expect(page).to have_content("Speed: 90")
        expect(page).to have_content("Special: 50")
        expect(page).to have_content("Trainer ID: #{@trainer1.id}")
        expect(page).to have_content("In Team: true")

        expect(page).to_not have_content("Name: Charizard")
        expect(page).to_not have_content("Type: Fire/Flying")
        expect(page).to_not have_content("Level: 40")
        expect(page).to_not have_content("Hit Points: 78")
        expect(page).to_not have_content("Attack: 84")
        expect(page).to_not have_content("Defense: 78")
        expect(page).to_not have_content("Speed: 100")
        expect(page).to_not have_content("Special: 85")
        expect(page).to_not have_content("In Team: false")
      end

      # User Story 18, Child Update From Childs Index Page 
      # As a visitor
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to edit that child's info
      # When I click the link
      # I should be taken to that `child_table_name` edit page where I can update its information
      it "can click on a link to edit Pokemon's info" do
        visit '/pokemons'

        click_on "Update #{@pokemon1.name}"

        expect(current_path).to eq("/pokemons/#{@pokemon1.id}/edit")
      end
    end
  end
end