require 'game'
require 'player'



describe Game do

  let(:player1) { spy :player1}
  let(:player2) { spy :player2}
  subject(:game) {described_class.new(player1, player2)}

  it "should have players in upon initialization" do
    expect(game.players).not_to be_empty
  end

  it "should allow player1 to attack player2" do
    game.attack(player2)
    expect(player2).to have_received(:receive_damage)
  end

  it "should allow player 2 to attack player 1" do
    game.attack(player1)
    expect(player1).to have_received(:receive_damage)
  end

end
