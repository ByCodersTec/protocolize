module Protocolize
  class Protocol < ActiveRecord::Base
    before_save :set_protocol

    def set_protocol
      self.random     = get_random
      self.created_at = DateTime.now.utc
      self.protocol   = "#{get_project_code}#{get_timestamp}#{self.random}"
    end

    def get_random
      SecureRandom.alphanumeric(6).upcase
    end

    def get_timestamp
      self.created_at.strftime('%Y%m%d%H%M%S')
    end

    def get_project_code
      self.origin_project.first(3).upcase
    end
  end
end