module AAMVA
  class Data
    attr_reader :header, :subfile_designators, :subfiles

    def initialize(header:, subfile_designators:, subfiles:)
      @header = header
      @subfile_designators = subfile_designators
      @subfiles = subfiles
    end
  end
end
