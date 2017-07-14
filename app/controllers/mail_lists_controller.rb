class MailListsController < ApplicationController
	before_action :set_mail_list, only: [:show, :edit, :update, :destroy]
	layout("dash")

	def index
		@mail_lists = MailList.all
	end

	def new 
		@mail_list = MailList.new
	end

	def create
		#if params[:libelle].nil?
			#flash.now[:notice] = "Message is available in same request-response cycle"
		#else
		@mail_list = current_user.mail_lists.build(mail_list_params)

	    respond_to do |format|
	      if @mail_list.save
	      	
	        format.html { redirect_to mail_list_path, notice: 'Operation was successfully created.' }
	        format.json { render :show, status: :created, location: phone_broadcast_list_path }
	       else
	        format.html { render :new }
	        format.json { render json: @mail_list.errors, status: :unprocessable_entity }
	      end
	    end
	#end
	end

	def update
	    respond_to do |format|
	      if @mail_list.update(mail_list_params)
	        format.html { redirect_to mail_list_path, notice: 'Operation was successfully updated.' }
	        format.json { render :show, status: :ok, location: @mail_list }
	      else
	        format.html { render :edit }
	        format.json { render json: @mail_list.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /ponies/1
	  # DELETE /ponies/1.json
	  def destroy
	    @mail_list.destroy
	    respond_to do |format|
	      format.html { redirect_to operations_url, notice: 'Client was successfully destroyed.' }
	      format.json { head :no_content }
	      
	    end
	  end

	

	private

	def set_mail_list
		@mail_list = MailList.find(params[:id])
		
	end
	def mail_list_params
		params.require(:mail_list).permit(:full_name, :phone, :city, :country, :email )
	end

end