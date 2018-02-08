# frozen_string_literal: true

module AAMVA
  class Generator
    attr_reader :standard

    def initialize(standard)
      @standard = standard
    end

    def data
      @data ||= Data.new(
        header: header,
        subfile_designators: subfile_designators,
        subfiles: subfiles
      )
    end

    private

    def header
      @header ||= Header.new(
        issuer_identification_number: issuer_identification_number,
        jurisdiction_version_number: jurisdiction_version_number,
        number_of_entries:  subfiles.size
      )
    end

    def subfile_designators
      @subfile_designators ||= subfiles.map do |_, subfile|
        length = Calculator.subfile_length(
          type: subfile.type,
          data_elements: subfile.data_elements,
          data_element_separator: @standard["data_element_separator"],
          segment_terminator: @standard["segment_terminator"]
        )

        offset = Calculator.subfile_offset

        SubfileDesignator.new(
          type: subfile.type,
          length: length,
          offset: offset
        )
      end
    end

    def subfiles
      @subfiles ||= begin
        data_elements = Hash[Info.required_data_elements.map do |type|
          [type.upcase, send(type)]
        end]

        {
        "DL" => Subfile.new(
          type: "DL",
          data_elements: data_elements
          )
        }
      end
    end

    def method_missing(name, *args)
      if factory = Info.factory(name)
        Factory.build(factory[:type], factory[:options])
      else
        super
      end
    end
  end
end
