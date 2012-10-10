#require 'factory_girl'

FactoryGirl.define do
  factory :campaign do |x|
    x.title "Win ipod"
    x.style "Sweepstakes"
    x.client {|a| a.association(:client)}
  end

  factory :unassigned_campaign, :class => Campaign do
    title "Win ipod"
    style "Sweepstakes"
  end
end
