# frozen_string_literal: true

module AAMVA
  class Decoder
    attr_reader :standard, :barcode

    def initialize(standard, barcode)
      @standard = standard
      @barcode = barcode
    end

    def data
      @data ||= Data.new(
        header: header,
        subfile_designators: subfile_designators,
        subfiles: subfiles
      )
    end

    private

    def data_elements(subfile_designator)
      @barcode
        .byteslice(subfile_designator.offset, subfile_designator.length)
        .slice((subfile_designator.type).length..-1)
        .chomp("\r") # TODO
        .split("\n") # TODO
        .map { |r| [r[0, 3], r[3..-1]] }
    end

    def header_match
      @barcode.match(standard.spec["header_regexp"])
    end

    def header
      @header ||= Header.new(
        number_of_entries: number_of_entries,
        jurisdiction_version_number: jurisdiction_version_number,
        issuer_identification_number: issuer_identification_number
      )
    end

    def subfiles
      subfile_designators.map do |subfile_designator|
        Subfile.new(
          type: subfile_designator.type,
          data_elements: data_elements(subfile_designator)
        )
      end
    end

    def subfile_designators
      @barcode
        .scan(@standard.spec["subfile_designator_regexp"])
        .map do |_, type, offset, length|
          SubfileDesignator.new(
            type: type,
            offset: offset.to_i,
            length: length.to_i
          )
      end
    end

    def aamva_version_number
      header_match&.[]("aamva_version_number")
    end

    def issuer_identification_number
      header_match&.[]("issuer_identification_number")
    end

    def jurisdiction_version_number
      header_match&.[]("jurisdiction_version_number")
    end

    def number_of_entries
      header_match&.[]("number_of_entries")
    end
  end
end
