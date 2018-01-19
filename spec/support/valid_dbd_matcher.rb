RSpec::Matchers.define :be_a_valid_dbd do
  match { |dbd| Aamva::Validator.dbd(dbd) }
end
