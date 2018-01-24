# frozen_string_literal: true

RSpec::Matchers.define :be_a_valid_data_element do |symbol|
  match { |actual| AAMVA::Validator.public_send(symbol, actual) }
end
