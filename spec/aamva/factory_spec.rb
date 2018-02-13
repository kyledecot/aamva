require "spec_helper"

RSpec.describe AAMVA::Factory do 
  describe ".string" do 
    it "works" do 
      string = described_class.string(:value => "foobar")

      expect(string).to eq("foobar")
    end
  end
end 
