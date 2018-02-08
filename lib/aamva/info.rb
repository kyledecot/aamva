# frozen_string_literal: true

module AAMVA
  class Info
    def self.all
      @info ||= YAML.load_file(File.expand_path('../data/info/2016.yml', __FILE__))
    end

    def self.header(field)
      all['header'][field.to_s]
    end

    def self.required_data_elements
      all['data_elements'].reject { |de| de['required'] }.keys
    end

    def self.data_element(data_element)
      all['data_elements'][data_element.to_s]
    end
  end
end
