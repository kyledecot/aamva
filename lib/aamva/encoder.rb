module AAMVA
  class Encoder
    def initialize(data:, header:)
      @header_data = data.fetch("header")
      @data = data
      @header = header
    end

    def string
      "#{@header.string}#{subfile_designators}#{subfiles}"
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
  end
end
