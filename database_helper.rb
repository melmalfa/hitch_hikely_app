require 'redis'

module HitchHikely
  module DatabaseHelper

    $redis = Redis.new

    def last_story_id
      $redis.get("story_id")
    end

    def story_ids
      $redis.lrange("story_ids", 0, -1)
    end

    def story(id)
      $redis.hgetall("story:#{id}")
    end

    def stories
      story_ids.map {|id| story(id).merge({"id" => id})}
    end

    def create_story(author, email, date_started, city_start, state_start, date_ended, city_end, state_end, title, text, tags)
      id = $redis.incr("story_id")
      $redis.hmset(
        "story:#{id}",
        "author", author,
        "email", email,
        "date_started", date_started,
        "city_start", city_start,
        "state_start", state_start,
        "date_ended", date_ended,
        "city_end", city_end,
        "state_end", state_end,
        "title", title,
        "text", text,
        "tags", tags,
      )
      $redis.lpush("story_ids", id)
      id
    end

  end # DatabaseHelper
end # HitchHikely
