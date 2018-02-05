# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AAMVA::Decoder do
  describe 'when valid' do
    let(:barcode) { "@\n\u001E\rANSI 636023080102DL00410279ZO03200024DLDBA09142019\nDCSDECOT\nDACKYLE\nDADBRANDON\nDBD10032015\nDBB09141986\nDBC1\nDAYHAZ\nDAU070 IN\nDAG1437 CHESAPEAKE AVE\nDAICOLUMBUS\nDAJOH\nDAK432122152  \nDAQSS430403\nDCF2509UN6813300000\nDCGUSA\nDDEN\nDDFN\nDDGN\nDAZBRO\nDCIUS,OHIO\nDCJNONE\nDCUNONE\nDCE4\nDDAM\nDDB12042013\nDAW170\nDCAD\nDCBA\nDCDNONE\rZOZOAN\nZOBN\nZOE09142019\r" }

    subject { described_class.new(barcode) }

    describe '#header' do
      it { expect(subject.header).to eq("@\n\u001E\rANSI 636023080102") }
    end

    describe '#subfile_designators' do
      it 'decodes correctly' do
        expect(subject.subfile_designators).to match_array([
                                                             {
                                                               'subfile_type' => 'DL',
                                                               'offset' => 41,
                                                               'length' => 279
                                                             },
                                                             {
                                                               'subfile_type' => 'ZO',
                                                               'offset' => 320,
                                                               'length' => 24
                                                             }
                                                           ])
      end
    end

    describe '#subfiles' do
      it 'decodes correctly' do
        expect(subject.subfiles).to match_array([
                                                  [
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
                                                  ],
                                                  [
                                                    %w[ZOA N],
                                                    %w[ZOB N],
                                                    %w[ZOE 09142019]
                                                  ]
                                                ])
      end
    end

    describe '#aamva_version_number' do
      it { expect(subject.aamva_version_number).to eq('08') }
    end

    describe '#issuer_identification_number' do
      it { expect(subject.issuer_identification_number).to eq('636023') }
    end

    describe '#jurisdiction_version_number' do
      it { expect(subject.jurisdiction_version_number).to eq('01') }
    end

    describe '#number_of_entries' do
      it { expect(subject.number_of_entries).to eq('02') }
    end

    # describe "#day" do
    #   it { expect(subject.day).to eq('HAZ') }
    # end
    #
    # describe "#dcs" do
    #   it { expect(subject.dcs).to eq('DECOT') }
    # end
    #
    # describe "#dac" do
    #   it { expect(subject.dac).to eq('KYLE') }
    # end
    #
    # describe "#dad" do
    #   it { expect(subject.dad).to eq('BRANDON') }
    # end
    #
    # describe "#dba" do
    #   it { expect(subject.dba).to eq('09142019') }
    # end
  end
end
