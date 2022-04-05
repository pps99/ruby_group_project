class UserDetailsController < ApplicationController
  before_action :require_login

  def new
    @user_detail = UserDetail.new
  end

  def index
    @user_details = UserDetail.where(status: "pending")
    @user_orderaccepteddetails = UserDetail.where(status: "accepted")
    @user_ordercancelleddetails = UserDetail.where(status: "cancelled")
  end

  def show
    @user_details = UserDetailService.getUserDetailsByID(params[:id])
    @user_details = @user_details.where(status: "pending")
    @user_detail = UserDetailService.getUserDetailByID(params[:id])
  end

  def accept
    @user_detail = UserDetail.find(params[:format])
    @sql = "SET SQL_SAFE_UPDATES = 0;"
    ActiveRecord::Base.connection.execute(@sql)
    @sql = "update user_details set status='accepted' where user_id =#{@user_detail.user.id} ;"
    ActiveRecord::Base.connection.execute(@sql)
    @sql_safe_mode = "SET SQL_SAFE_UPDATES = 1;"
    ActiveRecord::Base.connection.execute(@sql_safe_mode)
    UserDetailMailer.with(user: @user_detail.user, user_detail: @user_detail).accept_mail.deliver_now
    Rails.logger.debug(current_user)
    redirect_to user_details_path
  end
  def cancel
    @user_detail = UserDetail.find(params[:format])
    @sql = "SET SQL_SAFE_UPDATES = 0;"
    ActiveRecord::Base.connection.execute(@sql)
    @sql = "update user_details set status='cancelled' where user_id =#{@user_detail.user.id} ;"
    ActiveRecord::Base.connection.execute(@sql)
    @sql_safe_mode = "SET SQL_SAFE_UPDATES = 1;"
    ActiveRecord::Base.connection.execute(@sql_safe_mode)
    UserDetailMailer.with(user: @user_detail.user, user_detail: @user_detail).cancel_mail.deliver_now
    redirect_to user_details_path
  end

  def create
 
 
    @sql = "select * from cart_items;"
    @cart_items =  ActiveRecord::Base.connection.execute(@sql)
    
    Rails.logger.debug(@cart_items)
    @cart_items.each do |cart_item|
      @user_detail = UserDetail.new(userdetail_params)
      @is_user_detail_create = UserDetailService.createUserDetail(@user_detail)
      @user_detail.cake_name = cart_item[3]
      @user_detail.quantity = cart_item[1]
      @user_detail.price = cart_item[5]
      @user_detail.save
    end

    if @is_user_detail_create
      @sql = "SET SQL_SAFE_UPDATES = 0;"
      ActiveRecord::Base.connection.execute(@sql)
      @sql_delete = "delete  from cart_items;"
      ActiveRecord::Base.connection.execute(@sql_delete)
      @sql_safe_mode = "SET SQL_SAFE_UPDATES = 1;"
      ActiveRecord::Base.connection.execute(@sql_safe_mode)
      redirect_to root_path, notice: "Your Order is submitted"
    else
      render :new
    end
  end

  def edit
    @user_detail = UserDetailService.getUserDetailByID(params[:id])
  end

  private

  def userdetail_params
    params.require(:user_detail).permit(:phone, :address, :user_id, :status, :total)
  end
end
