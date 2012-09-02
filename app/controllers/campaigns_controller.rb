class CampaignsController < ApplicationController

  def index
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.clients.find(params[:client_id])
    @campaigns = @client.campaigns.all

    respond_to do |format|
      format.html
      format.json { render :json => @campaigns }
    end
  end

  def show
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.clients.find(params[:client_id])
    @campaign = @client.campaigns.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @campaign }
    end
  end

  def new
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.clients.find(params[:client_id])
    @campaign = @client.campaigns.new

    respond_to do |format|
      format.html
      format.json { render :json => @campaign }
    end
  end

  def edit
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.clients.find(params[:client_id])
    @campaign = @client.campaigns.find(params[:id])
  end

  def create
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.clients.find(params[:client_id])
    @campaign = @client.campaigns.new(params[:campaign])

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to account_manager_client_campaigns_path(@account_manager, @client), :notice => "you created a campaign!" }
        format.json { render :json => @campaign }
      else
        format.html { render :action => "new" }
        format.json { render :json => @campaign }
      end
    end
  end

  def update
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.clients.find(params[:client_id])
    @campaign = @client.campaigns.find(params[:id])

    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to account_manager_client_campaign_path(@account_manager, @client, @campaign), :notice => "campaign changes saved" }
        format.json { render :json => @campaign }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @campaign }
      end
    end
  end

  def destroy
    @account_manager = AccountManager.find(params[:account_manager_id])
    @client = @account_manager.clients.find(params[:client_id])
    @campaign = @client.campaigns.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to account_manager_client_campaigns_path(@account_manager, @client), :notice => "campaign deleted" }
      format.json { render :json => @campaign }
    end
  end
end
   