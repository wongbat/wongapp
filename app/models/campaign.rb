class Campaign < ActiveRecord::Base
  attr_accessible :title, :type, :client_id

  belongs_to :client

  validates_associated :client
  validates_presence_of :title, :type
end
