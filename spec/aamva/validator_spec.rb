require "spec_helper"

RSpec.describe Aamva::Validator do
  describe ".day" do
    describe "when valid" do
      it { expect(described_class.day("HAZ")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.day("H")).to be(false) }
      it { expect(described_class.day("AAA")).to be(false) }
    end
  end
end
