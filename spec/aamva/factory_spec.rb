require "spec_helper"

RSpec.describe AAMVA::Factory do 
  describe ".build" do 
    it "works" do 
      string = described_class.build(:string, 'value' => "foobar")

      expect(string).to eq("foobar")
    end
  end
end 
