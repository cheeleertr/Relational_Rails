require 'rails_helper'

describe "Pokemon Edit Page" do
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
  context "As a Visitor" do
    describe "When I visit Pokemon Edit Page" do
      it "I can update a Pokemon's attributes'" do
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
        visit "/pokemons/#{pokemon1.id}/edit"

        expect(page).to have_field("pokemon[name]")
        expect(page).to have_field("pokemon[pokemon_type]")
        expect(page).to have_field("pokemon[level]")
        expect(page).to have_field("pokemon[hit_points]")
        expect(page).to have_field("pokemon[attack]")
        expect(page).to have_field("pokemon[defense]")
        expect(page).to have_field("pokemon[speed]")
        expect(page).to have_field("pokemon[special]")
        expect(page).to have_field("pokemon[in_team]")

        fill_in "pokemon[name]", with: "Raichu"
        fill_in "pokemon[pokemon_type]", with: "Electric"
        fill_in "pokemon[level]", with: 55
        fill_in "pokemon[hit_points]", with: 60
        fill_in "pokemon[attack]", with: 90
        fill_in "pokemon[defense]", with: 55
        fill_in "pokemon[speed]", with: 100
        fill_in "pokemon[special]", with: 90
        fill_in "pokemon[in_team]", with: true
        click_on 'Update Pokemon'

        expect(current_path).to eq("/pokemons/#{pokemon1.id}")
        expect(page).to have_content("Raichu")
        expect(page).to have_content("Type: Electric")
        expect(page).to have_content("Level: 55")
        expect(page).to have_content("Hit Points: 60")
        expect(page).to have_content("Attack: 90")
        expect(page).to have_content("Defense: 55")
        expect(page).to have_content("Speed: 100")
        expect(page).to have_content("Special: 90")
        expect(page).to have_content("In Team: true")
      end
    end
  end
end