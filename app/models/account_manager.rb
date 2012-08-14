class AccountManager < ActiveRecord::Base
  attr_accessible :name, :surname, :email

  has_and_belongs_to_many :clients

  validates_associated :clients
  validates_presence_of :name, :surname
  validates :email, :presence => true, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :uniqueness => true
end
