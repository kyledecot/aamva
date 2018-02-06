# frozen_string_literal: true

RSpec::Matchers.define :be_a_valid_data_element do |symbol|
  match do |actual|
    standard = AAMVA::Standard.new("2016")
    AAMVA::Validator.new(standard).public_send(symbol, actual)
  end
end
