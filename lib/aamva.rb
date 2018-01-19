# frozen_string_literal: true

require 'aamva/version'
require 'aamva/card'
require 'aamva/data_element'
require 'aamva/cli'
require 'aamva/generator'
require 'aamva/validator'

module Aamva
  DAY_LENGTH = 3
  MAX_DAC_LENGTH = 40

  DAY_MAPPING = {
    'BLK' => 'Black',
    'BLU' => 'Blue',
    'BRO' => 'Brown',
    'GRY' => 'Gray',
    'GRN' => 'Green',
    'HAZ' => 'Hazel',
    'MAR' => 'Maroon PNK Pink',
    'DIC' => 'Dichromatic UNK Unknown',
  }
end
