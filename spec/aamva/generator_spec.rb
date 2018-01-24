# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Generator do
  AAMVA::REQUIRED_DATA_ELEMENTS.each do |data_element|
    describe ".#{data_element}" do
      describe 'with no options' do
        it { expect(described_class).to respond_to(data_element) }
      end
    end
  end

  describe '.dca' do
    describe 'with no options' do
      it { expect(described_class.dca).to be_a_valid_data_element(:dca) }
    end
  end

  describe '.day' do
    describe 'with no options' do
      it { expect(described_class.day).to be_a_valid_data_element(:day) }
    end
  end

  describe '.daq' do
    describe 'with no options' do
      it { expect(described_class.daq).to be_a_valid_data_element(:daq) }
    end
  end

  describe '.dcg' do
    describe 'with no options' do
      it { expect(described_class.dcg).to be_a_valid_data_element(:dcg) }
    end
  end

  describe '.dac' do
    describe 'with no options' do
      it { expect(described_class.dac).to be_a_valid_data_element(:dac) }
    end
  end

  describe '.dbb' do
    describe 'with no options' do
      it { expect(described_class.dbb).to be_a_valid_data_element(:dbb) }
    end
  end

  describe '.dbd' do
    describe 'with no options' do
      it { expect(described_class.dbd).to be_a_valid_data_element(:dbd) }
    end
  end
end