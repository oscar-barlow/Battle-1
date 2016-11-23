RSpec.feature "Battle", :type => :feature do
  scenario "User creates a new battle profile" do
    sign_in_and_play
    expect(page).to have_text("Welcome Warrior1 and Warrior2")
  end


  scenario "Warrior 1 can see Warrior 2's Hit Points" do
    sign_in_and_play
    expect(page).to have_text("Warrior2 Hit Points: 100")
  end
end
