module HitchHikely
  module MapsApiHelper


    def google_image_url_for(story_hash)
      # should return a url string
      map_link = "https://www.google.com/maps/embed/v1/directions ?key=#{ENV['GOOGLE_API_KEY']}&origin=#{@city_start}+#{@state_start}&destination=#{@city_end}+#{@state_end}&mode=driving.json"
      response = HTTParty.get(map_link)


    end

```
<img src="https://www.google.com/maps/embed/v1/directions ?key=<%=#{ENV['GOOGLE_API_KEY']}%>&origin=<%= @city_start %>+<%= @state_start %>&destination=<%= @city_end %>+<%= @state_end %>&mode=driving"/>
```





  end
end
