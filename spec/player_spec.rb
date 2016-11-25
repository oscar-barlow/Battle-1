require "player"

describe Player do

  subject(:player) {described_class.new("Dines")}
  let(:opponent) {double(:opponent)}

  describe 'create a player' do
    it 'should have a name' do
      expect(player.name).to eq "Dines"
    end
    it "should have a default health" do
      expect(player.health).to eq Player::DEFAULT_HEALTH
    end
    it 'should have a default active setting' do
      expect(player.active).to be false
    end

  end

  describe "When fighting" do
    it "should be able to attack another player" do
      expect(opponent).to receive(:receive_damage)
      player.attack(opponent)
    end

    it "deduct life" do
      player.receive_damage
      expect(player.health).to eq Player::DEFAULT_HEALTH - Player::DEFAULT_DAMAGE
    end
  end

  describe "set player as (in)active" do

    it 'sets an inactive player to active' do
      player.switch_active
      expect(player.active).to be true
    end

    it 'sets an active player to inactive' do
      player.switch_active
      player.switch_active
      expect(player.active).to be false
    end

  end

  describe "When dying" do

    it 'expects is_dead? to be true if health is 0' do
      player.receive_damage(100)
      expect(player.is_dead?).to be true
    end

    it 'expects is_dead? to be false if health is not 0' do
      expect(player.is_dead?).to be false
    end

  end

end
