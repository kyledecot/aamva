# frozen_string_literal: true

module AAMVA
  class Decoder
    def initialize(standard, barcode)
      @standard = standard
      @barcode = barcode
      @regexp = /\A(?<subfile_type>DL|ID)(?<offset>\d{4})(?<length>\d{4})Z\w(\d{4})(\d{4})/
      @header_regexp = /@\n\u001E\rANSI (?<issuer_identification_number>\d{6})(?<aamva_version_number>\d{2})(?<jurisdiction_version_number>\d{2})(?<number_of_entries>\d{2})/
      @subfile_designator_regexp = /(?<subfile_designator>(?<subfile_type>DL|ID|Z[A-Z])(?<offset>\d{4})(?<length>\d{4})+)/
    end

    def header
      header_match.to_s
    end

    def method_missing(method_name, *args)
      match = subfiles.flatten(1).find { |key, value|  key.downcase.to_sym == method_name }

      super unless match

      match.last
    end

    def subfiles
      subfile_designators.map do |sd|
        @barcode
          .byteslice(sd.offset, sd.length)
          .slice((sd.type).length..-1)
          .chomp("\r")
          .split("\n")
          .map { |r| [r[0, 3], r[3..-1]] }
      end
    end

    def subfile_designators
      @barcode
        .scan(@subfile_designator_regexp)
        .map do |subfile_designator|
          SubfileDesignator.new(
            type: subfile_designator[1],
            offset: subfile_designator[2].to_i,
            length: subfile_designator[3].to_i
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

    private

    def header_match
      @barcode.match(@header_regexp)
    end
  end
end
