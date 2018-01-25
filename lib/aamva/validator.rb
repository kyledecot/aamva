# frozen_string_literal: true

module AAMVA
  class Validator
    def self.dcs(data_element)
      data_element.match?(/\A[\w\,\']{1,40}\z/)
    end

    def self.dad(data_element)
      data_element.match?(/\A[\w\,]{1,40}\z/)
    end

    def self.dau(data_element)
      data_element.match?(/\A[\d]{3} (in|cm)\z/)
    end

    def self.dag(data_element)
      data_element.match?(/\A[\w\d\s]{1,35}\z/)
    end

    def self.dai(data_element)
      data_element.match?(/\A[\w]{1,20}\z/)
    end

    # Jurisdiction - specific vehicle class

    def self.dca(dca)
      dca.match?(/\A[\d\w]{1,6}\z/)
    end

    def self.daj(data_element)
      data_element.match?(/\A[\w]{2}\z/)
    end

    def self.dcf(data_element)
      data_element.match?(/\A[\d\w]{1,25}\z/)
    end

    def self.dak(data_element)
      data_element.match?(/\A[\d\w]{11}\z/)
    end

    # Jurisdiction - specific restriction code

    def self.dcb(dcb)
      dcb.match?(/\A[\d\w]{1,12}\z/)
    end

    # Jurisdiction - specific endorsement codes

    def self.dcd(dcd)
      dcd.match?(/\A[\d\w]{1,5}\z/)
    end

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

    # Physical Description - Eye Color

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
      return false unless DBC_VALUES.include?(dbc)

      true
    end

    def self.dcg(dcg)
      dcg.match?(/\A(#{DCG_MAPPING.keys.join("|")})\z/)
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

    def self.truncation(value, indicators = TRUNCATION_INDICATORS)
      value.match?(/\A[#{indicators.join("")}]{1}\z/)
    end
  end
end
