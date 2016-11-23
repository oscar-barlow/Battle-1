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

end
