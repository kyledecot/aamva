# frozen_string_literal: true

require 'faker'

module AAMVA
  class Generator
    attr

    def initialize(standard)
      @standard = standard
    end

    def dl
      Data.new(
        header: header,
        subfile_designators: subfile_designators,
        subfiles: subfiles
      )
    end

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
          data_element_separator: @standard.spec["data_element_separator"],
          segment_terminator: @standard.spec["segment_terminator"]
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

    def issuer_identification_number
      '123456'
    end

    def jurisdiction_version_number
      ('00'..'99').to_a.sample
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
