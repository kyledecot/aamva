require "spec_helper"

RSpec.describe AAMVA::Encoder do
  describe ".string" do
    let(:data) do
      {
        "header" => {
          "aamva_version_number" => '08',
          "compliance_indicator" => "@",
          "data_element_separator" => "\u000A",
          "file_type" => "ANSI ",
          "issuer_identification_number" => '636023',
          "jurisdiction_version_number" => '01',
          "number_of_entries" => "02",
          "record_separator" => "\u001E",
          "segment_terminator" => "\u000D"
        },
        "subfiles" => {

        },
        "subfile_designators" => {
          "DL" => {
            "offset" => "0041",
            "length" => "0279"
          },
          "ZO" => {
            "offset" => "0320",
            "length" => "0024"
          }
        }
      }
    end

    it "encodes correctly" do
      standard = AAMVA::Standard.new("2016")

      subfiles =  {
        "DL" => AAMVA::Subfile.new(
          standard: standard,
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
          standard: standard,
          type: "ZO",
          data_elements: {
            "ZOA" => "N",
            "ZOB" => "N",
            "ZOE" => "09142019"
          }
        )
      }

      header = AAMVA::Header.new(
        standard: standard,
        issuer_identification_number: data["header"]["issuer_identification_number"],
        number_of_entries: data["header"]["number_of_entries"],
        jurisdiction_version_number: data["header"]["jurisdiction_version_number"]
      )

      subfile_designators = data["subfile_designators"].map do |type, designations|
        AAMVA::SubfileDesignator.new(
          type: type,
          length: designations["length"],
          offset: designations["offset"]
        )
      end

      data = AAMVA::Data.new(
        header: header,
        subfile_designators: subfile_designators,
        subfiles: subfiles,
      )

      string = described_class.new(
        standard: standard,
        data: data,
      ).string

      expect(string).to eq("@\n\u001E\rANSI 636023080102DL00410279ZO03200024DLDBA09142019\nDCSDECOT\nDACKYLE\nDADBRANDON\nDBD10032015\nDBB09141986\nDBC1\nDAYHAZ\nDAU070 IN\nDAG1437 CHESAPEAKE AVE\nDAICOLUMBUS\nDAJOH\nDAK432122152  \nDAQSS430403\nDCF2509UN6813300000\nDCGUSA\nDDEN\nDDFN\nDDGN\nDAZBRO\nDCIUS,OHIO\nDCJNONE\nDCUNONE\nDCE4\nDDAM\nDDB12042013\nDAW170\nDCAD\nDCBA\nDCDNONE\rZOZOAN\nZOBN\nZOE09142019\r")
    end
  end
end
