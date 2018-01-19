# frozen_string_literal: true

module Aamva
  module DataElement
    class DAY < Base
      HAZEL = 'HAZ'

      def initialize(data)
        @data = data
      end

      def format
        "DAY#{@data}"
      end
    end
  end
end
