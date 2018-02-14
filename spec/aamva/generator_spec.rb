# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Generator do
  let(:standard) { AAMVA::Standard.new("2016") }
  let(:generator) { described_class.new(standard) }

  AAMVA::Standard.new("2016").required_data_elements.each do |data_element|
    describe "##{data_element}" do
      describe 'with no options' do
        it { expect(generator.public_send(data_element)).to be_a_valid_data_element(data_element) }
      end
    end
  end

  describe "#data" do
    it "does not crash" do
      described_class.new(standard).data
    end
  end
end
