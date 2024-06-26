require 'rails_helper'

describe "Pokemon Show Page" do
  # User Story 4, Child Show 
  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
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
      @pokemon2 = @trainer1.pokemons.create!(
        name: "Charizard",
        pokemon_type: "Fire/Flying",
        level: 40,
        hit_points: 78,
        attack: 84,
        defense: 78,
        speed: 100,
        special: 85,
        in_team: true,
      )

    end
    describe "When I visit Pokemon Show Page" do
      it "I see the pokemon with that id including the pokemon's attributes" do
        visit "/pokemons/#{@pokemon1.id}"
        
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

        expect(page).to_not have_content(@pokemon2.name)
        expect(page).to_not have_content("Type: #{@pokemon2.pokemon_type}")
        expect(page).to_not have_content("Level: #{@pokemon2.level}")
        expect(page).to_not have_content("Hit Points: #{@pokemon2.hit_points}")
        expect(page).to_not have_content("Attack: #{@pokemon2.attack}")
        expect(page).to_not have_content("Defense: #{@pokemon2.defense}")
        expect(page).to_not have_content("Speed: #{@pokemon2.speed}")
        expect(page).to_not have_content("Special: #{@pokemon2.special}")
      end

      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      it "I see a link at the top of the page that takes me to the Pokemon Index Page" do
        visit "/pokemons/#{@pokemon1.id}"
        click_on 'All Pokemons'

        expect(page).to have_link("All Pokemons")
        expect(current_path).to eq("/pokemons")
      end

      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
      it "I see a link at the top of the page that takes me to the Trainer Index Page" do
        visit "/pokemons/#{@pokemon1.id}"
        click_on 'All Trainers'

        expect(page).to have_link("All Trainers")
        expect(current_path).to eq("/trainers")
      end

      # User Story 14, Child Update 

      # As a visitor
      # When I visit a Child Show page
      # Then I see a link to update that Child "Update Child"
      # When I click the link
      # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
      # When I click the button to submit the form "Update Child"
      # Then a `PATCH` request is sent to '/child_table_name/:id',
      # the child's data is updated,
      # and I am redirected to the Child Show page where I see the Child's updated information
      it "I see a link to update that Child 'Update Child'" do
        visit "/pokemons/#{@pokemon1.id}"

        expect(page).to have_link("Update Pokemon")
        click_on 'Update Pokemon'

        expect(current_path).to eq("/pokemons/#{@pokemon1.id}/edit")
      end

      # User Story 20, Child Delete 
      # As a visitor
      # When I visit a child show page
      # Then I see a link to delete the child "Delete Child"
      # When I click the link
      # Then a 'DELETE' request is sent to '/child_table_name/:id',
      # the child is deleted,
      # and I am redirected to the child index page where I no longer see this child
      it "has a link that deletes current Pokemon" do
        visit "pokemons/#{@pokemon1.id}"

        expect(page).to have_link("Delete #{@pokemon1.name}")
        click_on "Delete #{@pokemon1.name}"
        
        expect(current_path).to eq("/pokemons")
        
        expect(page).to_not have_content(@pokemon1.name)
        expect(page).to_not have_content("Type: #{@pokemon1.pokemon_type}")
        expect(page).to_not have_content("Level: #{@pokemon1.level}")
        expect(page).to_not have_content("Hit Points: #{@pokemon1.hit_points}")
        expect(page).to_not have_content("Attack: #{@pokemon1.attack}")
        expect(page).to_not have_content("Defense: #{@pokemon1.defense}")
        expect(page).to_not have_content("Speed: #{@pokemon1.speed}")
        expect(page).to_not have_content("Special: #{@pokemon1.special}")

        expect(page).to have_content(@pokemon2.name)
        expect(page).to have_content("Type: #{@pokemon2.pokemon_type}")
        expect(page).to have_content("Level: #{@pokemon2.level}")
        expect(page).to have_content("Hit Points: #{@pokemon2.hit_points}")
        expect(page).to have_content("Attack: #{@pokemon2.attack}")
        expect(page).to have_content("Defense: #{@pokemon2.defense}")
        expect(page).to have_content("Speed: #{@pokemon2.speed}")
        expect(page).to have_content("Special: #{@pokemon2.special}")
        expect(page).to have_content("Trainer ID: #{@pokemon2.trainer_id}")
        expect(page).to have_content("In Team: #{@pokemon2.in_team}")
      end
    end
  end
end