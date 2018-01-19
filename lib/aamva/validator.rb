module Aamva
  class Validator

    # Physical Description – Eye Color

    def self.day(day)
      return false unless length(day, min: DAY_LENGTH, max: DAY_LENGTH)
      return false unless DAY_MAPPING.keys.include?(day)

      true
    end

    # Document Issue Date

    def self.dbd(dbd)
      dbd.match?(/\A[\d+]{8,8}\z/)
    end

    # Date of Birth

    def self.dbb(dbb)
      dbb.match?(/\A[\d+]{8,8}\z/)
    end

    def self.dbc(dbc)
      return false unless length(dbc, min: 1, max: 1)
      return false unless DBC_MAPPING.keys.include?(dbc)

      true
    end

    def self.dcg(dcg)
      return false unless length(dcg, min: 3, max: 3)
      return false unless DCG_MAPPING.keys.include?(dcg)

      true
    end

    def self.dai(dai)
      return false unless length(dai, min: 1, max: 20)

      true
    end

    def self.dac(dac)
      return false unless length(dac, min: 1, max: MAX_DAC_LENGTH)

      true
    end

    private

    def self.length(value, min:, max:)
      value.length >= min && value.length <= max
    end
  end
end
