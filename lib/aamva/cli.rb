# frozen_string_literal: true

require 'gli'
require 'pdf417'
require 'aamva/version'

module AAMVA
  class CLI
    extend GLI::App

    version AAMVA::VERSION

    command ['encode'] do |c|
      c.action do |_global, _options, _args|
        standard = AAMVA::Standard.new("2016")
        data = AAMVA::Generator.new(standard).dl
        encoder = AAMVA::Encoder.new(data)
        barcode = PDF417.new(encoder.string)

        puts barcode.to_png
      end
    end

    command ['generate:day'] do |c|
      c.action do |_global, _options, _args|
        puts AAMVA::Generator.day
      end
    end
  end
end
