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

end
