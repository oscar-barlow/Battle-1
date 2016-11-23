RSpec.feature "Battle", :type => :feature do
  scenario "User creates a new battle profile" do
    visit "/"

    fill_in "Name", :with => "Warrior1"
    click_button "Create Warrior"

    expect(page).to have_text("Welcome Warrior1")
  end
end
