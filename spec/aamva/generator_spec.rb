# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Generator do
  let(:standard) { AAMVA::Standard.new("2016") }
  let(:generator) { described_class.new(standard) }

  AAMVA::Info.required_data_elements.each do |data_element|
    describe "##{data_element}" do
      describe 'with no options' do
        it { expect(generator.public_send(data_element)).to be_a_valid_data_element(data_element) }
      end
    end
  end

  describe "#subfile_designators" do
    subject { generator.subfile_designators }

    it { expect(subject.length).to eq(1) }
  end
end
