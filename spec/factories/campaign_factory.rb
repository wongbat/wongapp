require 'factory_girl'

FactoryGirl.define do
  factory :campaign do
    title "Win ipod"
    style "Sweepstakes"
    client {FactoryGirl.create(:client)}
  end

  factory :invalid_campaign, :class => Campaign do
    title "Win ipod"
    style "Sweepstakes"
  end
end
