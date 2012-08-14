class Client < ActiveRecord::Base
  attr_accessible :company, :contact

  has_and_belongs_to_many :account_managers
  has_many :campaigns

  validates_associated :account_managers, :campaigns
  validates_presence_of :company
  validates :contact, :presence => true, :only_integer => true, :length => 11
end
