class UsersController < ApplicationController
  #include Devise::Controllers::SignIn
  def index
  end

  def login
    facebook_object = get_facebook_user_credentials(request.env['omniauth.auth']['credentials'])
    user = User.where(fb_id: facebook_object.name).first_or_create
    user.update_based_on_facebook_params(facebook_object)
    sign_in(user)
  end


  def create_account
  end

  def create_list(name)
    name= 'name here'
    user = current_user
    user.new_list(item)
  end

  private

  def get_facebook_user_credentials(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture,email")
  end

end
