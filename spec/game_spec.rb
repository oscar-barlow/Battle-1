require 'game'
require 'player'

describe Game do

  let(:player_one) {double(:player_one, hitpoints: 60)}
  let(:player_two) {spy(:player_two, hitpoints: 60)}

  subject(:game) {described_class.new(player_one, player_two)}

  it 'initializes with two players' do
    expect(game.players.length).to eq 2
  end

  it 'responds to #attack' do
    expect(game).to respond_to :attack
  end

  describe 'when one player attacks another' do

    it 'reduces the attacked player\'s hitpoints by 10' do
      game.attack(player_two)
      expect(player_two).to have_received(:reduce_hitpoints).with(10)
    end

  end

end
