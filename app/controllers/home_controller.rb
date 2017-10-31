class HomeController < ApplicationController
	skip_before_action :current_user
  	before_action :check_auth
	def index
	    session[:chats] ||= []
	 
	    users = User.all.where.not(id: current_user)
	    chats = Chat.includes(:users, :messages).find(session[:chats])
  	end

  	def check_auth
   		unless current_user
   		redirect_to :controller => :welcome
    end
end

end
