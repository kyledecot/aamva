# frozen_string_literal: true

module AAMVA
  module Standard
    module TwentySixteen
      class Subfile
        attr_reader :type, :data_elements

        def initialize(type:, data_elements:)
          @type = type
          @data_elements = data_elements
        end

        def ==(other)
          type == other.type &&
            data_elements == other.data_elements
        end
      end
    end
  end
end 
