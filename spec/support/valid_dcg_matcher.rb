RSpec::Matchers.define :be_a_valid_dcg do
  match { |dcg| Aamva::Validator.dcg(dcg) }
end
