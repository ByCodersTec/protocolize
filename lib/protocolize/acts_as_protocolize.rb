module Protocolize
  module ActsAsProtocolize
    extend ActiveSupport::Concern

    included do
      def protocolize
        random = SecureRandom.alphanumeric(6).upcase

        created_at = DateTime.now.utc
        timestamp  = created_at.strftime('%Y%m%d%H%M%S')

        origin_project  = Rails.application.class.parent_name
        project         = origin_project.first(3).upcase
        
        Protocolize::Base.create(
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
      def acts_as_protocolize(options = {})
        after_create :protocolize
      end
    end
  end
end
