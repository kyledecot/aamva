# frozen_string_literal: true

module AAMVA
  class Validator
    def initialize(standard)
      @standard = standard
    end

    def method_missing(name, *args)
      regexp(args[0], name)
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
      info = @standard.data_element(data_element)
      regexp = Regexp.new(info['regexp'])

      value.match?(regexp)
    end

    def length(value, min:, max:)
      value.length >= min && value.length <= max
    end
  end
end
