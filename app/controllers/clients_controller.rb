class ClientsController < ApplicationController

  def index
    @account_manager = AccountManager.find(params[:account_manager_id])
    @clients = @account_manager.clients.all

    respond_to do |format|
      format.html
      format.json { render :json => @clients }
    end
  end

  def show
    @account_manager = AccountManager.find(params[:account_manager_id])
    @clients = @account_manager.clients.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @client }
    end
  end

  def new
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.clients.new

    respond_to do |format|
      format.html
      format.json { render :json => @client }
    end
  end

  def edit
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:id])
  end

  def create
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.clients.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to account_manager_clients_path(@account_manager), :notice => "successfully created!" }
        format.json { render :json => @client }
      else
        format.html { render :action => "new" }
        format.json { render :json => @client }
      end
    end
  end

  def update
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:client_id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to account_manager_client_path(@account_manager, @client), :notice => "successfully updated!" }
        format.json { render :json => @client }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @client }
      end
    end
  end

  def destroy
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:client_id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to account_manager_clients_path(@account_manager), :notice => "deleted" }
      format.json { render :json => @client }
    end
  end
end
  