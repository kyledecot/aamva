# frozen_string_literal: true

require 'gli'
require 'aamva/version'

module AAMVA
  class CLI
    extend GLI::App

    version AAMVA::VERSION

    command ['generate:day'] do |c|
      c.action do |_global, _options, _args|
        puts AAMVA::Generator.day
      end
    end
  end
end
