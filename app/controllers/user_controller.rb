class UserController < ApplicationController
  layout 'provider'
  def show
    @user = User.find_by_id(params[:id])
  end

  def notifications
  end

  def update
    begin
      if user = User.find_by_id(params[:id])
        user.update_attributes params[:provider].except("service_ids")
        user.services = Service.find_all_by_id(params[:provider]["service_ids"])
        user.save!
        flash[:success] = "Updated Successfully"
      end
    rescue Exception => e
      flash[:error] = e.message
    end
    redirect_to user_path
  end

  def services
    @services ||= Service.all
  end

  helper_method :services
end
