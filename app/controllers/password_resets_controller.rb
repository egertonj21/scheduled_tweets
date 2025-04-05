class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #send email
      PasswordMailer.with(user: @user).reset.deliver_later
    end


      redirect_to root_path, notice: "If an account with this email exists, a link to reset password has been sent"      
    
    
  end

end
