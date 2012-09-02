#require 'factory_girl'

FactoryGirl.define do
  factory :relationship do
    client {|c| c.association(:client)}
    account_manager {|a| a.association(:account_manager)}
  end
end