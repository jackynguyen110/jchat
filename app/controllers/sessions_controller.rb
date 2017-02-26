class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  

  def create
    user = User.find_by(email: params[:Email])
    
      #abort(params[:Email])
    if user && user.authenticate(params[:Password])
      session[:user] = user
      session[:user_id] = user.id
      flash[:success] =" login success"
      redirect_to root_path
    else
      #abort("A")
      flash.now[:danger] = "incorrect email and password"
      render 'new'
    end
  end
  
  def destroy
    session[:user] = nil
    session[:user_id] = nil
    redirect_to root_path
  end
  
end
