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
          "issuer_identification_number" => '123456',
          "jurisdiction_version_number" => '99',
          "number_of_entries" => "02",
          "record_separator" => "\u001E",
          "segment_terminator" => "\u000D"
        },
        "data_elements" => {
          "DL" => {
            "DAY" => "HAZ"
          },
          "ZO" => {},
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
      string = described_class.new(data).string

      expect(string).to eq("@\n\u001E\rANSI 636023080102DL00410279ZO03200024DLDBA09142019\nDCSDECOT\nDACKYLE\nDADBRANDON\nDBD10032015\nDBB09141986\nDBC1\nDAYHAZ\nDAU070 IN\nDAG1437 CHESAPEAKE AVE\nDAICOLUMBUS\nDAJOH\nDAK432122152  \nDAQSS430403\nDCF2509UN6813300000\nDCGUSA\nDDEN\nDDFN\nDDGN\nDAZBRO\nDCIUS,OHIO\nDCJNONE\nDCUNONE\nDCE4\nDDAM\nDDB12042013\nDAW170\nDCAD\nDCBA\nDCDNONE\rZOZOAN\nZOBN\nZOE09142019\r")
    end
  end
end
