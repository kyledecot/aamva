# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Validator do
  let(:standard) { AAMVA::Standard.new("2016") }
  
  subject(:validator) { described_class.new(standard) }

  describe '.dag' do
    describe 'when valid' do
      it { expect(validator.dag("27082 O'Conner Green")).to be(true) }
    end
  end

  describe '.dde' do
    describe 'when valid' do
      it { expect(validator.dde('T')).to be(true) }
      it { expect(validator.dde('N')).to be(true) }
      it { expect(validator.dde('U')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.dde('')).to be(false) }
      it { expect(validator.dde('K')).to be(false) }
    end
  end

  describe '.dau' do
    describe 'when valid' do
      it { expect(validator.dau('070 in')).to be(true) }
      it { expect(validator.dau('180 cm')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.dau('')).to be(false) }
      it { expect(validator.dau('70 in')).to be(false) }
      it { expect(validator.dau('70 cm')).to be(false) }
    end
  end

  describe '.ddf' do
    describe 'when valid' do
      it { expect(validator.ddf('T')).to be(true) }
      it { expect(validator.ddf('N')).to be(true) }
      it { expect(validator.ddf('U')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.ddf('')).to be(false) }
      it { expect(validator.ddf('K')).to be(false) }
    end
  end

  describe '.ddg' do
    describe 'when valid' do
      it { expect(validator.ddg('T')).to be(true) }
      it { expect(validator.ddg('N')).to be(true) }
      it { expect(validator.ddg('U')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.ddg('')).to be(false) }
      it { expect(validator.ddg('K')).to be(false) }
    end
  end

  # Customer ID Number

  describe '.daq' do
    describe 'when valid' do
      it { expect(validator.daq('T64235789')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.daq('')).to be(false) }
    end
  end

  # Document Expiration Date

  describe '.dba' do
    describe 'when valid' do
      it { expect(validator.dba('09141986')).to be(true) }
      it { expect(validator.dba('19860914')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.dba('')).to be(false) }
      it { expect(validator.dba('09/14/1986')).to be(false) }
      it { expect(validator.dba('09/14/86')).to be(false) }
      it { expect(validator.dba('1986-09-14')).to be(false) }
    end
  end

  # Physical Description - Eye Color

  describe '.day' do
    describe 'when valid' do
      it { expect(validator.day('HAZ')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.day('H')).to be(false) }
      it { expect(validator.day('AAA')).to be(false) }
      it { expect(validator.day('AAAAAA')).to be(false) }
    end
  end

  # Document Issue Date

  describe '.dbd' do
    describe 'when valid' do
      it { expect(validator.dbd('09141986')).to be(true) }
      it { expect(validator.dbd('19860914')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.dbd('')).to be(false) }
      it { expect(validator.dbd('09/14/1986')).to be(false) }
      it { expect(validator.dbd('09/14/86')).to be(false) }
      it { expect(validator.dbd('1986-09-14')).to be(false) }
    end
  end

  # Date of Birth

  describe '.dbb' do
    describe 'when valid' do
      it { expect(validator.dbb('09141986')).to be(true) }
      it { expect(validator.dbb('19860914')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.dbb('')).to be(false) }
      it { expect(validator.dbb('09/14/1986')).to be(false) }
      it { expect(validator.dbb('09/14/86')).to be(false) }
      it { expect(validator.dbb('1986-09-14')).to be(false) }
    end
  end

  # Physical Description - Sex

  describe '.dbc' do
    describe 'when valid' do
      it { expect(validator.dbc('1')).to be(true) }
      it { expect(validator.dbc('2')).to be(true) }
      it { expect(validator.dbc('9')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.dbc('3')).to be(false) }
    end
  end

  describe '.dcg' do
    describe 'when valid' do
      it { expect(validator.dcg('USA')).to be(true) }
      it { expect(validator.dcg('CAN')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.dcg('')).to be(false) }
      it { expect(validator.dcg('MEX')).to be(false) }
      it { expect(validator.dcg('CANADA')).to be(false) }
    end
  end

  describe '.dai' do
    describe 'when valid' do
      it { expect(validator.dai('COLUMBUS')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.dai('COLUMBUSCOLUMBUSCOLUMBUS')).to be(false) }
      it { expect(validator.dai('')).to be(false) }
    end
  end

  describe '.dac' do
    describe 'when valid' do
      it { expect(validator.dac('JOHN')).to be(true) }
    end

    describe 'when invalid' do
      it { expect(validator.dac('JOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHNJOHN')).to be(false) }
      it { expect(validator.dac('')).to be(false) }
    end
  end
end
