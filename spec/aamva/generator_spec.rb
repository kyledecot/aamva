# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Generator do

  AAMVA::Info.required_data_elements.each do |data_element|
    describe ".#{data_element}" do
      describe 'with no options' do
        it { expect(described_class.public_send(data_element)).to be_a_valid_data_element(data_element) }
      end
    end
  end
end
