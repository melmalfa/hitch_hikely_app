# require 'redis'
# require 'sinatra/reloader'
# require 'google/api_client'

# module HitchHikely
#   module MapsApiHelper

#     $redis = Redis.new


#     def google_image_url
#         used to be story_hash
#          used to be google_image_url_for(stories)
#       should return a url string
#         @stories.each do |story|
#         city_start = story["city_start"].gsub(" ", "+")
#         city_end = story["city_end"].gsub(" ", "+")
#         state_start = story["state_start"].gsub(" ", "+")
#         state_end = story["state_end"].gsub(" ", "+")
#         end
#       map_link = "https://www.google.com/maps/embed/v1/directions ?key=#{ENV['GOOGLE_API_KEY']}&origin=#{city_start}+#{state_start}&destination=#{city_end}+#{state_end}&mode=driving"
#     end

#   end
# end


      <!-- <img class="map" src="<%= google_image_url %>" > -->
