require 'spec_helper'

describe Protocolize::ActsAsProtocolable do
  let(:complaint) { Complaint.new(name: "My Complaint") }

  describe '.acts_as_protocolable' do
    it 'should call generate_protocol after create a model' do
      expect(complaint).to receive(:generate_protocol)

      complaint.run_callbacks(:create) 
    end
  end

  describe '.generate_protocol' do
    it 'should create a protocol' do
      complaint.save

      expect(Protocolize::Protocol.count).to eql(1)
      expect(Protocolize::Protocol.all).to_not be_empty
    end
  end
end
