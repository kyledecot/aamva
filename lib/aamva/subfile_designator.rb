module AAMVA
  class SubfileDesignator
    attr_reader :type, :offset, :length

    def initialize(type:, length:, offset:)
      @type = type
      @length = length
      @offset = offset
    end

    def string
      "#{type}#{offset}#{length}"
    end
  end
end
