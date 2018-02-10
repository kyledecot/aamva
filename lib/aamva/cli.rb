# frozen_string_literal: true

require 'gli'
require 'aamva/version'

module AAMVA
  class CLI
    extend GLI::App

    version AAMVA::VERSION

    command ['encode'] do |c|
      c.action do |_global, _options, _args|
        standard = AAMVA::Standard.new("2016")
        data = AAMVA::Generator.new(standard).data
        encoder = AAMVA::Encoder.new(
          standard: standard,
          data: data,
        )

        puts encoder.png
      end
    end

    command ['generate:day'] do |c|
      c.action do |_global, _options, _args|
        puts AAMVA::Generator.day
      end
    end
  end
end
