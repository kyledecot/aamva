module AAMVA
  class Subfile
    attr_reader :standard, :type, :data_elements

    def initialize(standard:, type:, data_elements:)
      @standard = standard
      @type = type
      @data_elements = data_elements
    end
  end
end
