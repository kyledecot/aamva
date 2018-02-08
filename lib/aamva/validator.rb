# frozen_string_literal: true

module AAMVA
  class Validator
    def initialize(standard)
      @standard = standard
    end

    def method_missing(name, *args)
      regexp(args[0], name)
    end

    # Family name truncation

    def dde(dde)
      truncation(dde)
    end

    # First name truncation

    def ddf(ddf)
      truncation(ddf)
    end

    # Middle name truncation

    def ddg(ddg)
      truncation(ddg)
    end

    # Physical Description - Eye Color

    def day(day)
      return false unless length(day, min: DAY_LENGTH, max: DAY_LENGTH)
      return false unless DAY_MAPPING.keys.include?(day)

      true
    end

    def dai(dai)
      return false unless length(dai, min: 1, max: 20)

      true
    end

    def dac(dac)
      return false unless length(dac, min: 1, max: MAX_DAC_LENGTH)

      true
    end

    private

    def regexp(value, data_element)
      info = Info.data_element(data_element)
      regexp = Regexp.new(info['regexp'])

      value.match?(regexp)
    end

    def length(value, min:, max:)
      value.length >= min && value.length <= max
    end

    def truncation(value, indicators = Info.all['truncation_indicators'])
      value.match?(/\A[#{indicators.join("")}]{1}\z/)
    end
  end
end
