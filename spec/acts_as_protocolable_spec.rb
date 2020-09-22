require 'spec_helper'

describe Protocolize::ActsAsProtocolable do
  let(:my_model) { MyModel.new(name: "My model") }

  describe '.acts_as_protocolable' do
    it 'should call generate_protocol after create a model' do
      expect(my_model).to receive(:generate_protocol)

      my_model.run_callbacks(:create) 
    end
  end

  describe '.generate_protocol' do
    it 'should create a protocol' do
      my_model.save

      expect(Protocolize::Protocol.count).to eql(1)
      expect(Protocolize::Protocol.all).to_not be_empty
    end
  end
end
