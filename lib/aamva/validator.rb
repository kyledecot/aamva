module Aamva
  class Validator
    def self.day(day)
      return false unless day.length == DAY_LENGTH
      return false unless DAY_MAPPING.keys.include?(day)

      true
    end
  end
end
