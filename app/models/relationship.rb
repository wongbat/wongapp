class Relationship < ActiveRecord::Base
  attr_accessible :account_manager_id, :client_id

  belongs_to :account_manager
  belongs_to :client
end