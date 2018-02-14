# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Decoder do
  describe 'when valid' do
    let(:barcode) { "@\n\u001E\rANSI 636023080102DL00410279ZO03200024DLDBA09142019\nDCSDECOT\nDACKYLE\nDADBRANDON\nDBD10032015\nDBB09141986\nDBC1\nDAYHAZ\nDAU070 IN\nDAG1437 CHESAPEAKE AVE\nDAICOLUMBUS\nDAJOH\nDAK432122152  \nDAQSS430403\nDCF2509UN6813300000\nDCGUSA\nDDEN\nDDFN\nDDGN\nDAZBRO\nDCIUS,OHIO\nDCJNONE\nDCUNONE\nDCE4\nDDAM\nDDB12042013\nDAW170\nDCAD\nDCBA\nDCDNONE\rZOZOAN\nZOBN\nZOE09142019\r" }
    let(:standard) { AAMVA::Standard.new('2016') }

    subject(:decoder) { described_class.new(standard, barcode) }

    describe '#data' do
      it 'decodes header correctly' do
        expect(decoder.data.header).to eq(
          AAMVA::Header.new(
            number_of_entries: '02',
            jurisdiction_version_number: '01',
            issuer_identification_number: '636023'
          )
        )
      end

      it 'decodes subfile_designators correctly' do
        expect(decoder.data.subfile_designators).to match_array([
                                                                  AAMVA::SubfileDesignator.new(
                                                                    type: 'DL',
                                                                    offset: '0041',
                                                                    length: '0279'
                                                                  ),
                                                                  AAMVA::SubfileDesignator.new(
                                                                    type: 'ZO',
                                                                    offset: '0320',
                                                                    length: '0024'
                                                                  )
                                                                ])
      end

      it 'decodes subfiles correctly' do
        expect(decoder.data.subfiles).to match_array([
                                                       AAMVA::Subfile.new(
                                                         type: 'DL',
                                                         data_elements: [
                                                           %w[DBA 09142019],
                                                           %w[DCS DECOT],
                                                           %w[DAC KYLE],
                                                           %w[DAD BRANDON],
                                                           %w[DBD 10032015],
                                                           %w[DBB 09141986],
                                                           %w[DBC 1],
                                                           %w[DAY HAZ],
                                                           ['DAU', '070 IN'],
                                                           ['DAG', '1437 CHESAPEAKE AVE'],
                                                           %w[DAI COLUMBUS],
                                                           %w[DAJ OH],
                                                           ['DAK', '432122152  '],
                                                           %w[DAQ SS430403],
                                                           %w[DCF 2509UN6813300000],
                                                           %w[DCG USA],
                                                           %w[DDE N],
                                                           %w[DDF N],
                                                           %w[DDG N],
                                                           %w[DAZ BRO],
                                                           ['DCI', 'US,OHIO'],
                                                           %w[DCJ NONE],
                                                           %w[DCU NONE],
                                                           %w[DCE 4],
                                                           %w[DDA M],
                                                           %w[DDB 12042013],
                                                           %w[DAW 170],
                                                           %w[DCA D],
                                                           %w[DCB A],
                                                           %w[DCD NONE]
                                                         ]
                                                       ),
                                                       AAMVA::Subfile.new(
                                                         type: 'ZO',
                                                         data_elements: [
                                                           %w[ZOA N],
                                                           %w[ZOB N],
                                                           %w[ZOE 09142019]
                                                         ]
                                                       )
                                                     ])
      end
    end
  end
end
