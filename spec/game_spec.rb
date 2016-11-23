require 'game'
require 'player'

describe Game do

  let(:player_one) {double(:player_one)}
  let(:player_two) {double(:player_two)}

  subject(:game) {described_class.new(player_one, player_two)}

  it 'initializes with two players' do
    expect(game.players.length).to eq 2
  end

end
