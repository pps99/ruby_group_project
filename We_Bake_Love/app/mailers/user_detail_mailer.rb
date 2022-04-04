class UserDetailMailer < ApplicationMailer
  before_action :set_params

  def accept_mail
    @user = params[:user]
    mail(to: @user.email, subject: "WeBakeLove Order Confirmaiton - Order \##{@user_detail.id}")
  end

  def cancel_mail
    mail(to: @user.email, subject: "Cancellation for Order ID \##{@user_detail.id}")
  end
  
  def set_params
    @user = params[:user]
    @user_detail = params[:user_detail]
  end
end
