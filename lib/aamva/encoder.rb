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
        "#{type}#{designations["offset"]}#{designations["length"]}"
      end.join("")
    end

    def data_elements
      @data["data_elements"].map do |type, data_elements|
        joined_pairs = data_elements.map { |k, v| "#{k}#{v}" }.join(@data["header"]["data_element_separator"])

        "#{type}#{joined_pairs}#{@data["header"]["segment_terminator"]}"
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
        @data["header"]["jurisdiction_version_number"],
        @data["header"]["number_of_entries"]
      ].join("")
    end
  end
end
