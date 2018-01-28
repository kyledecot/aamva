require "spec_helper"

RSpec.describe "data/info/2016.yml" do
  DATA = YAML.load_file(File.expand_path("../../../../../lib/aamva/data/info/2016.yml", __FILE__))

  DATA["data_elements"].each do |data_element, data|
    describe "#{data_element}" do
      it { expect(data.key?("required")).to be(true) }
      it { expect(data.key?("definition")).to be(true) }
      it { expect(data.key?("data_element")).to be(true) }
    end
  end
end
