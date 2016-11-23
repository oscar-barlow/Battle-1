describe Player do

  subject(:player) {described_class.new("Dines")}

  describe 'create a player' do
    it 'should have a name' do
      expect(player.name).to eq "Dines"
    end
  end

end
