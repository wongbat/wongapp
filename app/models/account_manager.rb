class AccountManager < ActiveRecord::Base
  attr_accessible :name, :surname, :email

  has_many :relationships
  has_many :clients, :through => :relationships

  validates_associated :clients
  validates_presence_of :name, :surname
  validates :email, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :uniqueness => true
end
