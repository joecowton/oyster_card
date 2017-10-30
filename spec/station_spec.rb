require 'station'

describe Station do

  subject(:station) {described_class.new(:name, :zone)}

  describe "Station.new" do
    it {expect(subject).to be_an_instance_of(Station)}
  end

  describe "zone variable" do
    it { expect(subject.zone).to eq(:zone) }
  end

  describe "name variable" do
    it { expect(subject.name).to eq(:name) }
  end

end
