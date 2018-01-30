module AAMVA
  class Decoder
    def initialize(spec, barcode)
      @spec = spec
      @barcode = barcode
    end

    def method_missing(method_name, *args)
      data_element = method_name.to_s.upcase

      extract(data_element, @barcode)
    end

    private

    def extract(key, string)
      matched = string.match(/^#{key}(?<value>.+)/)
      matched&.[]("value")
    end
  end
end
