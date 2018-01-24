require "spec_helper"

RSpec.describe Aamva::Validator do

  describe ".dde" do
    describe "when valid" do
      it { expect(described_class.dde("T")).to be(true) }
      it { expect(described_class.dde("N")).to be(true) }
      it { expect(described_class.dde("U")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.dde("")).to be(false) }
      it { expect(described_class.dde("K")).to be(false) }
    end
  end


  describe ".ddf" do
    describe "when valid" do
      it { expect(described_class.ddf("T")).to be(true) }
      it { expect(described_class.ddf("N")).to be(true) }
      it { expect(described_class.ddf("U")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.ddf("")).to be(false) }
      it { expect(described_class.ddf("K")).to be(false) }
    end
  end

  describe ".ddg" do
    describe "when valid" do
      it { expect(described_class.ddg("T")).to be(true) }
      it { expect(described_class.ddg("N")).to be(true) }
      it { expect(described_class.ddg("U")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.ddg("")).to be(false) }
      it { expect(described_class.ddg("K")).to be(false) }
    end
  end

  # Customer ID Number

  describe ".daq" do
    describe "when valid" do
      it { expect(described_class.daq("T64235789")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.daq("")).to be(false) }
    end
  end

  # Document Expiration Date

  describe ".dba" do
    describe "when valid" do
      it { expect(described_class.dba("09141986")).to be(true) }
      it { expect(described_class.dba("19860914")).to be(true) }
    end

    describe "when invalid" do
      it { expect(described_class.dba("")).to be(false) }
      it { expect(described_class.dba("09/14/1986")).to be(false) }
      it { expect(described_class.dba("09/14/86")).to be(false) }
      it { expect(described_class.dba("1986-09-14")).to be(false) }
    end
  end

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
