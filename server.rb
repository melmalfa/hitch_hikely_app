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
      @stories = all # all is from HitchHikely::DatabaseHelper
      render(:erb, :index, :layout => :default)
    end

    # show the story form
    get('/stories/new') do
      render(:erb, :new, :layout => :default)
      redirect to ('/stories/:id')
    end

    # creates the new story
    post('/stories')  do
      save(params) # save is from hitchhikely::databasehelper
      redirect to('/stories')
    end

    # show me a specific story
    get('/stories/:id') do
      # TODO talk to db
      render(:erb, :show, :layout => :default)
    end

    get ('/tags') do
    end


  end
end
