RSpec.feature "Lose the game", :type => :feature do

  scenario 'Warrior2 loses the game on 0 HP' do
    sign_in_and_play
    9.times {warriors_attack_eachother}
    click_button("Attack Warrior2")
    click_button("End Warrior1's turn")

    expect(page).to have_text("Warrior2 health reached 0, Warrior2 is dead")
  end
end
