class PhoneBroadcastListsController < ApplicationController
	before_action :set_mail_broadcast_list, only: [:show, :edit, :update, :destroy]
	layout("dash")

	def index
		@phone_broadcast_lists = PhoneBroadcastList.all
	end

	def new 
		@phone_broadcast_list = PhoneBroadcastList.new
	end

	def create
		#if params[:libelle].nil?
			#flash.now[:notice] = "Message is available in same request-response cycle"
		#else
		@phone_broadcast_list = current_user.phone_broadcast_lists.build(phone_broadcast_list_params)

	    respond_to do |format|
	      if @phone_broadcast_list.save
	      	
	        format.html { redirect_to phone_broadcast_list_path, notice: 'Operation was successfully created.' }
	        format.json { render :show, status: :created, location: phone_broadcast_list_path }
	       else
	        format.html { render :new }
	        format.json { render json: @phone_broadcast_list.errors, status: :unprocessable_entity }
	      end
	    end
	#end
	end

	def update
	    respond_to do |format|
	      if @phone_broadcast_list.update(phone_broadcast_list_params)
	        format.html { redirect_to phone_broadcast_list_path, notice: 'Operation was successfully updated.' }
	        format.json { render :show, status: :ok, location: @phone_broadcast_list }
	      else
	        format.html { render :edit }
	        format.json { render json: @phone_broadcast_list.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /ponies/1
	  # DELETE /ponies/1.json
	  def destroy
	    @phone_broadcast_list.destroy
	    respond_to do |format|
	      format.html { redirect_to operations_url, notice: 'Client was successfully destroyed.' }
	      format.json { head :no_content }
	      format.js   { render :layout => false }
	    end
	  end

	

	private

	def set_phone_broadcast_list
		@mail_broadcast_list = MailBroadcastList.find(params[:id])
		
	end
	def phone_broadcast_list_params
		params.require(:phone_broadcast_list).permit(:name, :description, :status )
	end

end