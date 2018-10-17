# frozen_string_literal: true

require_relative './standard/twenty_sixteen'

module AAMVA
  module Standard
    def self.current
      TwentySixteen
    end
  end
end
