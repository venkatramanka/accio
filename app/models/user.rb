class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :type
  attr_accessible :active, :address1, :address2, :city, :latitude, :longitude, :mobile, :name, :phone, :state, :verified, :zipcode
  has_many :user_services
  has_many :services, :through => :user_services

  rails_admin do
    list do
      field :name
      field :active
      field :verified
      field :email
    end
    edit do
      field :name
      field :email
      field :active
      field :verified
    end
  end
end
