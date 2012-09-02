class Campaign < ActiveRecord::Base
  attr_accessible :title, :style, :client_id, :client, :account_manager_id

  belongs_to :client

  validates_associated :client
  validates_presence_of :client, :title, :style
end
