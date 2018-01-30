# frozen_string_literal: true

require 'faker'

module AAMVA
  class Generator
    COMPLIANCE_INDICATOR = "@"
    DATA_ELEMENT_SEPARATOR = "\n"
    RECORD_SEPARATOR = "\r"
    SEGMENT_TERMINATOR = "\r"
    FILE_TYPE = "ANSI "

    def self.dl
    end

    def self.issuer_identification_number
      "123456"
    end

    def self.jurisdiction_version_number
      "99"
    end

    def self.number_of_entries
      "1"
    end

    def self.subfile_type
      "DL"
    end

    def self.offset
      "4"
    end

    def self.length
      "1"
    end

    def self.dcb
      UPPER_ALPHA_CHARACTERS.sample(12).join('')
    end

    def self.dcd
      UPPER_ALPHA_CHARACTERS.sample(5).join('')
    end

    def self.dbc
      DBC_VALUES.sample
    end

    def self.dba
      Faker::Date.forward.strftime(DATE_FORMATS[:usa])
    end

    def self.dcs
      truncate(Faker::Name.last_name, length: 40)
    end

    def self.dad
      truncate(Faker::Name.first_name, length: 40)
    end

     def self.dau
       height = ("000".."999").to_a.sample

       "#{height} #{LENGTH_UNITS.first}"
    end

    def self.dag
      truncate(Faker::Address.street_address, length: 35)
    end

    def self.dai
      truncate(Faker::Address.city, length: 20)
    end

    def self.daj
      chars = ('A'..'Z').to_a

      chars.sample(2).join('')
    end

    def self.dca
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(6).join('')
    end

    def self.dcf
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(25).join('')
    end

    def self.dak
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(11).join('')
    end

    def self.dde
      Info.all["truncation_indicators"].sample
    end

    def self.ddf
      Info.all["truncation_indicators"].sample
    end

    def self.ddg
      Info.all["truncation_indicators"].sample
    end


    def self.dcg
      DCG_MAPPING.keys.sample
    end

    # Customer ID Number

    def self.daq
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(25).join('')
    end

    # Physical Description - Eye Color

    def self.day
      DAY_MAPPING.keys.sample
    end

    def self.dac
      Faker::Name.first_name[0..MAX_DAC_LENGTH]
    end

    # Date of Birth

    def self.dbb
      Faker::Date.birthday.strftime(DATE_FORMATS[:usa])
    end

    # Document Issue Date

    def self.dbd
      Faker::Date.backward.strftime(DATE_FORMATS[:usa])
    end

    private

    def self.truncate(data_element, length:)
      data_element[0, length - 1]
    end
  end
end
