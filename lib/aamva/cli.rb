# frozen_string_literal: true

require 'gli'
require 'aamva/version'

module AAMVA
  class CLI
    extend GLI::App

    version AAMVA::VERSION

    command ['encode'] do |c|
      c.flag [:f, :format], :type => String, :default_value => 'string'

      c.action do |_global, options, _args|
        format = options.fetch(:format, 'png')

        standard = AAMVA::Standard.new("2016")
        data = AAMVA::Generator.new(standard).data
        encoder = AAMVA::Encoder.new(
          standard: standard,
          data: data,
        )

        puts encoder.public_send(format)
      end
    end
  end
end
