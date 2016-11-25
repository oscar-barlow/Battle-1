def sign_in_and_play
  visit "/"
  fill_in "name1", :with => "Warrior1"
  fill_in "name2", :with => "Warrior2"
  click_button "Submit"
end

def warriors_attack_eachother
  click_button("Attack Warrior2")
  click_button("End Warrior1's turn")
  click_button("Attack Warrior1")
  click_button("End Warrior2's turn")
end
