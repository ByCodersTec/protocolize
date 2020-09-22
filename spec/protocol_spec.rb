require 'spec_helper'

describe Protocolize::Protocol do
  let(:origin_project) { 'ByCoders' }
  let(:complaint) { Complaint.create(name: "My Complaint") }
  let(:protocol)  { Protocolize::Protocol.new(origin_object: complaint.id,
                                              origin_project: origin_project,
                                              origin_class: complaint.class.name) }

  describe '.get_random' do
    it 'returns string' do
      expect(protocol.get_random.class).to be_eql(String)
    end

    it 'returns a string with 6 characters' do
      expect(protocol.get_random.size).to be_eql(6)
    end

    it 'returns an uppercase string' do
      random = protocol.get_random

      expect(random).to be_eql(random.upcase)
    end
  end

  describe '.get_timestamp' do
    it 'returns string' do
      expect(protocol.get_timestamp.class).to be_eql(String)
    end

    it 'returns a string with 16 numbers' do
      expect(protocol.get_timestamp.size).to be_eql(14)
    end

    it 'returns a string with only numbers' do
      expect(protocol.get_timestamp !~ /\D/).to be_truthy
    end

    it 'returns a string with created_at values' do
      expect(protocol.get_timestamp).to be_eql(protocol.created_at.strftime('%Y%m%d%H%M%S'))
    end
  end

  describe '.get_project_code' do
    it 'returns string' do
      expect(protocol.get_project_code.class).to be_eql(String)
    end

    it 'returns a string with 3 numbers' do
      expect(protocol.get_project_code.size).to be_eql(3)
    end

    it 'returns a string with the first 3 uppercase characters of project name' do
      expect(protocol.get_project_code).to be_eql(origin_project.upcase.first(3))
    end
  end
end