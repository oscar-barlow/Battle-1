require 'player'

describe Player do

  let(:player) {described_class.new}

  describe '#name' do
  it 'stores a name' do
    player.name=("Johnny")
    expect(player.name).to eq "Johnny"
  end

  it 'can overwrite a name' do
    player.name=("Johnny")
    player.name=("David")
    expect(player.name).to eq "David"
  end
end

describe '#hitpoints' do
  it 'should have a hit point attribute' do
    expect(player.hitpoints).to be_kind_of Numeric
  end

  it 'should reduce hitpoints' do
    player.reduce_hitpoints(5)
    expect(player.hitpoints).to eq 55
  end
end

describe '#attack' do
  it "should reduce another player's hitpoints by 10 when you attack them" do
    another_player = Player.new
    expect{ player.attack(another_player) }.to change{ another_player.hitpoints }.by(-10)
  end
end

  describe 'Errors' do
    it 'should raise and error if you reduce points by a negative number' do
      message = "You can't reduce hitpoints and end up with more hitpoints"
      expect{ player.reduce_hitpoints(-5) }.to raise_error(RuntimeError, message)
    end
  end
end
