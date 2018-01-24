RSpec::Matchers.define :be_a_valid_daq do
  match { |daq| Aamva::Validator.daq(daq) }
end
