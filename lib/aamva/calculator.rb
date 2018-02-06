module AAMVA
  class Calculator
    def self.subfile_length(type:, data_elements:, data_element_separator:, segment_terminator:)
      joined_pairs = data_elements
        .map { |k, v| "#{k}#{v}" }
        .join(data_element_separator)

      "#{type}#{joined_pairs}#{segment_terminator}".length
    end
  end
end
