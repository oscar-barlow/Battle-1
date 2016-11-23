feature 'Atack player' do
  scenario 'player 1 should be able to attack player 2' do
    sign_in_and_play
    click_button "Attack Mittens"
    expect(page).to have_content 'Dave attacked Mittens'
  end
end
