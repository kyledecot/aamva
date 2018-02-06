module AAMVA
  class Encoder
    def initialize(data)
      @header_data = data.fetch("header")
      @data = data
    end

    def string
      "#{header}#{subfile_designators}#{subfiles}"
    end

    def pdf417
      @pdf417 ||= begin
        require "pdf417"

        PDF417.new(string, aspect_ratio: 1, error_level: 6)
      end
    end

    def png
      @png ||= pdf417.to_chunky_png(margin: 0, x_scale: 1, y_scale: 10)
    end

    private

    def subfile_designators
      Calculator.subfile_designators(
        subfile_designators: @data.fetch("subfile_designators")
      )
    end

    def subfiles
      Calculator.subfiles(
        subfiles: @data.fetch("subfiles"),
        data_element_separator: @header_data.fetch("data_element_separator"),
        segment_terminator: @header_data.fetch("segment_terminator")
      )
    end

    def header
      Calculator.header(
        compliance_indicator: @header_data.fetch("compliance_indicator"),
        data_element_separator: @header_data.fetch("data_element_separator"),
        record_separator: @header_data.fetch("record_separator"),
        segment_terminator: @header_data.fetch("segment_terminator"),
        file_type: @header_data.fetch("file_type"),
        issuer_identification_number: @header_data.fetch("issuer_identification_number"),
        aamva_version_number: @header_data.fetch("aamva_version_number"),
        jurisdiction_version_number: @header_data.fetch("jurisdiction_version_number"),
        number_of_entries: @header_data.fetch("number_of_entries")
      )
    end
  end
end
