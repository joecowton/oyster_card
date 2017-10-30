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
    end

    it "should add 10 to balance" do
      subject.top_up(10)
      expect(subject.balance).to eq(10)
    end




end
