class AccountManagersController < ApplicationController
  def index
    @account_manager = Account_manager.all

    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def show
    @account_manager = Account_manager.find_by_id(:account_manager_id)

    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def new
    @account_manager = Account_manager.new

    respond_to do |format|
      format.html
      format.json { render :json => @users }
    end
  end

  def edit
    @account_manager = Account_manager.find_by_id(:account_manager_id)

    respond_to do
      format.html
      format.json { render :json => @users }
    end
  end

  def create
    @account_manager = Account
end
    