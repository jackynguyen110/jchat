class MessagesController < ApplicationController
  def newmessage

    if !session[:user_id].nil?
      @currentUser = User.find(session[:user_id])
      @receiverUser = User.find(params[:id])

      @messages = Message.where(sender_id: session[:user_id]).or(Message.where(reciver_id: params[:id]))
      #abort()
    else

      redirect_to login_path

    end

  end

  def createmessage
    @message = Message.new(params_message)
    @message.sender_id = session[:user_id]
    @message.reciver_id = params[:id]

    if @message.save
      flash[:success] = "Send Message successful !"
      redirect_to "/sendmessage/#{params[:id]}"
    else
      abort()
      flash[:error]   = "Can not send"
      redirect_to "/sendmessage/#{params[:id]}"
    end
  end

  def readmessage 
    Message.updateReadAt(params[:id])
    redirect_to "/sendmessage/#{params[:id]}"
  end

  private

  def params_message
    params.require(:message).permit(:body)
  end

  
end
