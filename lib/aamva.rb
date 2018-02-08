# frozen_string_literal: true

require 'aamva/version'
require 'aamva/cli'
require 'aamva/generator'
require 'aamva/info'
require 'aamva/validator'
require 'aamva/decoder'
require 'aamva/standard'
require 'aamva/encoder'
require 'aamva/calculator'
require 'aamva/header'
require 'aamva/subfile_designator'
require 'aamva/subfile'
require 'aamva/data'
require 'aamva/factory'

module AAMVA
  UPPER_ALPHA_CHARACTERS = ('A'..'Z').to_a
  LOWER_ALPHA_CHARACTERS = ('a'..'z').to_a
  ALPHA_CHARACTERS = UPPER_ALPHA_CHARACTERS + LOWER_ALPHA_CHARACTERS

  LENGTH_UNITS = %w[in cm].freeze

  DAY_LENGTH = 3
  MAX_DAC_LENGTH = 40

  DATE_FORMATS = {
    can: '%Y%m%d',
    usa: '%m%d%Y'
  }.freeze

  REQUIRED_DATA_ELEMENTS = %i[
    dac
    dbc
    day
    ddf
    ddg
  ].freeze

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
