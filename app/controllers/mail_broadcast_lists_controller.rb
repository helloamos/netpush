class MailBroadcastListsController < ApplicationController
	before_action :set_operation, only: [:show, :edit, :update, :destroy]
	layout("dash")

	def index
		@mail_broadcast_lists = MailBroadcastList.all
	end

	def new 
		@mail_broadcast_list = MailBroadcastList.new
	end

	def create
		#if params[:libelle].nil?
			#flash.now[:notice] = "Message is available in same request-response cycle"
		#else
		@mail_broadcast_list = current_user.mail_broadcast_lists.build(mail_broadcast_list_params)

	    respond_to do |format|
	      if @mail_broadcast_list.save
	      	
	        format.html { redirect_to mail_broadcast_list_path, notice: 'Operation was successfully created.' }
	        format.json { render :show, status: :created, location: mail_broadcast_list_path }
	       else
	        format.html { render :new }
	        format.json { render json: @mail_broadcast_list.errors, status: :unprocessable_entity }
	      end
	    end
	#end
	end

	def update
	    respond_to do |format|
	      if @mail_broadcast_list.update(mail_broadcast_list_params)
	        format.html { redirect_to mail_broadcast_list_path, notice: 'Operation was successfully updated.' }
	        format.json { render :show, status: :ok, location: @mail_broadcast_list }
	      else
	        format.html { render :edit }
	        format.json { render json: @mail_broadcast_list.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  # DELETE /ponies/1
	  # DELETE /ponies/1.json
	  def destroy
	    @mail_broadcast_list.destroy
	    respond_to do |format|
	      format.html { redirect_to operations_url, notice: 'Client was successfully destroyed.' }
	      format.json { head :no_content }
	      format.js   { render :layout => false }
	    end
	  end

	

	private

	def set_mail_broadcast_list
		@mail_broadcast_list = MailBroadcastList.find(params[:id])
		
	end
	def mail_broadcast_list_params
		params.require(:mail_broadcast_list).permit(:name, :description, :status )
	end

end