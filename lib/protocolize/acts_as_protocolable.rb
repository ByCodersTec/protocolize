module Protocolize
  module ActsAsProtocolable
    extend ActiveSupport::Concern

    included do
      def generate_protocol
        protocol = Protocol.new(origin_object: self.id,
                                origin_class: self.class.name,
                                origin_project: Rails.application.class.module_parent_name)

        protocol.save
      end
    end

    class_methods do      
      def acts_as_protocolable(options = {})
        after_create :generate_protocol
      end
    end
  end
end
