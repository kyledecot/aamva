# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Utils do
  describe '.truncate' do
    it { expect(described_class.truncate('Hello', 'length' => 10)).to eq('Hello') }
    it { expect(described_class.truncate('Hello', 'length' => 3)).to eq('Hel') }
  end
end
