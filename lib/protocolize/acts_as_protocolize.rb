module Protocolize
  module ActsAsProtocolize
    extend ActiveSupport::Concern

    included do
      def protocolize
        # TODO: Implement save the protocol.
      end
    end
 
    class_methods do
      def acts_as_protocolize(options = {})
        after_create :protocolize
      end
    end
  end
end
