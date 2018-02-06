module AAMVA
  class Encoder
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def string
      "#{header}#{subfile_designators}#{data_elements}"
    end

    private

    def subfile_designators
      @data["subfile_designators"].map do |type, designations|
        [
          type,
          designations["length"],
          designations["offset"],
          @data["header"]["segment_terminator"],
        ].join("")
      end.join("")
    end

    def data_elements
      @data["data_elements"].map do |type, data_elements|
        data_elements.map do |key, value|
          "#{key}#{value}"
        end.join(@data["header"]["record_separator"])
      end.join("")
    end

    def header
      [
        @data["header"]["compliance_indicator"],
        @data["header"]["data_element_separator"],
        @data["header"]["record_separator"],
        @data["header"]["segment_terminator"],
        @data["header"]["file_type"],
        @data["header"]["issuer_identification_number"],
        @data["header"]["aamva_version_number"],
        @data["header"]["jurisdiction_version_number"]
      ].join("")
    end
  end
end
