class HomeController < ApplicationController
  def index
  	@services = Service.all
  end


def get_users
  service=Service.find_by_id(params[:service_id])
  users = service.users.active
  @hash = Gmaps4rails.build_markers(users) do |user, marker|
    marker.lat user.latitude
    marker.lng user.longitude
    marker.infowindow "<div class='infobox_details'><IMG BORDER='0' ALIGN='Left' SRC='https://www.google.co.in/logos/doodles/2015/nellie-blys-151st-birthday-4862371034038272-res.png' style='height:80px;width:80px'><b>#{user.name}</b><br/>#{user.phone}<br/>#{user.mobile}<br/><a href='#' onclick='showMore(#{user.id})'>Show More...</a></div>"
  end
  render :json => @hash.to_json
 end

  def user_data
    user = User.find(params[:user_id])
    render :text => user.details
  end

  def request_callback
    Notification.create!({
      user_id: params[:user_id],
      service_id: params[:service_id],
      requestor_name: params[:requestor_name],
      requestor_phone: params[:requestor_phone],
      requestor_message: params[:requestor_message]
      })
    render :text => "True"
  end

  def help_me
    lat = params[:lat]
    lng=params[:lng]
    User.active.where("latitude between '#{lat.to_f-0.5}' and '#{lat.to_f+0.5}' and longitude between '#{lng.to_f-0.5}' and '#{lng.to_f+0.5}'"  )
  end

end
