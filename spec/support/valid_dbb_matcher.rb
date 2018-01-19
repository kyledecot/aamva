RSpec::Matchers.define :be_a_valid_dbb do
  match { |dbb| Aamva::Validator.dbb(dbb) }
end
