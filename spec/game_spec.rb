require 'game'
require 'player'

describe Game do

  let(:player1) { spy :player1, :check_active => true }
  let(:player2) { spy :player2, :check_active => false }

  subject(:game) {described_class.new(player1, player2)}

  describe '#initialize' do

    it "has a player in player 1 slot" do
      expect(game.player1).not_to be_nil
    end

    it "has a player in player 2 slot" do
      expect(game.player2).not_to be_nil
    end

    it "makes player 1 active" do
      expect(game.player1).to have_received(:switch_active)
    end

  end

  describe '#attack' do

    it "allows player1 to attack player2" do
      game.attack(player2)
      expect(player2).to have_received(:receive_damage)
    end

    it "allows player 2 to attack player 1" do
      game.attack(player1)
      expect(player1).to have_received(:receive_damage)
    end

  end

  describe "#active_player" do

    it 'returns the currently active player' do
      expect(game.active_player).to eq player1
    end

  end

  describe '#inactive_player' do

    it 'returns the currently inactive player' do
      expect(game.inactive_player).to eq player2
    end

  end

  describe '#is_battle_over?' do

    it 'returns true if player1 is dead and player 2 is alive' do
      allow(player1).to receive(:is_dead?).and_return(true)
      allow(player2).to receive(:is_dead?).and_return(false)
      expect(game.is_battle_over?).to be true
    end

    it 'returns true if player2 is dead and player1 is alive' do
      allow(player1).to receive(:is_dead?).and_return(false)
      allow(player2).to receive(:is_dead?).and_return(true)
      expect(game.is_battle_over?).to be true
    end

    it 'returns false if neither player1 nor player 2 are dead' do
      allow(player1).to receive(:is_dead?).and_return(false)
      allow(player2).to receive(:is_dead?).and_return(false)
      expect(game.is_battle_over?).to be false
    end

    it 'returns true if both players are dead' do
      allow(player1).to receive(:is_dead?).and_return(true)
      allow(player2).to receive(:is_dead?).and_return(true)
      expect(game.is_battle_over?).to be true
    end

  end


  describe "Error handling" do

    describe 'when calling #active_player' do

      it 'raises an exception when both players are active' do
        message = "Cannot have two active players"
        allow(player2).to receive(:check_active).and_return(true)
        expect{ game.active_player }.to raise_error(RuntimeError, message)
      end

      it 'raises an exception when both players are inactive' do
        message = "Cannot have two inactive players"
        allow(player1).to receive(:check_active).and_return(false)
        expect{ game.active_player }.to raise_error(RuntimeError, message)
      end

    end

    describe 'when calling #inactive_player' do

      it 'raises an exception when both players are active' do
        message = "Cannot have two active players"
        allow(player2).to receive(:check_active).and_return(true)
        expect{ game.inactive_player }.to raise_error(RuntimeError, message)
      end

      it 'raises an exception when both players are inactive' do
        message = "Cannot have two inactive players"
        allow(player1).to receive(:check_active).and_return(false)
        expect{ game.inactive_player }.to raise_error(RuntimeError, message)
      end

    end

  end

end
