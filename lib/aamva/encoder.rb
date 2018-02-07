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

        PDF417.new(string, aspect_ratio: 1, error_level: 6)
      end
    end

    def png
      @png ||= pdf417.to_chunky_png(margin: 0, x_scale: 1, y_scale: 10)
    end

    private

    def header
      @header ||= @data.header.string
    end

    def subfile_designators
      @subfile_designators ||= data.subfile_designators.map do |designator|
        "#{designator.type}#{designator.offset}#{designator.length}"
      end.join("")
    end

    def subfiles
      @subfiles ||= Calculator.subfiles(
        subfiles: @data.subfiles,
        data_element_separator: @standard.spec.fetch("data_element_separator"),
        segment_terminator: @standard.spec.fetch("segment_terminator")
      )
    end
  end
end
