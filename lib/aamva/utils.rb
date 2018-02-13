module AAMVA
  class Utils
    def self.truncate(value, options = {})
      value[0...options.fetch('length', -1)]
    end
  end
end
