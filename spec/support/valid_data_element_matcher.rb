RSpec::Matchers.define :be_a_valid_data_element do |symbol|
  match { |actual| Aamva::Validator.public_send(symbol, actual) }
end
