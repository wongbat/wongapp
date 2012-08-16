class Client < ActiveRecord::Base
  attr_accessible :company, :contact

  has_many :relationships
  has_many :account_managers, :through => :relationships
  has_many :campaigns

  validates_associated :account_managers, :campaigns
  validates_presence_of :company
  validates :contact, :presence => true, :only_integer => true, :length => 11
end
