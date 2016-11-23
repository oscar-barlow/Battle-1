require 'player'

describe Player do

  let(:player) {described_class.new}

  it 'stores a name' do
    player.name=("Johnny")
    expect(player.name).to eq "Johnny"
  end

  it 'can overwrite a name' do
    player.name=("Johnny")
    player.name=("David")
    expect(player.name).to eq "David"
  end

  it 'should have a hit point attribute' do
    expect(player.hitpoint).to be_kind_of Numeric
  end

  it 'should reduce hitpoints by 10' do
    player.reduce_hitpoint(5)
    expect(player.hitpoint).to eq 55
  end
end
