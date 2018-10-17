# frozen_string_literal: true

module AAMVA
  class Encoder
    class UnsupportedFormat < ArgumentError
    end

    FORMATS = %w[string png].freeze

    attr_reader :standard, :data

    def initialize(standard:, data:)
      @standard = standard
      @data = data
    end

    def format(format)
      raise UnsupportedFormat unless FORMATS.include?(format)

      send(format)
    end

    private

    def string
      "#{header}#{subfile_designators}#{subfiles}"
    end

    def pdf417
      @pdf417 ||= begin
        require 'pdf417'

        PDF417.new(string)
      end
    end

    def png
      @png ||= pdf417.to_chunky_png
    end

    def header
      @header ||= begin
        [
          standard.spec.fetch('compliance_indicator'),
          standard.spec.fetch('data_element_separator'),
          standard.spec.fetch('record_separator'),
          standard.spec.fetch('segment_terminator'),
          standard.spec.fetch('file_type'),
          data.header.issuer_identification_number,
          standard.spec.fetch('aamva_version_number'),
          data.header.jurisdiction_version_number,
          data.header.number_of_entries
        ].join('')
      end
    end

    def subfile_designators
      @subfile_designators ||= data.subfile_designators.map do |designator|
        "#{designator.type}#{designator.offset}#{designator.length}"
      end.join('')
    end

    def subfiles
      @subfiles ||= Calculator.subfiles(
        subfiles: data.subfiles,
        data_element_separator: standard.spec.fetch('data_element_separator'),
        segment_terminator: standard.spec.fetch('segment_terminator')
      )
    end
  end
end
