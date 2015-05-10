module UserHelper
  def get_tweets
    TweetRequest.where("zipcode = ? and request in (?)",current_user.zipcode,current_user.services.collect(&:name))
  end
end
