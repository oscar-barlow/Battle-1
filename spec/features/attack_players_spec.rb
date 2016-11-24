RSpec.feature "Attack Players", :type => :feature do

  scenario "Warrior 1 can attack warrior 2" do
    sign_in_and_play
    click_button("Attack Warrior2")
    expect(page).to have_text("Warrior2 health: 90")
  end

  scenario "Warrior 2 can attack warrior 1" do
    sign_in_and_play
    click_button("Attack Warrior1")
    expect(page).to have_text("Warrior1 health: 90")
  end

  scenario "Return a confirmation of Warrior1 attacking Warrior2" do
    sign_in_and_play
    click_button("Attack Warrior2")
    expect(page).to have_text("Warrior1 attacked Warrior2")
  end

  scenario "Return a confirmation of Warrior2 attacking Warrior1" do
    sign_in_and_play
    click_button("Attack Warrior1")
    expect(page).to have_text("Warrior2 attacked Warrior1")
  end

end
