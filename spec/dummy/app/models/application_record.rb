class ApplicationRecord < ActiveRecord::Base
  include Protocolize::ActsAsProtocolize

  self.abstract_class = true
end
