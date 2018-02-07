module AAMVA
  class SubfileDesignator
    attr_reader :type, :offset, :length

    def initialize(type:, length:, offset:)
      @type = type
      @length = length
      @offset = offset
    end

    def eql?(other)
      type == other.type
    end

    def hash
      type.hash
    end
  end
end
