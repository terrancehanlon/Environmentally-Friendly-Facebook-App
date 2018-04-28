class User < ApplicationRecord

  def self.koala(auth)
      access_token = auth['token']
      facebook = Koala::Facebook::API.new(access_token)
      facebook.get_object("me?fields=name,picture")
 end

 def new
   new_user = User.create(name: @user['name'], email: 'email@email.net')
 end

 def new_list
   @recycle_list = RecycleList.create(user_fb_id: @user['name'], item: 'item here')
 end
end
