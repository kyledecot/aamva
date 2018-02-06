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
      join(data.fetch("subfile_designators").map do |type, designations|
        subfile_designator(type, designations)
      end)
    end

    def subfile_designator(type, designations)
      offset = designations.fetch("offset")
      length = designations.fetch("length")

      "#{type}#{offset}#{length}"
    end

    def subfiles
      join(data.fetch("subfiles").map do |type, data_elements|
        subfile(type, data_elements)
      end)
    end

    def subfile(type, data_elements)
      joined_pairs = data_elements
        .map { |k, v| "#{k}#{v}" }
        .join(data["header"]["data_element_separator"])

      "#{type}#{joined_pairs}#{data["header"]["segment_terminator"]}"
    end

    def header
      header_data = data.fetch("header")

      join([
        header_data.fetch("compliance_indicator"),
        header_data.fetch("data_element_separator"),
        header_data.fetch("record_separator"),
        header_data.fetch("segment_terminator"),
        header_data.fetch("file_type"),
        header_data.fetch("issuer_identification_number"),
        header_data.fetch("aamva_version_number"),
        header_data.fetch("jurisdiction_version_number"),
        header_data.fetch("number_of_entries")
      ])
    end

    def join(items, separator = "")
      items.join(separator)
    end
  end
end
