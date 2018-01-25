# frozen_string_literal: true

require 'faker'

module AAMVA
  class Generator
    def self.dca
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(6).join('')
    end

    def self.dde
      TRUNCATION_INDICATORS.sample
    end

    def self.ddf
      TRUNCATION_INDICATORS.sample
    end

    def self.ddg
      TRUNCATION_INDICATORS.sample
    end

    def self.dca
      Faker::Date.forward.strftime(DATE_FORMATS[:usa])
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
  end
end
