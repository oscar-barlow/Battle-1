RSpec.feature "Battle", :type => :feature do
  scenario "User creates a new battle profile" do
    visit "/"

    fill_in "name1", :with => "Warrior1"
    fill_in "name2", :with => "Warrior2"
    click_button "Submit"

    expect(page).to have_text("Welcome Warrior1 and Warrior2")
  end


  scenario "Warrior 1 can see Warrior 2's Hit Points" do
    visit "/"
    fill_in "name1", :with => "Warrior1"
    fill_in "name2", :with => "Warrior2"
    click_button "Submit"
    expect(page).to have_text("Warrior2 Hit Points: 100")
  end
end
