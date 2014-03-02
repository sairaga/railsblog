class UserController < ApplicationController
  
  def login
  	@loginuser = User.new 
  	session[:authenticated] = false
  end

  def authenticate
  		#render inline: '<h1> Authenticated #{params} </h1>'
  		@u = User.where( :userid => params[:userid],
  						:password => params[:password]).first
  		unless @u.nil?
  			#if params[:user_name] == "john" and params[:user_password] == "welcome"
  			session[:authenticated] = true
  			session[:userid] = params[:user_userid]
  			redirect_to :posts
  		else
  			flash[:error] = "User authentication failure"
  			redirect_to :user_login
  		end
  end

  def add
  	@addUser = User.new
  end

  def insert
  	@u = User.new(user_params)
  	if @u.save
  	    flash[:notice] = "User added."
  	else	
  	    flash[:notice] = "User cannot be added"
  	end	
  	redirect_to :posts
  end

  def logout
   		session.clear
  		flash[:error] = "You have been logged out!"
  		redirect_to :user_login
  end

  private




  def user_params
    params.require(:user).permit(:userid, :password, :name) 
  end
end
