require 'station'

describe Station do
  subject {described_class.new(:Waterloo)}

  describe 'creates with' do
    context 'name which' do
       it "is Waterloo" do
         expect(subject.name).to eq(:Waterloo)
       end
    end

    context 'zone which' do
      it 'is 1' do
        expect(subject.zone).to eq(1)
      end
    end
  end
end
#
# let(:entry_station) { double :station }
# let(:exit_station) { double :station }
#
# it 'stores exit station' do
#   subject.touch_in(entry_station)
#   subject.touch_out(exit_station)
#   expect(subject.exit_station).to eq exit_station
# end
