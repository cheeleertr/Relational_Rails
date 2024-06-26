require 'rails_helper'

describe "Trainer Pokemon Index" do
  # User Story 5, Parent Children Index 
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  context "As a visitor" do
    before :each do
      @trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
      @trainer2 = Trainer.create!(name: "Misty", badges: 6 , full_team_of_six: false)
  
      @pokemon1 = @trainer1.pokemons.create!(
        name: "Pikachu",
        pokemon_type: "Electric",
        level: 50,
        hit_points: 35,
        attack: 55,
        defense: 30,
        speed: 90,
        special: 50,
        trainer_id: @trainer1.id,
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
        trainer_id: @trainer1.id,
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
      @pokemon4 = @trainer2.pokemons.create!(
        name: "Psyduck",
        pokemon_type: "Water",
        level: 45,
        hit_points: 50,
        attack: 52,
        defense: 48,
        speed: 55,
        special: 53,
        trainer_id: @trainer2.id,
        in_team: true,
        )
      end

    describe "When I visit Trainer Pokemon Index" do
      scenario "I see each Pokemon that is associated with that Trainer with each Pokemon's attributes" do
        visit "/trainers/#{@trainer1.id}/pokemons"
        
        expect(page).to have_content(@pokemon1.name)
        expect(page).to have_content("Type: #{@pokemon1.pokemon_type}")
        expect(page).to have_content("Level: #{@pokemon1.level}")
        expect(page).to have_content("Hit Points: #{@pokemon1.hit_points}")
        expect(page).to have_content("Attack: #{@pokemon1.attack}")
        expect(page).to have_content("Defense: #{@pokemon1.defense}")
        expect(page).to have_content("Speed: #{@pokemon1.speed}")
        expect(page).to have_content("Special: #{@pokemon1.special}")
        expect(page).to have_content("Trainer ID: #{@pokemon1.trainer_id}")
        expect(page).to have_content("In Team: #{@pokemon1.in_team}")

        expect(page).to have_content(@pokemon2.name)
        expect(page).to have_content("Type: #{@pokemon2.pokemon_type}")
        expect(page).to have_content("Level: #{@pokemon2.level}")
        expect(page).to have_content("Hit Points: #{@pokemon2.hit_points}")
        expect(page).to have_content("Attack: #{@pokemon2.attack}")
        expect(page).to have_content("Defense: #{@pokemon2.defense}")
        expect(page).to have_content("Speed: #{@pokemon2.speed}")
        expect(page).to have_content("Special: #{@pokemon2.special}")
        expect(page).to have_content("In Team: #{@pokemon2.in_team}")

        expect(page).to_not have_content(@pokemon4.name)
        expect(page).to_not have_content("Level: #{@pokemon4.level}")
        expect(page).to_not have_content("Hit Points: #{@pokemon4.hit_points}")
        expect(page).to_not have_content("Attack: #{@pokemon4.attack}")
        expect(page).to_not have_content("Defense: #{@pokemon4.defense}")
        expect(page).to_not have_content("Speed: #{@pokemon4.speed}")
        expect(page).to_not have_content("Special: #{@pokemon4.special}")
        expect(page).to_not have_content("Trainer ID: #{@pokemon4.trainer_id}")
      end

      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      it "I see a link at the top of the page that takes me to the Pokemon Index Page" do
        visit "/trainers/#{@trainer1.id}/pokemons"

        expect(page).to have_link("All Pokemons")
        click_on 'All Pokemons'

        expect(current_path).to eq("/pokemons")
      end

      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
      it "I see a link at the top of the page that takes me to the Trainer Index Page" do
        visit "/trainers/#{@trainer1.id}/pokemons"

        expect(page).to have_link("All Trainers")
        click_on 'All Trainers'

        expect(current_path).to eq("/trainers")
      end
      
      # User Story 13, Parent Child Creation 
      # As a visitor
      # When I visit a Parent Children Index page
      # Then I see a link to add a new adoptable child for that parent "Create Child"
      # When I click the link
      # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
      # When I fill in the form with the child's attributes:
      # And I click the button "Create Child"
      # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
      # a new child object/row is created for that parent,
      # and I am redirected to the Parent Childs Index page where I can see the new child listed
      it "I see a link to add a new adoptable child for that parent 'Create Child'" do
        visit "/trainers/#{@trainer2.id}/pokemons"

        expect(page).to have_link("Create Pokemon")
        click_on "Create Pokemon"
        
        expect(current_path).to eq("/trainers/#{@trainer2.id}/pokemons/new")
      end

      # User Story 16, Sort Parent's Children in Alphabetical Order by name 
      # As a visitor
      # When I visit the Parent's children Index Page
      # Then I see a link to sort children in alphabetical order
      # When I click on the link
      # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
      it "I can click link to see the Trainer's Pokemons in alphabetical order" do
        visit "/trainers/#{@trainer1.id}/pokemons"

        expect(page).to have_link("Sort by Name")
        click_on "Sort by Name"

        expect("Name: #{@pokemon2.name}").to appear_before("Name: #{@pokemon1.name}")
        expect("Name: #{@pokemon1.name}").to appear_before("Name: #{@pokemon3.name}")
      end

      # User Story 18, Child Update From Childs Index Page 
      # As a visitor
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to edit that child's info
      # When I click the link
      # I should be taken to that `child_table_name` edit page where I can update its information
      it "can click on a link to edit Pokemon's info" do
        visit "trainers/#{@trainer1.id}/pokemons"
        
        expect(page).to have_link("Update #{@pokemon1.name}")
        expect(page).to have_link("Update #{@pokemon2.name}")
        expect(page).to have_link("Update #{@pokemon3.name}")
        click_on "Update #{@pokemon1.name}"

        expect(current_path).to eq("/pokemons/#{@pokemon1.id}/edit")
      end

      # User Story 21, Display Records Over a Given Threshold 
      # As a visitor
      # When I visit the Parent's children Index Page
      # I see a form that allows me to input a number value
      # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
      # Then I am brought back to the current index page with only the records that meet that threshold shown.
      it "can click on link and display records over a given threshold" do
        visit "trainers/#{@trainer1.id}/pokemons"

        expect(page).to have_content("Name: Pikachu")
        expect(page).to have_content("Name: Squirtle")
        expect(page).to have_field("threshold")
        #not sure what this is asking
        #filter by attribute that has integer as value?
        
        fill_in "threshold", with: 44
        # click_on "Only return records with more than 'number' of Level"
        # save_and_open_page
        expect(page).to have_content("Only return pokemons with level over:")
        click_on "Filter"
        #reworded for readablility"
        
        expect(current_path).to eq("/trainers/#{@trainer1.id}/pokemons")

        expect(page).to have_content("Name: Pikachu")
        expect(page).to_not have_content("Name: Squirtle")
      end

            # User Story 23, Child Delete From Childs Index Page 
      # As a visitor
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to delete that child
      # When I click the link
      # I should be taken to the `child_table_name` index page where I no longer see that child
      it "has link by each pokemon to delete itself" do
        visit "/trainers/#{@trainer1.id}/pokemons"

        expect(page).to have_link("Delete #{@pokemon1.name}")
        expect(page).to have_link("Delete #{@pokemon2.name}")
        expect(page).to have_link("Delete #{@pokemon3.name}")
        click_on "Delete #{@pokemon1.name}"

        expect(current_path).to eq("/pokemons")

        expect(page).to_not have_content("Name: Pikachu")
        expect(page).to_not have_content("Type: Electric")
        expect(page).to_not have_content("Level: 50")
        expect(page).to_not have_content("Hit Points: 35")
        expect(page).to_not have_content("Attack: 55")
        expect(page).to_not have_content("Defense: 30")
        expect(page).to_not have_content("Speed: 90")
        expect(page).to_not have_content("Special: 50")

        expect(page).to have_content("Name: Squirtle")
        expect(page).to have_content("Type: Water")
        expect(page).to have_content("Level: 36")
        expect(page).to have_content("Hit Points: 44")
        expect(page).to have_content("Attack: 48")
        expect(page).to have_content("Defense: 65")
        expect(page).to have_content("Speed: 43")
        expect(page).to have_content("Special: 51")
      end
    end
  end
end