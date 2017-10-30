require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:oyster_1) { Oystercard.new(0) }
  let(:station) { double :station }
  let(:entry_station) { double :station }
  let(:exit_station)  { double :station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }


  describe "#balance" do
    it "should be zero" do
      expect(subject.balance).to eq(10)
    end
  end

  describe '#journeys' do
    it "should initialize as empty array" do
      expect(subject.journeys).to eq({})
    end

    it 'should store a journey' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey
    end
  end

  describe  "#top_up" do
    it "should take an arguement and add to the balance" do
        expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "should add 10 to balance" do
      subject.top_up(10)
      expect(subject.balance).to eq(20)
    end

    it "should raise error if top up exceeds balance limit" do
      expect{subject.top_up(100)}.to raise_error("Exceeds balance limit of £#{Oystercard::MAXIMUM_LIMIT}")
    end
  end

  describe "#in_journey?" do
    it "should return true " do
      subject.touch_in(station)
      expect(subject.in_journey?).to be(true)
    end

    it "should return false" do
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.in_journey?).to be(nil)
    end
  end

  describe "#touch_in" do
    it "should raise error if balance is less than 1" do
      expect{oyster_1.touch_in(station)}.to raise_error("Minimum required is £#{Oystercard::MINIMUM_AMOUNT}")
    end


    it "should remember touch in station" do
      subject.touch_in(station)
      expect(subject.entry_station).to eq(station)
    end
  end

  describe "#touch_out" do
    it "should make journey equal false" do
      subject.touch_out(station)
      expect(subject.in_journey?).to be(nil)
    end

    it "should deduct £4 from balance" do
      expect { subject.touch_out(station) }.to change {subject.balance}.by(-4)
    end

    it "should set entry station to nil" do
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject.entry_station).to eq(nil)
    end

  end

  describe "#entry_station" do
    it "should be station touched in at" do
      subject.touch_in(station)
      expect(subject.entry_station).to eq(station)
    end
  end

  describe "MAXIMUM_LIMIT" do
    it { expect(Oystercard::MAXIMUM_LIMIT).to eq(90) }
  end

  describe "MINIMUM_AMOUNT" do
    it { expect(Oystercard::MINIMUM_AMOUNT).to eq(1) }
  end

end
