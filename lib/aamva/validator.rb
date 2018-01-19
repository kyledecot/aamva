module Aamva
  class Validator
    def self.day(day)
      return false unless day.length == DAY_LENGTH
      return false unless DAY_MAPPING.keys.include?(day)

      true
    end

    def self.dac(dac)
      return false unless dac.length <= MAX_DAC_LENGTH
      # TODO Validate ANS

      return true
    end
  end
end
