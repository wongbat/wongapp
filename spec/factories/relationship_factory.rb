#require 'factory_girl'

FactoryGirl.define do
  factory :relationship do |x|
    x.client {|a| a.association(:unassigned_client)}
    x.account_manager {|a| a.association(:account_manager2)}
  end
end