# frozen_string_literal: true

require 'forwardable'

module AAMVA
  class Standard
    attr_reader :spec

    class UnsupportedStandard < StandardError
    end

    extend Forwardable

    def initialize(year)
      path = File.expand_path("../../../lib/aamva/data/info/#{year}.yml", __FILE__)

      raise UnsupportedStandard, "Unsupported Standard: #{year}" unless File.exists?(path)

      @spec = YAML.load_file(path)
    end

    def_delegators :@spec, :[]

    def factory(field)
      if data_element?(field)
        {
          :type => data_element(field)&.dig("factory", "type"),
          :options => data_element(field)&.dig("factory", "options").to_h
        }
      elsif header_field?(field)
        {
          :type => header(field)&.dig("factory", "type"),
          :options => header(field)&.dig("factory", "options").to_h
        }
      end
    end

    def header(field)
      @spec['header'][field.to_s]
    end

    def required_data_elements
      @spec['data_elements'].reject { |de| de['required'] }.keys
    end

    def data_element(data_element)
      @spec['data_elements'][data_element.to_s]
    end

  private

    def data_element?(field)
      !!data_element(field)
    end

    def header_field?(field)
      !!header(field)
    end
  end
end
