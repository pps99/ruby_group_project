class UserDetailRepository
  class << self
    def getAllUser_Deails
      @user_details = UserDetail.all
    end

    def createUserDetail(user_detail)
      @is_user_detail_create = user_detail.save
    end

    # mtzl
    #def getOrderByID(user_detail.id)
    #  @order = UserDetail.find(user_detail.id)
    #end

    # mtzl

    def getUserDetailByID(id)
      @user_detail = UserDetail.find(id)
    end

    def getUserDetailsByID(id)
      @user_details = UserDetail.where("user_details.id",1)
    end

    def updateUserDetail(user_detail, user_detail_params)
      @is_user_detail_update = user_detail.update(user_detail_params)
    end

    def destroy(user_detail)
      @is_user_detail_destroy = user_detail.destroy
    end
  end
end
