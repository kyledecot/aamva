module AAMVA
  class Header
    attr_reader :standard, :number_of_entries, :jurisdiction_version_number, :issuer_identification_number

    def initialize(standard:, number_of_entries:, jurisdiction_version_number:, issuer_identification_number:)
      @standard = standard
      @number_of_entries = number_of_entries
      @jurisdiction_version_number = jurisdiction_version_number
      @issuer_identification_number = issuer_identification_number
    end

    def ==(other)
      standard == other.standard &&
        number_of_entries == other.number_of_entries &&
        jurisdiction_version_number == other.jurisdiction_version_number &&
        issuer_identification_number == other.issuer_identification_number
    end

    def string
      Calculator.header(
        issuer_identification_number: @issuer_identification_number,
        number_of_entries: @number_of_entries,
        jurisdiction_version_number: @jurisdiction_version_number,
        compliance_indicator: @standard.spec.fetch("compliance_indicator"),
        data_element_separator: @standard.spec.fetch("data_element_separator"),
        record_separator: @standard.spec.fetch("record_separator"),
        segment_terminator: @standard.spec.fetch("segment_terminator"),
        file_type: @standard.spec.fetch("file_type"),
        aamva_version_number: @standard.spec.fetch("aamva_version_number"),
      )
    end
  end
end
