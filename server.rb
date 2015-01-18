module HitchHikely
  class Server < Sinatra::Base

    # helpers comes from Sinatra
    # it's a method, it takes HitchHikely as an argument
    helpers(HitchHikely::DatabaseHelper)
    helpers(HitchHikely::MapsApiHelper)

    enable :logging

    configure :development do
      register Sinatra::Reloader
      $redis = Redis.new
    end

    configure :production do
      $redis = Redis.new({url: ENV['_URL']})
    end

    get('/') do
      redirect to('/stories')
    end

    # list all stories
    get('/stories') do
      # assigns @stories to an array of all the story hashes
      #
      @stories = stories
      puts @stories
      render(:erb, :index, :layout => :default)
    end

    # show the story form
    get('/stories/new') do
      render(:erb, :new, :layout => :default)
    end

    # creates the new story
    post('/stories')  do
      id = create_story(
        params["title"],
        params["author"],
        params["email"],
        params["date_started"],
        params["city_start"],
        params["state_start"],
        params["date_ended"],
        params["city_end"],
        params["state_end"],
        params["text"],
        params["tags"],
        )
      # save(params) # save is from hitchhikely::databasehelper
      redirect to('/stories')
    end

    # show me a specific story
    get('/stories/:id') do
      # TODO talk to db
      puts params
      @story = story(params[:id])
      render(:erb, :show, :layout => :default)
    end

    get ('/tags') do
    end


  end
end
