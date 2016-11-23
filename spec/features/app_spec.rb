RSpec.feature "Battle", :type => :feature do
  scenario "User creates a new battle profile" do
    sign_in_and_play
    expect(page).to have_text("Welcome Warrior1 and Warrior2")
  end

  scenario "Warrior 1 can see Warrior 2's Hit Points" do
    sign_in_and_play
    expect(page).to have_text("Warrior2 Hit Points: 100")
  end

  scenario "Warrior 1 can attack warrior 2" do
    sign_in_and_play
    click_link("Attack Warrior2")
    click_link("Wanna fight more?")
    expect(page).to have_text("Warrior2 Hit Points: 80")
  end

  scenario "Return a confirmation of Warrior1 attacking Warrior2" do
    sign_in_and_play
    click_link("Attack Warrior2")
    expect(page).to have_text("Warrior1 attacked Warrior2")
  end
end
