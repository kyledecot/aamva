require "spec_helper"

RSpec.describe Aamva::Generator do
  describe ".day" do
    describe "with no options" do
      it { expect(described_class.day).to be_a_valid_day }
    end
  end
end
