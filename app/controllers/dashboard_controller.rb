class DashboardController < ApplicationController
	before_action :authenticate_user!
	layout("dash")
	def show
	
	end

	def index
	end
	
end