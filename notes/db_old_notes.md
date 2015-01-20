old notes for learning db:


    # it's story ids just by convention because it's a collection of IDs
    def story_ids
      # returns a list of numbers
      $redis.lrange("story_ids", 0, -1)
    end

    # it's story here because it's the information about single story
    def story(id)
      # returns a hash of story details based on id
      $redis.hgetall("story:#{id}")
    end

    def save(story_hash)
      id = $redis.incr("story_id")
      $redis.lpush("story_ids", id)
      $redis.hset("story:#{id}", :author, story_hash[:author])
      $redis.hset("story:#{id}", :email, story_hash[:email])
      $redis.hset("story:#{id}", :date_started, story_hash[:date_started])
      $redis.hset("story:#{id}", :city_start, story_hash[:city_start])
      $redis.hset("story:#{id}", :state_start, story_hash[:state_start])
      $redis.hset("story:#{id}", :date_ended, story_hash[:date_ended])
      $redis.hset("story:#{id}", :city_end, story_hash[:city_end])
      $redis.hset("story:#{id}", :state_end, story_hash[:state_end])
      $redis.hset("story:#{id}", :title, story_hash[:title])
      $redis.hset("story:#{id}", :text, story_hash[:text])
      $redis.hset("story:#{id}", :tags, story_hash[:tags])
    end

    def all
      # returns an array of story hashes
      # get all the story ids
      story_ids.map do |id|
        story(id)
      end
      # then get the story hash for each story
    end
    # i don't know why this is story instead of stories






