# frozen_string_literal: true

RSpec::Matchers.define :be_a_valid_data_element do |symbol|
  match do |actual|
    standard = AAMVA::Standard.new('2016')
    validator = AAMVA::Validator.new(standard)

    validator.valid?(symbol, actual)
  end
end
