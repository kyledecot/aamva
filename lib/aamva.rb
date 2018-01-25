# frozen_string_literal: true

require 'aamva/version'
require 'aamva/card'
require 'aamva/cli'
require 'aamva/generator'
require 'aamva/validator'

module AAMVA
  DAY_LENGTH = 3
  MAX_DAC_LENGTH = 40

  TRUNCATION_INDICATORS = %w[N T U].freeze

  DATE_FORMATS = {
    :can => '%Y%m%d',
    :usa => '%m%d%Y'
  }

  REQUIRED_DATA_ELEMENTS = [
    :dca,
    :dcb,
    :dcd,
    :dba,
    :dcs,
    :dac,
    :dad,
    :dbd,
    :dbc,
    :day,
    :dau,
    :dag,
    :dai,
    :daj,
    :dak,
    :daq,
    :dcf,
    :dde,
    :ddf,
    :ddg,
  ]

  DCG_MAPPING = {
    'USA' => 'USA',
    'CAN' => 'CAN'
  }.freeze

  DBC_VALUES = ['1', '2', '9'].freeze

  DAY_MAPPING = {
    'BLK' => 'Black',
    'BLU' => 'Blue',
    'BRO' => 'Brown',
    'GRY' => 'Gray',
    'GRN' => 'Green',
    'HAZ' => 'Hazel',
    'MAR' => 'Maroon PNK Pink',
    'DIC' => 'Dichromatic UNK Unknown'
  }.freeze
end
