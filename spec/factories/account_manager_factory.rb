require 'factory_girl'

FactoryGirl.define do
  factory :account_manager do
    name "Fran"
    surname "Warrington"
    email "fran@wildfireapp.com"
  end

  factory :account_manager2, :parent => :account_manager do
    name "Lanier"
    surname "Pietras"
    email "lanier@wildfireapp.com"
  end

  factory :invalid_account_manager, :parent => :account_manager do
    name " "
    surname " "
    email "wede"
  end

  factory :account_manager_with_clients, :parent => :account_manager do
    after_create do |account_manager|
      FactoryGirl.create(:client, :account_manager => account_manager)
    end
  end
end
