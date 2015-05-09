class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
  	session["resource_return_to"] = "/user/#{resource.id}"
  end
end
