class Provider < User
  # Methods, variables and constants
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :phone, format: { with: /\d{10}/, message: " - Invalid Format" }
  validates :mobile, format: { with: /\d{10}/, message: " - Invalid Format" }
end