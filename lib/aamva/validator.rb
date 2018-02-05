# frozen_string_literal: true

module AAMVA
  class Validator
    def self.method_missing(name, *args)
      regexp(args[0], name)
    end

    ##############################

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

    def self.dbc(dbc)
      return false unless length(dbc, min: 1, max: 1)
      return false unless DBC_VALUES.include?(dbc)

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

    def self.regexp(value, data_element)
      info = Info.data_element(data_element)
      regexp = Regexp.new(info['regexp'])

      value.match?(regexp)
    end

    def self.length(value, min:, max:)
      value.length >= min && value.length <= max
    end

    def self.truncation(value, indicators = Info.all['truncation_indicators'])
      value.match?(/\A[#{indicators.join("")}]{1}\z/)
    end
  end
end
