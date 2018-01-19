require "spec_helper"

RSpec.describe Aamva::Validator do

  # Physical Description – Eye Color

  describe ".day" do
    describe "when valid" do
      it { expect(described_class.day("HAZ")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.day("H")).to be(false) }
      it { expect(described_class.day("AAA")).to be(false) }
      it { expect(described_class.day("AAAAAA")).to be(false) }
    end
  end

  # Document Issue Date

  describe ".dbd" do
    describe "when valid" do
      it { expect(described_class.dbd("09141986")).to be(true) }
      it { expect(described_class.dbd("19860914")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.dbd("")).to be(false) }
      it { expect(described_class.dbd("09/14/1986")).to be(false) }
      it { expect(described_class.dbd("09/14/86")).to be(false) }
      it { expect(described_class.dbd("1986-09-14")).to be(false) }
    end
  end

  # Date of Birth

  describe ".dbb" do
    describe "when valid" do
      it { expect(described_class.dbb("09141986")).to be(true) }
      it { expect(described_class.dbb("19860914")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.dbb("")).to be(false) }
      it { expect(described_class.dbb("09/14/1986")).to be(false) }
      it { expect(described_class.dbb("09/14/86")).to be(false) }
      it { expect(described_class.dbb("1986-09-14")).to be(false) }
    end
  end

  # Physical Description – Sex

  describe ".dbc" do
    describe "when valid" do
      it { expect(described_class.dbc("1")).to be(true) }
      it { expect(described_class.dbc("2")).to be(true) }
      it { expect(described_class.dbc("9")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.dbc("3")).to be(false) }
    end
  end

  describe ".dcg" do
    describe "when valid" do
      it { expect(described_class.dcg("USA")).to be(true) }
      it { expect(described_class.dcg("CAN")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.dcg("")).to be(false) }
      it { expect(described_class.dcg("MEX")).to be(false) }
      it { expect(described_class.dcg("CANADA")).to be(false) }
    end
  end

  describe ".dai" do
    describe "when valid" do
      it { expect(described_class.dai("COLUMBUS")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.dai("COLUMBUSCOLUMBUSCOLUMBUS")).to be(false) }
      it { expect(described_class.dai("")).to be(false) }
    end
  end

  describe ".dac" do
    describe "when valid" do
      it { expect(described_class.dac("JOHN")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.dac("JOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHN")).to be(false) }
      it { expect(described_class.dac("")).to be(false) }
    end
  end
end
