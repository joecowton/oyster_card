require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe "#balance" do
    it "should be zero" do
      expect(subject.balance).to eq(10)
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

  describe "#deduct" do
    it "should deduct £4 from oystercard" do
      expect(subject.deduct(4)).to eq(6)
    end
  end

  describe "#in_journey?" do
    it "should return true or false" do
      expect(subject.in_journey?).to be(true).or be(false)
    end
  end

  describe "#touch_in" do
    it "should make journey equal true" do
      subject.touch_in
      expect(subject.in_journey?).to be(true)
    end
  end

  describe "#touch_out" do
    it "should make journey equal false" do
      subject.touch_out
      expect(subject.in_journey?).to be(false)
    end

  end

  describe "MAXIMUM_LIMIT" do
    it { expect(Oystercard::MAXIMUM_LIMIT).to eq(90) }
  end

end
