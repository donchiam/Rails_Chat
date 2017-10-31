class WelcomeController < ApplicationController
	skip_before_action :current_user
	helper_method :create
	
  def index
  	#render layout: "welcome_layout"
  end

	def create
		redirect_to "sessions/new"
	end

end
