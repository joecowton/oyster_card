require 'oystercard'

describe Oystercard do
  describe "#balance" do
    it "should be zero" do
      expect(subject.balance).to eq(0)
    end
  end

  describe  "#top_up" do
    it "should take an arguement and add to the balance" do
        expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "should add 10 to balance" do
      subject.top_up(10)
      expect(subject.balance).to eq(10)
    end

    it "should raise error if top up exceeds balance limit" do
      expect{subject.top_up(100)}.to raise_error("Exceeds balance limit of £#{Oystercard::MAXIMUM_LIMIT}")
    end
  end

  describe "MAXIMUM_LIMIT" do
    it { expect(Oystercard::MAXIMUM_LIMIT).to eq(90) }
  end

end
