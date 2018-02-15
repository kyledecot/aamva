# frozen_string_literal: true

require 'aamva/version'
require 'aamva/cli'
require 'aamva/generator'
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
require 'aamva/utils'

module AAMVA
  UPPER_ALPHA_CHARACTERS = ('A'..'Z').to_a
  LOWER_ALPHA_CHARACTERS = ('a'..'z').to_a
  ALPHA_CHARACTERS = UPPER_ALPHA_CHARACTERS + LOWER_ALPHA_CHARACTERS
end
