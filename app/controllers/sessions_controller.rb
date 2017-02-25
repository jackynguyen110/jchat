class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] =" login success"
      redrect_to root_path
      
    else
      flash.now[:danger] = "incorrect email and password"
      render 'new'
    end
  end
  
  def destroys
    
  end
  
end
