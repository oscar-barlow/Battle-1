RSpec.feature "Enter Names", :type => :feature do
  scenario "User creates a new battle profile" do
    sign_in_and_play
    expect(page).to have_text("Warrior1 vs. Warrior2")
  end
end
