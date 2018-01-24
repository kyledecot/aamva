# frozen_string_literal: true

require 'faker'

module Aamva
  class Generator
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
      Faker::Date.birthday.strftime('%Y%m%d')
    end

    # Document Issue Date

    def self.dbd
      Faker::Date.backward.strftime('%Y%m%d')
    end
  end
end
