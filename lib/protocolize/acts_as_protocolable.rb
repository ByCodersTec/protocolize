module Protocolize
  module ActsAsProtocolable
    extend ActiveSupport::Concern

    included do
      def generate_protocol
        random = SecureRandom.alphanumeric(6).upcase

        created_at = DateTime.now.utc
        timestamp  = created_at.strftime('%Y%m%d%H%M%S')

        origin_project  = Rails.application.class.module_parent_name
        project         = origin_project.first(3).upcase
        
        Protocol.create(
          random: random,
          created_at: created_at,
          origin_object: self.id,
          origin_class: self.class.to_s,
          origin_project: origin_project,
          protocol: "#{project}#{timestamp}#{random}"
        )
      end
    end

    class_methods do      
      def acts_as_protocolable(options = {})
        after_create :generate_protocol
      end
    end
  end
end
