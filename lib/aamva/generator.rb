require 'faker'

module Aamva
  class Generator
    def self.day
      DAY_MAPPING.keys.sample
    end

    def self.dac
      Faker::Name.first_name[0..MAX_DAC_LENGTH]
    end
  end
end
