class AccountManagersController < ApplicationController

  def index
    @account_managers = AccountManager.all

    respond_to do |format|
      format.html
      format.json { render :json => @account_managers }
    end
  end

  def show
    @account_manager = AccountManager.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @account_manager }
    end
  end

  def new
    @account_manager = AccountManager.new

    respond_to do |format|
      format.html
      format.json { render :json => @account_manager }
    end
  end

  def edit
    @account_manager = AccountManager.find(params[:id])
  end

  def create
    @account_manager = AccountManager.new(params[:account_manager])

    respond_to do |format|
      if @account_manager.save
        format.html { redirect_to account_manager_path(@account_manager), :notice => "successfully created!" }
        format.json { render :json => @account_manager }
      else
        format.html {render :action => "new" }
        format.json { render :json => @account_manager }
      end
    end
  end

  def update
    @account_manager = AccountManager.find(params[:id])

    respond_to do |format|
      if @account_manager.update_attributes(params[:account_manager])
        format.html { redirect_to account_manager_path, :notice => "successfully updated!" }
        format.json { render :json => @account_manager }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @account_manager }
      end
    end
  end

  def destroy
    @account_manager = AccountManager.find(params[:id])
    @account_manager.destroy

    respond_to do |format|
      format.html {redirect_to account_managers_path, :notice => "deleted"}
      format.json { render :json => @account_manager }
    end
  end
end
    