RSpec.feature "Show Health", :type => :feature do

  scenario "Warrior 1 can see Warrior 2's health" do
    sign_in_and_play
    expect(page).to have_text("Warrior2 health: 100")
  end

end
