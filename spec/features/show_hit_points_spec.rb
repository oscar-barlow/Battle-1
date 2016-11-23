feature 'Show hit points' do
  scenario 'showing hit points' do
    sign_in_and_play
    expect(page).to have_content 'Mittens (hit points: 60)'
  end
end
