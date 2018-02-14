module AAMVA
  class Calculator
    def self.subfile(type:, data_elements:, data_element_separator:, segment_terminator:)
      joined_pairs = data_elements
        .map { |k, v| "#{k}#{v}" }
        .join(data_element_separator)

      "#{type}#{joined_pairs}#{segment_terminator}"
    end

    def self.subfiles(subfiles:, data_element_separator:, segment_terminator:)
      subfiles.map do |type, subfile|
        subfile(
          type: type,
          data_elements: subfile.data_elements,
          data_element_separator: data_element_separator,
          segment_terminator: segment_terminator
        )
      end.join("")
    end

    def self.subfile_offset
      "TODO"
    end

    def self.subfile_length(type:, data_elements:, data_element_separator:, segment_terminator:)
      subfile(
        type: type,
        data_elements: data_elements,
        data_element_separator: data_element_separator,
        segment_terminator: segment_terminator
      ).length
    end
  end
end
