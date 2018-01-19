RSpec::Matchers.define :be_a_valid_dac do
  match { |dac| Aamva::Validator.dac(dac) }
end
