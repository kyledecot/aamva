# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Validator do
  let(:standard) { AAMVA::Standard.new('2016') }

  subject(:validator) { described_class.new(standard) }

  describe '#valid?' do
    describe 'dag' do
      describe 'when valid' do
        it { expect(validator.valid?(:dag, "27082 O'Conner Green")).to be(true) }
      end
    end

    describe 'dde' do
      describe 'when valid' do
        it { expect(validator.valid?(:dde, 'T')).to be(true) }
        it { expect(validator.valid?(:dde, 'N')).to be(true) }
        it { expect(validator.valid?(:dde, 'U')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:dde, '')).to be(false) }
        it { expect(validator.valid?(:dde, 'K')).to be(false) }
      end
    end

    describe 'dau' do
      describe 'when valid' do
        it { expect(validator.valid?(:dau, '070 in')).to be(true) }
        it { expect(validator.valid?(:dau, '180 cm')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:dau, '')).to be(false) }
        it { expect(validator.valid?(:dau, '70 in')).to be(false) }
        it { expect(validator.valid?(:dau, '70 cm')).to be(false) }
      end
    end

    describe 'ddf' do
      describe 'when valid' do
        it { expect(validator.valid?(:ddf, 'T')).to be(true) }
        it { expect(validator.valid?(:ddf, 'N')).to be(true) }
        it { expect(validator.valid?(:ddf, 'U')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:ddf, '')).to be(false) }
        it { expect(validator.valid?(:ddf, 'K')).to be(false) }
      end
    end

    describe 'ddg' do
      describe 'when valid' do
        it { expect(validator.valid?(:ddg, 'T')).to be(true) }
        it { expect(validator.valid?(:ddg, 'N')).to be(true) }
        it { expect(validator.valid?(:ddg, 'U')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:ddg, '')).to be(false) }
        it { expect(validator.valid?(:ddg, 'K')).to be(false) }
      end
    end

    # Customer ID Number

    describe 'daq' do
      describe 'when valid' do
        it { expect(validator.valid?(:daq, 'T64235789')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:daq, '')).to be(false) }
      end
    end

    # Document Expiration Date

    describe 'dba' do
      describe 'when valid' do
        it { expect(validator.valid?(:dba, '09141986')).to be(true) }
        it { expect(validator.valid?(:dba, '19860914')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:dba, '')).to be(false) }
        it { expect(validator.valid?(:dba, '09/14/1986')).to be(false) }
        it { expect(validator.valid?(:dba, '09/14/86')).to be(false) }
        it { expect(validator.valid?(:dba, '1986-09-14')).to be(false) }
      end
    end

    # Physical Description - Eye Color

    describe 'day' do
      describe 'when valid' do
        it { expect(validator.valid?(:day, 'HAZ')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:day, 'H')).to be(false) }
        it { expect(validator.valid?(:day, 'AAA')).to be(false) }
        it { expect(validator.valid?(:day, 'AAAAAA')).to be(false) }
      end
    end

    # Document Issue Date

    describe 'dbd' do
      describe 'when valid' do
        it { expect(validator.valid?(:dbd, '09141986')).to be(true) }
        it { expect(validator.valid?(:dbd, '19860914')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:dbd, '')).to be(false) }
        it { expect(validator.valid?(:dbd, '09/14/1986')).to be(false) }
        it { expect(validator.valid?(:dbd, '09/14/86')).to be(false) }
        it { expect(validator.valid?(:dbd, '1986-09-14')).to be(false) }
      end
    end

    # Date of Birth

    describe 'dbb' do
      describe 'when valid' do
        it { expect(validator.valid?(:dbb, '09141986')).to be(true) }
        it { expect(validator.valid?(:dbb, '19860914')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:dbb, '')).to be(false) }
        it { expect(validator.valid?(:dbb, '09/14/1986')).to be(false) }
        it { expect(validator.valid?(:dbb, '09/14/86')).to be(false) }
        it { expect(validator.valid?(:dbb, '1986-09-14')).to be(false) }
      end
    end

    # Physical Description - Sex

    describe 'dbc' do
      describe 'when valid' do
        it { expect(validator.valid?(:dbc, '1')).to be(true) }
        it { expect(validator.valid?(:dbc, '2')).to be(true) }
        it { expect(validator.valid?(:dbc, '9')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:dbc, '3')).to be(false) }
      end
    end

    describe 'dcg' do
      describe 'when valid' do
        it { expect(validator.valid?(:dcg, 'USA')).to be(true) }
        it { expect(validator.valid?(:dcg, 'CAN')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:dcg, '')).to be(false) }
        it { expect(validator.valid?(:dcg, 'MEX')).to be(false) }
        it { expect(validator.valid?(:dcg, 'CANADA')).to be(false) }
      end
    end

    describe 'dai' do
      describe 'when valid' do
        it { expect(validator.valid?(:dai, 'COLUMBUS')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:dai, 'COLUMBUSCOLUMBUSCOLUMBUS')).to be(false) }
        it { expect(validator.valid?(:dai, '')).to be(false) }
      end
    end

    describe 'dac' do
      describe 'when valid' do
        it { expect(validator.valid?(:dac, 'JOHN')).to be(true) }
      end

      describe 'when invalid' do
        it { expect(validator.valid?(:dac, 'JOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHN')).to be(false) }
        it { expect(validator.valid?(:dac, '')).to be(false) }
      end
    end
  end
end
