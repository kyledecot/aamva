module AAMVA
  class Standard
    def initialize(year)
      @spec = YAML.load_file(File.expand_path("../../../lib/aamva/data/info/#{year}.yml", __FILE__))
    end
  end
end
