feature 'Show hit points' do
  scenario 'showing hit points' do
    visit('/')
    fill_in :player_1_name, with: 'Dave'
    fill_in :player_2_name, with: 'Mittens'
    click_button 'Submit'
    expect(page).to have_content 'Mittens (hit points: 60)'


  end
end
