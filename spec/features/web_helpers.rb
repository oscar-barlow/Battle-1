def sign_in_and_play
  visit "/"
  fill_in "name1", :with => "Warrior1"
  fill_in "name2", :with => "Warrior2"
  click_button "Submit"
end
