require 'spec_helper'

describe AccountManagersController do
  describe "GET index" do
    before :each do
      @account_managers = FactoryGirl.create(:account_manager)
      get :index
    end

    it "assigns @account_managers" do
      assigns(:account_managers).should eq([@account_managers])
    end

    it "renders the index template" do
      response.should render_template :index
    end
  end

  describe "GET show" do
    before (:each) do
      @account_manager = FactoryGirl.create(:account_manager)
    end

    it "renders the show view" do
      AccountManager.should_receive(:find).with(@account_manager.id.to_s).and_return(@account_manager)
      get :show, :id => @account_manager.id
      response.should render_template :show
    end
  end

  describe "GET new" do
    it "renders the new view" do
      get :new
      response.should render_template('new')
    end
  end

  describe "POST new" do
    context "with valid attributes" do
      it "should create a new record" do
        expect{
          post :create, :account_manager => FactoryGirl.attributes_for(:account_manager)
        }.to change(AccountManager,:count).by(1)
      end

      it "should save and redirect to the new Acocunt Manager" do
        account_manager = FactoryGirl.attributes_for(:account_manager)
        post :create, :account_manager => account_manager
        assigns(:account_manager).name.should eq(account_manager[:name])
        assigns(:account_manager).surname.should eq(account_manager[:surname])
        assigns(:account_manager).email.should eq(account_manager[:email])
        response.should redirect_to assigns(:account_manager)
      end
    end

    context "with invalid attributes" do
      it "should not save a new record" do
        expect{ 
          post :create, :account_manager => FactoryGirl.attributes_for(:invalid_account_manager)
        }.to_not change(AccountManager,:count)
      end

      it "should redirect to new" do
        post :create, :account_manager => FactoryGirl.attributes_for(:invalid_account_manager)
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    context "with valid attributes" do
      before (:each) do
        @account_manager = FactoryGirl.create(:account_manager)
        put :update, :id => @account_manager, :account_manager => FactoryGirl.attributes_for(:account_manager2)
      end

      it "renders the updated @account_manager details" do
        assigns(:account_manager).name.should eq("Lanier")
        assigns(:account_manager).surname.should eq("Pietras")
        assigns(:account_manager).email.should eq("lanier@wildfireapp.com")
      end

      it "stores the updated @account_manager attributes" do
        @account_manager.reload
        @account_manager.name.should eq("Lanier")
        @account_manager.surname.should eq("Pietras")
        @account_manager.email.should eq("lanier@wildfireapp.com")
      end

      it "redirects to the updated user" do
        response.should redirect_to @account_manager
      end
    end

    context "with invalid attributes" do
      before (:each) do
        @account_manager = FactoryGirl.create(:account_manager)
      end

      it "locates the requested @user" do
        put :update, :id => @account_manager, :account_manager => FactoryGirl.attributes_for(:invalid_account_manager)
        assigns(:account_manager).should eq(@account_manager)
      end

      it "does not change attributes for @account_manager" do  
        put :update, :id => @account_manager, :account_manager => FactoryGirl.attributes_for(:invalid_account_manager)
        @account_manager.reload
        @account_manager.name.should eq("Fran")
        @account_manager.surname.should eq("Warrington")
        @account_manager.email.should eq("fran@wildfireapp.com")
      end

      it "renders the edit template" do
        put :update, :id => @account_manager, :account_manager => FactoryGirl.attributes_for(:invalid_account_manager)
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before (:each) do
      @account_manager = FactoryGirl.create(:account_manager)
    end

    it "deletes the user" do
      expect{
        delete :destroy, :id => @account_manager
      }.to change(AccountManager,:count).by(-1)
    end

    it "redirects to index" do
      delete :destroy, :id => @account_manager
      response.should redirect_to("/account_managers")
    end
  end
end
  