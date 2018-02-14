# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Generator do
  let(:standard) { AAMVA::Standard.new('2016') }
  let(:generator) { described_class.new(standard) }

  describe '#data' do
    it 'does not crash' do
      described_class.new(standard).data
    end
  end
end
