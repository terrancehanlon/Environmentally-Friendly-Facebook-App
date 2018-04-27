class UsersController < ApplicationController
  def index
  end

  def login
    @user = User.koala(request.env['omniauth.auth']['credentials'])

    #if User.where(:name => user['name']).find_each do |user|
      @user= User.new(name: @user['name'], email: 'myEmail@emailFroMIF.com')
      puts 'in if'
    #end

    #else
      User.create(name: @user['name'], email: 'myEmail@email.com')
    #end
  end


  def create_account
  end



end
