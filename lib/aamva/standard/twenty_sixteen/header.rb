# frozen_string_literal: true

module AAMVA
  module Standard
    module TwentySixteen
      class Header
        attr_reader :number_of_entries, :jurisdiction_version_number, :issuer_identification_number

        def initialize(number_of_entries:, jurisdiction_version_number:, issuer_identification_number:)
          @number_of_entries = number_of_entries
          @jurisdiction_version_number = jurisdiction_version_number
          @issuer_identification_number = issuer_identification_number
        end

        def ==(other)
          number_of_entries == other.number_of_entries &&
            jurisdiction_version_number == other.jurisdiction_version_number &&
            issuer_identification_number == other.issuer_identification_number
        end
      end
    end
  end
end
