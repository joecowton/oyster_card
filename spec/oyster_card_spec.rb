require 'oystercard'

describe Oystercard do

  describe "#balance" do
    it "should be zero" do
      expect(subject.balance).to eq(0)
    end

  end

end
