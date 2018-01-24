# frozen_string_literal: true

require 'gli'
require 'aamva/version'

module Aamva
  class CLI
    extend GLI::App

    version Aamva::VERSION

    command ["generate:day"] do |c|
      c.action do |_global, _options, _args|

        puts Aamva::Generator.day
      end
    end
  end
end
