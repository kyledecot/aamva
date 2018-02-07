# frozen_string_literal: true

require 'faker'

module AAMVA
  class Generator
    def initialize(standard)
      @standard = standard
    end

    def dl
      {
        "header" => header,
        "subfile_designators" => subfile_designators,
        "subfiles" => subfiles
      }
    end

    def subfiles
      @subfiles ||= {
        "DL" => {
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
          "dag" => dag,
        }
      }
    end

    def header
      @header ||= {
        "aamva_version_number" => aamva_version_number,
        "compliance_indicator" => compliance_indicator,
        "data_element_separator" => data_element_separator,
        "file_type" => file_type,
        "issuer_identification_number" => issuer_identification_number,
        "jurisdiction_version_number" => jurisdiction_version_number,
        "number_of_entries" => number_of_entries(subfiles),
        "record_separator" => record_separator,
        "segment_terminator" => segment_terminator,
      }
    end

    def subfile_designators
      @subfile_designators ||= subfiles.map do |type, elements|
        length = Calculator.subfile_length(
          type: type,
          data_elements: elements,
          data_element_separator: header["data_element_separator"],
          segment_terminator: header["segment_terminator"]
        )

        offset = Calculator.subfile_offset

        SubfileDesignator.new(
          type: type,
          length: length,
          offset: offset
        )
      end
    end

    def file_type
      @standard.spec["file_type"]
    end

    def data_element_separator
      @standard.spec["data_element_separator"]
    end

    def segment_terminator
      @standard.spec["segment_terminator"]
    end

    def record_separator
      @standard.spec["record_separator"]
    end

    def compliance_indicator
      @standard.spec["compliance_indicator"]
    end

    def issuer_identification_number
      '123456'
    end

    def jurisdiction_version_number
      '99'
    end

    def aamva_version_number
      @standard.spec["aamva_version_number"]
    end

    def number_of_entries(subfiles)
      "#{subfiles.size}".rjust(2, "0")
    end

    def subfile_type
      'DL'
    end

    def offset
      '4'
    end

    def length
      '1'
    end

    def dcb
      UPPER_ALPHA_CHARACTERS.sample(12).join('')
    end

    def dcd
      UPPER_ALPHA_CHARACTERS.sample(5).join('')
    end

    def dbc
      DBC_VALUES.sample
    end

    def dba
      Faker::Date.forward.strftime(DATE_FORMATS[:usa])
    end

    def dcs
      truncate(Faker::Name.last_name, length: 40)
    end

    def dad
      truncate(Faker::Name.first_name, length: 40)
    end

    def dau
      height = ('000'..'999').to_a.sample

      "#{height} #{LENGTH_UNITS.first}"
   end

    def dag
      truncate(Faker::Address.street_address, length: 35)
    end

    def dai
      truncate(Faker::Address.city, length: 20)
    end

    def daj
      chars = ('A'..'Z').to_a

      chars.sample(2).join('')
    end

    def dca
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(6).join('')
    end

    def dcf
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(25).join('')
    end

    def dak
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(11).join('')
    end

    def dde
      Info.all['truncation_indicators'].sample
    end

    def ddf
      Info.all['truncation_indicators'].sample
    end

    def ddg
      Info.all['truncation_indicators'].sample
    end

    def dcg
      DCG_MAPPING.keys.sample
    end

    # Customer ID Number

    def daq
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(25).join('')
    end

    # Physical Description - Eye Color

    def day
      DAY_MAPPING.keys.sample
    end

    def dac
      Faker::Name.first_name[0..MAX_DAC_LENGTH]
    end

    # Date of Birth

    def dbb
      Faker::Date.birthday.strftime(DATE_FORMATS[:usa])
    end

    # Document Issue Date

    def dbd
      Faker::Date.backward.strftime(DATE_FORMATS[:usa])
    end

    private

    def truncate(data_element, length:)
      data_element[0, length - 1]
    end
  end
end
