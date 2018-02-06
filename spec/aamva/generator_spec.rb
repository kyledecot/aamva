# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Generator do
  let(:standard) { AAMVA::Standard.new("2016") }
  let(:generator) { described_class.new(standard) }

  AAMVA::Info.required_data_elements.each do |data_element|
    describe "##{data_element}" do
      describe 'with no options' do
        it { expect(generator.public_send(data_element)).to be_a_valid_data_element(data_element) }
      end
    end
  end

  describe "#header" do
    it "generates successfully" do
      expect(generator.header).to eq(
        "issuer_identification_number" => '123456',
        "aamva_version_number" => '08',
        "jurisdiction_version_number" => '99',
        "number_of_entries" => '01',
        "compliance_indicator" => standard.spec["compliance_indicator"],
        "data_element_separator" => standard.spec["data_element_separator"],
        "record_separator" => standard.spec["record_separator"],
        "segment_terminator" => standard.spec["segment_terminator"]
      )
    end
  end

  describe "#subfile_designators" do
    it "generates successfully" do
      data_elements = generator.data_elements

      expect(generator.subfile_designators).to eq(
        "DL" => {
          "length" => "TODO",
          "offset" => "TODO"
        }
      )
    end
  end
end
