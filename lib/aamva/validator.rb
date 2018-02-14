# frozen_string_literal: true

module AAMVA
  class Validator
    def initialize(standard)
      @standard = standard
    end

    def valid?(data_element, value)
      info = @standard.data_element(data_element)

      value.match?(Regexp.new(info['regexp']))
    end
  end
end
