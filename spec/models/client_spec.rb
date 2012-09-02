require 'spec_helper'

describe Client do

  it "should not save with a blank company" do
    client = FactoryGirl.build(:client, :company => " ")
    expect { client.save! }.should raise_error(ActiveRecord::RecordInvalid, /Company can't be blank/)
  end

  it "should not save without a valid contact number" do
    client = FactoryGirl.build(:client, :contact => 1234)
    expect { client.save! }.should raise_error(ActiveRecord::RecordInvalid, /Contact is invalid/)
  end

  it "should not save with a duplicate contact number" do
    client = FactoryGirl.build(:client, :contact => 43540175167)
    expect { client.save! }.should raise_errie(ActiveRecord::RecordInvalid, /Contact already exists/)
  end

  it "should not save without associated Account Manager" do
    client = FactoryGirl.build(:unassigned_client)
    expect { client.save! }.should raise_error(ActiveRecord::RecordInvalid, /Account managers can't be blank/)
  end

  it "should save with valid company, contact number, Account Manager" do
    client = FactoryGirl.build(:client)
    client.save.should == true
  end

  it "should create new relationship with Account Manager" do
    client = FactoryGirl.create(:client)
    client.relationships.count.should == 1
  end

  context "client with multiple Account Managers" do
    before(:each) do
      @client = FactoryGirl.create(:client)
      @client.account_managers << FactoryGirl.create(:account_manager, :name => "jim", :surname => "sub", :email => "j@wf.com")
      @client.account_managers << FactoryGirl.create(:account_manager, :name => "will", :surname => "wallace", :email => "w@me.com")
    end

    it "should have 3 Account Managers" do
      @client.account_managers.length.should == 3
    end

    it "should have 3 relationships" do
      @client.relationships.length.should == 3
    end
  end
end
