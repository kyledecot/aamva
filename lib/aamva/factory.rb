require 'faker'

module AAMVA
  class Factory
    def self.build(type, options = {})
      if respond_to?(type)
        send(type, options)
      else
        raise "Unsupported Factory Type: #{type}"
      end
    end

    private

    def self.enum(options = {})
      options.fetch("values").sample 
    end 

    def self.range(options = {}) 
      (options.fetch('start')..options.fetch('end')).to_a.sample
    end 

    def self.string(options = {})
      '123456'
    end

    def self.restriction_codes(options = {})
      UPPER_ALPHA_CHARACTERS.sample(12).join('')
    end

    def self.street_address(options = {})
      length = options.fetch('length')
      truncate(Faker::Address.street_address, length: length)
    end

    def self.document_discriminator(options = {})
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(25).join('')
    end

    def self.last_name(options = {})
      length = options.fetch('length')
      truncate(Faker::Name.last_name, length: length)
    end

    def self.postal_code(options = {})
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(11).join('')
    end

    def self.customer_id_number(options = {})
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(25).join('')
    end

    def self.height(options = {})
      height = ('000'..'999').to_a.sample

      "#{height} #{LENGTH_UNITS.first}"
    end

    def self.first_name(options = {})
      length = options.fetch('length') 
      truncate(Faker::Name.first_name, length: length)
    end

    def self.date(options = {})
      Faker::Date.backward.strftime(DATE_FORMATS[:usa])
    end

    def self.endorsement_codes(options = {})
      UPPER_ALPHA_CHARACTERS.sample(5).join('')
    end

     def self.city(options = {})
       length = options.fetch('length')
       truncate(Faker::Address.city, length: length)
     end

    def self.state(options = {})
      Faker::Address.state_abbr      
    end

    def self.vehicle_class(options = {})
      chars = ('A'..'Z').to_a + ('0'..'9').to_a

      chars.sample(6).join('')
    end

    def self.truncate(data_element, length:)
      data_element[0, length - 1]
    end
  end
end
