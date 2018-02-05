module AAMVA
  class Decoder
    def initialize(barcode)
      @spec = YAML.load_file(File.expand_path("../../../lib/aamva/data/info/2016.yml", __FILE__))
      @barcode = barcode
      @regexp = /\A(?<sub_fille_type>DL|ID)(?<offset>\d{4})(?<length>\d{4})Z\w(\d{4})(\d{4})(\w{2})(?<data_elements>.+)/m
      @header_regexp = /@\n\rANSI (?<issuer_identification_number>\d{6})(?<aamva_version_number>\d{2})(?<jurisdiction_version_number>\d{2})(?<number_of_entries>\d{2})/
      @subfile_designator_regexp = /(?<subfile_designator>(?<subfile_type>DL|ID|Z[A-Z])(?<offset>\d{4})(?<length>\d{4})+)/
    end

    def header
      header_match.to_s
    end

    def subfile_designators
      @barcode.scan(@subfile_designator_regexp).map do |subfile_designator|
        {
          "subfile_type" => subfile_designator[1],
          "offset" => subfile_designator[2],
          "length" => subfile_designator[3]
        }
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
