class CampaignsController < ApplicationController
  def index
    @account_manager = Account_manager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:client_id])
    @campaigns = @client.campaigns.all

    respond_to do |format|
      format.html
      format.json { render :json => @campaigns }
    end
  end

  def show
    @account_manager = Account_manager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:client_id])
    @campaign = @client.campaign.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @campaign }
    end
  end

  def new
    @account_manager = Account_manager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:client_id])
    @campaign = @client.campaign.new

    respond_to do |format|
      format.html
      format.json { render :json => @campaign }
    end
  end

  def edit
    @account_manager = Account_manager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:client_id])
    @campaign = @client.campaign.find(params[:id])
  end

  def create
    @account_manager = Account_manager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:client_id])
    @campaign = @client.campaign.new(params[:campaign])

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to account_manager_client_campaigns_path, :notice "you created a campaign!"}
        format.json { render :json => @campaign }
      else
        format. { render :action => "new" }
        format.json { render :json => @campaign }
      end
    end
  end

  def update
    @account_manager = Account_manager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:client_id])
    @campaign = @client.campaign.find(params[:id])

    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to account_manager_client_campaigns_path, :notice "campaign changes saved" }
        format.json { render :json => @campaign }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @campaign }
      end
    end
  end

  def destroy
    @account_manager = Account_manager.find(params[:account_manager_id])
    @client = @account_manager.client.find(params[:client_id])
    @campaign = @client.campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to account_manager_client_campaigns_path, :notice => "campaign deleted" }
      format.json { render :json => @campaign }
    end
  end
end
   