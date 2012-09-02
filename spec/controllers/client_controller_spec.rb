require 'spec_helper'

describe ClientsController do
  describe "GET index" do
    before (:each) do
      @client = FactoryGirl.create(:client)
      get :index, :account_manager_id => AccountManager.last.id
    end

    it "should assign clients" do
      assigns(:clients).should eq([@client])
    end

    it "should render index of clients" do
      response.should render_template("index")
    end
  end

  describe "GET show" do
    before (:each) do
      @client = FactoryGirl.create(:client)
    end

    it "should render the show view" do
      get :show, :id => @client.id, :account_manager_id => AccountManager.last.ids
      response.should render_template("show")
    end
  end

  describe "GET new" do
    it "should render the new view" do
      @account_manager = FactoryGirl.create(:account_manager)
      get :new, :account_manager_id => AccountManager.last.id
      response.should render_template("new")
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      before (:each) do
        @account_manager = FactoryGirl.create(:account_manager)
        @client = FactoryGirl.attributes_for(:unassigned_client)
      end

      it "should add 1 record to clients" do
        expect {
          post :create, :account_manager_id => @account_manager.id, :client => @client
        }.to change(Client, :count).by(1)
      end

      it "assigns and shows the new client in index" do
        post :create, :account_manager_id => @account_manager.id, :client => @client
        assigns(:client).company.should eq(@client[:company])
        assigns(:client).contact.should eq(@client[:contact])
        #problem here - am & client exist but are not associated
        response.should redirect_to account_manager_clients_path(@account_manager)
      end
    end

    context "with invalid attributes" do
      before (:each) do
        @account_manager = FactoryGirl.create(:account_manager)
        @client = FactoryGirl.attributes_for(:invalid_client)
      end

      it "should not create a new record" do
        expect {
          post :create, :account_manager_id => @account_manager.id, :client => @client
        }.to change(Client, :count).by(0)
      end

      it "redirects back to the 'new' page" do
        post :create, :account_manager_id => @account_manager.id, :client => @client
        response.should render_template :new
      end
    end
  end

  describe "PUT update" do
    context "with valid attributes" do
      before (:each) do
        @account_manager = FactoryGirl.create(:account_manager)
        @client = FactoryGirl.create(:unassigned_client)
        put :update, :id => @account_manager.client.last, :client => FactoryGirl.attributes_for(:unassigned_client, :company => "Virgin", :contact => 23423423444, :account_manager = FactoryGirl.create(:account_manager2))
      end

      it "assigns the updated details" do
        assigns(:client).company.should eq("Virgin")
        assigns(:client).contact.shold eq(23423423444)
      end

      it "should store the updated details" do
        @client.reload
        @client.company.should eq("Virgin")
        @client.contact.should eq(23423423444)
      end

      it "shows the new client details" do
        redirect_to account_manager_client_path(@account_manager)
      end
    end

    context "with invalid attributes" do
      before (:each) do
        @client = FactoryGirl.create(:unassigned_client)
        put :update, :id => @client.id, :client => FactoryGirl.attributes_for(:unassigned_client, :company => " ", :contact => " ")
      end

      it "should not update client details" do
        @client.reload
        @client.company.should eq("Nike")
        @client.contact.should eq(43540175167)
      end

      it "should render the edit template" do
        redirect_to edit_account_manager_client_path(@account_manager)
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @client = FactoryGirl.create(:unassigned_client)
    end

    it "should destroy the user" do
      expect{
        delete :destroy, :id => @client
      }.to change(Client,:count).by(-1)
    end

    it "should destroy associated campaigns" do
      campaigns = @client.campaigns
      @client.destroy
      campaigns each do |c|
        c.destroy
      Campaign.find_by_id(campaign.id).should == nil
      end
    end

    it "should redirect to index" do
      redirect_to account_manager_clients_path(@account_manager)
    end
  end
end
