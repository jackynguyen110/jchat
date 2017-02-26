class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create

    @user = User.new(users_params)
    if @user.save
      flash[:success] = "Signup success"
      redirect_to root_path
    else
      abort("s")
      render 'new'
    end
  end

  def add_friend

    if !session[:user].nil?
        user = User.find(session[:user]["id"])
        user.list_friends.push params[:id]
        user.save
        flash[:success] = "Add friend successful !"
        redirect_to root_path
    else
      abort(session[:user])
    end


    
  end

  
  private
  
  def users_params
    params.require(:user).permit(:name, :email, :password)
  end
    
  
end
