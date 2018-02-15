# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Factory do
  describe '.build' do
    it 'works' do
      string = described_class.build(:string, 'value' => 'foobar')

      expect(string).to eq('foobar')
    end

    describe ':string' do
      describe 'characters' do
        it 'only uses the characters listed' do
          result = described_class.build(:string, 'characters' => ['upper_alphanumeric'])

          expect(result).to_not match(/[a-z]/)
        end
      end

      describe 'truncate' do
        it { expect(described_class.build(:string, 'value' => 'Hello', 'truncate' => { 'length' => 3 })).to eq('Hel') }
      end
    end
  end
end
