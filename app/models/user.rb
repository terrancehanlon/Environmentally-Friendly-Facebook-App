class User < ApplicationRecord

  def update_based_on_facebook_params(facebook_object)
    self.fb_id = facebook_object.id
    self.first_name = facebook_object.first_name
    self.save
  end

  def new_list(name)
    new_list = RecycleList.where(email: self.fb_id, name: name).first_or_create
  end

  def retrieve_list
    list = RecycleList.where(user_fb_id: self.fb_id)
  end

end
