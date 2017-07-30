class CampaignsController < ApplicationController
	before_action :set_campaign_list, only: [:show, :edit, :update, :destroy]
	layout("dash")

	def index
		@campaigns = Campaign.all
	end

	def new 
		@campaign = Campaign.new
	end

	def create
		#if params[:libelle].nil?
			#flash.now[:notice] = "Message is available in same request-response cycle"
		#else
		@campaign = current_user.campaigns.build(campaign_params)

	    respond_to do |format|
	      if @campaign.save
	      	
	        format.html { redirect_to campaign_path, notice: 'Operation was successfully created.' }
	        format.json { render :show, status: :created, location: campaign_path }
	       else
	        format.html { render :new }
	        format.json { render json: @phone_list.errors, status: :unprocessable_entity }
	      end
	    end
	#end
	end

	def update
	    respond_to do |format|
	      if @campaign.update(campaign_params)
	        format.html { redirect_to campaign_path, notice: 'Operation was successfully updated.' }
	        format.json { render :show, status: :ok, location: @campaign }
	      else
	        format.html { render :edit }
	        format.json { render json: @campaign.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /ponies/1
	  # DELETE /ponies/1.json
	  def destroy
	    @campaign.destroy
	    respond_to do |format|
	      format.html { redirect_to operations_url, notice: 'Client was successfully destroyed.' }
	      format.json { head :no_content }
	      
	    end
	  end

	

	private

	def set_campaign
		@campaign = Campaign.find(params[:id])
		
	end
	def campaign_params
		params.require(:campaign).permit(:campaign_type, :campaign_name, :sender, :recipient, :object, :content )
	end

end