# frozen_string_literal: true

require 'gli'
require 'aamva/version'

module AAMVA
  class CLI
    extend GLI::App

    version AAMVA::VERSION

    command ['encode'] do |c|
      c.flag [:f, :format], :type => String, :default_value => 'string'
      c.flag [:s, :standard], :type => String, :default_value => '2016'

      c.action do |_global, options, _args|
        format = options.fetch(:format)
        standard = Standard.new(options.fetch(:standard))

        data = AAMVA::Generator.new(standard).data
        encoder = AAMVA::Encoder.new(
          standard: standard,
          data: data,
        )

        puts encoder.format(format)
      end
    end
  end
end
