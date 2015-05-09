class UserService < ActiveRecord::Base
  attr_accessible :service_id, :user_id
  belongs_to :services
  belongs_to :users
end
