require 'spec_helper'

RSpec.describe AAMVA::Decoder do
  let(:barcode) { "@\n\rANSI 636023080102DL00410279ZO03200024DLDBA09142019\nDCSDECOT\nDACKYLE\nDADBRANDON\nDBD10032015\nDBB09141986\nDBC1\nDAYHAZ\nDAU070 IN\nDAG1437 CHESAPEAKE AVE\nDAICOLUMBUS\nDAJOH\nDAK432122152  \nDAQSS430403\nDCF2509UN6813300000\nDCGUSA\nDDEN\nDDFN\nDDGN\nDAZBRO\nDCIUS,OHIO\nDCJNONE\nDCUNONE\nDCE4\nDDAM\nDDB12042013\nDAW170\nDCAD\nDCBA\nDCDNONE\rZOZOAN\nZOBN\nZOE09142019\r" }
  let(:spec) { YAML.load_file(File.expand_path("../../../lib/aamva/data/info/2016.yml", __FILE__))}


  describe ".day" do
    it { expect(described_class.new(spec, barcode).day).to eq('HAZ') }
  end

  describe ".dcs" do
    it { expect(described_class.new(spec, barcode).dcs).to eq('DECOT') }
  end

  describe ".dac" do
    it { expect(described_class.new(spec, barcode).dac).to eq('KYLE') }
  end

  describe ".dad" do
    it { expect(described_class.new(spec, barcode).dad).to eq('BRANDON') }
  end

  # describe ".dba" do
  #   it { expect(described_class.new(spec, barcode).dba).to eq('09142019') }
  # end
end
