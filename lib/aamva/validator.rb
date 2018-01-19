module Aamva
  class Validator
    def self.day(day)
      return false unless length(day, min: DAY_LENGTH, max: DAY_LENGTH)
      return false unless DAY_MAPPING.keys.include?(day)

      true
    end

    def self.dac(dac)
      return false unless length(dac, min: 1, max: MAX_DAC_LENGTH)
      # TODO Validate ANS

      return true
    end

    private

    def self.length(value, min:, max:)
      value.length >= min && value.length <= max
    end
  end
end
