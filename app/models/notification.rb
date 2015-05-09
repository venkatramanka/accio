class Notification < ActiveRecord::Base
  attr_accessible :requestor_message, :requestor_name, :requestor_phone, :service_id, :user_id, :group_id

  belongs_to :user
  belongs_to :service

  validates_presence_of :requestor_message, :requestor_name, :requestor_phone, :service_id, :user_id

end
