class UsersController < ApplicationController
  #include Devise::Controllers::SignIn
  def index
  end

  def login
    facebook_object = User.koala(request.env['omniauth.auth']['credentials'])
    user = User.where(fb_id: facebook_object['id']).first_or_create
    user.update_based_on_facebook_params(facebook_object)
    sign_in(user)
  end


  def create_account
  end

  def create_list
     RecycleList.create(user_fb_id: current_user.fb_id)
     @list = RecycleList.where(user_fb_id: current_user.fb_id)
  end

  def show_list
    #render RecycleList.where(user_fb_id: current_user.fb_id)
  end

  private

  # def get_facebook_user_credentials(auth)
  #   access_token = auth['token']
  #   facebook = Koala::Facebook::API.new(access_token)
  #   facebook.get_object("me?fields=name,picture,email")
  # end

end
