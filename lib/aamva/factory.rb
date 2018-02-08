require 'faker'

module AAMVA
  class Factory
    def self.build(type, options = {})
      case type
      when "date" then date
      when "first_name" then first_name
      when "last_name" then last_name
      when "truncation_indicator" then truncation_indicator
      when "postal_code" then postal_code
      when "height" then height
      when "customer_id_number" then customer_id_number
      when "country_identification" then country_identification
      when "document_discriminator" then document_discriminator
      when "street_address" then street_address
      when "restriction_codes" then restriction_codes
      when "endorsement_codes" then endorsement_codes
      when "city" then city
      when "state" then state
      when "gender" then gender
      when "vehicle_class" then vehicle_class
      when "eye_color" then eye_color
      when "jurisdiction_version_number" then jurisdiction_version_number
      when "issuer_identification_number" then issuer_identification_number
      else
        raise "Unsupported Factory Type: #{type}"
      end
    end

    private

    def self.jurisdiction_version_number
      ('00'..'99').to_a.sample
    end

    def self.issuer_identification_number
      '123456'
    end

    def self.restriction_codes
      UPPER_ALPHA_CHARACTERS.sample(12).join('')
    end

    def self.street_address
      truncate(Faker::Address.street_address, length: 35)
    end

    def self.document_discriminator
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(25).join('')
    end

    def self.truncation_indicator
      Info.all['truncation_indicators'].sample
    end

    def self.last_name
      truncate(Faker::Name.last_name, length: 40)
    end

    def self.country_identification
      DCG_MAPPING.keys.sample
    end

    def self.postal_code
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(11).join('')
    end

    def self.customer_id_number
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(25).join('')
    end

    def self.height
      height = ('000'..'999').to_a.sample

      "#{height} #{LENGTH_UNITS.first}"
    end

    def self.first_name
      truncate(Faker::Name.first_name, length: 40)
    end

    def self.date
      Faker::Date.backward.strftime(DATE_FORMATS[:usa])
    end

    def self.endorsement_codes
      UPPER_ALPHA_CHARACTERS.sample(5).join('')
    end

     def self.city
       truncate(Faker::Address.city, length: 20)
     end

    def self.state
      chars = ('A'..'Z').to_a

      chars.sample(2).join('')
    end

    def self.gender
      DBC_VALUES.sample
    end

    def self.vehicle_class
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(6).join('')
    end

    def self.eye_color
      DAY_MAPPING.keys.sample
    end

    def self.truncate(data_element, length:)
      data_element[0, length - 1]
    end
  end
end
