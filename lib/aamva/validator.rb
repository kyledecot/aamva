module Aamva
  class Validator

    # Family name truncation

    def self.dde(dde)
      truncation(dde)
    end

    # First name truncation

    def self.ddf(ddf)
      truncation(ddf)
    end

    # Middle name truncation

    def self.ddg(ddg)
      truncation(ddg)
    end

    # Physical Description – Eye Color

    def self.day(day)
      return false unless length(day, min: DAY_LENGTH, max: DAY_LENGTH)
      return false unless DAY_MAPPING.keys.include?(day)

      true
    end

    # Document Expiration Date

    def self.dba(dbd)
      dbd.match?(/\A[\d+]{8,8}\z/)
    end

    # Customer ID Number

    def self.daq(daq)
      daq.match?(/\A[\d\w]{1,25}\z/)
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

    def self.length(value, min:, max:)
      value.length >= min && value.length <= max
    end

    private

    def self.truncation(value)
      value.match?(/\A[NTU]{1}\z/)
    end
  end
end
