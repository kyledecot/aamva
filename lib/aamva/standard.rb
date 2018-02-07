# frozen_string_literal: true

module AAMVA
  class Standard
    attr_reader :spec

    extend Forwardable

    def initialize(year)
      @spec = YAML.load_file(File.expand_path("../../../lib/aamva/data/info/#{year}.yml", __FILE__))
    end

    def_delegators :@spec, :[]
  end
end
