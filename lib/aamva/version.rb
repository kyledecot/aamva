# frozen_string_literal: true

module AAMVA
  VERSION = '0.1.0'

  class Version
    SUPPORTED = [
      2016
    ]

    def initialize(year)
      @spec = YAML.load_file(File.expand_path("../../../lib/aamva/data/info/#{year}.yml", __FILE__))
    end
  end
end
