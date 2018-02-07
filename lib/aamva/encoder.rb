module AAMVA
  class Encoder
    attr_reader :standard, :data

    def initialize(standard:, data:)
      @standard = standard
      @data = data
    end

    def string
      "#{header}#{subfile_designators}#{subfiles}"
    end

    def pdf417
      @pdf417 ||= begin
        require "pdf417"

        PDF417.new(string)
      end
    end

    def png
      @png ||= pdf417.to_chunky_png
    end

    private

    def header
      @header ||= Calculator.header(
        issuer_identification_number: data.header.issuer_identification_number,
        number_of_entries: data.header.number_of_entries,
        jurisdiction_version_number: data.header.jurisdiction_version_number,
        compliance_indicator: standard.spec.fetch("compliance_indicator"),
        data_element_separator: standard.spec.fetch("data_element_separator"),
        record_separator: standard.spec.fetch("record_separator"),
        segment_terminator: standard.spec.fetch("segment_terminator"),
        file_type: standard.spec.fetch("file_type"),
        aamva_version_number: standard.spec.fetch("aamva_version_number"),
      )
    end

    def subfile_designators
      @subfile_designators ||= data.subfile_designators.map do |designator|
        "#{designator.type}#{designator.offset}#{designator.length}"
      end.join("")
    end

    def subfiles
      @subfiles ||= Calculator.subfiles(
        subfiles: data.subfiles,
        data_element_separator: standard.spec.fetch("data_element_separator"),
        segment_terminator: standard.spec.fetch("segment_terminator")
      )
    end
  end
end
