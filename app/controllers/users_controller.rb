class UsersController < ApplicationController
  #include Devise::Controllers::SignIn
  def index
  end

  def login
    facebook_object = User.koala(request.env['omniauth.auth']['credentials'])
    #if User.exists?(fb_id: facebook_object['id'])
      user = User.new(fb_id: facebook_object['id'])
      user.save
      user.update_based_on_facebook_params(facebook_object)
      sign_in(user)
    # else
    #   user = User.new(fb_id: facebook_object['id'], name: facebook_object['name'])
    #   user.save
    #   sign_in(user)
  end



  def create_account
  end

  def create_list
    @list = RecycleList.create(user_fb_id: current_user.fb_id)
     #user.has_list = true
   end


  def show_list
    #render RecycleList.where(user_fb_id: current_user.fb_id)
  end

  def dashboard
  end
end
