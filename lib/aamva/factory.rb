module AAMVA
  class Factory
    def self.build(type)
      case type
      when "date"
        Faker::Date.backward.strftime(DATE_FORMATS[:usa])
      when "first_name"
        truncate(Faker::Name.first_name, length: 40)
      when "last_name"
        truncate(Faker::Name.last_name, length: 40)
      when "truncation_indicator"
        Info.all['truncation_indicators'].sample
      when "postal_code"
        chars = ('A'..'Z').to_a + ('0'..'9').to_a

        chars.sample(11).join('')
      when "height"
        height = ('000'..'999').to_a.sample

        "#{height} #{LENGTH_UNITS.first}"
      when "customer_id_number"
        chars = ('A'..'Z').to_a + ('0'..'9').to_a

        chars.sample(25).join('')
      else
        raise "Unsupported Factory Type: #{type}"
      end
    end

    private

    def self.truncate(data_element, length:)
      data_element[0, length - 1]
    end
  end
end
