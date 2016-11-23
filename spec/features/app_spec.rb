RSpec.feature "Battle", :type => :feature do
  scenario "User creates a new battle profile" do
    sign_in_and_play
    expect(page).to have_text("Warrior1 vs. Warrior2")
  end

  scenario "Warrior 1 can see Warrior 2's health" do
    sign_in_and_play
    expect(page).to have_text("Warrior2 health: 100")
  end

  scenario "Warrior 1 can attack warrior 2" do
    sign_in_and_play
    click_link("Attack Warrior2")
    click_link("Wanna fight more?")
    expect(page).to have_text("Warrior2 health: 90")
  end

  scenario "Warrior 2 can attack warrior 1" do
    sign_in_and_play
    click_link("Attack Warrior1")
    click_link("Wanna fight more?")
    expect(page).to have_text("Warrior1 health: 90")
  end

  scenario "Return a confirmation of Warrior1 attacking Warrior2" do
    sign_in_and_play
    click_link("Attack Warrior2")
    expect(page).to have_text("Warrior1 attacked Warrior2")
  end

  scenario "Return a confirmation of Warrior2 attacking Warrior1" do
    sign_in_and_play
    click_link("Attack Warrior1")
    expect(page).to have_text("Warrior2 attacked Warrior1")
  end
end
