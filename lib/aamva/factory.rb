# frozen_string_literal: true

require 'faker'

module AAMVA
  class Factory
    DEFAULT_STRING_LENGTH = 40

    CHARACTERS = {
      'alpha' => ('a'..'z').to_a,
      'numeric' => ('0'..'9').to_a,
      'alphanumeric' => ('a'..'z').to_a + ('0'..'9').to_a,
      'upper_alphanumeric' => ('A'..'Z').to_a + ('0'..'9').to_a,
      'upper_alpha' => ('A'..'Z').to_a
    }

    def self.build(type, options = {})
      if respond_to?(type)
        send(type, options)
      else
        raise "Unsupported Factory Type: #{type}"
      end
    end

    private

    def self.enum(options = {})
      options.fetch('values').sample
    end

    def self.range(options = {})
      (options.fetch('start')..options.fetch('end')).to_a.sample
    end

    def self.string(options = {})
      characters = options.fetch('characters', ['alphanumeric']).map do |c|
        CHARACTERS[c]
      end.flatten.uniq

      length = options.dig('truncate', 'length') || DEFAULT_STRING_LENGTH

      value = options.fetch('value') do
        random_string(length, characters)
      end
      value = Utils.truncate(value, options['truncate']) if options.key?('truncate')

      value
    end

    def self.restriction_codes(options = {})
      defaults = {
        'value' => UPPER_ALPHA_CHARACTERS.sample(12).join('')
      }

      string(defaults.merge(options))
    end

    def self.street_address(options = {})
      defaults = {
        'value' => Faker::Address.street_address
      }

      string(defaults.merge(options))
    end

    def self.last_name(options = {})
      defaults = {
        'value' => Faker::Name.last_name
      }

      string(defaults.merge(options))
    end

    def self.height(options = {})
      height = (options.fetch('min')..options.fetch('max')).to_a.sample
      units = options.fetch('units')

      "#{height} #{units.first}"
    end

    def self.first_name(options = {})
      defaults = {
        'value' => Faker::Name.first_name
      }

      string(defaults.merge(options))
    end

    def self.date(options = {})
      formats = options.fetch('formats')

      Faker::Date.backward.strftime(formats.values.first)
    end

    def self.city(options = {})
      defaults = {
        'value' => Faker::Address.city
      }

      string(defaults.merge(options))
    end

    def self.state(options = {})
      defaults = {
        'value' => Faker::Address.state_abbr
      }

      string(defaults.merge(options))
    end

    def self.random_string(length, characters)
      characters.sample(length).join('')
    end
  end
end
