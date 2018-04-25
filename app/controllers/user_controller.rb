class UserController < ApplicationController

def index
end

def login
  #NOT USED????
  @user = User.koala(request.env['omniauth.auth']['credentials'])
end

end
