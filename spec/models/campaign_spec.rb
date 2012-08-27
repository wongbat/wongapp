require 'spec_helper'

describe Campaign do
  it "should not save without a title" do
    campaign = FactoryGirl.build(:campaign, :title => " ")
    expect { campaign.save! }.to raise_error(ActiveRecord::RecordInvalid, /Title can't be blank/)
  end

  it" should not save without a type selected" do
    campaign = FactoryGirl.build(:campaign, :style => nil)
    expect { campaign.save! }.to raise_error(ActiveRecord::RecordInvalid, /Style can't be blank/)
  end

  it "should not save without an associated client" do
    campaign = FactoryGirl.build(:invalid_campaign)
    expect { campaign.save! }.to raise_error(ActiveRecord::RecordInvalid, /Client can't be blank/)
  end

  it "should save with valid title, type, client, Account Manager" do
    campaign = FactoryGirl.build(:campaign)
    campaign.save.should == true
  end
end

  