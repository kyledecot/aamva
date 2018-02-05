# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Info do
  describe '.data_element' do
    it { expect(described_class.data_element(:dca)['data_element']).to eq('Jurisdiction- specific vehicle class') }
  end
end
