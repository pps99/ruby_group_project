class UserDetailService
  class << self
    def getAllUser_Deails
      @user_details = UserDetailRepository.getAllUsers
    end

    def createUserDetail(user_detail)
      @is_user_create = UserDetailRepository.createUserDetail(user_detail)
    end

    

    def getOrderByID(id)
      @order = UserDetailRepository.getOrderByID(id)
    end

    def getUserDetailByID(id)
      @user_detail = UserDetailRepository.getUserDetailByID(id)
    end

    def getUserDetailsByID(id)
      @user_details = UserDetailRepository.getUserDetailsByID(id)
    end

    def updateUserDetail(user_detail, user_detail_params)
      @is_user_detail_update = UserDetailRepository.updateUserDetail(user_detail, user_detail_params)
    end

    def destroy(user_detail)
      @is_user_detail_destroy = UserDetailRepository.destroy(user_detail)
    end
  end
end