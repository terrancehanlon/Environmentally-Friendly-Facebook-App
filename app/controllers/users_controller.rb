class UsersController < ApplicationController

  #include Devise::Controllers::SignIn
  def index
  end

  def login
    facebook_object = User.koala(request.env['omniauth.auth']['credentials'])
      if User.exists?(name: facebook_object['id'])
        user = User.where(fb_id: facebook_object['id'], name: facebook_object['name'])
        sign_in(user)
      else
      user = User.where(fb_id: facebook_object['id'], name: facebook_object['name'], email: 'bogus@bogdus.com', password: 'securePassword123').first_or_create
      sign_in(user)
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
