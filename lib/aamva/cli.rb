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
        data = AAMVA::Generator.new(standard).dl
        header = Header.new(
          standard: standard,
          issuer_identification_number: data["header"]["issuer_identification_number"],
          number_of_entries: data["header"]["number_of_entries"],
          jurisdiction_version_number: data["header"]["jurisdiction_version_number"]
        )

        encoder = AAMVA::Encoder.new(
          data: data,
          header: header
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
