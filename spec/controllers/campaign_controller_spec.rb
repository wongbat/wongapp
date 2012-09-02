require 'spec_helper'

describe CampaignsController do
  describe "GET index" do
    before (:each) do
      @campaign = FactoryGirl.create(:campaign)
      get :index, :account_manager_id => AccountManager.last.id, :client_id => Client.last.id
    end

    it "should assign campaigns" do
      assigns(:campaigns).should eq([@campaign])
    end

    it "should render the index template" do
      response.should render_template("index")
    end
  end

  describe "GET show" do
    before (:each) do
      @campaign = FactoryGirl.create(:campaign)
      get :show, :account_manager_id => AccountManager.last.id, :client_id => Client.last.id, :id => @campaign.id
    end

    it "should assign the campaign" do
      assigns(:campaign).should eq(@campaign)
    end

    it "should display the campaign" do
      response.should render_template("show")
    end
  end

  describe "GET new" do
    before (:each) do
      @client = FactoryGirl.create(:client)
      get :new, :account_manager_id => AccountManager.last.id, :client_id => Client.last.id
    end

    it "should render the new template" do
      response.should render_template("new")
    end
  end

  describe "POST create" do
    before (:each) do
      @campaign = FactoryGirl.attributes_for(:campaign)
    end

    it "should add 1 to the campaign list" do
      expect {
        post :create, :account_manager_id => AccountManager.last.id, :client_id => Client.last.id, :campaign => @campaign
      }.to change(Campaign, :count).by(1)
    end
  end
end