# frozen_string_literal: true

require 'gli'
require 'aamva/version'

module Aamva
  class CLI
    extend GLI::App

    version Aamva::VERSION
  end
end
