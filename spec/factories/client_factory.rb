require 'factory_girl'

FactoryGirl.define do
  factory :client do
    company "Nike"
    contact 43540175167
    account_managers {[FactoryGirl.create(:account_manager)]}
#    after_build do |client|
#      client.account_managers << FactoryGirl.build(:account_manager, :client => client)
#    end
  end
#    after(:create) { |u| FactoryGirl.create(:account_manager, :client => u) }
#    factory :client_with_account_managers do
#      ignore do
#        account_managers_count 5
#      end
#      after(:create) do |client, evaluator|
#        FactoryGirl.create_list(:account_manager, evaluator.account_managers_count, :client => client)
#      end
#    end
  
  factory :invalid_client, :class => Client do
    company "Allianz"
    contact 3534534545
  end
end
