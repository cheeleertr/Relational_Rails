require 'rails_helper'

describe "Trainer Show Page" do
  # User Story 2, Parent Show 
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)
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
        # trainer_id: 1,
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
        # trainer_id: 1,
        in_team: false,
      )
    end
    describe "When I visit Trainer Show Page" do
      it "I see the trainer with that id including the trainer's attributes" do
        visit "/trainers/#{@trainer1.id}"
        
        expect(page).to have_content(@trainer1.name)
        expect(page).to have_content("Badges: #{@trainer1.badges}")
        expect(page).to have_content("Full Team: #{@trainer1.full_team_of_six}")
        expect(page).to_not have_content(@trainer2.name)
        expect(page).to_not have_content("Badges: #{@trainer2.badges}")
        expect(page).to_not have_content("Full Team: #{@trainer2.full_team_of_six}")
      end

      # User Story 7, Parent Child Count
      # As a visitor
      # When I visit a parent's show page
      # I see a count of the number of children associated with this parent
      it "I see a count of the number of children associated with this parent" do
        visit "/trainers/#{@trainer1.id}"
        
        expect(page).to have_content("Pokemons Count: #{@trainer1.pokemons.count}")
      end

      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      it "I see a link at the top of the page that takes me to the Pokemon Index Page" do
        visit "/trainers/#{@trainer1.id}"
        click_on 'All Pokemons'

        expect(current_path).to eq("/pokemons")
      end

      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
      it "I see a link at the top of the page that takes me to the Trainer Index Page" do
        visit "/trainers/#{@trainer1.id}"
        click_on 'All Trainers'

        expect(current_path).to eq("/trainers")
      end

      # User Story 10, Parent Child Index Link
      # As a visitor
      # When I visit a parent show page ('/parents/:id')
      # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
      it "I see a link to take me to that Trainer's Pokemon Index page" do
        visit "/trainers/#{@trainer1.id}"
        click_on "Trainer's Pokemons"

        expect(current_path).to eq("/trainers/#{@trainer1.id}/pokemons")
      end

      #User Story 12, Parent Update 
      # As a visitor
      # When I visit a parent show page
      # Then I see a link to update the parent "Update Parent"
      # When I click the link "Update Parent"
      # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
      # When I fill out the form with updated information
      # And I click the button to submit the form
      # Then a `PATCH` request is sent to '/parents/:id',
      # the parent's info is updated,
      # and I am redirected to the Parent's Show page where I see the parent's updated info
      it "I see a link to update the parent 'Update Parent'" do
        visit "/trainers/#{@trainer1.id}"
        click_on 'Update Trainer'

        expect(current_path).to eq("/trainers/#{@trainer1.id}/edit")
      end

      # User Story 19, Parent Delete 
      # As a visitor
      # When I visit a parent show page
      # Then I see a link to delete the parent
      # When I click the link "Delete Parent"
      # Then a 'DELETE' request is sent to '/parents/:id',
      # the parent is deleted, and all child records are deleted
      # and I am redirected to the parent index page where I no longer see this parent

      it "I can see a click a link and delete Trainer" do
        visit "/trainers/#{@trainer1.id}"

        click_on "Delete #{@trainer1.name}"

        expect(current_path).to eq("/trainers")

        expect(page).to_not have_content("Name: #{@trainer1.name}")
        expect(page).to_not have_content("Badges: #{@trainer1.badges}")
        expect(page).to_not have_content("Full Team: #{@trainer1.full_team_of_six}")
        expect(page).to have_content("Name: #{@trainer2.name}")
        expect(page).to have_content("Badges: #{@trainer2.badges}")
        expect(page).to have_content("Full Team: #{@trainer2.full_team_of_six}")
      end
    end
  end
end