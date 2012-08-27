class Client < ActiveRecord::Base
  attr_accessible :company, :contact, :account_managers

  has_many :relationships
  has_many :account_managers, :through => :relationships
  has_many :campaigns

  validates_associated :campaigns, :account_managers
  validates_presence_of :company
  validates_numericality_of :contact
  validates :contact, :format => /\d{10}/, :uniqueness => true
end
