class UsersController < ApplicationController

  #include Devise::Controllers::SignIn
  def index
  end

  def login
    facebook_object = User.koala(request.env['omniauth.auth']['credentials'])
    @user = User.where(fb_id: facebook_object['id']).first_or_create
    @user.update_based_on_facebook_params(facebook_object)
    sign_in(@user)
  end

  end



  def create_account
  end

  def create_list
    list = RecycleList.new(user_fb_id: current_user.fb_id)
    list.save
     #user.has_list = true
   end


  def show_list
    #render RecycleList.where(user_fb_id: current_user.fb_id)
  end

  def dashboard

  end
end
