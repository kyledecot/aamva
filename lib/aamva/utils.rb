module AAMVA
  class Utils
    def self.truncate(value, options = {})
      value = value[0, options['length']] if options.key?('length')

      value
    end
  end
end
