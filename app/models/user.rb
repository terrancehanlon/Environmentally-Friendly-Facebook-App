class User < ApplicationRecord

  def update_based_on_facebook_params(facebook_object)
    self.email = facebook_object.email
    self.first_name = facebook_object.first_name
    self.save
  end

  def new_list(name)
    new_list = RecycleList.where(email: self.email, item: name).first_or_create
  end

  def retrieve_list
    list = RecycleList.where(email: self.email)
  end

end
