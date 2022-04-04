class UserRepository
  class << self
    def getAllUsers
      @users = User.all
    end

    def createUser(user)
      @is_user_create = user.save
    end

    def getUserByID(id)
      @user = User.find(id)
    end

    def updateUser(user, user_params)
      @is_user_update = user.update(user_params)
    end

    def destroy(user)
      @is_user_destroy = user.destroy
    end
  end
end
