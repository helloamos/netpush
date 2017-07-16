class PhoneListsController < ApplicationController
	before_action :set_phone_list, only: [:show, :edit, :update, :destroy]
	layout("dash")

	def index
		@phone_lists = PhoneList.all
	end

	def new 
		@phone_list = PhoneList.new
	end

	def create
		#if params[:libelle].nil?
			#flash.now[:notice] = "Message is available in same request-response cycle"
		#else
		@phone_list = current_user.phone_lists.build(phone_list_params)

	    respond_to do |format|
	      if @phone_list.save
	      	
	        format.html { redirect_to phone_list_path, notice: 'Operation was successfully created.' }
	        format.json { render :show, status: :created, location: phone_broadcast_list_path }
	       else
	        format.html { render :new }
	        format.json { render json: @phone_list.errors, status: :unprocessable_entity }
	      end
	    end
	#end
	end

	def update
	    respond_to do |format|
	      if @phone_list.update(phone_list_params)
	        format.html { redirect_to phone_list_path, notice: 'Operation was successfully updated.' }
	        format.json { render :show, status: :ok, location: @phone_list }
	      else
	        format.html { render :edit }
	        format.json { render json: @mail_list.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /ponies/1
	  # DELETE /ponies/1.json
	  def destroy
	    @phone_list.destroy
	    respond_to do |format|
	      format.html { redirect_to operations_url, notice: 'Client was successfully destroyed.' }
	      format.json { head :no_content }
	      
	    end
	  end

	

	private

	def set_phone_list
		@phone_list = PhoneList.find(params[:id])
		
	end
	def phone_list_params
		params.require(:phone_list).permit(:full_name, :phone, :city, :country, :email )
	end

end