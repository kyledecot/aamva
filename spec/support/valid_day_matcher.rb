RSpec::Matchers.define :be_a_valid_day do
  match { |day| Aamva::Validator.day(day) }
end
