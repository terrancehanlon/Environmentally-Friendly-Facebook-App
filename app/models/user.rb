class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def update_based_on_facebook_params(facebook_object)
    self.fb_id = facebook_object['id']
    self.name = facebook_object['first_name']
    self.save
  end

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture,email")
  end

  def new_list(name)
    new_list = RecycleList.where(email: self.fb_id, name: name).first_or_create
  end

  def retrieve_list
    list = RecycleList.where(user_fb_id: self.fb_id)
  end

  def password_required?
  super if confirmed?
  end

end
