class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = UserService.getUserByID(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @is_user_create = UserService.createUser(@user)
    if @is_user_create
      redirect_to handle_login_path,alert: "Successfully Created Your Account"
    else
      render :new
    end
  end

  def edit
    @user = UserService.getUserByID(params[:id])
  end

  def update
    @user = UserService.getUserByID(params[:id])
    @is_user_update = UserService.updateUser(@user, user_params)
    if @is_user_update
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = UserService.getUserByID(params[:id])
    UserService.destroy(@user)
    redirect_to users_path
  end

  def validate_login
    @user = User.find_by(email: params[:email])
    if @user == nil
      redirect_to handle_login_path, notice: "Please Create the Account"
    elsif @user.authenticate(params[:password])

      session[:user_id] = @user.id
      redirect_to home_page_path
    elsif @user.password != params[:password]
      redirect_to handle_login_path, notice: "Email and Password Missmatched"
    end
  end

  def promote
    @user = UserService.getUserByID(params[:format])
    @sql = "update users set role='admin' where id =#{@user.id} ;"
    ActiveRecord::Base.connection.execute(@sql)
    redirect_to users_path
  end

  def degrade
    @user = UserService.getUserByID(params[:format])
    @sql = "update users set role='user' where id =#{@user.id} ;"
    ActiveRecord::Base.connection.execute(@sql)
    redirect_to users_path
  end

  

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
