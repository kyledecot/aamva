module AAMVA
  class Calculator
    def self.subfile(type:, data_elements:, data_element_separator:, segment_terminator:)
      joined_pairs = data_elements
        .map { |k, v| "#{k}#{v}" }
        .join(data_element_separator)

      "#{type}#{joined_pairs}#{segment_terminator}"
    end

    def self.subfiles(subfiles:, data_element_separator:, segment_terminator:)
      subfiles.map do |type, data_elements|
        Calculator.subfile(
          type: type,
          data_elements: data_elements,
          data_element_separator: data_element_separator,
          segment_terminator: segment_terminator
        )
      end.join("")
    end

    def self.header(compliance_indicator:, data_element_separator:, record_separator:, segment_terminator:, file_type:, issuer_identification_number:, aamva_version_number:, jurisdiction_version_number:, number_of_entries:)
      [
        compliance_indicator,
        data_element_separator,
        record_separator,
        segment_terminator,
        file_type,
        issuer_identification_number,
        aamva_version_number,
        jurisdiction_version_number,
        number_of_entries
      ].join("")
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
