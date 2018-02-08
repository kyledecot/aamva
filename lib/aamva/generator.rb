# frozen_string_literal: true

require 'faker'

module AAMVA
  class Generator
    attr_reader :standard

    def initialize(standard)
      @standard = standard
    end

    def data
      Data.new(
        header: header,
        subfile_designators: subfile_designators,
        subfiles: subfiles
      )
    end

    private

    def header
      @header ||= Header.new(
        issuer_identification_number: issuer_identification_number,
        jurisdiction_version_number: jurisdiction_version_number,
        number_of_entries:  subfiles.size
      )
    end

    def subfile_designators
      @subfile_designators ||= subfiles.map do |type, subfile|
        length = Calculator.subfile_length(
          type: type,
          data_elements: subfile.data_elements,
          data_element_separator: @standard["data_element_separator"],
          segment_terminator: @standard["segment_terminator"]
        )

        offset = Calculator.subfile_offset

        SubfileDesignator.new(
          type: type,
          length: length,
          offset: offset
        )
      end
    end

    def subfiles
      @subfiles ||= {
        "DL" => Subfile.new(
          type: "DL",
          data_elements: {
            "DBB" => dbb,
            "DBA" => dba,
            "DBD" => dbd,
            "DAJ" => daj,
            "DCF" => dcf,
            "DAI" => dai,
            "DAK" => dak,
            "DCB" => dcb,
            "DAU" => dau,
            "DCD" => dcd,
            "DAD" => dad,
            "DCS" => dcs,
            "DAQ" => daq,
            "DCG" => dcg,
            "DDE" => dde,
            "DCA" => dca,
            "DAG" => dag,
          }
        )
      }
    end

    def method_missing(name, *args)
      factory_type = Info.data_element(name)&.dig("factory", "type")

      return super if factory_type.nil?

      return Factory.build(factory_type)
    end

    def issuer_identification_number
      '123456'
    end

    def jurisdiction_version_number
      ('00'..'99').to_a.sample
    end

    def dbc
      DBC_VALUES.sample
    end

    def ddf
      Info.all['truncation_indicators'].sample
    end

    def ddg
      Info.all['truncation_indicators'].sample
    end

    # Physical Description - Eye Color

    def day
      DAY_MAPPING.keys.sample
    end

    def dac
      Faker::Name.first_name[0..MAX_DAC_LENGTH]
    end
  end
end
