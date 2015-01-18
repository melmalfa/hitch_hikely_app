 :author, :email, :date_started, :city_start, :state_start, :date_ended, :city_end, :state_end, :title, :text, :tags




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








How do I filter searches of the content?
Tags
State/country drop down
How to edit
How to delete


author: GET /mumbles?filter=true&author=kristin.eugenio@ga.co
date: GET /mumbles?filter=true&date=2015-12-24
both: GET /mumbles?filter=true&author=eugenius&date=2015-12-2





Tagging

As a user of Mumbler, I would like to be able to see a list of all the used tags, and then go to a list of mumbles with those tags.

This is a BIG one!

First of all, our data structure makes it difficult to do this simply. We should change it! Since we want a list of tags, that means we should treat tags as a new resource. The correct route to access these would be GET /tags.

We will be creating tags when we create mumbles, so we should add to our mumble creation logic something that creates a list of tags in our database. Since we don't want to have more than one entry for any given tag, it would make sense to use a Redis set.

Finally, we should add another filter for our mumble index like above:

GET /mumbles?filter=true&tag=blessed
From a user experience / design perspective, it would make sense to be able to link to the tag index from any page, and also to filter tags directly by clicking on the tags in our mumbles. This is another complex task!
