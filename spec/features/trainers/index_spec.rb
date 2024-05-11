require 'rails_helper'

describe "Trainer Index Page" do
  # User Story 1, Parent Index 
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  context "As a visitor" do
    before :each do
      @trainer1 = Trainer.create!(name: "Ash", badges: 8 , full_team_of_six: true)
      @trainer2 = Trainer.create!(name: "Misty", badges: 6 , full_team_of_six: false)

    end
    describe "When I visit Trainer Index Page" do
      it "I see the name of each trainer record in the system" do
        visit '/trainers'
        # save_and_open_page

        expect(page).to have_content("Name: Ash")
        expect(page).to have_content("Name: Misty")
        expect(page).to have_content("Badges: 8")
        expect(page).to have_content("Badges: 6")
        expect(page).to have_content("Full Team: true")
        expect(page).to have_content("Full Team: false")
      end
      
      # User Story 6, Parent Index sorted by Most Recently Created 
      # As a visitor
      # When I visit the parent index,
      # I see that records are ordered by most recently created first
      # And next to each of the records I see when it was created
      it "I see that records are ordered by most recently created first and next to each of the records I see when it was created" do
        visit '/trainers'

        expect(page).to have_content("Created: #{@trainer1.created_at}")
        expect(page).to have_content("Created: #{@trainer2.created_at}")
        # orderly gem needed
        # let(:this) { "Created: #{@trainer1.created_at}" }
        # let(:that) { "Created: #{@trainer2.created_at}" }

        expect("Name: #{@trainer1.name}").to appear_before("Name: #{@trainer2.name}")
      end

      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      it "I see a link at the top of the page that takes me to the Pokemon Index Page" do
        visit "/trainers"
        click_on 'All Pokemons'

        expect(current_path).to eq("/pokemons")
      end

      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
      it "I see a link at the top of the page that takes me to the Trainer Index Page" do
        visit "/trainers"
        click_on 'All Trainers'
        expect(current_path).to eq("/trainers")
      end

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
      it "I see a link to create a new Trainer record, 'New Trainer'" do
        visit "/trainers"
        click_on 'New Trainer'

        expect(current_path).to eq("/trainers/new")
      end

      # User Story 17, Parent Update From Parent Index Page 
      # As a visitor
      # When I visit the parent index page
      # Next to every parent, I see a link to edit that parent's info
      # When I click the link
      # I should be taken to that parent's edit page where I can update its information 
      it "can click on a link to edit Trainer's info" do
        visit '/trainers'
        # save_and_open_page
        click_on "Update #{@trainer1.name}"

        expect(current_path).to eq("/trainers/#{@trainer1.id}/edit")
      end
    end
  end
end
