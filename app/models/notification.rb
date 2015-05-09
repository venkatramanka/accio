class Notification < ActiveRecord::Base
  attr_accessible :requestor_message, :requestor_name, :requestor_phone, :service_id, :user_id

  belongs_to :user
  belongs_to :service
end
