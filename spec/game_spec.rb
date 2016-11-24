require 'game'
require 'player'



describe Game do

  let(:player1) { double :player1}
  let(:player2) { double :player2}
  subject(:game) {described_class.new(player1, player2)}

  it "should have players in upon initialization" do
    expect(game.players).not_to be_empty
  end


end
