require "spec_helper"

RSpec.describe AAMVA::Encoder do
  let(:standard) { AAMVA::Standard.new("2016") }
  let(:subfiles) do
    {
      "DL" => AAMVA::Subfile.new(
        type: "DL",
        data_elements: {
          "DBA" => "09142019",
          "DCS" => "DECOT",
          "DAC" => "KYLE",
          "DAD" => "BRANDON",
          "DBD" => "10032015",
          "DBB" => "09141986",
          "DBC" => "1",
          "DAY" => "HAZ",
          "DAU" => "070 IN",
          "DAG" => "1437 CHESAPEAKE AVE",
          "DAI" => "COLUMBUS",
          "DAJ" => "OH",
          "DAK" => "432122152  ",
          "DAQ" => "SS430403",
          "DCF" => "2509UN6813300000",
          "DCG" => "USA",
          "DDE" => "N",
          "DDF" => "N",
          "DDG" => "N",
          "DAZ" => "BRO",
          "DCI" => "US,OHIO",
          "DCJ" => "NONE",
          "DCU" => "NONE",
          "DCE" => "4",
          "DDA" => "M",
          "DDB" => "12042013",
          "DAW" => "170",
          "DCA" => "D",
          "DCB" => "A",
          "DCD" => "NONE"
        }
      ),
      "ZO" => AAMVA::Subfile.new(
        type: "ZO",
        data_elements: {
          "ZOA" => "N",
          "ZOB" => "N",
          "ZOE" => "09142019"
        }
      )
    }
  end
  let(:header) do
    AAMVA::Header.new(
      issuer_identification_number: '636023',
      number_of_entries: '02',
      jurisdiction_version_number: '01'
    )
  end
  let(:subfile_designators) do
    [
      AAMVA::SubfileDesignator.new(type: "DL", offset: "0041", length: '0279'),
      AAMVA::SubfileDesignator.new(type: "ZO", offset: "0320", length: '0024')
    ]
  end
  let(:data) do
    AAMVA::Data.new(
      header: header,
      subfile_designators: subfile_designators,
      subfiles: subfiles,
    )
  end
  let(:encoder) do
    described_class.new(
      standard: standard,
      data: data,
    )
  end

  describe "#format" do
    describe "when supported format" do
      it "it does not raise" do
        expect do
          encoder.format(:string)
        end.to_not raise_error
      end

      describe "when :string" do
        it "encodes correctly" do
          expect(encoder.format(:string)).to eq("@\n\u001E\rANSI 636023080102DL00410279ZO03200024DLDBA09142019\nDCSDECOT\nDACKYLE\nDADBRANDON\nDBD10032015\nDBB09141986\nDBC1\nDAYHAZ\nDAU070 IN\nDAG1437 CHESAPEAKE AVE\nDAICOLUMBUS\nDAJOH\nDAK432122152  \nDAQSS430403\nDCF2509UN6813300000\nDCGUSA\nDDEN\nDDFN\nDDGN\nDAZBRO\nDCIUS,OHIO\nDCJNONE\nDCUNONE\nDCE4\nDDAM\nDDB12042013\nDAW170\nDCAD\nDCBA\nDCDNONE\rZOZOAN\nZOBN\nZOE09142019\r")
        end
      end
    end

    describe "when unsupported format" do
      it "raises" do
        expect do
          encoder.format(:invalid)
        end.to raise_error(AAMVA::Encoder::UnsupportedFormat)
      end
    end
  end
end
