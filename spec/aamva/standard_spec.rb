require "spec_helper"

RSpec.describe AAMVA::Standard do
  describe ".initialize" do
    describe "when standard is supported" do
      it "does not raise" do
        expect do
          described_class.new("2016")
        end.to_not raise_error
      end
    end

    describe "when standard is not supported" do
      it "raises" do
        expect do
          described_class.new("FOOBAR")
        end.to raise_error(AAMVA::Standard::UnsupportedStandard)
      end
    end
  end
end
