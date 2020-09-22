class ApplicationRecord < ActiveRecord::Base
  include Protocolize::ActsAsProtocolable

  self.abstract_class = true
end
