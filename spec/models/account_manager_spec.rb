require 'spec_helper'

describe AccountManager do
  it "should not save with a blank name" do
    account_manager = FactoryGirl.build(:account_manager, :name => " ")
    expect { account_manager.save! }.should raise_error(ActiveRecord::RecordInvalid, /Name can't be blank/)
  end

  it "should not save with a blank surname" do
    account_manager = FactoryGirl.build(:account_manager, :surname => " ")
    expect { account_manager.save! }.should raise_error(ActiveRecord::RecordInvalid, /Surname can't be blank/)
  end

  it "should not save without a valid email" do
    account_manager = FactoryGirl.create(:account_manager, :email => "wef@de")
    expect { account_manager.save! }.should raise_error(ActiveRecord::RecordInvalid, /Email is invalid/)
  end

  it "should not save with duplicate email" do
    account_manager = FactoryGirl.create(:account_manager, :email => "fran@wildfireapp.com")
    account_manager2 = FactoryGirl.build(:account_manager, :name => "will", :surname => "wallace", :email => "fran@wildfireapp.com")
    expect { account_manager2.save! }.should raise_error(ActiveRecord::RecordInvalid, /Email has already been taken/)
  end

  it "should save with valid name, surname, email" do
    account_manager = FactoryGirl.build(:account_manager)
    account_manager.save.should == true
  end

  context "Account Manager with multiple clients" do
    before(:each) do
      @am = FactoryGirl.create(:account_manager)
      @am.clients << FactoryGirl.create(:invalid_client)
      @am.clients << FactoryGirl.create(:invalid_client, :company => "ecco", :contact => 34587623943)
    end

    it "should have 2 clients" do
      @am.clients.length.should == 2
    end

    it "should have 2 relationships" do
      @am.relationships.length.should == 2
    end
  end
end
