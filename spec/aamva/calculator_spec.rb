# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Calculator do
  describe '.subfile_length' do
    it 'calculates correctly' do
      data_elements = {
        'DAY' => 'HAZ'
      }

      expect(described_class.subfile_length(type: 'DL', data_elements: data_elements, data_element_separator: "\n", segment_terminator: "\r")).to eq(9)
    end
  end
end
