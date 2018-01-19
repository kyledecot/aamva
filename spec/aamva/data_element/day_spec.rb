# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Aamva::DataElement::DAY do
  describe '#format' do
    subject { described_class.new(described_class::HAZEL).format }

    it { is_expected.to eq('DAYHAZ') }
  end
end
