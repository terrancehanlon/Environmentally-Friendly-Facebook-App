class UsersController < ApplicationController
  def index
  end

  def login
    @user = User.koala(request.env['omniauth.auth']['credentials'])
    @recycle_list  = RecycleList.where("user_fb_id = Terrance")
  end


  def create_account
  end



end
