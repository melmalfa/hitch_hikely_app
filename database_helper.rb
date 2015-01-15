# is this always the place we put all our methods?
#why do we require redis and have a new object?
# why is it called database helper?


module HitchHikely
  module DatabaseHelper



  $redis = Redis.new

  def story_ids
    $redis.lrange("story_ids", 0, -1)
  end

  def story(id)
    $redis.hgetall("story:#{id}")
  end
  # i don't know why this is story instead of stories


  @city_start = city_start.gsub(" ", "+")
  @city_end = city_end.gsub(" ", "+")
  @state_start = state_start.gsub(" ", "+")
  @state_end = state_end.gsub(" ", "+")



end
