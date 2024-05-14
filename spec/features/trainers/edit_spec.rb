require 'rails_helper'

describe "Trainer Edit Page" do
  # User Story 12, Parent Update 
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
  context "As a visitor" do
    describe "When I visit Trainer Edit Page" do
      it "I can update a Trainer's attributes" do
        trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
        visit "/trainers/#{trainer1.id}"

        expect(page).to have_link("Update Trainer")
        click_on 'Update Trainer'

        expect(page).to have_field("trainer[name]")
        expect(page).to have_field("trainer[badges]")
        expect(page).to have_field("trainer[full_team_of_six]")
        
        fill_in "trainer[name]", with: "Ash Ketchum"
        fill_in "trainer[badges]", with: 9
        fill_in "trainer[full_team_of_six]", with: false
        click_on "Update Trainer"

        expect(current_path).to eq("/trainers/#{trainer1.id}")
        # save_and_open_page
        expect(page).to have_content("Ash Ketchum")
        expect(page).to have_content("Badges: 9")
        expect(page).to have_content("Full Team: false")
      end
    end
  end
end