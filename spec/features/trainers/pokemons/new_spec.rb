require "rails_helper"

describe "Trainer Pokemons New Page" do
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
  context "As a visitor" do
    describe "When I visit Trainer Pokemons New Page" do
      it "I can create a new Pokemon" do
        trainer2 = Trainer.create!(name: "Misty", badges: 6 , full_team_of_six: false)
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
        
        visit "trainers/#{trainer2.id}/pokemons/new"
        fill_in "pokemon[name]", with: "Magikarp"
        fill_in "pokemon[pokemon_type]", with: "Water"
        fill_in "pokemon[level]", with: "15"
        fill_in "pokemon[hit_points]", with: "20"
        fill_in "pokemon[attack]", with: "10"
        fill_in "pokemon[defense]", with: "55"
        fill_in "pokemon[speed]", with: "80"
        fill_in "pokemon[special]", with: "20"
        fill_in "pokemon[in_team]", with: "false"
        click_on "Create Pokemon"

        expect(current_path).to eq("/trainers/#{trainer2.id}/pokemons")

        expect(page).to have_content("Name: Magikarp")
        expect(page).to have_content("Type: Water")
        expect(page).to have_content("Level: 15")
        expect(page).to have_content("Hit Points: 20")
        expect(page).to have_content("Attack: 10")
        expect(page).to have_content("Defense: 55")
        expect(page).to have_content("Speed: 80")
        expect(page).to have_content("Special: 20")
        expect(page).to have_content("In Team: false")
      end
    end
  end
end