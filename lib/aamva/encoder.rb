module AAMVA
  class Encoder
    attr_reader :data

    def initialize(data)
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
      data.fetch("subfile_designators").map do |type, designations|
        subfile_designator(type, designations)
      end.join("")
    end

    def subfile_designator(type, designations)
      offset = designations.fetch("offset")
      length = designations.fetch("length")

      "#{type}#{offset}#{length}"
    end

    def header_data
      data.fetch("header")
    end

    def subfiles
      Calculator.subfiles(
        subfiles: data.fetch("subfiles"),
        data_element_separator: header_data.fetch("data_element_separator"),
        segment_terminator: header_data.fetch("segment_terminator")
      )
    end

    def header
      Calculator.header(
        compliance_indicator: header_data.fetch("compliance_indicator"),
        data_element_separator: header_data.fetch("data_element_separator"),
        record_separator: header_data.fetch("record_separator"),
        segment_terminator: header_data.fetch("segment_terminator"),
        file_type: header_data.fetch("file_type"),
        issuer_identification_number: header_data.fetch("issuer_identification_number"),
        aamva_version_number: header_data.fetch("aamva_version_number"),
        jurisdiction_version_number: header_data.fetch("jurisdiction_version_number"),
        number_of_entries: header_data.fetch("number_of_entries")
      )
    end

    def join(items, separator = "")
      items.join(separator)
    end
  end
end
