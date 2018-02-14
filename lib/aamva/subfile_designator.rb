# frozen_string_literal: true

module AAMVA
  class SubfileDesignator
    attr_reader :type, :offset, :length

    def initialize(type:, length:, offset:)
      @type = type
      @length = length
      @offset = offset
    end

    def ==(other)
      type == other.type &&
        offset == other.offset &&
        length == other.length
    end
  end
end
