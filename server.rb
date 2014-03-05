require "rubygems"
require "instagram"
require 'pry'
# All methods require authentication (either by client ID or access token).
# To get your Instagram OAuth credentials, register an app at http://instagr.am/oauth/client/register/
Instagram.configure do |config|
  config.client_id = "a61abcdab1f14109a53dc10f7b30d9fa"
  # config.access_token = "9efd29cbde744f189bd25bda1b233fc0"
end

# Get a list of a user's most recent media
bieber =  Instagram.user_recent_media(6860189)

comments = []

#this gets a huge hash
bieber.each do |all|
  # if comments.include?()
  comments << { user_name: (all["comments"]["data"])
   }
end

#this refines hash
updated_comments = []
comments.each do |x, y|
  updated_comments << {
    user_name: x[:user_name][0]["from"]["username"],
    pic: x[:user_name][0]["from"]["profile_picture"],
    full_name: x[:user_name][0]["from"]["full_name"]
     }
end

#this gets unique user_name in comments

popular_commenters = [{
  name: "stuff",
  count: 0
  }]
counter = 0
updated_comments.each do |x|
  unless popular_commenters[counter][:name].include?(x[:user_name])
    popular_commenters << {  x[:user_name] => { count: 1 }}
  else
     popular_commenters[x[:user_name]][:count] += 1
  end
  counter += 1
  binding.pry
end

binding.pry
