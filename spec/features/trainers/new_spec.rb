require 'rails_helper'

describe "Trainer New Page" do
  # User Story 11, Parent Creation 
  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
  context "As a visitor" do
    describe "When I visit Trainer New Page" do
      it "I can create a new Trainer" do
        visit '/trainers/new' 
        
        fill_in "trainer[name]", with: "Brock"
        fill_in "trainer[badges]", with: 5
        fill_in "trainer[full_team_of_six]", with: false
        click_on "Create Trainer"

        expect(current_path).to eq("/trainers")
        expect(page).to have_content("Name: Brock")
        expect(page).to have_content("Badges: 5")
        expect(page).to have_content("Full Team: false")
      end
    end
  end
end